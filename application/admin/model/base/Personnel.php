<?php

namespace app\admin\model\base;

use think\Model;


class Personnel extends Model
{

    

    

    // 表名
    protected $name = 'base_personnel';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = false;

    // 定义时间戳字段名
    protected $createTime = false;
    protected $updateTime = false;
    protected $deleteTime = false;

    // 追加属性
    protected $append = [
        'personnel_sex_text',
        'personnel_status_text'
    ];
    

    
    public function getPersonnelSexList()
    {
        return ['0' => __('Personnel_sex 0'), '1' => __('Personnel_sex 1')];
    }

    public function getPersonnelStatusList()
    {
        return ['0' => __('Personnel_status 0'), '1' => __('Personnel_status 1')];
    }


    public function getPersonnelSexTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['personnel_sex']) ? $data['personnel_sex'] : '');
        $list = $this->getPersonnelSexList();
        return isset($list[$value]) ? $list[$value] : '';
    }


    public function getPersonnelStatusTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['personnel_status']) ? $data['personnel_status'] : '');
        $list = $this->getPersonnelStatusList();
        return isset($list[$value]) ? $list[$value] : '';
    }




}
