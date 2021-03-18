define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'base/personnel/index' + location.search,
                    add_url: 'base/personnel/add',
                    edit_url: 'base/personnel/edit',
                    del_url: 'base/personnel/del',
                   // multi_url: 'base/personnel/multi',
                    import_url: 'base/personnel/import',
                    table: 'base_personnel',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'personnen_id',
                sortName: 'personnen_id',
                columns: [
                    [
                        {checkbox: true},
                        //{field: 'personnen_id', title: __('Personnen_id')},
                        {field: 'personnel_code', title: __('Personnel_code'), operate: 'LIKE'},
                        {field: 'personnel_name', title: __('Personnel_name'), operate: 'LIKE'},
                        {field: 'personnel_sex', title: __('Personnel_sex'), searchList: {"0":__('Personnel_sex 0'),"1":__('Personnel_sex 1')}, formatter: Table.api.formatter.normal},
                        {field: 'personnel_tel', title: __('Personnel_tel'), operate: 'LIKE'},
                        {field: 'personnel_processes', title: __('Personnel_processes'), operate: 'LIKE'},
                        {field: 'personnel_status', title: __('Personnel_status'), searchList: {"0":__('Personnel_status 0'),"1":__('Personnel_status 1')}, formatter: Table.api.formatter.status},
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