<?php if (!defined('THINK_PATH')) exit(); /*a:4:{s:96:"/home/www/admin/localhost_9004/wwwroot/public/../application/admin/view/sale/ordermain/edit.html";i:1615636564;s:81:"/home/www/admin/localhost_9004/wwwroot/application/admin/view/layout/default.html";i:1615636564;s:78:"/home/www/admin/localhost_9004/wwwroot/application/admin/view/common/meta.html";i:1615636564;s:80:"/home/www/admin/localhost_9004/wwwroot/application/admin/view/common/script.html";i:1615636564;}*/ ?>
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
                                <form id="edit-form" class="form-horizontal" role="form" data-toggle="validator" method="POST" action="">

    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Order_code'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-order_code" data-rule="required" class="form-control" name="row[order_code]" type="text" value="<?php echo htmlentities($row['order_code']); ?>">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Order_datetime'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-order_datetime" data-rule="required" class="form-control datetimepicker" data-date-format="YYYY-MM-DD HH:mm:ss" data-use-current="true" name="row[order_datetime]" type="text" value="<?php echo $row['order_datetime']?datetime($row['order_datetime']):''; ?>">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Order_delivery_date'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-order_delivery_date" class="form-control datetimepicker" data-date-format="YYYY-MM-DD" data-use-current="true" name="row[order_delivery_date]" type="text" value="<?php echo $row['order_delivery_date']; ?>">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Order_custom_id'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-order_custom_id" data-rule="required" data-source="order/custom/index" class="form-control selectpage" name="row[order_custom_id]" type="text" value="<?php echo htmlentities($row['order_custom_id']); ?>">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Order_custom_name'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-order_custom_name" data-rule="required" class="form-control" name="row[order_custom_name]" type="text" value="<?php echo htmlentities($row['order_custom_name']); ?>">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Order_custom_contact'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-order_custom_contact" class="form-control" name="row[order_custom_contact]" type="text" value="<?php echo htmlentities($row['order_custom_contact']); ?>">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Order_custom_tel'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-order_custom_tel" class="form-control" name="row[order_custom_tel]" type="text" value="<?php echo htmlentities($row['order_custom_tel']); ?>">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Order_custom_address'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-order_custom_address" class="form-control" name="row[order_custom_address]" type="text" value="<?php echo htmlentities($row['order_custom_address']); ?>">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Order_custom_discount'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-order_custom_discount" class="form-control" name="row[order_custom_discount]" type="number" value="<?php echo htmlentities($row['order_custom_discount']); ?>">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Order_number_total'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-order_number_total" class="form-control" name="row[order_number_total]" type="number" value="<?php echo htmlentities($row['order_number_total']); ?>">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Order_area_total'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-order_area_total" class="form-control" name="row[order_area_total]" type="number" value="<?php echo htmlentities($row['order_area_total']); ?>">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Order_length_total'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-order_length_total" class="form-control" name="row[order_length_total]" type="number" value="<?php echo htmlentities($row['order_length_total']); ?>">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Order_hole_total'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-order_hole_total" class="form-control" name="row[order_hole_total]" type="number" value="<?php echo htmlentities($row['order_hole_total']); ?>">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Order_amount_total'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-order_amount_total" class="form-control" name="row[order_amount_total]" type="number" value="<?php echo htmlentities($row['order_amount_total']); ?>">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Order_receiver'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-order_receiver" class="form-control" name="row[order_receiver]" type="text" value="<?php echo htmlentities($row['order_receiver']); ?>">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Order_saleman'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-order_saleman" class="form-control" name="row[order_saleman]" type="text" value="<?php echo htmlentities($row['order_saleman']); ?>">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Order_operator'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-order_operator" class="form-control" name="row[order_operator]" type="text" value="<?php echo htmlentities($row['order_operator']); ?>">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Order_checker'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-order_checker" class="form-control" name="row[order_checker]" type="text" value="<?php echo htmlentities($row['order_checker']); ?>">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Order_dispatcher'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-order_dispatcher" class="form-control" name="row[order_dispatcher]" type="text" value="<?php echo htmlentities($row['order_dispatcher']); ?>">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Order_freight_type'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
                        
            <select  id="c-order_freight_type" class="form-control selectpicker" name="row[order_freight_type]">
                <?php if(is_array($orderFreightTypeList) || $orderFreightTypeList instanceof \think\Collection || $orderFreightTypeList instanceof \think\Paginator): if( count($orderFreightTypeList)==0 ) : echo "" ;else: foreach($orderFreightTypeList as $key=>$vo): ?>
                    <option value="<?php echo $key; ?>" <?php if(in_array(($key), is_array($row['order_freight_type'])?$row['order_freight_type']:explode(',',$row['order_freight_type']))): ?>selected<?php endif; ?>><?php echo $vo; ?></option>
                <?php endforeach; endif; else: echo "" ;endif; ?>
            </select>

        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Order_isdelivery'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
                        
            <select  id="c-order_isdelivery" class="form-control selectpicker" name="row[order_isdelivery]">
                <?php if(is_array($orderIsdeliveryList) || $orderIsdeliveryList instanceof \think\Collection || $orderIsdeliveryList instanceof \think\Paginator): if( count($orderIsdeliveryList)==0 ) : echo "" ;else: foreach($orderIsdeliveryList as $key=>$vo): ?>
                    <option value="<?php echo $key; ?>" <?php if(in_array(($key), is_array($row['order_isdelivery'])?$row['order_isdelivery']:explode(',',$row['order_isdelivery']))): ?>selected<?php endif; ?>><?php echo $vo; ?></option>
                <?php endforeach; endif; else: echo "" ;endif; ?>
            </select>

        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Order_status'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            
            <div class="radio">
            <?php if(is_array($orderStatusList) || $orderStatusList instanceof \think\Collection || $orderStatusList instanceof \think\Paginator): if( count($orderStatusList)==0 ) : echo "" ;else: foreach($orderStatusList as $key=>$vo): ?>
            <label for="row[order_status]-<?php echo $key; ?>"><input id="row[order_status]-<?php echo $key; ?>" name="row[order_status]" type="radio" value="<?php echo $key; ?>" <?php if(in_array(($key), is_array($row['order_status'])?$row['order_status']:explode(',',$row['order_status']))): ?>checked<?php endif; ?> /> <?php echo $vo; ?></label> 
            <?php endforeach; endif; else: echo "" ;endif; ?>
            </div>

        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Company_id'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-company_id" data-rule="required" data-source="company/index" class="form-control selectpage" name="row[company_id]" type="text" value="<?php echo htmlentities($row['company_id']); ?>">
        </div>
    </div>
    <div class="form-group layer-footer">
        <label class="control-label col-xs-12 col-sm-2"></label>
        <div class="col-xs-12 col-sm-8">
            <button type="submit" class="btn btn-success btn-embossed disabled"><?php echo __('OK'); ?></button>
            <button type="reset" class="btn btn-default btn-embossed"><?php echo __('Reset'); ?></button>
        </div>
    </div>
</form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="/assets/js/require<?php echo \think\Config::get('app_debug')?'':'.min'; ?>.js" data-main="/assets/js/require-backend<?php echo \think\Config::get('app_debug')?'':'.min'; ?>.js?v=<?php echo htmlentities($site['version']); ?>"></script>
    </body>
</html>
