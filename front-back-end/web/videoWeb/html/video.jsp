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
        <div style="display:none;position: absolute;z-index: 1;width: 100%;height: 100%;" id="mask">
            <div style="margin:auto;background-color: black;color: aliceblue;"><h1>视频在处理中，请稍后</h1></div>

        </div>
        <div class="video_1">

            <video id="video1"width="100%" height="100%">
                <source src="" type='video/webm'/>
            </video>
        </div>
        <div class="video_2">
            <button onclick="play_all()">播放</button>
            <button onclick="pause_all()">暂停</button>
            <input type="file" id="input_file" name="input_file" accept=".mp4,.webm,.avi">
            <button id="upload_button">上传文件</button>
            <!-- <video id="video2" width="100%" height="100%">
                <source src="" type="video/webm">
            </video> -->
            <div id="illegal"style="width:100%;height:100%;overflow: scroll;"></div>

        </div>


    </div>

</div>


<script src="../js/jquery.js" ></script>
<script src="../js/jquery.ztree.core-3.5.js" ></script>
<script src="../js/jquery.ztree.excheck-3.5.js" ></script>
<script src="../js/ztree_d.js" ></script>
<script>
    function play_all(){
        document.getElementById("video1").play();
    }
    function pause_all(){
        document.getElementById("video1").pause();
    }
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