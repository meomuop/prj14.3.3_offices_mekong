<?php
/*
- PHP Frame work
- Created by Le Anh Van - anhvan3103@gmail.com
 */
 	ini_set('display_errors',0);
	require_once("../includes/ad_requires.php");
	require_once($CLASSES_PATH."clsUsers.php");
	require_once($CLASSES_PATH."clsModule.php");
	require_once($CLASSES_PATH."clsDepartments.php");
	require_once($CLASSES_PATH."clsObjects.php");
	
	$vars = array_merge($_POST, $_GET);	
		
	if ($vars['add_edit']==1) {
		$users = new users_class();
		$cur_pass = $users->getpassword($_SESSION["user_id"]);
		if($cur_pass == md5($vars['user_cur_pass'])):
			$users->updatePass($_SESSION["user_id"],$vars['user_pass']);
			echo 1; die;
		else:
			echo 0; die;
		endif;
		unset($users);
	}
	
	if((int)$vars['user_id']):
		$obj = new users_class();
		$obj->getDBbyPkey($vars['user_id']);
		if (!$obj->user_id) redirect("?listUser".$arg['arg']);
		$obj_info = (array)$obj;
	endif;
			 
	$assign_list["title"] = "Đăng ký tài khoản";
	$assign_list["error"] = $error;
	$assign_list["vars"]  = $vars;
	
	$assign_list['user_id'] 	= $vars['user_id'];
	$assign_list['obj_info'] 	= $obj_info;
  	$smarty->assign($assign_list);

	$smarty->display("changepass.tpl"); 
	
