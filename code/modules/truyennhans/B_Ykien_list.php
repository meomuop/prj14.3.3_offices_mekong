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
	require_once($CLASSES_TNVB."clsFeedbacks.php"); 
	require_once($CLASSES_TNVB."clsDocTransports.php"); 
	require_once($CLASSES_TNVB.'clsDocCats.php');
	require_once($CLASSES_TNVB.'clsDocFields.php');
	
	// --- Class is used in this page
	$obj = new feedback_class();
	
	// --- Variables is used in this page
	$order_arr = array(0 => "Văn bản mới nhập", 1 => "Đã giải quyết");
	$nrs_arr = array(5,10, 20, 30, 40, 50, 100, 150, 200);
	$vars = array_merge($_POST, $_GET);
	
	if(!$vars['mod']) $vars['mod'] = 'docs';
	
	//----------------------danh sach
	
	if (!(int)$vars['curpage']){
		$vars['curpage'] = 1;
	}else{
		$vars['arg'] = "&curpage=".$vars['curpage']."&numresult=".$vars['numresult'];
	}
	 
	$vars['numresult'] = (int)$vars['numresult']?(int)$vars['numresult']:100;
	$cur_pos = ($vars['curpage'] - 1) * $vars['numresult'];
	$order_id = (int)$vars['order'];
	
	$processurl = "?listTNVBYkien&mod=truyennhans";
	$processurl .= $vars['docCat_id_fs']?"&docCat_id=".$vars['docCat_id_fs']:"";
	$processurl .= trim($vars['unit_name_fs'])?"&unit_name=".trim($vars['unit_name_fs']):"";
	$processurl .= trim($vars['doc_code_fs'])?"&doc_code=".trim($vars['doc_code_fs']):"";
	$processurl .= trim($vars['doc_desc_fs'])?"&doc_desc=".trim($vars['doc_desc_fs']):"";
	$processurl .= $vars['doc_num_fs']?"&doc_num=".$vars['doc_num_fs']:"";
	
	// --- Del Product which is selected
	if ($vars['dlStr']){
		$obj->removeInList($vars['dlStr']);
	}
	
	// --- Add - Edit
	if($vars['add_edit']==1):
		if (!isset($vars['feedback_id']) || $vars['feedback_id'] < 1) {
			$obj = new feedback_class();
			$obj->readForm();
			if ((is_null($error)) || ($error == "")) {	
				$obj->feedback_date = date("Y-m-d h:m:i");
				$obj->user_id = $_SESSION['user_id'];
										
				$obj->insertnew();
				$complete = "Đã thêm mới ý kiến thành công!";
				unset($obj);
			}
		}else{
			$obj = new feedback_class();
			$obj->readForm();
			if ((is_null($error)) || ($error == "")) {	
				$obj->feedback_date = date("Y-m-d h:m:i");
				$obj->user_id = $_SESSION['user_id'];
				$obj->update();
				$complete = "Đã cập nhật thành công!";
				unset($obj);
			}
		}
	endif;
		
	
	// --- Condition
	$where = " 1 = 1 and doc_id = ".$vars['doc_id'];
	
	// --- Get data to view in homepage
	if ($vars['search_me']==1):
		if ($vars['docCat_id_fs']) 	$where .= " AND docCat_id LIKE '%".$vars['docCat_id_fs']."%'";
		if ($vars['unit_name_fs']) 	$where .= " AND unit_name ='".$vars['unit_name_fs']."'";
		if ($vars['doc_code_fs']) 	$where .= " AND doc_code regexp binary '".$vars['doc_code_fs']."'";
		if ($vars['doc_desc_fs']) 	$where .= " AND doc_desc regexp binary '".$vars['doc_desc_fs']."'";
		if ($vars['doc_num_fs']) 	$where .= " AND doc_num ='".$vars['doc_num_fs']."'";
	endif;
	
	//$where .= " AND user_id =".$_SESSION['user_id'];
	
	$limit = " LIMIT ".(string)$cur_pos.", ".(int)$vars['numresult'];
	
	$obj = new feedback_class();
	$obj_list = $obj->getDBList(" $where", "feedback_id DESC", FALSE, $limit);
	$total_num_result = $obj->getRowNumber("$where_list");
	$num_page = ceil($total_num_result/$vars['numresult']);
	
	//-----------------------------------can cho them moi
	
	// --- Get user list
	$obj_user 		= new users_class();
	$where_user 		= " 1 = 1 and user_active=1";
	$obj_list_user	= $obj_user->getDBList(" $where_user", "user_name", FALSE, "");
	
	$obj_doc = new doc_trans_class();
	$obj_doc->getDBbyPkey($vars['doc_id']);
	$doc_info = (array)$obj_doc;
	
	if($vars['feedback_id']!=''):
	$obj_feedback = new feedback_class();
	$obj_feedback->getDBbyPkey($vars['feedback_id']);
	$feedback_info = (array)$obj_feedback;
	endif;
	
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
	
	$assign_list['obj_list_user'] = $obj_list_user;
	$assign_list['doc_id'] = $vars['doc_id'];
	$assign_list['feedback_id'] = $vars['feedback_id'];
	$assign_list['doc_info'] = $doc_info;
	$assign_list['feedback_info'] = $feedback_info;
	
	$assign_list['obj_list'] 	= $obj_list;
	$assign_list['docCat_id'] 	= $vars['docCat_id'];
	$assign_list['docField_id'] 	= $vars['docField_id'];
	
	$assign_list['pager_str'] 	= $pager_str;
	$assign_list["parentArr"] 	= $parentArr;
	$assign_list['nrs_arr'] 	= $nrs_arr;
	$assign_list['total_num_result'] = $total_num_result;
	$assign_list['num_page'] 	= $num_page;
	$assign_list['order_arr'] 	= $order_arr;
	$assign_list['processurl'] 	= $processurl;
	$assign_list['vars'] 		= $vars;
	$assign_list['obj_info'] 	= $obj_info;
	$assign_list['complete'] 	= $complete;
	
	$display = dirname(__FILE__)."/skin/B_Ykien_tbl.tpl";
	$assign_list['display'] = $display;
	
	$smarty->assign($assign_list);
	
	// --- Display template
	if (isset($vars['activeAjax']))
	$smarty->display(dirname(__FILE__)."/skin/B_Ykien_tbl.tpl");
	else
	$smarty->display(dirname(__FILE__)."/skin/B_Doc_list.tpl");
?>