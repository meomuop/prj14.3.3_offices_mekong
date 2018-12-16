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
	include ($CLASSES_PATH.'clsCVFiles.php');
	include ($CLASSES_PATH.'clsCvCats.php');

	// --- Class is used in this page
	$obj = new cv_file_class();
	
	// --- Variables is used in this page
	$order_arr = array(0 => "Thứ tự cập nhật", 1 => "Theo tên tệp tin", 2 => "Theo thự tự");
	$nrs_arr = array(5,10, 20, 30, 40, 50, 100);
	$vars = array_merge($_POST, $_GET);
	
	if (!(int)$vars['curpage']){
		$vars['curpage'] = 1;
	}else{
		$vars['arg'] = "&curpage=".$vars['curpage']."&numresult=".$vars['numresult'];
	} 
	$vars['numresult'] = (int)$vars['numresult']?(int)$vars['numresult']:5;
	$cur_pos = ($vars['curpage'] - 1) * $vars['numresult'];
	$order_id = (int)$vars['order'];
	
	$processurl = "?listCVFile&mod=congviec";
	$processurl .= $vars['cv_cat_id']?"&cv_cat_id=".$vars['cv_cat_id']:"";
	
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
	
	// --- Add - Edit
	if($vars['add_edit']==1):
	 if (!isset($vars['cv_file_id']) || $vars['cv_file_id'] < 1) {
		$obj = new cv_file_class();
		$obj->readForm();
		if ((is_null($error)) || ($error == "")) {
			$obj->cv_file_date = date("Y-m-d");
			$obj->user_id = $_SESSION["user_id"];
			$obj->insertnew();
			unset($obj);
		}
	 }else{
		$obj = new cv_file_class();
		$obj->readForm();
		if ((is_null($error)) || ($error == "")) {
			if ($obj->is_already_used($obj->tablename, "cv_file_id", $obj->cv_file_id))
			{
				$obj->cv_file_date = date('Y-m-d');
				$obj->user_id = $_SESSION["user_id"];
				$obj->update();
				$complete = "Đã cập nhật thành công!";
				unset($obj);
			}
		}
	 }
	endif;

	// --- Get record for edit
	if($vars['edit_me']==1):
	 $obj = new cv_file_class();
	 $obj->getDBbyPkey($vars['cv_file_id']);
	 //if (!$obj->cv_file_id) redirect("?CVFile".$arg['arg']);
	 $obj_info = (array)$obj;
	endif;
	
	// --- Condition : The row 71 got trouble in uesed --> can't findout the reason
	if($order_id == 2):
		$order_str = "cv_file_sort ASC";
	elseif($order_id == 1):
		$order_str = "cv_file_name ASC";
	else:
		$order_str = "cv_file_id DESC";
	endif;
	
	//$order_str = ($order_id == 1)?"cv_file_name":"cv_file_id DESC";
	
	// --- Condition
	$where = " 1 = 1";
	
	// --- Get data to view in homepage
	if ($vars['cv_cat_id']) $where .= " AND cv_cat_id =".$vars['cv_cat_id'];
	
	$limit = " LIMIT ".(string)$cur_pos.", ".(int)$vars['numresult'];
	
	$obj = new cv_file_class();
	$obj_list = $obj->getDBList(" $where", "cv_file_id DESC", FALSE, $limit);
	$total_num_result = $obj->getRowNumber("$where");
	$num_page = ceil($total_num_result/$vars['numresult']);

	// --- Get cat info
	$obj_cvcat = new cv_cat_class();
	$obj_cvcat->getDBbyPkey($vars['cv_cat_id']);
    $obj_cvcat_info = (array)$obj_cvcat;
	
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
	$vars['arg'] .= $vars['cv_cat_id']?("&cv_cat_id=".$vars['cv_cat_id']):"";
		
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
	
	$assign_list['obj_list'] 	= $obj_list;
	$assign_list['obj_list_dl'] = $obj_list_dl;
	$assign_list['cv_cat_id'] 		= $vars['cv_cat_id'];
	
	$assign_list['pager_str'] 	= $pager_str;
	$assign_list["parentArr"] 	= $parentArr; 
	$assign_list['nrs_arr'] 	= $nrs_arr;
	$assign_list['total_num_result'] = $total_num_result;
	$assign_list['num_page'] 	= $num_page;
	$assign_list['order_arr'] 	= $order_arr;
	$assign_list['processurl'] 	= $processurl;
	$assign_list['vars'] 		= $vars;
	$assign_list['obj_info'] 	= $obj_info;
    $assign_list['obj_cvcat_info'] 	= $obj_cvcat_info;

	$display = dirname(__FILE__)."/skin/B_CVFile_tbl.tpl";
	$assign_list['display'] = $display;
	
	$smarty->assign($assign_list);
	
	// --- Display template
	if (isset($vars['activeAjax']))
		$smarty->display(dirname(__FILE__)."/skin/B_CVFile_tbl.tpl");
	else
		$smarty->display(dirname(__FILE__)."/skin/B_Congviec_list.tpl");
?>