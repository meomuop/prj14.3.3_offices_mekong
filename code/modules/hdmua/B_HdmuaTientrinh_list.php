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
    include ($CLASSES_PATH.'/hopdong/clsHdmuaTientrinh.php');
    include ($CLASSES_PATH.'/hopdong/clsHdmua.php');

	// --- Class is used in this page
	$obj = new hdmuaTientrinh_class();

	// --- Variables is used in this page
	$order_arr = array(0 => "Theo số hợp đồng", 1 => "Theo ngày hợp đồng");
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
	
	$processurl = "?listHdmuaTientrinh&mod=hdmua";
    $processurl .= trim($vars['hdmua_id'])?"&hdmua_id=".trim($vars['hdmua_id']):"";
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
            $obj = new hdmuaTientrinh_class();
            $hdmua = new hdmua_class();
            $obj->readForm();
            if ((is_null($error)) || ($error == "")) {
                $obj->tientrinh_date = date("Y-m-d");
                $obj->user_id = $_SESSION['user_id'];

                $obj->insertnew();
                $complete = "Đã thêm mới thành công!";
                unset($obj);
                $hdmua->updateTinhtrang($vars['hdmua_id'],2);
            }
        }else{
            $obj = new hdmuaTientrinh_class();
            $hdmua = new hdmua_class();
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
        $obj = new hdmuaTientrinh_class();
        $obj->getDBbyPkey($vars['tientrinh_id']);
        if (!$obj->tientrinh_id) redirect("?listHdmuaTientrinh".$arg['arg']);
        $obj_info = (array)$obj;
        $tientrinh_num = $obj->tientrinh_num;
	endif;
	
	// --- Condition
	$where = " 1 = 1";
	
	// --- Get data to view in homepage
    if ($vars['hdmua_id']):
        $where .= " AND hdmua_id = ".$vars['hdmua_id']."";
    endif;

	if ($vars['search_me']==1):
		if ($vars['ngayxuat_1'] && $vars['ngayxuat_2'] && $vars['ngayxuat_3']) 	$where .= " AND tientrinh_ngayhd = '".$vars['ngayxuat_3']."-".$vars['ngayxuat_2']."-".$vars['ngayxuat_1']."'";
		if ($vars['tientrinh_sohd_fs']) 	$where .= " AND tientrinh_sohd regexp binary '".$vars['tientrinh_sohd_fs']."'";
		if ($vars['tientrinh_noidung_fs']) 	$where .= " AND tientrinh_noidung regexp binary '".$vars['tientrinh_noidung_fs']."'";
	endif;
	
	$limit = " LIMIT ".(string)$cur_pos.", ".(int)$vars['numresult'];
	
	if($order_id == 0):
		$orderStr.=" tientrinh_sohd DESC";
	else:
        $orderStr.=" tientrinh_ngayhd DESC";

	endif;
	
	$obj = new hdmuaTientrinh_class();
	$obj_list = $obj->getDBList(" $where", $orderStr, FALSE, $limit);
	$total_num_result = $obj->getRowNumber("$where");
	$num_page = ceil($total_num_result/$vars['numresult']);

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
    $assign_list['obj_list_hdmua'] 	= $obj_list_hdmua;
	
	$assign_list['hdmua_id'] 		= $vars['hdmua_id'];
    $assign_list['hdmua_info'] 		= $hdmua_info;

	
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
	
	$display = dirname(__FILE__)."/skin/B_HdmuaTientrinh_tbl.tpl";
	$assign_list['display'] = $display;
	
	$smarty->assign($assign_list);
	
	// --- Display template
	if (isset($vars['activeAjax']))
	$smarty->display(dirname(__FILE__)."/skin/B_HdmuaTientrinh_tbl.tpl");
	else
	$smarty->display(dirname(__FILE__)."/skin/B_Hdmua_list.tpl");
