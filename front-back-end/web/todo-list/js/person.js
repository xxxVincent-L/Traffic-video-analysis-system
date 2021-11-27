/**
 * Created by Administrator on 2016/8/4.
 */

var user, role, currentID, flag = true;
function Personload() {
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
                title: "用户名",
                field: 'class',
                align: 'center',
                valign: 'middle'
            },
            {
                title: '角色',
                field: 'sex',
                align: 'center',
                valign: 'middle'
            },
            {
                title: '部门',
                field: 'type',
                align: 'center'
            },
            {
                title: '密码',
                field: 'work',
                align: 'center'
            },
            {
                title: '状态',
                field: 'name',
                align: 'center',
                valign: 'middle'
            },
           
            {
                title: '操作',
                field: '',
                align: 'center',
                formatter: function (value, row) {
                    var e = '<button button="#" mce_href="#" onclick="delNotice(\'' + row.WORKRECORDID + '\')">删除</button> '
                    var d = '<button button="#" mce_href="#" onclick="editNotice(\'' + row.WORKRECORDID + '\')">编辑</button> ';
                    return e + d;
                }
            }
        ]
    });
    getData();
}
function getData() {
    if (flag) {
        user = "";
        role = "";

        flag = false;
    } else {
        user = $("#user").val();
        role = $("#role").val();

    }
    $.ajax({
        type: "GET",
        url: "../WorkRecord/SearchWork?dtStart=" + user + "&dtEnd=" + role ,
        dataType: "json",
        success: function (result) {
            if (result.data) {
                var TableData = result.data;
                $('#table').bootstrapTable("load", TableData);
            }
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
    var NoticeId = id;
    $.ajax({
        url: '../WorkRecord/DeleteWork?workId=' + NoticeId,
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
        closeBtn:2,
        area: ['80%', '90%'],
        shadeClose: true,
        closeBtn: 2,
        content: 'person_tail.html'
        //iframe的url
    });
}





