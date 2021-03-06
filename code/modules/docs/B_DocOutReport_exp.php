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
 include ($CLASSES_PATH.'clsDocOuts.php');
 include ($CLASSES_PATH.'clsDocCats.php');
 include ($CLASSES_PATH.'clsDocFields.php');
 include ($CLASSES_PATH.'clsDocLevels.php');
 //include ($CLASSES_PATH.'clsDepartments.php');
 // --- Class is used in this page
 $obj = new docOut_class();
 
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
 
 if($_SESSION["user_level"]==5) $vars['user_id'] = $_SESSION["user_id"];
 if($_SESSION["user_level"]==3 ||$_SESSION["user_level"]==6 ||$_SESSION["user_level"]==7) $vars['department_id'] = $_SESSION['access_department_id'];
 
 $processurl = "?reportDocOut&mod=docs";
 $processurl .= $vars['docOut_num1']?"&docOut_num1=".$vars['docOut_num1']:"";
 $processurl .= $vars['docOut_num2']?"&docOut_num2=".$vars['docOut_num2']:"";
 $processurl .= $vars['docOut_date1']?"&docOut_date1=".$vars['docOut_date1']:"";
 $processurl .= $vars['docOut_date2']?"&docOut_date2=".$vars['docOut_date2']:"";
 $processurl .= $vars['department_id']?"&department_id=".$vars['department_id']:"";
 $processurl .= $vars['user_id']?"&user_id=".$vars['user_id']:"";
 
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
 $counta=count($vars['docOut_sort']); 	
 $countb=count($vars['docOut_id1']);
 if ($counta>0 and $countb>0) 
 { 
	for ($i=0;$i<$counta;$i++) 
	{ 
		$aa['maxe']=$vars['docOut_sort'][$i]; 
		$bb['maxe1']=$vars['docOut_id1'][$i];
		$obj->sortItem($aa['maxe'],$bb['maxe1']);
	} 
 }
 
 // --- Condition : The row 71 got trouble in uesed --> can't findout the reason
 if($order_id == 2):
 $order_str = "docOut_sort ASC";
 elseif($order_id == 1):
 $order_str = "docOut_code ASC";
 else:
 $order_str = "docOut_id DESC";
 endif;
 
 //$order_str = ($order_id == 1)?"docOut_name":"docOut_id DESC";
 
 // --- Condition
 $where = " 1 = 1";
 
 // --- Get data to view in homepage
 if($vars['docOut_typical']==1):
 	$where .= " AND (docOut_num = 0 or docOut_num is NULL)";
	if ($vars['sodi_tu']): $where .= " AND docOut_num_typical >= ".$vars['sodi_tu']; endif;
	if ($vars['sodi_den']): $where .= " AND docOut_num_typical <= ".$vars['sodi_den']; endif;
 else:
 	$where .= " AND (docOut_num_typical = 0 or docOut_num_typical is NULL)";
 	if ($vars['sodi_tu']): $where .= " AND docOut_num >= ".$vars['sodi_tu']; endif;
	if ($vars['sodi_den']): $where .= " AND docOut_num <= ".$vars['sodi_den']; endif;
 endif;
 if ($vars['tungay']) $where .= " AND docOut_date >= '".date('Y-m-d',strtotime($vars['tungay']))."'";
 if ($vars['denngay']) $where .= " AND docOut_date <= '".date('Y-m-d',strtotime($vars['denngay']))."'";
 if ($vars['department_fil']!=0) $where.= " AND department_id = ".$vars['department_fil']."";
 if ($vars['docCat_id_fil']!=0) 	$where .= " AND docCat_id = ".$vars['docCat_id_fil']."";
  
 $limit = " LIMIT ".(string)$cur_pos.", ".(int)$vars['numresult'];                                                     
	
	$obj = new docOut_class();
	$obj_list = $obj->getDBList(" $where", "docOut_num asc", FALSE, "");
	$total_num_result = $obj->getRowNumber("$where");
	$num_page = ceil($total_num_result/$vars['numresult']);
 
 if($_SESSION["user_level"]==6 || $_SESSION["user_level"]==7 || $_SESSION["user_level"]==3 || $_SESSION["user_level"]==8):
   $where.= " AND department_id=".$vars['department_id']."";
   $obj = new docOut_class();
   $obj_list = $obj->getDBList(" $where", "docOut_num asc", FALSE, "");
   $total_num_result = $obj->getRowNumber("$where");
   $num_page = ceil($total_num_result/$vars['numresult']);
 endif; 
 
 // --- Get doc categories list
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
 
 // --- Get user level 3,4,5 list
 $obj_user_bgd 		= new users_class();
 $where_user_bgd		= " 1 = 1 and user_active=1 and user_level=4 or user_level=5 or user_level=3";
 $obj_list_user_bgd	= $obj_user_bgd->getDBList(" $where_user_bgd", "user_name", FALSE, "");	
 
 // --- Get user level 2,9 list
 $obj_user_vt 		= new users_class();
 $where_user_vt		= " 1 = 1 and user_active=1 and user_level=1 or user_level=2 or user_level=9";
 $obj_list_user_vt 	= $obj_user_vt->getDBList(" $where_user_vt", "user_name", FALSE, "");	
  
 // ------ Print paging ---------
 $pager_str = get_paging_string($processurl, $vars['curpage'], $num_page);

 // --- export
 if($vars['exptype']==2):
 header("Content-Type: application/vnd.ms-excel");
 header("Expires: 0");
 header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
 header("content-disposition: attachment;filename=DSVBD_".date('d-m-Y').".xls");
 elseif($vars['exptype']==1):
 header("Content-Type: application/vnd.ms-word");
 header("Expires: 0");
 header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
 header("content-disposition: attachment;filename=DSVBD_".date('d-m-Y').".doc");
 endif;
 // --- Debug here ----
 unset($obj);
 
 // --- Get argument of page
 $vars['arg'] = "";
 $vars['arg'] .= $vars['numresult']?"&numresult=".$vars['numresult']:"";
 $vars['arg'] .= $vars['curpage']?"&curpage=".$vars['curpage']:"";
 $vars['arg'] .= $vars['order']?"&order=".$vars['order']:"";
 $vars['arg'] .= $vars['mod']?("&mod=".$vars['mod']):"";
 $vars['arg'] .= $vars['sodi_tu']?("&sodi_tu=".$vars['sodi_tu']):"";
 $vars['arg'] .= $vars['sodi_den']?("&sodi_den=".$vars['sodi_den']):"";
 $vars['arg'] .= $vars['tungay']?("&tungay=".$vars['tungay']):"";
 $vars['arg'] .= $vars['denngay']?("&denngay=".$vars['denngay']):"";
 $vars['arg'] .= $vars['department_id_fil']?("&department_id_fil=".$vars['department_id_fil']):"";
 $vars['arg'] .= $vars['docCat_id_fil']?("&docCat_id_fil=".$vars['docCat_id_fil']):"";
 $vars['arg'] .= $vars['docOut_typical']?("&docOut_typical=".$vars['docOut_typical']):"";
 
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
 
 $assign_list['obj_list_dcat'] 		= $obj_list_dcat;
 $assign_list['obj_list_dfield'] 	= $obj_list_dfield;
 $assign_list['obj_list_dlevel'] 	= $obj_list_dlevel;
 $assign_list['obj_list_department'] 	= $obj_list_department;
 $assign_list['obj_list_user_bgd'] 	= $obj_list_user_bgd;
 $assign_list['obj_list_user_vt'] 	= $obj_list_user_vt;
 
 $assign_list['docCat_id_fil'] 		= $vars['docCat_id_fil'];
 $assign_list['department_fil'] 	= $vars['department_fil'];
 $assign_list['docOut_typical'] 	= $vars['docOut_typical'];
 $assign_list['sodi_tu'] 			= $vars['sodi_tu'];
 $assign_list['sodi_den'] 			= $vars['sodi_den'];
 $assign_list['tungay'] 			= $vars['tungay'];
 $assign_list['denngay'] 			= $vars['denngay'];
 
 $assign_list['pager_str'] 	= $pager_str;
 $assign_list["parentArr"] 	= $parentArr; 
 $assign_list['nrs_arr'] 	= $nrs_arr;
 $assign_list['total_num_result'] = $total_num_result;
 $assign_list['total_num_result_deact'] = $total_num_result_deact;
 $assign_list['order_arr'] 	= $order_arr;
 $assign_list['processurl'] = $processurl;
 $assign_list['vars'] 		= $vars;
 
 $display = dirname(__FILE__)."/skin/B_DocOutReport_exp.tpl";
 $assign_list['display'] = $display;
 
 $smarty->assign($assign_list);

 // --- Display template
 if (isset($vars['activeAjax']))
 	$smarty->display(dirname(__FILE__)."/skin/B_DocOutReport_exp.tpl");
 else
 	$smarty->display(dirname(__FILE__)."/skin/B_Doc_list.tpl");
?>