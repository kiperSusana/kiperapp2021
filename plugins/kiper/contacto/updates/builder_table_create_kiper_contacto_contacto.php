<?php namespace Kiper\Contacto\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateKiperContactoContacto extends Migration
{
    public function up()
    {
        Schema::create('kiper_contacto_contacto', function($table)
        {
            $table->engine = 'InnoDB';
            $table->increments('id');
            $table->string('nombre');
            $table->string('email', 255)->nullable();
            $table->string('telefono', 255)->nullable();
            $table->string('negocio', 255)->nullable();
            $table->text('mensaje')->nullable();
            $table->timestamp('created_at')->nullable();
            $table->timestamp('updated_at')->nullable();
            $table->timestamp('deleted_at')->nullable();
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('kiper_contacto_contacto');
    }
}
