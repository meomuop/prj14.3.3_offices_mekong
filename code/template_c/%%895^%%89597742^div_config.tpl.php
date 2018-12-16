<?php /* Smarty version 2.6.2, created on 2018-12-16 09:48:59
         compiled from div_config.tpl */ ?>
﻿<?php echo '
<style>
#div_config{ width: 539px; height: 500px; padding: 0px 1px 1px 1px; border:1px solid #8ea4c1; background-color:#ffffff;
	position:absolute; margin:50px 250px; z-index:100; font-size:12px
	/*display: none; position: absolute; background-color: white2; overflow: auto;	*/
}
#config_main_cont{ float:left; width:100%; height:500px; background-color:#ccd8e7}
#config_tab_bar_tit{ float:left; font-weight:bold; text-transform:uppercase; line-height:20px; padding-left:8px; width:80%;cursor:move; color:#15428b;}
#config_tab_bar_icon{ float:right; width:10%; text-align:right; padding-top:2px; padding-right:6px}
#config_content_outsign{ float:left; width:97%; height:445px; background-color:#ffffff; margin-left:8px; border:1px solid #99bbe8}
#config_content_insign{ float:left; width:99.7%; height:423px; background-color:#dfe8f6; margin-left:1px;}
#config_content_main{ float:left; width:99.7%; height:445px; background-color:#dfe8f6; margin-left:1px;}
#config_clear_txt{ float:left; width:100%; height:1px}
#config_tool_bar{ float:left; width:99.7%; height:20px; background-color:#dfe8f6; margin-left:1px}
#config_search_area{ float:left; width:23%; height:20px; padding-left:2px}
#config_page_area{ float:left; width:7.5%; height:20px; padding-left:2px}
#config_menu{ float:left; width:99.7%; height:25px; padding-left:8px; position:absolute; margin-top:21px}

