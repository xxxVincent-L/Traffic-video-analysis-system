import src.crossing as lines
import cv2

WIDTH = 720
HEIGHT = 560
scan_x = float(WIDTH) / float(1920)
scan_y = float(HEIGHT) / float(1080)
connor1 = lines.crossing()
picPath = "C:\\Users\\Y\\Desktop\\project\\detection\\frame\\S001-S002-1.png"
img = cv2.imread(picPath)
img = cv2.resize(img, (WIDTH, HEIGHT))
cv2.line(img, (int(connor1.white1[0]['x']), int(connor1.white1[0]['y'])), (int(connor1.white1[1]['x']), int(connor1.white1[1]['y'])), (0, 0, 255), 2)
cv2.imshow("img", img)
cv2.waitKey()