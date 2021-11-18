<?php namespace Kiper\Newsletter\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateKiperNewsletterNewsletter extends Migration
{
    public function up()
    {
        Schema::create('kiper_newsletter_newsletter', function($table)
        {
            $table->engine = 'InnoDB';
            $table->increments('id');
            $table->timestamp('created_at')->nullable();
            $table->timestamp('updated_at')->nullable();
            $table->timestamp('deleted_at')->nullable();
            $table->string('email', 255)->nullable();
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('kiper_newsletter_newsletter');
    }
}
