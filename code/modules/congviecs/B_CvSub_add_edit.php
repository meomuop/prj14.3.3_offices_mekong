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
require_once($CLASSES_PATH."clsCvSubs.php");
require_once($CLASSES_PATH."clsCvPhoihop.php");
require_once($CLASSES_PATH."clsCvGiamsat.php");
require_once($CLASSES_PATH."clsCvCats.php");
require_once($CLASSES_PATH."clsDepartments.php");
// --- Class is used in this page
$obj = new cv_sub_class();

// --- Variables is used in this page
$vars = array_merge($_POST, $_GET);
if(!$vars['mod']) $vars['mod'] = 'congviecs';

// --- Add - Edit
if($vars['add_edit']==1):
    if (!isset($vars['cv_sub_id']) || $vars['cv_sub_id'] < 1) {
        $obj = new cv_sub_class();
        $obj->readForm();
        if ((is_null($error)) || ($error == "")) {

            $arr_pb = explode(',',$vars['department_id']);
            if(count($arr_pb)>0){
                for($i=0;$i<count($arr_pb);$i++){
                    if($arr_pb[$i]>0){
                        $obj->cv_sub_date = date("Y-m-d");
                        $obj->cv_sub_time_limit = date("Y-m-d",strtotime(str_replace('/','-',$vars['cv_sub_time_limit'])));
                        $obj->user_id = $_SESSION['user_id'];
                        $obj->department_id = $arr_pb[$i];
                        $obj->insertnew();
                    }
                }
            }

            //$lastID = $obj->getLastID();
            unset($obj);
        }

    }else{
        $obj = new cv_sub_class();
        $obj->readForm();

        if ((is_null($error)) || ($error == "")) {

            $arr_pb = explode(',',$vars['department_id']);
            if(count($arr_pb)>0){
                for($i=0;$i<count($arr_pb);$i++){
                    if($arr_pb[$i]>0){
                        $obj->cv_sub_date = date("Y-m-d");
                        $obj->cv_sub_time_limit = date("Y-m-d",strtotime(str_replace('/','-',$vars['cv_sub_time_limit'])));
                        $obj->user_id = $_SESSION['user_id'];
                        $obj->department_id = $arr_pb[$i];

                        $obj->update();
                        unset($obj);
                    }
                }
            }
            unset($obj);
        }

        //----------- phoi hop
        $obj = new cv_phoihop_class();
        $obj->readForm();
        if ((is_null($error)) || ($error == "")) {

            $arr_ph = explode(',',$vars['department_ph_id']);
            if(count($arr_ph)>0){
                for($i=0;$i<count($arr_ph);$i++){
                    if($arr_ph[$i]>0){
                        $obj->cv_phoihop_date = date("Y-m-d");
                        $obj->department_id = $arr_ph[$i];
                        $obj->update();
                    }
                }
            }
            unset($obj);
        }
        //----------- giam sat
        $obj = new cv_giamsat_class();
        $obj->readForm();
        if ((is_null($error)) || ($error == "")) {

            $arr_gs = explode(',',$vars['user_id']);
            if(count($arr_gs)>0){
                for($i=0;$i<count($arr_gs);$i++){
                    if($arr_gs[$i]>0){
                        $obj->cv_giamsat_date_date = date("Y-m-d");
                        $obj->user_id = $arr_gs[$i];
                        $obj->update();
                    }
                }
            }
            unset($obj);
        }
    }
endif;

// --- Get record for edit
if($vars['edit_me']==1):
    $obj = new cv_sub_class();
    $obj->getDBbyPkey($vars['cv_sub_id']);
    $obj_info = (array)$obj;
endif;

// --- Get user list
$obj_user 		= new users_class();
$where_user 	= " 1 = 1 and user_active = 1 and user_level in(4,5)";
$obj_list_user	= $obj_user->getDBList(" $where_user", "user_sort", FALSE, "");

// --- Get department list
$obj_depart 	= new department_class();
$where_depart 	= " 1 = 1 and department_active = 1 and department_id not in(select unit_id from tbl_users where user_level in(4,5))";
$obj_list_depart= $obj_depart->getDBList(" $where_depart", "department_sort", FALSE, "");
$total_depart   = $obj_depart->getRowNumber("$where_depart");

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

$assign_list['obj_list_user'] 	= $obj_list_user;
$assign_list['obj_list_depart'] = $obj_list_depart;
$assign_list['total_depart'] = $total_depart;

$assign_list['cv_sub_id'] 	= $vars['cv_sub_id'];
$assign_list['user_id'] 	= $vars['user_id'];
$assign_list['order_id'] 	= $vars['order_id'];
$assign_list['obj_info'] 	= $obj_info;

$assign_list['cv_cat_id'] 	= $vars['cv_cat_id'];

$assign_list['processurl'] 	= $processurl;
$assign_list['vars'] 		= $vars;

$smarty->assign($assign_list);

// --- Display template
$smarty->display(dirname(__FILE__)."/skin/B_CvSub_add_edit.tpl");
?>