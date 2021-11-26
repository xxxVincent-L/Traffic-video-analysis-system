import cv2 as cv
import os.path

for number in range(1, 13):
    video_path = "C:\\Users\\Y\\Desktop\\project\\detection\\video\\" + str(number) + ".mp4"
    store_path = "C:\\Users\\Y\\Desktop\\project\\detection\\frame\\" + str(number)
    vc = cv.VideoCapture(video_path)  # 读入视频文件
    rval, frame = vc.read()  # 分帧读取视频
    cv.imwrite(store_path+'.png', frame)  # 保存路径
    cv.waitKey(1)
    vc.release()
