<?php
	//PHP Frame work
  	//Rev 2007.01.15 _ thuyta
  	//Copyright 2007-2008 by VietBaby Comp. All Rights Reserved.
	
   	session_start(); 
   	// includes path
	define('TBL', "tbl_");
    define('ROOT_DIR', ".");
    require_once(ROOT_DIR."/includes/config.php");
	
	$COMMON_PATH	= ROOT_DIR."/common/"; 
	$INCLUDE_PATH	= ROOT_DIR."/includes/"; 
	$CLASSES_PATH	= ROOT_DIR."/classes/";
	$IMAGE_PATH		= ROOT_DIR."/images/";
	$TEMPLATE_PATH	= ROOT_DIR."/templates/";
	$TEMPLATE_USER_PATH	= ROOT_DIR."/templates/default/";
	$SMARTY_PATH 	= ROOT_DIR."/includes/library/Smarty/"; 
	$SECURITY_PATH	= ROOT_DIR."/security/";
	$RSS_PATH		= ROOT_DIR."/Connections/";
   
   	require_once($INCLUDE_PATH."dbfunc.php");
   	require_once($CLASSES_PATH."dbBasic.php");
   	require_once($CLASSES_PATH."clsMail.php");	
   	require_once($CLASSES_PATH."clsMime.php");		
   	require_once($INCLUDE_PATH."rsSession.php");
   	require_once($INCLUDE_PATH."rsCookie.php");
   	require_once($INCLUDE_PATH."functions_r.php");
   	require_once($INCLUDE_PATH."common.php");
	
	require_once($SMARTY_PATH."Smarty.class.php");
	//initialize smarty
   	$smarty = new Smarty;
   	$smarty->compile_dir = ROOT_DIR."/template_c";
   	$smarty->template_dir = ROOT_DIR."/templates";
   	$smarty->left_delimiter = '{';
   	$smarty->right_delimiter = '}';
   
   	//start up session
   	//rsSessionSetup();
   	//rsSessionInit();
	
   	$CSS	= $http_root."/css/default.css";
   //$dbconn->debug = true;
/*	function rsprint($var){
		print "<pre>";
		print_r($var);
		print "</pre>";
	}
*/?>