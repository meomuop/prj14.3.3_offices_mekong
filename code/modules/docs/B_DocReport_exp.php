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
	include ($CLASSES_PATH.'clsDocsDocsReport.php');
	// --- Class is used in this page
	$obj = new doc_class();
	
	// --- Variables is used in this page
	$order_arr = array(0 => "Thứ tự cập nhật", 1 => "Theo tên văn bản", 2 => "Theo thự tự");
	$nrs_arr = array(5,10, 20, 30, 40, 50, 100);
	$vars = array_merge($_POST, $_GET);
	
	if (!(int)$vars['curpage']){
	$vars['curpage'] = 1;
	}else{
	$vars['arg'] = "&curpage=".$vars['curpage']."&numresult=".$vars['numresult'];
	} 
	$vars['numresult'] = (int)$vars['numresult']?(int)$vars['numresult']:20;
	$cur_pos = ($vars['curpage'] - 1) * $vars['numresult'];
	$order_id = (int)$vars['order'];
	
	$processurl = "?reportDoc&mod=docs";
	$processurl .= trim($vars['KeyWord'])?"&KeyWord=".trim($vars['KeyWord']):"";
	$processurl .= $vars['docField_id']?"&docField_id=".$vars['docField_id']:"";
	$processurl .= $vars['docLevel_id']?"&docLevel_id=".$vars['docLevel_id']:"";
	
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
	
	// --- Items sort
	$aa=array();
	$bb=array();
	$counta=count($vars['doc_sort']); 	
	$countb=count($vars['doc_id1']);
	if ($counta>0 and $countb>0) 
	{ 
	for ($i=0;$i<$counta;$i++) 
	{ 
		$aa['maxe']=$vars['doc_sort'][$i]; 
		$bb['maxe1']=$vars['doc_id1'][$i];
		$obj->sortItem($aa['maxe'],$bb['maxe1']);
	} 
	}
	
	// --- Condition : The row 71 got trouble in uesed --> can't findout the reason
	if($order_id == 2):
	$order_str = "doc_sort ASC";
	elseif($order_id == 1):
	$order_str = "doc_code ASC";
	else:
	$order_str = "doc_id ASC";
	endif;
	
	//$order_str = ($order_id == 1)?"doc_name":"doc_id DESC";
	
	// --- Condition
	$where = " 1 = 1";
	//echo 'hehe '.$vars['department_fil'];
	// --- Get data to view in homepage
	if (trim($vars['docCat_id_fil'])) 		$where .= " AND docCat_id LIKE '%".trim($vars['docCat_id_fil'])."%'";
    if (trim($vars['docField_id_fil'])) 	$where .= " AND docField_id LIKE '%".trim($vars['docField_id_fil'])."%'";
	if (trim($vars['unit_name_fil'])) 		$where .= " AND unit_name ='".trim($vars['unit_name_fil'])."'";
	if ($vars['soden_tu']) $where .= " AND doc_num >= ".$vars['soden_tu'];
	if ($vars['soden_den']) $where .= " AND doc_num <= ".$vars['soden_den'];
	if ($vars['tungay']) $where .= " AND doc_recevied >= '".$vars['tungay']."'";
	if ($vars['denngay']) $where .= " AND doc_recevied < '".$vars['denngay']."'";

    if((int)$vars['tinhtrang_fil']==1){
        $where .= " AND doc_id in(select doc_id from tbl_docreplys where docReply_limit_time <= '".date('Y-m-d')."')";
    }elseif((int)$vars['tinhtrang_fil']==2){
        $where .= " AND doc_id in(select doc_id from tbl_docreplys where docReply_limit_time > '".date('Y-m-d')."')";
    }
		
	$limit = " LIMIT ".(string)$cur_pos.", ".(int)$vars['numresult'];                                                     
	if($_SESSION["user_level"]==1 || $_SESSION["user_level"]==2 || $_SESSION["user_level"]==9 || ($_SESSION["user_level"]==3 && $vars['data_zone']==1)):
	$where_list = $where;
	if ($vars['department_fil']!=0): 
	$where.= " AND DR_main_department=".$vars['department_fil']."";
	$obj = new docsdocreports_class();
	$obj_depart = new department_class();
	$obj_depart->getDBbyPkey($vars['department_fil']);
	else:
	$obj = new doc_class();
	endif;
	$obj_list = $obj->getDBList(" $where_list", "doc_num", FALSE, "");
	$total_num_result = $obj->getRowNumber("$where_list");
	$num_page = ceil($total_num_result/$vars['numresult']);

	elseif($_SESSION["user_level"]==4 || $_SESSION["user_level"]==5):
	$where_list = $where." AND (DR_user_id =".$_SESSION['user_id']." or recevie_per =".$_SESSION['user_id'].")";
	$obj = new docsdocreports_class();
	$obj_list = $obj->getDBList(" $where_list", "doc_num", FALSE, "");
	$total_num_result = $obj->getRowNumber("$where_list");
	$num_page = ceil($total_num_result/$vars['numresult']);
	
	elseif($_SESSION["user_level"]==6 || $_SESSION["user_level"]==7 || ($_SESSION["user_level"]==3 && $vars['data_zone']==2)):
	$where_list = $where." AND DR_main_department=".$_SESSION['access_unit_id']." or process_per IN(SELECT user_id FROM tbl_users WHERE department_id = ".$_SESSION['access_unit_id'].")";
	$obj = new docsdocreports_class();
	$obj_list = $obj->getDBList(" $where_list", "doc_num", FALSE, "");
	$total_num_result = $obj->getRowNumber("$where_list");
	$num_page = ceil($total_num_result/$vars['numresult']);
	elseif($_SESSION["user_level"]==8):
	$where_list = $where." AND process_per IN(SELECT user_id FROM tbl_users WHERE department_id = ".$_SESSION['access_unit_id'].")";
	$obj = new docsdocreports_class();
	$obj_list = $obj->getDBList(" $where_list", "doc_num", FALSE, "");
	$total_num_result = $obj->getRowNumber("$where_list");
	$num_page = ceil($total_num_result/$vars['numresult']);
	endif;

	// ------ Print paging ---------
	$pager_str = get_paging_string($processurl, $vars['curpage'], $num_page);
	
	// --- export
	if($vars['exptype']==2):
	header("Content-Type: application/vnd.ms-excel");
	header("Expires: 0");
	header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
	header("content-disposition: attachment;filename=DSVB_".date('d-m-Y').".xls");
	elseif($vars['exptype']==1):
	header("Content-Type: application/vnd.ms-word");
	header("Expires: 0");
	header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
	header("content-disposition: attachment;filename=DSVB_".date('d-m-Y').".doc");
	endif;
	// --- Debug here ----
	unset($obj);
	
	// --- Get argument of page
	$vars['arg'] = "";
	$vars['arg'] .= $vars['numresult']?"&numresult=".$vars['numresult']:"";
	$vars['arg'] .= $vars['curpage']?"&curpage=".$vars['curpage']:"";
	$vars['arg'] .= $vars['order']?"&order=".$vars['order']:"";
	$vars['arg'] .= $vars['mod']?("&mod=".$vars['mod']):"";
	$vars['arg'] .= $vars['exptype']?("&exptype=".$vars['exptype']):"";
	
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
	
	$assign_list['soden_tu'] 	= $vars['soden_tu'];
	$assign_list['soden_den'] 	= $vars['soden_den'];
	$assign_list['tungay'] 	= $vars['tungay'];
	$assign_list['denngay'] 	= $vars['denngay'];
	
	$assign_list['obj_list'] 	= $obj_list;
	$assign_list['exptype'] 	= $vars['exptype'];
	$assign_list['obj_depart'] = $obj_depart;
	
	$assign_list['docCat_id_fil'] 	= $vars['docCat_id_fil'];
	$assign_list['unit_name_fil'] 	= $vars['unit_name_fil'];
	$assign_list['department_fil'] = $vars['department_fil'];
	
	$assign_list['pager_str'] 	= $pager_str;
	$assign_list["parentArr"] 	= $parentArr; 
	$assign_list['nrs_arr'] 	= $nrs_arr;
	$assign_list['total_num_result'] = $total_num_result;
	$assign_list['total_num_result_deact'] = $total_num_result_deact;
	$assign_list['order_arr'] 	= $order_arr;
	$assign_list['processurl'] = $processurl;
	$assign_list['vars'] 		= $vars;
	
	$display = dirname(__FILE__)."/skin/B_DocReport_exp.tpl";
	$assign_list['display'] = $display;
	
	$smarty->assign($assign_list);
	// --- Display template
	if (isset($vars['activeAjax']))
	$smarty->display(dirname(__FILE__)."/skin/B_DocReport_exp.tpl");
	else
	$smarty->display(dirname(__FILE__)."/skin/B_Doc_list.tpl");
?>