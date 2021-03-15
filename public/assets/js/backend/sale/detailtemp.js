define(['jquery', 'bootstrap', 'backend', 'table', 'form','printing','selectpage'], function ($, undefined, Backend, Table, Form, Printing) {

    var Controller = {
    	
        index: function () {
        	$(".btn-add").data("area",["90%","90%"]);
        	$(".btn-edit").data("area",["90%","90%"]);
        	$(".btn-edit").data("title",'修改');
        	//$(".btn-add").data("title",'添加');
        
        	Controller.api.bindevent();
        	//选择客户
				$('#c-order_custom_id').selectPage({
					showField:'custom_name',
					keyField:'custom_id',
					data:'sale/custominfo/index',
 					pageSize:10,
 					eAjaxSuccess:function (data) {
 						data.list = typeof data.rows !=='undefined' ? data.rows :(typeof data.list !== 'undefined' ? data.list : []);
 						data.totalRow = typeof data.total !== 'undefined' ? data.total :(typeof data.totalRow !== 'undefined' ? data.totalRow :data.list.length);
 						return data;
 					},
					eSelect:function (data) {
						$("#c-order_custom_name").val(data.custom_name);
						Fast.api.ajax({
							url:'sale/custominfo/getcustominfo',
							data:{custom_id:data.custom_id}
						},
						function (data,ret) {
							//填写客户信息
							console.info(data);
							//return false;
							$("#c-order_custom_address").val(data.custom_address);
							$("#c-order_custom_tel").val(data.custom_tel);
							$("#c-order_custom_contact").val(data.custom_contact);
							$("#c-order_custom_discount").val(data.custom_discount);
							//将实时更新折扣参数
							Table.api.init({
                			extend: {
                  		index_url: 'sale/detailtemp/index' + location.search,
                    		add_url: 'sale/detailtemp/add?discount='+$("#c-order_custom_discount").val(),
                    		edit_url: 'sale/detailtemp/edit',
                    		del_url: 'sale/detailtemp/del',
                    		multi_url: 'sale/detailtemp/multi',
                    		import_url: 'sale/detailtemp/import',
                    		table: 'order_detail_temp',
                			}
            			});
						},function (data) {
							//失败的回调
							return false;
							})
						},
					});
				$("#c-order_custom_discount").bind("keyup",function (event) {
					Table.api.init({
                			extend: {
                  		index_url: 'sale/detailtemp/index' + location.search,
                    		add_url: 'sale/detailtemp/add?discount='+$("#c-order_custom_discount").val(),
                    		edit_url: 'sale/detailtemp/edit',
                    		del_url: 'sale/detailtemp/del',
                    		multi_url: 'sale/detailtemp/multi',
                    		import_url: 'sale/detailtemp/import',
                    		table: 'order_detail_temp',
                			}
            			}); 	
				}); 
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'sale/detailtemp/index' + location.search,
                    add_url: 'sale/detailtemp/add?discount=100',
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
                        //{field: 'detail_id', title: __('Detail_id')},
                        //{field: 'order_id', title: __('Order_id')},
                        {field: 'detail_no', title: __('Detail_no')},
                        //{field: 'detail_order_code', title: __('Detail_order_code'), operate: 'LIKE'},
                        {field: 'detail_datetime', title: __('Detail_datetime'), operate:'RANGE', addclass:'datetimerange', autocomplete:false},
                        {field: 'detail_delivery_date', title: __('Detail_delivery_date'), operate:'RANGE', addclass:'datetimerange', autocomplete:false},
                        {field: 'detail_isurgent', title: __('Detail_isurgent'), searchList: {"0":__('Detail_isurgent 0'),"1":__('Detail_isurgent 1')}, formatter: Table.api.formatter.normal}, 
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
                        //{field: 'company_id', title: __('Company_id'), operate: 'LIKE'},
                        {field: 'operate', title: __('Operate'), table: table, events: Table.api.events.operate, formatter: Table.api.formatter.operate}
                    ]
                ]
            });

            // 为表格绑定事件
            Table.api.bindevent(table);
            table.on('post-body.bs.table',function () {
            	$(".btn-editone").data("area",["90%","90%"]);
            	$(".btn-editone").data("title",'修改');
            })
        },
        add: function () {
        	//Controller.api.bindevent();
        	//提交按钮
        	  	$(document).on("click",".btn-accept",function () {
        	  		$("#edit-form").attr("action","sale/detailtemp/edit").submit();	
        	  	})
        	Form.api.bindevent($("form[role=form]"), function(data, ret){//绑定时间
            //给表单绑定新的回调函数 接收 控制器 success(msg,url,data)或者error(msg,url,data)
            //Fast.api.close(data);//在这里关闭当前弹窗
            //parent.location.reload();//这里刷新父页面，可以换其他代码
            parent.$("#table").bootstrapTable('refresh',{});
            $("#c-detail_useposition").val('');//清空使用位置
            $("#c-detail_long").val('');//清空长度
            $("#c-detail_wide").val('');//清空宽度
            $("#c-detail_number").val('');//清空数量
            $("#c-detail_area").val('');//清空面积
            $("#c-detail_length").val('');//清空边长
            $("#c-detail_amount").val('');//清空玻璃金额
            $("#c-detail_hole_price").val('');//清空打孔单价
            $("#c-detail_hole_amount").val('');//清空打孔费
            $("#c-detail_urgent_amount").val('');//清空加急费
            $("#c-detail_edging_amount").val('');//清空磨边费
            $("#c-detail_other_amount").val('');//清空其它费用
            $("#c-detail_total_amount").val('');//清空合计金额
            //$("#c-detail_remark").val('');//清空备注
            //$("#c-detail_specification").val('');//清空工艺要求
            Toastr.success('保存！');
            return false;
        	}, function(data, ret){
        		Toastr.success('保存！');
           console.error("错误");
        	});
        	$("#c-detail_product_specs").data("params",function (obj) {
        	   return {custom:{product_name:$("#c-detail_product_name").val()}};
        	});
        		
        		//$("#c-detail_product_name").on('change',function(){
         	//	var product_name = $('#c-detail_product_name').val();
          	//	 $("#c-detail_product_specs").selectPageClear();
           	 //改变下面这个框的数据源
           	//	 $("#c-detail_product_specs_text").data("selectPageObject").option.data = 'base/product/getspecs?product_name='+product_name;   
        		//});
        		
        		$("#c-detail_product_specs").on('change',function(){
         		var product_name = $('#c-detail_product_name').val();
         		var product_specs = $('#c-detail_product_specs').val();
          		$("#c-detail_price").val('');
          		Fast.api.ajax({
							url:'base/product/getprice',
							data:{product_name:product_name,product_specs:product_specs}
						},
						function (data,ret) {
							//填写价格信息
							console.info(data);
							
							$("#c-detail_price").val(data.product_price);
							return false;
						},function (data) {
							//失败的回调
							return false;
						}) 
        		});
        		//在长，宽，数量,单价,折扣输入框按键计算汇总
        		$("#c-detail_long").bind("keyup",function (event) {
					account(); 	
				}); 
				$("#c-detail_wide").bind("keyup",function (event) {
					account(); 	
				}); 
				$("#c-detail_number").bind("keyup",function (event) {
					account(); 	
				}); 
				$("#c-detail_price").bind("keyup",function (event) {
					account(); 	
				}); 
				$("#c-detail_discount").bind("keyup",function (event) {
					account(); 	
				}); 
				$("#c-detail_hole").bind("keyup",function (event) {
					account(); 	
				}); 
				$("#c-detail_hole_price").bind("keyup",function (event) {
					account(); 	
				}); 
				$("#c-detail_urgent_amount").bind("keyup",function (event) {
					account(); 	
				}); 
				$("#c-detail_edging_amount").bind("keyup",function (event) {
					account(); 	
				}); 
				$("#c-detail_other_amount").bind("keyup",function (event) {
					account(); 	
				}); 
        	
        
            
            //计算金额
				function account() {
					//计算面积
					$("#c-detail_area").val(($("#c-detail_long").val()*$("#c-detail_wide").val()*$("#c-detail_number").val()/1000000).toFixed(4));
					//计算周长
					$("#c-detail_length").val((2*$("#c-detail_long").val()+2*$("#c-detail_wide").val())*$("#c-detail_number").val());
					//计算玻璃金额
					$("#c-detail_amount").val(($("#c-detail_area").val()*$("#c-detail_price").val()*$("#c-detail_discount").val()/100).toFixed(2));
					//计算打孔费
					$("#c-detail_hole_amount").val(($("#c-detail_hole").val()*$("#c-detail_hole_price").val()).toFixed(2));
					//计算合计金额
					$("#c-detail_total_amount").val((1*$("#c-detail_amount").val()+1*$("#c-detail_hole_amount").val()+1*$("#c-detail_edging_amount").val()+1*$("#c-detail_urgent_amount").val()+1*$("#c-detail_other_amount").val()).toFixed(2));
					//$("#c-detail_amount").val(($("#c-iodetail_product_price").val()*$("#c-iodetail_NW").val()*$("#c-iodetail_discount").val()/100).toFixed(2));
				
				}
				
        },
        edit: function () {
        	//Controller.api.bindevent();
      
        	Form.api.bindevent($("form[role=form]"), function(data, ret){//绑定时间
            //给表单绑定新的回调函数 接收 控制器 success(msg,url,data)或者error(msg,url,data)
            //Fast.api.close(data);//在这里关闭当前弹窗
            //parent.location.reload();//这里刷新父页面，可以换其他代码
             parent.$("#table").bootstrapTable('refresh',{});
            
            Toastr.success('内容');
            return false;
        	}, function(data, ret){
           console.error("错误");
        	});

   
        	//设置产品规格的过滤条件
        		$("#c-detail_product_specs").data("params",function (obj) {
        	  		 return {custom:{product_name:$("#c-detail_product_name").val()}};
        		});
        		//当产品名称发生变化时，清空产品规格 
        		$("#c-detail_product_name").on('change',function(){
          		 $("#c-detail_product_specs").selectPageClear();  
          		 $("#c-detail_price").val('');	   
          		 account();
        		});
        		  
        		$("#c-detail_product_specs").on('change',function(){
         		var product_name = $('#c-detail_product_name').val();
         		var product_specs = $('#c-detail_product_specs').val();
          		$("#c-detail_price").val('');
          		Fast.api.ajax({
							url:'base/product/getprice',
							data:{product_name:product_name,product_specs:product_specs}
						},
						function (data,ret) {
							//填写价格信息
							console.info(data);
							//return false;
							$("#c-detail_price").val(data.product_price);
							account();
						},function (data) {
							//失败的回调
							account();
							return false;
						}) 
        		});
          	//在长，宽，数量,单价,折扣输入框按键计算汇总
        		$("#c-detail_long").bind("keyup",function (event) {
					account(); 	
				}); 
				$("#c-detail_wide").bind("keyup",function (event) {
					account(); 	
				}); 
				$("#c-detail_number").bind("keyup",function (event) {
					account(); 	
				}); 
				$("#c-detail_price").bind("keyup",function (event) {
					account(); 	
				}); 
				$("#c-detail_discount").bind("keyup",function (event) {
					account(); 	
				}); 
				$("#c-detail_hole").bind("keyup",function (event) {
					account(); 	
				}); 
				$("#c-detail_hole_price").bind("keyup",function (event) {
					account(); 	
				}); 
				$("#c-detail_urgent_amount").bind("keyup",function (event) {
					account(); 	
				}); 
				$("#c-detail_edging_amount").bind("keyup",function (event) {
					account(); 	
				}); 
				$("#c-detail_other_amount").bind("keyup",function (event) {
					account(); 	
				}); 
        		//提交按钮
        	  	$(document).on("click",".btn-accept",function () {
        	  		$("#edit-form").attr("action","sale/detailtemp/edit").submit();	
        	  	})
        
            
            //计算金额
				function account() {
					//计算面积
					$("#c-detail_area").val(($("#c-detail_long").val()*$("#c-detail_wide").val()*$("#c-detail_number").val()/1000000).toFixed(4));
					//计算周长
					$("#c-detail_length").val((2*$("#c-detail_long").val()+2*$("#c-detail_wide").val())*$("#c-detail_number").val());
					//计算玻璃金额
					$("#c-detail_amount").val(($("#c-detail_area").val()*$("#c-detail_price").val()*$("#c-detail_discount").val()/100).toFixed(2));
					//计算打孔费
					$("#c-detail_hole_amount").val(($("#c-detail_hole").val()*$("#c-detail_hole_price").val()).toFixed(2));
					//计算合计金额
					$("#c-detail_total_amount").val((1*$("#c-detail_amount").val()+1*$("#c-detail_hole_amount").val()+1*$("#c-detail_edging_amount").val()+1*$("#c-detail_urgent_amount").val()+1*$("#c-detail_other_amount").val()).toFixed(2));
					//$("#c-detail_amount").val(($("#c-iodetail_product_price").val()*$("#c-iodetail_NW").val()*$("#c-iodetail_discount").val()/100).toFixed(2));
				}
            
        },
        api: {
            bindevent: function () {
                Form.api.bindevent($("form[role=form]"),function (data,ret) {
                  //数据保存成功后执行，清除产品重量接头数，再打印
                  $("#c-order_code").val('123456');
                
                  //打印单据
                  //Fast.api.open('product/product/printingone?product_id='+data.product_id,'打印标签',{}); 	
                 
                  //刷新表格
   				  // $("#table").bootstrapTable('refresh');
   				   }, function(data, ret){
  						Toastr.success("失败");
				   	}, function(success, error){

					//bindevent的第三个参数为提交前的回调
					//如果我们需要在表单提交前做一些数据处理，则可以在此方法处理
					//注意如果我们需要阻止表单，可以在此使用return false;即可
					//如果我们处理完成需要再次提交表单则可以使用submit提交,如下
					//Form.api.submit(this, success, error);
					//return false;
                });
                return false;
            }
        }
    };
    return Controller;
});