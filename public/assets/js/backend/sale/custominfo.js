define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'sale/custominfo/index' + location.search,
                    add_url: 'sale/custominfo/add',
                    edit_url: 'sale/custominfo/edit',
                    del_url: 'sale/custominfo/del',
                    //multi_url: 'sale/custominfo/multi',
                    import_url: 'sale/custominfo/import',
                    table: 'custom_info',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'custom_id',
                sortName: 'custom_id',
                columns: [
                    [
                        {checkbox: true},
                        //{field: 'custom_id', title: __('Custom_id')},
                        {field: 'custom_code', title: __('Custom_code'), operate: 'LIKE'},
                        {field: 'custom_name', title: __('Custom_name'), operate: 'LIKE'},
                        {field: 'custom_type', title: __('Custom_type'), operate: 'LIKE'},
                        {field: 'custom_tel', title: __('Custom_tel'), operate: 'LIKE'},
                        {field: 'custom_contact', title: __('Custom_contact'), operate: 'LIKE'},
                        {field: 'custom_address', title: __('Custom_address'), operate: 'LIKE'},
                        {field: 'custom_discount', title: __('Custom_discount'), operate:'BETWEEN'},
                        {field: 'custom_payable_total', title: __('Custom_payable_total'), operate:'BETWEEN'},
                        {field: 'custom_sale_total', title: __('Custom_sale_total'), operate:'BETWEEN'},
                        {field: 'custom_payment_total', title: __('Custom_payment_total'), operate:'BETWEEN'},
                        {field: 'custom_remark', title: __('Custom_remark'), operate: 'LIKE'},
                        {field: 'custom_status', title: __('Custom_status'), searchList: {"0":__('Custom_status 0'),"1":__('Custom_status 1')}, formatter: Table.api.formatter.status},
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