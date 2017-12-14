<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require_once(APPPATH.'/libraries/REST_Controller.php');
use Restserver\libraries\REST_Controller;


class Empleados extends REST_Controller {

  public function __construct(){

    header("Access-Control-Allow-Methods: GET");
    header("Access-Control-Allow-Headers: Content-Type, Content-Length, Accept-Encoding");
    header("Access-Control-Allow-Origin: *");
    parent::__construct();
    $this->load->database();
     $this->load->helper(array('form', 'url'));
  }

  public function index_get(){
    $this->response();
  }

   public function ver_get($id = 0)
   {
     if(is_numeric($id)){
       $this->db->select('nombre,apellidop,apellidom')->from('empleados')->where('id_empleado',$id);
       $query = $this->db->get();
       $respuesta = array(
         'error' => FALSE,
         'empleados' => $query->result_array()
       );
     }else{
       $respuesta = array(
         'error' => TRUE,
         'empleados' => FALSE
       );
     }
     $this->response($respuesta);
   }

    public function crear_put()
    {
      if($this->put('nombre')=='' || $this->put('apellidop')=='' || $this->put('apellidom')==''){
        $respuesta = array(
          'error' => TRUE,
          'empleados' => 'Completa todos los campos'
        );
      }
      else{
        $data = array(
            'nombre'    =>  $this->put('nombre'),
            'apellidop' =>  $this->put('apellidop'),
            'apellidom' =>  $this->put('apellidom')
            );
            $this->db->insert('empleados',$data);
            $respuesta = array(
              'error' => FALSE,
              'empleados' => 'Insertado'
            );
      }
      $this->response($respuesta);
    }

    public function editar_post()
    {
        // update an existing user and respond with a status/errors
        if($this->post('nombre')=='' || $this->post('apellidop')=='' || $this->post('apellidom')==''){
          $respuesta = array(
            'error' => TRUE,
            'empleados' => 'Completa todos los campos'
          );
        }else{
          $data = array(
              'nombre'    =>  $this->post('nombre'),
              'apellidop' =>  $this->post('apellidop'),
              'apellidom' =>  $this->post('apellidom')
            );
            $this->db->where('id', $this->post('id'));
            $this->db->update('empleados', $data);
            $respuesta = array(
                'error' => FALSE,
                'empleados' => 'Datos Actualizados'
            );
          }

          $this->response($respuesta);
    }

    public function borrar_delete()
    {
        /* delete a user and respond with a status/errors
        $query = $this->db->get_where('empleados',array('id' => $this->delete('id')));
        if($query->num_rows() >0){
          $this->db->delete('empleados', array('id' => $this->delete('id')));
          $respuesta = array(
              'error' => FALSE,
              'empleado' => 'Borrado'
          );
        }else{
          $respuesta = array(
              'error' => TRUE,
              'empleado' => 'Registro no existe'
          );
        }*/
        $query = $this->db->get_where('empleados',array('id' => $this->delete('id')));
        if($query->num_rows() >0){
          //$this->db->set('status', $this->delete('status'));
          $this->db->where('id', $this->delete('id'));
          $this->db->update('empleados');
          $respuesta = array(
              'error' => FALSE,
              'empleado' => 'Borrado'
          );
        }else{
          $respuesta = array(
              'error' => TRUE,
              'empleado' => 'Registro no existe'
          );
        }
        $this->response($respuesta);

    }

  public function activos_get($pagina = 0){
    $pagina = $pagina * 10;
    $this->db->select('id,nombre,apellidos,email, telefono,tipo_pago,status,imagen')
             ->from('empleados')
             ->where('status',1)
             ->limit(10,$pagina);
    $query = $this->db->get();
    $respuesta = array(
        //'query' => $query,
        'error' => FALSE,
        'empleados' => $query->result_array()
    );
    $this->response($respuesta);

  }
  public function inactivos_get($pagina = 0){
    $pagina = $pagina *10;
    $this->db->select('id,nombre,apellidos,email, telefono,tipo_pago,status,imagen')
             ->from('empleados')
             ->where('status',0)
             ->limit(10,$pagina);
    $query = $this->db->get();
    $respuesta = array(
        //'query' => $query,
        'error' => FALSE,
        'empleados' => $query->result_array()
    );
    $this->response($respuesta);

  }
public function imagen_post()
      {
        $imagen=$this->post('imagen');
        $config['upload_path'] = './public/uploads/empleados/';
        $config['allowed_types'] = 'gif|jpg|png';
        $config['max_size']      = 1000000;
        $config['max_width']     = 1024;
        $config['max_height']    = 768;
        $this->load->library('upload', $config);


        //$query = $this->db->get_where('empleados',array('id' => $this->post('id')));
       // if($query->num_rows() >0){

          if ( ! $this->upload->do_upload($imagen))
          {
              $respuesta = array(
                  'error' => TRUE,
                  'detalle' => $this->upload->display_errors(),
                  'imagen' =>$this->upload
              );
          }else{
           /*   $this->db->set('imagen', $this->upload->data('file_name'));
              $this->db->where('id', $this->post('id'));
              $this->db->update('empleados');
              */$respuesta = array(
                  'error' => FALSE,
                  'empleado' => $this->post('id'),
                  'imagen' => $this->upload->data('file_name')
              );
          }/*
        }else{
          $respuesta = array(
              'error' => TRUE,
              'detalle' => 'Empleado no existe'
          );*/
       // }
        $this->response($respuesta);
      }
}
