<?php

namespace app\admin\model\sale;

use think\Model;


class Maintemp extends Model
{

    

    

    // 表名
    protected $name = 'order_main_temp';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = false;

    // 定义时间戳字段名
    protected $createTime = false;
    protected $updateTime = false;
    protected $deleteTime = false;

    // 追加属性
    protected $append = [
        'order_datetime_text',
        'order_freight_type_text',
        'order_isdelivery_text',
        'order_status_text'
    ];
    

    
    public function getOrderFreightTypeList()
    {
        return ['0' => __('Order_freight_type 0'), '1' => __('Order_freight_type 1')];
    }

    public function getOrderIsdeliveryList()
    {
        return ['0' => __('Order_isdelivery 0'), '1' => __('Order_isdelivery 1')];
    }

    public function getOrderStatusList()
    {
        return ['0' => __('Order_status 0'), '1' => __('Order_status 1'), '2' => __('Order_status 2'), '3' => __('Order_status 3'), '4' => __('Order_status 4')];
    }


    public function getOrderDatetimeTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['order_datetime']) ? $data['order_datetime'] : '');
        return is_numeric($value) ? date("Y-m-d H:i:s", $value) : $value;
    }


    public function getOrderFreightTypeTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['order_freight_type']) ? $data['order_freight_type'] : '');
        $list = $this->getOrderFreightTypeList();
        return isset($list[$value]) ? $list[$value] : '';
    }


    public function getOrderIsdeliveryTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['order_isdelivery']) ? $data['order_isdelivery'] : '');
        $list = $this->getOrderIsdeliveryList();
        return isset($list[$value]) ? $list[$value] : '';
    }

	 public function getOrderStatusTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['order_status']) ? $data['order_status'] : '');
        $list = $this->getOrderStatusList();
        return isset($list[$value]) ? $list[$value] : '';
    }
    

    protected function setOrderDatetimeAttr($value)
    {
        return $value === '' ? null : ($value && !is_numeric($value) ? strtotime($value) : $value);
    }


}
