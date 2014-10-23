<?php
class Location extends CI_Model{

	
	/**
	 * Constructor
	 * 
	 * @access public 
	 */	  
	function __construct() {
		 parent::__construct(); 
	}

	/**
	 * Get All Locations
	 * 
	 * @access public 
	 */		
	public function getAll(){
		$this->db->select('*');
        $this->db->from('locations');
        $this->db->order_by("name", "ASC");
        $query = $this->db->get();  
        return $query->result_array();
	}

	public function getHighestShopCode(){
		$this->db->select('MAX(shop_code) as shop_code');
        $this->db->from('key_table');
        $query = $this->db->get();  
        $data = $query->result_array();	
        return $data[0]['shop_code']+1;
	}

	public function updateShopCode($data){
		$this->db->where('id',1);
		$this->db->update('key_table',$data);
	}

	public function addLocation($data){
		return $this->db->insert('locations',$data);
	}

	function get_info($shop_code){
		$query = $this->db->get_where('locations', array('shop_code' => $shop_code), 1);
		
		if($query->num_rows()==1)
		{
			return $query->row();
		}
		else
		{
			//create object with empty properties.
			$fields = $this->db->list_fields('locations');
			$location_obj = new stdClass;
			
			foreach ($fields as $field)
			{
				$location_obj->$field='';
			}
			
			return $location_obj;
		}
	}
        
        /*
         *Get an location deatils given an location code 
         *@author Gayan Ramya Kumara <gayanramyakumara@gmail.com>
	*/
	function get_location_by_id($location_code)
	{
		$this->db->from('locations');
		$this->db->where('shop_code',$location_code);

		$query = $this->db->get();

		if($query->num_rows()==1)
		{
			return $query->row();
		}

		return false;
	}
        /*
         *Get an location deatils given an location code 
         *@author Gayan Ramya Kumara <gayanramyakumara@gmail.com>
	*/
	function update_location($location_data,$shop_code)
	{
		$this->db->where('shop_code', $shop_code);
                $success = $this->db->update('locations', $location_data);

        return $success;
        
	}
}