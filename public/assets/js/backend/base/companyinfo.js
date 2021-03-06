define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'base/companyinfo/index' + location.search,
                    add_url: 'base/companyinfo/add',
                    edit_url: 'base/companyinfo/edit',
                    del_url: 'base/companyinfo/del',
                    multi_url: 'base/companyinfo/multi',
                    import_url: 'base/companyinfo/import',
                    table: 'base_companyinfo',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'companyinfo_id',
                sortName: 'companyinfo_id',
                columns: [
                    [
                        {checkbox: true},
                        //{field: 'companyinfo_id', title: __('Companyinfo_id')},
                        {field: 'companyinfo', title: __('Companyinfo'), operate: 'LIKE'},
                        {field: 'companyinfo_tel', title: __('Companyinfo_tel'), operate: 'LIKE'},
                        {field: 'companyinfo_address', title: __('Companyinfo_address'), operate: 'LIKE'},
                        {field: 'companyinfo_websit', title: __('Companyinfo_websit'), operate: 'LIKE'},
                        {field: 'company_remark', title: __('Company_remark'), operate: 'LIKE'},
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