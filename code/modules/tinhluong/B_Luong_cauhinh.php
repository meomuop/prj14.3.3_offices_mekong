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

// --- Class is used in this page
require_once($CLASSES_PATH."clsConfig.php");
require_once ($CLASSES_PATH.'tinhluong/clsTldn.php');
require_once ($CLASSES_PATH.'tinhluong/clsPhucap.php');
require_once ($CLASSES_PATH.'clsObjects.php');

// --- Variables is used in this page
$assign_list = array();
$vars = array_merge($_POST,$_GET, $_FILES);

$processurl = "?cauhinhLuong&mod=tinhluong";

// --- action is process
if(isset($vars["act"]) && $vars["act"] == 2){
    if(isset($vars['user_id']) && isset($vars['user_mucluong']) && isset($vars['user_phucap'])){
        $obj_user = new users_class();
        $totalUpdate = $obj_user->updateMucLuong($vars['user_id'],$vars['user_mucluong'],$vars['user_phucap']);
        unset($obj_user);
    }
}

// --- action is process
if(isset($vars["config_id"])){
    $obj = new config_class();
    // prepare data
    $obj->readForm();
    if ($obj->is_already_used($obj->tablename, "config_id", $obj->config_id)){
        $luong_coban = str_replace('.','', $vars['luong_coban']);
        $obj->updateLuong($vars["config_id"],$luong_coban,1);
        unset($obj);
    }else{
        $assign_list['error'] = $obj->error;
    }
    unset($obj);
}

// --- Get user list
$obj_user 		= new users_class();
$where_user 	= " 1 = 1 and user_active=1";
$obj_list_user	= $obj_user->getDBList(" $where_user", "user_name", FALSE, "");
$total_user     = $obj_user->getRowNumber("$where_user");

// --- Get thang luong doanh nghiep list
$obj_tldn       = new tldn_class();
$where_tldn 	= " 1 = 1 and tldn_active=1";
$obj_list_tldn  = $obj_tldn->getDBList(" $where_tldn", "tldn_id", FALSE, "");

// --- Get phu cap list
$obj_phucap = new phucap_class();
$where_phucap 	= " 1 = 1 and phucap_active=1";
$obj_list_phucap = $obj_phucap->getDBList(" $where_phucap", "phucap_id", FALSE, "");

// --- Get object fields list
$obj_object 		= new object_class();
$where_object 		= " 1 = 1 and object_active=1";
$obj_list_object 	= $obj_object->getDBList(" $where_object", "object_name", FALSE, "");

// --- Get argument of page
$arg = "";
$arg .= $vars['numresult']?"&numresult=".$vars['numresult']:"";
$arg .= $vars['curpage']?"&curpage=".$vars['curpage']:"";
$arg .= trim($vars['mod'])?"&mod=".trim($vars['mod']):"";

$obj = new config_class();
$obj->getDBbyPkey(1);
if (!$obj->config_id){
    unset($obj);
    redirect("?cauhinhLuong&mod=tinhluong".$arg);
}
else
    $vars = (array)$obj;

$vars['arg'] = $arg;
unset($obj);

$assign_list['obj_list_user'] 	= $obj_list_user;
$assign_list['obj_list_tldn'] 	= $obj_list_tldn;
$assign_list['obj_list_phucap'] 	= $obj_list_phucap;
$assign_list['obj_list_object'] = $obj_list_object;
$assign_list['total_user']      = $total_user;

$assign_list['pager_str'] 		= $pager_str;
$assign_list["parentArr"] 		= $parentArr;
$assign_list['nrs_arr'] 		= $nrs_arr;
$assign_list['order_arr'] 		= $order_arr;
$assign_list['processurl'] 		= $processurl;
$assign_list['vars'] 			= $vars;

$display = dirname(__FILE__)."/skin/B_Luong_cauhinh.tpl";
$assign_list['display'] = $display;

$smarty->assign($assign_list);

// --- Display template
if (isset($delstr)):
    $smarty->display(dirname(__FILE__)."/skin/B_Luong_cauhinh.tpl");
else:
    $smarty->display(dirname(__FILE__)."/skin/B_Thangluong_list.tpl");
endif;
?>