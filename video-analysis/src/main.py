import cv2
import os.path
import numpy as np
import dlib
import time
import threading
import math
import pymysql
import sys
import json
from hyperlpr import *


import crossing
import common
import DbRelated




image_count = 1  # 图片计数
frame_count = 1  # 帧数计2

id_counter = 0

video_path_dir = "C:\\Users\\Y\\Desktop\\project\\detection\\video\\"  # 视频路径
# video_path = "../video/S002-1.mp4"
classifier_path = "C:\\Users\\Y\\Desktop\\project\\detection\\classifier\\myhaar.xml"  # 分类器路径
# classifier_path="../classifier/cars_detection.xml"

carCascade = cv2.CascadeClassifier(classifier_path)
info2store = {}
offense = {0: "Speeding", 1: "Parking", 2: "Retrograde", 3: "PressYellowLine", 4: "Light"}
# 标点时的点击计数
leftDown_count = 0

# carWidth用于测算比例尺
WIDTH = 720
HEIGHT = 560
scan_x = float(WIDTH) / float(1920)
scan_y = float(HEIGHT) / float(1080)


# 使用第一张图片作为标记白实线和双黄线的样例
# video = cv2.VideoCapture('video_path')
# rc, imageToMark = video.read()
# imageToMark = cv2.resize(imageToMark, (WIDTH, HEIGHT))


