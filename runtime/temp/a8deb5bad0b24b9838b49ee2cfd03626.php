<?php if (!defined('THINK_PATH')) exit(); /*a:4:{s:95:"/home/www/admin/localhost_9004/wwwroot/public/../application/admin/view/base/personnel/add.html";i:1614903694;s:81:"/home/www/admin/localhost_9004/wwwroot/application/admin/view/layout/default.html";i:1611580234;s:78:"/home/www/admin/localhost_9004/wwwroot/application/admin/view/common/meta.html";i:1611580234;s:80:"/home/www/admin/localhost_9004/wwwroot/application/admin/view/common/script.html";i:1611580234;}*/ ?>
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

    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Personnel_code'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-personnel_code" data-rule="required" class="form-control" name="row[personnel_code]" type="text">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Personnel_name'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-personnel_name"  data-rule="required" class="form-control" name="row[personnel_name]" type="text">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Personnel_sex'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
                        
           <div class="radio">
            <?php if(is_array($personnelSexList) || $personnelSexList instanceof \think\Collection || $personnelSexList instanceof \think\Paginator): if( count($personnelSexList)==0 ) : echo "" ;else: foreach($personnelSexList as $key=>$vo): ?>
            <label for="row[personnel_ses]-<?php echo $key; ?>"><input id="row[personnel_sex]-<?php echo $key; ?>" name="row[personnel_sex]" type="radio" value="<?php echo $key; ?>" <?php if(in_array(($key), explode(',',"1"))): ?>checked<?php endif; ?> /> <?php echo $vo; ?></label> 
            <?php endforeach; endif; else: echo "" ;endif; ?>
            </div>

        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Personnel_tel'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-personnel_tel" class="form-control" name="row[personnel_tel]" type="text">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Personnel_processes'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-personnel_processes" data-rule="required" class="form-control selectpage" data-source="base/processes/index" data-field="processes_name" data-primary-key="processes_name"  name="row[personnel_processes]" type="text">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Personnel_status'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            
            <div class="radio">
            <?php if(is_array($personnelStatusList) || $personnelStatusList instanceof \think\Collection || $personnelStatusList instanceof \think\Paginator): if( count($personnelStatusList)==0 ) : echo "" ;else: foreach($personnelStatusList as $key=>$vo): ?>
            <label for="row[personnel_status]-<?php echo $key; ?>"><input id="row[personnel_status]-<?php echo $key; ?>" name="row[personnel_status]" type="radio" value="<?php echo $key; ?>" <?php if(in_array(($key), explode(',',"1"))): ?>checked<?php endif; ?> /> <?php echo $vo; ?></label> 
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
