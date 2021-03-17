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
        list($where, $sort, $order, $offset, $limit) = $this->buildparams();
        $order_main_temp = new sale\Maintemp();
        $main_temp = $order_main_temp
        			->where($where)
            	->where(['order_operator'=>$this->auth->nickname,'company_id'=>$this->auth->company_id])
            	->find();
        if (!$main_temp){//如果没有记录，则新建一个
        		$params=[];
				$params['order_operator'] = $this->auth->nickname;
				$params['company_id'] = $this->auth->company_id;
				$result = $order_main_temp->save($params);
			   $main_temp = $order_main_temp
        			->where($where)
            	->where(['order_operator'=>$this->auth->nickname,'company_id'=>$this->auth->company_id])
            	->find();		 
        }
        
        if ($this->request->isAjax()) {
            //如果发送的来源是Selectpage，则转发到Selectpage
            if ($this->request->request('keyField')) {
                return $this->selectpage();
            }
            $list = $this->model
                ->where($where)
                ->where('order_id',$main_temp['order_id'])
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
                    $this->reorder();
                    $order_sum=$this->total();
                    Db::commit();
                    $this->reorder();
                    $order_sum=$this->total();
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
                    $this->success('OK',null,$order_sum);
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
        
        $row = $this->request->param(); 
        $this->view->assign("row",$row); 
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
                    $order_sum=$this->total();                
                    Db::commit();
                    $order_sum=$this->total();
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
                    $this->success('保存！',null,$order_sum);
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
    /**
     * 删除
     */
    public function del($ids = "")
    {
        if (!$this->request->isPost()) {
            $this->error(__("Invalid parameters"));
        }
        $ids = $ids ? $ids : $this->request->post("ids");
        if ($ids) {
            $pk = $this->model->getPk();
            $adminIds = $this->getDataLimitAdminIds();
            if (is_array($adminIds)) {
                $this->model->where($this->dataLimitField, 'in', $adminIds);
            }
            $list = $this->model->where($pk, 'in', $ids)->select();

            $count = 0;
            Db::startTrans();
            try {
                foreach ($list as $k => $v) {
                    $count += $v->delete();
                }
               $this->reorder();
               $order_sum=$this->total();
               Db::commit();
               $this->reorder();
               $order_sum=$this->total();
            } catch (PDOException $e) {
                Db::rollback();
                $this->error($e->getMessage());
            } catch (Exception $e) {
                Db::rollback();
                $this->error($e->getMessage());
            }
            if ($count) {
                $this->success('已删除！',null,$order_sum);
            } else {
                $this->error(__('No rows were deleted'));
            }
        }
        $this->error(__('Parameter %s can not be empty', 'ids'));
    }

    
    /**
    *排序
    */
    public function reorder() 
    {
    	list($where, $sort, $order, $offset, $limit) = $this->buildparams();
    	$main = new sale\Maintemp();
		$main_info = $main
				->where($where)
				->where(['order_operator'=>$this->auth->nickname,'company_id'=>$this->auth->company_id])
				->find();
		
      Db::startTrans();
      //1、生成序号
      $detail = $this->model
               ->where('order_id',$main_info['order_id'])
               ->order('detail_id asc')
               ->select();
      $info =[];        
    	$i = 0;
    	foreach($detail as $k=>$v){
    		$i = $i+1;
    		$infod =[];
    		$infod['detail_id'] = $v['detail_id'];
    		$infod['detail_no'] = $i;
    		$info[]=$infod;
    	}
    	$this->model->saveall($info);
    	Db::commit();
    	}
    	/**
    	*合计
    	*/
    	public function total() 
    	{
    	//2、合计
    	list($where, $sort, $order, $offset, $limit) = $this->buildparams();
    	$main = new sale\Maintemp();
		$main_info = $main
				->where($where)
				->where(['order_operator'=>$this->auth->nickname,'company_id'=>$this->auth->company_id])
				->find();
    	$detail_sum = $this->model
    				->field('sum(detail_number) as number,sum(detail_area) as area,sum(detail_length) as length,sum(detail_area) as area,sum(detail_amount) as amount,sum(detail_hole) as hole,sum(detail_hole_amount) as hole_amount,sum(detail_edging_amount) as edging_amount,sum(detail_urgent_amount) as urgent_amount,sum(detail_other_amount)as other_amount,sum(detail_total_amount) as total_amount')
    				->where('order_id',$main_info['order_id'])
    				->select();
    
    	$main->where('order_id',$main_info['order_id'])
    			->update(['order_number_total'=>$detail_sum[0]['number'],
    				  'order_length_total'=>$detail_sum[0]['length'],
    				  'order_area_total'=>$detail_sum[0]['area'],
    				  'order_amount_total'=>$detail_sum[0]['amount'],
    				  'order_hole_total'=>$detail_sum[0]['hole'],
    				  'order_hole_amount_total'=>$detail_sum[0]['hole_amount'],
    				  'order_edging_amount_total'=>$detail_sum[0]['edging_amount'],
    				  'order_urgent_amount_total'=>$detail_sum[0]['urgent_amount'],
    				  'order_other_amount_total'=>$detail_sum[0]['other_amount'],
    				  'order_total_amount_total'=>$detail_sum[0]['total_amount']]);
     return $detail_sum;
    }
    /**
     * 暂存
     */
    public function save()
    {
        $main_temp = new sale\Maintemp();
        if ($this->request->isPost()) {
            $params = $this->request->post("row/a");
            if ($params) {
                $params = $this->preExcludeFields($params);
                //$params['sale_datetime'] = strtotime($params['sale_datetime']) ? strtotime($params['sale_datetime']) : 0;
                $result = false;
				    $result = $main_temp
                    		->where('order_id',$params['order_id'])
                    		->update($params);
                if ($result !== false) {
                    $this->success('已暂存！',null,$params['order_id']);
                } else {
                    $this->error(__('No rows were updated'));
                }
            }  
        }
    }
    
    /**
     * 新建
     */
    public function new()
    {
				$main = new sale\Maintemp();
				$main_info = $main
					 ->where(['order_operator'=>$this->auth->nickname,'company_id'=>$this->auth->company_id])
					 ->select();
				$order_id = array_column($main_info,'order_id');	
				$result = 0;             
            Db::startTrans();
            $result = $this->model
                ->where('order_id','IN',$order_id)
                ->delete();//删除临时子表
            $result = $main
					 ->where(['order_operator'=>$this->auth->nickname,'company_id'=>$this->auth->company_id])
					 ->delete();//删除临时父表
				$params=[];
				$params['order_operator'] = $this->auth->nickname;
				$params['company_id'] = $this->auth->company_id;
				$result = $main->save($params);	 
            Db::commit();
            $order_id =$main->order_id;//产品库产品ID	
            if ($result) {
                        //$this->success();
                        $this->success('新建单据',null,$order_id);
                    } else {
                        $this->error(__('No rows were delete'));
                    }

    }
    
    /**
     * 保存草稿
     */
    public function savedraft()
    {
    	 //定义模型
        $order_main_temp = new sale\Maintemp();
        $order_main = new sale\Ordermain();
        $order_detail = new sale\Orderdetail();
        
        if ($this->request->isPost()) {
            $params = $this->request->post("row/a");
            if ($params) {
                $params = $this->preExcludeFields($params);
                $params['order_datetime'] = strtotime($params['order_datetime']) ? strtotime($params['order_datetime']) : 0;
                $result = false;
				    $result = $order_main_temp
                    		->update($params);//更新接单日期时间
              
          
        list($where, $sort, $order, $offset, $limit) = $this->buildparams();
        $main_temp = $order_main_temp
        		->where($where)
        		->where(['order_operator'=>$this->auth->nickname])
        		->find();
        Db::startTrans();
        	$info = [];
        	//确定单号
        	if($params['order_code']=='') {//如果保存的数据中不包含单号，则按规则新建单号
        		$main = $order_main
       	  	  ->where('order_datetime','between time',[date('Y-m-d 00:00:01'),date('Y-m-d 23:59:59')])
        	 	  ->where('company_id',$this->auth->company_id)
      	 	  ->order('order_code','desc')
      	     ->limit(1)
      	     ->select();
       	 	 if(count($main)>0) {
    	    	   $item = $main[0];
    	   	   $code = '0000'.(substr($item['order_code'],11,4)+1);
     	    	   $code = substr($code,strlen($code)-4,4);
      	  	   $info['order_code'] = 'JD-'.date('Ymd').$code;
      	 	  } else {
      	   	$info['order_code'] = 'JD-'.date('Ymd').'0001';
     	   	  }
      	  	}else {//如果保存的数据中包含单号，说明是已经保存的草稿
         	$info['order_code'] = $params['order_code'];
         	//删除原草稿，并重建
         	$order_main
        		->where($where)
        		->where(['order_code'=>$params['order_code']])
        		->delete();
        		$order_detail
        		->where($where)
        		->where(['detail_order_code'=>$params['order_code']])
        		->delete();
     		 }
           //保存主表到草稿
          
           $info['order_datetime'] =time();
           $info['order_delivery_date'] = $main_temp['order_delivery_date'];
           $info['order_custom_id'] = $main_temp['order_custom_id'];
           $info['order_custom_name'] = $main_temp['order_custom_name'];
           $info['order_custom_address'] = $main_temp['order_custom_address'];
           $info['order_custom_tel'] = $main_temp['order_custom_tel'];
           $info['order_custom_contact'] = $main_temp['order_custom_contact'];
           $info['order_custom_discount'] = $main_temp['order_custom_discount'];
           $info['order_number_total'] = $main_temp['order_number_total'];
           
           $info['order_area_total'] = $main_temp['order_area_total'];
           $info['order_length_total'] = $main_temp['order_length_total'];
           $info['order_amount_total'] = $main_temp['order_amount_total'];
           $info['order_hole_total'] = $main_temp['order_hole_total'];
           $info['order_hole_amount_total'] = $main_temp['order_hole_amount_total'];
           $info['order_edging_amount_total'] = $main_temp['order_edging_amount_total'];
           $info['order_urgent_amount_total'] = $main_temp['order_urgent_amount_total'];
           $info['order_other_amount_total'] = $main_temp['order_other_amount_total'];
           $info['order_total_amount_total'] = $main_temp['order_number_total'];
           $info['order_receiver'] = $main_temp['order_receiver'];
           $info['order_saleman'] = $main_temp['order_saleman'];
           $info['order_operator'] = $main_temp['order_operator'];
           $info['order_checker'] = $main_temp['order_checker'];
           $info['order_dispatcher'] = $main_temp['order_dispatcher'];
           $info['order_freight_type'] = $main_temp['order_freight_type'];
           $info['order_isdelivery'] = $main_temp['order_isdelivery'];
           $info['order_remark'] = $main_temp['order_remark'];
           $info['company_id'] = $this->auth->company_id;
           $info['order_status'] = '0';
           //保存主表至草稿
           $result = false; 
       	  $result = $order_main->save($info); 
           $order_id =$order_main->order_id;//获取保存后的主表ID，作为关联字段，同步需要要保存到子表中
           $order_code =$order_main->order_code;//order_code
           //保存子表至草稿
           $detail_temp = $this->model
           		->where($where)
           		->where('order_id',$main_temp['order_id'])
           		->select();
           $details = [];
           foreach($detail_temp as $k=>$v){
           		$infod = [];
           		$infod['order_id'] = $order_id;//关联主表的order_id
           		$infod['detail_order_code'] = $info['order_code'];	
           		$infod['detail_datetime'] = $v['detail_datetime'];
           		$infod['detail_delivery_date'] = $v['detail_delivery_date'];
           		$infod['detail_isurgent'] = $v['detail_isurgent'];	
           		$infod['detail_isedging'] = $v['detail_isedging'];
           		$infod['detail_no'] = $v['detail_no'];	
           		$infod['detail_product_name'] = $v['detail_product_name'];	
           		$infod['detail_product_specs'] = $v['detail_product_specs'];	
           		$infod['detail_price'] = $v['detail_price'];	
           		$infod['detail_discount'] = $v['detail_discount'];	
           		$infod['detail_useposition'] = $v['detail_useposition'];	
           		$infod['detail_long'] = $v['detail_long'];	
           		$infod['detail_wide'] = $v['detail_wide'];
           		$infod['detail_number'] = $v['detail_number'];	
           		$infod['detail_area'] = $v['detail_area'];	
           		$infod['detail_length'] = $v['detail_length'];		
           		$infod['detail_amount'] = $v['detail_amount'];	
           		$infod['detail_hole'] = $v['detail_hole'];	
           		$infod['detail_hole_price'] = $v['detail_hole_price'];	
           		$infod['detail_hole_amount'] = $v['detail_hole_amount'];	
           		$infod['detail_edging_amount'] = $v['detail_edging_amount'];	
           		$infod['detail_urgent_amount'] = $v['detail_urgent_amount'];	
           		$infod['detail_other_amount'] = $v['detail_other_amount'];	
           		$infod['detail_total_amount'] = $v['detail_total_amount'];	
           		$infod['detail_remark'] = $v['detail_remark'];	
           		$infod['detail_specification'] = $v['detail_specification'];	
           		$infod['detail_status'] ='0';	
           		$infod['company_id'] = $v['company_id'];	
           		$details[] = $infod;
           }
          $resultd = $order_detail->saveAll($details);       	
       	 Db::commit();
          	
 
        if ($result !== false) {
            $this->success($order_code,null,$order_code);
         } else {
            $this->error(__('No rows were updated'));
         }
         //} else {
          //          $this->error(__('No rows were updated'));
           //     }
            }  
        }
    }


}
