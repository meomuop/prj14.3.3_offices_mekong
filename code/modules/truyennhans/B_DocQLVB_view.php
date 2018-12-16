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
	require_once($CLASSES_PATH."clsDocOuts.php"); 
	require_once ($CLASSES_PATH.'clsDocCats.php');
	require_once ($CLASSES_PATH.'clsDocFields.php');
	require_once ($CLASSES_PATH.'clsDocLevels.php');
	 
	require_once($CLASSES_PATH."clsUnits.php");
	require_once($CLASSES_PATH."clsUsers.php");
	
	require_once ($CLASSES_PATH.'clsDocOutFiles.php');
	
	// --- Variables is used in this page
	$assign_list = array();
	$vars = array_merge($_POST,$_GET, $_FILES);
	if(!$vars['mod']) $vars['mod'] = 'docs';
	
	$arg['arg'] = "";
	if($vars["curpage"]) 		$arg['arg'] = $arg['arg']."&curpage=".$vars["curpage"];
	if($vars["numresult"]) 		$arg['arg'] = $arg['arg']."&numresult=".$vars["numresult"];
	if(trim($vars['KeyWord'])) 	$arg['arg'] = $arg['arg']."&KeyWord=".trim($vars['KeyWord']);
	if($vars["order"]) 			$arg['arg'] = $arg['arg']."&order=".$vars["order"];
	if(trim($vars['mod'])) 		$arg['arg'] = $arg['arg']."&mod=".trim($vars['mod']);
	if($vars["id"]) 			$arg['arg'] = $arg['arg']."&id=".$vars["id"];
	if($vars["finish"]) 		$arg['arg'] = $arg['arg']."&finish=".$vars["finish"];
	
	$finish = $vars["finish"];
	
	// --- Get doc out file list
	$obj_docOutFile		= new docOutFile_class();
	$where_docOutFile 		= " 1 = 1 and docOut_id = ".$vars['docOut_id'];
	$obj_list_docOutFile	= $obj_docOutFile->getDBList(" $where_docOutFile", "docOutFile_name asc", FALSE, "");
		
	$obj = new docOut_class();
	$obj->getDBbyPkey($vars['docOut_id']);
	if (!$obj->docOut_id) redirect("?listDocOut".$arg['arg']);
	$vars = (array)$obj;
	unset($obj);
	
	// --- Get doc categories list
	$obj_dcat = new docCat_class();
	$where_dcat 		= " 1 = 1 and docCat_active=1";
	$obj_list_dcat 	= $obj_dcat->getDBList(" $where_dcat", "docCat_name", FALSE, "");
	
	// --- Get doc field list
	$obj_dfield = new docField_class();
	$where_dfield 		= " 1 = 1 and docField_active=1";
	$obj_list_dfield 	= $obj_dfield->getDBList(" $where_dfield", "docField_name", FALSE, "");
		
	// --- Get doc department list
	$obj_department = new department_class();
	$where_department 		= " 1 = 1 and department_active=1 and (department_type=1 or department_type=3)";
	$obj_list_department	= $obj_department->getDBList(" $where_department", "department_name", FALSE, "");
	
	// --- Get user level 2,3 list
	$obj_user 		= new users_class();
	$where_user 		= " 1 = 1 and user_active=1 and user_level in(1,2,9)";
	$obj_list_user	= $obj_user->getDBList(" $where_user", "user_name", FALSE, "");
	
	// --- Get user level 3,4,5 list
	$obj_user_bgd 		= new users_class();
	$where_user_bgd		= " 1 = 1 and user_active=1 and user_level=4 or user_level=5 or user_level=3";
	$obj_list_user_bgd	= $obj_user_bgd->getDBList(" $where_user_bgd", "user_name", FALSE, "");	
	
	 // --- Assign data to template
	$assign_list["vars"] = $vars;
	
	$assign_list['obj_list_dcat'] = $obj_list_dcat;
	$assign_list['obj_list_dfield'] = $obj_list_dfield;
	$assign_list['obj_list_user'] = $obj_list_user;
	$assign_list['obj_list_user_bgd'] = $obj_list_user_bgd;
	$assign_list['obj_list_department'] = $obj_list_department;
	$assign_list['obj_list_docOutFile'] = $obj_list_docOutFile;
	
	$assign_list["arg"] = $arg;
	$assign_list["error"] = $error;
	
	$display = dirname(__FILE__)."/skin/B_DocQLVB_view.tpl";
	$assign_list['display'] = $display;
	
	$smarty->assign($assign_list);
	
	// --- Display template
	if (isset($vars['activeAjax']))
	$smarty->display(dirname(__FILE__)."/skin/B_DocQLVB_view.tpl");
	else
	$smarty->display(dirname(__FILE__)."/skin/B_Doc_list.tpl");
?>