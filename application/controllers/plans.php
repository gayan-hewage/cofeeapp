<?php
require_once ("secure_area.php");
require_once ("uploader.php");
class Plans extends Secure_area{
	
	function __construct() {
		parent::__construct ( 'plan' );
		//	if(!$this->session->userdata('shop_id'))
			//redirect('/home?location=false', 'refresh');
	}

	function plans_manage(){
		$this->load->model('Plan');
		$data['plans'] = $this->Plan->get_all(); 
		$this->load->view('plans/list.tpl',$data);
	}
	function plans_add(){
            
		$this->load->model('Plan');
                $this->load->model('Item');
		$data['items'] = $this->Item->getAll();
                
		//$data['plans'] = $this->Item->get_all(); 
		$this->load->view('plans/form.tpl',$data);
	}

        function save() {
        
           $this->load->model('Item');
           $this->load->model('Plan');
           $plan_id = $this->Plan->getHighest();

            $plan_item = $this->input->post('items');


            $data['plan_id'] = 'PLN'.$plan_id;
	    $data['location']  = 'SHOP006'; 
            //$category = ($this->input->post('category')) ? explode('_',$this->input->post('category')) : '';

	    $data['name'] = ($this->input->post('name')) ? $this->input->post('name') : '';
	    $data['description'] = ($this->input->post('description')) ? $this->input->post('description') : '';
	    $data['quantity'] = ($this->input->post('quantity')) ? $this->input->post('quantity') : '';
	    //$data['reorder_level'] = ($this->input->post('reorder_level')) ? $this->input->post('reorder_level') : '';
	    $data['price'] = ($this->input->post('price')) ? $this->input->post('price') : '';
	    $data['start_date'] = ($this->input->post('start_date')) ? $this->input->post('start_date') : '';
	    $data['end_date'] = ($this->input->post('end_date')) ? $this->input->post('end_date') : '';
            

            $this->Plan->save($data,$plan_item);
 
            
            $data = array('plan_id'=>$plan_id);
	   		if($this->Item->updateHighest($data)){
	   			echo json_encode ( array (
					'success' => true,
					'message' => 'Item Successfully Added'
					) );
	}
        
        
}        
                
        
        
        function edit($plan_id) {
            $this->load->model('Plan');
            $this->load->model('Item');
            
            $data['items'] = $this->Item->getAll();
            $data['plans_data']  = $this->Plan->get_plan_by_id($plan_id);    
             
            $this->load->view('plans/edit.tpl',$data);
        }
        
        function update_plans() {
            
            $this->load->model('Plan');
            $plan_code = $this->Plan->getHighest();

            $data['name'] = ($this->input->post('name')) ? $this->input->post('name') : '';
	    $data['description'] = ($this->input->post('description')) ? $this->input->post('description') : '';
	    $data['quantity'] = ($this->input->post('quantity')) ? $this->input->post('quantity') : '';
	    //$data['reorder_level'] = ($this->input->post('reorder_level')) ? $this->input->post('reorder_level') : '';
	    $data['price'] = ($this->input->post('price')) ? $this->input->post('price') : '';
	    $data['start_date'] = ($this->input->post('start_date')) ? $this->input->post('start_date') : '';
	    $data['end_date'] = ($this->input->post('end_date')) ? $this->input->post('end_date') : '';
               
            
            var_dump($data);exit;
            
              if($this->Plan->update_plan($data,$_POST['plan_id'])){
                
               return true; 
	   }
            
        }
        
        function delete_item() {
            $this->load->model('Plan');
          //  echo $item_code = $this->input->get('item_code');
            $plan_id = $this->input->post('plan_id');
              
		$delete_item = $this->Plan->delete_plan_by_id($plan_id); 
             
                if($delete_item){ return "TRUE";}else{ return "FALSE";}
        }
        
        
        
}