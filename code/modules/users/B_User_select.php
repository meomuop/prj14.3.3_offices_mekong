<?php
	/*-------------------------------------------
	- PHP Frame work
	- Created by Le Anh Van - anhvan3103@gmail.com
	--------------------------------------------*/
	if (!isset($key)){
	// Error: no category chosen
	redirect("index.php");
	} 

	// --- File is included ---
	require_once($CLASSES_PATH."clsUsers.php");
	require_once($CLASSES_PATH."clsDepartments.php");
	
	// --- Class is used in this page
	$vars = array_merge($_POST, $_GET);
	$obj = new users_class();

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
	$vars['arg'] .= $vars['mod']?("&mod=".$vars['mod']):"";
	
	// --- Assign data to template
	$assign_list['obj_list'] 			= $obj_list;
	$assign_list['department_id'] 	= $vars['department_id'];
	$assign_list['vars'] 		= $vars;
	
	$display = dirname(__FILE__)."/skin/B_User_select.tpl";
	$assign_list['display'] = $display;
	
	$smarty->assign($assign_list);
	
	// --- Display template
	$smarty->display(dirname(__FILE__)."/skin/B_User_select.tpl");