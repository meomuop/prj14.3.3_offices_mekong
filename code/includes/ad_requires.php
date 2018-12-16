<?php
	//PHP Frame work
	
   	session_start(); 
   	// includes path
   
    define('TBL', "tbl_");
    define('ROOT_DIR', "..");
    require_once(ROOT_DIR."/includes/config.php");
	
	$COMMON_PATH	= ROOT_DIR."/common/";
	$INCLUDE_PATH	= ROOT_DIR."/includes/";
	$LIBS_PATH		= ROOT_DIR."/includes/library/";
	$CLASSES_PATH	= ROOT_DIR."/classes/";
	$CLASSES_TNVB	= ROOT_DIR."/classes_truyennhan/";
	$IMAGE_PATH		= ROOT_DIR."/images/";
	$TEMPLATE_PATH	= ROOT_DIR."/templates/admin/";
	$SMARTY_PATH 	= ROOT_DIR."/includes/library/Smarty/"; 
	$MODULE_PATH	= ROOT_DIR."/modules/";
	
	// Define default of site
	$TEMPLATE_DEFAULT = "";
	$STYLE_DEFAULT = "";
   
   	require_once($INCLUDE_PATH."dbfunc.php");
   	require_once($INCLUDE_PATH."rsSession.php");
   	require_once($INCLUDE_PATH."rsCookie.php");
   	require_once($INCLUDE_PATH."functions_r.php");
	require_once($INCLUDE_PATH."smsmodule.php");
   	require_once($INCLUDE_PATH."image.inc");

	require_once($SMARTY_PATH."Smarty.class.php");   	
   	
   	// Require class is need for showroom
   	require_once($CLASSES_PATH."dbBasic.php");
 	//$dbconn->debug = true;
	//initialize smarty
   	$smarty = new Smarty;

   	$smarty->compile_dir = ROOT_DIR."/template_c";
   	$smarty->template_dir = $TEMPLATE_PATH;
   	$smarty->left_delimiter = '{';
   	$smarty->right_delimiter = '}';	
   	   	
   	require_once($INCLUDE_PATH."ad_common.php");
    
?>