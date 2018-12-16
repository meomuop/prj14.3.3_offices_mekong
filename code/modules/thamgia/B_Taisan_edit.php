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
	require_once($CLASSES_PATH."clsTaisans.php"); 
	
	// --- Variables is used in this page
	$assign_list = array();
	$vars = array_merge($_POST,$_GET, $_FILES);
	
	$arg['arg'] = "";
	if($vars["curpage"]) 		$arg['arg'] = $arg['arg']."&curpage=".$vars["curpage"];
	if($vars["numresult"]) 		$arg['arg'] = $arg['arg']."&numresult=".$vars["numresult"];
	if(trim($vars['KeyWord'])) 	$arg['arg'] = $arg['arg']."&KeyWord=".trim($vars['KeyWord']);
	if($vars["order"]) 			$arg['arg'] = $arg['arg']."&order=".$vars["order"];
	if(trim($vars['mod'])) 		$arg['arg'] = $arg['arg']."&mod=".trim($vars['mod']);
	
	if (isset($vars['submitTaisan'])) {
		if ($vars['taisan_name']=="") {
			$error = "Bạn chưa nhập tên tài sản!";
		}else{
			$obj = new Taisan_class();
			$obj->readForm();
			if ((is_null($error)) || ($error == "")) {
				$obj->taisan_date = date("Y-m-d");
				if ($obj->is_already_used($obj->tablename, "taisan_id", $obj->taisan_id))
				{
					$obj->update();
					unset($obj);
					redirect("?listTaisan".$vars['arg']);
				}else{
					$error = "Có lỗi xảy ra trong quá trình xử lý!";
				}
			}
		}
	}
	else {
		$obj = new taisan_class();
		
		$obj->getDBbyPkey($vars['id']);
		if (!$obj->taisan_id) redirect("?listtaisan".$arg['arg']);
	
		$vars = (array)$obj;
		unset($obj);
	}	
	 // --- Assign data to template
	$assign_list["vars"] = $vars;
	$assign_list["arg"] = $arg;
	$assign_list["error"] = $error;
	$smarty->assign($assign_list);
	$smarty->display(dirname(__FILE__)."/skin/B_Taisan_edit.tpl");
?>