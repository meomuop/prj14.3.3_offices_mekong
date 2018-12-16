<?php

	require_once($CLASSES_PATH."clsNews.php");
	require_once($CLASSES_PATH."clsNewsCategories.php");
	$obj = new news_class(); 
   
	// --- Class is used in this page
	$vars = array_merge($_POST, $_GET);
    
	// --- Variables is used in this page
	if ($_SESSION['lang'] == 1) {
		$order_arr = array(0 => "Dịch vụ mới nhất", 1 => "Tiêu đề");
	} else {
		$order_arr = array(0 => "News Latest", 1 => "Title");
	}
	
	$nrs_arr = array(5, 10, 15, 20);
	
	// --- prepare to query
	$order_id = (int)$vars['order'];
	
	$catID = (int)$vars['catID'];
	
	$level = (int)$vars['level'];

	$processurl = "?listServices";
	
	$osflags = TRUE;
	if ($order_id == 1){  $order_str = "newsTitle"; $osflags = TRUE;}
	else{ $order_str = "newsID". " DESC "; $osflags = FALSE; }
	$where = " 1 = 1";

	if ($catID != 0) {
		$obj_c = new Newscategories_class();
		// get string of category
		$where .= " AND catID  = '$catID'";
		$titleCat1 = $obj_c->getTitle($catID);
	
	}		

	//$dbconn->debug = true;
	// --- prepare to paging 
	$vars['numresult'] = (int)$vars['numresult']?(int)$vars['numresult']:5;
     if($vars['numresult'] == 5)   $height = $vars['he'];
    if($vars['numresult'] == 10)   $height = $vars['he']*2;
   if($vars['numresult'] == 15)   $height = $vars['he']*3;
            if($vars['numresult'] == 20)   $height = $vars['he']*4;


   // echo $height; 
         
	$total_num_result = $obj->getRowNumber($where);
	$num_page = ceil($total_num_result/$vars['numresult']);
	if (($vars['curpage'] > $num_page) && $num_page) $vars['curpage'] = $num_page;
	$cur_num_result = (($total_num_result%$vars['numresult']!=0)&&($vars['curpage']==$num_page))?($total_num_result%$vars['numresult']):$vars['numresult'];
	if ($vars['curpage'] < 1) $vars['curpage'] = 1;
	
	$cur_pos = ($vars['curpage'] - 1) * $vars['numresult'];
	
	// get data to view
	$obj_list = $obj->getDBList($where, $order_str, true , " LIMIT ".$cur_pos.",".$cur_num_result );
	//print_r($obj_list);
	// ------ Print paging ---------
	$pager_str = get_paging_string($processurl, $vars['curpage'], $num_page, 1);
	
	// --- send argument to next page
   

	$vars['arg'] = "";
	$vars['arg'] .= $vars['numresult']?("&numresult=".$vars['numresult']):"";
	$vars['arg'] .= $vars['curpage']?("&curpage=".$vars['curpage']):"";
	
	// --- Assign data to template
	$assign_list['title'] = $title;
	$assign_list['titleCat1'] = $titleCat1;
	$assign_list['titleCat'] = $titleCat;
	$assign_list['height'] = $height;
	$assign_list['obj_list'] = $obj_list;
	$assign_list['pager_str'] = $pager_str;
	$assign_list['nrs_arr'] = $nrs_arr;
	$assign_list['total_num_result'] = $total_num_result;
	$assign_list['order_arr'] = $order_arr;
	$assign_list['conditionArr'] = $conditionArr;
	$assign_list['processurl'] = $processurl;
	$_SESSION['path'] = $processurl;
	//$assign_list['cate_tree'] = $cate_tree;
	$assign_list['vars'] = $vars;
 
	//print_r($vars);
	$assign_list["navigator"] = $navigator_news;
	if ($_SESSION['lang'] == 1) { 
		$assign_list["navigatorSub"] = $cate_tree[0]['name'];
	} else {
		$assign_list["navigatorSub"] = $cate_tree[0]['ename'];
	}
	$smarty->assign($assign_list);

	// --- Display template
	if (isset($vars['activeAjax'])){
        $height =   htmlspecialchars($_COOKIE["listTable"]);
        
	    $smarty->display("servicesContent.tpl");
	}else{
	$smarty->display("servicesList.tpl"); 
    }