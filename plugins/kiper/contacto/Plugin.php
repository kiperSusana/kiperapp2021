<?php namespace Kiper\Contacto;

use System\Classes\PluginBase;

class Plugin extends PluginBase
{
    public function registerComponents()
    {
        return [
            'kiper\Contacto\Components\Contacto' => 'frmContacto'
        ];
    }

    public function registerSettings()
    {
    }
}
