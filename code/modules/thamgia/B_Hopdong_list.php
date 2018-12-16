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
 include ($CLASSES_PATH.'clsHopdongs.php');
 include ($CLASSES_PATH.'clsNgansachs.php');
 include ($CLASSES_PATH.'clsTaisans.php');
 include ($CLASSES_PATH.'clsLoaitaisans.php');
 // --- Class is used in this page
 $obj = new hopdong_class();
 
 // --- Variables is used in this page
 $order_arr = array(0 => "Đang thực hiện", 1 => "Đã hủy", 2 => "Đã hoàn thành");
 $nrs_arr = array(5,10, 20, 30, 40, 50, 100, 150, 200);
 $vars = array_merge($_POST, $_GET);
 
 if(!$vars['mod']) $vars['mod'] = 'docs';
 
 if (!(int)$vars['curpage']){
	$vars['curpage'] = 1;
 }else{
 	$vars['arg'] = "&curpage=".$vars['curpage']."&numresult=".$vars['numresult'];
 } 
 $vars['numresult'] = (int)$vars['numresult']?(int)$vars['numresult']:100;
 $cur_pos = ($vars['curpage'] - 1) * $vars['numresult'];
 $order_id = (int)$vars['order'];
 
 $processurl = "?listHopdong&mod=hopdongs";
 $processurl .= $vars['doc_id']?"&doc_id=".$vars['doc_id']:""; 
 
 // --- Del Product which is selected
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
 $aa=array();
 $bb=array();
 $counta=count($vars['hopdong_sort']); 	
 $countb=count($vars['hopdong_id1']);
 if ($counta>0 and $countb>0) 
 { 
	for ($i=0;$i<$counta;$i++) 
	{ 
		$aa['maxe']=$vars['hopdong_sort'][$i]; 
		$bb['maxe1']=$vars['hopdong_id1'][$i];
		$obj->sortItem($aa['maxe'],$bb['maxe1']);
	} 
 }
 
 // --- Condition : The row 71 got trouble in uesed --> can't findout the reason
/* if($order_id == 2):
 $order_str = "hopdong_sort ASC";
 elseif($order_id == 1):
 $order_str = "hopdong_code ASC";
 else:
 $order_str = "hopdong_id DESC";
 endif;
*/ 
 //$order_str = ($order_id == 1)?"hopdong_name":"hopdong_id DESC";
 
 // --- Condition
 $where = " 1 = 1";
 if($_SESSION["user_level"] == 6):
   $where.=" and hopdong_nguoitao in(select user_id from tbl_users where department_id = ".$_SESSION['access_department_id'].") ";
 elseif($_SESSION["user_level"] == 9): $where.=" ";
 else:
   $where.=" and hopdong_nguoitao = ".$_SESSION["user_id"];
 endif;
 
 // --- Get data to view in homepage
 if ($vars['doc_id']) 		$where .= " AND doc_id =".$vars['doc_id'];
 
 $limit = " LIMIT ".(string)$cur_pos.", ".(int)$vars['numresult'];
 
 if($order_id == 0):
 $where.=" and hopdong_tinhtrang = 0";
 elseif($order_id == 1):
 $where.=" and hopdong_tinhtrang = 1";
 else:
 $where.=" and hopdong_tinhtrang = 2";
 endif;
 $obj = new hopdong_class();
 $obj_list = $obj->getDBList(" $where", "hopdong_id DESC", FALSE, $limit);
 $total_num_result = $obj->getRowNumber("$where");
 $num_page = ceil($total_num_result/$vars['numresult']);
 
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
 $vars['arg'] .= $vars['doc_id']?("&doc_id=".$vars['doc_id']):"";
 
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
 
 $assign_list['docCat_id'] 		= $vars['docCat_id'];
 $assign_list['docField_id'] 	= $vars['docField_id'];
 $assign_list['docLevel_id'] 	= $vars['docLevel_id'];
 
 $assign_list['pager_str'] 	= $pager_str;
 $assign_list["parentArr"] 	= $parentArr; 
 $assign_list['nrs_arr'] 	= $nrs_arr;
 $assign_list['total_num_result'] = $total_num_result;
 $assign_list['order_arr'] 	= $order_arr;
 $assign_list['order_id'] 	= $order_id;
 $assign_list['processurl'] = $processurl;
 $assign_list['vars'] 		= $vars;
 
 $display = dirname(__FILE__)."/skin/B_Hopdong_tbl.tpl";
 $assign_list['display'] = $display;
 
 $smarty->assign($assign_list);

 // --- Display template
 if (isset($vars['activeAjax']))
 	$smarty->display(dirname(__FILE__)."/skin/B_Hopdong_tbl.tpl");
 else
 	$smarty->display(dirname(__FILE__)."/skin/B_Hopdong_list.tpl");
?>