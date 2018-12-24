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
    include ($CLASSES_PATH.'/hopdong/clsHdmuaTonkho.php');

	// --- Class is used in this page
	$obj = new hdmuaTonkho_class();

	// --- Variables is used in this page
	$order_arr = array(0 => "Theo ngày", 1 => "Theo hóa đơn");
	$nrs_arr = array(5,10, 20, 30, 40, 50, 100, 150, 200);
	$vars = array_merge($_POST, $_GET);

	if(!$vars['mod']) $vars['mod'] = 'hdmua';

	$processurl = "?expTonkhoReport&mod=hdmua";

	if($vars['nhaptontu'] && $vars['nhaptonden']){
        $obj = new hdmuaTonkho_class();
        $obj_list = $obj->getTonkhoExport($vars['nhaptontu'],$vars['nhaptonden']);
        $total_num_result = count($obj_list);
    }

	// --- Debug here ----
	unset($obj);

    // --- export
    if($vars['exptype']==2):
        header("Content-Type: application/vnd.ms-excel");
        header("Expires: 0");
        header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
        header("content-disposition: attachment;filename=Tonkho_".date('d-m-Y').".xls");
    elseif($vars['exptype']==1):
        header("Content-Type: application/vnd.ms-word");
        header("Expires: 0");
        header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
        header("content-disposition: attachment;filename=Tonkho_".date('d-m-Y').".doc");
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

	$assign_list["parentArr"] 	= $parentArr;
	$assign_list['nrs_arr'] 	= $nrs_arr;
	$assign_list['total_num_result'] = $total_num_result;
	$assign_list['vars'] 		= $vars;
	$assign_list['error'] 		= $error;
	$assign_list['complete'] 	= $complete;

	$display = dirname(__FILE__)."/skin/B_HdmuaTonkho_exp.tpl";
	$assign_list['display'] = $display;

	$smarty->assign($assign_list);

	// --- Display template
	if (isset($vars['activeAjax']))
	$smarty->display(dirname(__FILE__)."/skin/B_HdmuaTonkho_exp.tpl");
	else
	$smarty->display(dirname(__FILE__)."/skin/B_Hdmua_list.tpl");
