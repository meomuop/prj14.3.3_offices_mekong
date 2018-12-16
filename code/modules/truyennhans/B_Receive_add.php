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
	
	if($_SESSION["per_add"]!=1):
	include ("admin_index.php"); 
	endif;
	
	
	// --- Class is used in this page
	include ($CLASSES_TNVB.'clsReceives.php');
	require_once($CLASSES_PATH.'clsDocs.php');
	require_once($CLASSES_PATH.'clsDocFiles.php');
	require_once($CLASSES_PATH.'clsDocCats.php');
	require_once($CLASSES_PATH.'clsDocFields.php');
	require_once($CLASSES_PATH.'clsDocLevels.php');
	require_once($CLASSES_PATH."clsSecrets.php");
	require_once($CLASSES_PATH."clsImportants.php");
	require_once($CLASSES_TNVB.'clsDocTransports.php');
	require_once($CLASSES_TNVB.'clsDocFiles.php');
	require_once($CLASSES_TNVB."clsRecusers.php");
	
	// --- Variables is used in this page
	$assign_list = array();
	$vars = array_merge($_POST,$_GET, $_FILES);
	
	$processurl = "?addReceive&mod=truyennhans";
	$processurl .= $vars['docin_id']?"&docin_id=".$vars['docin_id']:"";
	
	// --- Del items which is selected
	$delstr=$vars['dlStr'];
	if ($vars['dlStr']){
		$obj = new docfile_class();
		$obj->removeInList($vars['dlStr']);
		unset($obj);
	}
	
	if (isset($vars['add_edit'])) {
		$obj = new doc_trans_class();
		$obj->readForm();
		$obj->doc_date = date("Y-m-d H:i");
		$obj->doc_signed = date('Y-m-d',strtotime(str_replace('/','-',$vars['doc_signed'])));
		$obj->user_id = $_SESSION['user_id'];
												
		$obj->insertnew();
		$last_doc_id = $obj->getLastOne();
		unset($obj);
		
		require_once($CLASSES_TNVB."clsDocFiles.php"); 
		$obj_file = new docfile_trans_class();
		$docfile_path_arr = explode('|',substr($vars['docfile_path'],0,strlen($vars['docfile_path'])-1));
		$docfile_name_arr = explode('|',substr($vars['docfile_name'],0,strlen($vars['docfile_name'])-1));
		
		if (count($docfile_path_arr)>0 && count($docfile_name_arr)>0):
			for($i=0; $i<count($docfile_name_arr); $i++):
				if($docfile_name_arr[$i]!='0_tmp'):
				$obj_file->addfile($last_doc_id,$docfile_name_arr[$i],$docfile_path_arr[$i],$_SESSION['user_id']);
				endif;
			endfor;
		endif;
		//redirect("?addReceive".$vars['arg']."&doc_id=".$last_doc_id);
		
		$obj = new receive_class();
		$obj->readForm();
		$department_id 	= explode(',',substr($vars['department_id'],0,strlen($vars['department_id'])-1));
		$receive_per 	= explode(',',substr($vars['receive_per'],0,strlen($vars['receive_per'])-1));
		$receive_note 	= explode('|',substr($vars['receive_note'],0,strlen($vars['receive_note'])-1));
		$receive_sms 	= explode(',',substr($vars['receive_sms'],0,strlen($vars['receive_sms'])-1));
		
		if (count($department_id)>0):
		
			for($i=0;$i<count($department_id);$i++):
				
				//---insert into tbl_receives
				$obj->receive_time	= date('Y-m-d h:m:i');
				$obj->doc_id 		= $last_doc_id;
				$obj->department_id = $department_id[$i];
				$obj->receive_per 	= $receive_per[$i];
				$obj->receive_note 	= $receive_note[$i];
				$obj->receive_sms 	= $receive_sms[$i];
				
				$obj->insertnew();
				
				//---if $vars['receive_per'][$department_id[$i]] == 1: send sms to the one who was chosen
				if($receive_sms[$i]==1):
					$obj_user = new users_class();
					//$obj_user->getDBbyPkey($vars['receive_per'][$department_id[$i]]);
					//echo $obj_user->user_phone.'<br>';
					$send_msgs = new php_sms();
					//$send_msgs->send_sms(str_replace(' ','',$obj_user->user_phone), fnsSubstr(fnsUnUnicode('Van ban moi nhan: '.$vars['doc_desc'],2),120,0), $vars['com_port']);
					unset($send_msgs);
					unset($obj_user);
				endif;
				
				/*---------------------------------------------------------------
				in case that $vars['receive_per'][$department_id[$i]] = 0:
				- insert into tbl_recusers with the last ID from tbl_receives
				- send sms to earch one if sms is true
				------------------------------------------------------------------*/
				if($receive_per[$i]==0):
					
					$last_id = $obj->getLastID("1=1");
					//--- insert
					$obj_user 		= new users_class();
					$where_user 	= " 1 = 1 and user_active = 1 and unit_id = ".$department_id[$i]."";
					$obj_list_user	= $obj_user->getDBList(" $where_user", "user_sort", FALSE, "");
					$obj_rec = new recuser_class();
					for($j=0;$j<count($obj_list_user);$j++):
						$obj_rec->recUser_date=date('Y-m-d h:m:i');
						$obj_rec->user_id = $obj_list_user[$j]->user_id;
						$obj_rec->receive_id = $last_id;
						$obj_rec->insertnew();
					endfor;
					unset($obj_rec);
					unset($obj_user);
					
					//--- sms
					if($receive_sms[$i]==1):
						for($j=0;$j<count($obj_list_user);$j++):
							$obj_user = new users_class();
							//$obj_user->getDBbyPkey($obj_list_user[$j]->user_id);
							//--check user sms permission;
							if($obj_list_user[$j]->per_sms == 2 || $obj_list_user[$j]->per_sms == 3):
							$send_msgs = new php_sms();
							//$send_msgs->send_sms(str_replace(' ','',$obj_user->user_phone), fnsSubstr(fnsUnUnicode('Van ban moi nhan: '.$vars['doc_desc'],2),120,0), $vars['com_port']);
							unset($send_msgs);
							unset($obj_user);
							endif;
						endfor;
					endif;
				endif;
				
			endfor;	
			
		endif;		
		$receive_id = $obj->getLastID("1=1");
		unset($obj);
		//redirect("?viewReceive".$vars['arg']."&receive_id=".$receive_id);
 	}
	
	if (isset($vars['submitDocFiles'])) {
		$obj = new docfile_class();
		$obj->docFile_date = date("Y-m-d");
		$obj->doc_id = $vars['doc_id'];
		$obj->insertnew();
		unset($obj);
	}
		
	// --- Get argument of page
	$vars['arg'] = "";
	$vars['arg'] .= $vars['numresult']?"&numresult=".$vars['numresult']:"";
	$vars['arg'] .= $vars['curpage']?"&curpage=".$vars['curpage']:"";
	$vars['arg'] .= trim($vars['KeyWord'])?"&KeyWord=".trim($vars['KeyWord']):"";
	$vars['arg'] .= $vars['order']?"&order=".$vars['order']:""; 
	$vars['arg'] .= trim($vars['mod'])?"&mod=".trim($vars['mod']):"";
	$vars['arg'] .= $vars['docin_id']?"&docin_id=".$vars['docin_id']:"";
	
	$obj_doc = new doc_class();
	$obj_doc->getDBbyPkey($vars['docin_id']);
	$doc_info = (array)$obj_doc;
	
	// --- Get doc file list
	$obj_docfile		= new docFile_class();
	$where_docfile 		= " 1 = 1 and doc_id = ".$obj_doc->doc_id;
	$obj_list_docfile	= $obj_docfile->getDBList(" $where_docfile", "docFile_name asc", FALSE, "");
	
	// --- Get doc fields list
	$obj_dlevel = new docLevel_class();
	$where_dlevel 		= " 1 = 1 and docLevel_active=1";
	$obj_list_dlevel 	= $obj_dlevel->getDBList(" $where_dlevel", "docLevel_name", FALSE, "");
	
	// --- Get user list
	$obj_user 		= new users_class();
	$where_user 		= " 1 = 1 and user_active=1";
	$obj_list_user	= $obj_user->getDBList(" $where_user", "user_name", FALSE, "");
	
	// --- Get secret list
	$obj_secret 		= new secret_class();
	$where_secret 		= " 1 = 1 and secret_active=1";
	$obj_list_secret	= $obj_secret->getDBList(" $where_secret", "secret_name", FALSE, "");
	
	// --- Get important list
	$obj_important 		= new important_class();
	$where_important 		= " 1 = 1 and important_active=1";
	$obj_list_important	= $obj_important->getDBList(" $where_important", "important_name", FALSE, "");
	
	// --- Get user list
	$obj_user 		= new users_class();
	$where_user 		= " 1 = 1 and user_active = 1 and user_id != ".$_SESSION['user_id']."";
	$obj_list_user	= $obj_user->getDBList(" $where_user", "user_sort", FALSE, "");
	
	// --- Get department list
	$obj_department 		= new department_class();
	$where_department 		= " 1 = 1 and department_active=1 and department_type in(2,3)";
	$obj_list_department	= $obj_department->getDBList(" $where_department", "department_sort", FALSE, "");
	
	// --- Get user list
	$obj_user_all 		= new users_class();
	$where_user_all 	= " 1 = 1 and user_active = 1";
	$obj_list_user_all	= $obj_user_all->getDBList(" $where_user_all", "user_sort", FALSE, "");
	
	$assign_list["vars"] = $vars;
	
	$assign_list['obj_list_user'] = $obj_list_user;
	$assign_list['obj_list_user_all'] = $obj_list_user_all;
	$assign_list['obj_list_department'] = $obj_list_department;
	$assign_list['obj_list_docfile'] = $obj_list_docfile;
	$assign_list['obj_list_dlevel'] = $obj_list_dlevel;
	$assign_list['obj_list_department'] = $obj_list_department;
	$assign_list['obj_list_secret'] = $obj_list_secret;
	$assign_list['obj_list_important'] = $obj_list_important;
	
	$assign_list['doc_info'] = $doc_info;
	$assign_list['docin_id'] 	= $vars['docin_id'];
	
	$assign_list["error"] = $error;
	$assign_list["errorfile"] = $errorfile;
	
	$display = dirname(__FILE__)."/skin/B_Receive_add.tpl";
	$assign_list['display'] = $display;
	
	$smarty->assign($assign_list);
	
	// --- Display template
	if (isset($vars['activeAjax']))
	$smarty->display(dirname(__FILE__)."/skin/B_Receive_add.tpl");
	else
	$smarty->display(dirname(__FILE__)."/skin/B_doc_list.tpl");
?>