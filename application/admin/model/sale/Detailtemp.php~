<?php

namespace app\admin\model\sale;

use think\Model;


class Detailtemp extends Model
{

    

    

    // 表名
    protected $name = 'order_detail_temp';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = false;

    // 定义时间戳字段名
    protected $createTime = false;
    protected $updateTime = false;
    protected $deleteTime = false;

    // 追加属性
    protected $append = [
        'detail_isurgent_text'
    ];
    

    
    public function getDetailIsurgentList()
    {
        return ['0' => __('Detail_isurgent 0'), '1' => __('Detail_isurgent 1')];
    }


    public function getDetailIsurgentTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['detail_isurgent']) ? $data['detail_isurgent'] : '');
        $list = $this->getDetailIsurgentList();
        return isset($list[$value]) ? $list[$value] : '';
    }




}
