define(['jquery', 'bootstrap', 'backend', 'table', 'form','printing'], function ($, undefined, Backend, Table, Form,Printing) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'ezprint/example/index' + location.search,
                    add_url: 'ezprint/example/add',
                    edit_url: 'ezprint/example/edit',
                    del_url: 'ezprint/example/del',
                    multi_url: 'ezprint/example/multi',
                    table: 'print_example',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'id',
                columns: [
                    [
                        {checkbox: true},
                        {field: 'id', title: __('Id')},
                        {field: 'code', title: __('Code')},
                        {field: 'name', title: __('Name')},
                        {field: 'email', title: __('Email')},
                        {field: 'createtime', title: __('Createtime'), operate:'RANGE', formatter: Table.api.formatter.datetime,addclass:'datetimerange'},
                        {field: 'operate', title: __('Operate'), table: table, events: Table.api.events.operate, formatter: Table.api.formatter.operate}
                    ]
                ]
            });

            // 为表格绑定事件
            Table.api.bindevent(table);
            Controller.api.bindpirnt();
        },
        add: function () {
            Controller.api.bindevent();
        },
        edit: function () {
            Controller.api.bindevent();
        },
        api: {
            bindevent: function () {
                Form.api.bindevent($("form[role=form]"));               
            },
            bindpirnt:function(){
                $("#printSelect").click(function(){
                    var rows = $("#table").bootstrapTable('getSelections');
                    if(rows.length<1){
                       alert('请选择一条记录!');
                       return;
                    }
                    var options ={
                        templateCode:'list',
                        data:{
                            nickname:'老徐',
                            email:'381040327@qq.com'
                        },
                        list:rows //这里list对应sourcetable的id
                    };
                    Printing.api.printTemplate(options);
                })
                $("#printAll").click(function(){
                    $.ajax({
                        url: "ezprint/example/getAllData",
                        type: 'post',
                        dataType: 'json',
                        data: {},
                        success: function (ret) {
                            var options ={
                                templateCode:'list',
                                data:{
                                    nickname:'老徐',
                                    email:'381040327@qq.com'
                                },
                                list:ret.rows //这里list对应sourcetable的id
                            };
                            Printing.api.printTemplate(options);
                        }, error: function (e) {
                            Backend.api.toastr.error(e.message);
                        }
                    });
                    
                })
                $("#printHeTong").click(function(){
                    $.ajax({
                        url: "ezprint/example/heTong",
                        type: 'post',
                        dataType: 'json',
                        data: {},
                        success: function (ret) {
                            var options ={
                                templateCode:'hetong',
                                data:ret.data,
                            };
                            Printing.api.printTemplate(options);
                        }, error: function (e) {
                            Backend.api.toastr.error(e.message);
                        }
                    });
                    
                })
            }
        }
    };
    return Controller;
});