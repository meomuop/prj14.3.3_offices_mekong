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
	require_once ($CLASSES_PATH.'tinhluong/clsChamcong.php');
    require_once ($CLASSES_PATH.'tinhluong/clsTldn.php');
    require_once ($CLASSES_PATH.'tinhluong/clsPhucap.php');

	// --- Class is used in this page
	$obj = new cc_class();
	
	// --- Variables is used in this page
	$order_arr = array(0 => "Theo chức vụ", 1 => "Theo bậc");
	$nrs_arr = array(5,10, 20, 30, 40, 50, 100);
	$vars = array_merge($_POST, $_GET);
	
	if (!(int)$vars['curpage']){
	  $vars['curpage'] = 1;
	}else{
	  $vars['arg'] = "&curpage=".$vars['curpage']."&numresult=".$vars['numresult'];
	} 
	$vars['numresult'] = (int)$vars['numresult']?(int)$vars['numresult']:20;
	$cur_pos = ($vars['curpage'] - 1) * $vars['numresult'];
	$order_id = (int)$vars['order'];
	
	$processurl = "?listChamcong&mod=tinhluong";
	$processurl .= trim($vars['keyword'])?"&keyword=".trim($vars['keyword']):"";

    $obj_config = new config_class();
    $obj_config->getDBbyPkey(1);

    $thubay     = $obj_config->sat_ra;
    $chunhat    = $obj_config->sun_ra;
	
	// --- Get record for edit
	if(isset($vars["act"]) && $vars["act"] == 1):
        $obj_cc = new cc_class();
        if(isset($vars['user_id']) && isset($vars['ngaycong'])){
            $obj_config->getDBbyPkey(1);
            $user_mucluong  = 0;
            $user_phucap    = 0;
            $cc_thang       = date('m');
            $cc_nam         = date('Y');

            $obj_user = new users_class();
            for($i = 1; $i <= count($vars['user_id']); $i++){
                // get luong co ban
                $user_mucluong = $obj_config->luong_coban;
                $obj_user->getDBbyPkey($vars['user_id'][$i]);
                if($obj_user){
                    // get he so luong va tinh luong chinh thuc
                    //echo $obj_user->user_mucluong;
                    $obj_tldn = new tldn_class();
                    $obj_tldn->getDBbyPkey($obj_user->user_mucluong);
                    //rsprint($obj_tldn);
                    $user_mucluong = $user_mucluong*$obj_tldn->tldn_heso;
                    //echo $user_mucluong;
                    // get phu cap
                    $obj_phucap = new phucap_class();
                    $obj_phucap->getDBbyPkey($obj_user->user_phucap);
                    $user_phucap = $obj_phucap->phucap_giatri;

                    $obj_cc->insertChamcong(
                        $obj_user->user_id,
                        $obj_user->user_fullname,
                        $obj_user->user_name,
                        $vars['ngaycong'][$i],
                        $cc_thang,$cc_nam,
                        $user_mucluong,
                        $user_phucap
                    );
                }

                unset($user_phucap);
                unset($user_mucluong);
                unset($obj_tldn);
                unset($obj_phucap);
            }
            unset($obj_user);
        }
        unset($obj_cc);
	endif;
	
	// --- Condition : The row 71 got trouble in uesed --> can't findout the reason
	if($order_id == 1):
	$order_str = "cc_id DESC";
	else:
	$order_str = "cc_id ASC";
	endif;
	
	//$order_str = ($order_id == 1)?"cc_name":"cc_id DESC";
	
	// --- Condition
	$where = " 1 = 1";
	
	// --- Get data to view in homepage
	if ($vars['cc_id_seek']) $where .= " AND cc_id = ".$vars['cc_id_seek'];
	
	$limit = " LIMIT ".(string)$cur_pos.", ".(int)$vars['numresult'];
	
	$obj = new cc_class();
	$obj_list = $obj->getDBList(" $where", $order_str, FALSE, $limit);
	$total_num_result = $obj->getRowNumber("$where");
	$num_page = ceil($total_num_result/$vars['numresult']);
	
	// ------ Print paging ---------
	$pager_str = get_paging_string($processurl, $vars['curpage'], $num_page);

    // --- Get user list
    $obj_user 		= new users_class();
    $where_user 		= " 1 = 1 and user_active=1";
    $obj_list_user	= $obj_user->getDBList(" $where_user", "user_name", FALSE, "");
	
	// --- Debug here ----
	unset($obj);
	
	// --- Get argument of page
	$vars['arg'] = "";
	$vars['arg'] .= $vars['numresult']?"&numresult=".$vars['numresult']:"";
	$vars['arg'] .= $vars['curpage']?"&curpage=".$vars['curpage']:"";
	$vars['arg'] .= $vars['order']?"&order=".$vars['order']:"";
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
	
	$assign_list['obj_list'] 	= $obj_list;
    $assign_list['obj_list_user'] 	= $obj_list_user;
    $assign_list['thubay']  	= $thubay;
    $assign_list['chunhat'] 	= $chunhat;


	$assign_list['pager_str'] 	= $pager_str;
	$assign_list["parentArr"] 	= $parentArr; 
	$assign_list['nrs_arr'] 	= $nrs_arr;
	$assign_list['total_num_result'] = $total_num_result;
	$assign_list['num_page'] 	= $num_page;
	$assign_list['order_arr'] 	= $order_arr;
	$assign_list['processurl'] = $processurl;
	$assign_list['vars'] 		= $vars;
	$assign_list['obj_info'] 	= $obj_info;
	
	$display = dirname(__FILE__)."/skin/B_Chamcong_tbl.tpl";
	$assign_list['display'] = $display;
	
	$smarty->assign($assign_list);
	
	// --- Display template
	if (isset($vars['activeAjax']))
	  $smarty->display(dirname(__FILE__)."/skin/B_Chamcong_tbl.tpl");
	else
	  $smarty->display(dirname(__FILE__)."/skin/B_Thangluong_list.tpl");
?>