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
	require_once($CLASSES_PATH."clsDocDT.php"); 
	require_once ($CLASSES_PATH.'clsDocCats.php');
	 
	require_once($CLASSES_PATH."clsUsers.php");
	
	require_once ($CLASSES_PATH.'clsDocDTFiles.php');
	
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
	$obj_docDTFile		= new docDTFile_class();
	$where_docDTFile 		= " 1 = 1 and docDT_id = ".$vars['id'];
	$obj_list_docDTFile	= $obj_docDTFile->getDBList(" $where_docDTFile", "docDTFile_name asc", FALSE, "");
		
	$obj = new docDT_class();
	$obj->getDBbyPkey($vars['docDT_id']);
	if (!$obj->docDT_id) redirect("?listDocDT".$arg['arg']);
	$vars = (array)$obj;
	unset($obj);
	
	// --- Get doc categories list
	$obj_dcat = new docCat_class();
	$where_dcat 		= " 1 = 1 and docCat_active=1";
	$obj_list_dcat 	= $obj_dcat->getDBList(" $where_dcat", "docCat_name", FALSE, "");

	// --- Get doc department list
	$obj_department = new department_class();
	$where_department 		= " 1 = 1 and department_active=1 and (department_type=1 or department_type=3)";
	$obj_list_department	= $obj_department->getDBList(" $where_department", "department_name", FALSE, "");
	
	// --- Get user level 2,3 list
	$obj_user 		= new users_class();
	$where_user 		= " 1 = 1 and user_active=1 and user_level in(1,2,9)";
	$obj_list_user	= $obj_user->getDBList(" $where_user", "user_name", FALSE, "");

	 // --- Assign data to template
	$assign_list["vars"] = $vars;
	
	$assign_list['obj_list_dcat'] = $obj_list_dcat;
	$assign_list['obj_list_user'] = $obj_list_user;
	$assign_list['obj_list_department'] = $obj_list_department;
	$assign_list['obj_list_docDTFile'] = $obj_list_docDTFile;
	
	$assign_list['finish'] = $finish;
			
	$assign_list["arg"] = $arg;
	$assign_list["error"] = $error;
	$smarty->assign($assign_list);
	$smarty->display(dirname(__FILE__)."/skin/B_DocDT_view.tpl");
?>