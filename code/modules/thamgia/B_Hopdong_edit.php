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
	
	if($_SESSION["per_edit"]!=1):
	include ("admin_index.php"); 
	endif;
	
	
	// --- Class is used in this page
	require_once($CLASSES_PATH."clsHopdongs.php");
	require_once($CLASSES_PATH."clsTrangthais.php"); 
	require_once($CLASSES_PATH."clsQuytrinhs.php");
	require_once($CLASSES_PATH."clsGiaidoans.php");
	
	require_once($CLASSES_PATH."clsDocs.php");
	require_once($CLASSES_PATH.'clsNgansachs.php');
	require_once($CLASSES_PATH.'clsTaisans.php');
	require_once($CLASSES_PATH.'clsLoaitaisans.php');
	
	require_once($CLASSES_PATH."clsUnits.php");
	require_once($CLASSES_PATH."clsUsers.php");
	require_once($CLASSES_PATH.'clsKetoans.php');
	
	// --- Variables is used in this page
	$assign_list = array();
	$vars = array_merge($_POST,$_GET, $_FILES);
	if(!$vars['mod']) $vars['mod'] = 'docs';
	
	$arg['arg'] = "";
	$arg['arg'] .= $vars['numresult']?"&numresult=".$vars['numresult']:"";
	$arg['arg'] .= $vars['curpage']?"&curpage=".$vars['curpage']:"";
	$arg['arg'] .= trim($vars['KeyWord'])?"&KeyWord=".trim($vars['KeyWord']):"";
	$arg['arg'] .= $vars['order']?"&order=".$vars['order']:""; 
	$arg['arg'] .= trim($vars['mod'])?"&mod=".trim($vars['mod']):"";
	$arg['arg'] .= $vars['doc_id']?("&doc_id=".$vars['doc_id']):"";
	$arg['arg'] .= $vars['id']?("&id=".$vars['id']):"";
	
	$finish = $vars["finish"];
	
	$user_id = $vars["user_id"];
	
	// --- Get quytrinh list
	$obj_quytrinh 		= new quytrinh_class();
	$where_quytrinh 		= " 1 = 1 and quytrinh_active=1";
	if($department_type == 2) $where_quytrinh 		.= " and (quytrinh_type=1 or quytrinh_type=2)";
	if($department_type == 3) $where_quytrinh 		.= " and (quytrinh_type=0 or quytrinh_type=2)";
	$obj_list_quytrinh	= $obj_quytrinh->getDBList(" $where_quytrinh", "quytrinh_sort", FALSE, "");
	
	// --- Get giaidoan list
	$obj_giaidoan 		= new giaidoan_class();
	$where_giaidoan 		= " 1 = 1 and giaidoan_active=1";
	$obj_list_giaidoan	= $obj_giaidoan->getDBList(" $where_giaidoan", "giaidoan_name", FALSE, "");
	
	// --- Get ngansach list
	$obj_ngansach = new ngansach_class();
	$where_ngansach 		= " 1 = 1 and ngansach_active=1";
	if($department_type == 2) $where_ngansach 		.= " and (ngansach_type=1 or ngansach_type=2)";
	if($department_type == 3) $where_ngansach 		.= " and (ngansach_type=0 or ngansach_type=2)";
	if($department_type == 5) $where_ngansach 		.= " and ngansach_type in(0,1,2)";
	$obj_list_ngansach 	= $obj_ngansach->getDBList(" $where_ngansach", "ngansach_name", FALSE, "");
	
	// --- Get taisan list
	$obj_taisan 		= new taisan_class();
	$where_taisan 		= " 1 = 1 and taisan_active=1";
	if($department_type == 2) $where_taisan 		.= " and (taisan_type=1 or taisan_type=2)";
	if($department_type == 3) $where_taisan 		.= " and (taisan_type=0 or taisan_type=2)";
	if($department_type == 5) $where_taisan 		.= " and taisan_type in(0,1,2)";
	$obj_list_taisan	= $obj_taisan->getDBList(" $where_taisan", "taisan_name", FALSE, "");
	
	// --- Get loaitaisan list
	$obj_loaitaisan 		= new loaitaisan_class();
	$where_loaitaisan 		= " 1 = 1 and loaitaisan_active=1";
	$obj_list_loaitaisan	= $obj_loaitaisan->getDBList(" $where_loaitaisan", "loaitaisan_name", FALSE, "");
	
	// --- Get user list
	$obj_user 		= new users_class();
	$where_user 		= " 1 = 1 and user_active=1";
	$obj_list_user	= $obj_user->getDBList(" $where_user", "user_name", FALSE, "");
	
	// --- Get trangthai list
	$obj_trangthai 		= new trangthai_class();
	$where_trangthai 		= " 1 = 1 and trangthai_active=1 and hopdong_id=".$vars['id'];
	$obj_list_trangthai	= $obj_trangthai->getDBList(" $where_trangthai", "trangthai_id desc", FALSE, "");
	
	$obj_doc = new doc_class();
	$obj_doc->getDBbyPkey($vars['doc_id']);
	$doc_info = (array)$obj_doc;
	
	// --- Get hopdong by doc_id
	$obj_hd = new hopdong_class();
	$hd_num = $obj_hd->getHDbyDocID($vars['doc_id'],3,1);
	
	if ($vars['del']=1) {
		$obj = new trangthai_class();
		$obj->removeInList($vars['trangthai_id']);
	}
		
	if (isset($vars['submitHopdong'])) {
		if ($vars['hopdong_ngaytao']=="") {
			$error = "Bạn chưa nhập thời điểm tạo!";
		}elseif ($vars['ngansach_id']==0) {
			$error = "Bạn chưa chọn nguồn ngân sách!";
		}elseif ($vars['taisan_id']==0) {
			$error = "Bạn chưa chọn nhóm tài sản!";
		}elseif ($vars['loaitaisan_id']==0) {
			$error = "Bạn chưa chọn loại tài sản!";
		}elseif ($vars['hopdong_trichdan']=="") {
			$error = "Bạn chưa nhập trích dẫn hợp đồng!";
		}elseif ($vars['hopdong_giaidoan']==0) {
			$error = "Bạn chưa chọn giai đoạn chính!";
		}else{
			$obj = new hopdong_class();
			$obj->readForm();
			if ((is_null($error)) || ($error == "")) {
				$obj->hopdong_ngaytao = date("Y-m-d",strtotime(str_replace('/','-',$vars['hopdong_ngaytao'])));
				
				$obj->hopdong_gtts_dn_td 	= str_replace('.','',$vars['hopdong_gtts_dn_td']);
				$obj->hopdong_ptt_vat 		= str_replace('.','',$vars['hopdong_ptt_vat']);
				$obj->hopdong_sophai_datcoc = str_replace('.','',$vars['hopdong_sophai_datcoc']);
				$obj->hopdong_phongban 		= $_SESSION['access_unit_id'];
				
				$obj->update();
				unset($obj);
				redirect("?listHopdong".$vars['arg']);
			}
		}
	}elseif (isset($vars['addQuytrinh'])) {
		if ($vars['quytrinh_id']==0) {
			$error = "Bạn chưa chọn giai đoạn!";
		}elseif ($vars['trangthai_file']=="" && $vars['trangthai_note']=="") {
			$error = "Bạn chưa chọn tệp tin đính kèm hoặc chưa có chú thích!";
		}else{
			$obj = new trangthai_class();
			$obj->readForm();
			if ((is_null($error)) || ($error == "")) {
				$obj->trangthai_date = date("Y-m-d");
				$obj->trangthai_active = 1;
				$obj->hopdong_id = $vars['hopdong_id'];
				$obj->insertnew();
				unset($obj);
				redirect("?editHopdong".$vars['arg']);
			}
		}
	}elseif (isset($vars['editSHD'])) {
		if ($vars['hopdong_sohd']=="") {
			$error = "Bạn chưa nhập số hợp đồng!";
		}elseif ($vars['hopdong_ngaycap_sohd']=="") {
			$error = "Bạn chưa nhập ngày cấp!";
		}else{
			$obj = new hopdong_class();
			$obj->readForm();
			if ((is_null($error)) || ($error == "")) {
				$obj->updateSohd($vars['hopdong_id'],$vars['hopdong_sohd'],date('Y-m-d',strtotime(str_replace('/','-',$vars['hopdong_ngaycap_sohd']))),$vars['hopdong_soct'],date('Y-m-d',strtotime(str_replace('/','-',$vars['hopdong_ngaycap_soct']))));
				unset($obj);
				redirect("?editHopdong".$vars['arg']);
			}
		}
	}else {
		$obj = new hopdong_class();
		
		$obj->getDBbyPkey($vars['id']);
		if (!$obj->hopdong_id) redirect("?listHopdong".$arg['arg']);
		
		// --- Get user list
		$users 	=  new users_class();
		$users->getDBbyPkey($obj->hopdong_nguoitao);
		$users_info = (array) $users;
		
		$obj_ketoan = new ketoan_class();
		$obj_ketoan->getDBbyPkey($obj->hopdong_id);
		$ketoan_info = (array) $obj_ketoan;
		
		$vars = (array)$obj;
		unset($obj);
	}
	
	 // --- Assign data to template
	$assign_list["vars"] = $vars;
	
	$assign_list['obj_list_quytrinh'] = $obj_list_quytrinh;
	$assign_list['obj_list_giaidoan'] = $obj_list_giaidoan;
	$assign_list['obj_list_taisan'] = $obj_list_taisan;
	$assign_list['obj_list_loaitaisan'] = $obj_list_loaitaisan;
	$assign_list['obj_list_user'] = $obj_list_user;
	$assign_list['obj_list_ngansach'] = $obj_list_ngansach;
	$assign_list['obj_list_trangthai'] = $obj_list_trangthai;
	$assign_list['doc_info'] 	= $doc_info;
	$assign_list['users_info'] 	= $users_info;
	$assign_list['ketoan_info'] = $ketoan_info;
	$assign_list['hd_num'] 		= $hd_num;
	$assign_list['department_type'] 	= $department_type;
		
	$assign_list["arg"] = $arg;
	$assign_list["error"] = $error;
	$assign_list["error"] = $error;
	$smarty->assign($assign_list);
	$smarty->display(dirname(__FILE__)."/skin/B_Hopdong_edit.tpl");
?>