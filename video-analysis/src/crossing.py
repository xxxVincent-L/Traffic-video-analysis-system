import json

WIDTH = 720
HEIGHT = 560
scan_x = float(WIDTH) / float(1920)
scan_y = float(HEIGHT) / float(1080)


class crossing:
    white1 = {0: {}, 1: {}}
    yellow1 = {0: {}, 1: {}}
    yellow2 = {0: {}, 1: {}}

    # TODO 根据视频名称确定json文件名
    # TODO json文件格式修改，以及红绿灯精确定位
    def __init__(self):
        jsonPath = r"C:/Users/Y/Desktop/project/detection/crossings/crossing1.json"
        jsonfile = open(jsonPath, 'r')
        data = json.load(jsonfile)
        for i in data:
            key, = i
            if key == "yellow_line1":
                self.yellow1[0]['x'] = list(i.values())[0][0]['x'] * scan_x
                self.yellow1[0]['y'] = list(i.values())[0][0]['y'] * scan_y
                self.yellow1[1]['x'] = list(i.values())[0][1]['x'] * scan_x
                self.yellow1[1]['y'] = list(i.values())[0][1]['y'] * scan_y
            if key == "white_line1":
                self.white1[0]['x'] = list(i.values())[0][0]['x'] * scan_x
                self.white1[0]['y'] = list(i.values())[0][0]['y'] * scan_y
                self.white1[1]['x'] = list(i.values())[0][1]['x'] * scan_x
                self.white1[1]['y'] = list(i.values())[0][1]['y'] * scan_y
            if key == "yellow_line2":
                self.yellow2[0]['x'] = list(i.values())[0][0]['x'] * scan_x
                self.yellow2[0]['y'] = list(i.values())[0][0]['y'] * scan_y
                self.yellow2[1]['x'] = list(i.values())[0][1]['x'] * scan_x
                self.yellow2[1]['y'] = list(i.values())[0][1]['y'] * scan_y
#     def isInArea(self, x, y, w, h):
#         # 判断车辆是否在我们所检测的区域内
#         count = 0
#         if self.whichSide(self.a_white, self.b_white, x, y) == self.whichSide(self.a_white, self.b_white, self.x_yellow2,
#                                                                               self.y_yellow2) \
#                 and self.whichSide(self.a_yellow, self.b_yellow, x, y) == self.whichSide(self.a_yellow, self.b_yellow, self.x_white2, self.y_white2):
#             count += 1
#         if self.whichSide(self.a_white, self.b_white, x + w, y) == self.whichSide(self.a_white, self.b_white, self.x_yellow2, self.y_yellow2) \
#                 and self.whichSide(self.a_yellow, self.b_yellow, x + w, y) == self.whichSide(self.a_yellow, self.b_yellow, self.x_white2, self.y_white2):
#             count += 1
#         if self.whichSide(self.a_white, self.b_white, x + w, y + h) == self.whichSide(self.a_white, self.b_white, self.x_yellow2, self.y_yellow2) \
#                 and self.whichSide(self.a_yellow, self.b_yellow, x + w, y + h) == self.whichSide(self.a_yellow, self.b_yellow, self.x_white2, self.y_white2):
#             count += 1
#         if self.whichSide(self.a_white, self.b_white, x, y + h) == self.whichSide(self.a_white, self.b_white, self.x_yellow2, self.y_yellow2) \
#                 and self.whichSide(self.a_yellow, self.b_yellow, x, y + h) == self.whichSide(self.a_yellow, self.b_yellow, self.x_white2, self.y_white2):
#             count += 1
#         if count >= 3:
#             return 1
#         else:
#             return 0
#
#
# def loadJson():
#     pass
