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
 include ($CLASSES_PATH.'clsDocsLateReport.php');
 include ($CLASSES_PATH.'clsDocsLateCv.php');
 //include ($CLASSES_PATH.'clsDepartments.php');
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
 
 $processurl = "?lateDoc&mod=docs";
 $processurl .= $vars['docReply_limit_time']?"&docReply_limit_time=".$vars['docReply_limit_time']:"";
 $processurl .= $vars['doc_num1']?"&doc_num1=".$vars['doc_num1']:"";
 $processurl .= $vars['doc_num2']?"&doc_num2=".$vars['doc_num2']:"";
 $processurl .= $vars['doc_date1']?"&doc_date1=".$vars['doc_date1']:"";
 $processurl .= $vars['doc_date2']?"&doc_date2=".$vars['doc_date2']:"";
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
 
 //$order_str = ($order_id == 1)?"doc_name":"doc_id DESC";
 if($order_id == 2):
 $order_str = "doc_sort ASC";
 elseif($order_id == 1):
 $order_str = "doc_code ASC";
 else:
 $order_str = "doc_id DESC";
 endif;;
 // --- Condition
 $where = " 1 = 1 and doc_theodoi = 1";
 if ($vars['doc_limit_type'] == 1) $where .= " and doc_active = 2";
 if ($vars['doc_limit_type'] == 2) $where .= " and doc_active = 1";
 if ($vars['doc_limit_type'] == 3 || !$vars['doc_limit_type']) $where .= " and doc_active = 2 and docReply_limit_time < '".date('Y-m-d')."'";
 if ($vars['doc_limit_type'] == 4) $where .= " and doc_active = 1 and doc_note_date > docReply_limit_time and docReply_limit_time < '".date('Y-m-d')."'";
 // --- Get data to view in homepage
 //if ($vars['doc_active']) $where .= " AND doc_active = ".$vars['doc_active'];
 if ($vars['doc_num1']) $where .= " AND doc_num >= ".$vars['doc_num1'];
 if ($vars['doc_num2']) $where .= " AND doc_num <= ".$vars['doc_num2'];
 if ($vars['doc_date1']) $where .= " AND (doc_recevied >= '".date('Y-m-d',strtotime($vars['doc_date1']))."')";
 if ($vars['doc_date2']) $where .= " AND( doc_recevied <= '".date('Y-m-d',strtotime($vars['doc_date2']))."')";
  
 $limit = " LIMIT ".(string)$cur_pos.", ".(int)$vars['numresult'];                                                     
 
 if($_SESSION["user_level"]==2 || $_SESSION["user_level"]==9):
   $where_list = $where;
   $obj = new docslatereport_class();
   $obj_list = $obj->getDBList(" $where_list", "doc_num", FALSE, $limit);
   $total_num_result = $obj->getRowNumber("$where_list");
   $num_page = ceil($total_num_result/$vars['numresult']);
 elseif($_SESSION["user_level"]==4):
   $where_list = $where." AND (DR_user_id IN(SELECT user_id from tbl_users where user_level IN(4,5)) or recevie_per IN(SELECT user_id from tbl_users where user_level IN(4,5)))";
   $obj = new docslatereport_class();
   $obj_list = $obj->getDBList(" $where_list", "doc_num", FALSE, $limit);
   $total_num_result = $obj->getRowNumber("$where_list");
   $num_page = ceil($total_num_result/$vars['numresult']);
   
 elseif($_SESSION["user_level"]==5):
   $where_list = $where." AND (DR_user_id =".$_SESSION['user_id']." or recevie_per =".$_SESSION['user_id'].")";
   $obj = new docslatereport_class();
   $obj_list = $obj->getDBList(" $where_list", "doc_num", FALSE, $limit);
   $total_num_result = $obj->getRowNumber("$where_list");
   $num_page = ceil($total_num_result/$vars['numresult']);
 
 elseif($_SESSION["user_level"]==6 || $_SESSION["user_level"]==7 || $_SESSION["user_level"]==3):
   $where_list = $where." AND DR_main_department=".$_SESSION['access_unit_id']." or process_per IN(SELECT user_id FROM tbl_users WHERE department_id = ".$_SESSION['access_unit_id'].")";
   $obj = new docslatereport_class();
   $obj_list = $obj->getDBList(" $where_list", "doc_num", FALSE, $limit);
   $total_num_result = $obj->getRowNumber("$where_list");
   $num_page = ceil($total_num_result/$vars['numresult']);
 elseif($_SESSION["user_level"]==8):
   $where_list = $where." AND process_per = ".$_SESSION['user_id']."";
   $obj = new docslatecv_class();
   $obj_list = $obj->getDBList(" $where_list", "doc_num", FALSE, $limit);
   $total_num_result = $obj->getRowNumber("$where_list");
   $num_page = ceil($total_num_result/$vars['numresult']);
 endif;
