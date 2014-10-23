<?php
class Item extends CI_Model
{
	/*
	Determines if a given item_id is an item
	*/
	function exists($item_id)
	{
		$this->db->from('items');
		$this->db->where('item_id',$item_id);
		$query = $this->db->get();

		return ($query->num_rows()==1);
	}

	function getHighest(){
		$this->db->select('MAX(item_code) as item_code');
        $this->db->from('key_table');
        $query = $this->db->get();  
        $data = $query->result_array();	
        return $data[0]['item_code']+1;
	}

	public function updateHighest($data){
		$this->db->where('id',1);
		$this->db->update('key_table',$data);
	}

	/*
	Returns all the items
	*/
	function get_all($limit=10000, $offset=0)
	{
		$this->db->from('items');
		$this->db->where('location = '.$this->session->userdata('shop_id').'');
		$this->db->order_by("category_id", "asc");
		$this->db->limit($limit);
		$this->db->offset($offset);
		$query = $this->db->get();
		return $data = $query->result_array();
	}
	
        /**
	 * Get All Items
	 * 
	 * @access public 
	 */		
	public function getAll(){
            $this->db->select('*');
            $this->db->from('items');
            $this->db->order_by("item_code", "ASC");
            $query = $this->db->get();  
            return $query->result_array();
	}
        
	function count_all()
	{
		$this->db->from('items');
		$this->db->where('deleted',0);
		$this->db->where('status !=','TRANSFERED');
		return $this->db->count_all_results();
	}



	/*
	Gets information about a particular item
	*/
	function get_info($item_id)
	{
		$this->db->from('items');
		$this->db->where('item_id',$item_id);
		$this->db->where('status !=','TRANSFERED');
		$query = $this->db->get();

		if($query->num_rows()==1)
		{
			return $query->row();
		}
		else
		{
			//Get empty base parent object, as $item_id is NOT an item
			$item_obj=new stdClass();

			//Get all the fields from items table
			$fields = $this->db->list_fields('items');

			foreach ($fields as $field)
			{
				$item_obj->$field='';
			}

			return $item_obj;
		}
	}

	/*
	Gets Item Categories
	*/
	function getItemCategories($parent =0,$type='item')
	{

		$this->db->select('*');
        $this->db->from('category');
        $this->db->where('parent_category',$parent);
         $this->db->where('type',$type);
        $this->db->where('status','Enabled');
        $this->db->order_by('category_name', 'ASC');
        $query = $this->db->get();
       // echo $this->db->last_query();exit();  
        return $result =  $query->result_array();
    }

	function getCategory($category){
		$this->db->select('*');
        $this->db->from('item_category');
        $this->db->where('id',$category);
        $query = $this->db->get();  
        return $query->result_array();

	}

	function getItemSubCategories($parent =0){
				$this->db->select('*');
        $this->db->from('item_category');
        $this->db->where('parent_category',$parent);
        $this->db->where('status','Enabled');
        $this->db->order_by('category_name', 'ASC');
        $query = $this->db->get();  
        return $query->result_array();
	}


	function getItemImages($table,$record_id){
		$this->db->select('*');
        $this->db->from('images');
        $this->db->where('record_id	',$record_id);
        $this->db->where('table',$table);
        $query = $this->db->get();  
        return $query->result_array();
	}

	function addItemImages($item_data){
		if($this->db->insert('images',$item_data))
			{
				return true;
			}
		return false;
	}

	/*
	Inserts or updates a item
	*/
	function save(&$item_data,$item_id=false)
	{
		if (!$item_id or !$this->exists($item_id))
		{
			if($this->db->insert('items',$item_data))
			{
				$item_data['item_id']=$this->db->insert_id();
				return true;
			}
			return false;
		}

		$this->db->where('item_id', $item_id);
		return $this->db->update('items',$item_data);
	}


	function category_save(&$category_data,$cat_id=false){
		if (!$cat_id)
		{
			if($this->db->insert('category',$category_data))
			{
				return $this->db->insert_id();
			}
			return false;
		}

		$this->db->where('id', $cat_id);
		return $this->db->update('category',$category_data);
	}




	///////////////////////////////////////////////////////////////////////////////




