/**
 * Created by Administrator on 2016/8/4.
 */

var recodeTitle, Publisher, currentID, recodeTime, flag = true;
function Recodeload() {
    $(function () {
        $('#table').bootstrapTable({
            method: "get",
            striped: true,
            singleSelect: false,

            dataType: "json",
            pagination: true, //分页
            pageSize: 10,
            pageNumber: 1,
            search: false, //显示搜索框
            contentType: "application/x-www-form-urlencoded",
            queryParams: null,
            columns: [
                {
                    checkbox:"true",
                    field: 'ID',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    title: "编号",
                    field: 'class',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    title: '任务名称',
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
                    title: '发布时间',
                    field: 'name',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    title: '执行时间',
                    field: 'name',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    title: '发布内容',
                    field: 'work',
                    align: 'center'
                },
                {
                    title: '操作',
                    field: 'id',
                    align: 'center',
                    formatter: function (value, row) {
                        var e = '<button button="#" mce_href="#" onclick="editRecode(\'' + row.WORKRECORDID + '\')">查看</button> ';


                        return e;
                    }
                }
            ]
        });
    });
   getRecodeTableData();
}
function getRecodeTableData() {
    if (flag) {
        recodeTitle = "";
        Publisher = "";
        recodeTime = "";
        flag = false;
    } else {
        recodeTitle = $("#name").val();
        Publisher = $("#person").val();
        recodeTime  = $("#demo").val();
    }
    $.ajax({
        type: "GET",
        url: "../WorkRecord/SearchWork?dtStart=" +recodeTitle  + "&dtEnd=" + Publisher + "&dtEnd=" +  recodeTime,
        dataType: "json",
        success: function (result) {
            if (result.data) {
                var RccodeTableData = result.data;
                $('#table').bootstrapTable("load", RccodeTableData);
            }
        }
    })
}
// function addRecode() {
//     openlayer()
//     currentID = "";
// }
function editRecode(id) {
    openlayer()
    currentID = id;
}
function outRecode(id) {
    alert(id)
    var RecodeId = id;
    $.ajax({
        url: '../WorkRecord/DeleteWork?workId=' + RecodeId,
        type: 'GET',
        dataType: 'json',
        success: function (data) {
            if (data.data) {
                alert("下载成功！")
                // getRecodeTableData();
            } else {
                alert("下载失败")
            }
        },
        error: function (err) {
        }
    });
}
function getCurrentID() {
    return currentID;
}
function openlayer() {
    layer.open({
        type: 2,
        title: '任务信息',
        shadeClose: true,
        shade: 0.5,
        skin: 'layui-layer-rim',
        closeBtn: 2,
        area: ['98%', '98%'],
        shadeClose: true,
        closeBtn: 2,
        content:" recode_tail.html"

    });
    
}





