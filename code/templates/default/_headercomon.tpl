<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>{$obj_owner[0]->site_title}</title>
<meta name="Title" content="{$obj_owner[0]->site_mekey}">
<meta name="Author" content="{$obj_owner[0]->site_meauthor}">
<meta name="Keywords" content="{$obj_owner[0]->site_mecont}">
<meta name="Description" content="{$obj_owner[0]->site_medes}">
<meta http-equiv="imagetoolbar" content="no">
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />

<script type="text/JavaScript" src="{$http_root}js/jquery.js"></script>
<script type="text/javascript" src="{$http_root}js/library.js"></script>
<script type="text/javascript" src="{$http_root}js/ajax_common.js?{$priceInputId}"></script>
<script type="text/javascript" src="{$http_root}FCKeditor/fckeditor.js"></script>
<SCRIPT type="text/javascript" src="{$http_root}js/ad_common.js"></SCRIPT>

<link href="{$http_root}css/default.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="{$http_root}images/tab.css">
<link rel="stylesheet" type="text/css" href="{$http_root}css/default.css">
<link rel="stylesheet" type="text/css" href="{$http_root}css/common.css" />
<link rel="stylesheet" type="text/css" href="{$http_root}css/style.css" />

<link rel="stylesheet" type="text/css" href="{$http_root}css/jquery.lightbox-0.5.css" media="screen" />
<script type="text/javascript" src="{$http_root}js/jquery/jquery.min.js"></script>
<script type="text/javascript" src="{$http_root}js/jquery/plugins/jquery.cycle.all.2.74.js"></script>
<script type="text/javascript" src="{$http_root}js/jquery/plugins/jquery-ui.min.js" ></script>
<script type="text/javascript" src="{$http_root}js/jquery/plugins/jquery.lightbox-0.5.js"></script>

<script type="text/javascript" src="{$http_root}js/jquery.vticker.1.4.js"></script>

<script type="text/javascript" src="{$http_root}js/admin/calendar.js"></script>
<script type="text/javascript" src="{$http_root}js/admin/calendar-vi.js"></script>
<script type="text/javascript" src="{$http_root}js/admin/calendar-setup.js"></script>
<script type="text/javascript" src="{$http_root}js/admin/tabs.js"></script>
<link rel="stylesheet" type="text/css" media="all" href="{$http_root}css/admin/calendar-blue.css"/>
<script type="text/javascript" src="{$http_root}js/admin/jquery-1.3.2.min.js"></script>

{literal}
<script type="text/javascript">
$(document).ready(function() {
    $('.slideshow').cycle({
		fx: 'fade' // choose your transition type, ex: fade, scrollUp, shuffle, etc...
	});
});
</script>

<script type="text/javascript">
$(function() {

	//Default Action
	$(".tab_content").hide();
	$("ul.tabs li:first").addClass("active").show();
	$(".tab_content:first").show();
	
	$("ul.tabs li").click(function() {
		$("ul.tabs li").removeClass("active");
		$(this).addClass("active");
		$(".tab_content").hide();
		var activeTab = $(this).find("a").attr("href"); 
		$(activeTab).fadeIn();
		return false;
	});
});
</script>

<script type="text/javascript">
$(function() {
	$('#ifm_lightbox a').lightBox();
});
</script>

<script type="text/javascript">
$(function(){
		$("#firstpane h4.menu_head").click(function()
		{
			$(this).css({backgroundImage:"url(img/hoanh-bo-index_02.png)"}).next("div.menu_body").slideToggle(300).siblings("div.menu_body").slideUp("slow");
			$(this).siblings().css({backgroundImage:"url(img/icon.png)"});
		});
	});
</script>
{/literal}

<script type="text/javascript" src="{$http_root}js/contentslider.js"></script>
</head>