<?php

namespace addons\ezprint;

use app\common\library\Menu;
use think\Addons;

/**
 * 插件
 */
class Ezprint extends Addons
{

    /**
     * 插件安装方法
     * @return bool
     */
    public function install()
    {
        $menu = [
            [
                'name'    => 'ezprint',
                'title'   => '打印管理',
                'icon'    => 'fa fa-magic',
                'sublist' => [
                    [
                        'name'    => 'ezprint/printing',
                        'title'   => '模板管理',
                        'icon'    => 'fa fa-print',
                        'weigh'  => 100,
                        'ismenu' => 1
                    ],
                    [
                        'name'    => 'ezprint/example',
                        'title'   => '打印示例',
                        'icon'    => 'fa fa-print',
                        'weigh'   => 90,
                        'ismenu' => 1
                    ]
                ]
            ]
        ];
        Menu::create($menu);
        
        return true;
    }

    /**
     * 插件卸载方法
     * @return bool
     */
    public function uninstall()
    {
        Menu::delete('ezprint');
        return true;
    }

    /**
     * 插件启用方法
     * @return bool
     */
    public function enable()
    {
        Menu::enable('ezprint');
        return true;
    }

    /**
     * 插件禁用方法
     * @return bool
     */
    public function disable()
    {
        Menu::disable('ezprint');
        return true;
    }


}
