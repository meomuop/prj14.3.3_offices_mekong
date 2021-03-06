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
    include ($CLASSES_PATH.'/hopdong/clsHdmuaTonkho.php');
    include ($CLASSES_PATH.'/hopdong/clsHdmuaHoadon.php');
    include ($CLASSES_PATH.'/hopdong/clsDanhmuc.php');
    include ($CLASSES_PATH.'/hopdong/clsHanghoa.php');
    include ($CLASSES_PATH.'/hopdong/clsDvtinh.php');

	// --- Class is used in this page
	$obj = new hdmuaTonkho_class();

	// --- Variables is used in this page
	$order_arr = array(0 => "Theo ngày", 1 => "Theo hóa đơn");
	$nrs_arr = array(5,10, 20, 30, 40, 50, 100, 150, 200);
	$vars = array_merge($_POST, $_GET);
	
	if(!$vars['mod']) $vars['mod'] = 'hdmua';
	
	if (!(int)$vars['curpage']){
	$vars['curpage'] = 1;
	}else{
	$vars['arg'] = "&curpage=".$vars['curpage']."&numresult=".$vars['numresult'];
	} 
	$vars['numresult'] = (int)$vars['numresult']?(int)$vars['numresult']:100;
	$cur_pos = ($vars['curpage'] - 1) * $vars['numresult'];
	$order_id = (int)$vars['order'];
	
	$processurl = "?listTonkho&mod=hdmua";
	$processurl .= $vars['doitac_id_fs']?"&doitac_id=".$vars['doitac_id_fs']:"";
	$processurl .= trim($vars['tonkho_sohd_fs'])?"&tonkho_sohd=".trim($vars['tonkho_sohd_fs']):"";
	$processurl .= trim($vars['tonkho_noidung_fs'])?"&tonkho_noidung=".trim($vars['tonkho_noidung_fs']):"";
	
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
		$obj->sortItem($vars['val'],$vars['tonkho_id']);
	}
	
	// --- Add - Edit
	if($vars['add_edit']==1):
        if (!isset($vars['tonkho_id']) || $vars['tonkho_id'] < 1) {
            $obj = new hdmuaTonkho_class();
            $obj->readForm();
            if ((is_null($error)) || ($error == "")) {
                $obj->tonkho_date = date("Y-m-d");
                $obj->tonkho_nguoinhap = $_SESSION['user_id'];

                $obj->insertnew();
                $complete = "Đã nhập hàng cho hóa đơn có số: ".$vars['hoadon_sohd'];
                unset($obj);
            }
        }else{
            $obj = new hdmuaTonkho_class();
            $obj->readForm();
            if ((is_null($error)) || ($error == "")) {
                if ($obj->is_already_used($obj->tablename, "tonkho_id", $obj->tonkho_id))
                {
                    $obj->tonkho_date = date("Y-m-d");
                    $obj->tonkho_nguoinhap = $_SESSION['user_id'];

                    $obj->update();
                    $complete = "Đã cập nhật thành công!";
                    unset($obj);
                }
            }
        }
	endif;

	// --- Get record for edit
	if($vars['edit_me']==1):
        $obj = new hdmuaTonkho_class();
        $obj->getDBbyPkey($vars['tonkho_id']);
        if (!$obj->tonkho_id) redirect("?listTonkho".$arg['arg']);
        $obj_info = (array)$obj;
        $tonkho_num = $obj->tonkho_num;
	endif;
	
	// --- Condition
	$where = " 1 = 1";

	// --- Get data to view in homepage
    if ($vars['hoadon_id']):
        $where .= " AND hoadon_id = ".$vars['hoadon_id']."";
    endif;

	if ($vars['search_me']==1):
        if ($vars['ngaynhap_fs_1'] && $vars['ngaynhap_fs_2'] && $vars['ngaynhap_fs_3']){
            $where .= " AND tonkho_date = '".$vars['ngaynhap_fs_3']."-".$vars['ngaynhap_fs_2']."-".$vars['ngaynhap_fs_1']."'";
        }
        if ($vars['hoadon_sohd_fs']) 	$where .= " AND hoadon_sohd regexp binary '".$vars['hoadon_sohd_fs']."'";
        if ($vars['hanghoa_name_fs']) 	$where .= " AND hanghoa_name regexp binary '".$vars['hanghoa_name_fs']."'";
	endif;
	
	$limit = " LIMIT ".(string)$cur_pos.", ".(int)$vars['numresult'];
	
	if($order_id == 0):
		$orderStr.=" tonkho_id DESC";
	else:
        $orderStr.=" hoadon_id DESC";

	endif;
	
	$obj = new hdmuaTonkho_class();
	$obj_list = $obj->getDBList(" $where", $orderStr, FALSE, $limit);
	$total_num_result = $obj->getRowNumber("$where");
	$num_page = ceil($total_num_result/$vars['numresult']);

    // --- Get hdmua list
    $obj_hdmuaHD = new hdmuaHoadon_class();
    $obj_hdmuaHD->getDBbyPkey($vars['hoadon_id']);
    $hdmuaHD_info = (array)$obj_hdmuaHD;

    // --- Get danhmuc list
    $obj_danhmuc = new danhmuc_class();
    $where_danhmuc 		= " 1 = 1 and danhmuc_active=1";
    $obj_list_danhmuc 	= $obj_danhmuc->getDBList(" $where_danhmuc", "danhmuc_name", FALSE, "");

    // --- Get hanghoa list
    $obj_hanghoa = new hanghoa_class();
    $where_hanghoa 		= " 1 = 1 and hanghoa_active=1";
    $obj_list_hanghoa 	= $obj_hanghoa->getDBList(" $where_hanghoa", "hanghoa_name", FALSE, "");

    // --- Get dvtinh list
    $obj_dvtinh = new dvtinh_class();
    $where_dvtinh 		= " 1 = 1 and dvtinh_active=1";
    $obj_list_dvtinh 	= $obj_dvtinh->getDBList(" $where_dvtinh", "dvtinh_name", FALSE, "");
	
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
    $vars['arg'] .= $vars['hdmua_id']?("&mod=".$vars['hdmua_id']):"";
	
	// --- tao duong dan cho thao tac tren cac div khac
	$vars['arg_doc'] = "";
	$vars['arg_doc'] .= $vars['numresult']?"&numresult_doc=".$vars['numresult']:"";
	$vars['arg_doc'] .= $vars['curpage']?"&curpage_doc=".$vars['curpage']:"";
	$vars['arg_doc'] .= $vars['order']?"&order_doc=".$vars['order']:"";
	$vars['arg_doc'] .= $vars['mod']?("&mod=".$vars['mod']):"";
	
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
    $assign_list['obj_list_danhmuc'] 	= $obj_list_danhmuc;
    $assign_list['obj_list_hanghoa'] 	= $obj_list_hanghoa;
    $assign_list['obj_list_dvtinh'] 	= $obj_list_dvtinh;
	
	$assign_list['hoadon_id'] 		= $vars['hoadon_id'];
    $assign_list['hdmuaHD_info'] 	= $hdmuaHD_info;

	
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
	
	$display = dirname(__FILE__)."/skin/B_HdmuaTonkho_tbl.tpl";
	$assign_list['display'] = $display;
	
	$smarty->assign($assign_list);
	
	// --- Display template
	if (isset($vars['activeAjax']))
	$smarty->display(dirname(__FILE__)."/skin/B_HdmuaTonkho_tbl.tpl");
	else
	$smarty->display(dirname(__FILE__)."/skin/B_Hdmua_list.tpl");
