import math
import cv2
import numpy as np
import matplotlib.pyplot as plt

carWidth = 1.8


def estimateSpeed(location1, location2, fps):
    d_pixels = math.sqrt(math.pow(location2[0] - location1[0], 2) + math.pow(location2[1] - location1[1], 2))
    ppm = location2[2] / carWidth
    d_meters = d_pixels / ppm
    speed = d_meters * fps/3
    bias = 2.5
    return speed * bias


def findNoneZero(rgb_image):
    rows, cols, _ = rgb_image.shape
    counter = 0
    for row in range(rows):
        for col in range(cols):
            pixels = rgb_image[row, col]
            if sum(pixels) != 0:
                counter = counter + 1
    return counter


def red_green_yellow(rgb_image, display):
    hsv = cv2.cvtColor(rgb_image, cv2.COLOR_RGB2HSV)
    avg_saturation = np.average(hsv[:, :, 1])  # Sum the brightness values

    sat_low = int(avg_saturation * 1.3)  # 均值的1.3倍，工程经验
    val_low = 140
    # Green
    lower_green = np.array([0, 0, 0])
    upper_green = np.array([85, 255, 255])
    green_mask = cv2.inRange(hsv, lower_green, upper_green)
    green_result = cv2.bitwise_and(rgb_image, rgb_image, mask=green_mask)

    # Red
    # lower_red = np.array([85, sat_low, val_low])
    lower_red = np.array([85, 0, 0])
    upper_red = np.array([170, 255, 255])
    red_mask = cv2.inRange(hsv, lower_red, upper_red)
    red_result = cv2.bitwise_and(rgb_image, rgb_image, mask=red_mask)
    if display == True:
        _, ax = plt.subplots(1, 4, figsize=(20, 10))
        ax[0].set_title('rgb image')
        ax[0].imshow(rgb_image)
        ax[1].set_title('red result')
        ax[1].imshow(red_result)
        ax[2].set_title('green result')
        ax[2].imshow(green_result)
        ax[3].set_title('hsv image')
        ax[3].imshow(hsv)
        plt.show()
    sum_green = findNoneZero(green_result)
    sum_red = findNoneZero(red_result)
    if sum_red >= sum_green:
        return 1  # Red
    return 0  # green


class point:  # 定义类
    def __init__(self, x, y):
        self.x = x
        self.y = y


def cross(p1, p2, p3):  # 跨立实验
    x1 = p2.x - p1.x
    y1 = p2.y - p1.y
    x2 = p3.x - p1.x
    y2 = p3.y - p1.y
    return x1 * y2 - x2 * y1


def whichSide(line, x, y):
    # 判断点（x,y)在直线的哪一边
    x1 = line[0]['x']
    x2 = line[1]['x']
    y1 = line[0]['y']
    y2 = line[1]['y']
    a = 1.0 * (y2 - y1) / (x2 - x1)
    b = -1 * x1 * a + y1
    if (y - a * x - b) <= 0:
        return -1  # 左 上
    else:
        return 1  # 右 下


def whichSection(crossing, car):
    if car[1] + car[3] >= crossing.yellow1[1]['y']:
        return 1  # 近端
    elif crossing.yellow2[0]['y'] < car[1] + car[3] < crossing.yellow1[1]['y']:
        return 0  # 中端
    else:
        return -1  # 远端


def onLines(crossing, car):
    isOnLines = False
    res = whichSection(crossing, car)
    if res == 1:
        if whichSide(crossing.yellow1, car[0] + car[2], car[1] + car[3]) == 1:  # 车在右车道，判断左下角的点
            if whichSide(crossing.yellow1, car[0], car[1] + car[3]) == -1:
                isOnLines = True
        elif whichSide(crossing.yellow1, car[0], car[1] + car[3]) == -1:  # 车在左车道，判断右下角的点
            if whichSide(crossing.yellow1, car[0] + car[2], car[1] + car[3]) == 1:
                isOnLines = True
        else:
            isOnLines = True
    elif res == -1:
        if whichSide(crossing.yellow2, car[0] + car[2], car[1] + car[3]) == 1:  # 车在右车道，判断左下角的点
            if whichSide(crossing.yellow2, car[0], car[1] + car[3]) == -1:
                isOnLines = True
        elif whichSide(crossing.yellow2, car[0], car[1] + car[3]) == -1:  # 车在左车道，判断右下角的点
            if whichSide(crossing.yellow2, car[0] + car[2], car[1] + car[3]) == 1:
                isOnLines = True
        else:
            isOnLines = False
    else:
        pass
    return isOnLines


def retrograde(crossing, pre_location, now_location):
    isRetrograde = False
    res = whichSection(crossing, now_location)
    if abs(now_location[1] - pre_location[1]) - abs(now_location[0] - pre_location[0]) >= 2:
        if res == 1:
            if whichSide(crossing.yellow1, now_location[0] + now_location[2],
                         now_location[1] + now_location[3]) == 1:  # 车在右车道
                if now_location[1] - pre_location[1] > 0:
                    isRetrograde = True
            elif whichSide(crossing.yellow1, now_location[0], now_location[1] + now_location[3]) == -1:  # 车在左车道
                if pre_location[1] - now_location[1] > 0:
                    isRetrograde = True
        elif res == 0:
            if whichSide(crossing.virtual, now_location[0] + now_location[2],
                         now_location[1] + now_location[3]) == 1:  # 车在右车道
                if now_location[1] - pre_location[1] > 0:
                    isRetrograde = True
            elif whichSide(crossing.virtual, now_location[0], now_location[1] + now_location[3]) == -1:  # 车在左车道
                if pre_location[1] - now_location[1] > 0:
                    isRetrograde = True
        else:
            if whichSide(crossing.yellow2, now_location[0] + now_location[2],
                         now_location[1] + now_location[3]) == 1:  # 车在右车道
                if now_location[1] - pre_location[1] >= 2:
                    isRetrograde = True
            elif whichSide(crossing.yellow2, now_location[0], now_location[1] + now_location[3]) == -1:  # 车在左车道
                if pre_location[1] - now_location[1] >= 2:
                    isRetrograde = True
        return isRetrograde


def redLight(crossing, car, light_image):
    isRedLight = False
    res = whichSection(crossing, car)
    if res == 1:
        if red_green_yellow(light_image, False) == 1:
            if whichSide(crossing.yellow1, car[0] + car[2], car[1] + car[3]) == 1 and whichSide(crossing.yellow1, car[0], car[1] + car[3]) == 1:
                if whichSide(crossing.white1,car[0] + car[2],car[1] + 0.75*car[3]) == -1:
                    isRedLight = True
    return isRedLight

