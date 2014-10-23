<?php
require_once ("secure_area.php");
require_once ("uploader.php");
class Items extends Secure_area{
	
	function __construct() {
		parent::__construct ( 'items' );
			if(!$this->session->userdata('shop_id'))
			redirect('/home?location=false', 'refresh');
	}

	function index(){
		$this->load->model('Item');
		$data['items'] = $this->Item->get_all(); 
		$this->load->view('items/list.tpl',$data);
	}

	function add_item(){
		$this->load->model('Item');
		$data['categories'] = $this->Item->getItemCategories(); 
		$this->load->view('items/form.tpl',$data);
	}

	function upload_item_image(){

		$upload_dir = 'uploads/';
		$valid_extensions = array('gif', 'png', 'jpeg', 'jpg');

		$Upload = new FileUpload('imgfile');
		$result = $Upload->handleUpload($upload_dir, $valid_extensions);

		if (!$result) {
		    echo json_encode(array('success' => false, 'msg' => $Upload->getErrorMsg()));   
		} else {
			
			$path = $Upload->getSavedFile();
			$fileName = $Upload->getFileName();
		    $imgsize = getimagesize($path);
		    echo json_encode(array('success' => true, 'file' => $Upload->getFileName(),'file'=> $path,'fileName'=>$fileName));
		}
	}


	function save() {
		$this->load->model('Item');
		$item_code = $this->Item->getHighest();


		$data['item_code'] = 'ITM'.$item_code;
	    $data['location']  = 'SHOP006'; //($this->input->post('location')) ? $this->input->post('location') : ''; //TODO : get the active location
	    $category = ($this->input->post('category')) ? explode('_',$this->input->post('category')) : '';
	    $data['category_id'] = $category[0];
	    $data['category'] = $category[1];
	    $data['name'] = ($this->input->post('name')) ? $this->input->post('name') : '';
	    $data['description'] = ($this->input->post('description')) ? $this->input->post('description') : '';
	    $data['quantity'] = ($this->input->post('quantity')) ? $this->input->post('quantity') : '';
	    $data['reorder_level'] = ($this->input->post('reorder_level')) ? $this->input->post('reorder_level') : '';
	    $data['price'] = ($this->input->post('price')) ? $this->input->post('price') : '';

	    $item_images = $this->input->post('item_images');

	   if($this->Item->save($data)){

	   		foreach ($item_images as  $image) {
	   			$image_data = array(
	   				'table' => 'cofee_app _items',
	   				'record_id' => $data['item_code'],
	   				'image' => $image,
	   				'display_order' => 0
	   			);
	   			$this->Item->addItemImages($image_data);
	   		}
	   		$data = array('item_code'=>$item_code);
	   		if($this->Item->updateHighest($data)){
	   			echo json_encode ( array (
					'success' => true,
					'message' => 'Item Successfully Added'
					) );
	   		}
	   }
	}
	

        

	function delete() {
		$items_to_delete = $this->input->post ( 'ids' );
		
		if ($this->Item->delete_list ( $items_to_delete )) {
			echo json_encode ( array (
					'success' => true,
					'message' => $this->lang->line ( 'items_successful_deleted' ) . ' ' . count ( $items_to_delete ) . ' ' . $this->lang->line ( 'items_one_or_multiple' ) 
			) );
		} else {
			echo json_encode ( array (
					'success' => false,
					'message' => $this->lang->line ( 'items_cannot_be_deleted' ) 
			) );
		}
	}

	function add_category(){
		$this->load->model('Item');
		$data['categories'] = $this->Item->getItemCategories(); 
		$this->load->view('items/form_category.tpl',$data);
	}

	function show_category(){
		$this->load->model('Item');
		$data['items']  = $this->Item->getAll();                 
                
		$this->load->view('items/show_item.tpl',$data);
                
                
	}

	function category_save(){
		$this->load->model('Item');
		
		$data['id'] = '';
		$data['category_name'] = ($this->input->post('category_name')) ? $this->input->post('category_name') : '';
	    $data['category_description'] = ($this->input->post('category_description')) ? $this->input->post('category_description') : '';
	    $data['parent_category'] = ($this->input->post('parent_category')) ? $this->input->post('parent_category') : '';
	    $data['status'] = ($this->input->post('status')) ? $this->input->post('status') : 'Disabled';
	    $data['saving_upto'] = ($this->input->post('saving_upto')) ? $this->input->post('saving_upto') : '';
	    $data['display_order'] = 0;
	    $data['type'] = 'item';

	    $category_images = $this->input->post('item_images');
        if($category_id = $this->Item->category_save($data)){
        	foreach ($category_images as  $image) {
	   			$image_data = array(
	   				'table' => 'cofee_app _category',
	   				'record_id' => $category_id,
	   				'image' => $image,
	   				'display_order' => 0
	   			);
	   			$this->Item->addItemImages($image_data);
	   		}
        }
	}

	function delete_item() {
		$this->load->model('Item');
		//echo $item_code = $this->input->get('item_code');
		$item_code = $this->input->post('item_code');             
             
		$delete_item = $this->Item->delete_item_by_id($item_code);             
            
                if($delete_item){ return "TRUE";}else{ return "FALSE";}
	}

        
        function edit($item_id) {
            $this->load->model('Item');
		$data['categories'] = $this->Item->getItemCategories(); 
		$data['itemData'] = $this->Item->get_item_by_id($item_id); 
                 
                
		$this->load->view('items/edit_form.tpl',$data);
        }
        
        
        function update_item() {
            
            $this->load->model('Item');
            $item_code = $this->Item->getHighest();

	    //$data['location']  = 'SHOP006'; //($this->input->post('location')) ? $this->input->post('location') : ''; //TODO : get the active location
	    $category = ($this->input->post('category')) ? explode('_',$this->input->post('category')) : '';
	    $data['category_id'] = $category[0];
	    $data['category'] = $category[1];
	    $data['name'] = ($this->input->post('name')) ? $this->input->post('name') : '';
	    $data['description'] = ($this->input->post('description')) ? $this->input->post('description') : '';
	    $data['quantity'] = ($this->input->post('quantity')) ? $this->input->post('quantity') : '';
	    $data['reorder_level'] = ($this->input->post('reorder_level')) ? $this->input->post('reorder_level') : '';
	    $data['price'] = ($this->input->post('price')) ? $this->input->post('price') : '';
            
            //var_dump($data);exit;
            
              if($this->Item->update_item($data,$_POST['item_code'])){
                
               return true; 
	   }
           
        }
        

}
?>