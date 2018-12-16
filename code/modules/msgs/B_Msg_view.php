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
	require_once($CLASSES_PATH."clsMsgs.php"); 
	require_once($CLASSES_PATH."clsUsers.php"); 
	require_once ($CLASSES_PATH.'clsObjects.php');
	require_once ($CLASSES_PATH.'clsMsgUsers.php');
	
	// --- Variables is used in this page
	$assign_list = array();
	$vars = array_merge($_POST,$_GET, $_FILES);
	
	$arg['arg'] = "";
	$arg['arg'] .= $vars["curpage"]?"&curpage=".$vars["curpage"]:"";
	$arg['arg'] .= $vars["numresult"]?"&numresult=".$vars["numresult"]:"";
	$arg['arg'] .= trim($vars['KeyWord'])?"&KeyWord=".trim($vars['KeyWord']):"";
	$arg['arg'] .= $vars["order"]?"&order=".$vars["order"]:"";
	$arg['arg'] .= trim($vars['mod'])?"&mod=".trim($vars['mod']):"";
 					
	$obj = new msg_class();
	
	$obj->getDBbyPkey($vars['msg_id']);
	
	$obj_msgUser = new msgUser_class();
	$obj_msgUser->updateStatus($vars['msg_id'],$_SESSION['user_id']);
	
	// --- get send user
	$obj_user_sent		= new users_class();
	$where_user_sent 	= " 1 = 1 and user_active = 1 and user_id = ".$obj->user_sent."";
	$obj_list_user_sent	= $obj_user->getDBList(" $where_user_sent", "user_name", FALSE, "");
	
	// --- Get selected user
	$obj_user		= new users_class();
	$where_user 	= " 1 = 1 and user_active = 1 and user_id in (".$obj->user_recevie.")";
	$obj_list_user	= $obj_user->getDBList(" $where_user", "user_name", FALSE, "");
	
	// --- Get object list
	$obj_object 		= new object_class();
	$where_object 		= " 1 = 1 and object_active=1";
	$obj_list_object	= $obj_object->getDBList(" $where_object", "object_name", FALSE, "");
		
	$vars = (array)$obj;
	unset($obj);
		
	// --- Assign data to template
	$assign_list['obj_list_user_sent'] = $obj_list_user_sent;
	$assign_list['obj_list_user'] = $obj_list_user;
	$assign_list['obj_list_object'] = $obj_list_object;
	$assign_list["vars"] = $vars;
	$assign_list["arg"] = $arg;
	$assign_list["error"] = $error;
	$smarty->assign($assign_list);
	$smarty->display(dirname(__FILE__)."/skin/B_Msg_view.tpl");
?>