define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'sale/customtype/index' + location.search,
                    add_url: 'sale/customtype/add',
                    edit_url: 'sale/customtype/edit',
                    del_url: 'sale/customtype/del',
                    //multi_url: 'sale/customtype/multi',
                    import_url: 'sale/customtype/import',
                    table: 'custom_type',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'custom_type_id',
                sortName: 'custom_type_id',
                columns: [
                    [
                        {checkbox: true},
                        //{field: 'custom_type_id', title: __('Custom_type_id')},
                        {field: 'custom_type', title: __('Custom_type'), operate: 'LIKE'},
                        {field: 'custom_type_discount', title: __('Custom_type_discount'), operate:'BETWEEN'},
                        //{field: 'company_id', title: __('Company_id')},
                        {field: 'operate', title: __('Operate'), table: table, events: Table.api.events.operate, formatter: Table.api.formatter.operate}
                    ]
                ]
            });

            // 为表格绑定事件
            Table.api.bindevent(table);
        },
        add: function () {
        	$("form[role=form]").on("keydown",function(e){
                if (e.keyCode==13) {
                    if (e.target.nodeName!=="TEXTAREA") {
                        //此处添加你自己的需要在按下回车键之后要执行的代码
                        return false;
                    }
                }
            });
            Controller.api.bindevent();
        },
        edit: function () {
        	$("form[role=form]").on("keydown",function(e){
                if (e.keyCode==13) {
                    if (e.target.nodeName!=="TEXTAREA") {
                        //此处添加你自己的需要在按下回车键之后要执行的代码
                        return false;
                    }
                }
            });
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