	/*
	| update item status when transfering the stock and acceoting it
	*/
	function updateItemStatus($item_id,$item_data){
		$this->db->where('item_id',$item_id);
		return $this->db->update('items',$item_data);
	}

	/*
	Get an item id given an item number
	*/
	function get_item_id($item_number)
	{
		$this->db->from('items');
		$this->db->where('status !=','TRANSFERED');
		$this->db->where('item_number',$item_number);
		$this->db->where('deleted',0); // Parq 131226

		$query = $this->db->get();

		if($query->num_rows()==1)
		{
			return $query->row()->item_id;
		}

		return false;
	}

	/*
         *Get an item deatils given an item id         *
	*/
	function get_item_by_id($item_number)
	{
		$this->db->from('items');
		$this->db->where('item_code',$item_number);

		$query = $this->db->get();

		if($query->num_rows()==1)
		{
			return $query->row();
		}

		return false;
	}

	/*
	Gets information about multiple items
	*/
	function get_multiple_info($item_ids)
	{
		$this->db->from('items');
		$this->db->where('status !=','TRANSFERED');
		$this->db->where_in('item_id',$item_ids);
		$this->db->order_by("item", "asc");
		return $this->db->get();
	}




	/*
	Inserts  store item quantity
	*/
	function saveItemQuantity(&$quantity,$item_id=false)
	{
		
		$this->db->delete('ospos_item_quantity',array('item'=>$item_id,'store_id'=>$this->session->userdata('shop_id')));

		if($this->db->insert('ospos_item_quantity',$quantity))
		{
			return true;
		}
		return false;
	}


	/*
	 Stock Transfering update store item quantity
	*/
	function updateStoreItemQuantity($store,&$quantity,$item_id=false)
	{
		
		$this->db->delete('ospos_item_quantity',array('item'=>$item_id,'store_id'=>$store));

		if($this->db->insert('ospos_item_quantity',$quantity))
		{
			return true;
		}
		return false;
	}



	/*
	Get item quantity
	*/
	function getItemQuantity($item_id=false)
	{

		$this->db->select('quantity');
		$this->db->from('ospos_item_quantity');
		$this->db->where('item',$item_id);
		$this->db->where('store_id',$this->session->userdata('shop_id'));
		$stock = $this->db->get();
		$quantity = $stock->result();

		return isset($quantity[0]->quantity) ? $quantity[0]->quantity : 0 ;
	}
		

	/*
	Get item quantity for given store
	*/
	function getStoreItemQuantity($item_id=false,$store_id)
	{

		$this->db->select('quantity');
		$this->db->from('ospos_item_quantity');
		$this->db->where('item',$item_id);
		$this->db->where('store_id',$store_id);
		$stock = $this->db->get();
		$quantity = $stock->result();

		return isset($quantity[0]->quantity) ? $quantity[0]->quantity : 0 ;
	}



	/*
	Updates multiple items at once
	*/
	function update_multiple($item_data,$item_ids)
	{
		$this->db->where_in('item_id',$item_ids);
		return $this->db->update('items',$item_data);
	}

	/*
	Deletes one item
	*/
	function delete($item_id)
	{
		$this->db->where('item_id', $item_id);
		return $this->db->update('items', array('deleted' => 1));
	}

	/*
	Deletes a list of items
	*/
	function delete_list($item_ids)
	{
		$this->db->where_in('item_id',$item_ids);
		return $this->db->update('items', array('deleted' => 1));
 	}

