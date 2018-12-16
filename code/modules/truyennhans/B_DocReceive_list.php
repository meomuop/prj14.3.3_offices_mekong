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
	include ($CLASSES_TNVB.'clsDocReceives.php');
	include ($CLASSES_TNVB.'clsDocCats.php');
	include ($CLASSES_TNVB.'clsDocFields.php');
	include ($CLASSES_TNVB.'clsImportants.php');
	// --- Class is used in this page
	$obj = new docreceive_class();
	
	// --- Variables is used in this page
	$order_arr = array(0 => "Tất cả văn bản", 1 => "Văn bản chưa xem", 2 => "Văn bản đã xem");
	$nrs_arr = array(5,10, 20, 30, 40, 50, 100, 150, 200);
	$vars = array_merge($_POST, $_GET);
	
	if(!$vars['mod']) $vars['mod'] = 'docs';
	
	if (!(int)$vars['curpage']){
		$vars['curpage'] = 1;
	}else{
		$vars['arg'] = "&curpage=".$vars['curpage']."&numresult=".$vars['numresult'];
	} 
	$vars['numresult'] = (int)$vars['numresult']?(int)$vars['numresult']:50;
	$cur_pos = ($vars['curpage'] - 1) * $vars['numresult'];
	$order_id = (int)$vars['order'];
	
	$processurl = "?listDocReceive&mod=docs";
	$processurl .= $vars['docField_id']?"&docField_id=".$vars['docField_id']:"";
	$processurl .= trim($vars['doc_code'])?"&doc_code=".trim($vars['doc_code']):"";
	$processurl .= $vars['doc_signed']?"&doc_signed=".$vars['doc_signed']:"";
	$processurl .= trim($vars['doc_desc'])?"&doc_desc=".trim($vars['doc_desc']):"";
	$processurl .= trim($vars['signPer_id'])?"&signPer_id=".trim($vars['signPer_id']):"";
	
	
	// --- Del Product which is selected
	if ($vars['dlStr']){
		$obj->removeInList($vars['dlStr']);
	}
	
	// --- Check and uncheck
	if ($vars['checkUncheck']==1){
		$obj->checkUncheck($vars['checkUncheckID'],$vars['checkUncheck'],$vars['setfield']);
	}
	if ($vars['checkUncheck']==2){
		$obj->checkUncheck($vars['checkUncheckID'],$vars['checkUncheck'],$vars['setfield']);
	}
	
	// --- Condition
	$where = " 1 = 1";
	
	// --- Get data to view in homepage
	if($vars['docCat_id']) $where .= " AND docCat_id LIKE '%".$vars['docCat_id']."%'";
	if($vars['doc_code']) 	$where .= " AND doc_code LIKE '%".$vars['doc_code']."%'";
	if($vars['doc_signed'])$where .= " AND doc_signed LIKE '".date('Y-m-d',strtotime($vars['doc_signed']))."%'";
	if($vars['doc_desc']) 	$where .= " AND doc_desc LIKE '%".$vars['doc_desc']."%'";
	if($vars['signPer_id'])$where .= " AND signPer_id LIKE '%".$vars['signPer_id']."%'";
	
	$limit = " LIMIT ".(string)$cur_pos.", ".(int)$vars['numresult'];
	
	$where.=" and receive_per = ".$_SESSION['user_id']." or (R_department_id = ".$_SESSION['access_unit_id']." AND receive_per = 0) or receive_id in(select receive_id from tbl_recusers where user_id = ".$_SESSION['user_id'].")";
	
	if($order_id == 0):
	$where.="";
	elseif($order_id == 1):
	$where.=" and (read_status != 1 or receive_id in(select receive_id from tbl_recusers where read_status != 1))";
	else:
	$where.=" and (read_status = 1 or receive_id in(select receive_id from tbl_recusers where read_status = 1))";
	endif;
	
	$wherelist = $where ." GROUP BY doc_id";
	
	$obj = new docreceive_class();
	$obj_list = $obj->getDBList(" $wherelist", "doc_id DESC", FALSE, $limit);
	$total_num_result = $obj->getCountDistinct("$where");
	$num_page = ceil($total_num_result/$vars['numresult']);
	
	// --- get importants
	$obj_important = new important_class();
	$where_important = "1=1 and important_active=1";
	$obj_list_important = $obj_important->getDBList(" $where_important", "important_id DESC", FALSE, "");
	
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
	
	$assign_list['obj_list'] 				= $obj_list;
	$assign_list['obj_list_important'] 	= $obj_list_important;
	
	$assign_list['docCat_id'] 		= $vars['docCat_id'];
	$assign_list['docField_id'] 	= $vars['docField_id'];
	$assign_list['docLevel_id'] 	= $vars['docLevel_id'];
	
	$assign_list['pager_str'] 	= $pager_str;
	$assign_list["parentArr"] 	= $parentArr; 
	$assign_list['nrs_arr'] 	= $nrs_arr;
	$assign_list['total_num_result'] = $total_num_result;
	$assign_list['num_page'] 	= $num_page;
	$assign_list['order_arr'] 	= $order_arr;
	$assign_list['order_id'] 	= $order_id;
	$assign_list['processurl'] = $processurl;
	$assign_list['vars'] 		= $vars;
	
	$display = dirname(__FILE__)."/skin/B_DocReceive_tbl.tpl";
	$assign_list['display'] = $display;
	
	$smarty->assign($assign_list);
	
	// --- Display template
	if (isset($vars['activeAjax']))
	$smarty->display(dirname(__FILE__)."/skin/B_DocReceive_tbl.tpl");
	else
	$smarty->display(dirname(__FILE__)."/skin/B_Doc_list.tpl");
?>