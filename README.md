# Traffic-video-analysis-system
>This rep is a traffic video analysis system which is a final project of a class in School of Computer Science, Sichuan University
## 1. Video analysis

### 1.1 Vehicle identification and tracking

![pic2.png](https://s2.loli.net/2021/12/11/VCfcSHJ71pUYv5K.png)

如上图，对视频中的车辆进行识别并为识别出的每一辆车创建一个跟踪对象，此后每一帧都会对所有的跟踪对象进行位置更新，并且为新捕获到的车辆创建跟踪对象，以及停止对行驶出视频边界的车辆的跟踪。为了更直观展示跟踪效果，在处理得到的视频上，以car ID的形式来唯一标识车辆，并展示出来。

> 这么多中文就不翻译了orz

### 1.2 Speed detection 

![pic1.png](https://s2.loli.net/2021/12/11/9BpCeNIrQka8gzf.png)

如上图，在视频处理过程中，对于识别到的每一辆车都会计算出其的实际速度，并标识在视频上。设置该路口的超速阈值为60Km/h，对于速到超过该阈值的车辆，都会进行违章记录的登记。

对于速度计算，是计算相邻两次检测过程中，车辆在图片上位移的像素点数，乘以一个比例尺换算到现实世界的位移，并以相邻两次检测间隔的帧数比上视频的fps得到时间，从而估算出该瞬时车辆的速度。
