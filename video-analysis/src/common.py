import math
import cv2
import numpy as np
import matplotlib.pyplot as plt

carWidth = 1.8


# TODO 小识别框物体速度有误排错
def estimateSpeed(location1, location2, mySpeed, fps):
    d_pixels = math.sqrt(math.pow(location2[0] - location1[0], 2) + math.pow(location2[1] - location1[1], 2))
    ppm = location2[2] / carWidth
    d_meters = d_pixels / ppm
    # speed = mySpeed + d_meters * fps
    speed = d_meters * fps
    return speed


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
    # if sum_red >= sum_yellow and sum_red >= sum_green:
    #     return [1, 0, 0]  # Red
    # if sum_yellow >= sum_green:
    #     return [0, 1, 0]  # yellow
    # return [0, 0, 1]  # green
    if sum_red >= sum_green:
        return [1, 0, 0]  # Red
    return [0, 0, 1]  # green


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


# TODO 判断两线段是否相交
def IsIntersec(p1, p2, p3, p4):  # 判断两线段是否相交

    # 快速排斥，以l1、l2为对角线的矩形必相交，否则两线段不相交
    if (max(p1.x, p2.x) >= min(p3.x, p4.x)  # 矩形1最右端大于矩形2最左端
            and max(p3.x, p4.x) >= min(p1.x, p2.x)  # 矩形2最右端大于矩形最左端
            and max(p1.y, p2.y) >= min(p3.y, p4.y)  # 矩形1最高端大于矩形最低端
            and max(p3.y, p4.y) >= min(p1.y, p2.y)):  # 矩形2最高端大于矩形最低端

        # 若通过快速排斥则进行跨立实验
        if (cross(p1, p2, p3) * cross(p1, p2, p4) <= 0
                and cross(p3, p4, p1) * cross(p3, p4, p2) <= 0):
            D = True
        else:
            D = False
    else:
        D = False
    return D


def across(line, rectangle, scan_x, scan_y):
    lp1 = point(line[0]['x'] * scan_x, line[0]['y'] * scan_y)
    lp2 = point(line[1]['x'] * scan_x, line[1]['y'] * scan_y)
    rp1 = point(rectangle[0], rectangle[1])  # 左上
    rp2 = point(rectangle[0], rectangle[3])  # 左下
    rp3 = point(rectangle[2], rectangle[1])  # 右上
    rp4 = point(rectangle[2], rectangle[3])  # 右下
    return IsIntersec(lp1, lp2, rp1, rp2) or IsIntersec(lp1, lp2, rp1, rp3) or IsIntersec(lp1, lp2, rp2,
                                                                                          rp4) or IsIntersec(lp1, lp2,
                                                                                                             rp3, rp4)


def whichSide(line, x, y):
    # 判断点（x,y)在直线的哪一边
    x1 = line[0]['x']
    x2 = line[1]['x']
    y1 = line[0]['y']
    y2 = line[1]['y']
    a = 1.0 * (y2 - y1) / (x2 - x1)
    b = -1 * x1 * a + y1
    if (y - a * x - b) <= 0:
        return -1  # 左
    else:
        return 1  # 右


def whichSection(crossing, car):
    if car[1] >= crossing.yellow1[1]['y']:
        return 1  # 近端
    elif crossing.yellow2[0]['y'] < car[1] < crossing.yellow1[1]['x']:
        return 0  # 中端
    else:
        return -1  # 远端


def onLines(crossing, car):
    isOnLines = False
    if whichSection(crossing, car) != 0:
        if whichSide(crossing.yellow1, car[0] + car[2], car[1] + car[3]) == 1:  # 车在右车道，判断左下角的点
            if whichSide(crossing.yellow1, car[0], car[1] + car[3]) == -1:
                isOnLines = True
        else:  # 车在左车道，判断右下角的点
            if whichSide(crossing.yellow1, car[0] + car[1], car[1] + car[3]) == 1:
                isOnLines = True
    if isOnLines:
        return True
    else:
        return False
