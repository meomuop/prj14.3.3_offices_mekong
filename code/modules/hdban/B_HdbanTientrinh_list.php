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
    include ($CLASSES_PATH.'/hopdong/clsHdbanTientrinh.php');
    include ($CLASSES_PATH.'/hopdong/clsHdban.php');

	// --- Class is used in this page
	$obj = new hdbanTientrinh_class();

	// --- Variables is used in this page
	$order_arr = array(0 => "Mới đến cũ", 1 => "Cũ đến mới");
	$nrs_arr = array(5,10, 20, 30, 40, 50, 100, 150, 200);
	$vars = array_merge($_POST, $_GET);
	
	if(!$vars['mod']) $vars['mod'] = 'hdban';
	
	if (!(int)$vars['curpage']){
	$vars['curpage'] = 1;
	}else{
	$vars['arg'] = "&curpage=".$vars['curpage']."&numresult=".$vars['numresult'];
	} 
	$vars['numresult'] = (int)$vars['numresult']?(int)$vars['numresult']:100;
	$cur_pos = ($vars['curpage'] - 1) * $vars['numresult'];
	$order_id = (int)$vars['order'];
	
	$processurl = "?listHdbanTientrinh&mod=hdban";
    $processurl .= trim($vars['hdban_id'])?"&hdban_id=".trim($vars['hdban_id']):"";
	$processurl .= trim($vars['tientrinh_noidung_fs'])?"&tientrinh_noidung=".trim($vars['tientrinh_noidung_fs']):"";
	
	// --- Del record which is selected
	if ($vars['dlStr']){
	$obj->removeInList($vars['dlStr']);
	}
	
	// --- Check and uncheck
	if ($vars['checkUncheck']==1){
	$obj->checkUncheck($vars['checkUncheckID'],$vars['checkUncheck'],$vars['setfield']);
	}
	if ($vars['checkUncheck']==2){
	$obj->checkUncheck($vars['checkUncheckID'],$vars['checkUncheck'],$vars['setfield']);
	}
	
	// --- Items sort
	if($vars['sort_me']==1){
		$obj->sortItem($vars['val'],$vars['tientrinh_id']);
	}
	
	// --- Add - Edit
	if($vars['add_edit']==1):
        if (!isset($vars['tientrinh_id']) || $vars['tientrinh_id'] < 1) {
            $obj = new hdbanTientrinh_class();
            $hdban = new hdban_class();
            $obj->readForm();
            if ((is_null($error)) || ($error == "")) {
                $obj->tientrinh_date = date("Y-m-d");
                $obj->user_id = $_SESSION['user_id'];

                $obj->insertnew();
                $complete = "Đã thêm mới thành công!";
                unset($obj);
                $hdban->updateTinhtrang($vars['hdban_id'],2);
            }
        }else{
            $obj = new hdbanTientrinh_class();
            $hdban = new hdban_class();
            $obj->readForm();
            if ((is_null($error)) || ($error == "")) {
                if ($obj->is_already_used($obj->tablename, "tientrinh_id", $obj->tientrinh_id))
                {
                    $obj->tientrinh_date = date("Y-m-d");
                    $obj->user_id = $_SESSION['user_id'];

                    $obj->update();
                    $complete = "Đã cập nhật thành công!";
                    unset($obj);
                }
            }
        }
	endif;

	// --- Get record for edit
	if($vars['edit_me']==1):
        $obj = new hdbanTientrinh_class();
        $obj->getDBbyPkey($vars['tientrinh_id']);
        if (!$obj->tientrinh_id) redirect("?listHdbanTientrinh".$arg['arg']);
        $obj_info = (array)$obj;
        $tientrinh_num = $obj->tientrinh_num;
	endif;
	
	// --- Condition
	$where = " 1 = 1";
	
	// --- Get data to view in homepage
    if ($vars['hdban_id']):
        $where .= " AND hdban_id = ".$vars['hdban_id']."";
    endif;

	if ($vars['search_me']==1):
		if ($vars['tientrinh_ghichu_fs']) 	$where .= " AND tientrinh_ghichu regexp binary '".$vars['tientrinh_ghichu_fs']."'";
	endif;
	
	$limit = " LIMIT ".(string)$cur_pos.", ".(int)$vars['numresult'];
	
	if($order_id == 0):
		$orderStr.=" tientrinh_id DESC";
	else:
        $orderStr.=" tientrinh_id ASC";
	endif;
	
	$obj = new hdbanTientrinh_class();
	$obj_list = $obj->getDBList(" $where", $orderStr, FALSE, $limit);
	$total_num_result = $obj->getRowNumber("$where");
	$num_page = ceil($total_num_result/$vars['numresult']);

    // --- Get hdban list
    $obj_hdban = new hdban_class();
    $obj_hdban->getDBbyPkey($vars['hdban_id']);
    $hdban_info = (array)$obj_hdban;
	
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
    $vars['arg'] .= $vars['hdban_id']?("&mod=".$vars['hdban_id']):"";
	
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
    $assign_list['obj_list_hdban'] 	= $obj_list_hdban;
	
	$assign_list['hdban_id'] 		= $vars['hdban_id'];
    $assign_list['hdban_info'] 		= $hdban_info;

	
	$assign_list['pager_str'] 	= $pager_str;
	$assign_list["parentArr"] 	= $parentArr; 
	$assign_list['nrs_arr'] 	= $nrs_arr;
	$assign_list['total_num_result'] = $total_num_result;
	$assign_list['num_page'] 	= $num_page;
	$assign_list['order_arr'] 	= $order_arr;
	$assign_list['order_id'] 	= $order_id;
	$assign_list['processurl'] 	= $processurl;
	$assign_list['vars'] 		= $vars;
	$assign_list['obj_info'] 	= $obj_info;
	$assign_list['error'] 		= $error;
	$assign_list['lastNum'] 	= $lastNum;
	$assign_list['complete'] 	= $complete;
	
	$display = dirname(__FILE__)."/skin/B_HdbanTientrinh_tbl.tpl";
	$assign_list['display'] = $display;
	
	$smarty->assign($assign_list);
	
	// --- Display template
	if (isset($vars['activeAjax']))
	$smarty->display(dirname(__FILE__)."/skin/B_HdbanTientrinh_tbl.tpl");
	else
	$smarty->display(dirname(__FILE__)."/skin/B_Hdban_list.tpl");
