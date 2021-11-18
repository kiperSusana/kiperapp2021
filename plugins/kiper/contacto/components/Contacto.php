<?php namespace Kiper\Contacto\Components;

use Cms\Classes\ComponentBase;
use Kiper\Contacto\Models\Contacto as Usuario;
use Redirect;
use Validator;
use ValidationException;
use URL;
use Mail;
use Log;

class Contacto extends ComponentBase
{
    public $nombre;
    public $correo;
    public $telefono;
    public $negocio;
    public $mensaje;

    public function componentDetails()
    {
        return [
            'name'        => 'Formulario de contacto',
            'description' => 'Componente para el formulario de contacto general.'
        ];
    }

    public function defineProperties()
    {
        return [];
    }

    public function onAddItem(){
        $rules = [
            'nombre' => "required|min:3",
            'email' => "required|email",
            'telefono' => "required|numeric|digits:10",
            'negocio' => "required",
            'mensaje' => "max:512"
        ];
        $messages = [
            'required' => 'El campo :attribute es requerido',
            'telefono.required' => 'El campo teléfono es requerido',
            'telefono.digits' => ' Ingresa un teléfono a 10 dígitos.',
            'telefono.numeric' => 'Ingresa sólo digitos numéricos',
            'min' => 'Ingresa mínimo :min caracteres en el campo :attribute',
            'max' => 'Ingresa máximo :max caracteres en el campo :attribute',
            'email.email' => 'Ingresa un :attribute electrónico válido',
            'negocio.required' => 'Elige una sucursal',
            'mensaje.required' => 'Escríbenos un mensaje'        ];
        
        $validation = Validator::make(post(), $rules, $messages);
        if ($validation->fails()) {
            return ['#frmContacto-errors' => $this->renderPartial('frmContacto::errors',
            ['errorMsgs' => $validation->messages()])];
        }

        $nombre = post('nombre');
        $correo = post('email');
        $telefono = post('telefono');
        $negocio = post('negocio');
        $mensaje = post('mensaje');

        $usuario = new Usuario;
        $usuario->nombre = $nombre;
        $usuario->email = $correo;
        $usuario->telefono = $telefono;
        $usuario->negocio = $negocio;
        $usuario->mensaje = $mensaje;

        if($usuario->save()){
            $data = [
                'nombre' => $usuario->nombre,
                'email' => $usuario->email,
                'telefono' => $usuario->telefono,
                'negocio' => $usuario->negocio,
                'mensaje' => $usuario->mensaje,
                'id' => $usuario->id
            ];
            
            $to = ['desarrollo@kiper.app' => 'desarollo'];
            // if ($sucursal == "Carretera nacional"){
            //     $to = ['rsalazar@toyotacarreteranacional.com' => 'rsalazar', 'krodriguez@toyotamonterrey.com.mx' => 'krodriguez'];
            // }

            try {
                    Mail::sendTo($to, 'Kiper.Contacto::Contacto', $data);
                } catch (Exception $e) {
                    Log::info('No se logró enviar el correo electrónico - '.$e);
                }
            //return Redirect::to(URL::to('home'));
            return ['#gracias' => $this->renderPartial('frmContacto::gracias')];
        }
    }
}