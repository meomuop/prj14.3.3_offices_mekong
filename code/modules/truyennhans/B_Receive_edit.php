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
	
	if($_SESSION["per_edit"]!=1):
	include ("admin_index.php"); 
	endif;
	
	// --- Class is used in this page
	include ($CLASSES_TNVB.'clsReceives.php');
	require_once ($CLASSES_TNVB.'clsDocs.php');
	require_once ($CLASSES_TNVB.'clsDocFiles.php');
	require_once ($CLASSES_TNVB."clsRecusers.php");
	
	// --- Variables is used in this page
	$assign_list = array();
	$vars = array_merge($_POST,$_GET, $_FILES);
	
	$processurl = "?editReceive&mod=receives";
	$processurl .= $vars['doc_id']?"&doc_id=".$vars['doc_id']:"";
	
	// --- Del items which is selected
	if ($vars['dlStr']){
	$obj = new docfile_trans_class();
	$obj->removeInList($vars['dlStr']);
	unset($obj);
	}
	
	if (isset($vars['submitDocFiles'])) {
		if ($vars['docFile_name']=="") {
			$errorfile = "Bạn chưa nhập tên tệp tin!";
		}elseif ($vars['docFile_path']=="") {
			$errorfile = "Bạn chưa nhập đường dẫn";
		}else{
			$obj = new docfile_trans_class();
			$obj->readForm();
			if ((is_null($error)) || ($error == "")) {
				$obj->docFile_date = date("Y-m-d");
				$obj->doc_id = $vars['doc_id'];
				$obj->insertnew();
				unset($obj);
				redirect("?editReceive".$vars['arg']);
			}
		}
	}
	
	$arg = "";
	if($vars["curpage"]) 		$arg = $arg."&curpage=".$vars["curpage"];
	if($vars["numresult"]) 		$arg = $arg."&numresult=".$vars["numresult"];
	if(trim($vars['KeyWord'])) 	$arg = $arg."&KeyWord=".trim($vars['KeyWord']);
	if($vars["order"]) 			$arg = $arg."&order=".$vars["order"];
	if(trim($vars['mod'])) 		$arg = $arg."&mod=".trim($vars['mod']);
	if($vars["doc_id"]) 		$arg = $arg."&doc_id=".$vars["doc_id"];
	$doc_id = $vars["doc_id"];
	
	// --- Get user list
	$obj_user 		= new users_class();
	$where_user 		= " 1 = 1 and user_active = 1 and user_id != ".$_SESSION['user_id']."";
	$obj_list_user	= $obj_user->getDBList(" $where_user", "user_sort", FALSE, "");
	
	// --- Get department selected list
	$obj_depa_selected 		= new department_class();
	$where_depa_selected 	= " 1 = 1 and department_active=1 and department_id in(select department_id from tbl_receives where doc_id=".$vars['doc_id'].")";
	$obj_list_depa_selected	= $obj_depa_selected->getDBList(" $where_depa_selected", "department_name", FALSE, "");
	$department_array = "";
	for($k=0;$k<count($obj_list_depa_selected);$k++):
		$department_array .= $obj_list_depa_selected[$k]->department_id.',';
	endfor;
	
	// --- Get department list
	$obj_depa_unse 		= new department_class();
	$where_depa_unse 	=  " 1 = 1 and department_active=1 and department_id not in(select department_id from tbl_receives where doc_id=".$vars['doc_id'].")";
	$obj_list_depa_unse	= $obj_depa_unse->getDBList(" $where_depa_unse", "department_name", FALSE, "");
	
	// --- Get document files list
	$obj_docfile 		= new docfile_trans_class();
	$where_docfile 		= " 1 = 1 and doc_id=".$vars['doc_id'];
	$obj_list_docfile	= $obj_docfile->getDBList(" $where_docfile", "docFile_name", FALSE, "");
			
	$obj_doc = new doc_class();
	$obj_doc->getDBbyPkey($vars['doc_id']);
	$doc_info = (array)$obj_doc;
		
	if ($vars['add_edit']==1) {
		$obj = new receive_class();
		$obj->readForm();
		if ((is_null($error)) || ($error == "")) {
			$obj_rec = new recuser_class();
			//--- Delete the all privious records by doc_id
			$obj_rec -> delByDocID($vars['doc_id']);
			$obj -> delByDocID($vars['doc_id']);
			
			//--- insert new recodrs
			$department_array = explode(',',$vars['department_array']);
			for($i=0;$i<count($department_array)-1;$i++):
				$obj->receive_time=date('Y-m-d h:m:i');
				$obj->doc_id = $vars['doc_id'];
				$obj->department_id=$department_array[$i];
				$obj->receive_per=$vars['receive_per'][$department_array[$i]];
				$obj->receive_note=$vars['receive_note'][$department_array[$i]];
				$obj->insertnew();
				
				//---if $vars['receive_per'][$department_array[$i]] == 1: send sms to the one who was chosen
				if($vars['receive_sms'][$department_array[$i]]==1):
					$obj_user = new users_class();
					$obj_user->getDBbyPkey($vars['receive_per'][$department_array[$i]]);
					//no need to check user sms permission if only one user receive record
					$send_msgs = new php_sms();
					$send_msgs->send_sms(str_replace(' ','',$obj_user->user_phone), fnsSubstr(fnsUnUnicode('STC - Van ban moi nhan: '.$vars['doc_desc'],2),120,0), $vars['com_port']);
					unset($send_msgs);
					unset($obj_user);
				endif;
				
				/*---------------------------------------------------------------
				in case that $vars['receive_per'][$department_array[$i]] = 0:
				- insert into tbl_recusers with the last ID from tbl_receives
				- send sms to earch one if sms is true
				------------------------------------------------------------------*/
				if($vars['receive_per'][$department_array[$i]]==0):
				
					$last_id = $obj->getLastID("1=1");
					//--- insert
					$obj_user 		= new users_class();
					$where_user 	= " 1 = 1 and user_active = 1 and department_id = ".$department_array[$i]."";
					$obj_list_user	= $obj_user->getDBList(" $where_user", "user_sort", FALSE, "");
					for($j=0;$j<count($obj_list_user);$j++):
						$obj_rec->recUser_date=date('Y-m-d h:m:i');
						$obj_rec->user_id = $obj_list_user[$j]->user_id;
						$obj_rec->receive_id = $last_id;
						$obj_rec->insertnew();
					endfor;
					unset($obj_user);
					
					//--- sms
					if($vars['receive_sms'][$department_array[$i]]==1):
						for($j=0;$j<count($obj_list_user);$j++):
							$obj_user = new users_class();
							$obj_user->getDBbyPkey($obj_list_user[$j]->user_id);
							//--check user sms permission;
							if($obj_list_user[$j]->per_sms == 2 || $obj_list_user[$j]->per_sms == 3):
							$send_msgs = new php_sms();
							$send_msgs->send_sms(str_replace(' ','',$obj_user->user_phone), fnsSubstr(fnsUnUnicode('STC - Van ban moi nhan: '.$vars['doc_desc'],2),120,0), $vars['com_port']);
							unset($send_msgs);
							unset($obj_user);
							endif;
						endfor;
					endif;
				endif;
			endfor;
			$receive_id = $obj->getLastID("1=1");
			unset($obj_rec);
			unset($obj);
			redirect("?viewReceive".$vars['arg']."&receive_id=".$receive_id);
		}
	}
	
	$vars = (array)$obj;
	unset($obj);
	
	 // --- Assign data to template
	$assign_list["vars"] = $vars;
	
	$assign_list['obj_list_user'] = $obj_list_user;
	$assign_list['obj_list_depa_selected'] = $obj_list_depa_selected;
	$assign_list['obj_list_depa_unse'] = $obj_list_depa_unse;
	$assign_list['obj_list_docfile'] = $obj_list_docfile;
	
	$assign_list['doc_info'] = $doc_info;
	$assign_list['doc_id'] 	= $doc_id;
	
	$assign_list['receive_info'] = $receive_info;
	$assign_list['receive_id'] 	= $vars['receive_id'];
	$assign_list['department_array'] 	= $department_array;
	
	$assign_list["arg"] = $arg;
	$assign_list["error"] = $error;
	$assign_list["errorfile"] = $errorfile;
	
	$display = dirname(__FILE__)."/skin/B_Receive_edit.tpl";
	$assign_list['display'] = $display;
	
	$smarty->assign($assign_list);
	
	// --- Display template
	if (isset($vars['activeAjax']))
	$smarty->display(dirname(__FILE__)."/skin/B_Receive_edit.tpl");
	else
	$smarty->display(dirname(__FILE__)."/skin/B_doc_list.tpl");
?>