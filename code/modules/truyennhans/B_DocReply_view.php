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
 require_once ($CLASSES_TNVB.'clsDocReplys.php');
 require_once ($CLASSES_TNVB.'clsDocreplyfiles.php');
 require_once ($CLASSES_TNVB.'clsUsers.php');
 require_once ($CLASSES_TNVB."clsDepartments.php");

 // --- Variables is used in this page
 $assign_list = array();
 $vars = array_merge($_POST,$_GET, $_FILES);
 
 $processurl = "?viewDocReply&mod=docs";
 $processurl .= $vars['docreply_id']?"&docreply_id=".$vars['docreply_id']:"";
 
	
	// --- Get argument of page
	$vars['arg'] = "";
	$vars['arg'] .= $vars['numresult']?"&numresult=".$vars['numresult']:"";
	$vars['arg'] .= $vars['curpage']?"&curpage=".$vars['curpage']:"";
	$vars['arg'] .= trim($vars['KeyWord'])?"&KeyWord=".trim($vars['KeyWord']):"";
	$vars['arg'] .= $vars['order']?"&order=".$vars['order']:""; 
	$vars['arg'] .= trim($vars['mod'])?"&mod=".trim($vars['mod']):"";
	$vars['arg'] .= $vars['docreply_id']?"&docreply_id=".$vars['docreply_id']:"";
	
	$obj_doc = new docreply_class();
	$obj_doc->getDBbyPkey($vars['docreply_id']);
	$docreply_info = (array)$obj_doc;
	
	// --- Get user name for document
	$obj_user 		= new users_class();
	$obj_user->getDBbyPkey($obj_doc->user_id);
	$user_info = (array)$obj_user;
	
	// --- Get user list
	$where_user 		= " 1 = 1 and user_active = 1 and user_id != ".$_SESSION['user_id']."";
	$obj_list_user	= $obj_user->getDBList(" $where_user", "user_sort", FALSE, "");
	
	// --- Get department list
	$obj_department 		= new department_class();
	$where_department 		= " 1 = 1 and department_active=1 and department_id in(select department_id from tbl_receives where docreply_id=".$vars['docreply_id'].")";
	$obj_list_department	= $obj_department->getDBList(" $where_department", "department_name", FALSE, "");
	
	// --- Get document files list
	$obj_docreplyfile 		= new docreplyfile_class();
	$where_docreplyfile 		= " 1 = 1 and docreply_id=".$vars['docreply_id'];
	$obj_list_docreplyfile	= $obj_docreplyfile->getDBList(" $where_docreplyfile", "docreplyfile_name", FALSE, "");
	
	$assign_list["vars"] = $vars;
	
	$assign_list['obj_list_user'] = $obj_list_user;
	$assign_list['obj_list_department'] = $obj_list_department;
	$assign_list['obj_list_docreplyfile'] = $obj_list_docreplyfile;
	
	$assign_list['docreply_info'] 	= $docreply_info;
	$assign_list['docreply_id'] = $vars['docreply_id'];
	$assign_list['user_info'] 	= $user_info;
	
	$assign_list["error"] = $error;
	$assign_list["errorfile"] = $errorfile;
	
	$display = dirname(__FILE__)."/skin/B_DocReply_view.tpl";
	$assign_list['display'] = $display;
	
	$smarty->assign($assign_list);
	
	// --- Display template
	if (isset($vars['activeAjax']))
	$smarty->display(dirname(__FILE__)."/skin/B_DocReply_view.tpl");
	else
	$smarty->display(dirname(__FILE__)."/skin/B_Doc_list.tpl");
?>