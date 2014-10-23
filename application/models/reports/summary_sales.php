<?php
require_once("report.php");
class Summary_sales extends Report
{
	function __construct()
	{
		parent::__construct();
	}

	public function getDataColumns()
	{
		return array('Store',$this->lang->line('reports_date'), $this->lang->line('reports_subtotal'), 'Row Item Total', $this->lang->line('reports_total'), $this->lang->line('reports_tax'), $this->lang->line('reports_profit'));
	}
	
	public function getData(array $inputs)
	{		

			$this->db->select('sale_date, shop_id, sum(item_unit_price) as item_unit_price, sum(subtotal) as subtotal, sum(total) as total, sum(tax) as tax,sum(profit) as profit');
			$this->db->from('sales_items_temp');
			if ($inputs['sale_type'] == 'sales')
			{
				$this->db->where('quantity_purchased > 0');
			}
			elseif ($inputs['sale_type'] == 'returns')		{
				$this->db->where('quantity_purchased < 0');
			}


			if($inputs['store']){
				$this->db->where('shop_id = "'.$inputs['store'].'"');
				$this->db->group_by('sale_date');
			}else{
				$this->db->where('shop_id != 5');
				$this->db->where('shop_id != 6');
				$this->db->group_by('shop_id');
			}	
			
			 $this->db->where('sale_date >=', $inputs['start_date']);
             $this->db->where('sale_date <=', $inputs['end_date']); 

			// if($inputs['start_date'] != $inputs['end_date'])
			// 	$this->db->having('sale_date BETWEEN "'. $inputs['start_date']. '" and "'. $inputs['end_date'].'"');

			$this->db->order_by('sale_date');

		    $query = $this->db->get();	
		   //echo $this->db->last_query();
		  return $query->result_array();
	}
	
	public function getSummaryData(array $inputs)
	{
		$this->db->select('sum(subtotal) as subtotal, sum(total) as total, sum(tax) as tax,sum(profit) as profit');
		$this->db->from('sales_items_temp');
		$this->db->where('sale_date BETWEEN "'. $inputs['start_date']. '" and "'. $inputs['end_date'].'"');
		if ($inputs['sale_type'] == 'sales')
		{
			$this->db->where('quantity_purchased > 0');
		}
		elseif ($inputs['sale_type'] == 'returns')
		{
			$this->db->where('quantity_purchased < 0');
		}
		if($inputs['store']){
			$this->db->where('shop_id = "'.$inputs['store'].'"');
		}else{
				$this->db->where('shop_id != 5');
				$this->db->where('shop_id != 6');
		}	

		return $this->db->get()->row_array();		
	}



	/* ---------------- Dahsboard widget functions---------------------*/

	/**
	* Return : total sales figures based on date duration given
	*/
	public function getTotalSale($start_date,$end_date){
		$this->db->select('sum(total) as total, sum(profit) as profit');
		$this->db->from('sales_items_temp');
		$this->db->where('sale_date BETWEEN "'. $start_date. '" and "'. $end_date.'"');
		$this->db->where('quantity_purchased > 0');

		return $this->db->get()->row_array();
	}


	/**
	* Return : Shop details with ales figures based on date duration given
	*/
	public function getShopSalesData($start_date,$end_date){


		$this->load->model('Shop_model');
		$shop_list = $this->Shop_model->getShopList();

		$this->db->select('sum(total) as total, shop_id');
		$this->db->from('sales_items_temp');
		$this->db->where('sale_date BETWEEN "'. $start_date. '" and "'. $end_date.'"');
		$this->db->where('quantity_purchased > 0');
		$this->db->group_by('shop_id');
		$this->db->order_by('total','desc');
		$query = $this->db->get();  
        $shop_data =  $query->result_array();

		$data = array();

		foreach ($shop_data as $key => $value) {
			$objStore = new stdClass();

			$objStore->shop = $this->Shop_model->get_name($value['shop_id']);
			$objStore->total = ($value['total']) ? $value['total'] : 0;

			array_push($data, $objStore);
		}

		return $data;
	}

}
?>