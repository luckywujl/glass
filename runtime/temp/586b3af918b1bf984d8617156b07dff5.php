<?php if (!defined('THINK_PATH')) exit(); /*a:4:{s:98:"/home/www/admin/localhost_9004/wwwroot/public/../application/admin/view/sale/detailtemp/index.html";i:1615825430;s:81:"/home/www/admin/localhost_9004/wwwroot/application/admin/view/layout/default.html";i:1615636564;s:78:"/home/www/admin/localhost_9004/wwwroot/application/admin/view/common/meta.html";i:1615636564;s:80:"/home/www/admin/localhost_9004/wwwroot/application/admin/view/common/script.html";i:1615636564;}*/ ?>
<!DOCTYPE html>
<html lang="<?php echo $config['language']; ?>">
    <head>
        <meta charset="utf-8">
<title><?php echo (isset($title) && ($title !== '')?$title:''); ?></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<meta name="renderer" content="webkit">
<meta name="referrer" content="never">

<link rel="shortcut icon" href="/assets/img/favicon.ico" />
<!-- Loading Bootstrap -->
<link href="/assets/css/backend<?php echo \think\Config::get('app_debug')?'':'.min'; ?>.css?v=<?php echo \think\Config::get('site.version'); ?>" rel="stylesheet">

<?php if(\think\Config::get('fastadmin.adminskin')): ?>
<link href="/assets/css/skins/<?php echo \think\Config::get('fastadmin.adminskin'); ?>.css?v=<?php echo \think\Config::get('site.version'); ?>" rel="stylesheet">
<?php endif; ?>

<!-- HTML5 shim, for IE6-8 support of HTML5 elements. All other JS at the end of file. -->
<!--[if lt IE 9]>
  <script src="/assets/js/html5shiv.js"></script>
  <script src="/assets/js/respond.min.js"></script>
<![endif]-->
<script type="text/javascript">
    var require = {
        config:  <?php echo json_encode($config); ?>
    };
