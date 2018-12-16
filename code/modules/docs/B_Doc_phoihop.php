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
	$order_arr = array(0 => "Chưa giải quyết", 1 => "Đã giải quyết");
	$nrs_arr = array(5,10, 20, 30, 40, 50, 100, 150, 200);
	$vars = array_merge($_POST, $_GET);
	if(!$vars['mod']) $vars['mod'] = 'docs';
	
	if(!$vars['user_id']) $vars['user_id'] = $_SESSION['user_id'];
	
	if (!(int)$vars['curpage']){
	$vars['curpage'] = 1;
	}else{
	$vars['arg'] = "&curpage=".$vars['curpage']."&numresult=".$vars['numresult'];
	} 
	$vars['numresult'] = (int)$vars['numresult']?(int)$vars['numresult']:50;
	$cur_pos = ($vars['curpage'] - 1) * $vars['numresult'];
	$order_id = (int)$vars['order'];
	
	$processurl = "?phoihopDoc&mod=docs";
	$processurl .= $vars['docCat_id_fs']?"&docCat_id=".$vars['docCat_id_fs']:"";
	$processurl .= trim($vars['unit_name_fs'])?"&unit_name=".trim($vars['unit_name_fs']):"";
	$processurl .= trim($vars['doc_code_fs'])?"&doc_code=".trim($vars['doc_code_fs']):"";
	$processurl .= trim($vars['doc_desc_fs'])?"&doc_desc=".trim($vars['doc_desc_fs']):"";
	$processurl .= $vars['doc_num_fs']?"&doc_num=".$vars['doc_num_fs']:"";
	$processurl .= $vars['user_id']?"&user_id=".$vars['user_id']:"";
	$processurl .= $vars['department_id']?"&department_id=".$vars['department_id']:"";
	
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
	
	if($vars['department_id']!=0) $department_id = $vars['department_id'];
	else $department_id = $_SESSION['access_unit_id'];
	
	if($order_id == 0):
		if(in_array($_SESSION['user_level'],array(4,5))):
			$where .=" AND doc_replied = 1 AND coordinate_per like '%".$vars['user_id']."%' AND doc_active = 2";
			$obj = new docsdocreplys_class();
			$obj_list = $obj->getDBList(" $where", "doc_id DESC", FALSE, $limit);
			$total_num_result = $obj->getRowNumber("$where");
			$num_page = ceil($total_num_result/$vars['numresult']);
		elseif(in_array($_SESSION['user_level'],array(3,6))):
			$where .=" AND doc_replied = 1 and DR_department_id like '%".$department_id."%' and doc_active = 2 or coordinate_depart like '%".$department_id."%'";
		elseif(in_array($_SESSION['user_level'],array(7,8))):	
			$where .=" AND doc_replied = 1 and DR_user_id like '%".$_SESSION['user_id']."%' and doc_active = 2";
		endif;
	elseif($order_id == 1):
		if(in_array($_SESSION['user_level'],array(4,5))):
			$where .=" AND doc_replied = 1 AND coordinate_per like '%".$vars['user_id']."%' AND doc_active = 1";
			$obj = new docsdocreplys_class();
			$obj_list = $obj->getDBList(" $where", "doc_id DESC", FALSE, $limit);
			$total_num_result = $obj->getRowNumber("$where");
			$num_page = ceil($total_num_result/$vars['numresult']);
		elseif(in_array($_SESSION['user_level'],array(3,6))):
			$where .=" AND doc_replied = 1 and DR_department_id like '%".$department_id."%' and doc_active = 1 or coordinate_depart like '%".$department_id."%'";
		elseif(in_array($_SESSION['user_level'],array(7,8))):	
			$where .=" AND doc_replied = 1 and DR_user_id like '%".$_SESSION['user_id']."%' and doc_active = 1";
		endif;
	endif;
	
	$obj = new docsdocreplys_class();
	$obj_list = $obj->getDBListGroupby(" $where", "doc_id", "doc_id DESC", FALSE, $limit);
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
	$vars['arg'] .= $vars['user_id']?("&user_id=".$vars['user_id']):"";
	$vars['arg'] .= $vars['department_id']?("&department_id=".$vars['department_id']):"";
	
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
	$assign_list['department_id'] 	= $vars['department_id'];
	
	$assign_list['docCat_id'] 		= $vars['docCat_id'];
	$assign_list['docField_id'] 	= $vars['docField_id'];
	$assign_list['docLevel_id'] 	= $vars['docLevel_id'];
	$assign_list['user_id'] 		= $_SESSION['user_id'];
	
	$assign_list['pager_str'] 	= $pager_str;
	$assign_list["parentArr"] 	= $parentArr; 
	$assign_list['nrs_arr'] 	= $nrs_arr;
	$assign_list['total_num_result'] = $total_num_result;
	$assign_list['num_page'] 	= $num_page;
	$assign_list['order_arr'] 	= $order_arr;
	$assign_list['processurl'] 	= $processurl;
	$assign_list['vars'] 		= $vars;
	
	$display = dirname(__FILE__)."/skin/B_Doc_phoihop_tbl.tpl";
	$assign_list['display'] = $display;
	
	$smarty->assign($assign_list);
	
	// --- Display template
	if (isset($vars['activeAjax']))
	$smarty->display(dirname(__FILE__)."/skin/B_Doc_phoihop_tbl.tpl");
	else
	$smarty->display(dirname(__FILE__)."/skin/B_Doc_list.tpl");
?>