<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require_once(APPPATH.'/libraries/REST_Controller.php');
use Restserver\libraries\REST_Controller;


class Ordenprod extends REST_Controller {

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
  
public function ordenprod_post(){
  $data = array(
  'id_orden' => $this->post('id_orden'),
  'id_producto' => $this->post('id_producto')
  );

  $this->db->insert('orden_prod', $data);
  $this->response('Registro Capturado');
}
    public function ordenprod_get(){
  $this->db->select("*");
  $this->db->from('orden_prod');

  $query=$this->db->get();
  $respuesta = array(
    'ordenprod' => $query->result_array()
    );

    $this->response($respuesta);
}
    
    public function editar_post(){
        // update an existing user and respond with a status/errors
        if($this->post('id_orden')=='' || $this->post('id_producto')=='')
        {
          $respuesta = array(
            'error' => TRUE,
            'ordenes' => 'Completa todos los campos'
          );
        }
        else{
          $data = array(
              'id_orden' => $this->post('id_orden'),
              'id_producto' => $this->post('id_producto')
            );
            $this->db->where('id_ordenprod', $this->post('id_ordenprod'));
            $this->db->update('orden_prod', $data);
            $respuesta = array(
                'error' => FALSE,
                'ordenes' => 'Datos Actualizados'
            );
          }

          $this->response($respuesta);
    }

}