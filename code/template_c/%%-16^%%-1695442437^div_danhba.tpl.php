<?php /* Smarty version 2.6.2, created on 2018-12-16 10:40:50
         compiled from div_danhba.tpl */ ?>
﻿<?php echo '
<style>
#div_danhba{ width: 800px; height: 550px; padding: 0px 1px 1px 1px; border:1px solid #8ea4c1; background-color:#ffffff;
	position:absolute; margin:40px 200px; z-index:100; font-size:12px
	/*display: none; position: absolute; background-color: white2; overflow: auto;	*/
}
#danhba_main_cont{ float:left; width:100%; height:550px; background-color:#ccd8e7}
#danhba_tab_bar_tit{ float:left; font-weight:bold; text-transform:uppercase; line-height:20px; padding-left:8px; width:80%;cursor:move; color:#15428b;}
#danhba_tab_bar_icon{ float:right; width:10%; text-align:right; padding-top:2px; padding-right:6px}
#danhba_content_outsign{ float:left; width:97.7%; height:494px; background-color:#ffffff; margin-left:8px; border:1px solid #99bbe8}
#danhba_content_insign{ float:left; width:99.7%; height:475px; background-color:#dfe8f6; margin-left:1px;}
#danhba_content_main{ float:left; width:99.7%; height:493px; background-color:#dfe8f6; margin-left:1px;}

#danhba_clear_txt{ float:left; width:100%; height:1px}
#danhba_tool_bar{ float:left; width:99.7%; height:20px; background-color:#dfe8f6; margin-left:1px}
#danhba_search_area{ float:left; width:120px; height:20px; padding-left:2px}
#danhba_page_area{ float:left; width:40px; height:20px; padding-left:2px}
#danhba_menu{ float:left; width:99.7%; height:25px; padding-left:8px; position:absolute; margin-top:21px}
/*------------------------------------------------------------------------------------------------------*/

