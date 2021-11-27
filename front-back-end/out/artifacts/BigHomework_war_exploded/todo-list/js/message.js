/**
 * Created by Administrator on 2016/8/4.
 */

var tit, person, currentID, time, flag = true;
function Mesload() {
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
                title: '消息标题',
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
                title: '发送时间',
                field: 'name',
                align: 'center',
                valign: 'middle'
            },
            {
                title: '推送对象',
                field: 'name',
                align: 'center',
                valign: 'middle'
            },
            {
                title: '是否自动推送',
                field: 'name',
                align: 'center',
                valign: 'middle'
            },
            {
                title: '推送内容',
                field: 'work',
                align: 'center'
            },
           
            {
                title: '操作',
                field: '',
                align: 'center',
                formatter: function (value, row) {
                    var e = '<button button="#" mce_href="#" onclick="del(\'' + row.WORKRECORDID + '\')">删除</button> '
                    var d = '<button button="#" mce_href="#" onclick="edit(\'' + row.WORKRECORDID + '\')">编辑</button> ';
                    return e + d;
                }
            }
        ]
    });
    getData();
}
function getData() {
    if (flag) {
        tit = "";
        person= "";
        time = "";
        flag = false;
    } else {
        person = $("#person").val();
        tit = $("#tit").val();
        time = $("#demo").val();
    }
    $.ajax({
        type: "GET",
        url: "../WorkRecord/SearchWork?dtStart=" + person + "&dtEnd=" + tit + "&dtEnd=" +time,
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
function del(id) {
    alert(id)
    var Id = id;
    $.ajax({
        url: '../WorkRecord/DeleteWork?workId=' + Id,
        type: 'GET',
        dataType: 'json',
        success: function (data) {
            if (data.data) {
                alert("删除成功！")
               getData();
            } else {
                alert("删除失败")
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
        area: ['98%', '90%'],
        shadeClose: true,
        closeBtn: 1,
        content: 'mesage_tail.html'
        //iframe的url
    });
}





