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

	// ------------------------------
    include ($CLASSES_PATH.'/hopdong/clsHdmuaLkvb.php');
    include ($CLASSES_PATH.'/hopdong/clsHdmua.php');
    include ($CLASSES_PATH.'/hopdong/clsHdmuaTientrinh.php');

	// --- Variables is used in this page
	$order_arr = array(0 => "Mới đến cũ", 1 => "Cũ đến mới");
	$nrs_arr = array(5,10, 20, 30, 40, 50, 100, 150, 200);
	$vars = array_merge($_POST, $_GET);
	
	if(!$vars['mod']) $vars['mod'] = 'hdmua';

	$processurl = "?listHdmuaLkvb&mod=hdmua";
    $processurl .= trim($vars['hdmua_id'])?"&hdmua_id=".trim($vars['hdmua_id']):"";

	// --- Condition
	$where = " 1 = 1";
	// --- Get data to view in homepage
    if ($vars['hdmua_id']):
        $where .= " AND hdmua_id = ".$vars['hdmua_id']."";
    endif;
	
	$obj = new hdmuaLkvb_class();
	$obj_list = $obj->getDBList(" $where", " lkvb_id ASC", FALSE, '');
	$total_num_lkvb = $obj->getRowNumber("$where");

    $obj_tt = new hdmuaTientrinh_class();
    $obj_list_tt = $obj_tt->getDBList(" $where", " tientrinh_id ASC", FALSE, '');
    $total_row_tt = $obj_tt->getRowNumber("$where");

    // --- Get hdmua list
    $obj_hdmua = new hdmua_class();
    $obj_hdmua->getDBbyPkey($vars['hdmua_id']);
    $hdmua_info = (array)$obj_hdmua;
	
	// ------ Print paging ---------
	$pager_str = get_paging_string($processurl, $vars['curpage'], $num_page);
	
	// --- Debug here ----
	unset($obj);
	
	// --- Get argument of page
	$vars['arg'] = "";
	$vars['arg'] .= $vars['numresult']?"&numresult=".$vars['numresult']:"";
	$vars['arg'] .= $vars['curpage']?"&curpage=".$vars['curpage']:"";
	$vars['arg'] .= $vars['order']?"&order=".$vars['order']:"";
	$vars['arg'] .= $vars['mod']?("&mod=".$vars['mod']):"";
    $vars['arg'] .= $vars['hdmua_id']?("&hdmua_id=".$vars['hdmua_id']):"";

	// permissions
	$per_add 	= 1;
	$per_edit 	= 1;
	$per_del 	= 1;
	$per_act 	= 1;
	
	// --- Assign data to template
	$assign_list = array();
	
	$assign_list['per_add'] 	= $per_add;
	$assign_list['per_edit'] 	= $per_edit;
	$assign_list['per_del'] 	= $per_del;
	$assign_list['per_act'] 	= $per_act;
	
	$assign_list['obj_list'] 		= $obj_list;
    $assign_list['total_row_lkvb']  = $total_row_lkvb;
    $assign_list['obj_list_tt'] 	= $obj_list_tt;
    $assign_list['total_row_tt']    = $total_row_tt;
	
	$assign_list['hdmua_id'] 		= $vars['hdmua_id'];
    $assign_list['hdmua_info'] 		= $hdmua_info;

	
	$assign_list['pager_str'] 	= $pager_str;
	$assign_list["parentArr"] 	= $parentArr; 
	$assign_list['nrs_arr'] 	= $nrs_arr;

	$assign_list['processurl'] 	= $processurl;
	$assign_list['vars'] 		= $vars;
	$assign_list['error'] 		= $error;

	$display = dirname(__FILE__)."/skin/B_Hdmua_view.tpl";
	$assign_list['display'] = $display;
	
	$smarty->assign($assign_list);
	
	// --- Display template
	if (isset($vars['activeAjax']))
	$smarty->display(dirname(__FILE__)."/skin/B_Hdmua_view.tpl");
	else
	$smarty->display(dirname(__FILE__)."/skin/B_Hdmua_list.tpl");
