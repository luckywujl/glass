define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'base/specification/index' + location.search,
                    add_url: 'base/specification/add',
                    edit_url: 'base/specification/edit',
                    del_url: 'base/specification/del',
                    //multi_url: 'base/specification/multi',
                    import_url: 'base/specification/import',
                    table: 'base_specification',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'specification_id',
                sortName: 'specification_id',
                columns: [
                    [
                        {checkbox: true},
                        //{field: 'specification_id', title: __('Specification_id')},
                        {field: 'specification_name', title: __('Specification_name'), operate: 'LIKE'},
                        //{field: 'company_id', title: __('Company_id'), operate: 'LIKE'},
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
            }
        }
    };
    return Controller;
});