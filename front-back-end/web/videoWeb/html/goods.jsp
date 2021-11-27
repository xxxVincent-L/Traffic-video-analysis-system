<%--
  Created by IntelliJ IDEA.
  User: 12550
  Date: 2021/11/23
  Time: 13:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>top</title>
    <link href="../css/style.css" rel="stylesheet" type="text/css" />
    <link href="../js/bstable/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="../js/bstable/css/bootstrap-table.css" rel="stylesheet" type="text/css">




    <style type="text/css">




    </style>
</head>

<body >
<div class="div_find">
    <p class="find_p">
        <label class="label_width">视频名称：</label><input type="text" class="find_input"/>
        <label class="label_width">视频类型：</label><select class="find_input">
        <option>全部</option>
        <option>类型一</option>
        <option>类型一</option>
    </select>
        <label class="label_width">上传时间：</label><input type="text" class="find_input" id="demo"/>
        <label class="label_width">上传人姓名：</label><input type="text" class="find_input"/>
        <input type="button" value="查找" class="find_but"/>
        <span class="find_span"><i class="i_open"></i> <a href="#" >展开</a> </span>
        <span class="find_span1"><i class="i_close"></i> <a href="#" >收起</a> </span>
    </p>
    <p class="find_p" id="open" style="display: none">
        <label class="label_width">视频编号：</label><input type="text" class="find_input"/>
        <label class="label_width">视频格式：</label><select class="find_input">
        <option>全部</option>
        <option>类型一</option>
        <option>类型一</option>
    </select>
        <label class="label_width">上传部门：</label><select class="find_input">
        <option>全部</option>
        <option>类型一</option>
        <option>类型一</option>
    </select>
        <label class="label_width">视频来源：</label><input type="text" class="find_input"/>
    </p>
</div>
<div class="div_table">
    <p><span class="table_span"><i class="i_table"></i> <a href="#">下载</a> </span></p>
    <p>
    <table data-url="json/data_alae_list.json" id="table" class="table_style" style="margin: 0 auto" >
    </table>
    </p>
</div>


<script src="../js/jquery.js" ></script>
<script src="../js/date/js/laydate.js"></script>
<script src="../js/bstable/js/bootstrap.min.js"></script>
<script src="../js/bstable/js/bootstrap-table.js"></script>
<script src="../js/bstable/js/bootstrap-table-zh-CN.min.js"></script>
<script>
    !function(){
        laydate.skin('danlan');//切换皮肤，请查看skins下面皮肤库
        laydate({elem: '#demo'});
        laydate({elem: '#demo1'});//绑定元素
    }();
</script>
<script>
    $(function () {
        $(".find_span").click(function () {
            $("#open").show();
            $(this).hide();
            $(".find_span1").show();

        })
        $(".find_span1").click(function () {
            $("#open").hide();
            $(this).hide();
            $(".find_span").show();

        })

    })
</script>
<script type="text/javascript">
    $(function () {
        $('#table').bootstrapTable({
            method: "get",
            striped: true,
            singleSelect: false,
            url: "../json/order.json",
            dataType: "json",
            pagination: true, //分页
            pageSize: 10,
            pageNumber: 1,
            search: false, //显示搜索框
            contentType: "application/x-www-form-urlencoded",
            queryParams: null,
            columns: [
                {
                    checkbox: "true",
                    field: 'check',
                    align: 'center',
                    valign: 'middle'
                }
                ,
                {
                    title: "编号",
                    field: 'id',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    title: '名称',
                    field: 'title',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    title: '位置',
                    field: 'lation',
                    align: 'center'
                },
                {
                    title: '安装时间',
                    field: 'time',
                    align: 'center'
                },
                {
                    title: '状态',
                    field: 'sale',
                    align: 'center'
                },
                {
                    title: '设置类型',
                    field: 'type',
                    align: 'center'
                },
                {
                    title: '联系人',
                    field: 'name',
                    align: 'center'
                },
                {
                    title: '联系电话',
                    field: 'tele',
                    align: 'center'
                },



                {
                    title: '操作',
                    field: 'opear',
                    align: 'center',
                    formatter: function (value, row) {
                        var e = '<a  href="#" title="回放" onclick="handleEvent(\'' + row.id + '\')"><img src="../img/look.png"/> </a> ';
                        var d = '<a href="#" title="下载" onclick="edit(\'' + row.id + '\')"><img src="../img/9.png" /></a> ';

                        return e + d ;
                    }
                }
            ]
        });
    })
    function edits(id){

        $(".input_div2").show();

    }
</script>
</body>
</html>
