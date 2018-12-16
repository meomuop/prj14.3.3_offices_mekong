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
	require_once ($CLASSES_PATH.'clsAddUsers.php');
	// --- Class is used in this page
	$obj = new addUser_class();
	
	// --- Variables is used in this page
	$order_arr = array(0 => "Thứ tự cập nhật");
	$nrs_arr = array(5,10, 20, 30, 40, 50, 100);
	$vars = array_merge($_POST, $_GET);
	
	if (!(int)$vars['curpage']){
		$vars['curpage'] = 1;
	}else{
		$vars['arg'] = "&curpage=".$vars['curpage']."&numresult=".$vars['numresult'];
	} 
	$vars['numresult'] = (int)$vars['numresult']?(int)$vars['numresult']:10;
	$cur_pos = ($vars['curpage'] - 1) * $vars['numresult'];
	$order_id = (int)$vars['order'];
	
	$processurl = "?listAddUser&mod=docs";
	$processurl .= trim($vars['KeyWord'])?"&KeyWord=".trim($vars['KeyWord']):"";
	$processurl .= $vars['doc_id']?"&doc_id=".$vars['doc_id']:"";
	
	// --- Add - Edit
	if($vars['add_edit']==1):
		$obj = new addUser_class();
		$obj->readForm();
		if ((is_null($error)) || ($error == "")) {
			$obj->addUser_date = date("Y-m-d");
			$obj->user_sent =  $_SESSION['user_id'];
			if(strlen($vars['user_id'])>0):
				$obj->user_id = substr($vars['user_id'],0,strlen($vars['user_id'])-1);
			else:
				$obj->user_id = '0';
			endif;
			$obj->insertnew();
			unset($obj);
		}
	endif;
	
	// --- Del Product which is selected
	if ($vars['dlStr']){
		$obj->removeInList($vars['dlStr']);
	}
			
	// --- Condition : The row 71 got trouble in uesed --> can't findout the reason
	$order_str = "addUser_id DESC";
	
	//$order_str = ($order_id == 1)?"addUser_name":"addUser_id DESC";
	
	// --- Condition
	$where = " 1 = 1 and (user_sent = ".$_SESSION['user_id']." or user_id like '%".$_SESSION['user_id']."%') and doc_id=".$vars['doc_id'];
	
	// --- Get data to view in homepage
	if (trim($vars['KeyWord'])) $where .= " AND addUser_desc LIKE '%".trim($vars['KeyWord'])."%' ";
	
	$limit = " LIMIT ".(string)$cur_pos.", ".(int)$vars['numresult'];
	
	$obj = new addUser_class();
	$obj_list = $obj->getDBList(" $where", $order_str, FALSE, $limit);
	$total_num_result = $obj->getRowNumber("$where");
	$num_page = ceil($total_num_result/$vars['numresult']);
	
	$obj_user 		= new users_class();
	$where_user 	= " 1 = 1 and user_active = 1 and user_id != ".$_SESSION['user_id']." and unit_id = ".$_SESSION['access_unit_id'];
	$obj_list_user	= $obj_user->getDBList(" $where_user", "user_name", FALSE, "");
	
	// ------ Print paging ---------
	$pager_str = get_paging_string($processurl, $vars['curpage'], $num_page);
	
	// --- Debug here ----
	unset($obj);
	
	// --- Get argument of page
	$vars['arg'] = "";
	$vars['arg'] .= $vars['numresult']?"&numresult=".$vars['numresult']:"";
	$vars['arg'] .= $vars['curpage']?"&curpage=".$vars['curpage']:"";
	$vars['arg'] .= $vars['order']?"&order=".$vars['order']:"";
	$vars['arg'] .= $vars['mod']?("&mod=".$vars['mod']):"";
	$vars['arg'] .= $vars['doc_id']?"&doc_id=".$vars['doc_id']:"";
	
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
	$assign_list['pager_str'] 	= $pager_str;
	$assign_list["parentArr"] 	= $parentArr; 
	$assign_list['nrs_arr'] 	= $nrs_arr;
	$assign_list['total_num_result'] = $total_num_result;
	$assign_list['num_page'] 	= $num_page;
	$assign_list['order_arr'] 	= $order_arr;
	$assign_list['processurl'] 	= $processurl;
	$assign_list['doc_id'] 		= $vars['doc_id'];
	$assign_list['vars'] 		= $vars;
	
	$display = dirname(__FILE__)."/skin/B_AddUser_tbl.tpl";
	$assign_list['display'] = $display;
	
	$smarty->assign($assign_list);
	
	// --- Display template
	if (isset($vars['activeAjax']))
	$smarty->display(dirname(__FILE__)."/skin/B_AddUser_tbl.tpl");
	else
	$smarty->display(dirname(__FILE__)."/skin/B_Doc_list.tpl");
?>
