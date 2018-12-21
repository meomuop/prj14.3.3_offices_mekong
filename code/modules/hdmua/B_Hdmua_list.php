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
    include ($CLASSES_PATH.'/hopdong/clsHdmua.php');
    include ($CLASSES_PATH.'/hopdong/clsDoitac.php');
    include ($CLASSES_PATH.'/hopdong/clsDvtiente.php');

	// --- Class is used in this page
	$obj = new hdmua_class();

	// --- Variables is used in this page
	$order_arr = array(0 => "Hợp đồng mới", 1 => "Đang thực hiện", 2 => "Đã hoàn thành", 2 => "Đã hủy");
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
	
	$processurl = "?listHdmua&mod=hdmua";
	$processurl .= $vars['doitac_id_fs']?"&doitac_id=".$vars['doitac_id_fs']:"";
	$processurl .= trim($vars['hdmua_sohd_fs'])?"&hdmua_sohd=".trim($vars['hdmua_sohd_fs']):"";
	$processurl .= trim($vars['hdmua_noidung_fs'])?"&hdmua_noidung=".trim($vars['hdmua_noidung_fs']):"";
	
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
		$obj->sortItem($vars['val'],$vars['hdmua_id']);
	}
	
	// --- Add - Edit
	if($vars['add_edit']==1):
        if (!isset($vars['hdmua_id']) || $vars['hdmua_id'] < 1) {
            $obj = new hdmua_class();
            $obj->readForm();
            if ((is_null($error)) || ($error == "")) {
                $obj->hdmua_date = date("Y-m-d");
                $obj->hdmua_ngayhd = date('Y-m-d',strtotime(str_replace('/','-',$vars['hdmua_signed'])));
                $obj->hdmua_hieuluc = date('Y-m-d',strtotime(str_replace('/','-',$vars['hdmua_recevied'])));
                $obj->hdmua_nguoinhap = $_SESSION['user_id'];

                // ---- kiem tra hop dong ton tai
                $obj_trunghop = new hdmua_class();
                $isTheSame = $obj_trunghop->checkTrunghop($vars['hdmua_sohd']);
                if ($isTheSame>0) {
                    $error = "Văn bản đã tồn tại";
                }else{
                    $obj->insertnew();
                    $complete = "Đã thêm mới hợp đồng có số: ".$vars['hdmua_sohd'];
                    unset($obj);
                }
            }
        }else{
            $obj = new hdmua_class();
            $obj->readForm();
            if ((is_null($error)) || ($error == "")) {
                if ($obj->is_already_used($obj->tablename, "hdmua_id", $obj->hdmua_id))
                {
                    $obj->hdmua_ngayhd = date('Y-m-d',strtotime(str_replace('/','-',$vars['hdmua_signed'])));
                    $obj->hdmua_hieuluc = date('Y-m-d',strtotime(str_replace('/','-',$vars['hdmua_recevied'])));
                    $obj->hdmua_nguoinhap = $_SESSION['user_id'];

                    // ---- kiem tra so den van ban
                    $count_num = $obj->getSameNum($vars['hdmua_num'],$vars['docLevel_id'],$obj->hdmua_id);
                    if($count_num > 0):
                        // ---- neu da ton tai: lay so cuoi cong 1
                        $hdmua_num = $obj->getLastNum($vars['docLevel_id']);
                        $obj->hdmua_num = $hdmua_num + 1;
                    endif;

                    // ---- kiem tra van ban ton tai ngoai van ban hien tai
                    $obj_docCoincidence = new hdmua_class();
                    $isTheSame = $obj_docCoincidence->checkCoincidence($vars['hdmua_sohd'],date('Y-m-d',strtotime(str_replace('/','-',$vars['hdmua_signed']))),$vars['unit_name'],$vars['doitac_id'],$obj->hdmua_id);
                    if ($isTheSame>0) {
                        $error = "Văn bản đã tồn tại";
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
        $obj = new hdmua_class();
        $obj->getDBbyPkey($vars['hdmua_id']);
        if (!$obj->hdmua_id) redirect("?listHdmua".$arg['arg']);
        $obj_info = (array)$obj;
        $hdmua_num = $obj->hdmua_num;
	endif;
	
	// --- Condition
	$where = " 1 = 1";
	
	// --- Get data to view in homepage 
	if ($vars['search_me']==1):
		if ($vars['doitac_id_fs']) 	$where .= " AND doitac_id LIKE '%".$vars['doitac_id_fs']."%'";
		if ($vars['hdmua_sohd_fs']) 	$where .= " AND hdmua_sohd regexp binary '".$vars['hdmua_sohd_fs']."'";
		if ($vars['hdmua_noidung_fs']) 	$where .= " AND hdmua_noidung regexp binary '".$vars['hdmua_noidung_fs']."'";
	endif;
	
	$limit = " LIMIT ".(string)$cur_pos.", ".(int)$vars['numresult'];
	
	if($order_id == 0):
		$where.=" and hdmua_tinhtrang = 1"; // moi
	elseif($order_id == 1):
		$where.=" and hdmua_tinhtrang = 2"; // dang lam
	elseif($order_id == 2):
		$where.=" and hdmua_tinhtrang = 3"; // da xong
	else:
		$where.=" and hdmua_tinhtrang = 4"; // da huy
	endif;
	
	$obj = new hdmua_class();
	$obj_list = $obj->getDBList(" $where", "hdmua_id DESC", FALSE, $limit);
	$total_num_result = $obj->getRowNumber("$where");
	$num_page = ceil($total_num_result/$vars['numresult']);

    // --- Get doitac list
    $obj_doitac = new doitac_class();
    $where_doitac 		= " 1 = 1 and doitac_active=1";
    $obj_list_doitac 	= $obj_doitac->getDBList(" $where_doitac", "doitac_name", FALSE, "");

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
	$where_user 		= " 1 = 1 and user_active=1 and user_level=2";
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
    $assign_list['obj_list_doitac'] 	= $obj_list_doitac;
    $assign_list['obj_list_dvtiente'] 	= $obj_list_dvtiente;
    $assign_list['obj_list_department'] = $obj_list_department;
	
	$assign_list['doitac_id'] 		= $vars['doitac_id'];
	
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
	
	$display = dirname(__FILE__)."/skin/B_Hdmua_tbl.tpl";
	$assign_list['display'] = $display;
	
	$smarty->assign($assign_list);
	
	// --- Display template
	if (isset($vars['activeAjax']))
	$smarty->display(dirname(__FILE__)."/skin/B_Hdmua_tbl.tpl");
	else
	$smarty->display(dirname(__FILE__)."/skin/B_Hdmua_list.tpl");
