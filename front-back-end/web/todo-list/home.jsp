<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="css/base.css" />
    <link rel="stylesheet" href="css/home.css" />
    <!--<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">-->
    <link href="css/bootstrap-table.css" rel="stylesheet" type="text/css">
    <title>移动办公自动化系统</title>
</head>

<body>
<div class="article toolbar">
    <div class="title ue-clear">
        <h2>常用功能</h2>
        <!--<a href="javascript:;" class="more">更多</a>-->
    </div>
    <div class="content">
        <ul class="toollist ue-clear">
            <li>
                <a href="work.jsp" class="img" target="right"><img src="images/icon01.png" /></a>
                <p><a href="work.jsp" target="right">工作日志</a></p>
            </li>
            <li>
                <a href="email.jsp" class="img" target="right"><img src="images/email03.png" /></a>
                <p><a href="email.jsp" target="right">邮箱</a></p>
            </li>
            <li>
                <a href="mailList.jsp" class="img" target="right"><img src="images/icon02.png" /></a>
                <p><a href="mailList.jsp" target="right">通讯录</a></p>
            </li>
            <li>
                <a href="schedule.jsp" class="img" target="right"><img src="images/icon04.png" /></a>
                <p><a href="schedule.jsp" target="right">日程安排</a></p>
            </li>
            <li>
                <a href="javascript:;" class="img" target="right"><img src="images/datecion01.png"/></a>
                <p><a href="javascript:;" onclick="openlayer()">万年历</a></p>
            </li>
            <li>
                <a href="leave.jsp" class="img"><img src="images/leave01.png" /></a>
                <p><a href="leave.jsp">请假申请</a></p>
            </li>
            <li>
                <a href="fcontract_sign.jsp" class="img" target="right"><img src="images/posintion01.png" /></a>
                <p><a href="fcontract_sign.jsp" target="right">项目合同会签</a></p>
            </li>
            <li>
                <a href="file_sign.jsp" class="img" target="right"><img src="images/file02.png" /></a>
                <p><a href="file_sign.jsp" target="right">文件会签</a></p>
            </li>
            <li>
                <a href="document_wait.jsp" class="img" target="right"><img src="images/file03.png" /></a>
                <p><a href="document_wait.jsp" target="right">公文办理</a></p>
            </li>
            <li>
                <a href="recode.jsp" class="img" target="right"><img src="images/icon07.png" /></a>
                <p><a href="recode.jsp" target="right">定制任务</a></p>
            </li>
            <li>
                <a href="dossier_my.jsp" class="img" target="right"><img src="images/myFiles.png" /></a>
                <p><a href="dossier_my.jsp" target="right">个人档案</a></p>
            </li>
            <li class="add-btn">
                <img src="images/add.png" />
            </li>
        </ul>

    </div>
</div>
<div class="article half notice">
    <div class="wrap-l">
        <div class="title ue-clear">
            <h2>通知公告</h2>
            <a href="notice.jsp" class="more" target="right">更多</a>
        </div>
        <div class="content">
            <ul class="notice-list">
                <li class="ue-clear">
                    <a href="javascript:;" class="notice-title">中国移动关于设立作风建设监督举报电话的公告</a>
                    <div class="notice-time">12-15</div>
                </li>
                <li class="ue-clear">
                    <a href="javascript:;" class="notice-title">关于公示全市中国移动办公生产双主体责任名单的通知</a>
                    <div class="notice-time">12-15</div>
                </li>
                <li class="ue-clear">
                    <a href="javascript:;" class="notice-title">南京市中国移动支付系统安全管理责任人名单</a>
                    <div class="notice-time">12-15</div>
                </li>
                <li class="ue-clear">
                    <a href="javascript:;" class="notice-title">2014年全市通信行业安全生产工作要点</a>
                    <div class="notice-time">12-15</div>
                </li>
                <li class="ue-clear">
                    <a href="javascript:;" class="notice-title">中国移动南京公司关于表彰各位员工的规定</a>
                    <div class="notice-time">12-15</div>
                </li>
            </ul>
        </div>
    </div>
