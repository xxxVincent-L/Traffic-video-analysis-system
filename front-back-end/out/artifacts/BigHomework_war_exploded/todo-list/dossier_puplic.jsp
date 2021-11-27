<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>个人档案</title>
    <link rel="stylesheet" href="css/info-mgt.css" />
    <link rel="stylesheet" href="css/base.css" />
    <style>
        *{margin: 0;padding: 0}
        .l_left{float: left}
        .clear{clear: both}
        a{text-decoration: none}
        .title{  background:url(images/righttitlebig.png) repeat-x; border:1px solid #c1d3de; overflow:visible;}
        .title h2{line-height:33px; margin-left:7px; padding-left:22px; font-weight:bold; font-size:14px; font-family:'宋体'; color:#000000; background:url(images/titleico.png) no-repeat left center;}
        .resource{border: 1px #c1d3de solid;border-top: none}
        .resource_main_top .resource_box{width: 10%;height: 130px;margin:0 1%;box-sizing: border-box}
        .resource_box a{display: block;width: 100%;height: 100%;cursor: pointer;border: 2px #ccc solid;box-shadow: 4px 4px 5px rgba(182,185,187,0.6)}
        .resource_box a:hover{color:#c1d3de;border: 2px #c1d3de solid ;box-shadow: 4px 4px 5px rgba(193,211,222,0.8)}
        .resource_main_top{padding: 20px 0}
        .img_div{
            width: 100%;

        }
        .img_div img{
            width: 100%;
            height: 100px;

        }
        .img_p{
            /*width: 100%;*/
            text-align: center;
        }
        .img_p ul{list-style: none;text-align: center}
        .img_p ul li{display:inline-block;padding-left: 5px;
            padding-right: 5px;
        }
    </style>
</head>
<body onload="change()" onresize="change()">
<div class="title"><h2>公共档案</h2></div>
<div class="table-operate ue-clear">
    <a href="#" class="add"  onclick="openlayer()" id="addPup">添加</a>
    <a href="javascript:;" class="del">删除</a>

</div>
<div class="resource">
    <div class="resource_main">
        <div class="resource_main_top">
            <div class="l_left resource_box"><a href="myfile_data.jsp" target="right">
                <div class="img_div">
                    <img src="images/myflie.png"/>
                </div>
                <p style="text-align: center;font-weight: bold">项目文档</p>

            </a>
            </div>
            <div class="l_left resource_box"><a href="myfile_data.jsp" target="right">
                <div class="img_div">
                    <img src="images/myflie.png"/>
                </div>
                <p style="text-align: center;font-weight: bold">常用工具</p>

            </a>
            </div>
            <div class="l_left resource_box"><a href="myfile_data.jsp" target="right">
                <div class="img_div">
                    <img src="images/myflie.png"/>
                </div>
                <p style="text-align: center;font-weight: bold">公司制度</p>

            </a>
            </div>



        </div>



    </div>
</div>
<div class="pup_div01" id="pup01">
    <h5 class="h_style01">添加信息</h5>
    <p><label class="label01">文件名称：</label><i class="i_start"></i> <input type="text" placeholder="请输入项目名称" class="pup_input"/></p>
    <p><label class="label01">项目类型：</label><i class="i_start"></i> <select>
        <option>请选择类型</option>
    </select></p>
    <p><label class="label01">上传图片：</label><i class="i_start"></i> <input type="file" /></p>
    <p><label class="label01">是否有效：</label><a class="radio_a">有效</a><input type="radio" class="radio_input" name="select01" checked="checked"/><a class="radio_a"style="margin-left: 15px;">无效</a><input type="radio" class="radio_input" name="select01"/></p>
    <p><label class="label01 note_label">备注：</label><textarea class="textarea01"></textarea></p>
    <div class="p_line">
        <p class="p_but"><input type="button" value="保存" class="save_but"/><input type="button" value="关闭" class="close_but" id="close01"/></p>
    </div>

</div>
</body>
<script type="text/javascript" src="js/jquery.js"></script>
<script>
    function change() {
        var height = $(document).height();
        $(".resource").css("height", height - 36 + "px");
    }
</script>
<script>
    $(function () {
        $("#addPup").click(function () {
            $("#pup01").show();


        })
        $("#close01").click(function () {
            $("#pup01").hide();

        })

    })
</script>
</html>