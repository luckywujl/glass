<?php

namespace app\admin\model\base;

use think\Model;


class Product extends Model
{

    

    

    // 表名
    protected $name = 'base_product';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = false;

    // 定义时间戳字段名
    protected $createTime = false;
    protected $updateTime = false;
    protected $deleteTime = false;

    // 追加属性
    protected $append = [
        'product_status_text'
    ];
    

    
    public function getProductStatusList()
    {
        return ['0' => __('Product_status 0'), '1' => __('Product_status 1')];
    }


    public function getProductStatusTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['product_status']) ? $data['product_status'] : '');
        $list = $this->getProductStatusList();
        return isset($list[$value]) ? $list[$value] : '';
    }




}
