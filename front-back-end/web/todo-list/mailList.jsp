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
    <title>通讯录管理</title>
</head>

<body onload="OnLoad(),change()">
<div class="title"><h2>通讯录管理</h2></div>
<div class="tree_left l_left">
    <h6>部门列表</h6>
    <div class="tree_left_top">
        <div class=" order_ztree l_left organize_ztree" style="width: 100%">
            <p><ul id="treeDemo" class="ztree"  style=" overflow:auto;margin-left: 20px"></ul></p>
        </div>
        <div id="rMenu">
            <ul>
                <li id="m_add" onclick="openlayer5()">增加节点</li>
                <li id="m_del" onclick="removetreenode() ">删除节点</li>
                <!--<li id="m_check" onclick="checkTreeNode(true)">Check节点</li>-->
                <!--<li id="m_unCheck" onclick="checkTreeNode(false)">unCheck节点</li>-->
                <!--<li id="m_reset" onclick="resetTree()">恢复zTree</li>-->
            </ul>
            <div class="ztree_add_div " style="display: none" id="dialog-confirm">

                <p><label>名称：</label><input type="text" /></p>
                <p class="bot_btn">
                    <button class="btn" id="tree_add" onclick="addTreeNode()">保存</button>
                    <button class="btn btn1" id="cancer">取消</button>
                </p>

            </div>
        </div>
        <div class="clear"></div>
    </div>
</div>
<div class="l_left" style="width: 80%">
    <div class="query">
        <div class="tabe_bot">
            <div class="list_left"><label style="float: left">拼音：</label><ul class="list_ul">
                <li>A</li>
                <li>B</li>
                <li>C</li>
                <li>D</li>
                <li>E</li>
                <li>F</li>
                <li>G</li>
                <li>H</li>
                <li>I</li>
                <li>J</li>
                <li>K</li>
                <li>M</li>
                <li>L</li>
                <li>N</li>
                <li>O</li>
                <li>P</li> <li>Q</li> <li>R</li> <li>S</li> <li>T</li> <li>U</li> <li>V</li> <li>W</li>
                <li>X</li> <li>Y</li> <li>Z</li>


            </ul> </div>
            <input type="text" placeholder="输入姓名" style="float: right" id="user">
            <div class="clear"></div>



        </div>
    </div>
    <div class="table-operate ue-clear">
        <a href="javascript:;" class="add" onclick="addPerson()">添加</a>
        <a href="javascript:;" class="del" onclick="removePerson(id)">删除</a>

    </div>
    <div class="table-box">
        <table id="table" class="table_style"></table>
    </div>
    <div class="pagination ue-clear"></div>
</div>
</body>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/demo/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="js/jquery.ztree.excheck-3.5.js"></script>
<script type="text/javascript" src="js/jquery.ztree.exedit-3.5.js"></script>
<script src="js/mailList.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrap-table.js"></script>
<script src="js/bootstrap-table-zh-CN.min.js"></script>
<script src="js/date/js/laydate.js"></script>
<script src="js/artDialog/jquery.artDialog.source.js?skin=default"></script>
<script src="js/artDialog/plugins/iframeTools.js"></script>

<script>
    !function(){
        laydate.skin('danlan');//切换皮肤，请查看skins下面皮肤库
        laydate({elem: '#demo'});
        laydate({elem: '#demo1'});//绑定元素
    }();
</script>
<script src="js/layer_v2.1/layer/layer.js"></script>

</html>
