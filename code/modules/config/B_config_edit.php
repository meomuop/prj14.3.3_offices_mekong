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
	
	// --- Class is used in this page
	require_once($CLASSES_PATH."clsConfig.php"); 
	require_once($CLASSES_PATH."clsHolidays.php"); 
	require_once($CLASSES_PATH."clsPorts.php"); 
	
	// --- Variables is used in this page
	$assign_list = array();
	$vars = array_merge($_POST,$_GET, $_FILES);
	
	$processurl = "?editConfig&mod=config";
	
	// --- Del items which is selected
	$delstr=$vars['dlStr'];
	if ($vars['dlStr']){
		$obj = new holiday_class();
		$obj->removeInList($vars['dlStr']);
		unset($obj);
	}
	
	// --- action is process
	if(isset($vars["config_id"])){
		$obj = new config_class();
		// prepare data
		$obj->readForm();
		if ($obj->is_already_used($obj->tablename, "config_id", $obj->config_id)){
            $obj->ngay_macdinh = date('Y-m-d',strtotime(str_replace('/','-',$vars['ngay_macdinh'])));
			$obj->update();
			unset($obj);
		}else{
			$assign_list['error'] = $obj->error;
		}
		unset($obj);
	}
	
	// --- Get argument of page
	$arg = "";
	$arg .= $vars['numresult']?"&numresult=".$vars['numresult']:"";
	$arg .= $vars['curpage']?"&curpage=".$vars['curpage']:"";
	$arg .= trim($vars['mod'])?"&mod=".trim($vars['mod']):"";
	
	$obj = new config_class();
	$obj->getDBbyPkey(1);
	if (!$obj->config_id){ 
		unset($obj);
		redirect("?Config&mod=config".$arg);
	}
	else
		$vars = (array)$obj;
		
	$vars['arg'] = $arg;
	unset($obj);
	
	if (!(int)$vars['curpage']){
	$vars['curpage'] = 1;
	}else{
	$vars['arg'] .= "&curpage=".$vars['curpage']."&numresult=".$vars['numresult'];
	} 
	$vars['numresult'] = (int)$vars['numresult']?(int)$vars['numresult']:10;
	$cur_pos = ($vars['curpage'] - 1) * $vars['numresult'];
	$order_id = (int)$vars['order'];
	
	$limit = " LIMIT ".(string)$cur_pos.", ".(int)$vars['numresult'];

	$obj = new holiday_class();
	$where = " 1 = 1";
	$obj_list = $obj->getDBList(" $where", "", FALSE, "");
	$total_num_result = $obj->getRowNumber("$where");
	$num_page = ceil($total_num_result/$vars['numresult']);
	
	$obj_port = new port_class();
	$where_port = " 1 = 1";
	$obj_list_port = $obj_port->getDBList(" $where_port", "", FALSE, "");
	
	$assign_list["obj_list"] 		= $obj_list; 
	$assign_list["obj_list_port"] 	= $obj_list_port; 
	$assign_list['pager_str'] 		= $pager_str;
	$assign_list["parentArr"] 		= $parentArr; 
	$assign_list['nrs_arr'] 		= $nrs_arr;
	$assign_list['total_num_result'] = $total_num_result;
	$assign_list['order_arr'] 		= $order_arr;
	$assign_list['processurl'] 		= $processurl;
	$assign_list['vars'] 			= $vars;
	
	$display = dirname(__FILE__)."/skin/B_config_edit.tpl";
	$assign_list['display'] = $display;
	
	$smarty->assign($assign_list);
	
	// --- Display template
	if (isset($delstr)):
	$smarty->display(dirname(__FILE__)."/skin/B_config_edit.tpl");
	else:
	$smarty->display(dirname(__FILE__)."/skin/B_config_list.tpl");
	endif;
?>