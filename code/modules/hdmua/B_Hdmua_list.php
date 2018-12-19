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
    include ($CLASSES_PATH.'/hopdong/clsHdmua.php');
    include ($CLASSES_PATH.'/hopdong/clsDoitac.php');
    include ($CLASSES_PATH.'/hopdong/clsDvtiente.php');
    include ($CLASSES_PATH.'/clsDepartments.php');
    include ($CLASSES_PATH.'/clsUsers.php');
	// --- Class is used in this page
	$obj = new hdmua_class();
	
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
	$processurl .= trim($vars['hdmua_code_fs'])?"&hdmua_code=".trim($vars['hdmua_code_fs']):"";
	$processurl .= trim($vars['hdmua_desc_fs'])?"&hdmua_desc=".trim($vars['hdmua_desc_fs']):"";
	$processurl .= $vars['hdmua_num_fs']?"&hdmua_num=".$vars['hdmua_num_fs']:"";
	
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
		$obj->sortItem($vars['val'],$vars['hdmua_id']);
	}
	
	// --- Add - Edit
	if($vars['add_edit']==1):
	 if (!isset($vars['hdmua_id']) || $vars['hdmua_id'] < 1) {
		$obj = new hdmua_class();
		$obj->readForm();
		if ((is_null($error)) || ($error == "")) {
			$obj->hdmua_date = date("Y-m-d");
			$obj->hdmua_signed = date('Y-m-d',strtotime(str_replace('/','-',$vars['hdmua_signed'])));
			$obj->hdmua_recevied = date('Y-m-d',strtotime(str_replace('/','-',$vars['hdmua_recevied'])));
			$obj->hdmua_limit_time = date('Y-m-d',strtotime(str_replace('/','-',$vars['hdmua_limit_time'])));
			$obj->hdmua_moved = date('Y-m-d',strtotime(str_replace('/','-',$vars['hdmua_moved'])));
			$obj->input_per = $_SESSION['user_id'];
			
			// ---- kiem tra so den van ban
			$count_num = $obj->getSameNum($vars['hdmua_num'],$vars['docLevel_id']);
			if($count_num > 0):
				// ---- neu da ton tai: lay so cuoi cong 1
				$hdmua_num = $obj->getLastNum($vars['docLevel_id']);
				$obj->hdmua_num = $hdmua_num + 1;
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
				$obj->hdmua_traned = 1;
				unset($obj_user);
			endif;
			
			// ---- kiem tra van ban ton tai
			$obj_docCoincidence = new hdmua_class();
			$isTheSame = $obj_docCoincidence->checkCoincidence($vars['hdmua_code'],date('Y-m-d',strtotime(str_replace('/','-',$vars['hdmua_signed']))),$vars['unit_name'],$vars['docCat_id']);
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
		$obj = new hdmua_class();
		$obj->readForm();
		if ((is_null($error)) || ($error == "")) {
			if ($obj->is_already_used($obj->tablename, "hdmua_id", $obj->hdmua_id))
			{
				$obj->hdmua_signed = date('Y-m-d',strtotime(str_replace('/','-',$vars['hdmua_signed'])));
				$obj->hdmua_recevied = date('Y-m-d',strtotime(str_replace('/','-',$vars['hdmua_recevied'])));
				$obj->hdmua_limit_time = date('Y-m-d',strtotime(str_replace('/','-',$vars['hdmua_limit_time'])));
				$obj->hdmua_moved = date('Y-m-d',strtotime(str_replace('/','-',$vars['hdmua_moved'])));
				$obj->input_per = $_SESSION['user_id'];
				
				// ---- kiem tra so den van ban
				$count_num = $obj->getSameNum($vars['hdmua_num'],$vars['docLevel_id'],$obj->hdmua_id);
				if($count_num > 0):
					// ---- neu da ton tai: lay so cuoi cong 1
					$hdmua_num = $obj->getLastNum($vars['docLevel_id']);
					$obj->hdmua_num = $hdmua_num + 1;
				endif;
				
				// ---- kiem tra van ban ton tai ngoai van ban hien tai
				$obj_docCoincidence = new hdmua_class();
				$isTheSame = $obj_docCoincidence->checkCoincidence($vars['hdmua_code'],date('Y-m-d',strtotime(str_replace('/','-',$vars['hdmua_signed']))),$vars['unit_name'],$vars['docCat_id'],$obj->hdmua_id);
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

	// --- Get record for edit
	if($vars['edit_me']==1):
	 $obj = new hdmua_class();
	 $obj->getDBbyPkey($vars['hdmua_id']);
	 if (!$obj->hdmua_id) redirect("?listDoc".$arg['arg']);
	 $obj_info = (array)$obj;
	 $hdmua_num = $obj->hdmua_num;
	endif;
	
	// --- Condition
	$where = " 1 = 1";
	
	// --- Get data to view in homepage 
	if ($vars['search_me']==1):
		if ($vars['docCat_id_fs']) 	$where .= " AND docCat_id LIKE '%".$vars['docCat_id_fs']."%'";
		if ($vars['unit_name_fs']) 	$where .= " AND unit_name ='".$vars['unit_name_fs']."'";
		if ($vars['hdmua_code_fs']) 	$where .= " AND hdmua_code regexp binary '".$vars['hdmua_code_fs']."'";
		if ($vars['hdmua_desc_fs']) 	$where .= " AND hdmua_desc regexp binary '".$vars['hdmua_desc_fs']."'";
		if ($vars['hdmua_num_fs']) 	$where .= " AND hdmua_num ='".$vars['hdmua_num_fs']."'";
	endif;
	
	$limit = " LIMIT ".(string)$cur_pos.", ".(int)$vars['numresult'];
	
	if($order_id == 0):
		$where.=" and hdmua_active=2 and hdmua_traned=2 and hdmua_replied=2"; // chua giai quyet, phan loai, y kien
	elseif($order_id == 1):
		$where.=" and hdmua_active=2 and hdmua_traned=1 and hdmua_replied=2"; // chua giai quyet, y kien, da phan loai
	elseif($order_id == 2):
		$where.=" and hdmua_active=2 and hdmua_traned=1 and hdmua_replied=1"; // chua giai quyet, da phan loai, da y kien
	else:
		$where.=" and hdmua_active=1";
	endif;
	
	$obj = new hdmua_class();
	$obj_list = $obj->getDBList(" $where", "hdmua_id DESC", FALSE, $limit);
	$total_num_result = $obj->getRowNumber("$where");
	$num_page = ceil($total_num_result/$vars['numresult']);

    // --- Get doitac list
    $obj_doitac = new doitac_class();
    $where_doitac 		= " 1 = 1 and doitac_active=1";
    $obj_list_doitac 	= $obj_doitac->getDBList(" $where_doitac", "doitac_name", FALSE, "");

    // --- Get dvtiente list
    $obj_dvtiente = new dvtiente_class();
    $where_dvtiente 		= " 1 = 1 and dvtiente_active=1";
    $obj_list_dvtiente 	= $obj_dvtiente->getDBList(" $where_dvtiente", "dvtiente_name", FALSE, "");

    // --- Get department list
    $obj_department = new department_class();
    $where_department 		= " 1 = 1 and department_active=1";
    $obj_list_department 	= $obj_department->getDBList(" $where_department", "department_name", FALSE, "");
		
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
    $assign_list['obj_list_doitac'] 	= $obj_list_doitac;
    $assign_list['obj_list_dvtiente'] 	= $obj_list_dvtiente;
    $assign_list['obj_list_department'] = $obj_list_department;
	
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