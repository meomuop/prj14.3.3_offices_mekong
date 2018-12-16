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
	include ($CLASSES_TNVB.'clsReceives.php');
	require_once($CLASSES_TNVB.'clsRecusers.php');
	require_once($CLASSES_TNVB.'clsDocTransports.php');
	require_once($CLASSES_TNVB.'clsDocfiles.php');
	
	require_once($CLASSES_PATH.'clsDocFields.php');
	require_once($CLASSES_PATH.'clsDocLevels.php');
	require_once($CLASSES_PATH."clsSecrets.php");
	require_once($CLASSES_PATH."clsImportants.php");
	
	require_once ($CLASSES_TNVB.'clsDocReplys.php');
	require_once ($CLASSES_TNVB.'clsFeedbacks.php');
	
	// --- Variables is used in this page
	$assign_list = array();
	$vars = array_merge($_POST,$_GET, $_FILES);
	
	$processurl = "?viewDocReceive&mod=docs";
	$processurl .= $vars['doc_id']?"&doc_id=".$vars['doc_id']:"";
	
	if (isset($vars['submitFeedbacks'])) {
		if ($vars['feedback_cont']=="") {
			$errorfile = "Bạn chưa nhập nội dung!";
		}else{
			$obj = new feedback_class();
			$obj->readForm();
			if ((is_null($error)) || ($error == "")) {
				$obj->feedback_date = date("Y-m-d H:i");
				$obj->doc_id = $vars['doc_id'];
				$obj->user_id = $_SESSION['user_id'];
				$obj->insertnew();
				unset($obj);
				redirect("?viewDocReceive".$vars['arg']);				
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
	$vars['arg'] .= $vars['doc_id']?"&doc_id=".$vars['doc_id']:"";
	
	$obj_doc = new doc_trans_class();
	$obj_doc->getDBbyPkey($vars['doc_id']);
	$doc_info = (array)$obj_doc;
	
	// --- Get user name for document
	$obj_user 		= new users_class();
	$obj_user->getDBbyPkey($obj_doc->user_id);
	$user_info = (array)$obj_user;
	
	// --- Get user list
	$where_user 		= " 1 = 1 and user_active = 1 and user_id != ".$_SESSION['user_id']."";
	$obj_list_user	= $obj_user->getDBList(" $where_user", "user_sort", FALSE, "");
	
	// --- Get department list
	$obj_department 		= new department_class();
	$where_department 		= " 1 = 1 and department_active=1 and department_id in(select department_id from tbl_receives where doc_id=".$vars['doc_id'].")";
	$obj_list_department	= $obj_department->getDBList(" $where_department", "department_name", FALSE, "");
	
	// --- Get document files list
	$obj_docfile 		= new docfile_trans_class();
	$where_docfile 		= " 1 = 1 and doc_id=".$vars['doc_id'];
	$obj_list_docfile	= $obj_docfile->getDBList(" $where_docfile", "docFile_name", FALSE, "");
	
	// --- Get document replies list
	$obj_docreply 		= new docreply_class();
	$where_docreply 	= " 1 = 1 and doc_id=".$vars['doc_id']." and user_id=".$_SESSION['user_id'];
	$obj_list_docreply	= $obj_docreply->getDBList(" $where_docreply", "docreply_code", FALSE, "");
	
	// --- Get document feedbacks list
	$obj_feedback 		= new feedback_class();
	$where_feedback 	= " 1 = 1 and doc_id=".$vars['doc_id']." and user_id=".$_SESSION['user_id'];
	$obj_list_feedback	= $obj_feedback->getDBList(" $where_feedback", "feedback_id", FALSE, "");
	
	// --- Get receive by doc_id and user_id
	$obj_receive 	= new receive_class();
	$where_receive 	= " 1 = 1 and doc_id=".$vars['doc_id']." and receive_per=".$_SESSION['user_id'];
	$receive_id	= $obj_receive->getReceivebyUser("$where_receive");
	
	// --- Get secret list
	$obj_secret 		= new secret_class();
	$where_secret 		= " 1 = 1 and secret_active=1";
	$obj_list_secret	= $obj_secret->getDBList(" $where_secret", "secret_name", FALSE, "");
	
	// --- Get important list
	$obj_important 		= new important_class();
	$where_important 		= " 1 = 1 and important_active=1";
	$obj_list_important	= $obj_important->getDBList(" $where_important", "important_name", FALSE, "");
	
	// --- Get user list
	$obj_user_file 		= new users_class();
	$where_user_file	= " 1 = 1 and user_active=1";
	$obj_list_user_file	= $obj_user_file->getDBList(" $where_user_file", "user_name", FALSE, "");
	
	if($receive_id>0):
		$obj_receive->changeRead("$where_receive");
	else:
		$where_receive 	= " 1 = 1 and doc_id=".$vars['doc_id']." and receive_id in(select receive_id from tbl_recusers where user_id = ".$_SESSION['user_id'].")";
		$receive_id	= $obj_receive->getReceivebyUser("$where_receive");
		
		$obj_recuser 	= new recuser_class();
		$where_recuser = "1=1 and user_id = ".$_SESSION['user_id']." and receive_id in(select receive_id from tbl_receives where doc_id=".$vars['doc_id'].")";
		$obj_recuser->changeRead("$where_recuser");
	endif;
	
	$assign_list["vars"] = $vars;
	
	$assign_list['obj_list_user'] = $obj_list_user;
	$assign_list['obj_list_department'] = $obj_list_department;
	$assign_list['obj_list_docfile'] = $obj_list_docfile;
	$assign_list['obj_list_docreply'] = $obj_list_docreply;
	$assign_list['obj_list_feedback'] = $obj_list_feedback;
	
	$assign_list['obj_list_secret'] = $obj_list_secret;
	$assign_list['obj_list_important'] = $obj_list_important;
	$assign_list['obj_list_user_file'] = $obj_list_user_file;
	
	$assign_list['doc_info'] 	= $doc_info;
	$assign_list['doc_id'] 		= $vars['doc_id'];
	$assign_list['user_info'] 	= $user_info;
	
	$assign_list["error"] = $error;
	$assign_list["errorfile"] = $errorfile;
	
	$display = dirname(__FILE__)."/skin/B_DocReceive_view.tpl";
	$assign_list['display'] = $display;
	
	$smarty->assign($assign_list);
	
	// --- Display template
	if (isset($vars['activeAjax']))
	$smarty->display(dirname(__FILE__)."/skin/B_DocReceive_view.tpl");
	else
	$smarty->display(dirname(__FILE__)."/skin/B_Doc_list.tpl");
?>