<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <!-- 引入 layui.css -->
    <link rel="stylesheet" href="//unpkg.com/layui@2.6.8/dist/css/layui.css">
    <!-- 引入 layui.js -->
    <script src="//unpkg.com/layui@2.6.8/dist/layui.js"></script>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>车辆视频分析</title>
    <link href="../css/my.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
    </style>
</head>
<body>
<ul class="layui-nav layui-bg-green">
    <li class="layui-nav-item"><a href="">导航</a></li>
    <li class="layui-nav-item"><a href="">违规信息</a></li>
    <li class="layui-nav-item"><a href="">交规学习</a></li>
    <li class="layui-nav-item">
        <a href="javascript:;">解决方案</a>
        <dl class="layui-nav-child">
            <dd><a href="">移动模块</a></dd>
            <dd><a href="">后台模版</a></dd>
        </dl>
    </li>
    <li class="layui-nav-item"><a href="">社区</a></li>
</ul>

<div class="wrapper " style="padding: 30px;">
<%--        <div style="display:none;position: absolute;z-index: 1;width: 100%;height: 100%;" id="mask">--%>
<%--            <div style="margin:auto;background-color: black;color: aliceblue;"><h1>视频在处理中，请稍后</h1></div>--%>
<%--        </div>--%>
        <div class="video_1">
<%--            <div class="layui-btn-group">--%>
<%--                <button type="button" onclick="play_all()" class="layui-btn">播放</button>--%>
<%--                <button type="button" onclick="pause_all()" class="layui-btn ">暂停</button>--%>
<%--            </div>--%>
            <div class="video_result">
                <video id="video1" height="300" controls autoplay>
                    <source src="../webm/test.mp4" type='video/webm'/>
                </video>
            </div>
        </div>
        <div class="video_2">
            <div>
                <input type="file" id="input_file" name="input_file" accept=".mp4,.webm,.avi">
                <button id="upload_button" type="button" class="layui-btn">上传文件</button>
                <br>
                <video id="video2">
                    <source src="" type="video/webm">
                </video>
            </div>
        </div>
        <div class="pics">
            <div id="illegal"style="overflow: scroll;"></div>
        </div>
        <div class="tables">
            <script type="text/html" id="farmData-toolbar"></script>
            <table id="demo" lay-filter="test"></table>
        </div>

</div>

<script src="../js/jquery.js" ></script>
<script>
    layui.use('table', function(){
        var table = layui.table;
        //第一个实例
        table.render({
            elem: '#demo'
            ,height: 290
            ,url: '../json/illegal.json' //数据接口
            ,cols: [[ //表头
                {field: 'IllegalID', title: '违章ID', sort: true, fixed: 'left'}
                ,{field: 'CarNum', title: '车牌号'}
                ,{field: 'IllegalDate', title: '违章时间', sort: true}
            ]]
            ,toolbar: '#illegal-toolbar'
            ,defaultToolbar: [{
                title: '刷新',
                layEvent: 'refresh',
                icon: 'layui-icon-refresh',
            }, 'filter', 'print', 'exports']
        });
    });

    $(document).ready(function () {
        $("#input_file").change(function () {
            $("#mask").attr("style","display:flex;position: absolute;z-index: 1;width: 100%;height: 100%;");
            // var files = $("#input_file").files[0];
            // var url = URL.createObjectURL(files);
            // $('#video').attr('src',url)
            var filename = $("#input_file").val();
            var formData = new FormData();
            formData.append("files", $("#input_file")[0].files[0]);
            formData.append("device_id", $("#device_id").val());
            formData.append("device_name", $("#device_name").val());
            formData.append("produce_time", $("#produce_time").val());
            $.ajax({
                type: "POST",
                url: "../../file_upload",
                enctype: 'multipart/form-data',
                data: formData,
                dataType:"json",                //这一项必不可少
                contentType : false,            //这一项必不可少
                processData : false,            //这一项必不可少
                success: function (res) {
                    console.log(JSON.stringify(res));
                    var downloadUrl=res.download_url;
                    var attachmentId=res.attachment_id;
                    alert("传上去了！download_url="+downloadUrl+"，attachment_id="+attachmentId);
                    downloadUrl="../../"+downloadUrl;
                    $("#video1").attr('src',downloadUrl);
                    $("#video1")[0].load();
                    //获取返回的图片url
                    img_urls=JSON.parse(res.img_urls)
                    img_urls=img_urls["img_urls"]
                    console.log(img_urls)
                    html=""
                    for(i in img_urls){
                        html+="<img src='"+img_urls[i]+"'>";
                    }
                    $("#illegal").html(html)

                    // $("#video2")[0].load();
                    // $("#download_url").html("download_url="+downloadUrl);
                    // $("#attachment_id").html("attachment_id="+attachmentId);
                    // $("#download_link").attr("href",downloadUrl);
                    // $("#download_link").html("【点击下载】");
                    $("#mask").attr("style","display:none;position: absolute;z-index: 1;width: 100%;height: 100%;");
                }
            });
        });
    });
</script>
</body>
</html>
