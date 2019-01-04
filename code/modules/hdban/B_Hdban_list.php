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
	
	if (!(int)$vars['curpage']){
	$vars['curpage'] = 1;
	}else{
	$vars['arg'] = "&curpage=".$vars['curpage']."&numresult=".$vars['numresult'];
	} 
	$vars['numresult'] = (int)$vars['numresult']?(int)$vars['numresult']:100;
	$cur_pos = ($vars['curpage'] - 1) * $vars['numresult'];
	$order_id = (int)$vars['order'];
	
	$processurl = "?listHdban&mod=hdban";
	$processurl .= $vars['khachhang_id_fs']?"&khachhang_id=".$vars['khachhang_id_fs']:"";
	$processurl .= trim($vars['hdban_sohd_fs'])?"&hdban_sohd=".trim($vars['hdban_sohd_fs']):"";
	$processurl .= trim($vars['hdban_noidung_fs'])?"&hdban_noidung=".trim($vars['hdban_noidung_fs']):"";
	
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
		$obj->sortItem($vars['val'],$vars['hdban_id']);
	}
	
	// --- Add - Edit
	if($vars['add_edit']==1):
        if (!isset($vars['hdban_id']) || $vars['hdban_id'] < 1) {
            $obj = new hdban_class();
            $khachhang = new khachhang_class();
            $obj->readForm();
            if ((is_null($error)) || ($error == "")) {
                $obj->hdban_date = date("Y-m-d");
                $obj->hdban_ngayhd = date('Y-m-d',strtotime(str_replace('/','-',$vars['hdban_ngayhd'])));
                $obj->hdban_hieuluc = date('Y-m-d',strtotime(str_replace('/','-',$vars['hdban_hieuluc'])));
                $obj->hdban_nguoinhap = $_SESSION['user_id'];
                $obj->hdban_giatri = str_replace('.','', $vars['hdban_giatri']);
                $obj->hdban_giatri_quydoi = str_replace('.','', $vars['hdban_giatri_quydoi']);
                $obj->hdban_gttt = str_replace('.','', $vars['hdban_gttt']);
                $obj->hdban_gttt_quydoi = str_replace('.','', $vars['hdban_gttt_quydoi']);
                $obj->hdban_tl_huybo = str_replace('.','', $vars['hdban_tl_huybo']);
                $obj->khachhang_viettat = $khachhang->getViettat($vars['khachhang_id']);

                // ---- kiem tra hop dong ton tai
                $obj_trunghop = new hdban_class();
                $isTheSame = $obj_trunghop->checkTrunghop($vars['hdban_sohd']);
                if ($isTheSame>0) {
                    $error = "Hợp đồng đã tồn tại";
                }else{
                    $obj->insertnew();
                    $complete = "Đã thêm mới hợp đồng có số: ".$vars['hdban_sohd'];
                    unset($obj);
                }
            }
        }else{
            $obj = new hdban_class();
            $khachhang = new khachhang_class();
            $obj->readForm();
            if ((is_null($error)) || ($error == "")) {
                if ($obj->is_already_used($obj->tablename, "hdban_id", $obj->hdban_id))
                {
                    $obj->hdban_date = date("Y-m-d");
                    $obj->hdban_ngayhd = date('Y-m-d',strtotime(str_replace('/','-',$vars['hdban_ngayhd'])));
                    $obj->hdban_hieuluc = date('Y-m-d',strtotime(str_replace('/','-',$vars['hdban_hieuluc'])));
                    $obj->hdban_nguoinhap = $_SESSION['user_id'];
                    $obj->hdban_giatri = str_replace('.','', $vars['hdban_giatri']);
                    $obj->hdban_giatri_quydoi = str_replace('.','', $vars['hdban_giatri_quydoi']);
                    $obj->hdban_gttt = str_replace('.','', $vars['hdban_gttt']);
                    $obj->hdban_gttt_quydoi = str_replace('.','', $vars['hdban_gttt_quydoi']);
                    $obj->hdban_tl_huybo = str_replace('.','', $vars['hdban_tl_huybo']);
                    $obj->khachhang_viettat = $khachhang->getViettat($vars['khachhang_id']);

                    // ---- kiem tra hop dong ton tai ngoai van ban hien tai
                    $obj_trunghop = new hdban_class();
                    $isTheSame = $obj_trunghop->checkTrunghop($vars['hdban_sohd'], $vars['hdban_id']);
                    if ($isTheSame>0) {
                        $error = "Hợp đồng đã tồn tại";
                    }else{
                        $obj->update();
                        $complete = "Đã cập nhật thành công!";
                        unset($obj);
                    }
                }
            }
        }
	endif;

	// --- Get record for edit
	if($vars['edit_me']==1):
        $obj = new hdban_class();
        $obj->getDBbyPkey($vars['hdban_id']);
        if (!$obj->hdban_id) redirect("?listHdban".$arg['arg']);
        $obj_info = (array)$obj;
        $hdban_num = $obj->hdban_num;
	endif;
	
	// --- Condition
	$where = " 1 = 1";
	
	// --- Get data to view in homepage 
	if ($vars['search_me']==1):
		if ($vars['khachhang_id_fs']) 	$where .= " AND khachhang_id LIKE '%".$vars['khachhang_id_fs']."%'";
		if ($vars['hdban_sohd_fs']) 	$where .= " AND hdban_sohd regexp binary '".$vars['hdban_sohd_fs']."'";
		if ($vars['hdban_noidung_fs']) 	$where .= " AND hdban_noidung regexp binary '".$vars['hdban_noidung_fs']."'";
	endif;
	
	$limit = " LIMIT ".(string)$cur_pos.", ".(int)$vars['numresult'];
	
	if($order_id == 0):
		$where.=" and hdban_tinhtrang = 1"; // moi
	elseif($order_id == 1):
		$where.=" and hdban_tinhtrang = 2"; // dang lam
	elseif($order_id == 2):
		$where.=" and hdban_tinhtrang = 3"; // da xong
	else:
		$where.=" and hdban_tinhtrang = 4"; // da huy
	endif;
	
	$obj = new hdban_class();
	$obj_list = $obj->getDBList(" $where", "hdban_id DESC", FALSE, $limit);
	$total_num_result = $obj->getRowNumber("$where");
	$num_page = ceil($total_num_result/$vars['numresult']);

    // --- Get khachhang list
    $obj_khachhang = new khachhang_class();
    $where_khachhang 		= " 1 = 1 and khachhang_active=1";
    $obj_list_khachhang 	= $obj_khachhang->getDBList(" $where_khachhang", "khachhang_name", FALSE, "");

    // --- Get dvtiente list
    $obj_dvtiente = new dvtiente_class();
    $where_dvtiente 		= " 1 = 1 and dvtiente_active=1";
    $obj_list_dvtiente 	= $obj_dvtiente->getDBList(" $where_dvtiente", "dvtiente_name", FALSE, "");

    // --- Get department list
    $obj_department = new department_class();
    $where_department 		= " 1 = 1 and department_active=1";
    $obj_list_department 	= $obj_department->getDBList(" $where_department", "department_name", FALSE, "");
		
	// --- Get user list
	$obj_user 		= new users_class();
	$where_user 		= " 1 = 1 and user_active=1";
	$obj_list_user	= $obj_user->getDBList(" $where_user", "user_name", FALSE, "");
	
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
	$assign_list['obj_list_user'] 	= $obj_list_user;
    $assign_list['obj_list_khachhang'] 	= $obj_list_khachhang;
    $assign_list['obj_list_dvtiente'] 	= $obj_list_dvtiente;
    $assign_list['obj_list_department'] = $obj_list_department;
	
	$assign_list['khachhang_id'] 		= $vars['khachhang_id'];
	
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
	
	$display = dirname(__FILE__)."/skin/B_Hdban_tbl.tpl";
	$assign_list['display'] = $display;
	
	$smarty->assign($assign_list);
	
	// --- Display template
	if (isset($vars['activeAjax']))
	$smarty->display(dirname(__FILE__)."/skin/B_Hdban_tbl.tpl");
	else
	$smarty->display(dirname(__FILE__)."/skin/B_Hdban_list.tpl");
