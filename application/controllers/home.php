<?php
require_once ("secure_area.php");

class Home extends Secure_area 
{
	function __construct()
	{
		parent::__construct();

	}
	
	function index()
	{
		$location 				= $this->input->get('location');
		$this->load->model('location');
       	$data['shop'] 			= $this->Location->get_info($this->session->userdata('shop_id'));
        $data['set_location'] 	= $location;
		$this->load->view("home",$data);
	}
	
	function set_location(){
		$shop_id = $this->uri->segment(3);
		$this->session->set_userdata('shop_id',$shop_id);
		redirect('/home', 'refresh');
	}
       
	function logout()
	{
		$this->Employee->logout();
	}
}
?>