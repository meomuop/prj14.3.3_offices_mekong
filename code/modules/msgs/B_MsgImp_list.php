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
	$obj_msgUser = new msgUser_class();
	
	// --- Variables is used in this page
	$order_arr = array(0 => "Mới đến cũ", 1 => "Cũ đến mới");
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
	
	$processurl = "?listMsgUser&mod=msgs";
	$processurl .= trim($vars['keyword'])?"&keyword=".trim($vars['keyword']):"";
				
	$order_str = ($order_id == 1)?"msg_id ASC":"msg_id DESC";
	
	// --- Condition
	$where = " 1 = 1";
	if (trim($vars['keyword'])) $where .= " AND msg_cont regexp binary '".$vars['keyword']."'";
	
	$limit = " LIMIT ".(string)$cur_pos.", ".(int)$vars['numresult'];
	
	$where .= " AND msg_id in(select msg_id from tbl_msgusers where user_id = ".$_SESSION['user_id']." and msgUser_type = 1)";
	$obj = new msg_class();
	$obj_list = $obj->getDBList(" $where", "", FALSE, "");
	$total_num_result = $obj->getRowNumber("$where");
	$num_page = ceil($total_num_result/$vars['numresult']);
	
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
	
	$assign_list['soan_msg'] 	= $vars['soan_msg'];
	$assign_list['inbox'] 		= $vars['inbox'];
	$assign_list['outbox'] 	= $vars['outbox'];
	$assign_list['drafmsg'] 	= $vars['drafmsg'];
	$assign_list['wastemsg'] 	= $vars['wastemsg'];
	$assign_list['impmsg'] 	= $vars['impmsg'];
	
	$assign_list['obj_list'] 	= $obj_list;
	$assign_list['obj_list_msgUser'] 	= $obj_list_msgUser;
	$assign_list['pager_str'] 	= $pager_str;
	$assign_list["parentArr"] 	= $parentArr; 
	$assign_list['nrs_arr'] 	= $nrs_arr;
	$assign_list['total_num_result'] = $total_num_result;
	$assign_list['num_page'] 	= $num_page;
	$assign_list['order_arr'] 	= $order_arr;
	$assign_list['processurl'] 	= $processurl;
	$assign_list['vars'] 		= $vars;
	$assign_list['obj_info'] 	= $obj_info;
	
	$display = dirname(__FILE__)."/skin/B_MsgImp_tbl.tpl";
	$assign_list['display'] = $display;
	
	$smarty->assign($assign_list);
	
	// --- Display template
	if (isset($vars['activeAjax']))
	$smarty->display(dirname(__FILE__)."/skin/B_MsgImp_tbl.tpl");
	else
	$smarty->display(dirname(__FILE__)."/skin/B_Msg_list.tpl");
?>
