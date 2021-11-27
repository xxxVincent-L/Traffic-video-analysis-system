<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="css/bootstrap-table.css" rel="stylesheet" type="text/css">
    <link href="css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="css/base.css" />
    <link rel="stylesheet" href="css/info-mgt.css" />
    <style>
        .tree_left{box-sizing:border-box;overflow-y: auto;width:76%;border: 1px #ccc solid;;border-radius: 6px;margin-right: 1%;margin-left: 90px;height: 400px;}
        .tree_left_top{margin: 6px}
        .tree_input input{border: 1px #ccc solid;margin:3px 0 0 10px;border-radius: 4px;
        }
        .layui-layer-title{background:url(images/righttitlebig.png) repeat-x;font-weight:bold;color:#46647e; border:1px solid #c1d3de;height: 33px;line-height: 33px;}
        .tabe_bot label,.right label{width: 70px;text-align: right;font-size: 14px;font-weight: 900;color: #46647e}
        .l_left{float: left}
        .tabe_bot input,.tabe_bot  select,.right input,.right input{width: 180px;height: 30px;border-radius: 6px;margin:0 20px 0 0;border: none;border: 1px #ccc solid}
        .tabe_btn{width: 60px;height: 30px;background-color: #68b86c;border: none;border-radius: 6px;color: #fff}
        .right{width: 39%;border: 1px #c1d3de solid;border-top: none}
        .right textarea{width: 80%;height: 60px;resize: none;border-radius: 6px;margin-bottom: 20px;border: 1px #ccc solid}
        .bot_btn{width: 150px;height: 30px;margin: 20px 0 0 40%}
        .bot_btn .btn{width: 60px;height: 30px;background-color: #68b86c;border: none;border-radius: 6px;color: #fff;margin-right: 15px}
        .bot_btn .btn1{background-color: #c1d3de;border: none;border-radius: 6px;color: #000;margin-right: 0}
    </style>
    <title>角色管理</title>
</head>

<body onload="change(),Roleload()">
<div class="title"><h2>角色管理</h2></div>
<div class="l_left" style="width: 60%;margin-right: 1%">
    <div class="query">
        <div class="tabe_bot">
            <div class="l_left" style="margin-left: 20px"><label>角色名称：</label><input type="text" placeholder="请输入角色名称" id="name"></div>
            <button class="tabe_btn " onclick="getRoleTableData()">查询</button>
            <div class="clear"></div>
        </div>
    </div>
    <div class="table-operate ue-clear">
        <a href="javascript:;" class="add" onclick="openlayer()" >添加</a>


    </div>
    <div class="table-box">
        <table id="table" class="table_style"></table>
    </div>
    <div class="pagination ue-clear"></div>
</div>
<div class="l_left right">
    <div style="margin:20px 0 20px 20px"><label>角色名称：</label><input type="text"  readonly="readonly" id="ROLE"></div>
    <div style="margin-left: 20px"><label style="float: left;line-height: 60px">角色描述：</label><textarea  readonly="readonly" id="ROLENAME"></textarea></div>
    <div class="tree_left l_left">
        <div class="tree_left_top">
            <div class=" order_ztree l_left organize_ztree" style="width: 100%">
                <p><ul id="treeDemo" class="ztree"  style=" overflow:auto;margin-left: 20px"></ul></p>
            </div>
            <div class="clear"></div>
        </div>
    </div>
    <div class="clear"></div>
    <div class="bot_btn">
        <button class="btn" onclick="onClick()">保存</button>
        <button class="btn btn1" onclick="checkCancel()">取消</button>
    </div>
    <div class="clear"></div>

</div>
</body>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/demo/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="js/jquery.ztree.excheck-3.5.js"></script>
<script type="text/javascript" src="js/jquery.ztree.exedit-3.5.js"></script>
<script src="js/role.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrap-table.js"></script>
<script src="js/bootstrap-table-zh-CN.min.js"></script>
<script src="js/layer_v2.1/layer/layer.js"></script>
<script>
    $(document).ready(function(){
        $.fn.zTree.init($("#treeDemo"), setting, zNodes);
        zTree = $.fn.zTree.getZTreeObj("treeDemo");
        zTree.expandAll(false);
        var node0 = zTree.getNodeByTId("1");
        zTree.expandNode(node0, true, false, true);
        var node = zTree.getNodeByTId("2");
        zTree.expandNode(node, true, true, true);
        var node1 = zTree.getNodeByTId("5");
        zTree.expandNode(node1, true, true, true);
        var node2 = zTree.getNodeByTId("10");
        zTree.expandNode(node2, true, true, true);
        zTree.expandNode(node1, true, true, true);
        var node3 = zTree.getNodeByTId("15");
        zTree.expandNode(node3, true, true, true);
        rMenu = $("#rMenu");
    });
    function change() {
        var height01 = $(window).height();
        $(".right").css('height', height01 - 35+"px");
    }
</script>

</html>
