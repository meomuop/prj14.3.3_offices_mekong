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
	include ($CLASSES_PATH.'clsPlans.php');
	// --- Class is used in this page
	$obj = new plan_class();
		
	$processurl = "?reportPlan&mod=plans";
	
	// --- Condition
	$where = " 1 = 1 and user_id = 0";
	// --- Get data to view in homepage
	if ($vars['tu_ngay']) $where .= " AND plan_start >= '".date('Y-m-d',strtotime($vars['tu_ngay']))." 00:00:00'";
	if ($vars['den_ngay']) $where .= " AND plan_end <= '".date('Y-m-d',strtotime($vars['den_ngay']))." 23:59:59'";
		
	$obj = new plan_class();
	
	$obj_list = $obj->getDBList(" $where", "plan_start asc", FALSE, "");
	$total_num_result = $obj->getRowNumber("$where");
	
	// --- export
	if($vars['exptype']==1):
	header("Content-Type: application/vnd.ms-word");
	header("Expires: 0");
	header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
	header("content-disposition: attachment;filename=LICH_".date('d-m-Y').".doc");
	endif;
	// --- Debug here ----
	unset($obj);
	
	// --- Get argument of page
	$vars['arg'] = "";
	$vars['arg'] .= $vars['numresult']?"&numresult=".$vars['numresult']:"";
	$vars['arg'] .= $vars['curpage']?"&curpage=".$vars['curpage']:"";
	$vars['arg'] .= $vars['order']?"&order=".$vars['order']:"";
	$vars['arg'] .= $vars['mod']?("&mod=".$vars['mod']):"";
	$vars['arg'] .= $vars['exptype']?("&exptype=".$vars['exptype']):"";
	
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
	
	$assign_list['tu_ngay'] 	= $vars['tu_ngay'];
	$assign_list['den_ngay'] 	= $vars['den_ngay'];
	
	$assign_list['obj_list'] 	= $obj_list;
	$assign_list['exptype'] 	= $vars['exptype'];
	
	$assign_list['total_num_result'] = $total_num_result;
	$assign_list['processurl'] = $processurl;
	$assign_list['vars'] 		= $vars;
	
	$display = dirname(__FILE__)."/skin/B_PlanReport_exp.tpl";
	$assign_list['display'] = $display;
	
	$smarty->assign($assign_list);
	// --- Display template
	if (isset($vars['activeAjax']))
	$smarty->display(dirname(__FILE__)."/skin/B_PlanReport_exp.tpl");
	else
	$smarty->display(dirname(__FILE__)."/skin/B_Plan_main.tpl");
?>