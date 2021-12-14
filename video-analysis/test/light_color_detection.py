import json
import cv2
import src.common as common
import numpy as np

if __name__ == '__main__':
    WIDTH = 720
    HEIGHT = 560
    scan_x = float(WIDTH) / float(1920)
    scan_y = float(HEIGHT) / float(1080)
    jsonPath = r"C:/Users/Y/Desktop/project/detection/crossings/S001.json"
    jsonfile = open(jsonPath, 'r')
    data = json.load(jsonfile)
    for i in data:
        key, = i
        if key == "yellow_line1":
            x1_yellow1 = list(i.values())[0][0]['x'] * scan_x
            y1_yellow1 = list(i.values())[0][0]['y'] * scan_y
            x1_yellow2 = list(i.values())[0][1]['x'] * scan_x
            y1_yellow2 = list(i.values())[0][1]['y'] * scan_y
        if key == "white_line1":
            x1_white1 = list(i.values())[0][0]['x'] * scan_x
            y1_white1 = list(i.values())[0][0]['y'] * scan_y
            x1_white2 = list(i.values())[0][1]['x'] * scan_x
            y1_white2 = list(i.values())[0][1]['y'] * scan_y
        if key == "yellow_line2":
            x2_yellow1 = list(i.values())[0][0]['x'] * scan_x
            y2_yellow1 = list(i.values())[0][0]['y'] * scan_y
            x2_yellow2 = list(i.values())[0][1]['x'] * scan_x
            y2_yellow2 = list(i.values())[0][1]['y'] * scan_y
        if key == "yellow_line2":
            x2_yellow1 = list(i.values())[0][0]['x'] * scan_x
            y2_yellow1 = list(i.values())[0][0]['y'] * scan_y
            x2_yellow2 = list(i.values())[0][1]['x'] * scan_x
            y2_yellow2 = list(i.values())[0][1]['y'] * scan_y
        if key == "light2":
            x2_light1  = list(i.values())[0][0]['x'] * scan_x
            y2_light1 = list(i.values())[0][0]['y'] * scan_y
            x2_light2 = list(i.values())[0][1]['x'] * scan_x
            y2_light2 = list(i.values())[0][1]['y'] * scan_y
        if key == "light1":
            x1_light1  = list(i.values())[0][0]['x'] * scan_x
            y1_light1 = list(i.values())[0][0]['y'] * scan_y
            x1_light2 = list(i.values())[0][1]['x'] * scan_x
            y1_light2 = list(i.values())[0][1]['y'] * scan_y
        if key == "light3":
            x3_light1  = list(i.values())[0][0]['x'] * scan_x
            y3_light1 = list(i.values())[0][0]['y'] * scan_y
            x3_light2 = list(i.values())[0][1]['x'] * scan_x
            y3_light2 = list(i.values())[0][1]['y'] * scan_y
    picPath = "C:\\Users\\Y\\Desktop\\project\\detection\\frame\\S001-S002-1.png"
    img = cv2.imread(picPath)
    img = cv2.resize(img, (WIDTH, HEIGHT))
    #cv2.line(img, (int(x1_white1), int(y1_white1)), (int(x1_white2), int(y1_white2)), (0, 0, 255), 2)
    #cv2.line(img, (int(x1_yellow1), int(y1_yellow1)), (int(x1_yellow2), int(y1_yellow2)), (0, 0, 255), 2)
    #cv2.line(img, (int(x2_yellow1), int(y2_yellow1)), (int(x2_yellow2), int(y2_yellow2)), (0, 0, 255), 2)

    #cv2.line(img, (int(x1_light1), int(y1_light1)), (int(x1_light2), int(y1_light2)), (0, 0, 255), 2)
    # cv2.line(img, (int(x2_light1), int(y2_light1)), (int(x2_light2), int(y2_light2)), (0, 0, 255), 2)
    # cv2.line(img, (int(x3_light1), int(y3_light1)), (int(x3_light2), int(y3_light2)), (0, 0, 255), 2)
    # cv2.imshow("img", img)
    # cv2.waitKey()

    light_image = img[int(y2_light2):int(y2_light1),int(x2_light1):int(x2_light2)]
    #light_image = img[int(y1_light2):int(y1_light1), int(x1_light1):int(x1_light2)]
    #light_image = img[int(y3_light2):int(y3_light1), int(x3_light1):int(x3_light2)]
    cv2.imshow("light_image", light_image)
    cv2.waitKey()
    res, mapping = np.array([0, 0, 0]), {0: '红', 1: '黄', 2: '绿'}
    res=common.red_green_yellow(light_image, True)
    light_chinese = mapping[np.argmax(res)]
    print("<<检测到当前为[%s]灯>>" % light_chinese)