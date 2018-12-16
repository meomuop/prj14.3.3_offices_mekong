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
require_once($CLASSES_PATH."clsDocs.php");
require_once($CLASSES_PATH.'clsDocCats.php');
require_once($CLASSES_PATH.'clsDocFields.php');
require_once($CLASSES_PATH.'clsDocLevels.php');
require_once($CLASSES_PATH."clsUnits.php");
require_once($CLASSES_PATH."clsUsers.php");
require_once($CLASSES_PATH."clsSecrets.php");
require_once($CLASSES_PATH."clsImportants.php");

require_once ($CLASSES_PATH.'clsDocReplys.php');
require_once ($CLASSES_PATH.'clsDocFiles.php');

// --- Variables is used in this page
$assign_list = array();
$vars = array_merge($_POST,$_GET, $_FILES);

$arg['arg'] = "";
$arg['arg'] .= $vars["curpage"]?"&curpage=".$vars["curpage"]:"";
$arg['arg'] .= $vars["numresult"]?"&numresult=".$vars["numresult"]:"";
$arg['arg'] .= trim($vars['KeyWord'])?"&KeyWord=".trim($vars['KeyWord']):"";
$arg['arg'] .= $vars["order"]?"&order=".$vars["order"]:"";
$arg['arg'] .= trim($vars['mod'])?"&mod=".trim($vars['mod']):"";

// --- Get doc fields list
$obj_dlevel = new docLevel_class();
$where_dlevel 		= " 1 = 1 and docLevel_active=1";
$obj_list_dlevel 	= $obj_dlevel->getDBList(" $where_dlevel", "docLevel_name", FALSE, "");

// --- Get user list
$obj_user 		= new users_class();
$where_user 		= " 1 = 1 and user_active=1 and user_level in(4,5)";
$obj_list_user	= $obj_user->getDBList(" $where_user", "user_name", FALSE, "");

// --- Get secret list
$obj_secret 		= new secret_class();
$where_secret 		= " 1 = 1 and secret_active=1";
$obj_list_secret	= $obj_secret->getDBList(" $where_secret", "secret_name", FALSE, "");

// --- Get important list
$obj_important 		= new important_class();
$where_important 		= " 1 = 1 and important_active=1";
$obj_list_important	= $obj_important->getDBList(" $where_important", "important_name", FALSE, "");

$obj = new doc_class();

$obj->getDBbyPkey($vars['doc_id']);
if (!$obj->doc_id) redirect("?listDoc".$arg['arg']);

// --- Get doc reply list
$obj_reply 			= new docReply_class();
$where_reply 		= " 1 = 1 and doc_id = ".$obj->doc_id;
$obj_list_reply		= $obj_reply->getDBList(" $where_reply", "docReply_id desc", FALSE, "limit 1");
$total_num_reply 	= $obj_reply->getRowNumber("$where_reply");

// --- Get doc file list
$obj_docfile		= new docFile_class();
$where_docfile 		= " 1 = 1 and doc_id = ".$obj->doc_id;
$obj_list_docfile	= $obj_docfile->getDBList(" $where_docfile", "docFile_name asc", FALSE, "");

// --- Get user list
$obj_reply_user 		= new users_class();
$where_reply_user 		= " 1 = 1 and user_active=1";
$obj_list_reply_user	= $obj_user->getDBList(" $where_reply_user", "user_name", FALSE, "");

// --- Get department list
$obj_department 		= new department_class();
$where_department 		= " 1 = 1 and department_active=1 and (department_type=1 or department_type=3)";
$obj_list_department	= $obj_department->getDBList(" $where_department", "department_name", FALSE, "");

$vars = (array)$obj;
unset($obj);

// --- Assign data to template
$assign_list["vars"] = $vars;

$assign_list['obj_list_user'] = $obj_list_user;
$assign_list['obj_list_dlevel'] = $obj_list_dlevel;

$assign_list['obj_list_reply'] = $obj_list_reply;
$assign_list['total_num_reply'] = $total_num_reply;
$assign_list['obj_list_reply_user'] = $obj_list_reply_user;
$assign_list['obj_list_docfile'] = $obj_list_docfile;

$assign_list['obj_list_department'] = $obj_list_department;

$assign_list['obj_list_secret'] = $obj_list_secret;
$assign_list['obj_list_important'] = $obj_list_important;

$assign_list["arg"] = $arg;
$assign_list["error"] = $error;
$smarty->assign($assign_list);
$smarty->display(dirname(__FILE__)."/skin/B_PGV_print.tpl");
?>