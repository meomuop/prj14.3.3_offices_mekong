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
 require_once($CLASSES_TNVB."clsDocs.php"); 
 require_once($CLASSES_TNVB.'clsDocCats.php');
 require_once($CLASSES_TNVB.'clsDocFields.php');
 
 require_once($CLASSES_TNVB."clsSignPers.php");
 require_once($CLASSES_TNVB."clsImportants.php");
 
 require_once($CLASSES_TNVB."clsUnits.php");
 require_once($CLASSES_TNVB."clsUsers.php");

 // --- Variables is used in this page
 $assign_list = array();
 $vars = array_merge($_POST,$_GET, $_FILES);
 if(!$vars['mod']) $vars['mod'] = 'docs';
 
 	if (isset($vars['submitDoc'])) {
		if ($vars['docCat_id']=="") {
			$error = "Bạn chưa chọn chủng loại văn bản!";
		}elseif ($vars['doc_code']=="") {
			$error = "Bạn chưa nhập số ký hiệu!";
		}elseif ($vars['doc_desc']=="") {
			$error = "Bạn chưa nhập trích yếu!";
		}else{
			$obj = new doc_class();
			$obj->readForm();
			if ((is_null($error)) || ($error == "")) {
				$obj->doc_date = date("Y-m-d H:i");
				$obj->doc_signed = date('Y-m-d',strtotime(str_replace('/','-',$vars['doc_signed'])));
				$obj->doc_limit_time = date('Y-m-d',strtotime(str_replace('/','-',$vars['doc_limit_time'])));
				$obj->user_id = $_SESSION['user_id'];
												
				$obj_doccat = new doccat_class();
				$docCat_type = $obj_doccat->getTypebyName($vars['docCat_id']);
				
				//$obj_docCoincidence = new doc_class();
				//$isTheSame = $obj_docCoincidence->checkCoincidence($vars['doc_code']);
				//if ($isTheSame>0) {
				//	$error = "Văn bản đã tồn tại";
				//}else{
					$obj->insertnew();
					$last_doc_id = $obj->getLastOne();
					unset($obj);
					require_once($CLASSES_TNVB."clsDocFiles.php"); 
					$obj_file = new docfile_class();
					if ($vars['count_rows']>0):
						for($i=0; $i<$vars['count_rows']; $i++):
						$obj_file->addfile($last_doc_id,$vars['docfile_name'][$i],$vars['docfile_path'][$i],$_SESSION['user_id']);
						endfor;
					endif;
					redirect("?addReceive".$vars['arg']."&doc_id=".$last_doc_id);
				//}
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
				
	// --- Get important list
	$obj_important 		= new important_class();
	$where_important 		= " 1 = 1 and important_active=1";
	$obj_list_important	= $obj_important->getDBList(" $where_important", "important_name", FALSE, "");
	
	// --- Get user list
	$obj_user 		= new users_class();
	$where_user 		= " 1 = 1 and user_active=1";
	$obj_list_user	= $obj_user->getDBList(" $where_user", "user_name", FALSE, "");
		
	$assign_list["vars"] = $vars;
	
	$assign_list['obj_list_secret'] = $obj_list_secret;
	$assign_list['obj_list_important'] = $obj_list_important;
	$assign_list['obj_list_user'] = $obj_list_user;
	$assign_list['obj_list_dlevel'] = $obj_list_dlevel;
	
	$assign_list["error"] = $error;
  	$smarty->assign($assign_list);
    $smarty->display(dirname(__FILE__)."/skin/B_Doc_add.tpl");
?>