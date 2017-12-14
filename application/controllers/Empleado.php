<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require_once(APPPATH.'/libraries/REST_Controller.php');
use Restserver\libraries\REST_Controller;


class Empleado extends REST_Controller {

  public function __construct(){

    header("Access-Control-Allow-Methods: PUT, GET, POST, DELETE, OPTIONS");
    header("Access-Control-Allow-Headers: Content-Type, Content-Length, Accept-Encoding");
    header("Access-Control-Allow-Origin: *");
    parent::__construct();
    $this->load->database();
  }

  public function index_get(){
    echo "Hola Mundo";
  }
  
public function empleado_post(){
  $data = array(
  'nombreem' => $this->post('nombreem'),
  'apellp' => $this->post('apellp'),
  'apellm' => $this->post('apellm'),
  'usuario' => $this->post('usuario'),
  'contrasena' => $this->post('contrasena')
  );

  $this->db->insert('empleados', $data);
  $this->response('Registro Capturado');
}
    public function empleado_get(){
  $this->db->select("*");
  $this->db->from('empleados');

  $query=$this->db->get();
  $respuesta = array(
    'empleados' => $query->result_array()
    );

    $this->response($respuesta);
}

    public function editar_post(){
        // update an existing user and respond with a status/errors
        if($this->post('nombreem')=='' || $this->post('apellp')=='' || $this->post('apellm')=='' || $this->post('usuario')==''
          || $this->post('contrasena')=='')
        {
          $respuesta = array(
            'error' => TRUE,
            'empleados' => 'Completa todos los campos'
          );
        }
        else{
          $data = array(
              'nombreem'    =>  $this->post('nombreem'),
              'apellp' =>  $this->post('apellp'),
              'apellm' =>  $this->post('apellm'),
              'usuario' =>  $this->post('usuario'),
              'contrasena' =>  $this->post('contrasena')
            );
            $this->db->where('id_empleado', $this->post('id_empleado'));
            $this->db->update('empleados', $data);
            $respuesta = array(
                'error' => FALSE,
                'empleados' => 'Datos Actualizados'
            );
          }

          $this->response($respuesta);
    }

}