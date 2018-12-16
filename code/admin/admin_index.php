<?php
/*-------------------------------------------
- PHP Frame work
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/
 // --- Check url is Error -- Access deny -----
 if (!isset($key)){
 	// Error: no category chosen
 	redirect("index.php");
 	exit();
 } 
 
 $assign_list = array();
 $vars = array_merge($_POST,$_GET, $_FILES);
 
 if(isset($vars['mod'])):
 $error="Bạn không có quyền truy nhập chức năng này!";
 endif;
 
 // --- Display template
 $assign_list["error"] = $error;
 $smarty->assign($assign_list);
 $smarty->display("admin_home.tpl");
?>