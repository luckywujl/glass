define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'base/remark/index' + location.search,
                    add_url: 'base/remark/add',
                    edit_url: 'base/remark/edit',
                    del_url: 'base/remark/del',
                    //multi_url: 'base/remark/multi',
                    import_url: 'base/remark/import',
                    table: 'base_remark',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'remark_id',
                sortName: 'remark_id',
                columns: [
                    [
                        {checkbox: true},
                        //{field: 'remark_id', title: __('Remark_id')},
                        {field: 'remark_name', title: __('Remark_name'), operate: 'LIKE'},
                       // {field: 'company_id', title: __('Company_id')},
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