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
	include ($CLASSES_PATH.'clsDocReplys.php');
	require_once ($CLASSES_PATH.'clsDocs.php');
	require_once ($CLASSES_PATH.'clsUsers.php');
	require_once ($CLASSES_PATH.'clsObjects.php');
	require_once ($CLASSES_PATH."clsDepartments.php");
	require_once ($CLASSES_PATH."clsDocdays.php");
	
	// --- Class is used in this page
	$obj = new docReply_class();
	
	// --- Variables is used in this page
	$order_arr = array(0 => "Thứ tự cập nhật", 1 => "Theo thự tự");
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
	
	$processurl = "?listDocReply&mod=docs";
	$processurl .= trim($vars['KeyWord'])?"&KeyWord=".trim($vars['KeyWord']):"";
	$processurl .= $vars['doc_id']?"&doc_id=".$vars['doc_id']:"";
	$processurl .= $vars['user_id']?"&user_id=".$vars['user_id']:"";
	
	// --- Del Product which is selected
	if ($vars['dlStr']){
		$obj->removeInList($vars['dlStr']);
		$obj->resetTraned($vars['doc_id']);
	}
	
	// --- Check and uncheck
	if ($vars['checkUncheck']==1){
		$obj->checkUncheck($vars['checkUncheckID'],$vars['checkUncheck'],$vars['setfield']);
	}
	if ($vars['checkUncheck']==2){
		$obj->checkUncheck($vars['checkUncheckID'],$vars['checkUncheck'],$vars['setfield']);
	}
	
	// --- Add - Edit
	if($vars['add_edit']==1):
		if (!isset($vars['docReply_id']) || $vars['docReply_id'] < 1) {
			$obj = new docReply_class();
			$obj->readForm();
			if ((is_null($error)) || ($error == "")) {
				if($_SESSION['user_level']== 4 || $_SESSION['user_level']== 5 || $_SESSION['user_level']== 9 || $_SESSION['user_level']== 1):
                    if($vars['coordinate_depart']):
						$obj->coordinate_depart = substr($vars['coordinate_depart'],0,strlen($vars['coordinate_depart'])-1);
					endif;
					if($vars['department_id']):
						$obj->department_id = substr($vars['department_id'],0,strlen($vars['department_id'])-1);
					endif;
					
					// --------------------------- begin date process ---------------------------------
					$sql = "SELECT sat_ra,sun_ra,site_banner FROM tbl_config WHERE config_id = 1";
						$query_config = mysql_query($sql) or die(mysql_error());
						$row_config=mysql_fetch_array($query_config);
					
					if($vars['docReply_limit_time'] != ''): // trong truong hop co han giai quyet
						$obj->docReply_limit_time = date('Y-m-d',strtotime(str_replace('/','-',$vars['docReply_limit_time'])));
					elseif($vars['daynum_num']=="" && $vars['daynum_standfor']=="" && $vars['docReply_limit_time']==""):
						$obj->docReply_limit_time = date('Y-m-d',strtotime(str_replace('/','-',$row_config['site_banner'])));
					else:
						// -- chuan bi so ngay xu ly de tinh toan han giai quyet
						if($vars['daynum_standfor']!= ''):
							$obj_docday 	= new docday_class();
							$docday_num		= $obj_docday->getDocdaynum($vars['daynum_standfor']);
							if($docday_num!='')$daynum_cal = $docday_num;
							else $daynum_cal = 0;
						elseif($vars['daynum_num']!= 0):
							$daynum_cal = $vars['daynum_num'];
						endif;
						
						$sql_holiday = "SELECT holiday_id,holiday_name,holiday_date FROM tbl_holidays WHERE 1 = 1";
						$result_holiday = mysql_query($sql_holiday);
						if(mysql_num_rows($result_holiday)>0):
							$holiday_str = array();
							$i=0;
							while($row_holiday=mysql_fetch_array($result_holiday)):
								$holiday_str[$i]=$row_holiday['holiday_date'] ;
								$i++;
							endwhile;
						endif;
						
						$date_begin = strtotime(str_replace('/','-',$vars['docReply_date']));
						$date_end = date_limit_calculate($date_begin,$daynum_cal,$holiday_str,$row_config['sat_ra'],$row_config['sun_ra']);
						
						$obj->docReply_limit_time = date('Y-m-d',$date_end);
						$obj->docReply_numday = $daynum_cal;
					endif;
					// --------------------------- end date process ---------------------------------
					
					if($vars['main_department']!=0) $obj->recevie_per = 0;
					$obj->docReply_date = date('Y-m-d',strtotime(str_replace('/','-',$vars['docReply_date'])));
					
					$obj_last = new docReply_class();
					$where_last = "1 = 1 and doc_id = ".$vars['doc_id']." order by docReply_id desc limit 1";
					$last_id = $obj_last->getLastID($where_last);
					
					$obj_update = new docReply_class();
					$where_active = "1 = 1 and docReply_id =".$last_id;
					$obj_update ->updateActive($where_active);
					
					$obj->insertnew();
									
					$obj_doc = new doc_class();
					$obj_doc->changeDocReplied($vars['doc_id']);
					if($vars['doc_theodoi']):
					$obj_doc->updateTheodoi($vars['doc_id'],$vars['doc_theodoi']);
					endif;

                    // change doc_active = 2 anyway.
                    $obj_doc->updateStatus($vars['doc_id'],2);
					unset($obj);
					
				// xu ly cua truong phong, pho phong	
				elseif($_SESSION['user_level']== 6 || $_SESSION['user_level']== 7 || $_SESSION['user_level']== 3): 
					$obj->input_per = $_SESSION["user_id"];
					$obj->user_id = $_SESSION["user_id"];
					$obj->department_id = 0;
					
					$obj->docReply_date = date('Y-m-d',strtotime(str_replace('/','-',$vars['docReply_date'])));
					if($vars['docReply_limit_time']==""):
						$obj->docReply_limit_time = date('Y-m-d',strtotime(str_replace('/','-',$row_config['site_banner'])));
					else:
						$obj->docReply_limit_time = date('Y-m-d',strtotime(str_replace('/','-',$vars['docReply_limit_time'])));
					endif;
					
					if($vars['process_per_01'] !=0 ): $obj->process_per = $vars['process_per_01'];
					else: $obj->process_per = $vars['process_per_02'];
					endif;
					
					$obj_last = new docReply_class();
					$where_last = "1 = 1 and doc_id = ".$vars['doc_id']." order by docReply_id desc limit 1";
					$last_id = $obj_last->getLastID($where_last);
					
					$obj_update = new docReply_class();
					$where_active = "1 = 1 and docReply_id =".$last_id;
					$obj_update ->updateTraned($where_active);
					
					$obj->insertnew();
					unset($obj);

                    // chuyen vien phoi hop
                    $cv_ph_arr = explode(',',substr($vars['cv_ph'],0,strlen($vars['cv_ph'])-1));
                    if(count($cv_ph_arr)>0){
                        for($i=0;$i<count($cv_ph_arr);$i++){
                            $sql = "insert into tbl_cvph(`doc_id`,`user_id`,`cvph_date`) values(".$vars['doc_id'].",".$cv_ph_arr[$i].",'".date('Y-m-d')."')";
                            mysql_query($sql) or die($sql);
                        }
                    }
				endif;
			}
		}else{
			$obj = new docReply_class();
			$obj->readForm();
			if ((is_null($error)) || ($error == "")) {
				if ($obj->is_already_used($obj->tablename, "docReply_id", $obj->docReply_id))
				{
					if(strlen($vars['coordinate_depart'])>0):
						$obj->coordinate_depart = substr($vars['coordinate_depart'],0,strlen($vars['coordinate_depart'])-1);
					else:
						$obj->coordinate_depart = '0';
					endif;
					
					if(strlen($vars['department_id'])>0):
						$obj->department_id = substr($vars['department_id'],0,strlen($vars['department_id'])-1);
					else:
						$obj->department_id = '0';
					endif;
					
					if($vars['main_department']!=0):
						$obj->main_department = $vars['main_department'];
					else:
						$obj->main_department = '0';
					endif;
					
					if($vars['recevie_per']!=0):
						$obj->recevie_per = $vars['recevie_per'];
					else:
						$obj->recevie_per = '0';
					endif;
					
					if(strlen($vars['coordinate_per'])>0):
						$obj->coordinate_per = substr($vars['coordinate_per'],0,strlen($vars['coordinate_per'])-1);
					else:
						$obj->coordinate_per = '0';
					endif;
					
					if($vars['process_per_02']!=0):
						$obj->process_per = $vars['process_per_02'];
					else:
						$obj->process_per = $vars['process_per_01'];
					endif;
					
					$obj->docReply_active = '0';
					$obj->input_per = $_SESSION['user_id'];
					$obj->docReply_limit_time = date('Y-m-d',strtotime(str_replace('/','-',$vars['docReply_limit_time'])));
					$obj->docReply_date = date('Y-m-d',strtotime(str_replace('/','-',$vars['docReply_date'])));

                    $obj->update();

                    $obj_doc = new doc_class();
                    $obj_doc->changeDocReplied($vars['doc_id']);
                    if($vars['doc_theodoi']):
                        $obj_doc->updateTheodoi($vars['doc_id'],$vars['doc_theodoi']);
                    endif;

					$complete = "Đã cập nhật thành công!";
					unset($obj);
				}
			}
		}
	endif;
		
	// --- Get record for edit
	if($vars['edit_me']==1):
		$obj = new docReply_class();
		$obj->getDBbyPkey($vars['docReply_id']);
		//if (!$obj->docReply_id) redirect("?listDocFile".$arg['arg']);
		$obj_info = (array)$obj;
	 
		 // --- Get department selected list
		$obj_depa_selected 		= new department_class();
		$where_depa_selected 		= " 1 = 1 and department_active=1 and department_id in (".$obj->department_id.")";
		$obj_list_depa_selected	= $obj_depa_selected->getDBList(" $where_depa_selected", "department_name", FALSE, "");
			
		// --- Get department list
		$obj_depa_unse		= new department_class();
		$where_depa_unse		= " 1 = 1 and department_active=1 and (department_type=1 or department_type=3)";
		if($obj->department_id != 0)  $where_depa_unse	.=" and department_id not in (".$obj->department_id.")";
		$obj_list_depa_unse	= $obj_depa_unse->getDBList(" $where_depa_unse", "department_name", FALSE, "");
			
		// --- Get department list
		$obj_department 		= new department_class();
		$where_department 		= " 1 = 1 and department_active=1 and (department_type=1 or department_type=3) and department_id in(select unit_id from tbl_users where user_level not in(4,5))";
		$obj_list_department	= $obj_department->getDBList(" $where_department", "department_name", FALSE, "");
		
		// --- Get coordinate_per selected list
		$obj_coordinate_per_selected 		= new users_class();
		$where_coordinate_per_selected 		= " 1 = 1 and user_active=1 and user_level = 5 and user_id in (".$obj->coordinate_per.")";
		$obj_list_coordinate_per_selected	= $obj_coordinate_per_selected->getDBList(" $where_coordinate_per_selected", "user_name", FALSE, "");
		
		// --- Get coordinate_per list
		$obj_coordinate_per_unse		= new users_class();
		$where_coordinate_per_unse		= " 1 = 1 and user_active=1 and user_level = 5";
		if($obj->user_id != 0)  $where_coordinate_per_unse	.=" and user_id not in (".$obj->coordinate_per.")";
		$obj_list_coordinate_per_unse	= $obj_coordinate_per_unse->getDBList(" $where_coordinate_per_unse", "user_name", FALSE, "");
		
		// --- Get coordinate_depart selected list
		$obj_coordinate_depart_selected 		= new department_class();
		$where_coordinate_depart_selected 		= " 1 = 1 and department_active=1 and department_id in (".$obj->coordinate_depart.")";
		$obj_list_coordinate_depart_selected	= $obj_coordinate_depart_selected->getDBList(" $where_coordinate_depart_selected", "department_name", FALSE, "");
		
		// --- Get coordinate_depart list
		$obj_coordinate_depart_unse		= new department_class();
		$where_coordinate_depart_unse		= " 1 = 1 and department_active=1 ";
		if($obj->user_id != 0)  $where_coordinate_depart_unse	.=" and department_id not in (".$obj->coordinate_depart.")";
		$obj_list_coordinate_depart_unse	= $obj_coordinate_depart_unse->getDBList(" $where_coordinate_depart_unse", "department_name", FALSE, "");
	endif;
	
	// --- Condition : The row 71 got trouble in uesed --> can't findout the reason
	if($order_id == 1):
	$order_str = "docReply_id ASC";
	else:
	$order_str = "docReply_id ASC";
	endif;
	
	//$order_str = ($order_id == 1)?"docReply_name":"docReply_id DESC";
	
	// --- Condition
	$where = " 1 = 1";
	
	// --- Get data to view in homepage
	if (trim($vars['KeyWord'])) $where .= " AND docReply_desc LIKE '%".trim($vars['KeyWord'])."%' ";
	if ($vars['doc_id']) $where .= " AND doc_id =".$vars['doc_id'];
	
	$limit = " LIMIT ".(string)$cur_pos.", ".(int)$vars['numresult'];
	
	$obj = new docReply_class();
	$obj_list = $obj->getDBList(" $where", $order_str, FALSE, $limit);
	$total_num_result = $obj->getRowNumber("$where");
	$num_page = ceil($total_num_result/$vars['numresult']);
	
	$obj_doc = new doc_class();
	$obj_doc->getDBbyPkey($vars['doc_id']);
	$doc_theodoi = $obj_doc->doc_theodoi;
	$doc_num = $obj_doc->doc_num;
	$doc_code = $obj_doc->doc_code;
    $doc_info = (array)$obj_doc;
	
	// --- Get user list
	$obj_user 		= new users_class();
	if(in_array($_SESSION['user_level'],array(1,4,5,9))):
	$where_user 		= " 1 = 1 and user_active = 1 and user_level in(4,5) and user_id != ".$vars['user_id'];
	else:
	$where_user 		= " 1 = 1 and user_active = 1 and user_level in(7,8) and user_id != ".$_SESSION['user_id']." and unit_id = ".$_SESSION['access_unit_id'];
	endif;
	$obj_list_user	= $obj_user->getDBList(" $where_user", "user_sort", FALSE, "");
	
	$obj_user_all 		= new users_class();
	$where_user_all 		= " 1 = 1 and user_active=1";
	$obj_list_user_all	= $obj_user_all->getDBList(" $where_user_all", "user_name", FALSE, "");
	
	unset($obj_doc);
	
	// --- Get object list
	$obj_object 		= new object_class();
	$where_object 		= " 1 = 1 and object_active=1";
	$obj_list_object	= $obj_object->getDBList(" $where_object", "object_name", FALSE, "");
	
	// --- Get department list
	$obj_department 		= new department_class();
	$where_department 		= " 1 = 1 and department_active=1 and (department_type=1 or department_type=3) and department_id in(select unit_id from tbl_users where user_level not in(4,5))";
	$obj_list_department	= $obj_department->getDBList(" $where_department", "department_name", FALSE, "");
	
	// --- Get docday list
	$obj_docday 		= new docday_class();
	$where_docday 		= " 1 = 1 and docday_active=1";
	$obj_list_docday	= $obj_docday->getDBList(" $where_docday", "docday_sort", FALSE, "");
	
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
	$vars['arg'] .= $vars['user_id']?("&user_id=".$vars['user_id']):"";
	
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
	$assign_list['view'] 		= $vars['view'];
	
	$assign_list['obj_list'] 	= $obj_list;
	$assign_list['obj_list_user'] 	= $obj_list_user;
	$assign_list['obj_list_object'] 	= $obj_list_object;
	$assign_list['obj_list_department'] = $obj_list_department;
	$assign_list['obj_list_docday'] = $obj_list_docday;
	$assign_list['obj_list_user_all'] = $obj_list_user_all;
	
	$assign_list['doc_id'] 		= $vars['doc_id'];
	$assign_list['user_id'] 	= $vars['user_id'];
	$assign_list['order_id'] 	= $vars['order_id'];
	
	$assign_list['pager_str'] 	= $pager_str;
	$assign_list["parentArr"] 	= $parentArr; 
	$assign_list['nrs_arr'] 	= $nrs_arr;
	$assign_list['total_num_result'] = $total_num_result;
	$assign_list['num_page'] 	= $num_page;
	$assign_list['order_arr'] 	= $order_arr;
	$assign_list['processurl'] 	= $processurl;
	$assign_list['vars'] 		= $vars;
	
	// --------------- edit --------------------
	$assign_list['obj_info'] 	= $obj_info;
	
	$assign_list['obj_list_depa_selected'] = $obj_list_depa_selected;
	$assign_list['obj_list_depa_unse'] = $obj_list_depa_unse;
	
	$assign_list['obj_list_coordinate_per_selected'] = $obj_list_coordinate_per_selected;
	$assign_list['obj_list_coordinate_per_unse'] = $obj_list_coordinate_per_unse;
	
	$assign_list['obj_list_coordinate_depart_selected'] = $obj_list_coordinate_depart_selected;
	$assign_list['obj_list_coordinate_depart_unse'] = $obj_list_coordinate_depart_unse;
	//------------------------------------------
	
	$assign_list['doc_num'] = $doc_num;
	$assign_list['doc_code'] = $doc_code;
	$assign_list['doc_theodoi'] = $doc_theodoi;
    $assign_list['doc_info'] = $doc_info;

	
	$display = dirname(__FILE__)."/skin/B_DocReply_tbl.tpl";
	$assign_list['display'] = $display;
	
	$smarty->assign($assign_list);
	
	// --- Display template
	if (isset($vars['activeAjax']))
	$smarty->display(dirname(__FILE__)."/skin/B_DocReply_tbl.tpl");
	else
	$smarty->display(dirname(__FILE__)."/skin/B_Doc_list.tpl");
?>