define(['jquery', 'bootstrap', 'backend', 'table', 'form','print-editor'], function ($, undefined, Backend, Table, Form,undefined) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'ezprint/printing/index' + location.search,
                    add_url: 'ezprint/printing/add',
                    edit_url: 'ezprint/printing/edit',
                    del_url: 'ezprint/printing/del',
                    multi_url: 'ezprint/printing/multi',
                    table: 'print',
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
                        {field: 'createtime', title: __('Createtime'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'updatetime', title: __('Updatetime'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'operate', title: __('Operate'), table: table, events: Table.api.events.operate, formatter: Table.api.formatter.operate}
                    ]
                ]
            });

            // 为表格绑定事件
            Table.api.bindevent(table);
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
                $("#c-content").summernote({
                    height: 300,
                });

            }
        }
    };
    return Controller;
});