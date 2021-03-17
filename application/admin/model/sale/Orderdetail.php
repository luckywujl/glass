<?php

namespace app\admin\model\sale;

use think\Model;


class Orderdetail extends Model
{

    

    

    // 表名
    protected $name = 'order_detail';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = false;

    // 定义时间戳字段名
    protected $createTime = false;
    protected $updateTime = false;
    protected $deleteTime = false;

    // 追加属性
    protected $append = [
        'detail_isurgent_text',
        'detail_isedging_text',
        'detail_status_text'
    ];
    

    
    public function getDetailIsurgentList()
    {
        return ['0' => __('Detail_isurgent 0'), '1' => __('Detail_isurgent 1')];
    }

    public function getDetailIsedgingList()
    {
        return ['0' => __('Detail_isedging 0'), '1' => __('Detail_isedging 1')];
    }

    public function getDetailStatusList()
    {
        return ['0' => __('Detail_status 0'), '1' => __('Detail_status 1'), '2' => __('Detail_status 2'), '3' => __('Detail_status 3'), '4' => __('Detail_status 4')];
    }


    public function getDetailIsurgentTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['detail_isurgent']) ? $data['detail_isurgent'] : '');
        $list = $this->getDetailIsurgentList();
        return isset($list[$value]) ? $list[$value] : '';
    }


    public function getDetailIsedgingTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['detail_isedging']) ? $data['detail_isedging'] : '');
        $list = $this->getDetailIsedgingList();
        return isset($list[$value]) ? $list[$value] : '';
    }


    public function getDetailStatusTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['detail_status']) ? $data['detail_status'] : '');
        $list = $this->getDetailStatusList();
        return isset($list[$value]) ? $list[$value] : '';
    }




}
