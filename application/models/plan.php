<?php
class Plan extends CI_Model
{
    
    	/*
	Returns all the items
	*/
	function get_all()
	{
		$this->db->from('plan');
		//$this->db->where('location = '.$this->session->userdata('shop_id').'');
//		$this->db->order_by("category_id", "asc");
//		$this->db->limit($limit);
//		$this->db->offset($offset);
		$query = $this->db->get();
		return $data = $query->result_array();
	}
	
        function getHighest(){
		$this->db->select('MAX(plan_id) as  plan_id ');
                $this->db->from('key_table');
                $query = $this->db->get();  
                $data = $query->result_array();	
                
                return $data[0]['plan_id']+1;
	}
        
 
        public function updateHighest($data){
		$this->db->where('id',1);
		$this->db->update('key_table',$data);
	}

        
/*
	Inserts or updates a item
	*/
	function save($plan_data,$plan_item)
	{
            
            
            $this->db->insert('plan', $plan_data);
        
            $plan_id = 'PLN'.$this->getHighest();
             
            $all_plan_items = array();
            
            foreach ($plan_item as $value) {
                $data['plan_id']= $plan_id;
                $data['item_code']= $value; 
                
                array_push( $all_plan_items,$data);
                
            }
 
            
            $this->save_plan_items($all_plan_items);
            
            return $plan_id;
                
        }

		 
	function save_plan_items($itemsData) {
            
            
            $this->db->insert_batch('plan_items', $itemsData);
            
        }
        
         /*
         *Get an plan deatils given an plan id         
	*/
	function get_plan_by_id($plan_id)
	{
             
		$this->db->from('plan');
		$this->db->where('plan_id',$plan_id);

		$query = $this->db->get();

		if($query->num_rows()==1)
		{
			return $query->row();
		}

		return false;
	}
        
        /*
         *update plan deatils given an plan id         
	*/
	function update_plan($plan_data,$plan_id)
	{
		$this->db->where('plan_id', $plan_id);
                $success = $this->db->update('plan', $plan_data);

        return $success;
        
	}
        
        
         /*
         * Delete By plan ID      
         */
        function delete_plan_by_id($plan_id) {
           
            //$this->delete_plan_item_by_id($item_code);
            //$this->delete_member_subscription_by_id($item_code);
            
            $this->db->where('plan_id', $plan_id);
            $this->db->delete('plan');
             
            
           if ($this->db->affected_rows() > 0) { echo TRUE; }else{ echo FALSE;}
            
        }
        
}