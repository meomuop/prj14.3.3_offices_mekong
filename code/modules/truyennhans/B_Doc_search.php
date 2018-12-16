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
 include ($CLASSES_TNVB.'clsDocReceives.php');
 include ($CLASSES_TNVB.'clsDocs.php');
 include ($CLASSES_TNVB.'clsDocCats.php');
 include ($CLASSES_TNVB.'clsDocFields.php');
 include ($CLASSES_TNVB.'clsDocLevels.php');
 include ($CLASSES_TNVB.'clsImportants.php');
 //include ($CLASSES_TNVB."clsUnits.php");
 // --- Class is used in this page
 $obj = new docreceive_class();
 $obj = new doc_class();
 
 // --- Variables is used in this page
 $order_arr = array(0 => "Thứ tự cập nhật", 1 => "Theo tên văn bản", 2 => "Theo thự tự");
 $nrs_arr = array(5,10, 20, 30, 40, 50, 100);
 $vars = array_merge($_POST, $_GET);
 
 // --- Condition : The row 71 got trouble in uesed --> can't findout the reason
 if($order_id == 2):
 $order_str = "doc_sort ASC";
 elseif($order_id == 1):
 $order_str = "doc_code ASC";
 else:
 $order_str = "doc_id DESC";
 endif;
 
 //$order_str = ($order_id == 1)?"doc_name":"doc_id DESC";
 $where = " 1 = 1";
 
 // --- Get data to view in homepage
 if ($vars['docCat_id']) 		$where .= " AND docCat_id LIKE '%".$vars['docCat_id']."%'";
 if ($vars['unit_name']) 		$where .= " AND unit_name ='".$vars['unit_name']."'";
 if ($vars['doc_code']) 		$where .= " AND doc_code LIKE '%".$vars['doc_code']."%'";
 if ($vars['doc_signed'])		$where .= " AND doc_signed LIKE '".date('Y-m-d',strtotime($vars['doc_signed']))."%'";
 if ($vars['doc_desc']) 		$where .= " AND doc_desc LIKE '%".$vars['doc_desc']."%'";
 if ($vars['signPer_id']) 	$where .= " AND signPer_id LIKE '%".$vars['signPer_id']."%'";
 if ($vars['signObj_id']) 	$where .= " AND signObj_id LIKE '%".$vars['signObj_id']."%'";

 if ($vars['doc_type'] == 1):
	 $where.=" and (receive_per=".$_SESSION['user_id']." or R_department_id=".$_SESSION['access_department_id']." or receive_id in(select receive_id from tbl_recusers where user_id=".$_SESSION['user_id']."))"; 
	 
	 $obj = new docreceive_class();
	 $obj_list = $obj->getDBList(" $where", $order_str, FALSE, "");
 else:
	 $obj = new doc_class();
	 $obj_list = $obj->getDBList(" $where", $order_str, FALSE, "");
 endif;

 $total_num_result = $obj->getRowNumber("$where");
 
 // --- Get doc categories list
 $obj_dcat = new docCat_class();
 $where_dcat 		= " 1 = 1 and docCat_active=1";
 $obj_list_dcat 	= $obj_dcat->getDBList(" $where_dcat", "docCat_name", FALSE, "");
 
 // --- get importants
 $obj_important = new important_class();
 $where_important = "1=1 and important_active=1";
 $obj_list_important = $obj_important->getDBList(" $where_important", "important_id DESC", FALSE, "");
  
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
 
 $assign_list['obj_list'] 		= $obj_list;

 $assign_list['obj_list_dcat'] 		= $obj_list_dcat;
 $assign_list['obj_list_important'] 	= $obj_list_important;
 
 $assign_list['docCat_id'] 		= $vars['docCat_id'];
 $assign_list['unit_name'] 		= $vars['unit_name'];
 $assign_list['doc_type'] 		= $vars['doc_type'];
 
 $assign_list['pager_str'] 	= $pager_str;
 $assign_list["parentArr"] 	= $parentArr; 
 $assign_list['nrs_arr'] 	= $nrs_arr;
 $assign_list['total_num_result'] = $total_num_result;
 $assign_list['total_num_result_deact'] = $total_num_result_deact;
 $assign_list['order_arr'] 	= $order_arr;
 $assign_list['processurl'] = $processurl;
 $assign_list['vars'] 		= $vars;
 
 $display = dirname(__FILE__)."/skin/B_Doc_search_tbl.tpl";
 $assign_list['display'] = $display;
 
 $smarty->assign($assign_list);

 // --- Display template
 if (isset($vars['activeAjax']))
 	$smarty->display(dirname(__FILE__)."/skin/B_Doc_search_tbl.tpl");
 else
 	$smarty->display(dirname(__FILE__)."/skin/B_Doc_list.tpl");
?>