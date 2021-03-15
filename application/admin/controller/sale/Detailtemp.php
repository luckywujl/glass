<?php

namespace app\admin\controller\sale;

use app\common\controller\Backend;
use think\Db;
use app\admin\model\base as base;
use app\admin\model\sale as sale;

/**
 * 订单明细表临时管理
 *
 * @icon fa fa-circle-o
 */
class Detailtemp extends Backend
{
    
    /**
     * Detailtemp模型对象
     * @var \app\admin\model\sale\Detailtemp
     */
    protected $model = null;
    protected $dataLimit = 'personal';
    protected $dataLimitField = 'company_id';
    protected $dataCreateField = null;
    //protected $searchFields = 'custom_name,custom_contact';
    //protected $noNeedRight = ['index','getcustominfo'];

    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\admin\model\sale\Detailtemp;
        
        $maintemp = new \app\admin\model\sale\Maintemp;
        $this->view->assign("orderFreightTypeList", $maintemp->getOrderFreightTypeList());
        $this->view->assign("orderIsdeliveryList", $maintemp->getOrderIsdeliveryList());
        $this->view->assign("orderStatusList", $maintemp->getOrderStatusList());
        
        $this->view->assign("detailIsurgentList", $this->model->getDetailIsurgentList());
        $this->view->assign("detailIsedgingList", $this->model->getDetailIsedgingList());
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
     * 查看
     */
    public function index()
    {
        //设置过滤方法
        $this->request->filter(['strip_tags', 'trim']);
        
            $order_main_temp = new sale\Maintemp();
            $main_temp = $order_main_temp
            	->where(['order_operator'=>$this->auth->nickname,'company_id'=>$this->auth->company_id])
            	->find();
        if ($this->request->isAjax()) {
            //如果发送的来源是Selectpage，则转发到Selectpage
            if ($this->request->request('keyField')) {
                return $this->selectpage();
            }
            list($where, $sort, $order, $offset, $limit) = $this->buildparams();

            $list = $this->model
                ->where($where)
                ->order($sort, $order)
                ->paginate($limit);

            $result = array("total" => $list->total(), "rows" => $list->items());

            return json($result);
        }
        $this->view->assign("row", $main_temp);
        return $this->view->fetch();
    }
    /**
     * 添加
     */
    public function add()
    {
        if ($this->request->isPost()) {
            $params = $this->request->post("row/a");
            if ($params) {
                $params = $this->preExcludeFields($params);

                if ($this->dataLimit && $this->dataLimitFieldAutoFill) {
                    $params[$this->dataLimitField] = $this->auth->company_id;
                }
                $result = false;
                Db::startTrans();
                try {
                    //是否采用模型验证
                    if ($this->modelValidate) {
                        $name = str_replace("\\model\\", "\\validate\\", get_class($this->model));
                        $validate = is_bool($this->modelValidate) ? ($this->modelSceneValidate ? $name . '.add' : $name) : $this->modelValidate;
                        $this->model->validateFailException(true)->validate($validate);
                    }
                    $result = $this->model->allowField(true)->save($params);
                    Db::commit();
                } catch (ValidateException $e) {
                    Db::rollback();
                    $this->error($e->getMessage());
                } catch (PDOException $e) {
                    Db::rollback();
                    $this->error($e->getMessage());
                } catch (Exception $e) {
                    Db::rollback();
                    $this->error($e->getMessage());
                }
                if ($result !== false) {
                    $this->success();
                } else {
                    $this->error(__('No rows were inserted'));
                }
            }
            $this->error(__('Parameter %s can not be empty', ''));
        }
        //为备注和工艺要求准备下拉数据
        $specification = new base\Specification();
        $remark = new base\Remark();
        list($where, $sort, $order, $offset, $limit) = $this->buildparams();
        $specification_list = $specification->where($where)->select();
        $remark_list = $remark->where($where)->select();
        $this->view->assign("detailSpecificationList", $specification_list);   
        $this->view->assign("detailRemarkList", $remark_list); 
        $discount = $_REQUEST['discount'];
        $this->view->assign("detail_discount",$discount);   
        return $this->view->fetch();
    }

    
    /**
     * 编辑
     */
    public function edit($ids =null)
    {
        if ($this->request->isPost()) {
            $params = $this->request->post("row/a");
            if ($params) {
                $params = $this->preExcludeFields($params);
                $result = false;
                Db::startTrans();
                try {              
				        $result = $this->model
                    		->where('detail_id',$params['detail_id'])
                    		->update($params);                    
                    Db::commit();
                } catch (ValidateException $e) {
                    Db::rollback();
                    $this->error($e->getMessage());
                } catch (PDOException $e) {
                    Db::rollback();
                    $this->error($e->getMessage());
                } catch (Exception $e) {
                    Db::rollback();
                    $this->error($e->getMessage());
                }
                if ($result !== false) {
                    $this->success('保存！');
                } else {
                    $this->error(__('No rows were updated'));
                }
            }
            $this->error(__('Parameter %s can not be empty', ''));
        }
        //进入编辑页面
        $row = $this->model->get($ids);
        if (!$row) {
            $this->error(__('No Results were found'));
        }
        $adminIds = $this->getDataLimitAdminIds();
        if (is_array($adminIds)) {
            if (!in_array($row[$this->dataLimitField], $adminIds)) {
                $this->error(__('You have no permission'));
            }
        }
        //为备注和工艺要求准备下拉数据
        $specification = new base\Specification();
        $remark = new base\Remark();
        list($where, $sort, $order, $offset, $limit) = $this->buildparams();
        $specification_list = $specification->where($where)->select();
        $remark_list = $remark->where($where)->select();
        $this->view->assign("detailSpecificationList", $specification_list);   
        $this->view->assign("detailRemarkList", $remark_list);
        $this->view->assign("row", $row);
        return $this->view->fetch();
    }


}
