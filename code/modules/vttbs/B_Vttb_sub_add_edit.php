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
	require_once($CLASSES_PATH."clsVttbCats.php");
	require_once($CLASSES_PATH."clsVttbSubs.php");
	require_once($CLASSES_PATH."clsDepartments.php");
	// --- Class is used in this page
	$obj = new vttb_sub_class();
	
	// --- Variables is used in this page
	$vars = array_merge($_POST, $_GET);
	if(!$vars['mod']) $vars['mod'] = 'vttbs';
	
	// --- Add - Edit
	if($vars['add_edit']==1):
	 if (!isset($vars['vttb_sub_id']) || $vars['vttb_sub_id'] < 1) {
		$obj = new vttb_sub_class();
		$obj->readForm();
		if ((is_null($error)) || ($error == "")) {
			$obj->vttb_sub_date = date("Y-m-d");
			$obj->vttb_sub_ununicode = fnsUnUnicode($vars['vttb_sub_name']);
			$obj->user_id = $_SESSION['user_id'];
			
			$obj->insertnew();
			unset($obj);
		}
	 }else{
		$obj = new vttb_sub_class();
		$obj->readForm();
		if ((is_null($error)) || ($error == "")) {
			$obj->vttb_sub_date = date("Y-m-d");
			$obj->vttb_sub_ununicode = fnsUnUnicode($vars['vttb_sub_name']);
			$obj->user_id = $_SESSION['user_id'];
			
			if ($obj->is_already_used($obj->tablename, "vttb_sub_id", $obj->vttb_sub_id))
			{
				$obj->update();
				unset($obj);
			}
		}
	 }
	endif;
	
	// --- Get record for edit
	if($vars['edit_me']==1):
	 $obj = new vttb_sub_class();
	 $obj->getDBbyPkey($vars['vttb_sub_id']);
	 $obj_info = (array)$obj;
	endif;
	
	// --- Get user list
	$obj_user 		= new users_class();
	$where_user 	= " 1 = 1 and user_active = 1 and user_level in(4,5)";
	$obj_list_user	= $obj_user->getDBList(" $where_user", "user_sort", FALSE, "");
	
	// --- Get department list
	$obj_department 		= new department_class();
	$where_department 		= " 1 = 1 and department_active=1";
	$obj_list_department	= $obj_department->getDBList(" $where_department", "department_name", FALSE, "");
	
	// --- Get argument of page
	$vars['arg'] = "";
	$vars['arg'] .= $vars['numresult']?"&numresult=".$vars['numresult']:"";
	$vars['arg'] .= $vars['curpage']?"&curpage=".$vars['curpage']:"";
	$vars['arg'] .= $vars['order']?"&order=".$vars['order']:"";
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
	
	$assign_list['obj_list_user'] 	= $obj_list_user;
	$assign_list['obj_list_department'] = $obj_list_department;
	
	$assign_list['vttb_sub_id'] = $vars['vttb_sub_id'];
	$assign_list['vttb_cat_id'] = $vars['vttb_cat_id'];
	$assign_list['user_id'] 	= $vars['user_id'];
	$assign_list['order_id'] 	= $vars['order_id'];
	$assign_list['obj_info'] 	= $obj_info;
	
	$assign_list['processurl'] = $processurl;
	$assign_list['vars'] 		= $vars;
	
	$smarty->assign($assign_list);
	
	// --- Display template
	$smarty->display(dirname(__FILE__)."/skin/B_Vttb_sub_add_edit.tpl");
?>