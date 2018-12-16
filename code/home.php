<?php
	$processurl = "";
   	$assign_list["navigator"] = $navigator_home;
	$assign_list['processurl'] = $processurl;
	$_SESSION['path'] = $processurl;	
	
	$assign_list['act'] = $vars['act'];
	
	$smarty->assign($assign_list);
	$smarty->display($TEMPLATE_USER_PATH."index.tpl");