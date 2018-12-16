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
 include ($CLASSES_PATH.'clsDocLevels.php');
 // --- Class is used in this page
 $obj = new docLevel_class();
 
 // --- Variables is used in this page
 $order_arr = array(0 => "Theo thứ  tự", 1 => "Theo tên gọi", 2 => "Theo sắp xếp");
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
 
 $processurl = "?listDocLevel&mod=docs";
 $processurl .= trim($vars['keyword'])?"&keyword=".trim($vars['keyword']):"";
 
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
 if($vars['sort_me']==1){
 	$obj->sortItem($vars['val'],$vars['docLevel_id']);
 }
 
 // --- Add - Edit
 if($vars['add_edit']==1):
	 if (!isset($vars['docLevel_id']) || $vars['docLevel_id'] < 1) {
		$obj = new docLevel_class();
		$obj->readForm();
		if ((is_null($error)) || ($error == "")) {
			$obj->docLevel_date = date("Y-m-d");
			$obj->docLevel_ununicode = fnsUnUnicode($vars['docLevel_name']);
			$obj->insertnew();
			unset($obj);
		}
	 }else{
		$obj = new docLevel_class();
		$obj->readForm();
		if ((is_null($error)) || ($error == "")) {
			$obj->docLevel_date = date("Y-m-d");
			$obj->docLevel_ununicode = fnsUnUnicode($vars['docLevel_name']);
			if ($obj->is_already_used($obj->tablename, "docLevel_id", $obj->docLevel_id))
			{
				$obj->update();
				unset($obj);
			}
		}
	 }
 endif;
 
 // --- Get record for edit
 if($vars['edit_me']==1):
	 $obj = new docLevel_class();
	 $obj->getDBbyPkey($vars['docLevel_id']);
	 if (!$obj->docLevel_id) redirect("?listDocLevel".$arg['arg']);
	 $obj_info = (array)$obj;
 endif;
 
 // --- Condition : The row 71 got trouble in uesed --> can't findout the reason
 if($order_id == 2):
 $order_str = "docLevel_sort ASC";
 elseif($order_id == 1):
 $order_str = "docLevel_name ASC";
 else:
 $order_str = "docLevel_id DESC";
 endif;
 
 //$order_str = ($order_id == 1)?"docLevel_name":"docLevel_id DESC";
 
 // --- Condition
 $where = " 1 = 1";
 
 // --- Get data to view in homepage
 if (trim($vars['keyword'])) $where .= " AND docLevel_name regexp binary '".trim($vars['keyword'])."' ";

 $limit = " LIMIT ".(string)$cur_pos.", ".(int)$vars['numresult'];

 $obj = new docLevel_class();
 $obj_list = $obj->getDBList(" $where", $order_str, FALSE, $limit);
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
 
 // --- Assign data to template
 $assign_list = array();
 
 $assign_list['obj_list'] 	= $obj_list;
 $assign_list['pager_str'] 	= $pager_str;
 $assign_list["parentArr"] 	= $parentArr; 
 $assign_list['nrs_arr'] 	= $nrs_arr;
 $assign_list['total_num_result'] = $total_num_result;
 $assign_list['num_page'] 	= $num_page;
 $assign_list['order_arr'] 	= $order_arr;
 $assign_list['processurl'] = $processurl;
 $assign_list['vars'] 		= $vars;
 $assign_list['obj_info'] 	= $obj_info;
 
 $display = dirname(__FILE__)."/skin/B_DocLevel_tbl.tpl";
 $assign_list['display'] = $display;
 
 $smarty->assign($assign_list);

 // --- Display template
 if (isset($vars['activeAjax']))
 	$smarty->display(dirname(__FILE__)."/skin/B_DocLevel_tbl.tpl");
 else
 	$smarty->display(dirname(__FILE__)."/skin/B_Doc_list.tpl");
?>