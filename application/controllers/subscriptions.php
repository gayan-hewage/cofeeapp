<?php
require_once ("secure_area.php");
//require_once ("interfaces/idata_controller.php");
class Subscriptions extends Secure_area{
	function __construct() {
		parent::__construct ( 'subscriptions' );
		if(!$this->session->userdata('shop_id'))
			redirect('/home?location=false', 'refresh');
	}

	function index(){
		$this->load->view ( 'subscriptions/form.tpl');
	}

	function add_subscription() {
		
		$this->load->view ( 'subscriptions/form.tpl');
	}
}
?>