/* // --- Get doc categories list
 $obj_dcat = new docCat_class();
 $where_dcat 		= " 1 = 1 and docCat_active=1";
 $obj_list_dcat 	= $obj_dcat->getDBList(" $where_dcat", "docCat_name", FALSE, "");
 
 // --- Get doc fields list
 $obj_dfield = new docField_class();
 $where_dfield 		= " 1 = 1 and docField_active=1";
 $obj_list_dfield 	= $obj_dfield->getDBList(" $where_dfield", "docField_name", FALSE, "");
 
 // --- Get doc levels list
 $obj_dlevel = new docLevel_class();
 $where_dlevel 		= " 1 = 1 and docLevel_active=1";
 $obj_list_dlevel 	= $obj_dlevel->getDBList(" $where_dlevel", "docLevel_name", FALSE, "");
 
 // --- Get departments list
 $obj_department = new department_class();
 $where_department 		= " 1 = 1 and department_active=1 and (department_type=1 or department_type=3)";
 $obj_list_department 	= $obj_department->getDBList(" $where_department", "department_name", FALSE, "");
*/  
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
 $vars['arg'] .= $vars['doc_limit_type']?("&doc_limit_type=".$vars['doc_limit_type']):"";
 $vars['arg'] .= $vars['doc_num1']?("&doc_num1=".$vars['doc_num1']):"";
 $vars['arg'] .= $vars['doc_num2']?("&doc_num2=".$vars['doc_num2']):"";
 $vars['arg'] .= $vars['doc_date1']?("&doc_date1=".$vars['doc_date1']):"";
 $vars['arg'] .= $vars['doc_date2']?("&doc_date2=".$vars['doc_date2']):"";
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
 $assign_list['obj_list_done'] 	= $obj_list_done;
 
/* $assign_list['obj_list_dcat'] 		= $obj_list_dcat;
 $assign_list['obj_list_dfield'] 	= $obj_list_dfield;
 $assign_list['obj_list_dlevel'] 	= $obj_list_dlevel;
 $assign_list['obj_list_department'] 	= $obj_list_department;
*/ 
 $assign_list['docCat_id'] 		= $vars['docCat_id'];
 $assign_list['docField_id'] 	= $vars['docField_id'];
 $assign_list['docLevel_id'] 	= $vars['docLevel_id'];
 $assign_list['department_id'] 	= $vars['department_id'];
 $assign_list['doc_limit_type'] 	= $vars['doc_limit_type']; 
 $assign_list['pager_str'] 	= $pager_str;
 $assign_list["parentArr"] 	= $parentArr; 
 $assign_list['nrs_arr'] 	= $nrs_arr;
 $assign_list['total_num_result'] = $total_num_result;
 $assign_list['order_arr'] 	= $order_arr;
 $assign_list['order_id'] 	= $order_id;
 $assign_list['processurl'] = $processurl;
 $assign_list['vars'] 		= $vars;
 
 $display = dirname(__FILE__)."/skin/B_Doc_late_tbl.tpl";
 $assign_list['display'] = $display;
 $smarty->assign($assign_list);

 // --- Display template
 if (isset($vars['activeAjax']))
 	$smarty->display(dirname(__FILE__)."/skin/B_Doc_late_tbl.tpl");
 else
 	$smarty->display(dirname(__FILE__)."/skin/B_Doc_report_list.tpl");
?>