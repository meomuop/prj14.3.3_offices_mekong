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
	
	require_once($CLASSES_PATH."clsDocs.php"); 
	require_once($CLASSES_PATH.'clsDocCats.php');
	require_once($CLASSES_PATH.'clsDocFields.php');
	require_once($CLASSES_PATH.'clsDocLevels.php');
	require_once($CLASSES_PATH."clsSecrets.php");
	require_once($CLASSES_PATH."clsImportants.php");
	require_once($CLASSES_PATH.'clsDocFiles.php');
	
	// --- Variables is used in this page
	$assign_list = array();
	$vars = array_merge($_POST,$_GET, $_FILES);
	
	$processurl = "?viewDocinQLVB&mod=truyennhans";
 
	// --- Get argument of page
	$vars['arg'] = "";
	$vars['arg'] .= $vars['numresult']?"&numresult=".$vars['numresult']:"";
	$vars['arg'] .= $vars['curpage']?"&curpage=".$vars['curpage']:"";
	$vars['arg'] .= trim($vars['KeyWord'])?"&KeyWord=".trim($vars['KeyWord']):"";
	$vars['arg'] .= $vars['order']?"&order=".$vars['order']:""; 
	$vars['arg'] .= trim($vars['mod'])?"&mod=".trim($vars['mod']):"";
	//$vars['arg'] .= $vars['doc_id']?"&doc_id=".$vars['doc_id']:"";
	
	$obj = new doc_class();
	$obj->getDBbyPkey($vars['doc_id']);
	//if (!$obj->doc_id) redirect("?listDoc".$arg['arg']);
	
	// --- Get doc file list
	$obj_docfile		= new docFile_class();
	$where_docfile 		= " 1 = 1 and doc_id = ".$obj->doc_id;
	$obj_list_docfile	= $obj_docfile->getDBList(" $where_docfile", "docFile_name asc", FALSE, "");
	
	// --- Get doc fields list
	$obj_dlevel = new docLevel_class();
	$where_dlevel 		= " 1 = 1 and docLevel_active=1";
	$obj_list_dlevel 	= $obj_dlevel->getDBList(" $where_dlevel", "docLevel_name", FALSE, "");
	
	// --- Get user list
	$obj_user 		= new users_class();
	$where_user 		= " 1 = 1 and user_active=1";
	$obj_list_user	= $obj_user->getDBList(" $where_user", "user_name", FALSE, "");
	
	// --- Get secret list
	$obj_secret 		= new secret_class();
	$where_secret 		= " 1 = 1 and secret_active=1";
	$obj_list_secret	= $obj_secret->getDBList(" $where_secret", "secret_name", FALSE, "");
	
	// --- Get important list
	$obj_important 		= new important_class();
	$where_important 		= " 1 = 1 and important_active=1";
	$obj_list_important	= $obj_important->getDBList(" $where_important", "important_name", FALSE, "");
	
	$vars = (array)$obj;
	unset($obj);
			
	$assign_list["vars"] = $vars;
	
	$assign_list['obj_list'] 	= $obj_list;	
	$assign_list['doc_info'] = $doc_info;
	$assign_list['doc_id'] 	= $vars['doc_id'];
	$assign_list['user_info'] 	= $user_info;
	$assign_list["http_root_2"] = $http_root_2;
	
	$assign_list['obj_list_user'] = $obj_list_user;
	$assign_list['obj_list_dlevel'] = $obj_list_dlevel;
	$assign_list['obj_list_reply_user'] = $obj_list_reply_user;
	$assign_list['obj_list_docfile'] = $obj_list_docfile;
	$assign_list['obj_list_department'] = $obj_list_department;
	$assign_list['obj_list_secret'] = $obj_list_secret;
	$assign_list['obj_list_important'] = $obj_list_important;
	
	$assign_list["error"] = $error;
	$assign_list["errorfile"] = $errorfile;
	
	$display = dirname(__FILE__)."/skin/B_DocinQLVB_view.tpl";
	$assign_list['display'] = $display;
	
	$smarty->assign($assign_list);
	
	// --- Display template
	if (isset($vars['activeAjax']))
	$smarty->display(dirname(__FILE__)."/skin/B_DocinQLVB_view.tpl");
	else
	$smarty->display(dirname(__FILE__)."/skin/B_Doc_list.tpl");
?>