<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require_once(APPPATH.'/libraries/REST_Controller.php');
use Restserver\libraries\REST_Controller;


class Clientes extends REST_Controller {

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
  
public function clientes_post(){
  $data = array(
    'tipoc'=> $this->post('tipoc'),
  'nombrec' => $this->post('nombrec'),
  'apellidop' => $this->post('apellidop'),
  'apellidom' => $this->post('apellidom'),
  'telefono'  => $this->post('telefono'),
  'domicilio' => $this->post('domicilio'),
  'email'     => $this->post('email'),
  'rfc'       => $this->post('rfc')
  );

  $this->db->insert('clientes', $data);
  $this->response('Registro Capturado');
}
    public function clientes_get(){
  $this->db->select("*");
  $this->db->from('clientes');

  $query=$this->db->get();
  $respuesta = array(
    'clientes' => $query->result_array()
    );

    $this->response($respuesta);
}

    public function editar_post(){
        // update an existing user and respond with a status/errors
        if($this->post('nombrec')=='' || $this->post('apellidop')=='' || $this->post('apellidom')=='' || $this->post('telefono')=='' || $this->post('domicilio')=='' || $this->post('email')=='' || $this->post('rfc')=='' )
        {
          $respuesta = array(
            'error' => TRUE,
            'clientes' => 'Completa todos los campos'
          );
        }
        else{
          $data = array(
              'nombrec'    =>  $this->post('nombrec'),
              'apellidop' =>  $this->post('apellidop'),
              'apellidom' =>  $this->post('apellidom'),
              'telefono'  =>  $this->post('telefono'),
              'domicilio' =>  $this->post('domicilio'),
              'email'     =>  $this->post('email'),
              'rfc'       =>  $this->post('rfc')
            );
            $this->db->where('id_cliente', $this->post('id_cliente'));
            $this->db->update('clientes', $data);
            $respuesta = array(
                'error' => FALSE,
                'Clientes' => 'Datos Actualizados'
            );
          }

          $this->response($respuesta);
    }

}