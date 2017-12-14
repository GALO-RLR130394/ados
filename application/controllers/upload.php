<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require_once(APPPATH.'/libraries/REST_Controller.php');
use Restserver\libraries\REST_Controller;


class upload extends REST_Controller {

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

 function upload_post(){
    if( ! $this->post('submit')) {
        $this->response(NULL, 400);
    }
    $this->load->library('upload');

    if ( ! $this->upload->do_upload() ) {
        $this->response(array('error' => strip_tags($this->upload->display_errors())), 404);
    } else {
        $upload = $this->upload->data();
        $this->response($upload, 200);
    }
}
}