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
 include ($CLASSES_TNVB.'clsDocs.php');
 include ($CLASSES_TNVB.'clsReceives.php');
 //include ($CLASSES_TNVB.'clsDepartments.php');
 // --- Class is used in this page
 $obj = new department_class();
 
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
 $processurl .= $vars['doc_date1']?"&doc_date1=".$vars['doc_date1']:"";
 $processurl .= $vars['doc_date2']?"&doc_date2=".$vars['doc_date2']:"";
 
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
 $order_str = "doc_id DESC";
 endif;
 
 //$order_str = ($order_id == 1)?"doc_name":"doc_id DESC";
 
 // --- Condition
 $where = " 1 = 1 and department_active=1";
 
 // --- Get data to view in homepage
 if ($vars['doc_date1']) $where .= " AND department_name in(SELECT doc_unit FROM tbl_docs where doc_date > '".date('Y-m-d',strtotime($vars['doc_date1']))."' OR doc_date Like '".date('Y-m-d',strtotime($vars['doc_date1']))."%')";
 if ($vars['doc_date2']) $where .= " AND department_name in(SELECT doc_unit FROM tbl_docs where doc_date < '".date('Y-m-d',strtotime($vars['doc_date2']))."' OR doc_date Like '".date('Y-m-d',strtotime($vars['doc_date2']))."%')";
  
 $limit = " LIMIT ".(string)$cur_pos.", ".(int)$vars['numresult'];                                                     
 
 // --- Get departments list
 $obj = new department_class();
 $obj_list 	= $obj->getDBList(" $where", "department_name", FALSE, "");
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
 
 $assign_list['doc_date1'] 	= $vars['doc_date1'];
 $assign_list['doc_date2'] 	= $vars['doc_date2'];
 
 $assign_list['obj_list'] 	= $obj_list;
  
 $assign_list['pager_str'] 	= $pager_str;
 $assign_list["parentArr"] 	= $parentArr; 
 $assign_list['nrs_arr'] 	= $nrs_arr;
 $assign_list['total_num_result'] = $total_num_result;
 $assign_list['order_arr'] 	= $order_arr;
 $assign_list['processurl'] = $processurl;
 $assign_list['vars'] 		= $vars;
 
 $display = dirname(__FILE__)."/skin/B_Doc_report_tbl.tpl";
 $assign_list['display'] = $display;
 
 $smarty->assign($assign_list);

 // --- Display template
 if (isset($vars['activeAjax']))
 	$smarty->display(dirname(__FILE__)."/skin/B_Doc_report_tbl.tpl");
 else
 	$smarty->display(dirname(__FILE__)."/skin/B_Doc_report_list.tpl");
?>