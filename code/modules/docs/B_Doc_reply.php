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
	include ($CLASSES_PATH.'clsDocs.php');
	include ($CLASSES_PATH.'clsDocCats.php');
	include ($CLASSES_PATH.'clsDocFields.php');
	include ($CLASSES_PATH.'clsDocLevels.php');
	include ($CLASSES_PATH.'clsDocsDocreplys.php');
	// --- Class is used in this page
	$obj = new doc_class();
	
	// --- Variables is used in this page
	if($_SESSION['user_level']==4):
		$order_arr = array(0 => "VB mới nhận", 1 => "Nhận chuyển chỉ đạo", 2 => "Đã chuyển chỉ đạo", 3 => "Đã giải quyết", 4 => "Chờ xác nhận kết quả", 5 => "Đã xác nhận");
	elseif($_SESSION['user_level']==5):
		$order_arr = array(0 => "Nhận chuyển chỉ đạo", 1 => "Đã chuyển chỉ đạo", 2 => "Đã giải quyết");
	endif;
	$nrs_arr = array(5,10, 20, 30, 40, 50, 100, 150, 200);
	$vars = array_merge($_POST, $_GET);

    // --- Xac nhan ket qua van ban
    if ($vars['XNdoc_id']){
        $obj->updateStatus($vars['XNdoc_id'],4);
    }

	if(!$vars['mod']) $vars['mod'] = 'docs';
	
	if(!$vars['user_id']) $vars['user_id'] = $_SESSION['user_id'];
	
	if (!(int)$vars['curpage']){
		$vars['curpage'] = 1;
	}else{
		$vars['arg'] = "&curpage=".$vars['curpage']."&numresult=".$vars['numresult'];
	} 
	$vars['numresult'] = (int)$vars['numresult']?(int)$vars['numresult']:100;
	$cur_pos = ($vars['curpage'] - 1) * $vars['numresult'];
	$order_id = (int)$vars['order'];

	$processurl = "?replyDoc&mod=docs";
	$processurl .= $vars['docCat_id_fs']?"&docCat_id=".$vars['docCat_id_fs']:"";
	$processurl .= trim($vars['unit_name_fs'])?"&unit_name=".trim($vars['unit_name_fs']):"";
	$processurl .= trim($vars['doc_code_fs'])?"&doc_code=".trim($vars['doc_code_fs']):"";
	$processurl .= trim($vars['doc_desc_fs'])?"&doc_desc=".trim($vars['doc_desc_fs']):"";
	$processurl .= $vars['doc_num_fs']?"&doc_num=".$vars['doc_num_fs']:"";
	$processurl .= $vars['user_id']?"&user_id=".$vars['user_id']:"";

	// --- Condition
	$where = " 1 = 1 AND doc_traned = 1";
	
	// --- Get data to view in homepage
	if ($vars['search_me']==1):
		if ($vars['docCat_id_fs']) 	$where .= " AND docCat_id LIKE '%".$vars['docCat_id_fs']."%'";
		if ($vars['unit_name_fs']) 	$where .= " AND unit_name ='".$vars['unit_name_fs']."'";
		if ($vars['doc_code_fs']) 	$where .= " AND doc_code regexp binary '".$vars['doc_code_fs']."'";
		if ($vars['doc_desc_fs']) 	$where .= " AND doc_desc  regexp binary '".$vars['doc_desc_fs']."'";
		if ($vars['doc_num_fs']) 	$where .= " AND doc_num ='".$vars['doc_num_fs']."'";
	endif;
	
	$limit = " LIMIT ".(string)$cur_pos.", ".(int)$vars['numresult'];
	
	// --- lay danh sach van ban moi nhan
	if($_SESSION['user_level']==4):
		if($order_id == 0):
            $where .=" AND doc_replied = 2 AND doc_active = 2 AND user_id like '%".$vars['user_id']."%'";
            $obj = new doc_class();
            $obj_list = $obj->getDBList(" $where", "doc_id DESC", FALSE, $limit);
            $total_num_result = $obj->getRowNumber("$where");
            $num_page = ceil($total_num_result/$vars['numresult']);
		elseif($order_id == 1):
            $where .=" AND doc_replied= 1 AND doc_active = 2 AND recevie_per=".$vars['user_id']." AND (docReply_active = 2 or docReply_active = 0)";
            $obj = new docsdocreplys_class();
            $obj_list = $obj->getDBList(" $where", "doc_id DESC", FALSE, $limit);
            $total_num_result = $obj->getRowNumber("$where");
            $num_page = ceil($total_num_result/$vars['numresult']);
		elseif($order_id == 2):
            $where .=" AND doc_replied = 1 AND DR_user_id=".$vars['user_id']." AND doc_active = 2";
            $obj = new docsdocreplys_class();
            $obj_list = $obj->getDBList(" $where", "", FALSE, ' GROUP BY doc_code '.$limit);
            $total_num_result = $obj->getRowNumber("$where");
            $num_page = ceil($total_num_result/$vars['numresult']);
		elseif($order_id == 3):
            $where .=" AND (user_id=".$vars['user_id']." OR DR_user_id =".$vars['user_id'].") AND doc_active = 1";
            $obj = new docsdocreplys_class();
            $obj_list = $obj->getDBListGroupby(" $where", "doc_id", "doc_id DESC", FALSE, $limit);
            $total_num_result = $obj->getRowNumber("$where");
            $num_page = ceil($total_num_result/$vars['numresult']);
        elseif($order_id == 4):
            $where .=" AND (user_id=".$vars['user_id']." OR DR_user_id =".$vars['user_id'].") AND doc_active = 3";
            $obj = new docsdocreplys_class();
            $obj_list = $obj->getDBListGroupby(" $where", "doc_id", "doc_id DESC", FALSE, $limit);
            $total_num_result = $obj->getRowNumber("$where");
            $num_page = ceil($total_num_result/$vars['numresult']);
        elseif($order_id == 5):
            $where .=" AND (user_id=".$vars['user_id']." OR DR_user_id =".$vars['user_id'].") AND doc_active = 4";
            $obj = new docsdocreplys_class();
            $obj_list = $obj->getDBListGroupby(" $where", "doc_id", "doc_id DESC", FALSE, $limit);
            $total_num_result = $obj->getRowNumber("$where");
            $num_page = ceil($total_num_result/$vars['numresult']);
		endif;
	elseif($_SESSION['user_level']==5):
		if($order_id == 0):
		$where .=" AND doc_replied= 1 AND doc_active = 2 AND recevie_per=".$vars['user_id']." AND (docReply_active = 2 or docReply_active = 0)";
		$obj = new docsdocreplys_class();
		$obj_list = $obj->getDBList(" $where", "doc_id DESC", FALSE, $limit);
		$total_num_result = $obj->getRowNumber("$where");
		$num_page = ceil($total_num_result/$vars['numresult']);
		elseif($order_id == 1):
		$where .=" AND doc_replied = 1 AND DR_user_id=".$vars['user_id']." AND doc_active = 2";
		$obj = new docsdocreplys_class();
		$obj_list = $obj->getDBList(" $where", "doc_id DESC", FALSE, $limit);
		$total_num_result = $obj->getRowNumber("$where");
		$num_page = ceil($total_num_result/$vars['numresult']);
		elseif($order_id == 2):
		$where .=" AND (user_id=".$vars['user_id']." OR DR_user_id =".$vars['user_id'].") AND doc_active = 1";
		$obj = new docsdocreplys_class();
		$obj_list = $obj->getDBListGroupby(" $where", "doc_id", "doc_id DESC", FALSE, $limit);
		$total_num_result = $obj->getRowNumber("$where");
		$num_page = ceil($total_num_result/$vars['numresult']);
		endif;
	endif;
	
	// --- Get doc categories list
	$obj_dcat = new docCat_class();
	$where_dcat 		= " 1 = 1 AND docCat_active=1";
	$obj_list_dcat 	= $obj_dcat->getDBList(" $where_dcat", "docCat_name", FALSE, "");
		
	// --- Get user list
	$obj_user 		= new users_class();
	$where_user 		= " 1 = 1 AND user_active=1 AND user_level=9";
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
	$vars['arg'] .= $vars['user_id']?("&user_id=".$vars['user_id']):"";
	$vars['arg'] .= $vars['order_id']?("&order_id=".$vars['order_id']):"";
	
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
	
	$assign_list['obj_list'] 		= $obj_list;
	$assign_list['order_id'] 		= $order_id;
	$assign_list['obj_list_user'] 	= $obj_list_user;
	$assign_list['obj_list_dcat'] 	= $obj_list_dcat;
	
	$assign_list['docCat_id'] 		= $vars['docCat_id'];
	$assign_list['docField_id'] 	= $vars['docField_id'];
	$assign_list['docLevel_id'] 	= $vars['docLevel_id'];
	$assign_list['user_id'] 		= $vars['user_id'];
	
	$assign_list['pager_str'] 	= $pager_str;
	$assign_list["parentArr"] 	= $parentArr; 
	$assign_list['nrs_arr'] 	= $nrs_arr;
	$assign_list['total_num_result'] = $total_num_result;
	$assign_list['num_page'] 	= $num_page;
	$assign_list['order_arr'] 	= $order_arr;
	$assign_list['processurl'] 	= $processurl;
	$assign_list['vars'] 		= $vars;
	
	$display = dirname(__FILE__)."/skin/B_Doc_reply_tbl.tpl";
	$assign_list['display'] = $display;
	
	$smarty->assign($assign_list);
	
	// --- Display template
	if (isset($vars['activeAjax']))
	$smarty->display(dirname(__FILE__)."/skin/B_Doc_reply_tbl.tpl");
	else
	$smarty->display(dirname(__FILE__)."/skin/B_Doc_list.tpl");
?>