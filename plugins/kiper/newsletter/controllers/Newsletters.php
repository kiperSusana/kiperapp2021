<?php namespace Kiper\Newsletter\Controllers;

use Backend\Classes\Controller;
use BackendMenu;

class Newsletters extends Controller
{
    public $implement = [        'Backend\Behaviors\ListController',        'Backend\Behaviors\FormController',       ];
    
    public $listConfig = 'config_list.yaml';
    public $formConfig = 'config_form.yaml';

    public $requiredPermissions = [
        'admin.newsletter'
    ];

    public function __construct()
    {
        parent::__construct();
        BackendMenu::setContext('Kiper.Newsletter', 'main-menu-item');
    }
}