.c_menu_config{float:left; border-right:1px solid #99bbe8; line-height:21px; height:21px; padding-left:2px; border-top:1px solid #99bbe8; margin-top:4px}

.img_all{opacity:0.7}
.img_all:hover{opacity:1}
</style>
<script>
$(function() {
	$( "#div_config" ).draggable();
});
function min_size_config(){
	if(document.getElementById(\'div_config\').style.height==\'500px\'){
		document.getElementById(\'div_config\').style.height=\'20px\';
		document.getElementById(\'config_main_cont\').style.height=\'20px\';
		document.getElementById(\'config_content_outsign\').style.display=\'none\';
		document.getElementById(\'config_content_insign\').style.display=\'none\';
		document.getElementById(\'config_tool_bar\').style.display=\'none\';
		document.getElementById(\'config_menu\').style.display=\'none\';
	}else{
		document.getElementById(\'div_config\').style.height=\'500px\';
		document.getElementById(\'config_main_cont\').style.height=\'500px\';
		document.getElementById(\'config_content_outsign\').style.display=\'\';
		document.getElementById(\'config_content_insign\').style.display=\'\';
		document.getElementById(\'config_tool_bar\').style.display=\'\';
		document.getElementById(\'config_menu\').style.display=\'\';
	}
}
function reset_pos_config(){
	document.getElementById(\'div_config\').style.margin=\'50px 250px\';
}
function max_size_config(){
	if(document.getElementById(\'div_config\').style.width==\'40%\'){
		document.getElementById(\'div_config\').style.margin=\'0\';
		document.getElementById(\'div_config\').style.width=\'98%\';
		document.getElementById(\'div_config\').style.height=\'600px\';
		document.getElementById(\'config_main_cont\').style.height=\'600px\';
		document.getElementById(\'config_content_outsign\').style.height=\'545px\';
		document.getElementById(\'config_content_insign\').style.height=\'523px\';
	}else{
		document.getElementById(\'div_config\').style.margin=\'50px 250px\';
		document.getElementById(\'div_config\').style.width=\'40%\';
		document.getElementById(\'div_config\').style.height=\'500px\';
		document.getElementById(\'config_main_cont\').style.height=\'500px\';
		document.getElementById(\'config_content_outsign\').style.height=\'445px\';
		document.getElementById(\'config_content_insign\').style.height=\'423px\';
	}
}
function change_style_config(obj){
	for(i=1;i<=6;i++){
		//alert(\'obj: \'+obj);
		if(i==obj){
			document.getElementById(\'c_menu_config_\'+i).style.borderLeft = \'1px solid #99bbe8\';
			document.getElementById(\'c_menu_config_\'+i).style.borderRight = \'1px solid #99bbe8\';
			document.getElementById(\'c_menu_config_\'+i).style.borderBottom = \'1px solid #dfe8f6\';
			document.getElementById(\'c_menu_config_\'+i).style.backgroundColor = \'#dfe8f6\';
			document.getElementById(\'c_menu_config_\'+i).style.height = \'25px\';
			document.getElementById(\'c_menu_config_\'+i).style.marginTop = \'0px\';
		}
		else{
			if(i!=1){
				document.getElementById(\'c_menu_config_\'+i).style.borderLeft = \'none\';
			}
			if(i==obj-1){
				document.getElementById(\'c_menu_config_\'+i).style.borderRight = \'none\';
			}else{
				document.getElementById(\'c_menu_config_\'+i).style.borderRight = \'1px solid #99bbe8\';
			}
			document.getElementById(\'c_menu_config_\'+i).style.borderBottom = \'none\';
			document.getElementById(\'c_menu_config_\'+i).style.backgroundColor = \'#ccd8e7\';
			document.getElementById(\'c_menu_config_\'+i).style.height = \'20px\';
			document.getElementById(\'c_menu_config_\'+i).style.marginTop = \'4px\';
		}
	}
}
</script>
'; ?>

<!--*******************************************VUNG DIV CHUC NANG*****************************************-->
<div id="div_config" class="ui-widget-content" style="display:none" onclick="javascript: change_Zindex('div_config')">
    <div id="config_main_cont">
        <!-- Tab bar -->
        <div id="config_tab_bar_tit">Cấu hình phần mềm</div>
        <div id="config_tab_bar_icon">
            <a href="javascript: void(0);" onClick="min_size_config();" style="text-decoration:none">
            <img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_thu_gon.png" class="img_all" title="Ẩn/hiện"></a>
            <a href="javascript: void(0);" onClick="max_size_config();" style="text-decoration:none">
            <img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_mo_rong.png" class="img_all" title="Mở rộng/thu nhỏ"></a>
            <a href="javascript: void(0);" onClick="javascript: document.getElementById('div_config').style.display='none'; change_style_config(1)" style="text-decoration:none">
            <img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_dong.png" class="img_all" title="Đóng lại"></a>
        </div>
        <!-- Menu -->
        <div id="config_menu">
        	<div style="width:10px; float:left">&nbsp;</div>
            <a href="javascript: void(0)" onclick="change_style_config('1')" id="a_menu_config_1">
            <div class="c_menu_config" id="c_menu_config_1" style="width:100px; border-left:1px solid #99bbe8; border-bottom:1px solid #dfe8f6; background-color:#dfe8f6; height:25px; margin-top:0px">Thông tin đơn vị</div></a>
            <a href="javascript: void(0)" onclick="change_style_config('2')" id="a_menu_config_2">
            <div class="c_menu_config" id="c_menu_config_2" style="width:90px;">Cấu hình SMS</div></a>
            <a href="javascript: void(0)" onclick="change_style_config('3')" id="a_menu_config_3">
            <div class="c_menu_config" id="c_menu_config_3" style="width:70px;">Ngày nghỉ</div></a>
            <a href="javascript: void(0)" onclick="change_style_config('4')" id="a_menu_config_4">
            <div class="c_menu_config" id="c_menu_config_4" style="width:80px;">Video HDSD</div></a>
            <a href="javascript: void(0)" onclick="change_style_config('5')" id="a_menu_config_5">
            <div class="c_menu_config" id="c_menu_config_5" style="width:100px;">Cơ sở dữ liệu</div></a>
        </div>
        <div style="float:left; height:26px; width:100%"></div>
        <!-- Content -->
        <div id="config_content_outsign">
        	<!-- Main -->
            <div id="config_content_main">
            </div>
            <!-------####---------->
        </div>
    </div>
</div>
<?php echo '
<script language="javascript">
	$("#config_content_outsign").mouseover( function () { 
		$( "#div_config" ).draggable({ disabled: true });
	});
	
	$("#config_content_outsign").mouseout( function () { 
		$( "#div_config" ).draggable({ disabled: false });
	});
	
	$("#config_menu").mouseover( function () { 
		$( "#div_config" ).draggable({ disabled: true });
	});
	$("#config_menu").mouseout( function () { 
		$( "#div_config" ).draggable({ disabled: false });
	});
	
	$("#a_menu_config_1").click( function () { 
		$("#config_content_main").load("index.php?editConfig&mod=config");
	});
	$("#a_menu_config_2").click( function () { 
		$("#config_content_main").load("index.php?listPort&mod=ports");
	});
	// $("#a_menu_config_3").click( function () {
	// 	$("#config_content_main").load("index.php?listPort&mod=ports");
	// });
	$("#a_menu_config_3").click( function () {
		$("#config_content_main").load("index.php?listHoliday&mod=holidays");
	});
	$("#a_menu_config_4").click( function () {
		$("#config_content_main").load("index.php?listHdsd&mod=hdsds");
	});
	$("#a_menu_config_5").click( function () {
		$("#config_content_main").load("index.php?backup_restore");
	});
</script>
'; ?>

<!--****************************************HET VUNG DIV CHUC NANG****************************************-->
