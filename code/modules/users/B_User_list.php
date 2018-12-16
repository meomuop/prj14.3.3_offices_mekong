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
	
	// --- Add - Edit
	if($vars['add_edit']==1):
	 if (!isset($vars['user_id']) || $vars['user_id'] < 1) {
		$obj = new users_class();
		$obj->readForm();
		if ((is_null($error)) || ($error == "")) {
			$obj->user_pass = md5($vars['user_pass']);
			$obj->user_encode_pass = $vars['user_pass'];
			$obj->insertnew();
			unset($obj);
		}
	 }else{
		$obj = new users_class();
		$obj->readForm();
		if ((is_null($error)) || ($error == "")) {
			$obj->user_pass = md5($vars['user_pass']);
			$obj->user_encode_pass = $vars['user_pass'];
			if ($obj->is_already_used($obj->tablename, "user_id", $obj->user_id)){
				$obj->update();
				unset($obj);
			}
		}
	 }
	endif;

	// --- Get record for edit
	if($vars['edit_me']==1):
	  $obj = new users_class();
	  $obj->getDBbyPkey($vars['user_id']);
	  if (!$obj->user_id) redirect("?listUser".$arg['arg']);
	  $obj_info = (array)$obj;
	  // --- Get department selected list
	  $obj_depa_se 		= new department_class();
	  if(substr($obj->department_id,strlen($obj->department_id)-1,strlen($obj->department_id))==","):
	  	$obj->department_id = substr($obj->department_id,0,strlen($obj->department_id)-1);
	  endif;
	  $where_depa_se	= " 1 = 1 and department_active=1 and department_id in (".$obj->department_id.")";
	  $obj_list_depa_se	= $obj_depa_se->getDBList(" $where_depa_se", "department_name", FALSE, "");
	   
	  // --- Get department list
	  $obj_depa_unse		= new department_class();
	  $where_depa_unse		= " 1 = 1 and department_active=1 and department_id not in (".$obj->department_id.")";
	  $obj_list_depa_unse	= $obj_depa_unse->getDBList(" $where_depa_unse", "department_name", FALSE, "");
	endif;

	// --- Variables is used in this page
	$order_arr = array(0 => "Theo thời gian", 1 => "Theo tên");
	$nrs_arr = array(10, 20, 30, 40, 50, 100);
	
	$processurl = "?listUser&mod=users";
	$processurl .= trim($vars['keyword'])?"&keyword=".trim($vars['keyword']):"";
	$processurl .= $vars['department_id_fs']?"&department_id_fs=".$vars['department_id_fs']:"";
	$processurl .= $vars['object_id_fs']?"&object_id_fs=".$vars['object_id_fs']:"";

	// --- prepare to query
	$order_id = (int)$vars['order'];
	$osflags = TRUE;
	if ($order_id == 1){  $order_str = "user_name"; $osflags = FALSE;}
	else{ $order_str = "user_id DESC"; $osflags = TRUE; }
	$where = "";
	$where .= " 1 = 1 and user_name <> 'leanhvan' ";
	if (trim($vars['keyword'])) $where .= " AND user_fullname regexp binary '".trim($vars['keyword'])."' ";
	if ($vars['department_id_fs']) $where .= " AND (unit_id = ".$vars['department_id_fs']." or department_id LIKE '".$vars['department_id_fs'].",%')";
	if ($vars['object_id_fs']) 	$where .= " AND object_id = ".$vars['object_id_fs'];

	// --- prepare to paging
    $obj = new users_class();
	$vars['numresult'] = (int)$vars['numresult']?(int)$vars['numresult']:10;
	$total_num_result = $obj->getRowNumber($where);
	$num_page = ceil($total_num_result/$vars['numresult']);
	if (($vars['curpage'] > $num_page) && $num_page) $vars['curpage'] = $num_page;
	$cur_num_result = (($total_num_result%$vars['numresult']!=0)&&($vars['curpage']==$num_page))?($total_num_result%$vars['numresult']):$vars['numresult'];
	if ($vars['curpage'] < 1) $vars['curpage'] = 1;
	$cur_pos = ($vars['curpage'] - 1) * $vars['numresult'];

	// --- check and uncheck
	if ($vars['checkUncheck']==1){
	$obj->checkUncheck($vars['checkUncheckID'],$vars['checkUncheck'],$vars['setfield']);
	}
	if ($vars['checkUncheck']==2){
	$obj->checkUncheck($vars['checkUncheckID'],$vars['checkUncheck'],$vars['setfield']);
	}
	
	// --- get data to view
	if ($where == "")
	$obj_list = $obj->getDBList("", $order_str, $osflags , " LIMIT ".$cur_pos.",".$cur_num_result );
	else		
	$obj_list = $obj->getDBList($where, $order_str, $osflags , " LIMIT ".$cur_pos.",".$cur_num_result );
	
	// --- Print paging
	$pager_str = get_paging_string($processurl, $vars['curpage'], $num_page);
	
	// --- Get unit fields list
	$obj_unit 		= new unit_class();
	$where_unit 	= " 1 = 1 and unit_active=1";
	$obj_list_unit 	= $obj_unit->getDBList(" $where_unit", "unit_name", FALSE, "");
	 
	// --- Get department fields list
	$obj_department 		= new department_class();
	$where_department 		= " 1 = 1 and department_active=1";
	$obj_list_department	= $obj_department->getDBList(" $where_department", "department_name", FALSE, "");
	 
	// --- Get object fields list
	$obj_object 		= new object_class();
	$where_object 		= " 1 = 1 and object_active=1";
	$obj_list_object 	= $obj_object->getDBList(" $where_object", "object_name", FALSE, "");
	
	// --- Get trinhdo fields list
	$obj_trinhdo 		= new trinhdo_class();
	$where_trinhdo 		= " 1 = 1 and trinhdo_active=1";
	$obj_list_trinhdo 	= $obj_trinhdo->getDBList(" $where_trinhdo", "trinhdo_name", FALSE, "");
	
	// --- send argument to next page
	$vars['arg'] = "";
	$vars['arg'] .= $vars['numresult']?("&numresult=".$vars['numresult']):"";
	$vars['arg'] .= $vars['curpage']?("&curpage=".$vars['curpage']):"";
	$vars['arg'] .= $vars['mod']?("&mod=".$vars['mod']):"";
	
	// --- Assign data to template
	$assign_list['obj_list'] 			= $obj_list;
	$assign_list['obj_list_unit'] 		= $obj_list_unit;
	$assign_list['obj_list_department'] = $obj_list_department;
	$assign_list['obj_list_object'] 	= $obj_list_object;
	$assign_list['obj_list_trinhdo'] 	= $obj_list_trinhdo;
	$assign_list['obj_list_depa_se'] = $obj_list_depa_se;
	$assign_list['obj_list_depa_unse'] = $obj_list_depa_unse;
	
	$assign_list['unit_id'] 		= $vars['unit_id'];
	$assign_list['department_id'] 	= $vars['department_id'];
	$assign_list['object_id'] 		= $vars['object_id'];
	
	$assign_list['pager_str'] 	= $pager_str;
	$assign_list['nrs_arr'] 	= $nrs_arr;
	$assign_list['total_num_result'] = $total_num_result;
	$assign_list['num_page'] 	= $num_page;
	$assign_list['order_arr'] 	= $order_arr;
	$assign_list['permissionArr'] = $permissionArr;
	$assign_list['processurl'] 	= $processurl;
	$assign_list['vars'] 		= $vars;
	$assign_list['obj_info'] 	= $obj_info;
	
	$display = dirname(__FILE__)."/skin/B_User_tbl.tpl";
	$assign_list['display'] = $display;
	
	$smarty->assign($assign_list);
	
	// --- Display template
	if (isset($vars['activeAjax']))
	$smarty->display(dirname(__FILE__)."/skin/B_User_tbl.tpl");
	else
	$smarty->display(dirname(__FILE__)."/skin/B_User_list.tpl");
?>