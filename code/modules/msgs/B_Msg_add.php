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
	//require_once($CLASSES_PATH."clsMsgs.php"); 
	require_once($CLASSES_PATH."clsUsers.php"); 
	require_once($CLASSES_PATH.'clsObjects.php');
	require_once($CLASSES_PATH.'clsDepartments.php');
	require_once($CLASSES_PATH.'clsMsgUsers.php');
	
	// --- Variables is used in this page
	$assign_list = array();
	$vars = array_merge($_POST,$_GET, $_FILES);
  
	// --- Add - Edit
	if($vars['add_edit']==1):
		if (!isset($vars['msg_id']) || $vars['msg_id'] < 1) {
			$obj = new msg_class();
			$obj->readForm();
			if ((is_null($error)) || ($error == "")) {
				$obj->msg_date = date("Y-m-d");
				$obj->user_sent = $_SESSION['user_id'];
				$obj->user_recevie =  substr($vars['user_rec_str'],0,strlen($vars['user_rec_str'])-1);
				$obj->insertnew();
				$lastID = $obj->getLastID();
				
				$user_rec_arr = explode(',',substr($vars['user_rec_str'],0,strlen($vars['user_rec_str'])-1));
				$obj_msgUser = new msgUser_class();
				
				if(!isset($vars['luunhap'])):
					for($i=0;$i<count($user_rec_arr);$i++):
						$obj_msgUser->msg_id = $lastID;
						$obj_msgUser->user_id = $user_rec_arr[$i];
						$obj_msgUser->insertnew();
					endfor;
					
					for($i=0;$i<count($user_rec_arr);$i++):
						$obj_user = new users_class();
						$obj_user->getDBbyPkey($user_rec_arr[$i]);
						//echo $obj_user->user_phone.'<br>';
						$send_msgs = new php_sms();
						$send_msgs->send_sms(str_replace(' ','',$obj_user->user_phone), fnsSubstr(fnsUnUnicode(str_replace(array('<p>','</p>'),array('',''),$vars['msg_cont']),2),120,0), $vars['com_port']);
						unset($send_msgs);
						unset($obj_user);
					endfor;
					unset($obj);
				endif;
			}
		}else{
			$obj = new msg_class();
			$obj->readForm();
			if ((is_null($error)) || ($error == "")) {
				if(!isset($vars['luunhap'])):
					$user_rec_arr = explode(',',substr($vars['user_rec_str'],0,strlen($vars['user_rec_str'])-1));
					$obj_msgUser = new msgUser_class();
					
					for($i=0;$i<count($user_rec_arr);$i++):
						$obj_msgUser->msg_id = $vars['msg_id'];
						$obj_msgUser->user_id = $user_rec_arr[$i];
						$obj_msgUser->insertnew();
					endfor;
					
					for($i=0;$i<count($user_rec_arr);$i++):
						$obj_user = new users_class();
						$obj_user->getDBbyPkey($user_rec_arr[$i]);
						//echo $obj_user->user_phone.'<br>';
						$send_msgs = new php_sms();
						$send_msgs->send_sms(str_replace(' ','',$obj_user->user_phone), fnsSubstr(fnsUnUnicode(str_replace(array('<p>','</p>'),array('',''),$vars['msg_cont']),2),120,0), $vars['com_port']);
						unset($send_msgs);
						unset($obj_user);
					endfor;
					unset($obj);
				else:
					$obj->msg_date = date("Y-m-d");
					$obj->user_sent = $_SESSION['user_id'];
					if ($obj->is_already_used($obj->tablename, "msg_id", $obj->msg_id)){
						$obj->update();
						unset($obj);
					}
				endif;
			}
		}
	endif;
	
	// --- Get record for edit
	if($vars['edit_me']==1):
	 $obj = new msg_class();
	 $obj->getDBbyPkey($vars['msg_id']);
	 $obj_info = (array)$obj;
	endif;
	
	// --- Get argument of page
	$vars['arg'] = "";
	$vars['arg'] .= $vars['numresult']?"&numresult=".$vars['numresult']:"";
	$vars['arg'] .= $vars['curpage']?"&curpage=".$vars['curpage']:"";
	$vars['arg'] .= trim($vars['KeyWord'])?"&KeyWord=".trim($vars['KeyWord']):"";
	$vars['arg'] .= $vars['order']?"&order=".$vars['order']:""; 
	$vars['arg'] .= trim($vars['mod'])?"&mod=".trim($vars['mod']):"";
	$vars['arg'] .= $vars["type"]?"&type=".$vars["type"]:"";
	
	$assign_list['soan_msg'] 	= $vars['soan_msg'];
	$assign_list['inbox'] 		= $vars['inbox'];
	$assign_list['outbox'] 		= $vars['outbox'];
	$assign_list['drafmsg'] 	= $vars['drafmsg'];
	$assign_list['wastemsg'] 	= $vars['wastemsg'];
	$assign_list['impmsg'] 		= $vars['impmsg'];
	
	$assign_list['obj_info'] 	= $obj_info;
	
	$assign_list["vars"] = $vars;
	$assign_list["error"] = $error;
  	$smarty->assign($assign_list);
    $smarty->display(dirname(__FILE__)."/skin/B_Msg_add.tpl");
?>