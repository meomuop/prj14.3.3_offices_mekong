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
 require_once($CLASSES_PATH."clsModule.php"); 

 // --- Variables is used in this page
 $assign_list = array();
 $vars = array_merge($_POST,$_GET, $_FILES);
 
 
 	if (isset($vars['submitMod'])) {
		if ($vars['mod_name']=="") {
			$error = "Bạn chưa nhập tên module!";
		}else{
			$obj = new module_class();
			$obj->readForm();
			if ((is_null($error)) || ($error == "")) {
				$obj->mod_date = date("Y-m-d");
				if ($obj->is_already_used($obj->tablename, "mod_id", $obj->mod_id))
				{
					$obj->update();
					unset($obj);
					redirect("?listModule".$vars['arg']);
				}else{
					$error = "Có lỗi xảy ra trong quá trình xử lý!";
				}
			}
		}
 	}
  	else {
		$obj = new module_class();
		
		$arg['arg'] = "";
		$arg['arg'] .= $vars["curpage"]?"&curpage=".$vars["curpage"]:"";
		$arg['arg'] .= $vars["numresult"]?"&numresult=".$vars["numresult"]:"";
		$arg['arg'] .= trim($vars['KeyWord'])?"&KeyWord=".trim($vars['KeyWord']):"";
		$arg['arg'] .= $vars["order"]?"&order=".$vars["order"]:"";
		$arg['arg'] .= trim($vars['mod'])?"&mod=".trim($vars['mod']):"";
		
		$obj->getDBbyPkey($vars['id']);
		if (!$obj->mod_id) redirect("?listModule".$arg['arg']);
	
		$vars = (array)$obj;
		unset($obj);
	}	
	 // --- Assign data to template
	$assign_list["vars"] = $vars;
	$assign_list["arg"] = $arg;
	$assign_list["error"] = $error;
	$smarty->assign($assign_list);
	$smarty->display(dirname(__FILE__)."/skin/Admin.Module.edit.tpl");
?>