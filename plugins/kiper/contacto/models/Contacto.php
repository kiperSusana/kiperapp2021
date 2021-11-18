<?php namespace Kiper\Contacto\Models;

use Model;

/**
 * Model
 */
class Contacto extends Model
{
    use \October\Rain\Database\Traits\Validation;
    
    use \October\Rain\Database\Traits\SoftDelete;

    protected $dates = ['deleted_at'];


    /**
     * @var string The database table used by the model.
     */
    public $table = 'kiper_contacto_contacto';

    /**
     * @var array Validation rules
     */
    public $rules = [
    ];
}
