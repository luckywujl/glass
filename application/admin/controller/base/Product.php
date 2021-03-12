<?php

namespace app\admin\controller\base;

use app\common\controller\Backend;

/**
 * 产品信息
 *
 * @icon fa fa-circle-o
 */
class Product extends Backend
{
    
    /**
     * Product模型对象
     * @var \app\admin\model\base\Product
     */
    protected $model = null;
    protected $dataLimit = 'personal';
    protected $dataLimitField = 'company_id';
    protected $dataCreateField = null;
    protected $searchFields = 'product_name,product_code,product_specs';
    protected $noNeedRight = ['index','getproduct','getspecs','getprice'];

    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\admin\model\base\Product;
        $this->view->assign("productStatusList", $this->model->getProductStatusList());
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
    /**
     * 获取产品名称
     */
    public function getproduct()
    {
        //设置过滤方法
        $this->request->filter(['strip_tags', 'trim']);
        if ($this->request->isAjax()) {
            list($where, $sort, $order, $offset, $limit) = $this->buildparams();
            $list = $this->model
                ->where($where)
                ->group('product_name')
                ->order($sort, $order)
                ->paginate($limit);
            $result = array("total" => $list->total(), "rows" => $list->items());
            return json($result);
        }
        
    }
    
    /**
     * 获取规格
     */
    public function getspecs()
    {
    	  $product = $this->request->param();
    	//  $product = input('?product');
        //设置过滤方法
        $this->request->filter(['strip_tags', 'trim']);
        if ($this->request->isAjax()) {
            list($where, $sort, $order, $offset, $limit) = $this->buildparams();
            $list = $this->model
                ->where($where)
                ->where('product_name',$product['product_name'])
                ->order($sort, $order)
                ->paginate($limit);
            $result = array("total" => $list->total(), "rows" => $list->items());
            return json($result);
        }
       
    }
    
    /**
     * 获取价格
     */
    public function getprice()
    {
    	  $product = $this->request->param();
    	//  $product = input('?product');
        //设置过滤方法
        $this->request->filter(['strip_tags', 'trim']);
        if ($this->request->isAjax()) {
            list($where, $sort, $order, $offset, $limit) = $this->buildparams();
            $list = $this->model
                ->where($where)
                ->where(['product_name'=>$product['product_name'],'product_specs'=>$product['product_specs']])
                ->find();
            if($list) {
    				$this->success('成功获取产品信息',null,$list); 
    				}  
           
        }
        
    }


}
