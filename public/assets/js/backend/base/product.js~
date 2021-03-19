define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'base/product/index' + location.search,
                    add_url: 'base/product/add',
                    edit_url: 'base/product/edit',
                    del_url: 'base/product/del',
                    //multi_url: 'base/product/multi',
                    import_url: 'base/product/import',
                    table: 'base_product',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'product_id',
                sortName: 'product_id',
                columns: [
                    [
                        {checkbox: true},
                        //{field: 'product_id', title: __('Product_id')},
                        {field: 'product_name', title: __('Product_name'), operate: 'LIKE'},
                        {field: 'product_specs', title: __('Product_specs'), operate: 'LIKE'},
                        {field: 'product_price', title: __('Product_price'), operate:'BETWEEN'},
                        {field: 'product_lprice', title: __('Product_lprice'), operate:'BETWEEN'},
                        {field: 'product_radix', title: __('Product_radix')},
                        {field: 'product_remark', title: __('Product_remark'), operate: 'LIKE'},
                        {field: 'product_status', title: __('Product_status'), searchList: {"0":__('Product_status 0'),"1":__('Product_status 1')}, formatter: Table.api.formatter.status},
                        //{field: 'company_id', title: __('Company_id')},
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