 	/*
	Get search suggestions to find items
	*/
	function get_search_suggestions($search,$limit=25)
	{
		$suggestions = array();

		$this->db->from('items');
		$this->db->like('name', $search);
		$this->db->where('deleted',0);
		$this->db->where('status !=', 'TRANSFERED');
		$this->db->order_by("name", "asc");
		$by_name = $this->db->get();
		foreach($by_name->result() as $row)
		{
			$suggestions[]=$row->name;
		}

												// $this->db->select('category');
												// $this->db->from('items');
												// $this->db->where('deleted',0);
												// $this->db->distinct();
												// $this->db->like('category', $search);
												// $this->db->order_by("category", "asc");
												// $by_category = $this->db->get();
												// foreach($by_category->result() as $row)
												// {
												// 	$suggestions[]=$row->category;
												// }

												$this->db->from('items');
												$this->db->like('item_number', $search);
												$this->db->where('deleted',0);
												$this->db->order_by("item_number", "asc");
												$by_item_number = $this->db->get();
												foreach($by_item_number->result() as $row)
												{
													$suggestions[]=$row->item_number;
												}
/** GARRISON ADDED 4/21/2013 **/
	//Search by description
												// $this->db->from('items');
												// $this->db->like('description', $search);
												// $this->db->where('deleted',0);
												// $this->db->order_by("description", "asc");
												// $by_name = $this->db->get();
												// foreach($by_name->result() as $row)
												// {
												// 	$suggestions[]=$row->name;
												// }
/** END GARRISON ADDED **/

/** GARRISON ADDED 4/22/2013 **/
	//Search by custom fields
									// $this->db->from('items');
									// $this->db->like('sku', $search);
									// $this->db->or_like('asin', $search);
									// $this->db->or_like('whole_sale_price', $search);
									// $this->db->or_like('drop_ship_price', $search);
									// $this->db->or_like('brand', $search);
									// $this->db->or_like('subcategory', $search);
									// $this->db->or_like('meta_title', $search);
									// $this->db->or_like('meta_description', $search);
									// $this->db->or_like('group_name', $search);
									// // $this->db->or_like('custom10', $search);
									// $this->db->where('deleted',0);
									// $this->db->where('status !=', 'TRANSFERED');
									// $this->db->order_by("name", "asc");
									// $by_name = $this->db->get();
									// foreach($by_name->result() as $row)
									// {
									// 	$suggestions[]=$row->name;
									// }
/** END GARRISON ADDED **/	
	//only return $limit suggestions
		// if(count($suggestions > $limit))
		// {
		// 	$suggestions = array_slice($suggestions, 0,$limit);
		// }

		
		return $suggestions;

	}

	function get_item_search_suggestions($search,$limit=25)
	{
		$suggestions = array();

		$this->db->from('items');
		$this->db->where('deleted',0);
		$this->db->where('status !=', 'TRANSFERED');
		$this->db->like('name', $search);
		$this->db->order_by("name", "asc");
		$by_name = $this->db->get();
		foreach($by_name->result() as $row)
		{
			$suggestions[]= $row->name.'|'.$row->item_id;
		}

					$this->db->from('items');
					$this->db->where('deleted',0);
					$this->db->like('item_number', $search);
					$this->db->order_by("item_number", "asc");
					$by_item_number = $this->db->get();
					foreach($by_item_number->result() as $row)
					{
						$suggestions[]=$row->item_number.'|'.$row->item_id;
					}

					/** GARRISON ADDED 4/21/2013 **/
					//Search by description
					$this->db->from('items');
					$this->db->where('deleted',0);
					$this->db->like('description', $search);
					$this->db->order_by("description", "asc");
					$by_description = $this->db->get();
					foreach($by_description->result() as $row)
					{
						$suggestions[]=$row->name.'|'.$row->item_id;
					}
						

						/** END GARRISON ADDED **/	
								/** GARRISON ADDED 4/22/2013 **/		
							//Search by custom fields
							$this->db->from('items');
							$this->db->where('deleted',0);
							$this->db->like('sku', $search);
							$this->db->or_like('asin', $search);
							$this->db->or_like('whole_sale_price', $search);
							$this->db->or_like('drop_ship_price', $search);
							$this->db->or_like('brand', $search);
							$this->db->or_like('subcategory', $search);
							$this->db->or_like('meta_title', $search);
							$this->db->or_like('meta_description', $search);
							$this->db->or_like('group_name', $search);
							// $this->db->or_like('custom10', $search);
							$this->db->order_by("name", "asc");
							$by_description = $this->db->get();
							foreach($by_description->result() as $row)
							{
								$suggestions[]=$row->name.'|'.$row->item_id;
							}
		/** END GARRISON ADDED **/

		return $suggestions;
	}