</div>
<div class="article half matter">
    <div class="wrap-r">
        <div class="title ue-clear">
            <h2 class="title-list">
                <ul class="ue-clear">
                    <li class="current"><a href="javascript:;">待办公文</a></li>
                    <li><a href="javascript:;">已办公文</a></li>
                </ul>
            </h2>
            <a href="document_wait.jsp" class="more" target="right">更多</a>
        </div>
        <div class="content">
            <div class="matter-content current ue-clear">
                <div class="today">
                    <p class="year">2016年12月</p>
                    <p class="date">15</p>
                </div>
                <ul class="matter-list">
                    <li class="ue-clear">
                        <span class="matter-time">12-15</span>
                        <a href="javascript:;" class="matter-title">下午2点中国移动召开2014年工作会议</a>
                    </li>
                    <li class="ue-clear">
                        <span class="matter-time">12-15</span>
                        <a href="javascript:;" class="matter-title">上交本年度市局工作报告提纲</a>
                    </li>
                    <li class="ue-clear">
                        <span class="matter-time">12-15</span>
                        <a href="javascript:;" class="matter-title">领取南京政府办公室公务员津贴</a>
                    </li>
                    <li class="ue-clear">
                        <span class="matter-time">12-15</span>
                        <a href="javascript:;" class="matter-title">南京2014年全国移动技术投标大会报名事宜</a>
                    </li>
                    <li class="ue-clear">
                        <span class="matter-time">12-15</span>
                        <a href="javascript:;" class="matter-title">参加市政府举办的互动活动并宣传单位</a>
                    </li>
                </ul>
            </div>
            <div class="matter-content ue-clear">
                <div class="today">
                    <p class="year">2016年12月</p>
                    <p class="date">15</p>
                </div>
                <ul class="matter-list">
                    <li class="ue-clear">
                        <span class="matter-time">12-15</span>
                        <a href="javascript:;" class="matter-title">领取南京政府办公室公务员津贴</a>
                    </li>
                    <li class="ue-clear">
                        <span class="matter-time">12-15</span>
                        <a href="javascript:;" class="matter-title">南京2014年全国移动技术投标大会报名事宜</a>
                    </li>
                    <li class="ue-clear">
                        <span class="matter-time">12-15</span>
                        <a href="javascript:;" class="matter-title">领取南京政府办公室公务员津贴</a>
                    </li>
                    <li class="ue-clear">
                        <span class="matter-time">12-15</span>
                        <a href="javascript:;" class="matter-title">南京2014年全国移动技术投标大会报名事宜</a>
                    </li>
                    <li class="ue-clear">
                        <span class="matter-time">12-15</span>
                        <a href="javascript:;" class="matter-title">参加市政府举办的互动活动并宣传单位</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>

</div>
<div style="clear: both"></div>
<div class="article half duty">
    <div class="wrap-l">
        <div class="title ue-clear">
            <h2>我的任务</h2>
            <a href="myrecode.jsp" class="more" target="right">更多</a>
        </div>
        <div class="content">
            <table id="table" class="table_style"></table>
            <!--<table>-->
            <!--<thead>-->
            <!--<tr>-->
            <!--<th class="date">日期</th>-->
            <!--<th class="week">星期</th>-->
            <!--<th class="leader">值班领导</th>-->
            <!--<th class="contact">联系方式</th>-->
            <!--<th class="remark">备注</th>-->
            <!--</tr>-->
            <!--</thead>-->
            <!--<tbody>-->
            <!--<tr>-->
            <!--<td class="date">05-08</td>-->
            <!--<td class="week">星期一</td>-->
            <!--<td class="leader">刘秀全</td>-->
            <!--<td class="contact">139039409876</td>-->
            <!--<td class="remark"></td>-->
            <!--</tr>-->
            <!--<tr>-->
            <!--<td class="date">05-09</td>-->
            <!--<td class="week">星期一</td>-->
            <!--<td class="leader">刘秀全</td>-->
            <!--<td class="contact">139039409876</td>-->
            <!--<td class="remark"></td>-->
            <!--</tr>-->
            <!--<tr>-->
            <!--<td class="date">05-10</td>-->
            <!--<td class="week">星期一</td>-->
            <!--<td class="leader">刘秀全</td>-->
            <!--<td class="contact">139039409876</td>-->
            <!--<td class="remark"></td>-->
            <!--</tr>-->
            <!--<tr>-->
            <!--<td class="date">05-08</td>-->
            <!--<td class="week">星期一</td>-->
            <!--<td class="leader">刘秀全</td>-->
            <!--<td class="contact">139039409876</td>-->
            <!--<td class="remark"></td>-->
            <!--</tr>-->
            <!--<tr>-->
            <!--<td class="date">05-08</td>-->
            <!--<td class="week">星期一</td>-->
            <!--<td class="leader">刘秀全</td>-->
            <!--<td class="contact">139039409876</td>-->
            <!--<td class="remark"></td>-->
            <!--</tr>-->
            <!--</tbody>-->
            <!--</table>-->
        </div>
    </div>
