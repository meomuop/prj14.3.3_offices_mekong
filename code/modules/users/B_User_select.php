<?php
	/*-------------------------------------------
	- PHP Frame work
	- Created by Le Anh Van - anhvan3103@gmail.com
	--------------------------------------------*/
	if (!isset($key)){
	// Error: no category chosen
	redirect("index.php");
	} 
	
	if($_SESSION['user_level']!=1){
	// Error: low level
	redirect("index.php");
	}
	
	// --- File is included ---
	require_once($CLASSES_PATH."clsUsers.php");
	require_once($CLASSES_PATH."clsUnits.php");
	require_once($CLASSES_PATH."clsDepartments.php");
	require_once($CLASSES_PATH."clsObjects.php");
	require_once($CLASSES_PATH."clsTrinhdos.php");
	
	// --- Class is used in this page
	$vars = array_merge($_POST, $_GET);
	$obj = new users_class();
	
	// --- (Click Del Button)-----
	if ($vars['dlStr']){
	$obj->removeInList($vars['dlStr']);
	}
	
	// --- Items sort
	if($vars['sort_me']==1){
		$obj->sortItem($vars['val'],$vars['user_id']);
	}


	// --- prepare to query
    $osflags = TRUE;
    $where = "";
    $where .= " 1 = 1 and department_id = ".$vars['department_id'];

	// --- prepare to paging
    $obj = new users_class();
	// --- get data to view
	$obj_list = $obj->getDBList($where, '', $osflags );



	
	// --- send argument to next page
	$vars['arg'] = "";
	$vars['arg'] .= $vars['numresult']?("&numresult=".$vars['numresult']):"";
	$vars['arg'] .= $vars['curpage']?("&curpage=".$vars['curpage']):"";
	$vars['arg'] .= $vars['mod']?("&mod=".$vars['mod']):"";
	
	// --- Assign data to template
	$assign_list['obj_list'] 			= $obj_list;
	$assign_list['department_id'] 	= $vars['department_id'];
	
	$assign_list['pager_str'] 	= $pager_str;
	$assign_list['nrs_arr'] 	= $nrs_arr;
	$assign_list['total_num_result'] = $total_num_result;
	$assign_list['num_page'] 	= $num_page;
	$assign_list['order_arr'] 	= $order_arr;
	$assign_list['permissionArr'] = $permissionArr;
	$assign_list['processurl'] 	= $processurl;
	$assign_list['vars'] 		= $vars;
	$assign_list['obj_info'] 	= $obj_info;
	
	$display = dirname(__FILE__)."/skin/B_User_select.tpl";
	$assign_list['display'] = $display;
	
	$smarty->assign($assign_list);
	
	// --- Display template
	$smarty->display(dirname(__FILE__)."/skin/B_User_select.tpl");