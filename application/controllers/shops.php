<?php
require_once ("secure_area.php");
class Shops extends Secure_area  
{
	function __construct()
	{
		parent::__construct('shops');
	}
	
	function index()
	{		

			$config['base_url'] = site_url('/shops/index');
			$config['total_rows'] = $this->Shop_model->count_all();
			$config['per_page'] = '20';
			$config['uri_segment'] = 3;
			$this->pagination->initialize($config);


			$data['controller_name']= strtolower(get_class());
			$data['form_width']= '380';//$this->get_form_width();
			$data['manage_table'] =  get_shop_manage_table( $this->Shop_model->get_all( $config['per_page'], $this->uri->segment( $config['uri_segment'] ) ), $this );
			$this->load->view('shops/list',$data);
	}

	function view($item_id=-1)
	{

		
		$data['shop_info']=$this->Shop_model->get_info($item_id);
		$this->load->view("shops/form",$data);
	}


	function save($shop_id=-1)
	{
		$shop_data = array(
		'shop_name'=>$this->input->post('name'),
		'address_line1'=>$this->input->post('addressL1'),
		'address_line2'=>$this->input->post('addressL2'),
		'address_line3'=>$this->input->post('addressL3'),
		'code'=>$this->input->post('code'),
		'street'=>$this->input->post('street'),
		'city'=>$this->input->post('city'),
		'country'=>$this->input->post('country'),
		'contact_num'=>$this->input->post('contact_no'),
		'domain_uri'=>$this->input->post('domain_uri')
		);
		

		if($this->Shop_model->save($shop_data,$shop_id))
		{
			//New item
			if($shop_id==-1)
			{
				echo json_encode(array('success'=>true,'message'=>$this->lang->line('shop_successful_adding').' '.
				$shop_data['shop_name'],'shop_id'=>$shop_data['shop_id']));
				$shop_id = $shop_data['shop_id'];
			}
			else //previous item
			{
				echo json_encode(array('success'=>true,'message'=>$this->lang->line('shop_successful_updating').' '.
				$shop_data['shop_name'],'shop_id'=>$shop_id));
				exit();
			}
			
		}
		else//failure
		{
			echo json_encode(array('success'=>false,'message'=>$this->lang->line('shop_error_adding_updating').' '.
			$shop_data['shop_name'],'shop_id'=>-1));
		}

	}

	function get_row()
	{
		$shop_id = $this->input->post('shop_id');
		$data_row=get_item_data_row($this->Shop_model->get_info($shop_id),$this);
		echo $data_row;
	}

	/*
	get the width for the add/edit form
	*/
	function get_form_width()
	{
		return 360;
	}
	
	
}
?>