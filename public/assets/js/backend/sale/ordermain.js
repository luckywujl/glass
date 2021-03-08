define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'sale/ordermain/index' + location.search,
                    add_url: 'sale/ordermain/add',
                    edit_url: 'sale/ordermain/edit',
                    del_url: 'sale/ordermain/del',
                    multi_url: 'sale/ordermain/multi',
                    import_url: 'sale/ordermain/import',
                    table: 'order_main',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'order_id',
                sortName: 'order_id',
                columns: [
                    [
                        {checkbox: true},
                        {field: 'order_id', title: __('Order_id')},
                        {field: 'order_code', title: __('Order_code'), operate: 'LIKE'},
                        {field: 'order_datetime', title: __('Order_datetime'), operate:'RANGE', addclass:'datetimerange', autocomplete:false, formatter: Table.api.formatter.datetime},
                        {field: 'order_delivery_date', title: __('Order_delivery_date'), operate:'RANGE', addclass:'datetimerange', autocomplete:false},
                        {field: 'order_custom_id', title: __('Order_custom_id')},
                        {field: 'order_custom_name', title: __('Order_custom_name'), operate: 'LIKE'},
                        {field: 'order_custom_contact', title: __('Order_custom_contact'), operate: 'LIKE'},
                        {field: 'order_custom_tel', title: __('Order_custom_tel'), operate: 'LIKE'},
                        {field: 'order_custom_address', title: __('Order_custom_address'), operate: 'LIKE'},
                        {field: 'order_custom_discount', title: __('Order_custom_discount'), operate:'BETWEEN'},
                        {field: 'order_number_total', title: __('Order_number_total'), operate:'BETWEEN'},
                        {field: 'order_area_total', title: __('Order_area_total'), operate:'BETWEEN'},
                        {field: 'order_length_total', title: __('Order_length_total'), operate:'BETWEEN'},
                        {field: 'order_hole_total', title: __('Order_hole_total')},
                        {field: 'order_amount_total', title: __('Order_amount_total'), operate:'BETWEEN'},
                        {field: 'order_receiver', title: __('Order_receiver'), operate: 'LIKE'},
                        {field: 'order_saleman', title: __('Order_saleman'), operate: 'LIKE'},
                        {field: 'order_operator', title: __('Order_operator'), operate: 'LIKE'},
                        {field: 'order_checker', title: __('Order_checker'), operate: 'LIKE'},
                        {field: 'order_dispatcher', title: __('Order_dispatcher'), operate: 'LIKE'},
                        {field: 'order_freight_type', title: __('Order_freight_type'), searchList: {"0":__('Order_freight_type 0'),"1":__('Order_freight_type 1')}, formatter: Table.api.formatter.normal},
                        {field: 'order_isdelivery', title: __('Order_isdelivery'), searchList: {"0":__('Order_isdelivery 0'),"1":__('Order_isdelivery 1')}, formatter: Table.api.formatter.normal},
                        {field: 'order_status', title: __('Order_status'), searchList: {"0":__('Order_status 0'),"1":__('Order_status 1'),"2":__('Order_status 2'),"3":__('Order_status 3'),"4":__('Order_status 4')}, formatter: Table.api.formatter.status},
                        {field: 'company_id', title: __('Company_id'), operate: 'LIKE'},
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