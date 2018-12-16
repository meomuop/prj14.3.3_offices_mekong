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
 
 if($_SESSION["per_add"]!=1):
 	include ("admin_index.php"); 
 endif;
 
 
 // --- Class is used in this page
 require_once($CLASSES_PATH."clsHopdongs.php");
 require_once($CLASSES_PATH."clsDocs.php");
 require_once($CLASSES_PATH.'clsNgansachs.php');
 require_once($CLASSES_PATH.'clsTaisans.php');
 require_once($CLASSES_PATH.'clsLoaitaisans.php');
  
 require_once($CLASSES_PATH."clsUnits.php");
 require_once($CLASSES_PATH."clsUsers.php");
 require_once($CLASSES_PATH.'clsKetoans.php');
 require_once($CLASSES_PATH.'clsKetoanBDGs.php');

 // --- Variables is used in this page
 $assign_list = array();
 $vars = array_merge($_POST,$_GET, $_FILES);
 if(!$vars['mod']) $vars['mod'] = 'hopdongs';
 
 	if (isset($vars['submitHopdong'])) {
		if ($vars['hopdong_ngaytao']=="") {
			$error = "Bạn chưa nhập thời điểm tạo!";
		}elseif ($vars['hopdong_ngaybaocao']=="") {
			$error = "Bạn chưa nhập số ngày để báo cáo!";
		}elseif ($vars['hopdong_ngaydukien']=="") {
			$error = "Bạn chưa nhập số ngày trên hợp đồng!";
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
				$hd_num = $obj->getHDbyDocID($vars['doc_id'],1,$vars['hopdong_type']);
				if($hd_num > 0):
				$error = "Hợp đồng đã tồn tại!";
				else:
				$obj->hopdong_ngaytao = date("Y-m-d",strtotime(str_replace('/','-',$vars['hopdong_ngaytao'])));
				
				$obj->hopdong_gtts_dn_td 	= str_replace('.','',$vars['hopdong_gtts_dn_td']);
				$obj->hopdong_ptt_vat 		= str_replace('.','',$vars['hopdong_ptt_vat']);
				$obj->hopdong_sophai_datcoc = str_replace('.','',$vars['hopdong_sophai_datcoc']);
				$obj->hopdong_phongban 		= $_SESSION['access_unit_id'];
				
				$obj->insertnew();
				$hopdong_id = $obj->getLastIDbyNguoitao($_SESSION['user_id']);
				unset($obj);
				
				if($vars['hopdong_gtts_dn_td'] != '' && $vars['hopdong_tile_ptt'] != '' && $vars['hopdong_ptt_vat'] != ''):
					$obj_ketoan = new ketoan_class();
					$obj_ketoan->insertByHDID($hopdong_id);
				else:
					$obj_ketoan = new ketoan_bdg_class();
					$obj_ketoan->insertByHDID($hopdong_id);
				endif;
				
				redirect("?editHopdong".$vars['arg']."&id=".$hopdong_id);
				endif;
			}
	}
 	}
	
	// --- Get argument of page
	$vars['arg'] = "";
	$vars['arg'] .= $vars['numresult']?"&numresult=".$vars['numresult']:"";
	$vars['arg'] .= $vars['curpage']?"&curpage=".$vars['curpage']:"";
	$vars['arg'] .= trim($vars['KeyWord'])?"&KeyWord=".trim($vars['KeyWord']):"";
	$vars['arg'] .= $vars['order']?"&order=".$vars['order']:""; 
	$vars['arg'] .= trim($vars['mod'])?"&mod=".trim($vars['mod']):"";
	$vars['arg'] .= $vars['doc_id']?("&doc_id=".$vars['doc_id']):"";
		
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
	
	$obj_doc = new doc_class();
	$obj_doc->getDBbyPkey($vars['doc_id']);
	$doc_info = (array)$obj_doc;
	
	// --- Get hopdong by doc_id
	$obj_hd = new hopdong_class();
	$hd_num = $obj_hd->getHDbyDocID($vars['doc_id']);
	
	$assign_list["vars"] = $vars;
	
	$assign_list['obj_list_taisan'] = $obj_list_taisan;
	$assign_list['obj_list_loaitaisan'] = $obj_list_loaitaisan;
	$assign_list['obj_list_user'] = $obj_list_user;
	$assign_list['obj_list_ngansach'] = $obj_list_ngansach;
	$assign_list['doc_info'] 	= $doc_info;
	$assign_list['hd_num'] 	= $hd_num;
	$assign_list['department_type'] 	= $department_type;
	
	$assign_list["error"] = $error;
	$assign_list["complete"] = $vars['complete'];
  	$smarty->assign($assign_list);
    $smarty->display(dirname(__FILE__)."/skin/B_Hopdong_add.tpl");
?>