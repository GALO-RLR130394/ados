<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require_once(APPPATH.'/libraries/REST_Controller.php');
use Restserver\libraries\REST_Controller;


class vista extends REST_Controller {

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

    public function vista_get(){
  $this->db->select ("*");
  $this->db->from ('vistatotal');
  $query = $this->db->query("SELECT * FROM vistatotal ORDER BY id_ordenprod");
  $respuesta = array(
    'vistaorden' => $query->result_array()
    );

    $this->response($respuesta);
      }
}