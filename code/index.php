<?php
/*-------------------------------------------
- PHP Frame work
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/
	header("location: ".$http_root."admin");
	
	require_once("./includes/requires.php");
	require_once("./includes/common.php");
	require_once($CLASSES_PATH."clsModule.php");
	
	$_SESSION['lang'] = 1;
	$vars = array_merge($_POST,$_GET, $_FILES);
	$assign_list = array();
		
	// --- check modules
	$MODULE_PATH	= ROOT_DIR."/modules/";
	$obj = new module_class();
	$module_name = $vars['mod'];

	if(isset($module_name)):
		$ismodname = $obj ->checkmodname($module_name);
		if(!isset($ismodname)):
			header("location: ?");
		else:
		$module_name = $module_name."/";
		endif;
	endif;
	$mod = $vars['mod'];
	$assign_list['mod'] = $mod;
	
	// --- variables
    srand(time());
    $random = (rand()%100);
    $priceInputId =  $random . $i;
    $assign_list['priceInputId'] = $priceInputId;
	$assign_list['http_root'] = $http_root;
	
	//------------------------Debug--------------------------------
	//$dbconn->debug = true;
	
	//------------------------Get data-----------------------------
	//owner information
        require_once($CLASSES_PATH.'clsConfig.php');
        $owner =  new  config_class();
        $where_owner = "  1 = 1 ";
        $obj_owner = $owner->getDBList( $where_owner , "", true , " Limit 1");
        $assign_list['obj_owner'] = $obj_owner;
		
	//Module
		require_once($CLASSES_PATH.'clsModule.php');
        $mod =  new  module_class();
        $where_mod = "  1 = 1";
        $obj_mod = $mod->getDBList( $where_mod , "mod_id", true , " ");
        $assign_list['obj_mod'] = $obj_mod;
		
	//Block
		require_once($CLASSES_PATH.'clsBlock.php');
        //---menu top
		$block =  new  block_class();
		$where_block_top = "  1 = 1 and block_active=1 and block_panel=1";
        $obj_block_top = $block->getDBList( $where_block_top , "block_sort", true , " ");
        $assign_list['obj_block_top'] = $obj_block_top;
		
		//---menu tab
		$block_tab =  new  block_class();
		$where_block_tab = "  1 = 1 and block_active=1 and block_panel=2";
        $obj_block_tab = $block_tab->getDBList( $where_block_tab , "block_sort", true , " ");
        $assign_list['obj_block_tab'] = $obj_block_tab;
		
		//---menu left
		$block_left =  new  block_class();
		$where_block_left = "  1 = 1 and block_active=1 and block_panel=4";
        $obj_block_left = $block_left->getDBList( $where_block_left , "block_sort", true , " ");
        $assign_list['obj_block_left'] = $obj_block_left;
		
		//---menu right
		$block_right =  new  block_class();
		$where_block_right = "  1 = 1 and block_active=1 and block_panel=5";
        $obj_block_right = $block_right->getDBList( $where_block_right , "block_sort", true , " ");
        $assign_list['obj_block_right'] = $obj_block_right;
		
		//---content
		$block_cont =  new  block_class();
		$where_block_cont = "  1 = 1 and block_active=1 and block_panel=3";
        $obj_block_cont = $block_cont->getDBList( $where_block_cont , "block_sort", true , " ");
        $assign_list['obj_block_cont'] = $obj_block_cont;
		
	//Link
		require_once($CLASSES_PATH.'clsLink.php');
        $link =  new  link_class();
        $where_link = "  1 = 1 and link_active=1";
        $obj_link = $link->getDBList( $where_link , "link_sort", true , " ");
        $assign_list['obj_link'] = $obj_link;
		
	//Imgs
		require_once($CLASSES_PATH.'clsImgs.php');
        $imgs =  new  img_class();
        $where_img = "  1 = 1 and img_active=1";
        $obj_img = $imgs->getDBList( $where_img , "img_sort", true , " ");
        $assign_list['obj_img'] = $obj_img;
			
	//categories
        require_once($CLASSES_PATH.'clsCat.php');
        $cat =  new  cat_class();
        $where_cat = "  1 = 1 and cat_active=1 and parent_id=0";
        $obj_cat = $cat->getDBList( $where_cat , "cat_sort", true , " ");
				
		$subcat =  new  cat_class();
        $where_subcat = "  1 = 1 and cat_active=1 and parent_id!=0";
        $obj_subcat = $subcat->getDBList( $where_subcat , "", true , " ");
		
		$assign_list['obj_subcat'] = $obj_subcat;
        $assign_list['obj_cat'] = $obj_cat;
		
	//News: right + home
		require_once($CLASSES_PATH.'clsNews.php');
        $news =  new  news_class();
        $where_news = "  1 = 1 and news_active=1 and news_typical=1";
        $obj_news = $news->getDBList( $where_news , "news_sort", true , " Limit 10");
        $assign_list['obj_news'] = $obj_news;
		
		$news_home =  new  news_class();
        $where_news_home = "  1 = 1 and news_active=1";
        $obj_news_home = $news_home->getDBList( $where_news_home , "news_date", true , " Limit 5");
        $assign_list['obj_news_home'] = $obj_news_home;
		$assign_list['count_news_home'] = count($obj_news_home)-1;
					
	//Advs
		require_once($CLASSES_PATH.'clsAdvs.php');
        $adv =  new  adv_class();
        $where_adv = "  1 = 1 and adv_active=1";
        $obj_adv = $adv->getDBList( $where_adv , "adv_sort", true , " Limit 30");
        $assign_list['obj_adv'] = $obj_adv;
				
			
	//------------------------Get key------------------------------
    global $key;
	switch ($key[0])
	{					
		//------- BEGIN MODULE GLOBAL INTRO -------------------------------// 	
		case 'aboutDetails': // View intro
		    include ($MODULE_PATH.$module_name."aboutDetails.php");
            exit();
			
		//------- BEGIN MODULE SITEMAP -------------------------------// 	
		case 'sitemap': // View sitemap
		    include ($MODULE_PATH.$module_name."sitemap.php");
            exit();
			
		//------- BEGIN MODULE NEWS -------------------------------// 	
        case 'newsList': // View list news
            include ($MODULE_PATH.$module_name."newsList.php");
            exit();
        case 'newsDetails': // View detail news
		    include ($MODULE_PATH.$module_name."newsDetails.php");
            exit();
		case 'newsRss': // View detail news
		    include ($MODULE_PATH.$module_name."newsRss.php");
            exit();
		case 'Search': // View list search
			include ($MODULE_PATH.$module_name."newsList.php");
            exit();		
			
       default: // View Showroom HomePage
			include ("home.php"); 

	}
	$smarty->assign($assign_list);
  	//----------------------------
  	// View templates
	// Kiem tra user_themes	
?>