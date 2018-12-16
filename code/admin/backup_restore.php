<?php
/*
 * Created on Mar 28, 2007
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
 require_once("../includes/login_requires.php");

 $assign_list["title"] = "Đăng nhập hệ thống";
 
 $assign_list["error"] = $error;
 $assign_list["reload"] = $_GET['reload'];
 $assign_list["msg"]   = $msg;
 $assign_list['http_root'] = $http_root;
	
 $assign_list["vars"]  = $vars;
 $smarty->assign($assign_list);
 $smarty->display("backup_restore.tpl"); 

