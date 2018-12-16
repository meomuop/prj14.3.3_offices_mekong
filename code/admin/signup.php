<?php
/*
- PHP Frame work
- Created by Le Anh Van - anhvan3103@gmail.com
 */
	require_once("../includes/ad_requires.php");
	require_once($CLASSES_PATH."clsUsers.php");
	require_once($CLASSES_PATH."clsModule.php");
	require_once($CLASSES_PATH."clsDepartments.php");
	require_once($CLASSES_PATH."clsObjects.php");
	
	$vars = array_merge($_POST, $_GET);	
		
	if (isset($vars['submitUser'])) {
		if (md5($vars['user_pass']) != md5($vars['userPassConfirm'])) {
			$error = "Xác định mật khẩu không chính xác! ";
		}elseif ($vars['user_phone']=="") {
			$error = "Bạn chưa nhập số điện thoại! ";
		}elseif (strlen($vars['user_pass'])<6 || strlen($vars['user_pass'])>20) {
			$error = "Độ dài mật khẩu cần nằm trong khoảng từ 6 đến 20 ký tự! ";
		} else {	
			$users = new users_class();
			$users->readForm();
			$error = $users->checkForm();
			if ((is_null($error)) || ($error == "")) {
				$users->user_pass = md5($vars['user_pass']);
				$users->user_encode_pass = $vars['user_pass'];
				$users->user_level = 8;
				$users->insertnew();
				unset($users);
				redirect("login.php?signed=1");
			}
		}
	}
			 
	// --- Get department list
	$obj_department 		= new department_class();
	$where_department 		= " 1 = 1 and department_active=1";
	$obj_list_department	= $obj_department->getDBList(" $where_department", "department_name", FALSE, "");
	 
	// --- Get object list
	$obj_object 		= new object_class();
	$where_object 		= " 1 = 1 and object_active=1";
	$obj_list_object 	= $obj_object->getDBList(" $where_object", "object_name", FALSE, "");
	
	$assign_list["title"] = "Đăng ký tài khoản";
	$assign_list["error"] = $error;
	$assign_list["vars"]  = $vars;
	
	$assign_list['module_list'] 	= $module_list;
	$assign_list['obj_list_department'] = $obj_list_department;
	$assign_list['obj_list_object'] = $obj_list_object;
  	$smarty->assign($assign_list);

	$smarty->display("signup.tpl"); 
	
