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
	include($CLASSES_PATH.'clsDocDT.php');
	include($CLASSES_PATH.'clsDocCats.php');
	// --- Class is used in this page
	$obj = new docDT_class();
	
	// --- Variables is used in this page
	$order_arr = array(0 => "Văn bản mới nhập", 1 => "Đã phát hành");
	$nrs_arr = array(5,10, 20, 30, 40, 50, 100, 150, 200);
	$vars = array_merge($_POST, $_GET);
	
	if(!$vars['mod']) $vars['mod'] = 'docs';
	
	if (!(int)$vars['curpage']){
	$vars['curpage'] = 1;
	}else{
	$vars['arg'] = "&curpage=".$vars['curpage']."&numresult=".$vars['numresult'];
	} 
	$vars['numresult'] = (int)$vars['numresult']?(int)$vars['numresult']:100;
	$cur_pos = ($vars['curpage'] - 1) * $vars['numresult'];
	$order_id = (int)$vars['order'];
	
	if($_SESSION["user_level"]==5) $vars['user_id'] = $_SESSION["user_id"];
	if($_SESSION["user_level"]==3 ||$_SESSION["user_level"]==6 ||$_SESSION["user_level"]==7) $vars['department_id'] = $_SESSION['access_department_id'];
	
	$processurl = "?listDocDT&mod=docs";
	$processurl .= $vars['deparment_id']?"&deparment_id=".$vars['deparment_id']:"";
	$processurl .= trim($vars['docDT_desc'])?"&docDT_desc=".trim($vars['docDT_desc']):"";
	$processurl .= $vars['docDT_num']?"&docDT_num=".$vars['docDT_num']:"";
	$processurl .= $vars['input_per']?"&input_per=".$vars['input_per']:"";
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
	if($vars['sort_me']==1){
		$obj->sortItem($vars['val'],$vars['docDT_id']);
	}
	
	// --- Add - Edit
	if($vars['add_edit']==1):
	 if (!isset($vars['docDT_id']) || $vars['docDT_id'] < 1) {
		$obj = new docDT_class();
		$obj->readForm();
		if ((is_null($error)) || ($error == "")) {
			$obj->input_per = $_SESSION['user_id'];
			$obj->docDT_date 	= date('Y-m-d',strtotime(str_replace('/','-',$vars['docDT_date'])));
			
			// --- lay docCat_typical de xac dinh he thong so
			$obj_docCat = new docCat_class();
			$docCat_typical = $obj_docCat->getTypical($vars['docCat_id']);
			
			$docDT_num = $vars['docDT_num']; 
			if($docCat_typical==1):
			$obj->docDT_num_typical = $docDT_num;
			$obj->docDT_num = 0;
			else:
			$obj->docDT_num = $docDT_num;
			$obj->docDT_num_typical = 0;
			endif;
			$obj->insertnew();
			
			$lastNum = $obj->getLastNumbyInputPer($_SESSION['user_id'],$docCat_typical);
			$complete = "Đã thêm mới văn bản có số đi: ".$lastNum;
			unset($obj);
		}
	 }else{
		$obj = new docDT_class();
		$obj->readForm();
		if ((is_null($error)) || ($error == "")) {
			if ($obj->is_already_used($obj->tablename, "docDT_id", $obj->docDT_id))
			{
				$obj->input_per = $_SESSION['user_id'];
				$obj->docDT_date 	= date('Y-m-d',strtotime(str_replace('/','-',$vars['docDT_date'])));
				
				// --- lay docCat_typical de xac dinh he thong so
				$obj_docCat = new docCat_class();
				$docCat_typical = $obj_docCat->getTypical($vars['docCat_id']);
				
				$docDT_num = $vars['docDT_num']; 
				if($docCat_typical==1):
				$obj->docDT_num_typical = $docDT_num;
				$obj->docDT_num = 0;
				else:
				$obj->docDT_num = $docDT_num;
				$obj->docDT_num_typical = 0;
				endif;
				$obj->update();
				$complete = "Đã cập nhật thành công!";
				unset($obj);
			}
		}
	 }
	endif;
		
	// --- Get record for edit
	if($vars['edit_me']==1):
	 $obj = new docDT_class();
	 $obj->getDBbyPkey($vars['docDT_id']);
	 if (!$obj->docDT_id) redirect("?listDocDT".$arg['arg']);
	 $obj_info = (array)$obj;
	 $docDT_num = $obj->docDT_num;
	endif;
	
	// --- Condition
	$where = " 1 = 1";
	
	if ($vars['search_me']==1):
		// --- Get data to view in homepage
		if ($vars['docCat_id_fs']) 		$where .= " AND docCat_id = ".$vars['docCat_id_fs']."";
		if ($vars['department_id_fs']) 	$where .= " AND department_id = '".$vars['department_id_fs']."'";
		if ($vars['docDT_code_fs']) 	$where .= " AND docDT_code regexp binary '".$vars['docDT_code_fs']."'";
		if ($vars['docDT_signed_fs'])	$where .= " AND docDT_signed = '".date('Y-m-d',strtotime($vars['docDT_signed_fs']))."'";
		if ($vars['docDT_desc_fs']) 	$where .= " AND docDT_desc regexp binary '".$vars['docDT_desc_fs']."'";
		if ($vars['docDT_num_fs']) 	$where .= " AND (docDT_num = '".$vars['docDT_num_fs']."' or docDT_num_typical ='".$vars['docDT_num_fs']."')";
		if ($vars['user_id_fs']) 		$where .= " AND docDT_signed ='".$vars['user_id_fs']."'";
	endif;
	
	if( in_array($_SESSION["user_level"],array(6,7,8,10)) ):
		$where .= " AND department_id = ".$_SESSION['access_unit_id'];
	endif;
	
	$limit = " LIMIT ".(string)$cur_pos.", ".(int)$vars['numresult'];
	
	$obj = new docDT_class();
	$obj_list = $obj->getDBList(" $where", "docDT_id DESC", FALSE, $limit);
	$total_num_result = $obj->getRowNumber("$where");
	$num_page = ceil($total_num_result/$vars['numresult']);
	
	// --- Get doc categories list
	$obj_dcat = new docCat_class();
	$where_dcat 		= " 1 = 1 and docCat_active=1 and docCat_out=1";
	$obj_list_dcat 	= $obj_dcat->getDBList(" $where_dcat", "docCat_name", FALSE, "");
	
	// --- Get doc department list
	$obj_department = new department_class();
	$where_department 		= " 1 = 1 and department_active=1 and (department_type=1 or department_type=3)";
	$obj_list_department	= $obj_department->getDBList(" $where_department", "department_name", FALSE, "");

	// --- Get user level 2,3 list
	$obj_user 		= new users_class();
	$where_user 		= " 1 = 1 and user_active=1 and user_level=3";
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
	$assign_list['obj_list_dcat'] 	= $obj_list_dcat;
	$assign_list['obj_list_department'] = $obj_list_department;
	$assign_list['obj_list_user'] 		= $obj_list_user;

	$assign_list['docCat_id'] 		= $vars['docCat_id'];

	$assign_list['pager_str'] 	= $pager_str;
	$assign_list["parentArr"] 	= $parentArr; 
	$assign_list['nrs_arr'] 	= $nrs_arr;
	$assign_list['total_num_result'] = $total_num_result;
	$assign_list['num_page'] 	= $num_page;
	$assign_list['order_arr'] 	= $order_arr;
	$assign_list['processurl'] 	= $processurl;
	$assign_list['vars'] 		= $vars;
	$assign_list['obj_info'] 	= $obj_info;
	$assign_list['error'] 		= $error;
	$assign_list['lastNum'] 	= $lastNum;
	$assign_list['complete'] 	= $complete;
	
	
	$display = dirname(__FILE__)."/skin/B_DocDT_tbl.tpl";
	$assign_list['display'] = $display;
	
	$smarty->assign($assign_list);
	
	// --- Display template
	if (isset($vars['activeAjax']))
	$smarty->display(dirname(__FILE__)."/skin/B_DocDT_tbl.tpl");
	else
	$smarty->display(dirname(__FILE__)."/skin/B_Doc_list.tpl");
?>