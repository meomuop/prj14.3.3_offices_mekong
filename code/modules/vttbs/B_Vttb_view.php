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
	require_once($CLASSES_PATH."clsVttbs.php");
	require_once($CLASSES_PATH."clsDepartments.php");
	require_once($CLASSES_PATH."clsObjects.php");
	require_once($CLASSES_PATH.'clsVttbDatlichs.php');
	// --- Class is used in this page
	$obj = new vttb_class();
	
	// --- Variables is used in this page
	$vars = array_merge($_POST, $_GET);
	if(!$vars['mod']) $vars['mod'] = 'vttbs';
	
	if (!(int)$vars['curpage']){
		$vars['curpage'] = 1;
	}else{
		$vars['arg'] = "&curpage=".$vars['curpage']."&numresult=".$vars['numresult'];
	} 
	$vars['numresult'] = (int)$vars['numresult']?(int)$vars['numresult']:5;
	$cur_pos = ($vars['curpage'] - 1) * $vars['numresult'];
	$order_id = (int)$vars['order'];
	
	$processurl = "?listDatlich&mod=vttbs";
	$processurl .= $vars['vttb_id']?"&vttb_id=".$vars['vttb_id']:"";
	$processurl .= $vars['vttb_sub_id']?"&vttb_sub_id=".$vars['vttb_sub_id']:"";
	
	// --- Get record for edit
	$obj = new vttb_class();
	$obj->getDBbyPkey($vars['vttb_id']);
	$obj_info = (array)$obj;
	
	$obj_user = new users_class();
	$obj_user->getDBbyPkey($obj->user_id);
	$user_info = (array)$obj_user;
	unset($obj_user);
	
	$where = " 1 = 1";
	// --- Get data to view in homepage
	if ($vars['vttb_id']) $where .= " AND vttb_id =".$vars['vttb_id'];
	$limit = " LIMIT ".(string)$cur_pos.", ".(int)$vars['numresult'];
	$obj = new vttb_datlich_class();
	$obj_list = $obj->getDBList(" $where", "vttb_datlich_id DESC", FALSE, $limit);
	$total_num_result = $obj->getRowNumber("$where");
	$num_page = ceil($total_num_result/$vars['numresult']);
	
	// --- sub
	$obj_sub = new vttb_sub_class();
	$obj_sub->getDBbyPkey($vars['vttb_sub_id']);
	$obj_sub_info = (array)$obj_sub;
	
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
	
	// --- Get argument of page
	$vars['arg'] = "";
	$vars['arg'] .= $vars['numresult']?"&numresult=".$vars['numresult']:"";
	$vars['arg'] .= $vars['curpage']?"&curpage=".$vars['curpage']:"";
	$vars['arg'] .= $vars['order']?"&order=".$vars['order']:"";
	$vars['arg'] .= $vars['mod']?("&mod=".$vars['mod']):"";
	$vars['arg'] .= $vars['vttb_id']?("&vttb_id=".$vars['vttb_id']):"";
	$vars['arg'] .= $vars['vttb_sub_id']?("&vttb_sub_id=".$vars['vttb_sub_id']):"";
		
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
	$assign_list['obj_list_user'] 	= $obj_list_user;
	$assign_list['obj_list_department'] = $obj_list_department;
	$assign_list['obj_list_object'] = $obj_list_object;
	
	$assign_list['vttb_id'] 	= $vars['vttb_id'];
	$assign_list['user_id'] 	= $vars['user_id'];
	$assign_list['order_id'] 	= $vars['order_id'];
	
	$assign_list['obj_info'] 		= $obj_info;
	$assign_list['user_info'] 		= $user_info;
	$assign_list['obj_sub_info'] 	= $obj_sub_info;
	$assign_list['vttb_sub_id'] 	= $vars['vttb_sub_id'];
		
	$assign_list['pager_str'] 	= $pager_str;
	$assign_list["parentArr"] 	= $parentArr; 
	$assign_list['nrs_arr'] 	= $nrs_arr;
	$assign_list['total_num_result'] = $total_num_result;
	$assign_list['num_page'] 	= $num_page;
	$assign_list['order_arr'] 	= $order_arr;
	$assign_list['processurl'] 	= $processurl;
	$assign_list['vars'] 		= $vars;
	
	$smarty->assign($assign_list);
	
	// --- Display template
	$smarty->display(dirname(__FILE__)."/skin/B_Vttb_view.tpl");
?>