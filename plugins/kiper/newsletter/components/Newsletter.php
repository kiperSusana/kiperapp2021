<?php namespace Kiper\Newsletter\Components;

use Cms\Classes\ComponentBase;
use Kiper\Newsletter\Models\Newsletter as Usuario;
use Redirect;
use Validator;
use ValidationException;
use URL;
use Mail;
use Log;

class Newsletter extends ComponentBase
{
    public $correo;

    public function componentDetails()
    {
        return [
            'name'        => 'Formulario Newsletter',
            'description' => 'Componente para el formulario de suscripción.'
        ];
    }

    public function defineProperties()
    {
        return [];
    }

    public function onAddItem(){
        $rules = [
            'email' => "required|email"
        ];
        $messages = [
            'required' => 'El campo :attribute es requerido',
            'email.email' => 'Ingresa un :attribute electrónico válido'      ];
        
        $validation = Validator::make(post(), $rules, $messages);
        if ($validation->fails()) {
            return ['#frmNewsletter-errors' => $this->renderPartial('frmNewsletter::errors',
            ['errorMsgs' => $validation->messages()])];
        }

        $correo = post('email');

        $usuario = new Usuario;
        $usuario->email = $correo;

        if($usuario->save()){
            $data = [
                'correo' => $usuario->email,
                'id' => $usuario->id
            ];
            
            $to = ['desarrollo@kiper.app' => 'desarrollo'];
            // if ($sucursal == "Carretera nacional"){
            //     $to = ['rsalazar@toyotacarreteranacional.com' => 'rsalazar', 'krodriguez@toyotamonterrey.com.mx' => 'krodriguez'];
            // }

            try {
                    Mail::sendTo($to, 'Kiper.Newsletter::News', $data);
                } catch (Exception $e) {
                    Log::info('No se logró enviar el correo electrónico - '.$e);
                }
            //return Redirect::to(URL::to('home'));
            return ['#gracias' => $this->renderPartial('frmNewsletter::gracias')];
        }
    }
}