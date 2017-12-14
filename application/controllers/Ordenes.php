<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require_once(APPPATH.'/libraries/REST_Controller.php');
use Restserver\libraries\REST_Controller;


class Ordenes extends REST_Controller {

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
  
public function ordenes_post(){
  $data = array(
  //'fecha' => $this->post('fecha'),
  //'hora' => $this->post('hora'),
  'id_clien' => $this->post('id_clien'),
  'id_emp' => $this->post('id_emp')
  );

  $this->db->insert('ordenes', $data);
  
  $respuesta=array(
                     'id_orden'=>$this->db->insert_id(),
                     'Orden Generada'
                     
                    );
  $this->response($respuesta);
}
    public function ordenes_get(){
  $this->db->select('id_emp, id_clien, fecha, hora');
  $this->db->from('ordenes');

  $query=$this->db->get();
  $respuesta = array(
    'ordenes' => $query->result_array()
    );

    $this->response($respuesta);
}

    public function editar_post(){
        // update an existing user and respond with a status/errors
        if($this->post('fecha')=='' || $this->post('hora')=='' || $this->post('id_clien')=='' || $this->post('id_emp')=='')
        {
          $respuesta = array(
            'error' => TRUE,
            'ordenes' => 'Completa todos los campos'
          );
        }
        else{
          $data = array(
              'fecha'    =>  $this->post('fecha'),
              'hora'    =>  $this->post('hora'),
              'id_emp'    =>  $this->post('id_emp'),
              'id_clien'    =>  $this->post('id_clien')
            );
            $this->db->where('id_orden', $this->post('id_orden'));
            $this->db->update('ordenes', $data);
            $respuesta = array(
                'error' => FALSE,
                'ordenes' => 'Datos Actualizados'
            );
          }

          $this->response($respuesta);
    }

        public function imagen_post()
      {

        $config['upload_path'] = './public/uploads/ordenes/';
        $config['allowed_types'] = 'gif|jpg|png';
        $config['max_size']      = 5000;
        $config['max_width']     = 5024;
        $config['max_height']    = 5768;
        $this->load->library('upload', $config); 
        $query = $this->db->get_where('ordenes',array('id_orden' => $this->post('id_orden')));
        if($query->num_rows() >0){ 
          if ( ! $this->upload->do_upload('imagen'))
          {
              $respuesta = array(
                  'error' => TRUE,
                  'detalle' => $this->upload->display_errors()
              );
          }else{  

            $this->db->set('imagen', $this->upload->data('file_name'));
              $this->db->where('id_orden', $this->post('id_orden'));
              $this->db->update('ordenes');
              $respuesta = array(
                  'error' => FALSE,
                  'imagen' => $this->upload->data('file_name')
              );
          }
        $this->response($respuesta);
      }
    }

      public function creardir_post(){
        $id_orden=$this->post('id_orden');
          $query = $this->db->get_where('ordenes',array('id_orden' => $id_orden));

        if($query->num_rows() ==0){
          $respuesta = array(
                  'error' => TRUE,
                  'detalle'=> 'No existe id'
              );
        }else{
               $ruta="./public/uploads/ordenes/";
             $dir=$ruta."/".$id_orden;
          $respuesta = array(
              'error' => FALSE,
              'id_orden'=>$id_orden
            
          );
          if (!file_exists($dir)) {
                        error_reporting(E_ERROR);
                        mkdir($dir,0777);
                        chmod($dir, 0777);
                        error_reporting(E_ERROR | E_WARNING | E_PARSE | E_NOTICE);
                    }else{
                      $respuesta = array(
                        'error' => 'No se creara ningun directorio' ,
                        'id_orden'=>$dir
                      );

                    }

         
        }
        $this->response($respuesta);
              
             }
 


}