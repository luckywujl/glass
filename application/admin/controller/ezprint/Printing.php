<?php

namespace app\admin\controller\ezprint;

use app\common\controller\Backend;

/**
 * 
 *
 * @icon fa fa-print
 */
class Printing extends Backend
{
    
    /**
     * Printing模型对象
     * @var \app\admin\model\Printing\Printing
     */
    protected $model = null;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\admin\model\ezprint\Printing;

    }
    
    /**
     * 默认生成的控制器所继承的父类中有index/add/edit/del/multi五个基础方法、destroy/restore/recyclebin三个回收站方法
     * 因此在当前控制器中可不用编写增删改查的代码,除非需要自己控制这部分逻辑
     * 需要将application/admin/library/traits/Backend.php中对应的方法复制到当前控制器,然后进行修改
     */
    
    public function get()
    {
        $data=[];
        $templateCode = $this->request->request('templateCode');
        if ($this->request->isAjax()) {
            $data = $this->model->where(['code'=>$templateCode])->find();           
        }
        if(!$data){
            $this->error("找不到模板");
        }
        $result = array("code" => 1, "msg" => 'success','data'=>$data);
        return json($result);
    }

}
