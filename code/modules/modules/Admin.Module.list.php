<?php
/*-------------------------------------------
- PHP Frame work
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/
if (!isset($key)){
 	// Error: no category chosen
 	redirect("index.php");
} 

if($_SESSION['user_permission']!=4){
	// Error: low level
 	//redirect("index.php");
}

// --- File is included ---
 require_once($CLASSES_PATH."clsModule.php");

// --- Class is used in this page
$vars = array_merge($_POST, $_GET);
$obj = new module_class();

// --- (Click Del Button)-----
if ($vars['dlStr']){
 	$obj->removeInList($vars['dlStr']);
 }
 
 $vars['arg'] = "";
 
 // --- Variables is used in this page
 $order_arr = array(0 => "Thứ tự cập nhật", 1 => "Theo tên chủ điêm", 2 => "Theo thứ  tự");
 $nrs_arr = array(5,10, 20, 30, 40, 50, 100);
 
 $vars['arg'] .= $vars['mod']?("&mod=".$vars['mod']):"";
 $processurl = "?listModule&".$vars['arg'];
 
 // --- prepare to query
 $order_id = (int)$vars['order'];
 $order_str = ($order_id == 1)?"mod_name":($order_id == 2)?"mod_sort":"mod_id DESC";
 $where = " 1 = 1";
 //$where = " 1 = 1 and module_lang=".$_SESSION['lang'];
 $where .= trim($vars['KeyWord'])?($where?" AND mod_name LIKE '%".trim($vars['KeyWord'])."%'":" mod_name LIKE '%".trim($vars['KeyWord'])."%'"):"";

 // --- prepare to paging 
 $vars['numresult'] = (int)$vars['numresult']?(int)$vars['numresult']:20;
 $total_num_result = $obj->getRowNumber($where);
 $num_page = ceil($total_num_result/$vars['numresult']);
 if (($vars['curpage'] > $num_page) && $num_page) $vars['curpage'] = $num_page;
 $cur_num_result = (($total_num_result%$vars['numresult']!=0)&&($vars['curpage']==$num_page))?($total_num_result%$vars['numresult']):$vars['numresult'];
 if ($vars['curpage'] < 1) $vars['curpage'] = 1;
 $cur_pos = ($vars['curpage'] - 1) * $vars['numresult'];
 
 // --- check and uncheck
 if ($vars['checkUncheck']==1){
 	$obj->checkUncheck($vars['checkUncheckID'],$vars['checkUncheck'],$vars['setfield']);
 }
 if ($vars['checkUncheck']==0){
 	$obj->checkUncheck($vars['checkUncheckID'],$vars['checkUncheck'],$vars['setfield']);
 }
 
 // --- Items sort
 $aa=array();
 $bb=array();
 $counta=count($vars['mod_sort']); 	
 $countb=count($vars['mod_id1']);
 if ($counta>0 and $countb>0) 
 { 
	for ($i=0;$i<$counta;$i++) 
	{ 
		$aa['maxe']=$vars['mod_sort'][$i]; 
		$bb['maxe1']=$vars['mod_id1'][$i];
		$obj->sortItem($aa['maxe'],$bb['maxe1']);
	} 
 }

 $obj->checkmodules();
 
 // --- get data to view
 $limit = " LIMIT ".(string)$cur_pos.", ".(int)$vars['numresult'];
 $obj_list = $obj->getDBList(" $where", $order_str, FALSE, $limit);
 
 // --- Print paging
 $pager_str = get_paging_string($processurl, $vars['curpage'], $num_page);
 // --- Debug here ----
 unset($obj);
 
 // --- send argument to next page
 $vars['arg'] .= $vars['numresult']?("&numresult=".$vars['numresult']):"";
 $vars['arg'] .= $vars['curpage']?("&curpage=".$vars['curpage']):"";
 
 // permissions
 $per_add 	= 1;
 $per_edit 	= 1;
 $per_del 	= 1;
 $per_act 	= 1;

 // --- Assign data to template
 $assign_list = array();
 
 $assign_list['per_add'] = $per_add;
 $assign_list['per_edit'] = $per_edit;
 $assign_list['per_del'] = $per_del;
 $assign_list['per_act'] = $per_act;
 $assign_list['obj_list'] = $obj_list;
 $assign_list['modlist'] = $modlist;
 $assign_list['pager_str'] = $pager_str;
 $assign_list['nrs_arr'] = $nrs_arr;
 $assign_list['total_num_result'] = $total_num_result;
 $assign_list['order_arr'] = $order_arr;
 $assign_list['permissionArr'] = $permissionArr;
 $assign_list['processurl'] = $processurl;
 $assign_list['vars'] = $vars;
 
 $display = dirname(__FILE__)."/skin/Admin.Module.list.Table.tpl";
 $assign_list['display'] = $display;
 
 $smarty->assign($assign_list);

 // --- Display template
 if (isset($vars['activeAjax']))
 	$smarty->display(dirname(__FILE__)."/skin/Admin.Module.list.Table.tpl");
 else
 	$smarty->display(dirname(__FILE__)."/skin/Admin.Module.list.tpl");
?>