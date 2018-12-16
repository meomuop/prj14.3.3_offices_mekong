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
	require_once($CLASSES_PATH."clsNgansachs.php"); 
	
	// --- Variables is used in this page
	$assign_list = array();
	$vars = array_merge($_POST,$_GET, $_FILES);
	
	$arg['arg'] = "";
	if($vars["curpage"]) 		$arg['arg'] = $arg['arg']."&curpage=".$vars["curpage"];
	if($vars["numresult"]) 		$arg['arg'] = $arg['arg']."&numresult=".$vars["numresult"];
	if(trim($vars['KeyWord'])) 	$arg['arg'] = $arg['arg']."&KeyWord=".trim($vars['KeyWord']);
	if($vars["order"]) 			$arg['arg'] = $arg['arg']."&order=".$vars["order"];
	if(trim($vars['mod'])) 		$arg['arg'] = $arg['arg']."&mod=".trim($vars['mod']);
	
	if (isset($vars['submitNgansach'])) {
		if ($vars['ngansach_name']=="") {
			$error = "Bạn chưa nhập tên nguồn ngân sách!";
		}else{
			$obj = new Ngansach_class();
			$obj->readForm();
			if ((is_null($error)) || ($error == "")) {
				$obj->ngansach_date = date("Y-m-d");
				if ($obj->is_already_used($obj->tablename, "ngansach_id", $obj->ngansach_id))
				{
					$obj->update();
					unset($obj);
					redirect("?listNgansach".$vars['arg']);
				}else{
					$error = "Có lỗi xảy ra trong quá trình xử lý!";
				}
			}
		}
	}
	else {
		$obj = new ngansach_class();
		
		$obj->getDBbyPkey($vars['id']);
		if (!$obj->ngansach_id) redirect("?listngansach".$arg['arg']);
	
		$vars = (array)$obj;
		unset($obj);
	}	
	 // --- Assign data to template
	$assign_list["vars"] = $vars;
	$assign_list["arg"] = $arg;
	$assign_list["error"] = $error;
	$smarty->assign($assign_list);
	$smarty->display(dirname(__FILE__)."/skin/B_Ngansach_edit.tpl");
?>