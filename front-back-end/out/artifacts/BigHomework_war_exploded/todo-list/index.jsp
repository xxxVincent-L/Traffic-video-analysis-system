<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="css/base.css" />
    <link rel="stylesheet" type="text/css" href="css/jquery.dialog.css" />
    <link rel="stylesheet" href="css/index.css" />
    <style>
        .layui-layer-title{background:url(images/righttitlebig.png) repeat-x;font-weight:bold;color:#46647e; border:1px solid #c1d3de;height: 33px;line-height: 33px;}
    </style>
    <title>OA管理系统后台模板 - </title>
</head>
<!--/************************************************************
 *																*
 * 						      							*
 *                        							*
 *       		  努力创建完善、持续更新插件以及模板			*
 * 																*
**************************************************************-->
<body>
<div id="container">
    <div id="hd">
        <div class="hd-wrap ue-clear">
            <div class="top-light"></div>
            <h1 class="logo"></h1>
            <div class="login-info ue-clear">
                <div class="welcome ue-clear"><span>欢迎您,</span><a href="javascript:void(0)" class="user-name">Admin</a></div>
                <div class="login-msg ue-clear">
                    <a href="javascript:void(0)" class="msg-txt">消息</a>
                    <a href="javascript:void(0)" class="msg-num">10</a>
                </div>
            </div>
            <div class="toolbar ue-clear">
                <a href="home.jsp" class="home-btn" target="right">首页</a>
                <a href="javascript:void(0)" class="home-btn1" target="right" onclick="openlayer()">修改密码</a>
                <a href="javascript:void(0)" class="quit-btn exit home-btn">退出</a>
            </div>
        </div>
    </div>
    <div id="bd">
        <div class="wrap ue-clear">
            <div class="sidebar">
                <h2 class="sidebar-header"><p>功能导航</p></h2>
                <ul class="nav">
                    <li class="office current"><div class="nav-header"><a href="home.jsp" target="right" class="ue-clear"><span>首页</span><i class="icon"></i></a></div></li>
                    <li class="land"><div class="nav-header"><a href="JavaScript:;" class="ue-clear" ><span>日常办公</span><i class="icon hasChild"></i></a></div>
                        <ul class="subnav">
                            <li><a href="work.jsp" target="right">工作日志</a></li>
                            <li><a href="mywork.jsp" target="right">我的工作日志</a></li>
                            <li><a href="recode.jsp" target="right">定制任务</a></li>
                            <li><a href="myrecode.jsp" target="right">我的任务</a></li>
                            <li><a href="schedule.jsp" target="right">日程管理</a></li>



                        </ul>
                    </li>

                    <li class="train"><div class="nav-header"><a href="JavaScript:;" class="ue-clear" ><span>培训管理</span><i class="icon hasChild"></i></a></div>
                        <ul class="subnav">
                            <li><a href="mytrain.jsp" target="right">我的培训</a></li>
                            <li><a href="train.jsp" target="right">培训管理</a></li>

                        </ul>
                    </li>


                    <li class="email"><div class="nav-header"><a href="mesage.jsp"class="ue-clear"  target="right"><span>消息推送</span><i class="icon"></i></a></div></li>
                    <li class="list_m"><div class="nav-header"><a href="mailList.jsp" class="ue-clear" target="right"><span>通讯录管理</span><i class="icon"></i></a></div></li>
                    <li class="news_m"><div class="nav-header"><a href="notice.jsp" class="ue-clear"  target="right"><span>通知通告</span><i class="icon"></i></a></div></li>




                    <li class="dossier"><div class="nav-header"><a href="JavaScript:;" class="ue-clear" ><span>档案管理</span><i class="icon hasChild"></i></a></div>
                        <ul class="subnav">
                            <li><a href="dossier_my.jsp" target="right">个人档案</a></li>
                            <li><a href="dossier_puplic.jsp" target="right">公共档案</a></li>

                        </ul>
                    </li>

                    <li class="part"><div class="nav-header"><a href="JavaScript:;" class="ue-clear" ><span>系统管理</span><i class="icon hasChild"></i></a></div>
                        <ul class="subnav">
                            <li><a href="person.jsp" target="right">用户管理</a></li>
                            <li><a href="part.jsp" target="right">部门管理</a></li>

                            <li><a href="role.jsp" target="right">角色管理</a></li>

                        </ul>
                    </li>
                </ul>
            </div>
            <div class="content">
                <iframe src="home.jsp" id="iframe" width="100%" height="100%" frameborder="0" name="right" style="min-width: 1100px"></iframe>
            </div>
        </div>
    </div>
    <div id="ft" class="foot_div">

        <span>xxxxxx</span>
        <em>Office&nbsp;System</em>

        <div class="ft-right">
            <span>Automation</span>
            <em>更多模板：<a href="http://" target="_blank"></a></em>
        </div>
    </div>
</div>
<div class="exitDialog">
    <div class="dialog-content">
        <div class="ui-dialog-icon"></div>
        <div class="ui-dialog-text">
            <p class="dialog-content">你确定要退出系统？</p>
            <p class="tips">如果是请点击“确定”，否则点“取消”</p>

            <div class="buttons">
                <input type="button" class="button long2 ok" value="确定" />
                <input type="button" class="button long2 normal" value="取消" />
            </div>
        </div>

    </div>
</div>
<style>
    .copyrights{text-indent:-9999px;height:0;line-height:0;font-size:0;overflow:hidden;}
</style>
<div class="copyrights" id="links20210126">
    Collect from <a href="http://www.cssmoban.com/"  title="网站模板">模板之家</a>
    <a href="https://www.chazidian.com/"  title="查字典">查字典</a>
</div>
</body>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/core.js"></script>
<script type="text/javascript" src="js/jquery.dialog.js"></script>
<script type="text/javascript" src="js/index.js"></script>
<script src="js/layer_v2.1/layer/layer.js"></script>
<script type="text/javascript">
    function openlayer(id){
        layer.open({
            type: 2,
            title: '修改密码',
            shadeClose: false,
            shade: 0.5,
            skin: 'layui-layer-rim',
//            maxmin: true,
            closeBtn:2,
            area: ['35%', '40%'],
            content: 'password.jsp'
            //iframe的url
        });
    }
</script>
</html>
