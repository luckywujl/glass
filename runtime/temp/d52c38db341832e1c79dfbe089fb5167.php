<?php if (!defined('THINK_PATH')) exit(); /*a:4:{s:97:"/home/www/admin/localhost_9004/wwwroot/public/../application/admin/view/sale/custominfo/edit.html";i:1614940063;s:81:"/home/www/admin/localhost_9004/wwwroot/application/admin/view/layout/default.html";i:1611580234;s:78:"/home/www/admin/localhost_9004/wwwroot/application/admin/view/common/meta.html";i:1611580234;s:80:"/home/www/admin/localhost_9004/wwwroot/application/admin/view/common/script.html";i:1611580234;}*/ ?>
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
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Custom_code'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-custom_code" data-rule="required" class="form-control" name="row[custom_code]" type="text" value="<?php echo htmlentities($row['custom_code']); ?>">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Custom_name'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-custom_name" data-rule="required" class="form-control" name="row[custom_name]" type="text" value="<?php echo htmlentities($row['custom_name']); ?>">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Custom_type'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-custom_type" data-rule="required" class="form-control selectpage" data-source="sale/customtype/index" data-field="custom_type" data-Primary-key="custom_type" name="row[custom_type]" type="text" value="<?php echo htmlentities($row['custom_type']); ?>">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Custom_tel'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-custom_tel" class="form-control" name="row[custom_tel]" type="text" value="<?php echo htmlentities($row['custom_tel']); ?>">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Custom_contact'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-custom_contact" class="form-control" name="row[custom_contact]" type="text" value="<?php echo htmlentities($row['custom_contact']); ?>">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Custom_address'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-custom_address" class="form-control" name="row[custom_address]" type="text" value="<?php echo htmlentities($row['custom_address']); ?>">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Custom_discount'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-custom_discount" data-rule="required" class="form-control" name="row[custom_discount]" type="number" value="<?php echo htmlentities($row['custom_discount']); ?>">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Custom_payable_total'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-custom_payable_total" class="form-control" name="row[custom_payable_total]" type="number" value="<?php echo htmlentities($row['custom_payable_total']); ?>">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Custom_sale_total'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-custom_sale_total" class="form-control" name="row[custom_sale_total]" type="number" value="<?php echo htmlentities($row['custom_sale_total']); ?>">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Custom_payment_total'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-custom_payment_total" class="form-control" name="row[custom_payment_total]" type="number" value="<?php echo htmlentities($row['custom_payment_total']); ?>">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Custom_remark'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-custom_remark" class="form-control" name="row[custom_remark]" type="text" value="<?php echo htmlentities($row['custom_remark']); ?>">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Custom_status'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            
            <div class="radio">
            <?php if(is_array($customStatusList) || $customStatusList instanceof \think\Collection || $customStatusList instanceof \think\Paginator): if( count($customStatusList)==0 ) : echo "" ;else: foreach($customStatusList as $key=>$vo): ?>
            <label for="row[custom_status]-<?php echo $key; ?>"><input id="row[custom_status]-<?php echo $key; ?>" name="row[custom_status]" type="radio" value="<?php echo $key; ?>" <?php if(in_array(($key), is_array($row['custom_status'])?$row['custom_status']:explode(',',$row['custom_status']))): ?>checked<?php endif; ?> /> <?php echo $vo; ?></label> 
            <?php endforeach; endif; else: echo "" ;endif; ?>
            </div>

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
