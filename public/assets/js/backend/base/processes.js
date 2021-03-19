define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'base/processes/index' + location.search,
                    add_url: 'base/processes/add',
                    edit_url: 'base/processes/edit',
                    del_url: 'base/processes/del',
                   // multi_url: 'base/processes/multi',
                    import_url: 'base/processes/import',
                    table: 'base_processes',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'processes_id',
                sortName: 'processes_id',
                columns: [
                    [
                        {checkbox: true},
                        //{field: 'processes_id', title: __('Processes_id')},
                        {field: 'processes_code', title: __('Processes_code'), operate: 'LIKE'},
                        {field: 'processes_name', title: __('Processes_name'), operate: 'LIKE'},
                        {field: 'processes_print', title: __('Processes_print'), searchList: {"0":__('Processes_print 0'),"1":__('Processes_print 1')}, formatter: Table.api.formatter.normal},
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