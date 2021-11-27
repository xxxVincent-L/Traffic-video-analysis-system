<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">

    <link rel="stylesheet" href="css/base.css" />
    <link rel="stylesheet" href="css/info-mgt.css" />
    <link rel="stylesheet" href="css/jquery.treetable.css" />
    <link rel="stylesheet" href="css/jquery.treetable.theme.default.css" />
    <style>
        .layui-layer-title{background:url(images/righttitlebig.png) repeat-x;font-weight:bold;color:#46647e; border:1px solid #c1d3de;height: 33px;line-height: 33px;}
        .tabe_bot label{width: 70px;text-align: right;font-size: 14px;font-weight: 900;color: #46647e}
        .l_left{float: left}
        .tabe_bot input,.tabe_bot  select{width: 180px;height: 30px;border-radius: 6px;margin:0 20px 0 0;border: none;border: 1px #ccc solid}
        .tabe_btn{width: 60px;height: 30px;background-color: #68b86c;border: none;border-radius: 6px;color: #fff}
    </style>
    <title>部门管理</title>
</head>

<body>
<div class="title"><h2>部门管理</h2></div>
<div class="query">
    <div class="tabe_bot">
        <div class="l_left"><label>部门名称：</label><input type="text" placeholder="请输入部门名称"></div>


        <button class="tabe_btn ">查询</button>
        <div class="clear"></div>
    </div>
</div>
<div class="table-operate ue-clear">
    <a href="#" class="add" id="addpart" onClick="openlayer()">添加</a>
    <a href="javascript:;" class="del">删除</a>
    <a href="javascript:;" class="edit">编辑</a>

</div>

<div class="table-box">
    <table id="example-advanced"  class="tableztree01">

        <tr class="thead_tr"><td style="padding-left: 10px;font-weight: bold">部门</td><td style="font-weight: bold">描述</td><td style="font-weight: bold">操作</td></tr>
        <tbody>
        <tr data-tt-id="0">

            <td ><span class="folder"></span>重庆市规划局</td>
            <td>描述</td>
            <td ><a href="#" onClick="openlayer()">添加</a> <a href="#">删除</a> <a href="#" onClick="openlayer()">修改</a></td>

        </tr>


        <tr data-tt-id="1" data-tt-parent-id="0">

            <td ><span class="folder"></span>高新区规划局</td>
            <td>描述</td>
            <td ><a href="#" onClick="openlayer()">添加</a> <a href="#">删除</a> <a href="#" onClick="openlayer()">修改</a></td>


        </tr>

        <tr data-tt-id="1-1" data-tt-parent-id="1">

            <td ><span class="file"></span>城南分局</td>
            <td>描述</td>
            <td ><a href="#" onClick="openlayer()">添加</a> <a href="#">删除</a> <a href="#" onClick="openlayer()">修改</a></td>

        </tr>

        <tr data-tt-id="2">

            <td><span class="folder"></span>重庆市公安局</td>
            <td>描述</td>
            <td ><a href="#" onClick="openlayer()">添加</a> <a href="#">删除</a> <a href="#" onClick="openlayer()">修改</a></td>

        </tr>

        <tr data-tt-id="2-1" data-tt-parent-id="2">

            <td><span class="file"></span>高新分局</td>
            <td>描述</td>
            <td ><a href="#" onClick="openlayer()">添加</a> <a href="#">删除</a> <a href="#" onClick="openlayer()">修改</a></td>

        </tr>

        <tr data-tt-id="2-1" data-tt-parent-id="2">

            <td><span class="file"></span>江北分局</td>
            <td>描述</td>
            <td ><a href="#" onClick="openlayer()">添加</a> <a href="#">删除</a> <a href="#" onClick="openlayer()">修改</a></td>

        </tr>
        <tr data-tt-id="3">
            <td><span class="folder"></span>重庆市房产局</td>
            <td>描述</td>
            <td ><a href="#" onClick="openlayer()">添加</a> <a href="#">删除</a> <a href="#" onClick="openlayer()">修改</a></td>
        </tr>
        <tr data-tt-id="3-1" data-tt-parent-id="3">
            <td><span class="file"></span>高新分局</td>
            <td>描述</td>
            <td ><a href="#" onClick="openlayer()">添加</a> <a href="#">删除</a> <a href="#" onClick="openlayer()">修改</a></td>
        </tr>
        <tr data-tt-id="3-2" data-tt-parent-id="3">
            <td><span class="file"></span>江北分局</td>
            <td>描述</td>
            <td ><a href="#" onClick="openlayer()">添加</a> <a href="#">删除</a> <a href="#" onClick="openlayer()">修改</a></td>
        </tr>
        <tr data-tt-id="4">
            <td><span class="folder"></span>重庆市劳动局</td>
            <td>描述</td>
            <td ><a href="#" onClick="openlayer()">添加</a> <a href="#">删除</a> <a href="#" onClick="openlayer()">修改</a></td>
        </tr>
        <tr data-tt-id="4-1" data-tt-parent-id="4">
            <td><span class="file"></span>高新分局</td>
            <td>描述</td>
            <td ><a href="#" onClick="openlayer()">添加</a> <a href="#">删除</a> <a href="#" onClick="openlayer()">修改</a></td>
        </tr>
        <tr data-tt-id="4-2" data-tt-parent-id="4">
            <td><span class="file"></span>江北分局</td>
            <td>描述</td>
            <td ><a href="#" onClick="openlayer()">添加</a> <a href="#">删除</a> <a href="#" onClick="openlayer()">修改</a></td>
        </tr>
        <tr data-tt-id="5">
            <td><span class="folder"></span>重庆市卫生局</td>
            <td>描述</td>
            <td ><a href="#" onClick="openlayer()">添加</a> <a href="#">删除</a> <a href="#" onClick="openlayer()">修改</a></td>
        </tr>
        <tr data-tt-id="5-1" data-tt-parent-id="5">
            <td><span class="file"></span>高新分局</td>
            <td>描述</td>
            <td ><a href="#" onClick="openlayer()">添加</a> <a href="#">删除</a> <a href="#" onClick="openlayer()">修改</a></td>
        </tr>
        <tr data-tt-id="5-2" data-tt-parent-id="5">
            <td><span class="file"></span>江北分局</td>
            <td>描述</td>
            <td ><a href="#" onClick="openlayer()">添加</a> <a href="#">删除</a> <a href="#" onClick="openlayer()">修改</a></td>
        </tr>

        </tbody>
    </table>
</div>
<div class="pagination ue-clear"></div>
<div class="part_page"><a href="#">首页</a><a href="#" class="page_none">上一页</a><a href="#" class="page_active">1</a><a href="#">2</a><a href="#">3</a><a href="#">4</a><a href="#">5</a><a href="#">6</a><a href="#">...</a><a href="#" class="page_none">下一页</a><a href="#">尾页</a></div>
</body>
<script type="text/javascript" src="js/jquery.js"></script>
<script src="js/jquery.treetable.js"></script>


<script>
    !function(){
        laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
        laydate({elem: '#demo'});//绑定元素
    }();
</script>
<script language="javascript">
    $("#example-advanced").treetable({ expandable: true});



</script>
<script src="js/layer_v2.1/layer/layer.js"></script>
<script type="text/javascript">

    function openlayer(id){
        layer.open({
            type: 2,
            title: '添加信息',
            shadeClose: true,
            shade: 0.5,
            skin: 'layui-layer-rim',
//            maxmin: true,
            closeBtn:1,
            area: ['60%', '60%'],
            shadeClose: true,
            closeBtn: 1,
            content: 'part_tail.jsp'
            //iframe的url
        });
    }
</script>
</html>
