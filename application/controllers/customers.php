<?php
require_once ("secure_area.php");
//require_once ("interfaces/idata_controller.php");
class Customers extends Secure_area{
	function __construct() {
		parent::__construct ( 'customers' );
	}

	function index(){
		$this->load->view ( 'customers/form.tpl');
	}
	
}
?>
