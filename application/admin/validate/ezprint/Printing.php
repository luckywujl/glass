<?php

namespace app\admin\validate\ezprint;

use think\Validate;

class Printing extends Validate
{
    /**
     * 验证规则
     */
    protected $rule = [
        'code|模板代码' => 'require|unique:flow_print',
    ];
    /**
     * 提示消息
     */
    protected $message = [
        'code.require' => '流程代码必须',
        'code.unique'  => '流程代码已存在',
    ];
    /**
     * 验证场景
     */
    protected $scene = [
        'add'  => [],
        'edit' => [],
    ];
    
}
