<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="css/bootstrap-table.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="css/base.css" />
    <link rel="stylesheet" href="css/info-mgt.css" />
    <style>
        .layui-layer-title{background:url(images/righttitlebig.png) repeat-x;font-weight:bold;color:#46647e; border:1px solid #c1d3de;height: 33px;line-height: 33px;}
        .tabe_bot label{width: 70px;text-align: right;font-size: 14px;font-weight: 900;color: #46647e}
        .l_left{float: left}
        .tabe_bot input,.tabe_bot  select{width: 180px;height: 30px;border-radius: 6px;margin:0 20px 0 0;text-indent:1em;border: none;border: 1px #ccc solid}
        .tabe_btn{width: 60px;height: 30px;background-color: #68b86c;border: none;border-radius: 6px;color: #fff}
    </style>
    <title>通知管理</title>
</head>

<body onload="Noticeload()">
<div class="title"><h2>通知管理</h2></div>
<div class="query">
    <div class="tabe_bot">
        <div class="l_left"><label>标题：</label><input type="text" placeholder="请输入标题" id="noticeTit"></div>
        <div class="l_left"><label>发布人：</label><input type="text" placeholder="请输入发布人" id="noticePuer"></div>
        <div class="l_left"><label>发布时间：</label><input id="demo" placeholder="输入年月" id="demo" /></div>
        <button class="tabe_btn " onclick="getNoticeTableData()">查询</button>
        <div class="clear"></div>
    </div>
</div>
<div class="table-operate ue-clear">
    <a href="#" class="add" onclick="addNotice()">添加</a>
    <a href="javascript:;" class="del" onclick="delNotice(id)">删除</a>
    <!--<a href="javascript:;" class="edit">编辑</a>-->
    <!--<a href="javascript:;" class="count">统计</a>-->
    <!--<a href="javascript:;" class="check">审核</a>-->
</div>
<div class="table-box">
    <table id="table" class="table_style"></table>
</div>
<div class="pagination ue-clear"></div>
</body>
<script type="text/javascript" src="js/jquery.js"></script>

<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrap-table.js"></script>
<script src="js/bootstrap-table-zh-CN.min.js"></script>
<script src="js/date/js/laydate.js"></script>
<script src="js/layer_v2.1/layer/layer.js"></script>
<script src="js/notice.js"></script>

<script>
    !function(){
        laydate.skin('danlan');//切换皮肤，请查看skins下面皮肤库
        laydate({elem: '#demo'});//绑定元素
    }();
</script>
</html>
