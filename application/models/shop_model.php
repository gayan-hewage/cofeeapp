<?php
class Shop_model extends CI_Model
{
	
	/*
	Determines if a given item_id is an item
	*/
	function exists($shop_id)
	{
		$this->db->from('shops');
		$this->db->where('shop_id',$shop_id);
		$query = $this->db->get();

		return ($query->num_rows()==1);
	}

	/*
	Determines if a given item_id is an item
	*/
	function count_all()
	{
		$this->db->from('shops');
		//$this->db->where('deleted',0);
		return $this->db->count_all_results();
	}

	/*
	Returns all the items
	*/
	function get_all($limit=10000, $offset=0)
	{
		$this->db->from('shops');
		//$this->db->where('deleted',0);
		$this->db->order_by("shop_name", "asc");
		$this->db->limit($limit);
		$this->db->offset($offset);
		return $this->db->get();	
	}

	function getShopList(){
		$this->db->select('*');
        $this->db->from('shops');
        $this->db->order_by('shop_id', 'ASC');
        $this->db->where('live', 1);
        $query = $this->db->get();  
        return $query->result_array();
	}

	function getItemReceived(){
		$shop_list = $this->getOtherShopList();		

		//var_dump($this->session->userdata('shop_id'));
		$received_data = array();
		$item_data =  array();
		foreach ($shop_list as $key => $shop) {

			

			$this->db->select('receiving_id');
			$this->db->from('item_transfer');
			$this->db->where('from_store', $shop['shop_id']);
			$this->db->where('to_store', $this->session->userdata('shop_id'));
			$query = $this->db->get();
			$receiving_list = $query->result_array();

			
			if(count($receiving_list)){
				//var_dump($receiving_list);
				$objReceivedItems = new stdClass();	
				$objReceivedItems->from_store = $shop['shop_id'];
				$objReceivedItems->items = $receiving_list;
				array_push($received_data, $objReceivedItems);
			}
			
			//return $received_data;
			
		}

		foreach ($received_data as $key => $shop) {
				$objItemData = new stdClass();
				$objItemData->store = $shop->from_store;

				foreach ($shop->items as $key => $value) {	
					$receving_items = $this->Receiving->getRecevingItems($value['receiving_id']);
					$objItemData->items['from'][$shop->from_store] = $receving_items;
					if(count($receving_items))
						array_push($item_data, $objItemData->items);
				}
				
		}

		return $item_data;
	}

	function getOtherShopList(){
		$this->db->select('shop_id');
        $this->db->from('shops');
         $this->db->where('shop_id !=',$this->session->userdata('shop_id'));
        $this->db->order_by('shop_id', 'ASC');
        $query = $this->db->get();  
        return $query->result_array();
	}

	function dropDownShopNameList(){
		$this->db->select('*');
        $this->db->from('shops');
        $this->db->where('shop_id !=',$this->session->userdata('shop_id'));
        $this->db->order_by('shop_id', 'ASC');
        $query = $this->db->get();  
        $result =  $query->result_array();
        $tmp['']= 'Please Select';
        foreach ($result as $values){
           $tmp[$values['shop_id']] = $values['shop_name'];
		}
		return $tmp;  
	}
	/*
	Gets information about a particular Store
	*/
	function get_info($store_id)
	{
		$this->db->from('shops');
		$this->db->where('shop_id',$store_id);
		
		$query = $this->db->get();

		if($query->num_rows()==1)
		{
			return $query->row();
		}
		else
		{
			//Get empty base parent object, as $item_id is NOT an item
			$shop_obj=new stdClass();

			//Get all the fields from items table
			$fields = $this->db->list_fields('shops');

			foreach ($fields as $field)
			{
				$shop_obj->$field='';
			}

			return $shop_obj;
		}
	}


	function get_name($store_id)
	{
		$this->db->select('shop_name');
		$this->db->from('shops');
		$this->db->where('shop_id',$store_id);
		
		$query = $this->db->get();

		if($query->num_rows()==1)
		{
			return $query->row();
		}
	}

		/*
	Inserts or updates a item
	*/
	function save(&$shop_data,$shop_id=false)
	{
		if (!$shop_id or !$this->exists($shop_id))
		{
			if($this->db->insert('shops',$shop_data))
			{
				$shop_data['shop_id']=$this->db->insert_id();
				return true;
			}
			return false;
		}

		$this->db->where('shop_id', $shop_id);
		return $this->db->update('shops',$shop_data);
	}
	

}
?>
