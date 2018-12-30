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
	require_once ($CLASSES_PATH.'tinhluong/clsThangluong.php');
	require_once ($CLASSES_PATH.'clsObjects.php');
	// --- Class is used in this page
	$obj = new thangluong_class();
	
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
	
	$processurl = "?listThangluong&mod=tinhluong";
	$processurl .= trim($vars['keyword'])?"&keyword=".trim($vars['keyword']):"";
	
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
	if($vars['sort_me']==1){
	  $obj->sortItem($vars['val'],$vars['thangluong_id']);
	}
	
	// --- Add - Edit
	if($vars['add_edit']==1):
	   if (!isset($vars['thangluong_id']) || $vars['thangluong_id'] < 1) {
		  $obj = new thangluong_class();
		  $obj->readForm();
		  if ((is_null($error)) || ($error == "")) {
			  $obj->thangluong_date = date("Y-m-d");
			  $obj->insertnew();
			  unset($obj);
		  }
	   }else{
		  $obj = new thangluong_class();
		  $obj->readForm();
		  if ((is_null($error)) || ($error == "")) {
			  $obj->thangluong_date = date("Y-m-d");
			  if ($obj->is_already_used($obj->tablename, "thangluong_id", $obj->thangluong_id))
			  {
				  $obj->update();
				  unset($obj);
			  }
		  }
	   }
	endif;
	
	// --- Get record for edit
	if($vars['edit_me']==1):
	   $obj = new thangluong_class();
	   $obj->getDBbyPkey($vars['thangluong_id']);
	   if (!$obj->thangluong_id) redirect("?listThangluong".$arg['arg']);
	   $obj_info = (array)$obj;
	endif;
	
	// --- Condition : The row 71 got trouble in uesed --> can't findout the reason
	if($order_id == 1):
	$order_str = "thangluong_bac ASC";
	else:
	$order_str = "chucvu_id ASC";
	endif;
	
	//$order_str = ($order_id == 1)?"thangluong_name":"thangluong_id DESC";
	
	// --- Condition
	$where = " 1 = 1";
	
	// --- Get data to view in homepage
	if ($vars['chucvu_id_seek']) $where .= " AND chucvu_id = ".$vars['chucvu_id_seek'];
	
	$limit = " LIMIT ".(string)$cur_pos.", ".(int)$vars['numresult'];
	
	$obj = new thangluong_class();
	$obj_list = $obj->getDBList(" $where", $order_str, FALSE, $limit);
	$total_num_result = $obj->getRowNumber("$where");
	$num_page = ceil($total_num_result/$vars['numresult']);
	
	// ------ Print paging ---------
	$pager_str = get_paging_string($processurl, $vars['curpage'], $num_page);
	
	// --- Get object fields list
	$obj_object 		= new object_class();
	$where_object 		= " 1 = 1 and object_active=1";
	$obj_list_object 	= $obj_object->getDBList(" $where_object", "object_name", FALSE, "");
	
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
	$assign_list['pager_str'] 	= $pager_str;
	$assign_list["parentArr"] 	= $parentArr; 
	$assign_list['nrs_arr'] 	= $nrs_arr;
	$assign_list['total_num_result'] = $total_num_result;
	$assign_list['num_page'] 	= $num_page;
	$assign_list['order_arr'] 	= $order_arr;
	$assign_list['processurl'] = $processurl;
	$assign_list['vars'] 		= $vars;
	$assign_list['obj_info'] 	= $obj_info;
	$assign_list['obj_list_object'] = $obj_list_object;
	
	$display = dirname(__FILE__)."/skin/B_Thangluong_tbl.tpl";
	$assign_list['display'] = $display;
	
	$smarty->assign($assign_list);
	
	// --- Display template
	if (isset($vars['activeAjax']))
	  $smarty->display(dirname(__FILE__)."/skin/B_Thangluong_tbl.tpl");
	else
	  $smarty->display(dirname(__FILE__)."/skin/B_Thangluong_list.tpl");
?>