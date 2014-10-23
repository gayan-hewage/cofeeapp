<?php
class Module extends CI_Model 
{
    function __construct()
    {
        parent::__construct();
    }
	
	function get_module_name($module_id)
	{
		$query = $this->db->get_where('modules', array('module_id' => $module_id), 1);
		
		if ($query->num_rows() ==1)
		{
			$row = $query->row();
			return $this->lang->line($row->name_lang_key);
		}
		
		return $this->lang->line('error_unknown');
	}
	
	function get_module_desc($module_id)
	{
		$query = $this->db->get_where('modules', array('module_id' => $module_id), 1);
		if ($query->num_rows() ==1)
		{
			$row = $query->row();
			return $this->lang->line($row->desc_lang_key);
		}
	
		return $this->lang->line('error_unknown');	
	}
	
	function get_all_modules()
	{
		$data_array = array();

		$this->db->from('modules');
		$this->db->order_by("sort", "asc");
		$this->db->where("parent_module",'0');
		$query = $this->db->get();
		$parent_modules = $query->result_array();
		foreach ($parent_modules as  $value) {
			$objModule = new stdClass();
			 $objModule->parent = $value;
			 $objModule->childModules = $this->get_all_child_modules($value['module_id']);
			 array_push($data_array, $objModule);
		}

		return $data_array;
	}

	function get_all_child_modules($module_id){
		$this->db->from('modules');
		$this->db->order_by("sort", "asc");
		$this->db->where("parent_module = '$module_id'");
		$query = $this->db->get();
		return $query->result_array();	
	}

	function get_child_modules($module_id,$person_id){
		$this->db->from('modules');
		$this->db->join('permissions','permissions.module_id=modules.module_id');
		$this->db->where("permissions.person_id",$person_id);
		$this->db->where("parent_module = '$module_id'");
		$this->db->order_by("sort", "asc");
		$query = $this->db->get();
		return $query->result_array();	
	}
	
	function get_allowed_modules($person_id)
	{
		$data_array = array();

		$this->db->from('modules');
		$this->db->join('permissions','permissions.module_id=modules.module_id');
		$this->db->where("permissions.person_id",$person_id);
		$this->db->where("parent_module",'0');
		$this->db->order_by("sort", "asc");
		$query = $this->db->get();
		$parent_modules = $query->result_array();
		foreach ($parent_modules as  $value) {

			 $objModule = new stdClass();
			 $objModule->parent = $value;
			 $objModule->childModules = $this->get_child_modules($value['module_id'],$person_id);

			 array_push($data_array, $objModule);
		}

		return $data_array;

	}

	function get_allowed_stores($person_id)
	{
		$data_array = array();

		$this->db->from('locations');
		$this->db->join('user_locations','user_locations.location_id=locations.shop_code');
		$this->db->where("user_locations.user_id",$person_id);
		$query = $this->db->get();
		$location_data = $query->result_array();
		// foreach ($parent_modules as  $value) {

		// 	 $objModule = new stdClass();
		// 	 $objModule->parent = $value;
		// 	 $objModule->childModules = $this->get_child_modules($value['module_id'],$person_id);

		// 	 array_push($data_array, $objModule);
		// }

		return $location_data;

	}
}
?>
