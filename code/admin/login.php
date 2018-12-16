<?php
/*
 * Created on Mar 28, 2007
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
 ini_set('display_errors',0);
 require_once("../includes/ad_requires.php");
 require_once($CLASSES_PATH."clsUsers.php");

 $vars = array_merge($_POST, $_GET);
 
 if (isset($_SESSION["user_id"])) {
 	redirect("index.php");	
 }
 
 $admin = new users_class();

 if (isset($vars["login"])) { 
	 $admin->user_name = $vars['user_name'];
	 $admin->user_pass = md5($vars['user_pass']);
	 $is_login = $admin->DoLogin();
	 
	 if ($is_login == 1) {
		redirect("index.php");	
	 } elseif ($is_login == 0) {
		$error = "Không có tài khoản trong hệ thống hoặc tài khoản chưa kích hoạt";
		//redirect("login.php");
	 } elseif ($is_login == 2) {
		//redirect("login.php");
	 }
     //echo $is_login;
 }	 
 
 if($vars['signed']==1) $msg = "Qúy vị đã đăng ký thành công, hãy chờ quản trị kích hoạt tài khoản để sử dụng";

 $assign_list["title"] = "Đăng nhập hệ thống";
 
 $assign_list["error"] = $error;
 $assign_list["msg"]   = $msg;
 $assign_list['http_root'] = $http_root;
	
 $assign_list["vars"]  = $vars;
 $smarty->assign($assign_list);
 $smarty->display("login.tpl");

