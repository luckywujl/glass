<?php

namespace app\admin\model\base;

use think\Model;


class Processes extends Model
{

    

    

    // 表名
    protected $name = 'base_processes';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = false;

    // 定义时间戳字段名
    protected $createTime = false;
    protected $updateTime = false;
    protected $deleteTime = false;

    // 追加属性
    protected $append = [
        'processes_print_text'
    ];
    

    
    public function getProcessesPrintList()
    {
        return ['0' => __('Processes_print 0'), '1' => __('Processes_print 1')];
    }


    public function getProcessesPrintTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['processes_print']) ? $data['processes_print'] : '');
        $list = $this->getProcessesPrintList();
        return isset($list[$value]) ? $list[$value] : '';
    }




}