	function get_category_suggestions($search)
	{
		$suggestions = array();
		$this->db->distinct();
		$this->db->select('category');
		$this->db->from('items');
		$this->db->like('category', $search);
		$this->db->where('deleted', 0);
		$this->db->order_by("category", "asc");
		$by_category = $this->db->get();
		foreach($by_category->result() as $row)
		{
			$suggestions[]=$row->category;
		}

		return $suggestions;
	}

/** GARRISON ADDED 5/18/2013 **/	
	function get_location_suggestions($search)
	{
		$suggestions = array();
		$this->db->distinct();
		$this->db->select('location');
		$this->db->from('items');
		$this->db->like('location', $search);
		$this->db->where('deleted', 0);
		$this->db->order_by("location", "asc");
		$by_category = $this->db->get();
		foreach($by_category->result() as $row)
		{
			$suggestions[]=$row->location;
		}
	
		return $suggestions;
	}

	function get_custom1_suggestions($search)
	{
		$suggestions = array();
		$this->db->distinct();
		$this->db->select('sku');
		$this->db->from('items');
		$this->db->like('sku', $search);
		$this->db->where('deleted', 0);
		$this->db->order_by("sku", "asc");
		$by_category = $this->db->get();
		foreach($by_category->result() as $row)
		{
			$suggestions[]=$row->sku;
		}
	
		return $suggestions;
	}
	
	function get_custom2_suggestions($search)
	{
		$suggestions = array();
		$this->db->distinct();
		$this->db->select('asin');
		$this->db->from('items');
		$this->db->like('asin', $search);
		$this->db->where('deleted', 0);
		$this->db->order_by("asin", "asc");
		$by_category = $this->db->get();
		foreach($by_category->result() as $row)
		{
			$suggestions[]=$row->asin;
		}
	
		return $suggestions;
	}
	
	function get_custom3_suggestions($search)
	{
		$suggestions = array();
		$this->db->distinct();
		$this->db->select('whole_sale_price');
		$this->db->from('items');
		$this->db->like('whole_sale_price', $search);
		$this->db->where('deleted', 0);
		$this->db->order_by("whole_sale_price", "asc");
		$by_category = $this->db->get();
		foreach($by_category->result() as $row)
		{
			$suggestions[]=$row->whole_sale_price;
		}
	
		return $suggestions;
	}
	
	function get_custom4_suggestions($search)
	{
		$suggestions = array();
		$this->db->distinct();
		$this->db->select('drop_ship_price');
		$this->db->from('items');
		$this->db->like('drop_ship_price', $search);
		$this->db->where('deleted', 0);
		$this->db->order_by("drop_ship_price", "asc");
		$by_category = $this->db->get();
		foreach($by_category->result() as $row)
		{
			$suggestions[]=$row->drop_ship_price;
		}
	
		return $suggestions;
	}
	
	function get_custom5_suggestions($search)
	{
		$suggestions = array();
		$this->db->distinct();
		$this->db->select('brand');
		$this->db->from('items');
		$this->db->like('brand', $search);
		$this->db->where('deleted', 0);
		$this->db->order_by("brand", "asc");
		$by_category = $this->db->get();
		foreach($by_category->result() as $row)
		{
			$suggestions[]=$row->brand;
		}
	
		return $suggestions;
	}
	
	function get_custom6_suggestions($search)
	{
		$suggestions = array();
		$this->db->distinct();
		$this->db->select('subcategory');
		$this->db->from('items');
		$this->db->like('subcategory', $search);
		$this->db->where('deleted', 0);
		$this->db->order_by("subcategory", "asc");
		$by_category = $this->db->get();
		foreach($by_category->result() as $row)
		{
			$suggestions[]=$row->subcategory;
		}
	
		return $suggestions;
	}
	
	function get_custom7_suggestions($search)
	{
		$suggestions = array();
		$this->db->distinct();
		$this->db->select('meta_title');
		$this->db->from('items');
		$this->db->like('meta_title', $search);
		$this->db->where('deleted', 0);
		$this->db->order_by("meta_title", "asc");
		$by_category = $this->db->get();
		foreach($by_category->result() as $row)
		{
			$suggestions[]=$row->meta_title;
		}
	
		return $suggestions;
	}
	
	function get_custom8_suggestions($search)
	{
		$suggestions = array();
		$this->db->distinct();
		$this->db->select('meta_description');
		$this->db->from('items');
		$this->db->like('meta_description', $search);
		$this->db->where('deleted', 0);
		$this->db->order_by("meta_description", "asc");
		$by_category = $this->db->get();
		foreach($by_category->result() as $row)
		{
			$suggestions[]=$row->meta_description;
		}
	
		return $suggestions;
	}
	
