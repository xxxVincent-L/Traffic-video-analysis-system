<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>top</title>
    <link href="../css/style.css" rel="stylesheet" type="text/css" />
    <link href="../css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css" />



    <style type="text/css">




    </style>
</head>

<body>
<div class="allBox">
    <div class="video_left">
        <div class="right_up01">
            <div class="right_up">

                <p><input type="text" placeholder="输入名称或编号" class="input_video"/> </p>
                <div class="right_tree"> <ul id="tree" class="ztree"   ></ul></div>
            </div>

        </div>
        <div class="right_control">
            <div class="control01">
                <input type="button" value="云台" class="but3"/> <input type="button" value="参数" class="but01"/> <input type="button" value="预制位" class="but01"/>
            </div>
            <div class="control02"> </div>
        </div>
    </div>
    <div class="video_right">
        <div class="video_con"  >
            <video  controls preload="none" width="100%" height="100%"  data-setup="{}" autoplay>
                <source src="../webm/CAMERAV.webm" type='video/webm' />
            </video>
        </div>
        <div class="video_con" >
            <video  controls preload="none" width="100%" height="100%"  data-setup="{}" autoplay>
                <source src="../webm/test.mp4" type='video/mp4' />
            </video>
        </div>

        <div class="clear"></div>
        <div class="video_con"  >
            <video  controls preload="none" width="100%" height="100%"  data-setup="{}" autoplay>
                <source src="../webm/test2.avi" type='video/avi' />
            </video>
        </div>
        <div class="video_con" >
            <video  controls preload="none" width="100%" height="100%"  data-setup="{}" autoplay>
                <source src="../webm/CAMERAV.webm" type='video/webm' />
            </video>
        </div>

        <div class="clear"></div>
        <div class="video_con01" >
            <video  controls preload="none" width="100%" height="100%"  data-setup="{}" autoplay>
                <source src="../webm/CAMERAV.webm" type='video/webm' />
            </video>
        </div>


    </div>
</div>


<script src="../js/jquery.js" ></script>
<script src="../js/jquery.ztree.core-3.5.js" ></script>
<script src="../js/jquery.ztree.excheck-3.5.js" ></script>
<script src="../js/ztree_d.js" ></script>

</body>
</html>
