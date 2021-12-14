# 导入包
from hyperlpr import *
# 导入OpenCV库
import cv2

# 读入图片
image = cv2.imread("C:\\Users\\Y\\Desktop\\project\\detection\\frame\\S001-1.png")
# 识别结果
# image = cv2.resize(image, (720, 560))
res=HyperLPR_plate_recognition(image)
print(res)
for index, item in enumerate(res):
    print(item[0][:7])
    print(item[2][0])