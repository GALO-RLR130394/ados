<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require_once(APPPATH.'/libraries/REST_Controller.php');
use Restserver\libraries\REST_Controller;


class Productos extends REST_Controller {

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
  
public function productos_post(){
  $data = array(
  'nombrep' => $this->post('nombrep'),
  'precio' => $this->post('precio'),
  'tipo' => $this->post('tipo')
  );

  $this->db->insert('productos', $data);
  $this->response('Registro Capturado');
}
    public function productos_get(){
  $this->db->select("*");
  $this->db->from('productos');

  $query=$this->db->get();
  $respuesta = array(
    'productos' => $query->result_array()
    );

    $this->response($respuesta);
}

    public function editar_post(){
        // update an existing user and respond with a status/errors
        if($this->post('nombrep')=='' || $this->post('precio')=='' || $this->post('tipo')=='')
        {
          $respuesta = array(
            'error' => TRUE,
            'productos' => 'Completa todos los campos'
          );
        }
        else{
          $data = array(
              'nombrep'    =>  $this->post('nombrep'),
              'precio'    =>  $this->post('precio'),
              'tipo'    =>  $this->post('tipo')
            );
            $this->db->where('id_producto', $this->post('id_producto'));
            $this->db->update('productos', $data);
            $respuesta = array(
                'error' => FALSE,
                'productos' => 'Datos Actualizados',
                'nombrep'    =>  $this->post('nombrep'),
              'precio'    =>  $this->post('precio'),
              'id_producto'    =>  $this->post('id_producto')
            );
          }

          $this->response($respuesta);
    }

        public function borrarProd_post(){
         $query = $this->db->get_where('productos',array('id_producto' => $this->post('id_producto')));
        if($query->num_rows() >0){
          $this->db->delete('productos', array('id_producto' => $this->post('id_producto')));
          $respuesta = array(
              'error' => FALSE,
              'Producto' => 'Borrado'
          );
        }else{
          $respuesta = array(
              'error' => TRUE,
                'data' => $this->post('id_producto'),
              'Producto' => 'Registro no existe'
          );
        }
        $this->response($respuesta);
      }

}