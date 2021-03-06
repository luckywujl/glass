define(['jquery', 'bootstrap', 'backend', 'table', 'form','printing','selectpage'], function ($, undefined, Backend, Table, Form, Printing) {

    var Controller = {
    	
        index: function () {
        	$(".btn-add").data("area",["90%","90%"]);
        	$(".btn-edit").data("area",["90%","90%"]);
        	//$(".btn-edit").data("offset",[top.$(".tab-pane.active").scrollTop() + "px","0px"]);
        	$(".btn-edit").data("title",'修改');
        	$(".btn-del").data("success",function (e,data,ret) {
        		      //刷新表格
        	      	$("#table").bootstrapTable('refresh',{});
        		      //先活清空,以防止删完后，返回的数据为null无法改写页面
            		$("#c-order_number_total").val('');
            		$("#c-order_number_total").val('');
            		$("#c-order_length_total").val('');
            		$("#c-order_area_total").val('');
            		$("#c-order_amount_total").val('');
            		$("#c-order_hole_total").val('');
            		$("#c-order_hole_amount_total").val('');
            		$("#c-order_edging_amount_total").val('');
            		$("#c-order_urgent_amount_total").val('');
            		$("#c-order_other_amount_total").val('');
            		$("#c-order_total_amount_total").val('');
            		//再填写
            		$("#c-order_number_total").val(data['data'][0]['number']);
            		$("#c-order_length_total").val(data['data'][0]['length']);
            		$("#c-order_area_total").val(data['data'][0]['area'].toFixed(4));
            		$("#c-order_amount_total").val(data['data'][0]['amount'].toFixed(2));
            		$("#c-order_hole_total").val(data['data'][0]['hole']);
            		$("#c-order_hole_amount_total").val(data['data'][0]['hole_amount']);
            		$("#c-order_edging_amount_total").val(data['data'][0]['edging_amount']);
            		$("#c-order_urgent_amount_total").val(data['data'][0]['urgent_amount']);
            		$("#c-order_other_amount_total").val(data['data'][0]['other_amount']);
            		$("#c-order_total_amount_total").val(data['data'][0]['total_amount'].toFixed(2));
							
            	});
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
                    		add_url: 'sale/detailtemp/add?discount='+$("#c-order_custom_discount").val()+'&order_id='+$("#c-order_id").val(),
                    		edit_url: 'sale/detailtemp/edit',
                    		del_url: 'sale/detailtemp/del',
                    		multi_url: 'sale/detailtemp/multi',
                    		import_url: 'sale/detailtemp/import',
                    		table: 'order_detail_temp',
                			}
            			});
            			//暂存
            			$("#add-form").attr("action","sale/detailtemp/save").submit();
						},function (data) {
							//失败的回调
							return false;
							})
						},
					});
					//手动输入折扣时，初始化表格参数配置将折扣带入
				$("#c-order_custom_discount").bind("keyup",function (event) {
					Table.api.init({
                			extend: {
                  		index_url: 'sale/detailtemp/index' + location.search,
                    		add_url: 'sale/detailtemp/add?discount='+$("#c-order_custom_discount").val()+'&order_id='+$("#c-order_id").val(),
                    		edit_url: 'sale/detailtemp/edit',
                    		del_url: 'sale/detailtemp/del',
                    		multi_url: 'sale/detailtemp/multi',
                    		import_url: 'sale/detailtemp/import',
                    		table: 'order_detail_temp',
                			}
            			}); 	
				}); 
				//新建 按钮
				$(document).on("click",".btn-new",function () {   
			   	layer.confirm('新建单据，是否保存这些已有数据?', {btn: ['是','否'] },
			   	function(index){
        				layer.close(index);
          			if ($("#c-order_number_total").val()==''||$("#c-order_number_total").val()=='0'){
					     Layer.alert('请添加产品明细，再保存！');
					     return false;
					   }else {
					     $("#add-form").attr("action","sale/detailtemp/savedraft").submit();
					   }				  
       			 },
        			function(index){
           		 	layer.close(index);
           		 	Fast.api.ajax({
        	  		 	url:'sale/detailtemp/new',
        	  			},function (data,ret) {
        	  				$("#c-order_id").val(ret.data['order_id']);
        	  				$("#c-order_code").val('');
        	  				$("#c-order_saleman").val('');
        	  				$("#c-order_saleman").selectPageClear();
        	  				
        	  				$("#c-order_custom_id").val('');
        	  				$("#c-order_custom_id").selectPageClear();
        	  				$("#c-order_custom_name").val('');
        	  				$("#c-order_custom_contact").val('');
        	  				$("#c-order_custom_tel").val('');
        	  				$("#c-order_custom_address").val('');
        	  				$("#c-order_custom_discount").val('100');
        	  				$("#c-order_number_total").val('0');//件数归零
        	  				$("#c-order_length_total").val('');
        	  				$("#c-order_area_total").val('');
        	  				$("#c-order_amount_total").val('');
        	  				$("#c-order_hole_total").val('');
        	  				$("#c-order_hole_amount_total").val('');
        	  				$("#c-order_edging_amount_total").val('');
        	  				$("#c-order_urgent_amount_total").val('');
        	  				$("#c-order_other_amount_total").val('');
        	  				$("#c-order_total_amount_total").val('');		
        	  				$("#c-order_remark").val('');						
        	  				$("table").bootstrapTable('refresh');//刷新表格
        	  				document.getElementById("new").setAttribute("disabled",true);
        	  				document.getElementById("savedraft").removeAttribute("disabled");
        	  				document.getElementById("saveverify").removeAttribute("disabled");
        	  				return false;
        	  			},function (data) {			
        	  		 		return false;
        	  			});
        			}
			   	);
            });
				
				//暂存按钮
        	  	$(document).on("click",".btn-save",function () {
        	  		$("#add-form").attr("action","sale/detailtemp/save").submit();
        	  	})
        	  	// 保存草稿
				$(document).on("click",".btn-savedraft",function () {
					if ($("#c-order_number_total").val()==''||$("#c-order_number_total").val()=='0') {
					  Layer.alert('请添加产品明细，再保存！');
					  return false;
					}else {
					document.getElementById("new").removeAttribute("disabled");
        	  		document.getElementById("savedraft").setAttribute("disabled",true);
        	  		document.getElementById("saveverify").setAttribute("disabled",true);	
					$("#add-form").attr("action","sale/detailtemp/savedraft").submit();
					}		
				});
				// 审核过账
				$(document).on("click",".btn-verify",function () {
					if ($("#c-order_number_total").val()==''||$("#c-order_number_total").val()=='0') {
					  Layer.alert('请添加产品明细，再保存！');
					  return false;
					}else {
					document.getElementById("new").removeAttribute("disabled");
        	  		document.getElementById("savedraft").setAttribute("disabled",true);
        	  		document.getElementById("saveverify").setAttribute("disabled",true);
					$("#add-form").attr("action","sale/detailtemp/verify").submit();
					}		
				});
				//打印
				$(document).on("click",".btn-printing",function () {
					var order_code = $("#c-order_code").val();
					if (!order_code==''){
						$.ajax({
                        url: "sale/detailtemp/printing",
                        type: 'post',
                        dataType: 'json',
                        data: {order_code:$("#c-order_code").val()},
                        success: function (ret) {
                            var options ={
                                templateCode:'SCRWD',
                                data:ret.data,
                                list:ret.list
                            };
                            Printing.api.printTemplate(options);
                            return false;
                        }, error: function (e) {
                            Backend.api.toastr.error(e.message);
                        }
                    });	
					}else {
						Layer.alert('请先保存，再打印！');
					}
			   	});
			   	//打开草稿
			   	$(document).on("click",".btn-open",function () {
					Fast.api.open('sale/detailtemp/opendraft','打开草稿',{
						area:['90%', '90%'],
					
					 	callback:function (data) {
					 		//先清空再填写
					 		$("#c-order_id").val('');
        	  				$("#c-order_code").val('');
        	  				$("#c-order_saleman").val('');
        	  				$("#c-order_saleman").selectPageRefresh();
        	  				
        	  				$("#c-order_custom_id").val('');
        	  				$("#c-order_custom_id").selectPageRefresh();
        	  				$("#c-order_custom_name").val('');
        	  				$("#c-order_custom_contact").val('');
        	  				$("#c-order_custom_tel").val('');
        	  				$("#c-order_custom_address").val('');
        	  				$("#c-order_custom_discount").val('');
        	  				$("#c-order_number_total").val('');//件数归零
        	  				$("#c-order_length_total").val('');
        	  				$("#c-order_area_total").val('');
        	  				$("#c-order_amount_total").val('');
        	  				$("#c-order_hole_total").val('');
        	  				$("#c-order_hole_amount_total").val('');
        	  				$("#c-order_edging_amount_total").val('');
        	  				$("#c-order_urgent_amount_total").val('');
        	  				$("#c-order_other_amount_total").val('');
        	  				$("#c-order_total_amount_total").val('');
        	  				$("#c-order_remark").val('');		
					 		
					 		//无刷新更新页面，填写各项数据后刷新下面的表格
					   	$("#c-order_id").val(data['order_id']);
        	  				$("#c-order_code").val(data['order_code']);
        	  				$("#c-order_saleman").val(data['order_saleman']);
        	  				$("#c-order_saleman").selectPageRefresh();
        	  				
        	  				$("#c-order_custom_id").val(data['order_custom_id']);
        	  				$("#c-order_custom_id").selectPageRefresh();
        	  				$("#c-order_custom_name").val(data['order_custom_name']);
        	  				$("#c-order_custom_contact").val(data['order_custom_contact']);
        	  				$("#c-order_custom_tel").val(data['order_custom_tel']);
        	  				$("#c-order_custom_address").val(data['order_custom_address']);
        	  				$("#c-order_custom_discount").val(data['order_custom_discount']);
        	  				$("#c-order_number_total").val(data['order_number_total']);//件数归零
        	  				$("#c-order_length_total").val(data['order_length_total']);
        	  				$("#c-order_area_total").val(data['order_area_total']);
        	  				$("#c-order_amount_total").val(data['order_amount_total']);
        	  				$("#c-order_hole_total").val(data['order_hole_total']);
        	  				$("#c-order_hole_amount_total").val(data['order_hole_amount_total']);
        	  				$("#c-order_edging_amount_total").val(data['order_edging_amount_total']);
        	  				$("#c-order_urgent_amount_total").val(data['order_urgent_amount_total']);
        	  				$("#c-order_other_amount_total").val(data['order_other_amount_total']);
        	  				$("#c-order_total_amount_total").val(data['order_total_amount_total']);
        	  				$("#c-order_remark").val(data['order_total_remark']);		
					 		$("table").bootstrapTable('refresh');//刷新表格
					 		document.getElementById("new").removeAttribute("disabled");
        	  				document.getElementById("savedraft").removeAttribute("disabled");
        	  				document.getElementById("saveverify").removeAttribute("disabled");
					 		//alert(data.sale_custom_name);
				   	}
					});
				});
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'sale/detailtemp/index' + location.search,
                    add_url: 'sale/detailtemp/add?discount=100&order_id='+$("#c-order_id").val(),
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
                sortOrder:'asc',
                search:false,
                commonSearch:false,
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
            table.on('post-body.bs.table',function (e,settings,json,xhr) {
            	$(".btn-delone").data("success",function (e,data,ret) {
            		//刷新表格
        	      	$("#table").bootstrapTable('refresh',{});
            		//先活清空,以防止删完后，返回的数据为null无法改写页面
            		$("#c-order_number_total").val('');
            		$("#c-order_number_total").val('');
            		$("#c-order_length_total").val('');
            		$("#c-order_area_total").val('');
            		$("#c-order_amount_total").val('');
            		$("#c-order_hole_total").val('');
            		$("#c-order_hole_amount_total").val('');
            		$("#c-order_edging_amount_total").val('');
            		$("#c-order_urgent_amount_total").val('');
            		$("#c-order_other_amount_total").val('');
            		$("#c-order_total_amount_total").val('');
            		//再填写
            		$("#c-order_number_total").val(data['data'][0]['number']);
            		$("#c-order_number_total").val(data['data'][0]['number']);
            		$("#c-order_length_total").val(data['data'][0]['length']);
            		$("#c-order_area_total").val(data['data'][0]['area'].toFixed(4));
            		$("#c-order_amount_total").val(data['data'][0]['amount'].toFixed(2));
            		$("#c-order_hole_total").val(data['data'][0]['hole']);
            		$("#c-order_hole_amount_total").val(data['data'][0]['hole_amount']);
            		$("#c-order_edging_amount_total").val(data['data'][0]['edging_amount']);
            		$("#c-order_urgent_amount_total").val(data['data'][0]['urgent_amount']);
            		$("#c-order_other_amount_total").val(data['data'][0]['other_amount']);
            		$("#c-order_total_amount_total").val(data['data'][0]['total_amount'].toFixed(2));
							
            	});
            	$(".btn-editone").data("area",["90%","90%"]);
            	$(".btn-editone").data("title",'修改');
            })
        },
        add: function () {
        	//Controller.api.bindevent();
        	//提交按钮
        	  	$(document).on("click",".btn-accept",function () {
        	  		$("#add-form").attr("action","sale/detailtemp/add").submit();	
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
            //更新父表中的字段，实现无刷新更新
            parent.$("#c-order_number_total").val(data[0]['number']);
            parent.$("#c-order_length_total").val(data[0]['length']);
            parent.$("#c-order_area_total").val(data[0]['area'].toFixed(4));
            parent.$("#c-order_amount_total").val(data[0]['amount'].toFixed(2));
            parent.$("#c-order_hole_total").val(data[0]['hole']);
            parent.$("#c-order_hole_amount_total").val(data[0]['hole_amount']);
            parent.$("#c-order_edging_amount_total").val(data[0]['edging_amount']);
            parent.$("#c-order_urgent_amount_total").val(data[0]['urgent_amount']);
            parent.$("#c-order_other_amount_total").val(data[0]['other_amount']);
            parent.$("#c-order_total_amount_total").val(data[0]['total_amount'].toFixed(2));
            //parent.$("#add-form").attr("action","sale/detailtemp/save").submit();
            
            return false;
        	}, function(data, ret){
        		
           
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
            //
            //parent.location.reload();//这里刷新父页面，可以换其他代码
             parent.$("#table").bootstrapTable('refresh',{});
            //更新父表中的字段，实现无刷新更新
            parent.$("#c-order_number_total").val(data[0]['number']);
            parent.$("#c-order_length_total").val(data[0]['length']);
            parent.$("#c-order_area_total").val(data[0]['area'].toFixed(4));
            parent.$("#c-order_amount_total").val(data[0]['amount'].toFixed(2));
            parent.$("#c-order_hole_total").val(data[0]['hole']);
            parent.$("#c-order_hole_amount_total").val(data[0]['hole_amount']);
            parent.$("#c-order_edging_amount_total").val(data[0]['edging_amount']);
            parent.$("#c-order_urgent_amount_total").val(data[0]['urgent_amount']);
            parent.$("#c-order_other_amount_total").val(data[0]['other_amount']);
            parent.$("#c-order_total_amount_total").val(data[0]['total_amount'].toFixed(2));
            
            Fast.api.close();//在这里关闭当前弹窗
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
        opendraft: function () {
         	$(document).on("click",".btn-select",function () {
        		   var ids = Table.api.selectedids(table);
               var id = ids.pop();
               Fast.api.ajax({
        	  		 		url:'sale/detailtemp/select?order_id='+id,
        	  				data:{order_id:id}
        	  				},function (data,ret) {
        	  						
        	  					Fast.api.close(data);
        	  					//对总表进行汇总，求总件数，总重量，总金额，倒算单价
        	  					//$("table").bootstrapTable('refresh');//刷新表格
        	  					return false;
        	  				},function (data) {
        	  					$("table").bootstrapTable('refresh');//刷新表格
        	  		 			return false;
        	  				});
					
				});
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'sale/detailtemp/opendraft' + location.search,
                    
                    table: 'order_main',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'order_id',
                sortName: 'order_code',
                //commonSearch:false,
                search:false,
                clickToSelect: true, //是否启用点击选中
        		    dblClickToEdit: false, //是否启用双击编辑
    				 singleSelect: true, //是否启用单选
                columns: [
                    [
                        {checkbox: true},
                        //{field: 'order_id', title: __('Order_id')},
                        {field: 'order_code', title: __('Order_code'), operate: 'LIKE'},
                        {field: 'order_datetime', title: __('Order_datetime'), operate:'RANGE', addclass:'datetimerange', autocomplete:false, formatter: Table.api.formatter.datetime},
                        //{field: 'order_delivery_date', title: __('Order_delivery_date'), operate:'RANGE', addclass:'datetimerange', autocomplete:false},
                        //{field: 'order_custom_id', title: __('Order_custom_id')},
                        {field: 'order_custom_name', title: __('Order_custom_name'), operate: 'LIKE'},
                        //{field: 'order_custom_contact', title: __('Order_custom_contact'), operate: 'LIKE'},
                        {field: 'order_custom_tel', title: __('Order_custom_tel'), operate: 'LIKE'},
                        //{field: 'order_custom_address', title: __('Order_custom_address'), operate: 'LIKE'},
                        //{field: 'order_custom_discount', title: __('Order_custom_discount'), operate:'BETWEEN'},
                        {field: 'order_number_total', title: __('Order_number_total'), operate:'BETWEEN'},
                        {field: 'order_area_total', title: __('Order_area_total'), operate:'BETWEEN'},
                        {field: 'order_length_total', title: __('Order_length_total'), operate:'BETWEEN'},
                        {field: 'order_hole_total', title: __('Order_hole_total')},
                        {field: 'order_amount_total', title: __('Order_amount_total'), operate:'BETWEEN'},
                        //{field: 'order_receiver', title: __('Order_receiver'), operate: 'LIKE'},
                        {field: 'order_saleman', title: __('Order_saleman'), operate: 'LIKE'},
                        {field: 'order_operator', title: __('Order_operator'), operate: 'LIKE'},
                        //{field: 'order_checker', title: __('Order_checker'), operate: 'LIKE'},
                        //{field: 'order_dispatcher', title: __('Order_dispatcher'), operate: 'LIKE'},
                        //{field: 'order_freight_type', title: __('Order_freight_type'), searchList: {"0":__('Order_freight_type 0'),"1":__('Order_freight_type 1')}, formatter: Table.api.formatter.normal},
                        //{field: 'order_isdelivery', title: __('Order_isdelivery'), searchList: {"0":__('Order_isdelivery 0'),"1":__('Order_isdelivery 1')}, formatter: Table.api.formatter.normal},
                        //{field: 'order_status', title: __('Order_status'), searchList: {"0":__('Order_status 0'),"1":__('Order_status 1'),"2":__('Order_status 2'),"3":__('Order_status 3'),"4":__('Order_status 4')}, formatter: Table.api.formatter.status},
                        
                    ]
                ]
            });

            // 为表格绑定事件
            Table.api.bindevent(table);
        },
        api: {
            bindevent: function () {
                Form.api.bindevent($("form[role=form]"),function (data,ret) {
                  //数据保存成功后执行，清除产品重量接头数，再打印
                  
                  if (data['order_code']!==null) {
                  	$("#c-order_code").val(data['order_code']);
                  	document.getElementById("new").removeAttribute("disabled");
                  	layer.confirm('保存成功，是否打印生产任务单?', {btn: ['是','否'] },
			   			function(index){
        						layer.close(index);
        						//打印
          					$.ajax({
                        url: "sale/detailtemp/printing",
                        type: 'post',
                        dataType: 'json',
                        data: {order_code:$("#c-order_code").val()},
                        success: function (ret) {
                            var options ={
                                templateCode:'SCRWD',
                                data:ret.data,
                                list:ret.list
                            };
                            Printing.api.printTemplate(options);
                            return false;
                        }, error: function (e) {
                            Backend.api.toastr.error(e.message);
                        }
                    });	 
       					 },
        					function(index){
           		 			layer.close(index);
           		 	
        					 }
			   			);
                  }
                  //打印单据
                  //Fast.api.open('product/product/printingone?product_id='+data.product_id,'打印标签',{}); 	
                 
                  //刷新表格
   				   $("#table").bootstrapTable('refresh');
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
            }
        }
    };
    return Controller;
});