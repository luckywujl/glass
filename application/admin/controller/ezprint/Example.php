<?php

namespace app\admin\controller\ezprint;

use app\common\controller\Backend;

/**
 * 
 *
 * @icon fa fa-circle-o
 */
class Example extends Backend
{
    
    /**
     * Example模型对象
     * @var \app\admin\model\printing\Example
     */
    protected $model = null;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\admin\model\ezprint\Example;

    }
    
    /**
     * 默认生成的控制器所继承的父类中有index/add/edit/del/multi五个基础方法、destroy/restore/recyclebin三个回收站方法
     * 因此在当前控制器中可不用编写增删改查的代码,除非需要自己控制这部分逻辑
     * 需要将application/admin/library/traits/Backend.php中对应的方法复制到当前控制器,然后进行修改
     */
    
    public function getAllData()
    {
        if ($this->request->isAjax()) {
            $list = $this->model->select();
            $list = collection($list)->toArray();
            foreach ($list as $k=>$v) {
                $list[$k]['createtime'] = date('Y-m-s h:i:s', $v['createtime']);
            }
            $result = array("rows" => $list);

            return json($result);
        }
        return $this->view->fetch();
    }

    public function heTong()
    {
        $list = array(
            'company1'=>'公司1',
            'name1'=>'名字1',
            'name2'=>'名字2',
            'addr1'=>'地址1',
            'addr2'=>'地址2',
            'bank1'=>'银行1',
            'bank2'=>'银行2',
            'price'=>'100000万',
            'company2'=>'公司2');
        $result = array("data" => $list);
        return json($result);
    }
}
