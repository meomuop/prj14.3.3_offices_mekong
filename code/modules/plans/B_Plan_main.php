<?php
/*-------------------------------------------
- PHP Frame work
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/
	// --- Check url is Error -- Access deny -----
	if (!isset($key)){
	// Error: no category chosen
	redirect("index.php");
	}
	
	// ------------------------------
	require_once ($CLASSES_PATH.'clsPlanDetails.php');
	// --- Class is used in this page
	$obj = new plan_detail_class();
	
	// --- Variables is used in this page
	$order_arr = array(0 => "Mới đến cũ", 1 => "Cũ đến mới");
	$nrs_arr = array(5,10, 20, 30, 40, 50, 100);
	$vars = array_merge($_POST, $_GET);
		
	// --- Del Product which is selected
	if ($vars['dlStr']){
		$obj->removeInList($vars['dlStr']);
	}
	
	// --- Debug here ----
	unset($obj);
		
	// permissions
	$per_add 	= 1;
	$per_edit 	= 1;
	$per_del 	= 1;
	$per_act 	= 1;
	
	// --- Assign data to template
	$assign_list = array();
	
	$assign_list['per_add'] 	= $per_add;
	$assign_list['per_edit'] 	= $per_edit;
	$assign_list['per_del'] 	= $per_del;
	$assign_list['per_act'] 	= $per_act;
		
	$assign_list['bld'] 		= $vars['bld'];
	$assign_list['user_ld'] 	= $vars['user_ld'];
		
	$display = dirname(__FILE__)."/skin/B_Plan_tbl.tpl";
	$assign_list['display'] = $display;
	
	$smarty->assign($assign_list);
	
	// --- Display template
	if (isset($vars['activeAjax']))
	$smarty->display(dirname(__FILE__)."/skin/B_Plan_tbl.tpl");
	else
	$smarty->display(dirname(__FILE__)."/skin/B_Plan_main.tpl");
?>