	function get_custom9_suggestions($search)
	{
		$suggestions = array();
		$this->db->distinct();
		$this->db->select('group_name');
		$this->db->from('items');
		$this->db->like('group_name', $search);
		$this->db->where('deleted', 0);
		$this->db->order_by("group_name", "asc");
		$by_category = $this->db->get();
		foreach($by_category->result() as $row)
		{
			$suggestions[]=$row->group_name;
		}
	
		return $suggestions;
	}
	
	// function get_custom10_suggestions($search)
	// {
	// 	$suggestions = array();
	// 	$this->db->distinct();
	// 	$this->db->select('custom10');
	// 	$this->db->from('items');
	// 	$this->db->like('custom10', $search);
	// 	$this->db->where('deleted', 0);
	// 	$this->db->order_by("custom10", "asc");
	// 	$by_category = $this->db->get();
	// 	foreach($by_category->result() as $row)
	// 	{
	// 		$suggestions[]=$row->custom10;
	// 	}
	
	// 	return $suggestions;
	// }
/** END GARRISON ADDED **/	
	/*
	Preform a search on items
	*/
	function search($search)
	{
		$this->db->from('items');
		$this->db->where("(
				name LIKE '%".$this->db->escape_like_str($search)."%' or 
				item_number LIKE '%".$this->db->escape_like_str($search)."%' or 
				description LIKE '%".$this->db->escape_like_str($search)."%' or/**GARRISON ADDED 4/21/2013**/
				asin LIKE '%".$this->db->escape_like_str($search)."%' or/**GARRISON ADDED 4/22/2013**/
				sku LIKE '%".$this->db->escape_like_str($search)."%' or/**GARRISON ADDED 4/22/2013**/
				whole_sale_price LIKE '%".$this->db->escape_like_str($search)."%' or/**GARRISON ADDED 4/22/2013**/
				drop_ship_price LIKE '%".$this->db->escape_like_str($search)."%' or/**GARRISON ADDED 4/22/2013**/
				brand LIKE '%".$this->db->escape_like_str($search)."%' or/**GARRISON ADDED 4/22/2013**/
				subcategory LIKE '%".$this->db->escape_like_str($search)."%' or/**GARRISON ADDED 4/22/2013**/
				meta_title LIKE '%".$this->db->escape_like_str($search)."%' or/**GARRISON ADDED 4/22/2013**/
				meta_description LIKE '%".$this->db->escape_like_str($search)."%' or/**GARRISON ADDED 4/22/2013**/
				group_name LIKE '%".$this->db->escape_like_str($search)."%' or/**GARRISON ADDED 4/22/2013**/
				
				category LIKE '%".$this->db->escape_like_str($search)."%') and 
				deleted=0");
//// custom10 LIKE '%".$this->db->escape_like_str($search)."%' or/**GARRISON ADDED 4/22/2013**/
		$this->db->order_by("name", "asc");
		return $this->db->get();	
	}

	function get_categories()
	{
		$this->db->select('category');
		$this->db->from('items');
		$this->db->where('deleted',0);
		$this->db->distinct();
		$this->db->order_by("category", "asc");

		return $this->db->get();
	}

        /*
         * Delete By item ID        
         */
        function delete_item_by_id($item_code) {
            
            //$this->delete_plan_item_by_id($item_code);
            //$this->delete_member_subscription_by_id($item_code);
            
            $this->db->where('item_code', $item_code);
            $this->db->delete('items');
             
            
           if ($this->db->affected_rows() > 0) { echo TRUE; }else{ echo FALSE;}
            
        }
        function delete_plan_item_by_id($item_code) {
         
            $this->db->where('item_code', $item_code);
            $this->db->delete('cofeeapp_plan_items');
            
            
        }
  
        function delete_member_subscription_by_id($item_code) {
            
            
            $this->db->where('item_code', $item_code);
            $this->db->delete('cofeeapp_member_subscription');
     
            
        }

        
        
        
        
        /*
         *update item deatils given an item code         
	*/
	function update_item($item_data,$item_code)
	{
		$this->db->where('item_code', $item_code);
                $success = $this->db->update('items', $item_data);

        return $success;
        
	}
        

}
?>
