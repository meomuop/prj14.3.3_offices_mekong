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
 require_once($CLASSES_PATH."clsLoaitaisans.php"); 

 // --- Variables is used in this page
 $assign_list = array();
 $vars = array_merge($_POST,$_GET, $_FILES);
  
 	if (isset($vars['submitLoaitaisan'])) {
		if ($vars['loaitaisan_name']=="") {
			$error = "Bạn chưa nhập tên loại tài sản!";
		}else{
			$obj = new Loaitaisan_class();
			$obj->readForm();
			if ((is_null($error)) || ($error == "")) {
				$obj->Loaitaisan_date = date("Y-m-d");
				$obj->insertnew();
				unset($obj);
				redirect("?listLoaitaisan".$vars['arg']);
			}
		}
 	}
	
	// --- Get argument of page
	$vars['arg'] = "";
	$vars['arg'] .= $vars['numresult']?"&numresult=".$vars['numresult']:"";
	$vars['arg'] .= $vars['curpage']?"&curpage=".$vars['curpage']:"";
	$vars['arg'] .= trim($vars['KeyWord'])?"&KeyWord=".trim($vars['KeyWord']):"";
	$vars['arg'] .= $vars['order']?"&order=".$vars['order']:""; 
	$vars['arg'] .= trim($vars['mod'])?"&mod=".trim($vars['mod']):"";
	$vars['arg'] .= $vars['taisan_id']?("&taisan_id=".$vars['taisan_id']):"";
	
	$assign_list["vars"] = $vars;
	$assign_list["error"] = $error;
  	$smarty->assign($assign_list);
    $smarty->display(dirname(__FILE__)."/skin/B_Loaitaisan_add.tpl");
?>