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
 //include ($CLASSES_PATH."clsUnits.php");
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
 
 $processurl = "?searchDoc&mod=docs";
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
 $order_str = "doc_id DESC";
 endif;
 
 //$order_str = ($order_id == 1)?"doc_name":"doc_id DESC";
 
 // --- Condition
 $where = " 1 = 1";
 
 // --- Get data to view in homepage
 if ($vars['docCat_id']) 		$where .= " AND docCat_id LIKE '%".$vars['docCat_id']."%'";
 if ($vars['unit_name']) 		$where .= " AND unit_name ='".$vars['unit_name']."'";
 if ($vars['doc_code']) 		$where .= " AND doc_code ='".$vars['doc_code']."'";
 if ($vars['doc_signed'])		$where .= " AND doc_signed LIKE '".date('Y-m-d',strtotime($vars['doc_signed']))."%'";
 if ($vars['doc_desc']) 		$where .= " AND doc_desc LIKE '%".$vars['doc_desc']."%'";
 if ($vars['signPer_id']) 	$where .= " AND signPer_id LIKE '%".$vars['signPer_id']."%'";
 if ($vars['signObj_id']) 	$where .= " AND signObj_id LIKE '%".$vars['signObj_id']."%'";
  
 $limit = " LIMIT ".(string)$cur_pos.", ".(int)$vars['numresult'];
 
 $obj = new doc_class();
 $where_list = $where." and doc_active = 2";
 $obj_list = $obj->getDBList(" $where_list", $order_str, FALSE, $limit);
 $total_num_result = $obj->getRowNumber("$where_list");
 $num_page = ceil($total_num_result/$vars['numresult']);
 
 // --- van ban da giai quyet
 $obj_done = new doc_class();
 $where_done = $where." and doc_active = 1";
 $obj_list_done = $obj_done->getDBList(" $where_done", $order_str, FALSE, $limit);
 $total_num_result_done = $obj_done->getRowNumber("$where_done");
 $num_page_done = ceil($total_num_result_done/$vars['numresult']);
 
 // --- Get doc categories list
 $obj_dcat = new docCat_class();
 $where_dcat 		= " 1 = 1 and docCat_active=1";
 $obj_list_dcat 	= $obj_dcat->getDBList(" $where_dcat", "docCat_name", FALSE, "");
  
 // --- Get unit list
 $obj_unit 		= new unit_class();
 $where_unit 		= " 1 = 1 and unit_active=1";
 $obj_list_unit	= $obj_unit->getDBList(" $where_unit", "unit_name", FALSE, "");
 
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
 
 $assign_list['obj_list'] 		= $obj_list;
 $assign_list['obj_list_done'] 	= $obj_list_done;
 
 $assign_list['obj_list_dcat'] 		= $obj_list_dcat;
 $assign_list['obj_list_unit'] 		= $obj_list_unit;
 
 $assign_list['docCat_id'] 		= $vars['docCat_id'];
 $assign_list['unit_name'] 		= $vars['unit_name'];
 
 $assign_list['pager_str'] 	= $pager_str;
 $assign_list["parentArr"] 	= $parentArr; 
 $assign_list['nrs_arr'] 	= $nrs_arr;
 $assign_list['total_num_result'] = $total_num_result;
 $assign_list['total_num_result_deact'] = $total_num_result_deact;
 $assign_list['order_arr'] 	= $order_arr;
 $assign_list['processurl'] = $processurl;
 $assign_list['vars'] 		= $vars;
 
 $display = dirname(__FILE__)."/skin/B_Doc_search_tbl.tpl";
 $assign_list['display'] = $display;
 
 $smarty->assign($assign_list);

 // --- Display template
 if (isset($vars['activeAjax']))
 	$smarty->display(dirname(__FILE__)."/skin/B_Doc_search_tbl.tpl");
 else
 	$smarty->display(dirname(__FILE__)."/skin/B_Doc_list.tpl");
?>