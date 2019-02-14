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
    include ($CLASSES_PATH.'/hopdong/clsHdbandtFile.php');
    include ($CLASSES_PATH.'/hopdong/clsHdbandt.php');

	// --- Class is used in this page
	$obj = new hdbandtFile_class();

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
	
	$processurl = "?listHdbanFile&mod=hdban";
    $processurl .= trim($vars['hdban_id'])?"&hdban_id=".trim($vars['hdban_id']):"";
	
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
		$obj->sortItem($vars['val'],$vars['hdfile_id']);
	}
	
	// --- Add - Edit
	if($vars['add_edit']==1):
        if (!isset($vars['hdfile_id']) || $vars['hdfile_id'] < 1) {
            $obj = new hdbandtFile_class();
            $obj->readForm();
            if ((is_null($error)) || ($error == "")) {
                if($vars['hdfile_path'] != ""){
                    $obj->hdfile_ngayduthao = date("Y-m-d");
                    $obj->hdfile_nguoiduthao = $_SESSION['user_id'];
                }
                if($vars['hdfile_phanhoi'] != ""){
                    $obj->hdfile_ngayykien = date("Y-m-d");
                    $obj->hdfile_nguoiykien = $_SESSION['user_id'];
                }

                $obj->insertnew();
                $complete = "Đã thêm mới thành công!";
                unset($obj);

                $obj_dthdban = new hdbandt_class();
                $obj_dthdban->updateTinhtrang($vars['dthdban_id'],$vars['dthdban_tt_file']);
                unset($obj_dthdban);
            }
        }else{
            $obj = new hdbandtFile_class();
            $obj->readForm();
            if ((is_null($error)) || ($error == "")) {
                if ($obj->is_already_used($obj->tablename, "hdfile_id", $obj->hdfile_id))
                {
                    if($vars['hdfile_phanhoi'] != "" && $vars['hdfile_nguoiykien'] < 1){
                        $obj->hdfile_ngayykien = date("Y-m-d");
                        $obj->hdfile_nguoiykien = $_SESSION['user_id'];
                    }

                    $obj->update();
                    $complete = "Đã cập nhật thành công!";
                    unset($obj);

                    $obj_dthdban = new hdbandt_class();
                    $obj_dthdban->updateTinhtrang($vars['dthdban_id'],$vars['dthdban_tt_file']);
                    unset($obj_dthdban);
                }
            }
        }
	endif;

	// --- Get record for edit
	if($vars['edit_me']==1):
        $obj = new hdbandtFile_class();
        $obj->getDBbyPkey($vars['hdfile_id']);
        if (!$obj->hdfile_id) redirect("?listHdbanFile".$arg['arg']);
        $obj_info = (array)$obj;
	endif;
	
	// --- Condition
	$where = " 1 = 1";
	
	// --- Get data to view in homepage
    if ($vars['dthdban_id']):
        $where .= " AND dthdban_id = ".$vars['dthdban_id']."";
    endif;

	$limit = " LIMIT ".(string)$cur_pos.", ".(int)$vars['numresult'];
	
	if($order_id == 0):
		$orderStr.=" hdfile_id DESC";
	else:
        $orderStr.=" hdfile_id ASC";
	endif;
	
	$obj = new hdbandtFile_class();
	$obj_list = $obj->getDBList(" $where", $orderStr, FALSE, $limit);
	$total_num_result = $obj->getRowNumber("$where");
	$num_page = ceil($total_num_result/$vars['numresult']);

	$solan = $total_num_result+1;

    // --- Get hdban list
    $obj_hdbandt = new hdbandt_class();
    $obj_hdbandt->getDBbyPkey($vars['dthdban_id']);
    $dthdban_info = (array)$obj_hdbandt;

    if($total_num_result>0):
        $obj_hdbandt -> changeHdbandtFile($vars['dthdban_id'],1);
    else:
        $obj_hdbandt -> changeHdbandtFile($vars['dthdban_id'],2);
    endif;
    unset($obj_hdbandt);
	
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
    $vars['arg'] .= $vars['dthdban_id']?("&mod=".$vars['dthdban_id']):"";
	
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
	
	$assign_list['dthdban_id'] 		= $vars['dthdban_id'];
    $assign_list['dthdban_info'] 	= $dthdban_info;
    $assign_list['solan'] 	    = $solan;

	
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
	$assign_list['complete'] 	= $complete;
	
	$display = dirname(__FILE__)."/skin/B_HdbandtFile_tbl.tpl";
	$assign_list['display'] = $display;
	
	$smarty->assign($assign_list);
	
	// --- Display template
	if (isset($vars['activeAjax']))
	$smarty->display(dirname(__FILE__)."/skin/B_HdbandtFile_tbl.tpl");
	else
	$smarty->display(dirname(__FILE__)."/skin/B_Hdban_list.tpl");
