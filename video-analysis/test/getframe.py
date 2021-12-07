import cv2 as cv
import os.path
video_path = "D:\\nerve\\something\\研究与开发实践\\大英路口视频-研发用\\大英路口视频-研发用\\2018-04-27_14_33_38.avi"
store_path = "C:\\Users\\Y\\Desktop\\project\\detection\\frame\\sp-3"
vc = cv.VideoCapture(video_path)  # 读入视频文件
rval, frame = vc.read()  # 分帧读取视频
cv.imwrite(store_path+'.png', frame)  # 保存路径
cv.waitKey(1)
vc.release()
