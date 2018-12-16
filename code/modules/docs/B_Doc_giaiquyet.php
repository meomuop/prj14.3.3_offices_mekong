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
	require_once($CLASSES_PATH.'clsDocCats.php');
	require_once($CLASSES_PATH.'clsDocFields.php');
	require_once($CLASSES_PATH.'clsDocLevels.php');
	require_once($CLASSES_PATH."clsUsers.php");
	require_once($CLASSES_PATH."clsObjects.php");
	require_once($CLASSES_PATH."clsDocUsers.php");
	// --- Class is used in this page
	$obj = new doc_class();
	
	// --- Variables is used in this page
	$vars = array_merge($_POST, $_GET);
	if(!$vars['mod']) $vars['mod'] = 'docs';
	
	$obj_doc = new doc_class();
	$obj_doc->getDBbyPkey($vars['doc_id']);
	$doc_theodoi = $obj_doc->doc_theodoi;
	$doc_num = $obj_doc->doc_num;
	$doc_code = $obj_doc->doc_code;
	
	if($vars['add_edit']==1):		
		$obj_doc -> updateGiaiquyet($vars['doc_note_code'],$vars['doc_note_sign_date'],$vars['doc_note_sign_per'],$vars['doc_note_date'],$vars['doc_id']);
	endif;
	
	// --- Get user list
	$obj_user 		= new users_class();
	$where_user 	= " 1 = 1 and user_active = 1 and user_level in(4,5)";
	$obj_list_user	= $obj_user->getDBList(" $where_user", "user_sort", FALSE, "");
	
	// --- Get object list
	$obj_object 		= new object_class();
	$where_object 		= " 1 = 1 and object_active=1";
	$obj_list_object	= $obj_object->getDBList(" $where_object", "object_name", FALSE, "");
	
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
	
	$assign_list['obj_list_user'] 	= $obj_list_user;
	$assign_list['obj_list_object'] = $obj_list_object;
	
	$assign_list['doc_id'] 		= $vars['doc_id'];
	$assign_list['user_id'] 	= $vars['user_id'];
	$assign_list['order_id'] 	= $vars['order_id'];
	
	$assign_list['obj_doc'] 	= $obj_doc;
	
	$assign_list['doc_num'] = $doc_num;
	$assign_list['doc_code'] = $doc_code;
	
	$assign_list['processurl'] = $processurl;
	$assign_list['vars'] 		= $vars;
	
	$smarty->assign($assign_list);
	
	// --- Display template
	$smarty->display(dirname(__FILE__)."/skin/B_Doc_giaiquyet.tpl");
?>