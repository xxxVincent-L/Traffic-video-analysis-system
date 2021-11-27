/**
 * Created by Administrator on 2016/12/21.
 */

    $(function () {




        $('#table2').bootstrapTable({
            method: "get",
            striped: true,
            singleSelect: false,
            url: "../json/data_alae_list.json",
            dataType: "json",
            toolbar: '#toolbar',
            pagination: false, //分页
            pageSize: 4,
            showRefresh: false,
            showToggle:false,
            pageNumber: 1,
            search: false, //显示搜索框
            contentType: "application/x-www-form-urlencoded",
            queryParams: null,
            columns: [
                {
                    title: "编号",
                    field: 'id',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    title: '类型',
                    field: 'type',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    title: '名称',
                    field: 'statice',
                    align: 'center'
                },
                {
                    title: '内容',
                    field: 'location',
                    align: 'center'
                },
                {
                    title: '创建时间',
                    field: 'time',
                    align: 'center'
                },
                {
                    title: '提交人',
                    field: 'peop',
                    align: 'center'
                },
                {
                    title: '概述',
                    field: 'content',
                    align: 'center'
                },
                {
                    title: '操作',
                    field: 'oper',
                    align: 'center',
                    formatter: function (value, row) {
                        var e = '<a href="#"  title="查看" onclick="handleEvent(\'' + row.id + '\')"><img src="../img/1_close.png"/> </a> ';


                        return e ;
                    }
                }
            ]

        });
    })

function handleEvent(id){
    this.location.href="alam_handle.html";

}










