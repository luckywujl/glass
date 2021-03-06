<?php

namespace app\admin\controller\sale;

use app\common\controller\Backend;

/**
 * 订单信息
 *
 * @icon fa fa-circle-o
 */
class Ordermain extends Backend
{
    
    /**
     * Ordermain模型对象
     * @var \app\admin\model\sale\Ordermain
     */
    protected $model = null;
    protected $dataLimit = 'personal';
    protected $dataLimitField = 'company_id';
    protected $dataCreateField = null;
    protected $searchFields = 'order_custom_name,order_custom_contact,order_custom_tel,';
    

    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\admin\model\sale\Ordermain;
        $this->view->assign("orderFreightTypeList", $this->model->getOrderFreightTypeList());
        $this->view->assign("orderIsdeliveryList", $this->model->getOrderIsdeliveryList());
        $this->view->assign("orderStatusList", $this->model->getOrderStatusList());
    }

    public function import()
    {
        parent::import();
    }

    /**
     * 默认生成的控制器所继承的父类中有index/add/edit/del/multi五个基础方法、destroy/restore/recyclebin三个回收站方法
     * 因此在当前控制器中可不用编写增删改查的代码,除非需要自己控制这部分逻辑
     * 需要将application/admin/library/traits/Backend.php中对应的方法复制到当前控制器,然后进行修改
     */
    

}