.c_menu_danhba{float:left; border-right:1px solid #99bbe8; line-height:21px; height:21px; padding-left:2px; border-top:1px solid #99bbe8; margin-top:4px}

.img_all{opacity:0.7}
.img_all:hover{opacity:1}
</style>
<script>
$(function() {
	$( "#div_danhba" ).draggable();
});
function min_size_danhba(){
	if(document.getElementById(\'div_danhba\').style.height==\'550px\'){
		document.getElementById(\'div_danhba\').style.height=\'20px\';
		document.getElementById(\'danhba_main_cont\').style.height=\'20px\';
		document.getElementById(\'danhba_content_outsign\').style.display=\'none\';
		document.getElementById(\'danhba_content_insign\').style.display=\'none\';
		document.getElementById(\'danhba_tool_bar\').style.display=\'none\';
		document.getElementById(\'danhba_menu\').style.display=\'none\';
	}else{
		document.getElementById(\'div_danhba\').style.height=\'550px\';
		document.getElementById(\'danhba_main_cont\').style.height=\'550px\';
		document.getElementById(\'danhba_content_outsign\').style.display=\'\';
		document.getElementById(\'danhba_content_insign\').style.display=\'\';
		document.getElementById(\'danhba_tool_bar\').style.display=\'\';
		document.getElementById(\'danhba_menu\').style.display=\'\';
	}
}
function reset_pos_danhba(){
	document.getElementById(\'div_danhba\').style.margin=\'40px 200px\';
}
function max_size_danhba(){
	if(document.getElementById(\'div_danhba\').style.width==\'50%\'){
		document.getElementById(\'div_danhba\').style.margin=\'0\';
		document.getElementById(\'div_danhba\').style.width=\'98%\';
		document.getElementById(\'div_danhba\').style.height=\'600px\';
		document.getElementById(\'danhba_main_cont\').style.height=\'600px\';
		document.getElementById(\'danhba_content_outsign\').style.height=\'545px\';
		document.getElementById(\'danhba_content_insign\').style.height=\'523px\';
	}else{
		document.getElementById(\'div_danhba\').style.margin=\'10px 200px\';
		document.getElementById(\'div_danhba\').style.width=\'50%\';
		document.getElementById(\'div_danhba\').style.height=\'550px\';
		document.getElementById(\'danhba_main_cont\').style.height=\'550px\';
		document.getElementById(\'danhba_content_outsign\').style.height=\'495px\';
		document.getElementById(\'danhba_content_insign\').style.height=\'473px\';
	}
}
function change_style_danhba(obj){
	for(i=1;i<=9;i++){
		if(i==obj){
			document.getElementById(\'c_menu_danhba_\'+i).style.borderLeft = \'1px solid #99bbe8\';
			document.getElementById(\'c_menu_danhba_\'+i).style.borderRight = \'1px solid #99bbe8\';
			document.getElementById(\'c_menu_danhba_\'+i).style.borderBottom = \'1px solid #dfe8f6\';
			document.getElementById(\'c_menu_danhba_\'+i).style.backgroundColor = \'#dfe8f6\';
			document.getElementById(\'c_menu_danhba_\'+i).style.height = \'25px\';
			document.getElementById(\'c_menu_danhba_\'+i).style.marginTop = \'0px\';
		}
		else{
			if(i!=1){
				document.getElementById(\'c_menu_danhba_\'+i).style.borderLeft = \'none\';
			}
			if(i==obj-1){
				document.getElementById(\'c_menu_danhba_\'+i).style.borderRight = \'none\';
			}else{
				document.getElementById(\'c_menu_danhba_\'+i).style.borderRight = \'1px solid #99bbe8\';
			}
			document.getElementById(\'c_menu_danhba_\'+i).style.borderBottom = \'none\'; // 1px solid #99bbe8
			document.getElementById(\'c_menu_danhba_\'+i).style.backgroundColor = \'#ccd8e7\';
			document.getElementById(\'c_menu_danhba_\'+i).style.height = \'20px\';
			document.getElementById(\'c_menu_danhba_\'+i).style.marginTop = \'4px\';
		}
	}
}
</script>
'; ?>

<!--*******************************************VUNG DIV CHUC NANG*****************************************-->
<div id="div_danhba" class="ui-widget-content" style="display:none" onclick="javascript: change_Zindex('div_danhba')">
    <div id="danhba_main_cont">
        <!-- Tab bar -->
        <div id="danhba_tab_bar_tit">Danh bạ điện thoại</div>
        <div id="danhba_tab_bar_icon">
            <a href="javascript: void(0);" onClick="min_size_danhba();" style="text-decoration:none">
            <img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_thu_gon.png" class="img_all" title="Ẩn/hiện"></a>
            <a href="javascript: void(0);" onClick="max_size_danhba();" style="text-decoration:none">
            <img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_mo_rong.png" class="img_all" title="Mở rộng/thu nhỏ"></a>
            <a href="javascript: void(0);" onClick="javascript: close_all_window_danhba(); change_style_danhba(1)" style="text-decoration:none">
            <img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_dong.png" class="img_all" title="Đóng lại"></a>
        </div>
        <!-- Menu -->
        <div id="danhba_menu">
        	<div style="width:10px; float:left">&nbsp;</div>
            <a href="javascript: void(0)" onclick="change_style_danhba(1)" id="a_menu_danhba_1">
            <div class="c_menu_danhba" id="c_menu_danhba_1" style="width:110px; border-left:1px solid #99bbe8; border-bottom:1px solid #dfe8f6; background-color:#dfe8f6; height:25px; margin-top:0px">Danh bạ nội bộ</div></a>
            <!--<a href="javascript: void(0)" onclick="change_style_danhba(2)" id="a_menu_danhba_2">
            <div class="c_menu_danhba" id="c_menu_danhba_2" style="width:110px;">Danh bạ đối tác</div></a>
            <a href="javascript: void(0)" onclick="change_style_danhba(3)" id="a_menu_danhba_3">
            <div class="c_menu_danhba" id="c_menu_danhba_3" style="width:100px;">Danh bạ khách hàng</div></a>-->
        </div>
        <div style="float:left; height:26px; width:100%"></div>
        <!-- Content -->
        <div id="danhba_content_outsign">
        	<!-- Main -->
            <div id="danhba_content_main" style="display:none"></div>
            <!-------####---------->
        </div>
    </div>
</div>
<?php echo '
<script language="javascript">	
	var div_danhba_arr = [\'add_danhba\'];
	
	function change_bgcl_danhba(obj){
		for(i=0;i<=div_danhba_arr.length;i++){
			if(div_danhba_arr[i] == obj){
				document.getElementById(\'div_danhba\').style.zIndex=\'2000\';
				document.getElementById(obj).style.zIndex = \'2001\'; 
				document.getElementById(obj).style.borderColor=\'#F00\';
			}else{
				document.getElementById(div_danhba_arr[i]).style.zIndex=\'2000\';
				document.getElementById(div_danhba_arr[i]).style.borderColor=\'#99bbe8\';
			}
		}
	}
	
	$("#danhba_content_outsign").mouseover( function () { 
		$( "#div_danhba" ).draggable({ disabled: true });
	});
	$("#danhba_content_outsign").mouseout( function () { 
		$( "#div_danhba" ).draggable({ disabled: false });
	});
	
	$("#danhba_menu").mouseover( function () { 
		$( "#div_danhba" ).draggable({ disabled: true });
	});
	$("#danhba_menu").mouseout( function () { 
		$( "#div_danhba" ).draggable({ disabled: false });
	});
				
	$("#a_menu_danhba_1").click( function () { 
		for(i=0;i<div_danhba_arr.length;i++){
			document.getElementById(div_danhba_arr[i]).style.display=\'none\';
		}
				
		document.getElementById(\'danhba_content_main\').style.display=\'block\';
		$("#danhba_content_main").load("index.php?listDocinQLVB&mod=truyennhans");
		
	});
	$("#a_menu_danhba_2").click( function () { 
		for(i=0;i<div_danhba_arr.length;i++){
			document.getElementById(div_danhba_arr[i]).style.display=\'none\';
		}
				
		document.getElementById(\'danhba_content_main\').style.display=\'block\';
		$("#danhba_content_main").load("index.php?VT_Truyennhan&mod=truyennhans");
	});
	$("#a_menu_danhba_3").click( function () { 
		for(i=0;i<div_danhba_arr.length;i++){
			document.getElementById(div_danhba_arr[i]).style.display=\'none\';
		}
				
		document.getElementById(\'danhba_content_main\').style.display=\'block\';
		$("#danhba_content_main").load("index.php?ND_Truyennhan&mod=truyennhans");
	});
	
	function close_all_window_danhba(){
		document.getElementById(\'div_danhba\').style.display=\'none\';
		for(i=0;i<div_danhba_arr.length;i++){
			document.getElementById(div_danhba_arr[i]).style.display=\'none\';
		}
	}
</script>
'; ?>

<!--****************************************HET VUNG DIV CHUC NANG****************************************-->