def trackMultipleObjects(video, crossing):
    global info2store
    rectangleColor = (0, 255, 0)
    rectangleColor_retrograde = (0, 0, 255)
    rectangleColor_stop = (255, 0, 0)
    rectangleColor_overspeed = (255, 0, 0)
    rectangleColor_onlines = (0, 0, 255)
    rectangleColor_redlight = (255, 0, 0)
    frameCounter = 0
    currentCarID = 0
    fps = 0

    carTracker = {}
    carNumbers = {}
    offenseRecord = {}
    stop = {}
    retrograde = {}
    carLocation1 = {}
    carLocation2 = {}

    while True:
        carcounter = 0
        rc, image = video.read()
        if type(image) == type(None):
            break
        backups = image.copy()
        image = cv2.resize(image, (WIDTH, HEIGHT))
        frameCounter = frameCounter + 1
        if frameCounter == 1:
            resultImage = image.copy()
        if frameCounter % 3 == 0:
            resultImage = image.copy()
        carIDtoDelete = []
        for carID in carTracker.keys():
            trackingQuality = carTracker[carID].update(image)
            if trackingQuality < 7 or carTracker[carID].get_position().width() > 150 or carTracker[
                carID].get_position().height() > 150:
                carIDtoDelete.append(carID)
                carcounter += 1

        for carID in carIDtoDelete:
            print('Removing carID ' + str(carID) + ' from list of trackers.')
            print('Removing carID ' + str(carID) + ' previous location.')
            print('Removing carID ' + str(carID) + ' current location.')
            carTracker.pop(carID, None)
            offenseRecord.pop(carID)
            stop.pop(carID)
            retrograde.pop(carID)
            carLocation1.pop(carID, None)
            carLocation2.pop(carID, None)

        if not frameCounter % 3:
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
                    if common.whichSection(crossing, [x, y, w, h]) == 1 and w < 100:
                        pass
                    else:
                        print('Creating new tracker ' + str(currentCarID))
                        offenseRecord[currentCarID] = []
                        stop[currentCarID] = 0
                        retrograde[currentCarID] = 0

                        tracker = dlib.correlation_tracker()
                        tracker.start_track(image, dlib.rectangle(x, y, x + w, y + h))

                        carTracker[currentCarID] = tracker
                        carLocation1[currentCarID] = [x, y, w, h]
                        currentCarID = currentCarID + 1
        if frameCounter % 3 == 0:
            license_res = HyperLPR_plate_recognition(backups)
            for carID in carTracker.keys():
                trackedPosition = carTracker[carID].get_position()

                t_x = int(trackedPosition.left())
                t_y = int(trackedPosition.top())
                t_w = int(trackedPosition.width())
                t_h = int(trackedPosition.height())

                cv2.rectangle(resultImage, (t_x, t_y), (t_x + t_w, t_y + t_h), rectangleColor, 2)
                cv2.putText(resultImage, 'CAR_%s' % carID, (t_x, t_y), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (70, 70, 200), 2)

                carLocation2[carID] = [t_x, t_y, t_w, t_h]

            # 获取帧率
            fps = video.get(cv2.CAP_PROP_FPS)

            # 输出车流量
            cv2.putText(resultImage,
                        'traffic flow:' + str(int(len(offenseRecord) / (3 / fps))) + '/min', (450, 30),
                        cv2.FONT_HERSHEY_SIMPLEX, 0.75, (0, 0, 255), 2)
            for i in carLocation1.keys():
                trackedPosition = carTracker[i].get_position()
                t_x = int(trackedPosition.left())
                t_y = int(trackedPosition.top())

                if frameCounter % 3 == 0:
                    speed = 0
                    [x1, y1, w1, h1] = carLocation1[i]
                    [x2, y2, w2, h2] = carLocation2[i]

                    if i in info2store.keys() and "license" not in info2store[i].keys():
                        for index, item in enumerate(license_res):
                            if item[2][0] * scan_x > x2 and item[2][1] * scan_y > y2 and item[2][
                                2] * scan_x < x2 + w2 and item[2][
                                3] * scan_y < y2 + h2:
                                info2store[i]["license"] = item[0][:7]

                    # 逆行检测
                    if common.retrograde(crossing, carLocation1[i], carLocation2[i]):
                        if 2 in offenseRecord[i]:
                            cv2.rectangle(resultImage, (x2, y2), (x2 + w2, y2 + h2), rectangleColor_onlines, 2)
                        else:
                            if retrograde[i] >= 3:
                                offenseRecord[i].append(2)
                                save_image = image.copy()
                                cv2.rectangle(save_image, (x2, y2), (x2 + w2, y2 + h2), rectangleColor_onlines, 2)
                                time = frameCounter / fps
                                info2store[i] = {"record": 2, "image": save_image.copy(),"increment_time": time}
                                for index, item in enumerate(license_res):
                                    if item[2][0] * scan_x > x2 and item[2][1] * scan_y > y2 and item[2][
                                        2] * scan_x < x2 + w2 and item[2][
                                        3] * scan_y < y2 + h2:
                                        info2store[i]["license"] = item[0][:7]
                                print('CarID ' + str(i) + '车辆逆行')
                                print("-->Bounding Box坐标为:", [x2, y2, x2 + w2, y2 + h2])
                                cv2.rectangle(resultImage, (x2, y2), (x2 + w2, y2 + h2), rectangleColor_retrograde, 2)
                            else:
                                retrograde[i] += 1
                    else:
                        retrograde[i] = 0

                    # 测速过程
                    carLocation1[i] = [x2, y2, w2, h2]
                    speed = common.estimateSpeed([x1, y1, w1, h1], [x2, y2, w2, h2], fps)
                    speed *= 3.6
                    if speed > 60:
                        if 0 in offenseRecord[i]:
                            cv2.rectangle(resultImage, (x2, y2), (x2 + w2, y2 + h2), rectangleColor_overspeed, 2)
                        else:
                            offenseRecord[i].append(0)
                            save_image = image.copy()
                            cv2.rectangle(save_image, (x2, y2), (x2 + w2, y2 + h2), rectangleColor_onlines, 2)
                            time = frameCounter / fps
                            info2store[i] = {"record": 0, "image": save_image.copy(), "increment_time": time}
                            for index, item in enumerate(license_res):
                                if item[2][0] * scan_x > x2 and item[2][1] * scan_y > y2 and item[2][
                                    2] * scan_x < x2 + w2 and item[2][
                                    3] * scan_y < y2 + h2:
                                    info2store[i]["license"] = item[0][:7]
                            print('CarID ' + str(i) + '车辆超速')
                            print("-->Bounding Box坐标为:", [x2, y2, x2 + w2, y2 + h2])
                            cv2.rectangle(resultImage, (x2, y2), (x2 + w2, y2 + h2), rectangleColor_overspeed, 2)

                    # 违规停车检测
                    light_image = image[int(crossing.light[1]['y']):int(crossing.light[0]['y']),
                                  int(crossing.light[0]['x']):int(crossing.light[1]['x'])]
                    if speed == 0 and not (
                            common.red_green_yellow(light_image, False) == 1 and common.whichSection(crossing,
                                                                                                     [x2, y2, w2,
                                                                                                      h2]) == 1 and common.whichSide(
                        crossing.yellow1, x2 + w2, y2 + h2) == 1 and common.whichSide(crossing.yellow1, x2,
                                                                                      y2 + w2) == 1) and not \
                            crossing.yellow2[0]['y'] > y2:
                        stop[i] += 1
                        if stop[i] >= 5 and 1 not in offenseRecord[i]:
                            offenseRecord[i].append(1)
                            save_image = image.copy()
                            cv2.rectangle(save_image, (x2, y2), (x2 + w2, y2 + h2), rectangleColor_onlines, 2)
                            time = frameCounter / fps
                            info2store[i] = {"record": 1, "image": save_image.copy(), "increment_time": time}
                            for index, item in enumerate(license_res):
                                if item[2][0] * scan_x > x2 and item[2][1] * scan_y > y2 and item[2][
                                    2] * scan_x < x2 + w2 and item[2][
                                    3] * scan_y < y2 + h2:
                                    info2store[i]["license"] = item[0][:7]
                            print(str(i) + "号车违规停车")
                            print("-->Bounding Box坐标为:", [x2, y2, x2 + w2, y2 + h2])
                        if stop[i] >= 5:
                            cv2.rectangle(resultImage, (x2, y2), (x2 + w2, y2 + h2), rectangleColor_stop, 2)
                    else:
                        stop[i] = 0

                    cv2.putText(resultImage, 'speed:%s' % str("%.2f" % round(speed, 2)) + 'Km/h', (t_x, t_y + 15),
                                cv2.FONT_HERSHEY_SIMPLEX, 0.5, (70, 70, 200), 2)

                    # 压双黄线检测
                    if common.onLines(crossing, [x2, y2, w2, h2]):
                        if 3 in offenseRecord[i]:
                            if info2store[i]["timer"] <= 3:
                                save_image = image.copy()
                                cv2.rectangle(save_image, (x2, y2), (x2 + w2, y2 + h2), rectangleColor_retrograde, 2)
                                info2store[i]["image"] = save_image.copy()
                                info2store[i]["timer"] += 1
                        else:
                            offenseRecord[i].append(3)
                            save_image = image.copy()
                            cv2.rectangle(save_image, (x2, y2), (x2 + w2, y2 + h2), rectangleColor_onlines, 2)
                            time = frameCounter / fps
                            info2store[i] = {"record": 3, "image": save_image.copy(), "increment_time": time, "timer": 0}
                            for index, item in enumerate(license_res):
                                if item[2][0] * scan_x > x2 and item[2][1] * scan_y > y2 and item[2][
                                    2] * scan_x < x2 + w2 and item[2][
                                    3] * scan_y < y2 + h2:
                                    info2store[i]["license"] = item[0][:7]
                            print(str(i) + '号车辆压双黄线')
                            print("-->Bounding Box坐标为:", [x2, y2, x2 + w2, y2 + h2])
                        cv2.rectangle(resultImage, (x2, y2), (x2 + w2, y2 + h2), rectangleColor_onlines, 2)

                    # 闯红灯检测
                    if common.redLight(crossing, [x2, y2, w2, h2], light_image):
                        if 4 in offenseRecord[i]:
                            if info2store[i]["timer"] <= 3:
                                save_image = image.copy()
                                cv2.rectangle(save_image, (x2, y2), (x2 + w2, y2 + h2), rectangleColor_retrograde, 2)
                                info2store[i]["image"] = save_image.copy()

                                info2store[i]["timer"] += 1
                        else:
                            offenseRecord[i].append(4)
                            save_image = image.copy()
                            cv2.rectangle(save_image, (x2, y2), (x2 + w2, y2 + h2), rectangleColor_onlines, 2)
                            time = frameCounter / fps
                            info2store[i] = {"record": 4, "image": save_image.copy(), "increment_time": time, "timer": 0}
                            for index, item in enumerate(license_res):
                                if item[2][0] * scan_x > x2 and item[2][1] * scan_y > y2 and item[2][
                                    2] * scan_x < x2 + w2 and item[2][
                                    3] * scan_y < y2 + h2:
                                    info2store[i]["license"] = item[0][:7]
                            print('CarID ' + str(i) + '车辆闯红灯')
                            print("-->Bounding Box坐标为:", [x2, y2, x2 + w2, y2 + h2])
                        cv2.rectangle(resultImage, (x2, y2), (x2 + w2, y2 + h2), rectangleColor_redlight, 2)
            # cv2.imshow('result', resultImage)
        # out.write(resultImage)
        # if cv2.waitKey(33) == 27:
        # break
    cv2.destroyAllWindows()


if __name__ == '__main__':
    video_names = sorted(os.listdir(video_path_dir))
    # print(video_names)
    for video_name in video_names[2:3]:
        video_path = os.path.join(video_path_dir, video_name)
        print(video_path)
        info2store = {}
        info2store["video_path"] = video_path
        info2store["id_counter"] = id_counter

        # print(info2store["video_path"])
        video = cv2.VideoCapture(video_path)
        fourcc = cv2.VideoWriter_fourcc(*"mp4v")
        # out = cv2.VideoWriter("C:\\Users\\Y\\Desktop\\project\\detection\\result\\" + video_name.split(".")[0] + ".mp4",
        #                       fourcc, video.get(cv2.CAP_PROP_FPS),
        #                       (720, 560))
        temp_crossing = crossing.crossing(video_path.split("\\")[-1].split("_")[-1].split("-")[0])
        # info2store["video_path"]  = video_path
        trackMultipleObjects(video, temp_crossing)
        # print(info2store.keys())
        video.release()
        # out.release()
        address = video_name.split("-")[0]



        # 数据库相关部分

        id_counter = DbRelated.start_DB(info2store)



