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
  require_once($CLASSES_PATH."clsDepartments.php");
  require_once($CLASSES_PATH."clsObjects.php");
  // --- Class is used in this page
  $obj = new hopdongdocs_class();
  
  // --- Variables is used in this page
  $order_arr = array(0 => "Đang thực hiện", 1 => "Đã hủy", 2 => "Đã hoàn thành");
  $nrs_arr = array(5,10, 20, 30, 40, 50, 100, 150, 200);
  $vars = array_merge($_POST, $_GET);
  
  $loai_hp = $vars['loai_hp'];
  
  if(!isset($vars['tinhtrang'])) $vars['tinhtrang'] = 0;
  
  if(!$vars['mod']) $vars['mod'] = 'hopdongs';
    
  // --- Condition
  $where = " 1 = 1";
  if($_SESSION["user_level"] == 6):
  $where.=" and hopdong_nguoitao in(select user_id from tbl_users where department_id = ".$_SESSION['access_department_id'].") ";
  elseif($_SESSION["user_level"] == 7 or $_SESSION["user_level"] == 8): $where.=" and hopdong_nguoitao = ".$_SESSION['user_id'];
  else:
  $where.=" and hopdong_nguoitao = ".$_SESSION["user_id"];
  endif;
  
  if($vars["user_id"]) $where.=" and hopdong_nguoitao = ".$vars["user_id"];
  if($vars["tu_ngay"]) $where.=" and docreply_date >= '".date('Y-m-d',strtotime($vars["tu_ngay"]))."'";
  if($vars["den_ngay"]) $where.=" and docreply_date <= '".date('Y-m-d',strtotime($vars["den_ngay"]))."'";
    
  if($vars['tinhtrang'] == 1):
  $where1 = $where." and (hopdong_sohd = '' or hopdong_sohd is null) and hopdong_tinhtrang = 0";
  $where2 = $where." and hopdong_tinhtrang = 1";
  
  $obj = new hopdongdocs_class();
  $obj_list = $obj->getDBList($where1, "hopdong_id DESC", FALSE, "");
  $total_num = $obj->getRowNumber($where1);
  
  $obj2 = new hopdongdocs_class();
  $obj_list_huy = $obj2->getDBList($where2, "hopdong_id DESC", FALSE, "");
  $total_num_huy = $obj2->getRowNumber($where2);
 
  elseif($vars['tinhtrang'] == 0):
  $where2 = $where." and hopdong_sohd != '' and hopdong_tinhtrang = ".$vars['tinhtrang'];
  $obj = new hopdongdocs_class();
  $obj_list = $obj->getDBList($where2, "hopdong_id DESC", FALSE, "");
  $total_num = $obj->getRowNumber($where2);
  
  elseif($vars['tinhtrang'] == 2):
  $where2 = $where." and hopdong_tinhtrang = ".$vars['tinhtrang'];
  $obj = new hopdongdocs_class();
  $obj_list = $obj->getDBList($where2, "hopdong_id DESC", FALSE, "");
  $total_num = $obj->getRowNumber($where2);
  endif;
  
  
  //rsprint($obj_list);
  
  // --- Get user list
  $obj_user 		= new users_class();
  
  if($vars["user_id"]):
  $obj_user->getDBbyPkey($vars["user_id"]);
  $user_info = (array) $obj_user;
  endif;
  //rsprint($user_info);
  
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
  
  // --- export
  if($vars['exptype']==1):
  header("Content-Type: application/vnd.ms-excel");
  header("Expires: 0");
  header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
  header("content-disposition: attachment;filename=BC_HD_".date('d-m-Y').".xls");
  elseif($vars['exptype']==3):
  header("Content-Type: application/vnd.ms-word");
  header("Expires: 0");
  header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
  header("content-disposition: attachment;filename=BC_HD_".date('d-m-Y').".doc");
  endif;
 
  // --- Debug here ----
  unset($obj);
  
  // --- Get argument of page
  $vars['arg'] = "";
  $vars['arg'] .= $vars['mod']?("&mod=".$vars['mod']):"";
  $vars['arg'] .= $vars['tu_ngay']?("&tu_ngay=".$vars['tu_ngay']):"";
  $vars['arg'] .= $vars['den_ngay']?("&den_ngay=".$vars['den_ngay']):"";
  $vars['arg'] .= $vars['user_id']?("&user_id=".$vars['user_id']):"";
  
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
  
  $assign_list['obj_list'] 		= $obj_list;
  $assign_list['obj_list_huy'] 	= $obj_list_huy;
  $assign_list['obj_list_user'] = $obj_list_user;
  $assign_list['user_info'] 	= $user_info;
  
  $assign_list['hopdong_tinhtrang'] 	= $vars['tinhtrang'];
  
  $assign_list['obj_list_department'] 	= $obj_list_department;
  $assign_list['obj_list_object'] 		= $obj_list_object;
  
  $assign_list['tu_ngay'] 	= $vars['tu_ngay'];
  $assign_list['den_ngay'] 	= $vars['den_ngay'];
  $assign_list['user_id'] 	= $vars['user_id'];
  
  $assign_list['total_num'] 	= $total_num;
  $assign_list['total_num_huy'] = $total_num_huy;
  $assign_list['vars'] 			= $vars;
  
  $smarty->assign($assign_list);
  
  // --- Display template
  if($loai_hp==1):
  $smarty->display(dirname(__FILE__)."/skin/B_HopdongReport_exp.tpl");
  else:
  $smarty->display(dirname(__FILE__)."/skin/B_HopdongReport_bdg_exp.tpl");
  endif;
?>