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
	require_once($CLASSES_PATH."clsUnits.php");
	require_once($CLASSES_PATH."clsDepartments.php");
	require_once($CLASSES_PATH."clsObjects.php");
	require_once($CLASSES_PATH."clsTrinhdos.php");
	
	// --- Class is used in this page
	$vars = array_merge($_POST, $_GET);
	$obj = new users_class();
	
	// --- Variables is used in this page
	$processurl = "?listUser&mod=users";
	$processurl .= trim($vars['keyword'])?"&keyword=".trim($vars['keyword']):"";
	$processurl .= $vars['department_id_fs']?"&department_id_fs=".$vars['department_id_fs']:"";
	$processurl .= $vars['object_id_fs']?"&object_id_fs=".$vars['object_id_fs']:"";
	
	// --- prepare to query
	
	$where = "";
	$where .= " 1 = 1 and user_name <> 'leanhvan' ";
	if (trim($vars['keyword'])) $where .= " AND user_fullname regexp binary '".trim($vars['keyword'])."' ";
	if ($vars['department_id']) $where .= " AND (unit_id = ".$vars['department_id']." or department_id LIKE '".$vars['department_id'].",%')";
	
	// --- get data to view
	$obj_list = $obj->getDBList($where, "object_id asc", "" , " ");
	$total_num_result = $obj->getRowNumber($where);
		 
	// --- Get department fields list
	$obj_department 		= new department_class();
	$where_department 		= " 1 = 1 and department_active=1";
	$obj_list_department	= $obj_department->getDBList(" $where_department", "department_name", FALSE, "");
	$total_depart 			= $obj_department->getRowNumber($where_department);
	 
	// --- Get object fields list
	$obj_object 		= new object_class();
	$where_object 		= " 1 = 1 and object_active=1";
	$obj_list_object 	= $obj_object->getDBList(" $where_object", "object_name", FALSE, "");
		
	// --- send argument to next page
	$vars['arg'] = "";
	$vars['arg'] .= $vars['numresult']?("&numresult=".$vars['numresult']):"";
	$vars['arg'] .= $vars['curpage']?("&curpage=".$vars['curpage']):"";
	$vars['arg'] .= $vars['mod']?("&mod=".$vars['mod']):"";
	
	// --- Assign data to template
	$assign_list['obj_list'] 			= $obj_list;
	$assign_list['obj_list_department'] = $obj_list_department;
	$assign_list['total_depart'] 		= $total_depart;
	$assign_list['obj_list_object'] 	= $obj_list_object;
	
	$assign_list['unit_id'] 		= $vars['unit_id'];
	$assign_list['department_id'] 	= $vars['department_id'];
	$assign_list['object_id'] 		= $vars['object_id'];
	
	$assign_list['total_num_result'] = $total_num_result;
	$assign_list['processurl'] 	= $processurl;
	$assign_list['vars'] 		= $vars;
	
	$display = dirname(__FILE__)."/skin/B_UserPhone_tbl.tpl";
	$assign_list['display'] = $display;
	
	$smarty->assign($assign_list);
	
	// --- Display template
	if (isset($vars['activeAjax']))
	$smarty->display(dirname(__FILE__)."/skin/B_UserPhone_tbl.tpl");
	else
	$smarty->display(dirname(__FILE__)."/skin/B_User_list.tpl");
?>