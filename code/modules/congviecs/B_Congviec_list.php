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
    require_once($CLASSES_PATH."clsCvPhoihop.php");
    require_once($CLASSES_PATH."clsCvGiamsat.php");
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
	
	// --- Del record which is selected
	if($vars['del_cv_cat']==1 && $vars['dlStr']){
		$obj_cv_cat = new cv_cat_class();
		$obj_cv_cat->removeInList($vars['dlStr']);
		unset($obj_cv_cat);
	}


    if($vars['file_status']==1){
        $obj_cv_cat = new cv_cat_class();
        $obj_cv_cat->update_cvcat_file($vars['cv_cat_id']);
        unset($obj_cv_cat);
    }

	if($vars['update_uutien']==1){
		$obj_cv_cat = new cv_cat_class();
		$obj_cv_cat->update_uutien($vars['cv_cat_id']);
		unset($obj_cv_cat);
	}
	
	if($vars['delete_cv_sub']==1 && $vars['dlStr']){
		$obj_cv_sub = new cv_sub_class();
		$obj_cv_sub->removeInList($vars['dlStr']);
		unset($obj_cv_sub);
	}

    if($vars['delete_cv_ph']==1 && $vars['dlStr']){
        $obj_cv_ph = new cv_phoihop_class();
        $obj_cv_ph->removeInList($vars['dlStr']);
        unset($obj_cv_ph);
    }

    if($vars['delete_cv_gs']==1 && $vars['dlStr']){
        $obj_cv_gs = new cv_giamsat_class();
        $obj_cv_gs->removeInList($vars['dlStr']);
        unset($obj_cv_gs);
    }
	
	if($vars['delete_cv_index']==1 && $vars['dlStr']){
		$obj_cv_index = new cv_index_class();
		$obj_cv_index->removeInList($vars['dlStr']);
		unset($obj_cv_index);
	}
	
	if($vars['delete_cv_log']==1 && $vars['dlStr']){
		$obj_cv_log = new cv_log_class();
		$obj_cv_log->removeInList($vars['dlStr']);
		unset($obj_cv_log);
	}
	
	if($vars['show_luong']==1){
		$obj = new cv_cat_class();
		$obj->getDBbyPkey($vars['cv_cat_id']);
		$obj_info = (array)$obj;
	}
	
	if($vars['update_all_status']==1){
		// ----set log_active = 1
		$sql_log = "update tbl_cv_logs set cv_log_active = 1 where cv_log_id = ".$vars['cv_log_id'];
		mysql_query($sql_log) or die($sql_log);
		// ---- lay tong so log
		$sql_count_log = "select count(cv_log_id) as count_log from tbl_cv_logs where cv_index_id = ".$vars['cv_index_id'];
		$result_count_log = mysql_query($sql_count_log) or die($sql_count_log);
		if($result_count_log) $row_count_log = mysql_fetch_array($result_count_log);
		// --- lay tong so log da xong
		$sql_count_log_done = "select count(cv_log_id) as count_log_done from tbl_cv_logs where cv_log_active = 1 and cv_index_id = ".$vars['cv_index_id'];
		$result_count_log_done = mysql_query($sql_count_log_done) or die($sql_count_log_done);
		if($result_count_log_done) $row_count_log = mysql_fetch_array($result_count_log_done);
		// --- so sanh 2 so log
		if($row_count_log['count_log_done'] == $row_count_log['count_log']):
			// --- neu 2 so log bang nhau thi update index_active = 1
			$sql_index = "update tbl_cv_indexs set cv_index_active = 1 where cv_index_id = ".$vars['cv_index_id'];
			mysql_query($sql_index) or die($sql_index);
			// ---- lay tong so index
			$sql_count_index = "select count(cv_index_id) as count_index from tbl_cv_indexs where cv_sub_id = ".$vars['cv_sub_id'];
			$result_count_index = mysql_query($sql_count_index) or die($sql_count_index);
			if($result_count_index) $row_count_index = mysql_fetch_array($result_count_index);
			// ---- lay tong so index da xong
			$sql_count_index_done = "select count(cv_index_id) as count_index_done from tbl_cv_indexs where cv_index_active = 1 and cv_sub_id = ".$vars['cv_sub_id'];
			$result_count_index_done = mysql_query($sql_count_index_done) or die($sql_count_index_done);
			if($result_count_index_done) $row_count_index = mysql_fetch_array($result_count_index_done);
			// --- so sanh 2 so index
			if($row_count_index['count_index_done'] == $row_count_index['count_index']):
			// --- neu 2 so index bang nhau thi update sub_active = 1
				$sql_sub = "update tbl_cv_subs set cv_sub_active = 1 where cv_sub_id = ".$vars['cv_sub_id'];
				mysql_query($sql_sub) or die($sql_sub);
				
				// ---- lay tong so sub
				$sql_count_sub = "select count(cv_sub_id) as count_sub from tbl_cv_subs  where cv_cat_id = ".$vars['cv_cat_id'];
				$result_count_sub = mysql_query($sql_count_sub) or die($sql_count_sub);
				if($result_count_sub) $row_count_sub = mysql_fetch_array($result_count_sub);
				// ---- lay tong so sub da xong
				$sql_count_sub_done = "select count(cv_sub_id) as count_sub_done from tbl_cv_subs where cv_sub_active = 1 and cv_cat_id = ".$vars['cv_cat_id'];
				$result_count_sub_done = mysql_query($sql_count_sub_done) or die($sql_count_sub_done);
				if($result_count_sub_done) $row_count_sub = mysql_fetch_array($result_count_sub_done);
				// --- so sanh 2 so sub
				if($row_count_sub['count_sub_done'] == $row_count_sub['count_sub']):
				// --- neu 2 so sub bang nhau thi update cat_active = 1
					$sql_cat = "update tbl_cv_cats set cv_cat_active = 1 where cv_cat_id = ".$vars['cv_cat_id'];
					mysql_query($sql_cat) or die($sql_cat);
				endif;
				
			endif;
			
		endif;
		
	}
	
		 	 		
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
	
	$assign_list['cv_cat_id'] 		= (int)$vars['cv_cat_id'];
	$assign_list['cv_cat_type'] 	= (int)$vars['cv_cat_type'];
	$assign_list['cv_cat_name_fs'] = htmlspecialchars($vars['cv_cat_name_fs']);
    $assign_list['tinhtrangcv_fil'] = (int)$vars['tinhtrangcv_fil'];
	
	$assign_list['total_num_result'] = $total_num_result;
	$assign_list['processurl'] 	= $processurl;
	$assign_list['vars'] 		= $vars;
	$assign_list['obj_info'] 	= $obj_info;
	
	$display = dirname(__FILE__)."/skin/B_Congviec_tbl.tpl";
	$assign_list['display'] = $display;
	
	$smarty->assign($assign_list);
	
	// --- Display template
	if (isset($vars['activeAjax']))
	$smarty->display(dirname(__FILE__)."/skin/B_Congviec_tbl.tpl");
	else
	$smarty->display(dirname(__FILE__)."/skin/B_Congviec_list.tpl");
?>