﻿<?php
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
    include ($CLASSES_PATH.'/hopdong/clsHdban.php');
    include ($CLASSES_PATH.'/hopdong/clsKhachhang.php');
    include ($CLASSES_PATH.'/hopdong/clsDvtiente.php');

	// --- Class is used in this page
	$obj = new hdban_class();

	// --- Variables is used in this page
	$order_arr = array(0 => "Hợp đồng mới", 1 => "Đang thực hiện", 2 => "Đã hoàn thành", 3 => "Đã hủy");
	$nrs_arr = array(5,10, 20, 30, 40, 50, 100, 150, 200);
	$vars = array_merge($_POST, $_GET);
	
	if(!$vars['mod']) $vars['mod'] = 'hdban';

	$processurl = "?listHdban&mod=hdban";
	
	// --- Condition
    $where = " 1 = 1";
    if ($vars['tungay']) 	$where .= " AND hdban_ngayhd >= '".$vars['tungay']."'";
    if ($vars['denngay']) 	$where .= " AND hdban_ngayhd <= '".$vars['denngay']."'";
    if ($vars['department_fil']) 	$where .= " AND department_id = '".$vars['department_fil']."'";
    if ($vars['tinhtrang_fil']) 	$where .= " AND hdban_tinhtrang = '".$vars['tinhtrang_fil']."'";

	$obj = new hdban_class();
	$obj_list = $obj->getDBList(" $where", "hdban_id DESC", FALSE, $limit);
	$total_num_result = $obj->getRowNumber("$where");

	// --- Debug here ----
	unset($obj);

    // --- export
    if($vars['exptype']==2):
        header("Content-Type: application/vnd.ms-excel");
        header("Expires: 0");
        header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
        header("content-disposition: attachment;filename=Hopdong_Ban_".date('d-m-Y').".xls");
    elseif($vars['exptype']==1):
        header("Content-Type: application/vnd.ms-word");
        header("Expires: 0");
        header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
        header("content-disposition: attachment;filename=Hopdong_Ban_".date('d-m-Y').".doc");
    endif;
	
	// --- Get argument of page
	$vars['arg'] = "";
	$vars['arg'] .= $vars['numresult']?"&numresult=".$vars['numresult']:"";
	$vars['arg'] .= $vars['mod']?("&mod=".$vars['mod']):"";

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
	
	$assign_list['pager_str'] 	= $pager_str;
	$assign_list['nrs_arr'] 	= $nrs_arr;
	$assign_list['total_num_result'] = $total_num_result;
	$assign_list['processurl'] 	= $processurl;
	$assign_list['vars'] 		= $vars;
	$assign_list['error'] 		= $error;
	
	$display = dirname(__FILE__)."/skin/B_Hdban_exp.tpl";
	$assign_list['display'] = $display;
	
	$smarty->assign($assign_list);
	
	// --- Display template
	if (isset($vars['activeAjax']))
	$smarty->display(dirname(__FILE__)."/skin/B_Hdban_exp.tpl");
	else
	$smarty->display(dirname(__FILE__)."/skin/B_Hdban_list.tpl");
