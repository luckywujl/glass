<?php

namespace app\admin\model\base;

use think\Model;


class Remark extends Model
{

    

    

    // 表名
    protected $name = 'base_remark';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = false;

    // 定义时间戳字段名
    protected $createTime = false;
    protected $updateTime = false;
    protected $deleteTime = false;

    // 追加属性
    protected $append = [

    ];
    

    







}
