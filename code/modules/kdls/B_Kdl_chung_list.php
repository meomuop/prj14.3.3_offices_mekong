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
	require_once($CLASSES_PATH."clsKdls.php");
	require_once($CLASSES_PATH."clsDls.php");
	
	// --- Class is used in this page
	$vars = array_merge($_POST, $_GET);
	$obj = new kdl_class();
	
	// --- Variables is used in this page
	$processurl = "?listKdl&mod=kdls";
	$processurl .= trim($vars['kdl_type'])?"&kdl_type=".$vars['kdl_type']:"";
	$processurl .= trim($vars['kdl_name_fs'])?"&kdl_name_fs=".trim($vars['kdl_name_fs']):"";
	
	// --- bo loc
	$char_arr = array('---','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z');
	
	// --- prepare to query
	$where = "";
	$where .= " 1 = 1 and kdl_type = ".$vars['kdl_type'];
	if (isset($vars['kdl_name_fs']) && trim($vars['kdl_name_fs']) != '---') $where .= " AND kdl_name LIKE '".trim($vars['kdl_name_fs'])."%'";
	
	if($vars['kdl_type']==3) $where .= " AND user_id LIKE '".$_SESSION['user_id']."%'";
	
	// --- get data to view
	$obj_list = $obj->getDBList($where, "kdl_name asc", "" , " ");
	$total_num_result = $obj->getRowNumber($where);
	
	// --- Del record which is selected
	if ($vars['del_dl']==1 && $vars['dlStr']){
		$obj_dl = new dl_class();
		$obj_dl->removeInList($vars['dlStr']);
		unset($obj_dl);
	}
	
	if ($vars['del_kdl']==1 && $vars['dlStr']){
		$obj_kdl = new kdl_class();
		$obj_kdl->removeInList($vars['dlStr']);
		unset($obj_kdl);
	}
		 
	// --- Get dl fields list
	if ($vars['kdl_id']):
		$obj_dl 		= new dl_class();
		$where_dl 		= " 1 = 1 and dl_active=1";
		$where_dl .= " AND kdl_id = ".$vars['kdl_id']."";
		if ($vars['keyword']) 	$where_dl .= " AND dl_name regexp binary '".$vars['keyword']."'";
		$obj_list_dl	= $obj_dl->getDBList(" $where_dl", "dl_name", FALSE, "");
		$total_dl 		= $obj_dl->getRowNumber($where_dl);
	endif;
	 		
	// --- send argument to next page
	$vars['arg'] = "";
	$vars['arg'] .= $vars['numresult']?("&numresult=".$vars['numresult']):"";
	$vars['arg'] .= $vars['curpage']?("&curpage=".$vars['curpage']):"";
	$vars['arg'] .= $vars['mod']?("&mod=".$vars['mod']):"";
	$vars['arg'] .= $vars['kdl_type']?("&kdl_type=".$vars['kdl_type']):"";
	$vars['arg'] .= $vars['kdl_name_fs']?("&kdl_name_fs=".$vars['kdl_name_fs']):"";
	
	// --- Assign data to template
	$assign_list['obj_list'] 	= $obj_list;
	$assign_list['obj_list_dl'] = $obj_list_dl;
	$assign_list['total_dl'] 	= $total_dl;
	$assign_list['char_arr'] 	= $char_arr;
	
	$assign_list['kdl_id'] 		= $vars['kdl_id'];
	$assign_list['kdl_type'] 	= $vars['kdl_type'];
	$assign_list['kdl_name_fs'] = $vars['kdl_name_fs'];
	
	$assign_list['total_num_result'] = $total_num_result;
	$assign_list['processurl'] 	= $processurl;
	$assign_list['vars'] 		= $vars;
	
	$display = dirname(__FILE__)."/skin/B_Kdl_chung_tbl.tpl";
	$assign_list['display'] = $display;
	
	$smarty->assign($assign_list);
	
	// --- Display template
	if (isset($vars['activeAjax']))
	$smarty->display(dirname(__FILE__)."/skin/B_Kdl_chung_tbl.tpl");
	else
	$smarty->display(dirname(__FILE__)."/skin/B_Kdl_list.tpl");
?>