</div>
<div class="article half email">
    <div class="wrap-r">
        <div class="title ue-clear">
            <h2>未读邮件</h2>
            <a href="email.jsp" class="more" target="right">更多</a>
        </div>
        <div class="content">
            <table>
                <thead>
                <tr>
                    <th class="icon"></th>
                    <th class="sender">发件人</th>
                    <th class="subject">主题</th>
                    <th class="time last-item">时间</th>
                </tr>
                </thead>
                <tbody>
                <tr class="tody">
                    <td colspan="4"><div class="td-wrap"><em>今天</em><a href="javascript:;">(3封)</a></div></td>
                </tr>
                <tr>
                    <td class="icon"><div class="td-wrap"></div></td>
                    <td class="sender"><div class="td-wrap">办公室</div></td>
                    <td class="subject"><div class="td-wrap"><a href="javascript:;">关于移动所有工作人员薪资调整的说明文件</a></div></td>
                    <td class="time"><div class="td-wrap">22分钟前</div></td>
                </tr>
                <tr>
                    <td class="icon"><div class="td-wrap"></div></td>
                    <td class="sender"><div class="td-wrap">行政部</div></td>
                    <td class="subject"><div class="td-wrap"><a href="javascript:;">行政廉洁形象建设工程要点会议纪要</a></div></td>
                    <td class="time"><div class="td-wrap">1小时前</div></td>
                </tr>
                <tr class="open">
                    <td class="icon"><div class="td-wrap"></div></td>
                    <td class="sender"><div class="td-wrap">局长</div></td>
                    <td class="subject"><div class="td-wrap"><a href="javascript:;">部门劳动节放假相关通知</a></div></td>
                    <td class="time"><div class="td-wrap">今天14:23</div></td>
                </tr>
                <tr>
                    <td class="icon"><div class="td-wrap"></div></td>
                    <td class="sender"><div class="td-wrap">自贡水务</div></td>
                    <td class="subject"><div class="td-wrap"><a href="javascript:;">2014年度所有公务员征税政策文件下载</a></div></td>
                    <td class="time"><div class="td-wrap">今天10:23</div></td>
                </tr>
                <tr>
                    <td class="icon"><div class="td-wrap"></div></td>
                    <td class="sender"><div class="td-wrap">办公室</div></td>
                    <td class="subject"><div class="td-wrap"><a href="javascript:;">关于移动所有工作人员薪资调整的说明文件</a></div></td>
                    <td class="time"><div class="td-wrap">22分钟前</div></td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrap-table.js"></script>
<script src="js/bootstrap-table-zh-CN.min.js"></script>
<script>
    $(function () {
        $('#table').bootstrapTable({
            method: "get",
            striped: true,
            singleSelect: false,
            url: "json/person.json",
            dataType: "json",
            pagination: true, //分页
            pageSize: 10,
            pageNumber: 1,
            search: false, //显示搜索框
            contentType: "application/x-www-form-urlencoded",
            queryParams: null,
            columns: [
                {
                    title: "任务名称",
                    field: 'name',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    title: '完成日期',
                    field: 'sex',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    title: '发布人',
                    field: 'type',
                    align: 'center'
                },

                {
                    title: '备注',
                    field: 'class',
                    align: 'center'
                },
                {
                    title: '操作',
                    field: 'id',
                    align: 'center',
                    formatter: function (value, row) {
                        var e = '<a  href="#" onclick="openlayer(\'' + row.id + '\')">查看</a> ';
                        return e;
                    }
                }
            ]
        });
    })
</script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript">
    $(".title-list ul").on("click","li",function(){
        var aIndex = $(this).index();
        $(this).addClass("current").siblings().removeClass("current");
        $(".matter-content").removeClass("current").eq(aIndex).addClass("current");
    });

    $(".duty").find("tbody").find("tr:even").css("backgroundColor","#eff6fa");
</script>
<script src="js/layer_v2.1/layer/layer.js"></script>
<script type="text/javascript">
    function openlayer(id){
        layer.open({
            type: 2,
            title: '万年历',
            shadeClose: true,
            shade: 0.5,
            skin: 'layui-layer-rim',
//            maxmin: true,
            closeBtn:2,
            area: ['80%', '75%'],
            shadeClose: true,
            closeBtn: 2,
            content: 'calendar.jsp'
            //iframe的url
        });
    }
</script>
</html>
