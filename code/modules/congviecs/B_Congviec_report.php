<?php
	/*-------------------------------------------
	- PHP Frame work
	- Created by Le Anh Van - anhvan3103@gmail.com
	--------------------------------------------*/
	if (!isset($key)){
	// Error: no category chosen
	redirect("index.php");
	} 
	
	// --- File is included ---
	require_once($CLASSES_PATH."clsCvCats.php");
	require_once($CLASSES_PATH."clsCvSubs.php");
	require_once($CLASSES_PATH."clsCvIndexs.php");
	require_once($CLASSES_PATH."clsCvLogs.php");
	
	// --- Class is used in this page
	$vars = array_merge($_POST, $_GET);
	$obj = new cv_cat_class();
	
	// --- Variables is used in this page
	$processurl = "?listCvCat&mod=congviecs";
	$processurl .= trim($vars['cv_cat_type'])?"&cv_cat_type=".$vars['cv_cat_type']:"";
	$processurl .= trim($vars['cv_cat_name_fs'])?"&cv_cat_name_fs=".trim($vars['cv_cat_name_fs']):"";
	
	// --- bo loc
	$char_arr = array('---','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z');
	
	// --- prepare to query
	$where = "";
	$where .= " 1 = 1";
	if (isset($vars['cv_cat_name_fs']) && trim($vars['cv_cat_name_fs']) != '---') $where .= " AND cv_cat_name LIKE '".trim($vars['cv_cat_name_fs'])."%'";
	// --- get data to view
	$obj_list = $obj->getDBList($where, "cv_cat_name asc", "" , " ");
	$total_num_result = $obj->getRowNumber($where);
	
	$obj = new cv_cat_class();
	$obj->getDBbyPkey($vars['cv_cat_id']);
	$obj_info = (array)$obj;
		 	 		
	// --- send argument to next page
	$vars['arg'] = "";
	$vars['arg'] .= $vars['numresult']?("&numresult=".$vars['numresult']):"";
	$vars['arg'] .= $vars['curpage']?("&curpage=".$vars['curpage']):"";
	$vars['arg'] .= $vars['mod']?("&mod=".$vars['mod']):"";
	$vars['arg'] .= $vars['cv_cat_type']?("&cv_cat_type=".$vars['cv_cat_type']):"";
	$vars['arg'] .= $vars['cv_cat_name_fs']?("&cv_cat_name_fs=".$vars['cv_cat_name_fs']):"";
	
	// --- Assign data to template
	$assign_list['obj_list'] 	= $obj_list;
	$assign_list['obj_list_dl'] = $obj_list_dl;
	$assign_list['total_dl'] 	= $total_dl;
	$assign_list['char_arr'] 	= $char_arr;
	
	$assign_list['cv_cat_id'] 		= $vars['cv_cat_id'];
	$assign_list['cv_cat_type'] 	= $vars['cv_cat_type'];
	$assign_list['cv_cat_name_fs'] = $vars['cv_cat_name_fs'];
	
	$assign_list['total_num_result'] = $total_num_result;
	$assign_list['processurl'] 	= $processurl;
	$assign_list['vars'] 		= $vars;
	$assign_list['obj_info'] 	= $obj_info;
	
	$display = dirname(__FILE__)."/skin/B_Congviec_report.tpl";
	$assign_list['display'] = $display;
	
	$smarty->assign($assign_list);
	
	// --- Display template
	if (isset($vars['activeAjax']))
	$smarty->display(dirname(__FILE__)."/skin/B_Congviec_report.tpl");
	else
	$smarty->display(dirname(__FILE__)."/skin/B_Congviec_list.tpl");
?>