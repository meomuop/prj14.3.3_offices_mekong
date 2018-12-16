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
	require_once($CLASSES_PATH."clsVttbCats.php");
	require_once($CLASSES_PATH."clsVttbSubs.php");
	require_once($CLASSES_PATH."clsVttbs.php");
	
	// --- Class is used in this page
	$vars = array_merge($_POST, $_GET);
	$obj = new vttb_cat_class();
	
	// --- Variables is used in this page
	$processurl = "?listVTTBCat_Chung&mod=vttbs";
	$processurl .= trim($vars['vttb_cat_name_fs'])?"&vttb_cat_name_fs=".trim($vars['vttb_cat_name_fs']):"";
	
	// --- bo loc
	$char_arr = array('---','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z');
	
	// --- prepare to query
	$where = "";
	$where .= " 1 = 1 ";
	if (isset($vars['vttb_cat_name_fs']) && trim($vars['vttb_cat_name_fs']) != '---') $where .= " AND vttb_cat_name LIKE '".trim($vars['vttb_cat_name_fs'])."%'";
	// --- get data to view
	$obj_list = $obj->getDBList($where, "vttb_cat_name asc", "" , " ");
	$total_num_result = $obj->getRowNumber($where);
	
	// --- Del record which is selected
	if ($vars['del_vttb']==1 && $vars['dlStr']){
		$obj_vttb = new vttb_class();
		$obj_vttb->removeInList($vars['dlStr']);
		unset($obj_vttb);
	}
	
	if ($vars['del_vttb_cat']==1 && $vars['dlStr']){
		$obj_vttb_cat = new vttb_cat_class();
		$obj_vttb_cat->removeInList($vars['dlStr']);
		unset($obj_vttb_cat);
	}
	
	if ($vars['del_vttb_sub']==1 && $vars['dlStr']){
		$obj_vttb_sub = new vttb_sub_class();
		$obj_vttb_sub->removeInList($vars['dlStr']);
		unset($obj_vttb_sub);
	}
		 
	// --- Get vttb fields list
	if ($vars['vttb_sub_id']):
		$obj_sub = new vttb_sub_class();
	 	$obj_sub->getDBbyPkey($vars['vttb_sub_id']);
	 	$obj_sub_info = (array)$obj_sub;
		
		$obj_vttb 		= new vttb_class();
		$where_vttb 	= " 1 = 1";
		if($_SESSION['user_level']==1):
			$where_vttb 	.= " AND vttb_sub_id = ".$vars['vttb_sub_id']."";
		else:
			if($obj_sub->vttb_sub_type == 1):
				$where_vttb 	.= " AND vttb_sub_id = ".$vars['vttb_sub_id']." and vttb_useby = ".$_SESSION['user_id'];
			else:
				$where_vttb 	.= " AND vttb_sub_id = ".$vars['vttb_sub_id']."";
			endif;
		endif;
		if ($vars['keyword']) 	$where_vttb .= " AND vttb_name regexp binary '".$vars['keyword']."'";
		$obj_list_vttb	= $obj_vttb->getDBList(" $where_vttb", "vttb_name", FALSE, "");
		$total_vttb 	= $obj_vttb->getRowNumber($where_vttb);
	endif;
	
	// --- Get user list
	$obj_user 		= new users_class();
	$where_user 	= " 1 = 1 and user_active = 1";
	$obj_list_user	= $obj_user->getDBList(" $where_user", "user_sort", FALSE, "");
	
	// --- Get department list
	$obj_department 		= new department_class();
	$where_department 		= " 1 = 1 and department_active=1";
	$obj_list_department	= $obj_department->getDBList(" $where_department", "department_name", FALSE, "");
	
	// --- Get object list
	$obj_object 		= new object_class();
	$where_object 		= " 1 = 1 and object_active=1";
	$obj_list_object	= $obj_object->getDBList(" $where_object", "object_name", FALSE, "");
		 		
	// --- send argument to next page
	$vars['arg'] = "";
	$vars['arg'] .= $vars['numresult']?("&numresult=".$vars['numresult']):"";
	$vars['arg'] .= $vars['curpage']?("&curpage=".$vars['curpage']):"";
	$vars['arg'] .= $vars['mod']?("&mod=".$vars['mod']):"";
	$vars['arg'] .= $vars['vttb_cat_name_fs']?("&vttb_cat_name_fs=".$vars['vttb_cat_name_fs']):"";
	
	// --- Assign data to template
	$assign_list['obj_list'] 	= $obj_list;
	$assign_list['obj_list_user'] 	= $obj_list_user;
	$assign_list['obj_list_department'] = $obj_list_department;
	$assign_list['obj_list_object'] = $obj_list_object;
	$assign_list['obj_list_vttb'] = $obj_list_vttb;
	$assign_list['total_vttb'] 	= $total_vttb;
	$assign_list['char_arr'] 	= $char_arr;
	$assign_list['obj_sub_info'] 	= $obj_sub_info;
	
	$assign_list['vttb_cat_id'] 	= $vars['vttb_cat_id'];
	$assign_list['vttb_sub_id'] 	= $vars['vttb_sub_id'];
	$assign_list['vttb_cat_name_fs'] = $vars['vttb_cat_name_fs'];
	
	$assign_list['total_num_result'] = $total_num_result;
	$assign_list['processurl'] 	= $processurl;
	$assign_list['vars'] 		= $vars;
	
	$display = dirname(__FILE__)."/skin/B_Vttb_chung_tbl.tpl";
	$assign_list['display'] = $display;
	
	$smarty->assign($assign_list);
	
	// --- Display template
	if (isset($vars['activeAjax']))
	$smarty->display(dirname(__FILE__)."/skin/B_Vttb_chung_tbl.tpl");
	else
	$smarty->display(dirname(__FILE__)."/skin/B_Vttb_list.tpl");
?>