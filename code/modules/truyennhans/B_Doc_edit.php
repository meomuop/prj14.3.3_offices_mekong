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
	require_once($CLASSES_TNVB."clsDocs.php"); 
	require_once ($CLASSES_TNVB.'clsDocCats.php');
	require_once ($CLASSES_TNVB.'clsDocFields.php');
	require_once ($CLASSES_TNVB.'clsDocLevels.php');
	
	require_once($CLASSES_TNVB."clsSignPers.php");
	require_once($CLASSES_TNVB."clsSignObjs.php");
	require_once($CLASSES_TNVB."clsSecrets.php");
	require_once($CLASSES_TNVB."clsImportants.php");
 
	require_once($CLASSES_TNVB."clsUnits.php");
	require_once($CLASSES_TNVB."clsUsers.php");
	
	require_once ($CLASSES_TNVB.'clsDocReplys.php');
	require_once ($CLASSES_TNVB.'clsDocFiles.php');
	
	// --- Variables is used in this page
	$assign_list = array();
	$vars = array_merge($_POST,$_GET, $_FILES);
	if(!$vars['mod']) $vars['mod'] = 'docs';
	
	$arg['arg'] = "";
	if($vars["curpage"]) 		$arg['arg'] = $arg['arg']."&curpage=".$vars["curpage"];
	if($vars["numresult"]) 		$arg['arg'] = $arg['arg']."&numresult=".$vars["numresult"];
	if(trim($vars['KeyWord'])) 	$arg['arg'] = $arg['arg']."&KeyWord=".trim($vars['KeyWord']);
	if($vars["order"]) 			$arg['arg'] = $arg['arg']."&order=".$vars["order"];
	if(trim($vars['mod'])) 		$arg['arg'] = $arg['arg']."&mod=".trim($vars['mod']);
	if($vars["id"]) 			$arg['arg'] = $arg['arg']."&id=".$vars["id"];
	if($vars["finish"]) 		$arg['arg'] = $arg['arg']."&finish=".$vars["finish"];
	
	$finish = $vars["finish"];
	
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
	$where_user 		= " 1 = 1 and user_active=1 and user_level_tnvb in(4,5)";
	$obj_list_user	= $obj_user->getDBList(" $where_user", "user_sort", FALSE, "");
	
	// --- Get doc reply list
	$obj_reply 		= new docReply_class();
	$where_reply 		= " 1 = 1 and doc_id = ".$vars['id'];
	$obj_list_reply	= $obj_reply->getDBList(" $where_reply", "docReply_id asc", FALSE, "");
	
	// --- Get doc file list
	$obj_docfile		= new docFile_class();
	$where_docfile 		= " 1 = 1 and doc_id = ".$vars['id'];
	$obj_list_docfile	= $obj_docfile->getDBList(" $where_docfile", "docFile_name asc", FALSE, "");
	
	// --- Get user list
	$obj_reply_user 		= new users_class();
	$where_reply_user 		= " 1 = 1 and user_active=1";
	$obj_list_reply_user	= $obj_reply_user->getDBList(" $where_reply_user", "user_name", FALSE, "");
	
	
	if (isset($vars['submitDoc'])) {
		if ($vars['unit_name']=="") {
			$error = "Bạn chưa chọn nơi đến của văn bản!";
		}elseif ($vars['docCat_id']=="") {
			$error = "Bạn chưa chọn chủng loại văn bản!";
		}elseif ($vars['doc_code']=="") {
			$error = "Bạn chưa nhập số ký hiệu!";
		}elseif ($vars['doc_signed']=="") {
			$error = "Bạn chưa nhập ngày ký!";
		}elseif ($vars['signPer_id']=="") {
			$error = "Bạn chưa nhập người ký!";
		}elseif ($vars['signObj_id']=="") {
			$error = "Bạn chưa nhập chức vụ người ký!";
		}elseif ($vars['doc_desc']=="") {
			$error = "Bạn chưa nhập trích yếu!";
		}elseif ($_SESSION["user_level_tnvb"]==3 && $vars["finish"] != 1 && $vars['user_id']==0) {
			$error = "Bạn chưa chọn người nhận!";
		}else{
			$obj = new doc_class();
			$obj->readForm();
			if ((is_null($error)) || ($error == "")) {
				$obj->doc_date = date("Y-m-d H:i");
				$obj->doc_signed = date('Y-m-d',strtotime(str_replace('/','-',$vars['doc_signed'])));
				$obj->doc_recevied = date('Y-m-d',strtotime(str_replace('/','-',$vars['doc_recevied'])));
				$obj->doc_limit_time = date('Y-m-d',strtotime(str_replace('/','-',$vars['doc_limit_time'])));
				$obj->doc_moved = date('Y-m-d',strtotime(str_replace('/','-',$vars['doc_moved'])));
				$obj->input_per = $_SESSION['user_id'];
				if($_SESSION["user_level_tnvb"] == 3 && $vars["finish"] != 1):
				$obj->doc_traned = 1;
				endif;
				if($_SESSION["user_level_tnvb"] == 4 || $_SESSION["user_level_tnvb"] == 5 ||$_SESSION["user_level_tnvb"] == 6 || $_SESSION["user_level_tnvb"] == 7 || $_SESSION["user_level_tnvb"] == 8 || $vars["finish"] == 1):
				$obj->doc_active = 1;
				endif;
				if ($obj->is_already_used($obj->tablename, "doc_id", $obj->doc_id))
				{
					$obj_docCoincidence = new doc_class();
					$isTheSame = $obj_docCoincidence->checkCoincidence($vars['doc_code'],date('Y-m-d',strtotime(str_replace('/','-',$vars['doc_signed']))),$vars['unit_name'],$obj->doc_id);
					if ($isTheSame>0) {
						$error = "Văn bản đã tồn tại";
					}else{
						$obj->update();
						unset($obj);
						if($_SESSION["user_level_tnvb"] == 3 && $vars["finish"] != 1):
						redirect("?tranDoc".$vars['arg']);
						elseif($_SESSION["user_level_tnvb"] == 6 || $_SESSION["user_level_tnvb"] == 7 || $vars["finish"] == 1):
						redirect("?processDoc".$vars['arg']);
						elseif($_SESSION["user_level_tnvb"] == 4 || $_SESSION["user_level_tnvb"] == 5):
						redirect("?replyDoc".$vars['arg']);
						elseif($_SESSION["user_level_tnvb"] == 8):
						redirect("?finishDoc".$vars['arg']);
						else:
						redirect("?listDoc".$vars['arg']);
						endif;
					}
				}else{
					$error = "Có lỗi xảy ra trong quá trình xử lý!";
				}
			}
		}
	}
	else {
		$obj = new doc_class();
		
		$obj->getDBbyPkey($vars['id']);
		if (!$obj->doc_id) redirect("?listDoc".$arg['arg']);
	
		$vars = (array)$obj;
		unset($obj);
	}	
	
	 // --- Assign data to template
	$assign_list["vars"] = $vars;
	
	$assign_list['obj_list_reply'] = $obj_list_reply;
	$assign_list['obj_list_reply_user'] = $obj_list_reply_user;
	$assign_list['obj_list_docfile'] = $obj_list_docfile;
	
	$assign_list['finish'] = $finish;
	
	$assign_list['obj_list_secret'] = $obj_list_secret;
	$assign_list['obj_list_important'] = $obj_list_important;
	$assign_list['obj_list_user'] = $obj_list_user;
	$assign_list['obj_list_dlevel'] = $obj_list_dlevel;
		
	$assign_list["arg"] = $arg;
	$assign_list["error"] = $error;
	$smarty->assign($assign_list);
	$smarty->display(dirname(__FILE__)."/skin/B_Doc_edit.tpl");
?>