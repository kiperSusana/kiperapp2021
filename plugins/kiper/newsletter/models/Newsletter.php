<?php namespace Kiper\Newsletter\Models;

use Model;

/**
 * Model
 */
class Newsletter extends Model
{
    use \October\Rain\Database\Traits\Validation;
    
    use \October\Rain\Database\Traits\SoftDelete;

    protected $dates = ['deleted_at'];


    /**
     * @var string The database table used by the model.
     */
    public $table = 'kiper_newsletter_newsletter';

    /**
     * @var array Validation rules
     */
    public $rules = [
    ];
}
