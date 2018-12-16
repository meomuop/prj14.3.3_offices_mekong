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
	require_once($CLASSES_PATH."clsSecrets.php");
 	require_once($CLASSES_PATH."clsImportants.php");
	// --- Class is used in this page
	$obj = new doc_class();
	
	// --- Variables is used in this page
	$order_arr = array(0 => "VB Chưa phân loại", 1 => "VB Đã phân loại", 2 => "VB Đã chỉ đạo", 3 => "VB Đã giải quyết");
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
	
	$processurl = "?listDoc&mod=docs";
	$processurl .= $vars['docCat_id_fs']?"&docCat_id=".$vars['docCat_id_fs']:"";
	$processurl .= trim($vars['unit_name_fs'])?"&unit_name=".trim($vars['unit_name_fs']):"";
	$processurl .= trim($vars['doc_code_fs'])?"&doc_code=".trim($vars['doc_code_fs']):"";
	$processurl .= trim($vars['doc_desc_fs'])?"&doc_desc=".trim($vars['doc_desc_fs']):"";
	$processurl .= $vars['doc_num_fs']?"&doc_num=".$vars['doc_num_fs']:"";
	
	// --- Del record which is selected
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
		$obj->sortItem($vars['val'],$vars['doc_id']);
	}
	
	// --- Add - Edit
	if($vars['add_edit']==1):
	 if (!isset($vars['doc_id']) || $vars['doc_id'] < 1) {
		$obj = new doc_class();
		$obj->readForm();
		if ((is_null($error)) || ($error == "")) {
			$obj->doc_date = date("Y-m-d");
			$obj->doc_signed = date('Y-m-d',strtotime(str_replace('/','-',$vars['doc_signed'])));
			$obj->doc_recevied = date('Y-m-d',strtotime(str_replace('/','-',$vars['doc_recevied'])));
			$obj->doc_limit_time = date('Y-m-d',strtotime(str_replace('/','-',$vars['doc_limit_time'])));
			$obj->doc_moved = date('Y-m-d',strtotime(str_replace('/','-',$vars['doc_moved'])));
			$obj->input_per = $_SESSION['user_id'];
			
			// ---- kiem tra so den van ban
			$count_num = $obj->getSameNum($vars['doc_num'],$vars['docLevel_id']);
			if($count_num > 0):
				// ---- neu da ton tai: lay so cuoi cong 1
				$doc_num = $obj->getLastNum($vars['docLevel_id']);
				$obj->doc_num = $doc_num + 1;
			endif;
			
			// ---- kiem tra loai van ban chuyen thang hoac phan loai
			$obj_doccat = new doccat_class();
			$docCat_type = $obj_doccat->getTypebyName($vars['docCat_id']);
			if($docCat_type==1):
				$obj_user = new users_class();
				$user_id_01 = $obj_user->getUserIDbyLevel(3);
				$user_id_02 = $obj_user->getUserIDbyLevel(4);
				
				$user_id_cvp = '';
				$user_id_gd = '';
				
				$i=1;
				while($row_01 = mysql_fetch_array($user_id_01)):
					$user_id_cvp .= $row_01['user_id'];
					if($i<mysql_num_rows($user_id_01)) $user_id_cvp .= ',';
					$i++;
				endwhile;
				unset($i);
				
				$j=1;
				while($row_02 = mysql_fetch_array($user_id_02)):
					$user_id_gd .= $row_02['user_id'];
					if($j<mysql_num_rows($user_id_02)) $user_id_gd .= ',';
					$j++;
				endwhile;
				unset($j);
				
				$obj->user_id = $user_id_cvp.','.$user_id_gd;
				$obj->doc_traned = 1;
				unset($obj_user);
			endif;
			
			// ---- kiem tra van ban ton tai
			$obj_docCoincidence = new doc_class();
			$isTheSame = $obj_docCoincidence->checkCoincidence($vars['doc_code'],date('Y-m-d',strtotime(str_replace('/','-',$vars['doc_signed']))),$vars['unit_name'],$vars['docCat_id']);
			if ($isTheSame>0) {
				$error = "Văn bản đã tồn tại";
			}else{
				$obj->insertnew();
				$lastNum = $obj->getLastNumbyInputPer($_SESSION['user_id']);
				$complete = "Đã thêm mới văn bản có số đến: ".$lastNum;
				unset($obj);
			}
		}
	 }else{
		$obj = new doc_class();
		$obj->readForm();
		if ((is_null($error)) || ($error == "")) {
			if ($obj->is_already_used($obj->tablename, "doc_id", $obj->doc_id))
			{
				$obj->doc_signed = date('Y-m-d',strtotime(str_replace('/','-',$vars['doc_signed'])));
				$obj->doc_recevied = date('Y-m-d',strtotime(str_replace('/','-',$vars['doc_recevied'])));
				$obj->doc_limit_time = date('Y-m-d',strtotime(str_replace('/','-',$vars['doc_limit_time'])));
				$obj->doc_moved = date('Y-m-d',strtotime(str_replace('/','-',$vars['doc_moved'])));
				$obj->input_per = $_SESSION['user_id'];
				
				// ---- kiem tra so den van ban
				$count_num = $obj->getSameNum($vars['doc_num'],$vars['docLevel_id'],$obj->doc_id);
				if($count_num > 0):
					// ---- neu da ton tai: lay so cuoi cong 1
					$doc_num = $obj->getLastNum($vars['docLevel_id']);
					$obj->doc_num = $doc_num + 1;
				endif;
				
				// ---- kiem tra van ban ton tai ngoai van ban hien tai
				$obj_docCoincidence = new doc_class();
				$isTheSame = $obj_docCoincidence->checkCoincidence($vars['doc_code'],date('Y-m-d',strtotime(str_replace('/','-',$vars['doc_signed']))),$vars['unit_name'],$vars['docCat_id'],$obj->doc_id);
				if ($isTheSame>0) {
					$error = "Văn bản đã tồn tại";
				}else{
					$obj->update();
					$complete = "Đã cập nhật thành công!";
					unset($obj);
				}
			}
		}
	 }
	endif;
	
	// --- get last number for add new
	$obj_doc = new doc_class();
	$doc_num = $obj_doc->getLastNum();
	$doc_num +=1;
	
	// --- Get record for edit
	if($vars['edit_me']==1):
	 $obj = new doc_class();
	 $obj->getDBbyPkey($vars['doc_id']);
	 if (!$obj->doc_id) redirect("?listDoc".$arg['arg']);
	 $obj_info = (array)$obj;
	 $doc_num = $obj->doc_num;
	endif;
	
	// --- Condition
	$where = " 1 = 1";
	
	// --- Get data to view in homepage 
	if ($vars['search_me']==1):
		if ($vars['docCat_id_fs']) 	$where .= " AND docCat_id LIKE '%".$vars['docCat_id_fs']."%'";
		if ($vars['unit_name_fs']) 	$where .= " AND unit_name ='".$vars['unit_name_fs']."'";
		if ($vars['doc_code_fs']) 	$where .= " AND doc_code regexp binary '".$vars['doc_code_fs']."'";
		if ($vars['doc_desc_fs']) 	$where .= " AND doc_desc regexp binary '".$vars['doc_desc_fs']."'";
		if ($vars['doc_num_fs']) 	$where .= " AND doc_num ='".$vars['doc_num_fs']."'";
	endif;
	
	$limit = " LIMIT ".(string)$cur_pos.", ".(int)$vars['numresult'];
	
	if($order_id == 0):
		$where.=" and doc_active=2 and doc_traned=2 and doc_replied=2"; // chua giai quyet, phan loai, y kien
	elseif($order_id == 1):
		$where.=" and doc_active=2 and doc_traned=1 and doc_replied=2"; // chua giai quyet, y kien, da phan loai
	elseif($order_id == 2):
		$where.=" and doc_active=2 and doc_traned=1 and doc_replied=1"; // chua giai quyet, da phan loai, da y kien
	else:
		$where.=" and doc_active=1";
	endif;
	
	$obj = new doc_class();
	$obj_list = $obj->getDBList(" $where", "doc_id DESC", FALSE, $limit);
	$total_num_result = $obj->getRowNumber("$where");
	$num_page = ceil($total_num_result/$vars['numresult']);
	
	// --- Get doc fields list
	$obj_dlevel = new docLevel_class();
	$where_dlevel 		= " 1 = 1 and docLevel_active=1";
	$obj_list_dlevel 	= $obj_dlevel->getDBList(" $where_dlevel", "docLevel_name", FALSE, "");
	
	// --- Get secret list
	$obj_secret 		= new secret_class();
	$where_secret 		= " 1 = 1 and secret_active=1";
	$obj_list_secret	= $obj_secret->getDBList(" $where_secret", "secret_name", FALSE, "");
	
	// --- Get important list
	$obj_important 		= new important_class();
	$where_important 		= " 1 = 1 and important_active=1";
	$obj_list_important	= $obj_important->getDBList(" $where_important", "important_name", FALSE, "");
		
	// --- Get user list
	$obj_user 		= new users_class();
	$where_user 		= " 1 = 1 and user_active=1 and user_level=2";
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
	
	// --- tao duong dan cho thao tac tren cac div khac
	$vars['arg_doc'] = "";
	$vars['arg_doc'] .= $vars['numresult']?"&numresult_doc=".$vars['numresult']:"";
	$vars['arg_doc'] .= $vars['curpage']?"&curpage_doc=".$vars['curpage']:"";
	$vars['arg_doc'] .= $vars['order']?"&order_doc=".$vars['order']:"";
	$vars['arg_doc'] .= $vars['mod']?("&mod=".$vars['mod']):"";
	
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
	$assign_list['obj_list_user'] 	= $obj_list_user;
	$assign_list['obj_list_secret'] = $obj_list_secret;
	$assign_list['obj_list_important'] = $obj_list_important;
	$assign_list['obj_list_dlevel'] = $obj_list_dlevel;
	$assign_list['doc_num'] 	= $doc_num;
	$assign_list['lastNum'] 	= $vars['lastNum'];
	
	$assign_list['docCat_id'] 		= $vars['docCat_id'];
	$assign_list['docField_id'] 	= $vars['docField_id'];
	$assign_list['docLevel_id'] 	= $vars['docLevel_id'];
	
	$assign_list['pager_str'] 	= $pager_str;
	$assign_list["parentArr"] 	= $parentArr; 
	$assign_list['nrs_arr'] 	= $nrs_arr;
	$assign_list['total_num_result'] = $total_num_result;
	$assign_list['num_page'] 	= $num_page;
	$assign_list['order_arr'] 	= $order_arr;
	$assign_list['order_id'] 	= $order_id;
	$assign_list['processurl'] 	= $processurl;
	$assign_list['vars'] 		= $vars;
	$assign_list['obj_info'] 	= $obj_info;
	$assign_list['error'] 		= $error;
	$assign_list['lastNum'] 	= $lastNum;
	$assign_list['complete'] 	= $complete;
	
	$display = dirname(__FILE__)."/skin/B_Doc_tbl.tpl";
	$assign_list['display'] = $display;
	
	$smarty->assign($assign_list);
	
	// --- Display template
	if (isset($vars['activeAjax']))
	$smarty->display(dirname(__FILE__)."/skin/B_Doc_tbl.tpl");
	else
	$smarty->display(dirname(__FILE__)."/skin/B_Doc_list.tpl");
?>