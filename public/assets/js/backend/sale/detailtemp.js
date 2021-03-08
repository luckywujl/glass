define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
    	
        index: function () {
        	Controller.api.bindevent();
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'sale/detailtemp/index' + location.search,
                    add_url: 'sale/detailtemp/add',
                    edit_url: 'sale/detailtemp/edit',
                    del_url: 'sale/detailtemp/del',
                    multi_url: 'sale/detailtemp/multi',
                    import_url: 'sale/detailtemp/import',
                    table: 'order_detail_temp',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'detail_id',
                sortName: 'detail_id',
                columns: [
                    [
                        {checkbox: true},
                        {field: 'detail_id', title: __('Detail_id')},
                        {field: 'order_id', title: __('Order_id')},
                        {field: 'detail_order_code', title: __('Detail_order_code'), operate: 'LIKE'},
                        {field: 'detail_datetime', title: __('Detail_datetime'), operate:'RANGE', addclass:'datetimerange', autocomplete:false},
                        {field: 'detail_delivery_date', title: __('Detail_delivery_date'), operate:'RANGE', addclass:'datetimerange', autocomplete:false},
                        {field: 'detail_isurgent', title: __('Detail_isurgent'), searchList: {"0":__('Detail_isurgent 0'),"1":__('Detail_isurgent 1')}, formatter: Table.api.formatter.normal},
                        {field: 'detail_custom_id', title: __('Detail_custom_id')},
                        {field: 'detail_custom_name', title: __('Detail_custom_name'), operate: 'LIKE'},
                        {field: 'detail_no', title: __('Detail_no')},
                        {field: 'detail_product_name', title: __('Detail_product_name'), operate: 'LIKE'},
                        {field: 'detail_product_specs', title: __('Detail_product_specs'), operate: 'LIKE'},
                        {field: 'detail_price', title: __('Detail_price'), operate:'BETWEEN'},
                        {field: 'detail_discount', title: __('Detail_discount'), operate:'BETWEEN'},
                        {field: 'detail_useposition', title: __('Detail_useposition'), operate: 'LIKE'},
                        {field: 'detail_long', title: __('Detail_long'), operate:'BETWEEN'},
                        {field: 'detail_wide', title: __('Detail_wide'), operate:'BETWEEN'},
                        {field: 'detail_number', title: __('Detail_number')},
                        {field: 'detail_area', title: __('Detail_area'), operate:'BETWEEN'},
                        {field: 'detail_length', title: __('Detail_length'), operate:'BETWEEN'},
                        {field: 'detail_hole', title: __('Detail_hole')},
                        {field: 'detail_amount', title: __('Detail_amount'), operate:'BETWEEN'},
                        {field: 'detail_remark', title: __('Detail_remark'), operate: 'LIKE'},
                        {field: 'detail_specification', title: __('Detail_specification'), operate: 'LIKE'},
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