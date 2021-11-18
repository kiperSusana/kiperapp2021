<?php namespace Kiper\Newsletter;

use System\Classes\PluginBase;

class Plugin extends PluginBase
{
    public function registerComponents()
    {
        return [
            'kiper\Newsletter\Components\Newsletter' => 'frmNewsletter'
        ];
    }

    public function registerSettings()
    {
    }
}
