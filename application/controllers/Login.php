<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require_once(APPPATH.'/libraries/REST_Controller.php');
use Restserver\libraries\REST_Controller;


class Login extends REST_Controller {

  public function __construct(){

    header("Access-Control-Allow-Methods: POST");
    header("Access-Control-Allow-Headers: Content-Type, Content-Length, Accept-Encoding");
    header("Access-Control-Allow-Origin: *");
    parent::__construct();
    $this->load->database();
  }

  public function login_post(){
    $data= $this->post();
    if(!isset($data['usuario']) || !isset($data['contrasena']) ){

      
      $respuesta=array(
                      'error' =>TRUE ,
                      'mensaje'=>'La informacion no es valida'
                    );
        $this->response($respuesta,REST_Controller::HTTP_BAD_REQUEST);
        return;
      }
      $condiciones = array(
                          'usuario'=>$data['usuario'],
                          'contrasena'=>$data['contrasena']
                          );

      $query = $this->db->get_where('empleados',$condiciones);
      $usuario =$query->row();
      if(!isset($usuario)){
          $respuesta=array(
                          'error' =>TRUE ,
                          'mensaje'=>'Usuario y/o contrasena incorrectos'
                        );
          
          $this->response($respuesta);
          return;

      }

      //Valido
      //token
      $token = bin2hex(openssl_random_pseudo_bytes(20) );
      $token = hash('ripemd160',$data['usuario']);

      //Guardar en bd
      $this->db->reset_query();
      $actualizar_token=array(
                        'token'=>$token
                        );
      $this->db->where('id_empleado',$usuario->id_empleado);
      $echo = $this->db->update('empleados',$actualizar_token);
      $respuesta=array(
                      'error' =>FALSE ,
                      'token'=>$token,
                      'id_usuario'=>$usuario->id_empleado
                    );
      $this->response($respuesta);
    }

}
