import cv2
import os.path
import numpy as np
import dlib
# import time
# import threading
# import math
# import pymysql
# import sys
# import json
import src.crossing as crossing
import src.common as common

image_count = 1  # 图片计数
frame_count = 1  # 帧数计数

video_path = "C:\\Users\\Y\\Desktop\\project\\detection\\video\\crossing1-3.mp4"  # 视频路径
# video_path = "../video/1.mp4"
classifier_path = "C:\\Users\\Y\\Desktop\\project\\detection\\classifier\\myhaar.xml"  # 分类器路径
# classifier_path="../classifier/cars_detection.xml"

carCascade = cv2.CascadeClassifier(classifier_path)

# 标点时的点击计数
leftDown_count = 0

# carWidth用于测算比例尺
WIDTH = 720
HEIGHT = 560


# 使用第一张图片作为标记白实线和双黄线的样例
# video = cv2.VideoCapture('video_path')
# rc, imageToMark = video.read()
# imageToMark = cv2.resize(imageToMark, (WIDTH, HEIGHT))


def trackMultipleObjects(video, crossing):
    rectangleColor = (0, 255, 0)
    rectangleColor_retrograde = (0, 0, 255)
    rectangleColor_stop = (0, 0, 0)
    rectangleColor_overspeed = (255, 0, 0)
    frameCounter = 0
    currentCarID = 0
    fps = 0

    carcounter = 0  # 为统计车流量而设置的变量
    speed = 0

    #  TODO 违章记录统计，相同车辆相同违章行为不重复计算
    carTracker = {}
    carNumbers = {}
    carLocation1 = {}
    carLocation2 = {}

    while True:
        carcounter = 0
        rc, image = video.read()
        if type(image) == type(None):
            break

        image = cv2.resize(image, (WIDTH, HEIGHT))
        resultImage = image.copy()

        frameCounter = frameCounter + 1

        carIDtoDelete = []
        for carID in carTracker.keys():
            trackingQuality = carTracker[carID].update(image)

            if trackingQuality < 7:
                carIDtoDelete.append(carID)
                carcounter += 1

        for carID in carIDtoDelete:
            print('Removing carID ' + str(carID) + ' from list of trackers.')
            print('Removing carID ' + str(carID) + ' previous location.')
            print('Removing carID ' + str(carID) + ' current location.')
            carTracker.pop(carID, None)
            carLocation1.pop(carID, None)
            carLocation2.pop(carID, None)

        # TODO 违章记录截图
        # TODO 此处加入车牌识别
        if not (frameCounter % 3):
            gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
            cars = carCascade.detectMultiScale(gray, 1.1, 13, 0, (24, 24))

            for (_x, _y, _w, _h) in cars:
                x = int(_x)
                y = int(_y)
                w = int(_w)
                h = int(_h)

                x_bar = x + 0.5 * w
                y_bar = y + 0.5 * h

                matchCarID = None

                for carID in carTracker.keys():
                    trackedPosition = carTracker[carID].get_position()

                    t_x = int(trackedPosition.left())
                    t_y = int(trackedPosition.top())
                    t_w = int(trackedPosition.width())
                    t_h = int(trackedPosition.height())

                    t_x_bar = t_x + 0.5 * t_w
                    t_y_bar = t_y + 0.5 * t_h

                    if ((t_x <= x_bar <= (t_x + t_w)) and (t_y <= y_bar <= (t_y + t_h)) and (
                            x <= t_x_bar <= (x + w)) and (y <= t_y_bar <= (y + h))):
                        matchCarID = carID

                if matchCarID is None:
                    print('Creating new tracker ' + str(currentCarID))

                    tracker = dlib.correlation_tracker()
                    tracker.start_track(image, dlib.rectangle(x, y, x + w, y + h))

                    carTracker[currentCarID] = tracker
                    carLocation1[currentCarID] = [x, y, w, h]
                    currentCarID = currentCarID + 1

        for carID in carTracker.keys():
            trackedPosition = carTracker[carID].get_position()

            t_x = int(trackedPosition.left())
            t_y = int(trackedPosition.top())
            t_w = int(trackedPosition.width())
            t_h = int(trackedPosition.height())

            cv2.rectangle(resultImage, (t_x, t_y), (t_x + t_w, t_y + t_h), rectangleColor, 2)
            cv2.putText(resultImage, 'CAR_%s' % carID, (t_x, t_y), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (70, 70, 200), 2)

            # speed estimation
            carLocation2[carID] = [t_x, t_y, t_w, t_h]

        # 获取帧率
        fps = video.get(cv2.CAP_PROP_FPS)

        # 输出车流量
        # TODO 车流量算法有错
        cv2.putText(resultImage, 'traffic flow:' + str(int(len(offenseRecord)/(3/fps))) + '/min', (450, 30),
                    cv2.FONT_HERSHEY_SIMPLEX, 0.75, (0, 0, 255), 2)
        print(currentCarID)
        print(fps)
        print(frameCounter)
        for i in carLocation1.keys():
            trackedPosition = carTracker[i].get_position()
            t_x = int(trackedPosition.left())
            t_y = int(trackedPosition.top())

            if frameCounter % 3 == 0:
                speed = 0
                [x1, y1, w1, h1] = carLocation1[i]
                [x2, y2, w2, h2] = carLocation2[i]

                # 逆行检测
                # TODO 逆行检测算法有错
                if y2 - y1 >= 2:
                    cv2.rectangle(resultImage, (x2, y2), (x2 + w2, y2 + h2), rectangleColor_retrograde, 2)

                # 测速过程
                carLocation1[i] = [x2, y2, w2, h2]
                if [x1, y1, w1, h1] != [x2, y2, w2, h2]:
                    speed = common.estimateSpeed([x1, y1, w1, h1], [x2, y2, w2, h2], 100, fps)
                    if speed <= 1.05:
                        speed = 0
                    else:
                        speed *= 5
                    if speed > 60:
                        # print(str(i) + "号车超速")
                        cv2.rectangle(resultImage, (x2, y2), (x2 + w2, y2 + h2), rectangleColor_overspeed, 2)
                    if speed == 0:
                        pass
                        # 违规停车检测
                        # TODO 违章停车计算不准确
                        # print(str(i) + "号车违规停车")
                        # if crossing.isInArea(x2, y2, w2, h2):
                        # cv2.rectangle(resultImage, (x2, y2), (x2 + w2, y2 + h2), rectangleColor_stop, 2)
                    # print('CarID ' + str(i) + ' speed is ' + str("%.2f" % round(speed, 2)) + ' km/h.\n')

                cv2.putText(resultImage, 'speed:%s' % str("%.2f" % round(speed, 2)) + 'Km/h', (t_x, t_y + 15),
                            cv2.FONT_HERSHEY_SIMPLEX, 0.5, (70, 70, 200), 2)

                # TODO 检测白实线
                # TODO 检测双黄线改:在哪一条车道，根据点来判断，限制到线段
                # TODO 转弯车辆处理（x分量变化大于y分量变化）

                # 压双黄线检测
                if common.onLines(crossing, [x2, y2, x2 + w2, y2 + h2]):
                    print('CarID ' + str(i) + '车辆压双黄线')
                    print("-->Bounding Box坐标为:", [x2, y2, x2 + w2, y2 + h2])

                # TODO 检测闯红灯
        if frameCounter % 3 == 0:
            cv2.imshow('result', resultImage)

        if cv2.waitKey(33) == 27:
            break

    cv2.destroyAllWindows()


if __name__ == '__main__':
    # print(sys.argv[1])
    video = cv2.VideoCapture(video_path)
    scan_x = float(WIDTH) / float(1536)
    scan_y = float(HEIGHT) / float(480)
    temp_crossing = crossing.crossing()
    trackMultipleObjects(video, temp_crossing)
