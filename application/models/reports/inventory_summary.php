<?php
require_once("report.php");
class Inventory_summary extends Report
{
	function __construct()
	{
		parent::__construct();
	}
	
	public function getDataColumns()
	{
		//return array();
		return array('summary' => array($this->lang->line('reports_item_name'), $this->lang->line('reports_item_number'), $this->lang->line('reports_description'), $this->lang->line('reports_count'), $this->lang->line('reports_reorder_level')),
					'details' => array('Store','Quantity')
		);	

	}
	
	public function getData(array $inputs)
	{

		$this->load->model('shop_model');

		if($inputs['store'])
			$this->db->select('name, item_number, store_id, item_id, IQ.quantity, reorder_level, description');
		else
			$this->db->select('name, item_number, item_id, SUM(IQ.quantity) as quantity, reorder_level, description');

		$this->db->join('ospos_item_quantity IQ', 'items.item_id = IQ.item');

		$this->db->from('items');
		$this->db->where('deleted', 0);
		if($inputs['store'])
			$this->db->where('IQ.store_id',$inputs['store']);

		$this->db->group_by('item_id');
		$this->db->order_by('name');
		
		$data['summary'] = $this->db->get()->result_array(); 

		$shop_list = $this->shop_model->getShopList();

		foreach ($data['summary'] as $key => $value) {

			foreach ($shop_list as $shopKey => $shopRw) {
				$this->db->select('quantity, store_id');
				$this->db->from('ospos_item_quantity');				
				$this->db->where('item', $value['item_id']);
				$this->db->where('store_id', $shopRw['shop_id']);
				$data['details'][$key][$shopKey] = $this->db->get()->result_array();
			}
		 	
		
		 } 
		 return $data;
	}
	
	public function getSummaryData(array $inputs)
	{
		return array();
	}
}
?>