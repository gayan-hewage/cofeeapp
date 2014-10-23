<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
require_once ("secure_area.php");
class Locations extends Secure_area {

	/**
	 * Index Page for this controller.
	 *
	 */
	function __construct()
	{
		parent::__construct('locations');	
        
	}

	function index(){
		$this->load->view('location/list.tpl');
	}

	/*View Location List*/
	function manage(){
		$data['locations'] = $this->Location->getAll();
		$this->load->view('location/list.tpl',$data);
	}

	function add(){
		$data = array();
		$this->load->view('location/form.tpl',$data);
		// $this->load->view('location/map.tpl',$data);
	}

	function set_location(){
		$shop_id = $this->uri->segment(3);
		$this->session->set_userdata('shop_id',$shop_id);
		redirect('/home', 'refresh');
	}


	/**
	* Add location data to the database
	*/
	function addData(){

		$shop_code = $this->Location->getHighestShopCode();

		$data['shop_code'] = 'SHOP'.$shop_code;
	    $data['name']  = ($_POST['name']) ? $_POST['name'] : '';
	    $data['description']     = ($_POST['description']) ? $_POST['description'] : '';           
	    $data['longit'] = ($_POST['lon']) ? $_POST['lon'] : '';
	    $data['latit'] = ($_POST['lat']) ? $_POST['lat'] : '';
	    $data['geo_address'] = ($_POST['geo_address']) ? $_POST['geo_address'] : '';
	    $data['contact_no'] = ($_POST['contact_no']) ? $_POST['contact_no'] : '';
	    $data['open_hours'] = ($_POST['open_hours']) ? $_POST['open_hours'] : '';
	    $data['closed_hours'] = ($_POST['closed_hours']) ? $_POST['closed_hours'] : '';
	    $data['saving_upto'] = ($_POST['saving_price']) ? $_POST['saving_price'] : '';
	    $data['saving_percent'] = ($_POST['saving_percent']) ?  $_POST['saving_percent'] : '';
	    $data['address'] = ($_POST['address']) ? $_POST['address'] : '';
	    $data['availability'] = isset($_POST['availability']) ? $_POST['availability'] : 0;
	    $data['featured'] = isset($_POST['featured']) ? $_POST['featured'] : 0;
	    $data['created_at'] = date('Y:m:d');

           
            
	   if($this->Location->addLocation($data)){
	   		$data = array('shop_code'=>$shop_code);
	   		return $this->Location->updateShopCode($data);
	   }
	}
	
        /*View Location */
	function edit($location_id){
		$data['location_data'] = $this->Location->get_location_by_id($location_id);
                 
		$this->load->view('location/edit.tpl',$data);
	}
        
        /*Update Location */
        
	function update(){
             
            
            $shop_code = $this->Location->getHighestShopCode();

            
             
	    $data['name']  = ($_POST['name']) ? $_POST['name'] : '';
	    $data['description']     = ($_POST['description']) ? $_POST['description'] : '';           
	    $data['longit'] = ($_POST['lon']) ? $_POST['lon'] : '';
	    $data['latit'] = ($_POST['lat']) ? $_POST['lat'] : '';
	    $data['geo_address'] = ($_POST['geo_address']) ? $_POST['geo_address'] : '';
	    $data['contact_no'] = ($_POST['contact_no']) ? $_POST['contact_no'] : '';
	    $data['open_hours'] = ($_POST['open_hours']) ? $_POST['open_hours'] : '';
	    $data['closed_hours'] = ($_POST['closed_hours']) ? $_POST['closed_hours'] : '';
	    $data['saving_upto'] = ($_POST['saving_price']) ? $_POST['saving_price'] : '';
	    $data['saving_percent'] = ($_POST['saving_percent']) ?  $_POST['saving_percent'] : '';
	    $data['address'] = ($_POST['address']) ? $_POST['address'] : '';
	    $data['availability'] = isset($_POST['availability']) ? $_POST['availability'] : 0;
	    $data['featured'] = isset($_POST['featured']) ? $_POST['featured'] : 0;
	    $data['created_at'] = date('Y:m:d');
            
         
            
	   if($this->Location->update_location($data,$_POST['shop_code'])){
                
               return true; 
	   }
            
	}
        
        
	
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */