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
        .tree_left{box-sizing:border-box;overflow-y: auto;width:19%;border: 1px #c1d3de solid;margin-right: 1%;border-top:none;}
        .tree_left h6,.tree_right h6{line-height: 30px;font-weight: bold;padding-left: 6px ;color: #000;font-size: 14px}
        .tree_left_top{margin: 6px}
        .tree_input input{border: 1px #ccc solid;margin:3px 0 0 10px;border-radius: 4px;
        }
        .layui-layer-title{background:url(images/righttitlebig.png) repeat-x;font-weight:bold;color:#46647e; border:1px solid #c1d3de;height: 33px;line-height: 33px;}
        .tabe_bot label{width: 70px;text-align: right;font-size: 14px;font-weight: 900;color: #46647e}
        .l_left{float: left}
        .tabe_bot input,.tabe_bot  select{width: 180px;height: 30px;border-radius: 6px;margin:0 20px 0 0;border: none;border: 1px #ccc solid}
        .tabe_btn{width: 60px;height: 30px;background-color: #68b86c;border: none;border-radius: 6px;color: #fff}

        div#rMenu {position:absolute; visibility:hidden; top:0; background-color: #99c9db;text-align: left;padding: 2px;z-index: 999}
        div#rMenu ul li{ margin: 1px 0;padding: 5px 15px;cursor: pointer;list-style: none outside none;background-color: #5a8cc4;color: #fff  }
        div#rMenu ul li:hover{color: #000;background-color: #ccc}
        #rMenu ul{margin: 0;padding: 0};
        .ztree_add_div {
            width:200px;
            height:100px;
            border:1px solid #cccccc;
            padding-top:10px;
            padding-bottom:10px;
            display:none;



        }
        .ztree_add_div p {

            padding-bottom:10px;
            padding-top:10px;
        }
        .bot_btn .btn{width: 40px;height: 24px;background-color: #68b86c;border: none;border-radius: 6px;color: #fff;margin-right: 15px;}
        .bot_btn .btn1{background-color: #c1d3de;border: none;border-radius: 6px;color: #000;margin-right: 0}
        .bot_btn{width: 100%;height: 30px;font-size:13px;text-align:center;}
    </style>

    <script src="js/jquery.js"></script>
    <script>
        function change() {
            var height01 = $(window).height();
            $(".tree_left").css('height', height01 - 35+"px");
        }
    </script>
    <title>用户管理</title>
</head>

<body onload="Personload()">
<div class="title"><h2>用户管理</h2></div>

<div class="l_left" style="width: 100%">
    <div class="query">
        <div class="tabe_bot">
            <div class="l_left"><label>用户名：</label><input type="text" placeholder="请输入姓名" id="user"></div>
            <div class="l_left"><label>角色：</label><select id="role">
                <option>xxxxx</option>
            </select></div>
            <button class="tabe_btn " onclick="getData()">查询</button>
            <div class="clear"></div>
        </div>
    </div>
    <div class="table-operate ue-clear">
        <a href="javascript:;" class="add" onclick="add()">添加</a>
        <a href="javascript:;" class="del" onclick="del(id)">删除</a>

    </div>
    <div class="table-box">
        <table id="table" class="table_style"></table>
    </div>
    <div class="pagination ue-clear"></div>
</div>
</body>
<script type="text/javascript" src="js/jquery.js"></script>

<script src="js/person.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrap-table.js"></script>
<script src="js/bootstrap-table-zh-CN.min.js"></script>
<script src="js/date/js/laydate.js"></script>


<script>
    !function(){
        laydate.skin('danlan');//切换皮肤，请查看skins下面皮肤库
        laydate({elem: '#demo'});
        laydate({elem: '#demo1'});//绑定元素
    }();
</script>
<script src="js/layer_v2.1/layer/layer.js"></script>

</html>