</script>

    </head>

    <body class="inside-header inside-aside <?php echo defined('IS_DIALOG') && IS_DIALOG ? 'is-dialog' : ''; ?>">
        <div id="main" role="main">
            <div class="tab-content tab-addtabs">
                <div id="content">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <section class="content-header hide">
                                <h1>
                                    <?php echo __('Dashboard'); ?>
                                    <small><?php echo __('Control panel'); ?></small>
                                </h1>
                            </section>
                            <?php if(!IS_DIALOG && !\think\Config::get('fastadmin.multiplenav') && \think\Config::get('fastadmin.breadcrumb')): ?>
                            <!-- RIBBON -->
                            <div id="ribbon">
                                <ol class="breadcrumb pull-left">
                                    <?php if($auth->check('dashboard')): ?>
                                    <li><a href="dashboard" class="addtabsit"><i class="fa fa-dashboard"></i> <?php echo __('Dashboard'); ?></a></li>
                                    <?php endif; ?>
                                </ol>
                                <ol class="breadcrumb pull-right">
                                    <?php foreach($breadcrumb as $vo): ?>
                                    <li><a href="javascript:;" data-url="<?php echo $vo['url']; ?>"><?php echo $vo['title']; ?></a></li>
                                    <?php endforeach; ?>
                                </ol>
                            </div>
                            <!-- END RIBBON -->
                            <?php endif; ?>
                            <div class="content">
                                <div class="panel panel-default panel-intro">
    <?php echo build_heading(); ?>

    <div class="panel-body">
    <form id="add-form" class="form-horizontal" role="form" data-toggle="validator" method="POST" action="">
    <div class="col-xs-12 col-sm-2">
            <input id="c-order_id"  class="form-control" name="row[order_id]" type="text" value="<?php echo htmlentities($row['order_id']); ?>">
        </div>

    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-1"><?php echo __('Order_code'); ?>:</label>
        <div class="col-xs-12 col-sm-2">
            <input id="c-order_code"  class="form-control" name="row[order_code]" type="text" value="<?php echo htmlentities($row['order_code']); ?>">
        </div>
    
        <label class="control-label col-xs-12 col-sm-1"><?php echo __('Order_datetime'); ?>:</label>
        <div class="col-xs-12 col-sm-2">
            <input id="c-order_datetime" data-rule="required" class="form-control datetimepicker" data-date-format="YYYY-MM-DD HH:mm:ss" data-use-current="true" name="row[order_datetime]" type="text" value="<?php echo date('Y-m-d H:i:s'); ?>">
        </div>
 
        <label class="control-label col-xs-12 col-sm-1"><?php echo __('Order_delivery_date'); ?>:</label>
        <div class="col-xs-12 col-sm-2">
            <input id="c-order_delivery_date" class="form-control datetimepicker" data-date-format="YYYY-MM-DD" data-use-current="true" name="row[order_delivery_date]" type="text" value="<?php echo date('Y-m-d'); ?>">
        </div>
        
        <label class="control-label col-xs-12 col-sm-1"><?php echo __('Order_saleman'); ?>:</label>
        <div class="col-xs-12 col-sm-2">
            <input id="c-order_saleman" class="form-control selectpage" data-source="base/personnel/index" data-field="personnel_name" data-primary-key="personnel_name"  name="row[order_saleman]" type="text" value="<?php echo htmlentities($row['order_saleman']); ?>">
        </div>
    </div>
    <div class="form-group">
        <div class="col-xs-12 col-sm-2" hidden="hidden">
           <input id="c-order_custom_name" data-rule="required" class="form-control" name="row[order_custom_name]" type="text" value="<?php echo htmlentities($row['order_custom_name']); ?>"> 
        </div>
        <label class="control-label col-xs-12 col-sm-1"><?php echo __('Order_custom_name'); ?>:</label>
        <div class="col-xs-12 col-sm-2">
            <input id="c-order_custom_id" data-rule="required"  class="form-control" name="row[order_custom_id]" type="text" value="<?php echo htmlentities($row['order_custom_id']); ?>">
        </div>
    
        <label class="control-label col-xs-12 col-sm-1"><?php echo __('Order_custom_contact'); ?>:</label>
        <div class="col-xs-12 col-sm-2">
            <input id="c-order_custom_contact" class="form-control" name="row[order_custom_contact]" type="text" value="<?php echo htmlentities($row['order_custom_contact']); ?>">
        </div>

        <label class="control-label col-xs-12 col-sm-1"><?php echo __('Order_custom_tel'); ?>:</label>
        <div class="col-xs-12 col-sm-2">
            <input id="c-order_custom_tel" class="form-control" name="row[order_custom_tel]" type="text" value="<?php echo htmlentities($row['order_custom_tel']); ?>">
        </div>
  
        <label class="control-label col-xs-12 col-sm-1"><?php echo __('Order_custom_address'); ?>:</label>
        <div class="col-xs-12 col-sm-2">
            <input id="c-order_custom_address" class="form-control" name="row[order_custom_address]" type="text" value="<?php echo htmlentities($row['order_custom_address']); ?>">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-1"><?php echo __('Order_custom_discount'); ?>:</label>
        <div class="col-xs-12 col-sm-1">
            <input id="c-order_custom_discount" class="form-control" name="row[order_custom_discount]" type="number" value="<?php echo htmlentities($row['order_custom_discount']); ?>">
        </div>
 
        <label class="control-label col-xs-12 col-sm-1"><?php echo __('Order_number_total'); ?>:</label>
        <div class="col-xs-12 col-sm-1">
            <input id="c-order_number_total" class="form-control" name="row[order_number_total]" type="number" value="<?php echo htmlentities($row['order_number_total']); ?>">
        </div>
        
        <label class="control-label col-xs-12 col-sm-1"><?php echo __('Order_length_total'); ?>:</label>
        <div class="col-xs-12 col-sm-1">
            <input id="c-order_length_total" class="form-control" name="row[order_length_total]" type="number" value="<?php echo htmlentities($row['order_length_total']); ?>">
        </div>

        <label class="control-label col-xs-12 col-sm-1"><?php echo __('Order_area_total'); ?>:</label>
        <div class="col-xs-12 col-sm-2">
            <input id="c-order_area_total" class="form-control" name="row[order_area_total]" type="number" value="<?php echo htmlentities($row['order_area_total']); ?>">
        </div>

        
        <label class="control-label col-xs-12 col-sm-1"><?php echo __('Order_amount_total'); ?>:</label>
        <div class="col-xs-12 col-sm-2">
            <input id="c-order_amount_total" class="form-control" name="row[order_amount_total]" type="number" value="<?php echo htmlentities($row['order_amount_total']); ?>">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-1"><?php echo __('Order_hole_total'); ?>:</label>
        <div class="col-xs-12 col-sm-1">
            <input id="c-order_hole_total" class="form-control" name="row[order_hole_total]" type="number" value="<?php echo htmlentities($row['order_hole_total']); ?>">
        </div>
        <label class="control-label col-xs-12 col-sm-1"><?php echo __('Order_hole_amount_total'); ?>:</label>
        <div class="col-xs-12 col-sm-1">
            <input id="c-order_hole_amount_total" class="form-control" name="row[order_hole_amount_total]" type="number" value="<?php echo htmlentities($row['order_hole_amount_total']); ?>">
        </div>
        <label class="control-label col-xs-12 col-sm-1"><?php echo __('Order_edging_amount_total'); ?>:</label>
        <div class="col-xs-12 col-sm-1">
            <input id="c-order_edging_amount_total" class="form-control" name="row[order_edging_amount_total]" type="number" value="<?php echo htmlentities($row['order_edging_amount_total']); ?>">
        </div>
        <label class="control-label col-xs-12 col-sm-1"><?php echo __('Order_urgent_amount_total'); ?>:</label>
        <div class="col-xs-12 col-sm-1">
            <input id="c-order_urgent_amount_total" class="form-control" name="row[order_urgent_amount_total]" type="number" value="<?php echo htmlentities($row['order_urgent_amount_total']); ?>">
        </div>
        <label class="control-label col-xs-12 col-sm-1"><?php echo __('Order_other_amount_total'); ?>:</label>
        <div class="col-xs-12 col-sm-1">
            <input id="c-order_other_amount_total" class="form-control" name="row[order_other_amount_total]" type="number" value="<?php echo htmlentities($row['order_other_amount_total']); ?>">
        </div>
        <label class="control-label col-xs-12 col-sm-1"><?php echo __('Order_total_amount_total'); ?>:</label>
        <div class="col-xs-12 col-sm-1">
            <input id="c-order_total_amount_total" class="form-control" name="row[order_total_amount_total]" type="number" value="<?php echo htmlentities($row['order_total_amount_total']); ?>">
        </div>
	 </div>
    <div class="form-group">
        
        
        <label class="control-label col-xs-12 col-sm-1"><?php echo __('Order_freight_type'); ?>:</label>
        <div class="col-xs-12 col-sm-2">
            <div class="radio">
            <?php if(is_array($orderFreightTypeList) || $orderFreightTypeList instanceof \think\Collection || $orderFreightTypeList instanceof \think\Paginator): if( count($orderFreightTypeList)==0 ) : echo "" ;else: foreach($orderFreightTypeList as $key=>$vo): ?>
            <label for="row[order_freight_type]-<?php echo $key; ?>"><input id="row[order_freight_type]-<?php echo $key; ?>" name="row[order_freight_type]" type="radio" value="<?php echo $key; ?>" <?php if(in_array(($key), is_array($row['order_freight_type'])?$row['order_freight_type']:explode(',',$row['order_freight_type']))): ?>checked<?php endif; ?> /> <?php echo $vo; ?></label> 
            <?php endforeach; endif; else: echo "" ;endif; ?>
            </div>            
        </div>
   
        <label class="control-label col-xs-12 col-sm-1"><?php echo __('Order_isdelivery'); ?>:</label>
        <div class="col-xs-12 col-sm-2">
            <div class="radio">
            <?php if(is_array($orderIsdeliveryList) || $orderIsdeliveryList instanceof \think\Collection || $orderIsdeliveryList instanceof \think\Paginator): if( count($orderIsdeliveryList)==0 ) : echo "" ;else: foreach($orderIsdeliveryList as $key=>$vo): ?>
            <label for="row[order_isdelivery]-<?php echo $key; ?>"><input id="row[order_isdelivery]-<?php echo $key; ?>" name="row[order_isdelivery]" type="radio" value="<?php echo $key; ?>" <?php if(in_array(($key), is_array($row['order_isdelivery'])?$row['order_isdelivery']:explode(',',$row['order_isdelivery']))): ?>checked<?php endif; ?> /> <?php echo $vo; ?></label> 
            <?php endforeach; endif; else: echo "" ;endif; ?>
            </div>              
        </div> 
       <label class="control-label col-xs-12 col-sm-1"></label>
        <div class="col-xs-12 col-sm-5">
            <button type="button" id="new"  class="btn btn-info btn-embossed btn-new"><?php echo __('新建'); ?></button>
            <button type="button" class="btn btn-success btn-embossed btn-save"><?php echo __('暂存'); ?></button>  
            <button type="button" id="save"  class="btn btn-success btn-embossed btn-savedraft"><?php echo __('保存草稿'); ?></button>
            <button type="button" class="btn btn-info btn-printing  btn-embossed"><?php echo __('打印'); ?></button>
            <button type="button" class="btn btn-success btn-embossed btn-verify"><?php echo __('审核过账'); ?></button>
            <button type="button" class="btn btn-info btn-embossed btn-open"><?php echo __('打开草稿'); ?></button>
        </div>
    </div>
   
    <div class="form-group layer-footer">
        
    </div>
