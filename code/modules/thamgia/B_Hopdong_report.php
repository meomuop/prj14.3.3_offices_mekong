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
  include ($CLASSES_PATH.'clsHopdongDocs.php');
  include ($CLASSES_PATH.'clsNgansachs.php');
  include ($CLASSES_PATH.'clsTaisans.php');
  include ($CLASSES_PATH.'clsLoaitaisans.php');
  
  // --- Variables is used in this page
  $vars = array_merge($_POST, $_GET);
  
  if(!$vars['mod']) $vars['mod'] = 'docs';
  
  // --- Get user list
  $obj_user 		= new users_class();
  $where_user 		= " 1 = 1 and department_id = ".$_SESSION['access_department_id'];
  $obj_list_user	= $obj_user->getDBList(" $where_user", "user_name", FALSE, "");
  
  // --- Get department list
  $obj_department 		= new department_class();
  $where_department 		= " 1 = 1 and department_active=1";
  $obj_list_department	= $obj_department->getDBList(" $where_department", "department_name", FALSE, "");
   
  // --- Get object list
  $obj_object 		= new object_class();
  $where_object 		= " 1 = 1 and object_active=1";
  $obj_list_object 	= $obj_object->getDBList(" $where_object", "object_name", FALSE, "");
  
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
  $vars['arg'] .= $vars['tu_ngay']?("&tu_ngay=".$vars['tu_ngay']):"";
  $vars['arg'] .= $vars['den_ngay']?("&den_ngay=".$vars['den_ngay']):"";
  $vars['arg'] .= $vars['user_id']?("&user_id=".$vars['user_id']):"";
  $vars['arg'] .= $vars['tinhtrang']?("&tinhtrang=".$vars['tinhtrang']):"";
  
  // permissions
  $per_add 	= 1;
  $per_edit = 1;
  $per_del 	= 1;
  $per_act 	= 1;
  
  // --- Assign data to template
  $assign_list = array();
  
  $assign_list['per_add'] 	= $per_add;
  $assign_list['per_edit'] 	= $per_edit;
  $assign_list['per_del'] 	= $per_del;
  $assign_list['per_act'] 	= $per_act;
  
  $assign_list['obj_list_user'] = $obj_list_user;
  $assign_list['obj_list_department'] 	= $obj_list_department;
  $assign_list['obj_list_object'] 		= $obj_list_object;
  
  $assign_list['pager_str'] 	= $pager_str;
  $assign_list["parentArr"] 	= $parentArr; 
  $assign_list['nrs_arr'] 		= $nrs_arr;
  $assign_list['total_num_result'] = $total_num_result;
  $assign_list['order_arr'] 	= $order_arr;
  $assign_list['order_id'] 		= $order_id;
  $assign_list['processurl'] 	= $processurl;
  $assign_list['vars'] 			= $vars;
  
  $display = dirname(__FILE__)."/skin/B_Hopdong_report_tbl.tpl";
  $assign_list['display'] = $display;
  
  $smarty->assign($assign_list);
  
  // --- Display template
  if (isset($vars['activeAjax']))
  $smarty->display(dirname(__FILE__)."/skin/B_Hopdong_report_tbl.tpl");
  else
  $smarty->display(dirname(__FILE__)."/skin/B_Hopdong_list.tpl");
?>