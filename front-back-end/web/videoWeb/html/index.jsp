<%--
  Created by IntelliJ IDEA.
  User: 12550
  Date: 2021/11/23
  Time: 13:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>top</title>
    <link href="../css/style.css" rel="stylesheet" type="text/css" />



    <style type="text/css">




    </style>
</head>

<body onload="change()">

<div class="top">
    <div class="top_logo"><img src="../img/logo.png"/></div>
    <div class="top_right"><ul>
        <li><i class="i_video"></i> <a href="video.jsp" target="iframe_con">实时监控</a> </li>
        <li><i class="i_play"></i><a href="back_play.jsp" target="iframe_con">录像回放</a> </li>
        <li><i class="i_alam"></i><a href="back_play.jsp" target="iframe_con">报警管理</a> </li>
        <li><i class="i_map"></i> <a href="map.jsp" target="iframe_con">电子地图</a> </li>
        <li><i class="i_lgo"></i> <a href="log.jsp" target="iframe_con">日志管理</a> </li>
        <li><i class="i_set"></i> <a href="goods.jsp" target="iframe_con">系统设置</a> </li>
    </ul></div>
</div>
<div class="div_iframe">
    <iframe src="video.jsp" name="iframe_con" title="test" frameborder="0" width="100%" height="100%" scrolling="auto" allowtransparency="true" style="background-color:transparent; z-index:1;"> </iframe>
</div>
<div class="div_foot">
    <span class="foot_left"></span>
    <span class="foot_right"></span>
</div>
<script src="../js/jquery.js" ></script>
<script>
    function change() {
        var height01 = $(window).height();
        $(".div_iframe").css('height', height01 - 122+"px");
    }
</script>
</body>
</html>
