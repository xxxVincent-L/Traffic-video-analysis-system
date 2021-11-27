/**
 * Created by Administrator on 2016/8/4.
 */

//变量初始化
var rootDepartmentCode = 3;
var zTree, rMenu = $("#rMenu"), rUI = $("#rMenu ul"), clickId;
// var TYPE = $("#TYPE");
// var SKILL = $("#SKILL");
var currentID = "";
var first = true;

//初始化函数
function OnLoad() {
    //树方法
    Tree();
    //表格方法
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
                title: "部门",
                field: 'class',
                align: 'center',
                valign: 'middle'
            },
            {
                title: '姓名',
                field: 'sex',
                align: 'center',
                valign: 'middle'
            },
            {
                title: '职务',
                field: 'type',
                align: 'center'
            },
            {
                title: '内部电话',
                field: 'work',
                align: 'center'
            },
            {
                title: '移动电话',
                field: 'name',
                align: 'center',
                valign: 'middle'
            },
            {
                title: '邮箱地址',
                field: 'name',
                align: 'center',
                valign: 'middle'
            },
            {
                title: '操作',
                field: '',
                align: 'center',
                formatter: function (value, row) {
                    var e = '<button button="#" mce_href="#" onclick="editPerson(\'' + row.PERSONID + '\')">编辑</button> ';
                    var d = '<button button="#" mce_href="#" onclick="removePerson(\'' + row.PERSONID + '\')">删除</button> ';
                    return e + d;
                }
            }
        ]
    });
    getPersonToTable();
    // getTYPE();
    // getSKILL();
};

// //初始化部门下拉菜单
// function getTYPE() {
//     $.ajax({
//         url: '../Department/DepartmentList?departmentCode=' + rootDepartmentCode,
//         type: 'GET',
//         dataType: 'json',
//         success: function (data) {
//             var TYPEValue = data.data;
//             var TYPEItem = "<Option value = " + "-1" + ">" + "全部" + "</Option>";
//             for (var i = 0; i < TYPEValue.length; i++) {
//                 if (TYPEValue[i].PARENTCODE != 1) {
//                     TYPEItem += "<Option value = '" + TYPEValue[i].DPMENTCODE + "'>" + TYPEValue[i].DPMENTNAME + "</Option>"
//                 };
//             }
//             TYPE.html(TYPEItem)
//         },
//         error: function (err) {
//         }
//
//     })
// }
//
// //初始化等级下拉菜单
// function getSKILL() {
//     $.ajax({
//         url: '../Common/GetTechnologyLevelList',
//         type: 'GET',
//         dataType: 'json',
//         success: function (data) {
//             var SKILLValue = data.data;
//             var SKILLItem = "<Option value = " + "-1" + ">" + "全部" + "</Option>";
//             $("#SKILL").append(SKILLItem);
//             for (var i = 0; i < SKILLValue.length; i++) {
//                 var html = "<Option value = '" + SKILLValue[i].TECHNOLOGYLEVEL1 + "'>" + SKILLValue[i].NAME + "</Option>";
//                 $("#SKILL").append(html);
//             }
//         },
//         error: function (err) {
//         }
//
//     })
// }
// 点击字母查询
$(function () {
    $(".list_ul li").click(function () {
        getPersonToTable();

    })

})
// 输入名称后查询
$(function () {
    $("#user").keypress(
        function () {
            getPersonToTable();

        }
    )

})
//table表格数据初始化，查询操作
function getPersonToTable() {
    var user;
    var letter;
    if (first) {
        user = "";
        letter="";
        first = false;
    }
    else {
        user = $("#user").val();
        letter=$(".list_ul li").val();

    }
    //请求数据
    $.ajax({
        type: "GET",
        url: "../PersonManage/PersonList?NAME=" + user+"NAME=" + letter ,
        dataType: "json",
        success: function (result) {
            var tableData = result.data;
            $('#table').bootstrapTable('load', tableData);

        }
    });

}

//currentID值得返回函数
function getCurrentID() {
    return currentID;
}

//人员信息添加
function addPerson() {
    openlayer();
    currentID = "";
}

//人员信息编辑
function editPerson(id) {
    openlayer();
    currentID = id;
}

//人员删除
function removePerson(id) {
    var personId = id;
    $.ajax({
        url: '../PersonManage/DeletePerson?personID=' + personId,
        type: 'GET',
        dataType: 'json',
        success: function (data) {
            if (data.data) {
                alert("删除成功！")
                getPersonToTable();
            } else {
                alert("删除失败")
            }
        },
        error: function (err) {
        }
    });
}