</form>

    
        <div id="myTabContent" class="tab-content">
            <div class="tab-pane fade active in" id="one">
                <div class="widget-body no-padding">
                    <div id="toolbar" class="toolbar">
                        <a href="javascript:;" class="btn btn-primary btn-refresh" title="<?php echo __('Refresh'); ?>" ><i class="fa fa-refresh"></i> </a>
                        <a href="javascript:;" class="btn btn-success btn-add <?php echo $auth->check('sale/detailtemp/add')?'':'hide'; ?>" title="<?php echo __('Add'); ?>" ><i class="fa fa-plus"></i> <?php echo __('Add'); ?></a>
                        <a href="javascript:;" class="btn btn-success btn-edit btn-disabled disabled <?php echo $auth->check('sale/detailtemp/edit')?'':'hide'; ?>" title="<?php echo __('Edit'); ?>" ><i class="fa fa-pencil"></i> <?php echo __('Edit'); ?></a>
                        <a href="javascript:;" class="btn btn-danger btn-del btn-disabled disabled <?php echo $auth->check('sale/detailtemp/del')?'':'hide'; ?>" title="<?php echo __('Delete'); ?>" ><i class="fa fa-trash"></i> <?php echo __('Delete'); ?></a>
                        <a href="javascript:;" class="btn btn-danger btn-import <?php echo $auth->check('sale/detailtemp/import')?'':'hide'; ?>" title="<?php echo __('Import'); ?>" id="btn-import-file" data-url="ajax/upload" data-mimetype="csv,xls,xlsx" data-multiple="false"><i class="fa fa-upload"></i> <?php echo __('Import'); ?></a>

                        <div class="dropdown btn-group <?php echo $auth->check('sale/detailtemp/multi')?'':'hide'; ?>">
                            <a class="btn btn-primary btn-more dropdown-toggle btn-disabled disabled" data-toggle="dropdown"><i class="fa fa-cog"></i> <?php echo __('More'); ?></a>
                            <ul class="dropdown-menu text-left" role="menu">
                                <li><a class="btn btn-link btn-multi btn-disabled disabled" href="javascript:;" data-params="status=normal"><i class="fa fa-eye"></i> <?php echo __('Set to normal'); ?></a></li>
                                <li><a class="btn btn-link btn-multi btn-disabled disabled" href="javascript:;" data-params="status=hidden"><i class="fa fa-eye-slash"></i> <?php echo __('Set to hidden'); ?></a></li>
                            </ul>
                        </div>

                        
                    </div>
                    <table id="table" class="table table-striped table-bordered table-hover table-nowrap"
                           data-operate-edit="<?php echo $auth->check('sale/detailtemp/edit'); ?>" 
                           data-operate-del="<?php echo $auth->check('sale/detailtemp/del'); ?>" 
                           width="100%">
                    </table>
                </div>
            </div>

        </div>
    </div>
</div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="/assets/js/require<?php echo \think\Config::get('app_debug')?'':'.min'; ?>.js" data-main="/assets/js/require-backend<?php echo \think\Config::get('app_debug')?'':'.min'; ?>.js?v=<?php echo htmlentities($site['version']); ?>"></script>
    </body>
</html>
