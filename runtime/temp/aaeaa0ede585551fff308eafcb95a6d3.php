<?php if (!defined('THINK_PATH')) exit(); /*a:4:{s:96:"/home/www/admin/localhost_9004/wwwroot/public/../application/admin/view/sale/detailtemp/add.html";i:1615473244;s:81:"/home/www/admin/localhost_9004/wwwroot/application/admin/view/layout/default.html";i:1611580234;s:78:"/home/www/admin/localhost_9004/wwwroot/application/admin/view/common/meta.html";i:1611580234;s:80:"/home/www/admin/localhost_9004/wwwroot/application/admin/view/common/script.html";i:1611580234;}*/ ?>
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
                                <form id="add-form" class="form-horizontal" role="form" data-toggle="validator" method="POST" action="">

    <div class="col-xs-12 col-sm-8" hidden="hidden">
            <input id="c-detail_order_code"  class="form-control" name="row[detail_order_code]" type="text" >
    </div>
     <div class="form-group">
     &nbsp;
     </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Detail_datetime'); ?>:</label>
        <div class="col-xs-12 col-sm-2">
            <input id="c-detail_datetime" data-rule="required" class="form-control datetimepicker" data-date-format="YYYY-MM-DD" data-use-current="true" name="row[detail_datetime]" type="text" value="<?php echo date('Y-m-d'); ?>">
        </div>
    
        <label class="control-label col-xs-12 col-sm-1"><?php echo __('Detail_delivery_date'); ?>:</label>
        <div class="col-xs-12 col-sm-2">
            <input id="c-detail_delivery_date" data-rule="required" class="form-control datetimepicker" data-date-format="YYYY-MM-DD" data-use-current="true" name="row[detail_delivery_date]" type="text" value="<?php echo date('Y-m-d'); ?>">
        </div>

        <label class="control-label col-xs-12 col-sm-1"><?php echo __('Detail_isurgent'); ?>:</label>
        <div class="col-xs-12 col-sm-2">
        		<div class="radio">
            <?php if(is_array($detailIsurgentList) || $detailIsurgentList instanceof \think\Collection || $detailIsurgentList instanceof \think\Paginator): if( count($detailIsurgentList)==0 ) : echo "" ;else: foreach($detailIsurgentList as $key=>$vo): ?>
            <label for="row[detail_isurgent]-<?php echo $key; ?>"><input id="row[detail_isurgent]-<?php echo $key; ?>" name="row[detail_isurgent]" type="radio" value="<?php echo $key; ?>" <?php if(in_array(($key), explode(',',"0"))): ?>checked<?php endif; ?> /> <?php echo $vo; ?></label> 
            <?php endforeach; endif; else: echo "" ;endif; ?>
            </div>     
                        
            

        </div>
    </div>
    
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Detail_product_name'); ?>:</label>
        <div class="col-xs-12 col-sm-2">
            <input id="c-detail_product_name" data-rule="required" class="form-control selectpage" data-source="base/product/getproduct" data-field="product_name" data-primary-key="product_name" name="row[detail_product_name]" type="text">
        </div>

        <label class="control-label col-xs-12 col-sm-1"><?php echo __('Detail_product_specs'); ?>:</label>
        <div class="col-xs-12 col-sm-2">
            <input id="c-detail_product_specs" data-rule="required" class="form-control selectpage" data-source="base/product/getspecs" data-field="product_specs" data-primary-key="product_specs" name="row[detail_product_specs]" type="text">
        </div>

        <label class="control-label col-xs-12 col-sm-1"><?php echo __('Detail_price'); ?>:</label>
        <div class="col-xs-12 col-sm-2">
            <input id="c-detail_price" data-rule="required" class="form-control" name="row[detail_price]" type="number">
        </div>
    </div>
    <div class="form-group">
    		
    	  <label class="control-label col-xs-12 col-sm-2"><?php echo __('Detail_useposition'); ?>:</label>
        <div class="col-xs-12 col-sm-2">
            <input id="c-detail_useposition" class="form-control" name="row[detail_useposition]" type="text">
        </div>
        <label class="control-label col-xs-12 col-sm-1"><?php echo __('Detail_discount'); ?>:</label>
        <div class="col-xs-12 col-sm-2">
            <input id="c-detail_discount" class="form-control" name="row[detail_discount]" type="number">
        </div>
        <label class="control-label col-xs-12 col-sm-1"><?php echo __('Detail_hole'); ?>:</label>
        <div class="col-xs-12 col-sm-2">
            <input id="c-detail_hole" class="form-control" name="row[detail_hole]" type="number">
        </div>

       
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Detail_long'); ?>:</label>
        <div class="col-xs-12 col-sm-2">
            <input id="c-detail_long" data-rule="required" class="form-control" name="row[detail_long]" type="number">
        </div>
    
        <label class="control-label col-xs-12 col-sm-1"><?php echo __('Detail_wide'); ?>:</label>
        <div class="col-xs-12 col-sm-2">
            <input id="c-detail_wide" data-rule="required" class="form-control" name="row[detail_wide]" type="number">
        </div>
    
        <label class="control-label col-xs-12 col-sm-1"><?php echo __('Detail_number'); ?>:</label>
        <div class="col-xs-12 col-sm-2">
            <input id="c-detail_number" data-rule="required" class="form-control" name="row[detail_number]" type="number">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Detail_area'); ?>:</label>
        <div class="col-xs-12 col-sm-2">
            <input id="c-detail_area" data-rule="required" class="form-control" name="row[detail_area]" type="number">
        </div>
    
        <label class="control-label col-xs-12 col-sm-1"><?php echo __('Detail_length'); ?>:</label>
        <div class="col-xs-12 col-sm-2">
            <input id="c-detail_length" class="form-control" name="row[detail_length]" type="number">
        </div>
   
        <label class="control-label col-xs-12 col-sm-1"><?php echo __('Detail_amount'); ?>:</label>
        <div class="col-xs-12 col-sm-2">
            <input id="c-detail_amount" class="form-control" name="row[detail_amount]" type="number">
        </div>
    </div>
     <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Detail_specification'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-detail_specification" class="form-control selectpage" data-source="base/specification/index" data-field="specification_name" data-primary-key="specification_name" data-multiple="true"  name="row[detail_specification]" type="text">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Detail_remark'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-detail_remark" class="form-control" name="row[detail_remark]" list="remark_list" type="text">
            <datalist id="remark_list" style="display:none;">
   				 <?php if(is_array($detailRemarkList) || $detailRemarkList instanceof \think\Collection || $detailRemarkList instanceof \think\Paginator): if( count($detailRemarkList)==0 ) : echo "" ;else: foreach($detailRemarkList as $key=>$vo): ?>
                    <option value="<?php echo $vo['remark_name']; ?>" {/in}><?php echo $vo['remark_name']; ?></option>
                <?php endforeach; endif; else: echo "" ;endif; ?>
				</datalist>  

		 </div>
    </div>
    
    
    <div class="form-group layer-footer">
        <label class="control-label col-xs-12 col-sm-4"></label>
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