//DOM树初始化setting设置
var setting = {
    data: {
        key: { name: "DPMENTNAME" },//zTree 节点数据保存节点名称的属性名称
        simpleData: {
            enable: true,//确定 zTree 初始化时的节点数据、异步加载时的节点数据、或 addNodes 方法中输入的 newNodes 数据是否采用简单数据模式 (Array)

            idKey: "DPMENTCODE",//节点数据中保存唯一标识的属性名称。[setting.data.simpleData.enable = true 时生效]
            pIdKey: "PARENTCODE",//节点数据中保存其父节点唯一标识的属性名称。[setting.data.simpleData.enable = true 时生效]
            rootPId: null//用于修正根节点父节点数据，即 pIdKey 指定的属性值。[setting.data.simpleData.enable = true 时生效]
        }
    },
    callback: {
        onRightClick: OnRightClick,
        onClick: OnClick
    }
};

//加载DOM树数据方法
function Tree() {
    $.ajax({
        type: "POST",
        url: '../Department/DepartmentList?departmentCode=' + rootDepartmentCode,
        dataType: "json",
        success: function (result) {
            if (result) {
                var nodes = result.data;
                $.fn.zTree.init($("#treeDemo"), setting, nodes);
                zTree = $.fn.zTree.getZTreeObj("treeDemo");
                zTree.expandAll(true);
            }
        }
    });
}

//rRMenu弹框显示方法
function OnRightClick(event, treeId, treeNode) {
    if (!treeNode && event.target.tagName.toLowerCase() != "button" && $(event.target).parents("a").length == 0) {
        zTree.cancelSelectedNode();
        showRMenu("root", event.clientX, event.clientY);
    } else if (treeNode && !treeNode.noR) {
        zTree.selectNode(treeNode);
        showRMenu("node", event.clientX, event.clientY);
    }
}
function showRMenu(type, x, y) {
    $("#rMenu ul").show();
    if (type == "root") {
        $("#rMenu ul").hide();
    } else {
        $("#m_del").show();
        $("#m_check").show();
        $("#m_uncheck").show();
    }
    rMenu.css({ "top": y + "px", "left": x + "px", "visibility": "visible" });   
}

//增加树节点操作
function addtreenode() {
    var nodes = zTree.getSelectedNodes()[0];
    var addid = -1;
    var addpid = nodes.DPMENTCODE;
    var addname = $("#add_input").val();
    $("#add_input").val("");
    var newnode = { DPMENTNAME: addname };
        $.ajax({
            type: "POST",
            url: "../department/adddepartment",
            data:{
                DPMENTCODE:addid,
                DPMENTNAME:addname,
                PARENTCODE:addpid,
                DPNOTE:""
            },
            datatype: "json",
            success: function (result) {
                var msg = "保存成功！";
                if (confirm(msg) == true) {
                    Tree();
                    getTYPE();
                }
            },
            error: function (err) {
            }
        })

}

//树节点增加弹框
function openlayer5(id) {
    rMenu.css({ "visibility": "hidden" });
    var dialog = art.dialog();
    dialog.title('添加名称');
    dialog.lock(true);
    dialog.content(document.getElementById("dialog-confirm"));
    $("#cancer").click(function () {
        dialog.close();
    });
    $("#tree_add").click(function () {
        dialog.close();
    });
}

//删除树节点操作
function removetreenode() {
        rMenu.css({ "visibility": "hidden" });
        var nodes = zTree.getSelectedNodes();
        var removeId = nodes[0].DPMENTCODE;
            var msg = "是否要删除该节点。\n\n请确认！";
            if (confirm(msg)) {
                $.ajax({
                    type: "post",
                    url: "../Department/DeleteDepartment?departmentCode=" + removeId,
                    datatype: "json",
                    success: function (result) {
                        if (result.data == true) {
                            alert("删除成功！");
                            Tree();
                            getTYPE();
                        }
                        else {
                            alert("删除失败！");
                        }
                    }

                });
            }
        
    }

//DOM树点击操作，显示部门人员信息
function OnClick(event, treeId, treeNode) {
    var onclickId = treeNode.DPMENTCODE;
    $.ajax({
        type: "GET",
        url: "../PersonManage/PersonList?NAME=&DEPARTMENTCODE="+onclickId+"&TECHNOLOGYLEVEL=-1",
        dataType: "json",
        success: function (data) {
            var tableData = data.data;
            $('#table').bootstrapTable('load', tableData);
        },
        error: function (err) {

        }
    })



}

//添加，编辑弹出框
function openlayer(id){
    layer.open({
        type: 2,
        title: '添加信息',
        shadeClose: true,
        shade: 0.5,
        skin: 'layui-layer-rim',
//            maxmin: true,
        closeBtn:2,
        area: ['90%', '98%'],
        shadeClose: true,
        closeBtn: 2,
        content: 'mailList_tail.html'
        //iframe的url
    });
}





