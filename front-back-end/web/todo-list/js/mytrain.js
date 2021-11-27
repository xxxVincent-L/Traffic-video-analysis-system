/**
 * Created by Administrator on 2016/8/4.
 */

var name, person, currentID, time, flag = true;
function Trainload() {
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
                title: '培训名称',
                field: 'sex',
                align: 'center',
                valign: 'middle'
            },
            {
                title: '主讲人',
                field: 'type',
                align: 'center'
            },
            {
                title: '开始时间',
                field: 'name',
                align: 'center',
                valign: 'middle'
            },
            {
                title: '结束时间',
                field: 'name',
                align: 'center',
                valign: 'middle'
            },
            {
                title: '参加人',
                field: 'name',
                align: 'center',
                valign: 'middle'
            },
            {
                title: '培训地点',
                field: 'name',
                align: 'center',
                valign: 'middle'
            },
            {
                title: '成绩',
                field: 'work',
                align: 'center'
            },
           
            {
                title: '操作',
                field: '',
                align: 'center',
                formatter: function (value, row) {
                    var e = '<button button="#" mce_href="#" onclick="edit(\'' + row.WORKRECORDID + '\')">查看详情</button> '

                    return e ;
                }
            }
        ]
    });
    getData();
}
function getData() {
    if (flag) {
        name = "";
        person= "";
        time = "";
        flag = false;
    } else {
        person = $("#person").val();
        name = $("#name").val();
        time = $("#demo").val();
    }
    $.ajax({
        type: "GET",
        url: "../WorkRecord/SearchWork?dtStart=" + person + "&dtEnd=" + type + "&dtEnd=" +time,
        dataType: "json",
        success: function (result) {
            if (result.data) {
                var TableData = result.data;
                $('#table').bootstrapTable("load", TableData);
            }
        }
    })
}
//初始化状态下拉菜单
function getType() {
    $.ajax({
        url: '../Common/GetPhaseList',
        type: 'GET',
        dataType: 'json',
        success: function (data) {
            var PHASEValue = data.data;
            if (PHASEValue.length > 0) {
                $("#part").html("");
                for (var i = 0; i < PHASEValue.length; i++) {
                    if (TASKPHASE == PHASEValue[i].ID) {
                        var html = "<Option value = '" + PHASEValue[i].ID + "'  selected = 'true'>" + PHASEValue[i].NAME + "</Option>";
                    } else {
                        var html = "<Option value = '" + PHASEValue[i].ID + "'>" + PHASEValue[i].NAME + "</Option>";
                    };
                    $("#part").append(html);
                }
            }


        },
        error: function (err) {
        }

    })
}
function add() {
    openlayer()
    currentID = "";
}
function edit(id) {
    openlayer()
    currentID = id;
}
function out(id) {
    alert(id)
    var Id = id;
    $.ajax({
        url: '../WorkRecord/DeleteWork?workId=' + Id,
        type: 'GET',
        dataType: 'json',
        success: function (data) {
            if (data.data) {
                alert("导出成功！")
               // getData();
            } else {
                alert("导出失败")
            }
        },
        error: function (err) {
        }
    });
}
function getCurrentID() {
    return currentID;
}
function openlayer(id){
    layer.open({
        type: 2,
        title: '添加信息',
        shadeClose: true,
        shade: 0.5,
        skin: 'layui-layer-rim',
//            maxmin: true,
        closeBtn:1,
        area: ['90%', '98%'],
        shadeClose: true,
        closeBtn: 1,
        content: 'train_tail01.html'
        //iframe的url
    });
}





