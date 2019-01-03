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
	require_once ($CLASSES_PATH.'tinhluong/clsChamcong.php');
    require_once ($CLASSES_PATH.'tinhluong/clsTldn.php');
    require_once ($CLASSES_PATH.'tinhluong/clsPhucap.php');
    $vars = array_merge($_POST, $_GET);

	// --- Condition
	$where = " 1 = 1 and cc_nam = ".date('Y')." and cc_thang = ".$vars['thangluong'];
	
	$obj = new cc_class();
	$obj_list = $obj->getDBList(" $where", "", FALSE, "");
	//rsprint($obj_list);

	// --- Debug here ----
	unset($obj);
	
	// --- Get argument of page
	$vars['arg'] = "";
	$vars['arg'] .= $vars['mod']?("&mod=".$vars['mod']):"";
	
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
	$assign_list['obj_list'] 	= $obj_list;
    $assign_list['thangluong'] 	= $vars['thangluong'];
	$assign_list['vars'] 		= $vars;

	$display = dirname(__FILE__)."/skin/B_Bangluong_in.tpl";
	$assign_list['display'] = $display;
	
	$smarty->assign($assign_list);
	
	// --- Display template
	if (isset($vars['activeAjax']))
	  $smarty->display(dirname(__FILE__)."/skin/B_Bangluong_in.tpl");
	else
	  $smarty->display(dirname(__FILE__)."/skin/B_Thangluong_list.tpl");
?>