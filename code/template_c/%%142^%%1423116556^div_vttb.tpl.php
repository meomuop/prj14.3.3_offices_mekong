<?php /* Smarty version 2.6.2, created on 2018-12-16 09:48:59
         compiled from div_vttb.tpl */ ?>
﻿<?php echo '
<style>
#div_vttb{ width: 811px; height: 550px; padding: 0px 1px 1px 1px; border:1px solid #8ea4c1; background-color:#ffffff;
	position:absolute; margin:40px 200px; z-index:100; font-size:12px
	/*display: none; position: absolute; background-color: white2; overflow: auto;	*/
}
#vttb_main_cont{ float:left; width:100%; height:550px; background-color:#ccd8e7}
#vttb_tab_bar_tit{ float:left; font-weight:bold; text-transform:uppercase; line-height:20px; padding-left:8px; width:80%;cursor:move; color:#15428b;}
#vttb_tab_bar_icon{ float:right; width:10%; text-align:right; padding-top:2px; padding-right:6px}
#vttb_content_outsign{ float:left; width:97.7%; height:494px; background-color:#ffffff; margin-left:8px; border:1px solid #99bbe8}
#vttb_content_insign{ float:left; width:99.7%; height:475px; background-color:#dfe8f6; margin-left:1px;}
#vttb_content_main{ float:left; width:99.8%; height:493px; background-color:#dfe8f6; margin-left:1px;}

#vttb_clear_txt{ float:left; width:100%; height:1px}
#vttb_tool_bar{ float:left; width:99.7%; height:20px; background-color:#dfe8f6; margin-left:1px}
#vttb_search_area{ float:left; width:120px; height:20px; padding-left:2px}
#vttb_page_area{ float:left; width:40px; height:20px; padding-left:2px}
#vttb_menu{ float:left; width:99.7%; height:25px; padding-left:8px; position:absolute; margin-top:21px}

/*----------------------vttbscat div---------------------*/
#a_e_vttbcat_main_cont{ float:left; width:100%; height:193px; background-color:#ccd8e7}
#a_e_vttbcat_tab_bar_tit{ float:left; font-weight:bold; text-transform:uppercase; line-height:20px; padding-left:8px; width:80%;cursor:move; color:#15428b;}
#a_e_vttbcat_tab_bar_icon{ float:right; width:10%; text-align:right; padding-top:2px; padding-right:6px}
#a_e_vttbcat_content_outsign{ float:left; width:95.7%; height:163px; background-color:#ffffff; margin-left:8px; border:1px solid #99bbe8}
#a_e_vttbcat_content_insign{ float:left; width:99.8%; height:150px; background-color:#dfe8f6; margin-left:1px;}
#list_a_e_vttbcat_cont{ float:left; width:99.7%; height:162px; background-color:#dfe8f6; margin-left:1px;}
#a_e_vttbcat_clear_txt{ float:left; width:100%; height:1px}
#a_e_vttbcat_tool_bar{ float:left; width:99.8%; height:20px; background-color:#dfe8f6; margin-left:1px}
#a_e_vttbcat_search_area{ float:left; width:120px; height:20px; padding-left:2px}
#a_e_vttbcat_page_area{ float:left; width:40px; height:20px; padding-left:2px}
#a_e_vttbcat_menu{ float:left; width:99.8%; height:25px; padding-left:8px; position:absolute; margin-top:21px}
/*----------------------end a_e_vttbcat div---------------------*/

/*----------------------a_e_vttbsub div---------------------*/
#a_e_vttbsub_main_cont{ float:left; width:100%; height:222px; background-color:#ccd8e7}
#a_e_vttbsub_tab_bar_tit{ float:left; font-weight:bold; text-transform:uppercase; line-height:20px; padding-left:8px; width:80%;cursor:move; color:#15428b;}
#a_e_vttbsub_tab_bar_icon{ float:right; width:10%; text-align:right; padding-top:2px; padding-right:6px}
#a_e_vttbsub_content_outsign{ float:left; width:95.7%; height:192px; background-color:#ffffff; margin-left:8px; border:1px solid #99bbe8}
#a_e_vttbsub_content_insign{ float:left; width:99.8%; height:179px; background-color:#dfe8f6; margin-left:1px;}
#list_a_e_vttbsub_cont{ float:left; width:99.7%; height:191px; background-color:#dfe8f6; margin-left:1px;}
#a_e_vttbsub_clear_txt{ float:left; width:100%; height:1px}
#a_e_vttbsub_tool_bar{ float:left; width:99.8%; height:20px; background-color:#dfe8f6; margin-left:1px}
#a_e_vttbsub_search_area{ float:left; width:120px; height:20px; padding-left:2px}
#a_e_vttbsub_page_area{ float:left; width:40px; height:20px; padding-left:2px}
#a_e_vttbsub_menu{ float:left; width:99.8%; height:25px; padding-left:8px; position:absolute; margin-top:21px}
/*----------------------end a_e_vttbsub div---------------------*/

/*----------------------a_e_vttb div---------------------*/
#a_e_vttb_main_cont{ float:left; width:100%; height:245px; background-color:#ccd8e7}
#a_e_vttb_tab_bar_tit{ float:left; font-weight:bold; text-transform:uppercase; line-height:20px; padding-left:8px; width:80%;cursor:move; color:#15428b;}
#a_e_vttb_tab_bar_icon{ float:right; width:10%; text-align:right; padding-top:2px; padding-right:6px}
#a_e_vttb_content_outsign{ float:left; width:96.4%; height:215px; background-color:#ffffff; margin-left:8px; border:1px solid #99bbe8}
#a_e_vttb_content_insign{ float:left; width:99.8%; height:202px; background-color:#dfe8f6; margin-left:1px;}
#list_a_e_vttb_cont{ float:left; width:99.7%; height:214px; background-color:#dfe8f6; margin-left:1px;}
#a_e_vttb_clear_txt{ float:left; width:100%; height:1px}
#a_e_vttb_tool_bar{ float:left; width:99.8%; height:20px; background-color:#dfe8f6; margin-left:1px}
#a_e_vttb_search_area{ float:left; width:120px; height:20px; padding-left:2px}
#a_e_vttb_page_area{ float:left; width:40px; height:20px; padding-left:2px}
#a_e_vttb_menu{ float:left; width:99.8%; height:25px; padding-left:8px; position:absolute; margin-top:21px}
/*----------------------end a_e_vttb div---------------------*/

/*----------------------repare div---------------------*/
#list_repare_main_cont{ float:left; width:100%; height:400px; background-color:#ccd8e7}
#list_repare_tab_bar_tit{ float:left; font-weight:bold; text-transform:uppercase; line-height:20px; padding-left:8px; width:80%;cursor:move; color:#15428b;}
#list_repare_tab_bar_icon{ float:right; width:10%; text-align:right; padding-top:2px; padding-right:6px}
#list_repare_content_outsign{ float:left; width:95.3%; height:370px; background-color:#ffffff; margin-left:8px; border:1px solid #99bbe8}
#list_repare_content_insign{ float:left; width:99.7%; height:349px; background-color:#dfe8f6; margin-left:1px;}
#list_repare_cont{ float:left; width:99.5%; height:369px; background-color:#dfe8f6; margin-left:1px;}
#list_repare_clear_txt{ float:left; width:100%; height:1px}
#list_repare_tool_bar{ float:left; width:99.7%; height:20px; background-color:#dfe8f6; margin-left:1px}
#list_repare_search_area{ float:left; width:120px; height:20px; padding-left:2px}
#list_repare_page_area{ float:left; width:40px; height:20px; padding-left:2px}
#list_repare_menu{ float:left; width:99.7%; height:25px; padding-left:8px; position:absolute; margin-top:21px}
/*----------------------end repare div---------------------*/

/*----------------------replace div---------------------*/
#list_replace_main_cont{ float:left; width:100%; height:400px; background-color:#ccd8e7}
#list_replace_tab_bar_tit{ float:left; font-weight:bold; text-transform:uppercase; line-height:20px; padding-left:8px; width:80%;cursor:move; color:#15428b;}
#list_replace_tab_bar_icon{ float:right; width:10%; text-align:right; padding-top:2px; padding-right:6px}
#list_replace_content_outsign{ float:left; width:95.3%; height:370px; background-color:#ffffff; margin-left:8px; border:1px solid #99bbe8}
#list_replace_content_insign{ float:left; width:99.7%; height:349px; background-color:#dfe8f6; margin-left:1px;}
#list_replace_cont{ float:left; width:99.5%; height:369px; background-color:#dfe8f6; margin-left:1px;}
#list_replace_clear_txt{ float:left; width:100%; height:1px}
#list_replace_tool_bar{ float:left; width:99.7%; height:20px; background-color:#dfe8f6; margin-left:1px}
#list_replace_search_area{ float:left; width:120px; height:20px; padding-left:2px}
#list_replace_page_area{ float:left; width:40px; height:20px; padding-left:2px}
#list_replace_menu{ float:left; width:99.7%; height:25px; padding-left:8px; position:absolute; margin-top:21px}
/*----------------------end replace div---------------------*/

/*----------------------datlich div---------------------*/
#list_datlich_main_cont{ float:left; width:100%; height:450px; background-color:#ccd8e7}
#list_datlich_tab_bar_tit{ float:left; font-weight:bold; text-transform:uppercase; line-height:20px; padding-left:8px; width:80%;cursor:move; color:#15428b;}
#list_datlich_tab_bar_icon{ float:right; width:10%; text-align:right; padding-top:2px; padding-right:6px}
#list_datlich_content_outsign{ float:left; width:95.3%; height:418px; background-color:#ffffff; margin-left:8px; border:1px solid #99bbe8}
#list_datlich_content_insign{ float:left; width:99.7%; height:397px; background-color:#dfe8f6; margin-left:1px;}
#list_datlich_cont{ float:left; width:99.5%; height:417px; background-color:#dfe8f6; margin-left:1px;}
#list_datlich_clear_txt{ float:left; width:100%; height:1px}
#list_datlich_tool_bar{ float:left; width:99.7%; height:20px; background-color:#dfe8f6; margin-left:1px}
#list_datlich_search_area{ float:left; width:120px; height:20px; padding-left:2px}
#list_datlich_page_area{ float:left; width:40px; height:20px; padding-left:2px}
#list_datlich_menu{ float:left; width:99.7%; height:25px; padding-left:8px; position:absolute; margin-top:21px}
/*----------------------end datlich div---------------------*/

/*----------------------div_vttb_info div---------------------*/
#div_vttb_info_main_cont{ float:left; width:100%; height:430px; background-color:#ccd8e7}
#div_vttb_info_tab_bar_tit{ float:left; font-weight:bold; text-transform:uppercase; line-height:20px; padding-left:8px; width:80%;cursor:move; color:#15428b;}
#div_vttb_info_tab_bar_icon{ float:right; width:10%; text-align:right; padding-top:2px; padding-right:6px}
#div_vttb_info_content_outsign{ float:left; width:96.3%; height:400px; background-color:#ffffff; margin-left:8px; border:1px solid #99bbe8}
#div_vttb_info_content_insign{ float:left; width:99.7%; height:379px; background-color:#dfe8f6; margin-left:1px;}
#div_vttb_info_cont{ float:left; width:99.7%; height:399px; background-color:#dfe8f6; margin-left:1px;}
#div_vttb_info_clear_txt{ float:left; width:100%; height:1px}
#div_vttb_info_tool_bar{ float:left; width:99.7%; height:20px; background-color:#dfe8f6; margin-left:1px}
#div_vttb_info_search_area{ float:left; width:120px; height:20px; padding-left:2px}
#div_vttb_info_page_area{ float:left; width:40px; height:20px; padding-left:2px}
#div_vttb_info_menu{ float:left; width:99.7%; height:25px; padding-left:8px; position:absolute; margin-top:21px}
/*----------------------end div_vttb_info div---------------------*/

.c_menu_vttb{float:left; border-right:1px solid #99bbe8; line-height:21px; height:21px; padding-left:2px; border-top:1px solid #99bbe8; margin-top:4px}

.img_all{opacity:0.7}
.img_all:hover{opacity:1}
</style>
<script>
$(function() {
	$( "#div_vttb" ).draggable();
	$( "#a_e_vttbcat" ).draggable();
	$( "#a_e_vttbsub" ).draggable();
	$( "#a_e_vttb" ).draggable();
	$( "#list_repare" ).draggable();
	$( "#list_replace" ).draggable();
	$( "#list_datlich" ).draggable();
	$( "#div_vttb_info" ).draggable();
});
function min_size_vttb(){
	if(document.getElementById(\'div_vttb\').style.height==\'550px\'){
		document.getElementById(\'div_vttb\').style.height=\'20px\';
		document.getElementById(\'vttb_main_cont\').style.height=\'20px\';
		document.getElementById(\'vttb_content_outsign\').style.display=\'none\';
		document.getElementById(\'vttb_content_insign\').style.display=\'none\';
		document.getElementById(\'vttb_tool_bar\').style.display=\'none\';
		document.getElementById(\'vttb_menu\').style.display=\'none\';
	}else{
		document.getElementById(\'div_vttb\').style.height=\'550px\';
		document.getElementById(\'vttb_main_cont\').style.height=\'550px\';
		document.getElementById(\'vttb_content_outsign\').style.display=\'\';
		document.getElementById(\'vttb_content_insign\').style.display=\'\';
		document.getElementById(\'vttb_tool_bar\').style.display=\'\';
		document.getElementById(\'vttb_menu\').style.display=\'\';
	}
}
function reset_pos_vttb(){
	document.getElementById(\'div_vttb\').style.margin=\'40px 200px\';
}
function max_size_vttb(){
	if(document.getElementById(\'div_vttb\').style.width==\'50%\'){
		document.getElementById(\'div_vttb\').style.margin=\'0\';
		document.getElementById(\'div_vttb\').style.width=\'98%\';
		document.getElementById(\'div_vttb\').style.height=\'600px\';
		document.getElementById(\'vttb_main_cont\').style.height=\'600px\';
		document.getElementById(\'vttb_content_outsign\').style.height=\'545px\';
		document.getElementById(\'vttb_content_insign\').style.height=\'523px\';
	}else{
		document.getElementById(\'div_vttb\').style.margin=\'10px 200px\';
		document.getElementById(\'div_vttb\').style.width=\'50%\';
		document.getElementById(\'div_vttb\').style.height=\'550px\';
		document.getElementById(\'vttb_main_cont\').style.height=\'550px\';
		document.getElementById(\'vttb_content_outsign\').style.height=\'495px\';
		document.getElementById(\'vttb_content_insign\').style.height=\'473px\';
	}
}
function change_style_vttb(obj){
	for(i=1;i<=3;i++){
		if(i==obj){
			document.getElementById(\'c_menu_vttb_\'+i).style.borderLeft = \'1px solid #99bbe8\';
			document.getElementById(\'c_menu_vttb_\'+i).style.borderRight = \'1px solid #99bbe8\';
			document.getElementById(\'c_menu_vttb_\'+i).style.borderBottom = \'1px solid #dfe8f6\';
			document.getElementById(\'c_menu_vttb_\'+i).style.backgroundColor = \'#dfe8f6\';
			document.getElementById(\'c_menu_vttb_\'+i).style.height = \'25px\';
			document.getElementById(\'c_menu_vttb_\'+i).style.marginTop = \'0px\';
		}
		else{
			if(i!=1){
				document.getElementById(\'c_menu_vttb_\'+i).style.borderLeft = \'none\';
			}
			if(i==obj-1){
				document.getElementById(\'c_menu_vttb_\'+i).style.borderRight = \'none\';
			}else{
				document.getElementById(\'c_menu_vttb_\'+i).style.borderRight = \'1px solid #99bbe8\';
			}
			document.getElementById(\'c_menu_vttb_\'+i).style.borderBottom = \'none\';
			document.getElementById(\'c_menu_vttb_\'+i).style.backgroundColor = \'#ccd8e7\';
			document.getElementById(\'c_menu_vttb_\'+i).style.height = \'20px\';
			document.getElementById(\'c_menu_vttb_\'+i).style.marginTop = \'4px\';
		}
	}
}
</script>
'; ?>

<!--*******************************************VUNG DIV CHUC NANG*****************************************-->
<div id="div_vttb" class="ui-widget-content" style="display:none" onclick="javascript: change_Zindex('div_vttb')">
    <div id="vttb_main_cont">
        <!-- Tab bar -->
        <div id="vttb_tab_bar_tit">Vật tư thiết bị, cơ sở vật chất (VTTB,CSVC)</div>
        <div id="vttb_tab_bar_icon">
            <a href="javascript: void(0);" onClick="min_size_vttb();" style="text-decoration:none">
            <img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_thu_gon.png" class="img_all" title="Ẩn/hiện"></a>
            <a href="javascript: void(0);" onClick="max_size_vttb();" style="text-decoration:none">
            <img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_mo_rong.png" class="img_all" title="Mở rộng/thu nhỏ"></a>
            <a href="javascript: void(0);" onClick="javascript: close_all_window_vttb(); change_style_vttb(1)" style="text-decoration:none">
            <img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_dong.png" class="img_all" title="Đóng lại"></a>
        </div>
        <!-- Menu -->
        <div id="vttb_menu">
        	<div style="width:10px; float:left">&nbsp;</div>
            <a href="javascript: void(0)" onclick="change_style_vttb(1)" id="a_menu_vttb_1">
            <div class="c_menu_vttb" id="c_menu_vttb_1" style="width:80px; border-left:1px solid #99bbe8; border-bottom:1px solid #dfe8f6; background-color:#dfe8f6; height:25px; margin-top:0px">Vật tư thiết bị</div></a>
            <!--<a href="javascript: void(0)" onclick="change_style_vttb(2)" id="a_menu_vttb_2">
            <div class="c_menu_vttb" id="c_menu_vttb_2" style="width:85px;">Bảo trì</div></a>-->
        </div>
        <div style="float:left; height:26px; width:100%"></div>
        <!-- Content -->
        <div id="vttb_content_outsign">
        	<!-- Main -->
            <div id="vttb_content_main" style="display:none"></div>
            <!-------####---------->
        </div>
    </div>
</div>

<div id="a_e_vttbcat" onclick="javascript: change_bgcl_vttb('a_e_vttbcat')" style="width:410px; float:left; font-weight:normal; position:absolute; display:none; margin:180px 0 0 337px; background-color:#ffffff; border:1px solid #99bbe8; z-index:1010; padding: 0px 1px 1px 1px">
	<div id="a_e_vttbcat_main_cont">
        <div id="a_e_vttbcat_tab_bar_tit">Danh mục</div>
        <div id="a_e_vttbcat_tab_bar_icon">
            <a href="javascript: void(0);" onClick="javascript: document.getElementById('a_e_vttbcat').style.display='none'" style="text-decoration:none">
            	<img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_dong.png" class="img_all" title="Đóng lại"></a>
        </div>
        <div id="a_e_vttbcat_content_outsign">
        	<div id="list_a_e_vttbcat_cont">
            </div>
        </div>
    </div>
</div>

<div id="a_e_vttbsub" onclick="javascript: change_bgcl_vttb('a_e_vttbsub')" style="width:410px; float:left; font-weight:normal; position:absolute; display:none; margin:180px 0 0 337px; background-color:#ffffff; border:1px solid #99bbe8; z-index:1010; padding: 0px 1px 1px 1px">
	<div id="a_e_vttbsub_main_cont">
        <div id="a_e_vttbsub_tab_bar_tit">Phụ mục</div>
        <div id="a_e_vttbsub_tab_bar_icon">
            <a href="javascript: void(0);" onClick="javascript: document.getElementById('a_e_vttbsub').style.display='none'" style="text-decoration:none">
            	<img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_dong.png" class="img_all" title="Đóng lại"></a>
        </div>
        <div id="a_e_vttbsub_content_outsign">
        	<div id="list_a_e_vttbsub_cont">
            </div>
        </div>
    </div>
</div>

<div id="a_e_vttb" onclick="javascript: change_bgcl_vttb('a_e_vttb')" style="width:512px; float:left; font-weight:normal; position:absolute; display:none; margin:180px 0 0 337px; background-color:#ffffff; border:1px solid #99bbe8; z-index:1010; padding: 0px 1px 1px 1px">
	<div id="a_e_vttb_main_cont">
        <div id="a_e_vttb_tab_bar_tit">Thêm/sửa vật tư thiết bị</div>
        <div id="a_e_vttb_tab_bar_icon">
            <a href="javascript: void(0);" onClick="javascript: document.getElementById('a_e_vttb').style.display='none'" style="text-decoration:none">
            	<img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_dong.png" class="img_all" title="Đóng lại"></a>
        </div>
        <div id="a_e_vttb_content_outsign">
        	<div id="list_a_e_vttb_cont">
            </div>
        </div>
    </div>
</div>

<div id="list_repare" onclick="javascript: change_bgcl_transport('list_repare')" style="width:390px; float:left; font-weight:normal; position:absolute; display:none; margin:90px 0 0 590px; background-color:#ffffff; border:1px solid #99bbe8; z-index:1010; padding: 0px 1px 1px 1px">
	<div id="list_repare_main_cont">
        <div id="list_repare_tab_bar_tit">Sửa chữa thiết bị</div>
        <div id="list_repare_tab_bar_icon">
            <a href="javascript: void(0);" onClick="javascript: document.getElementById('list_repare').style.display='none'" style="text-decoration:none">
            <img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_dong.png" class="img_all" title="Đóng lại"></a>
        </div>
        <div id="list_repare_content_outsign">
        	<div id="list_repare_cont">
            </div>
        </div>
    </div>
</div>

<div id="list_replace" onclick="javascript: change_bgcl_transport('list_replace')" style="width:390px; float:left; font-weight:normal; position:absolute; display:none; margin:90px 0 0 590px; background-color:#ffffff; border:1px solid #99bbe8; z-index:1010; padding: 0px 1px 1px 1px">
	<div id="list_replace_main_cont">
        <div id="list_replace_tab_bar_tit">Thay thế - nâng cấp</div>
        <div id="list_replace_tab_bar_icon">
            <a href="javascript: void(0);" onClick="javascript: document.getElementById('list_replace').style.display='none'" style="text-decoration:none">
            <img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_dong.png" class="img_all" title="Đóng lại"></a>
        </div>
        <div id="list_replace_content_outsign">
        	<div id="list_replace_cont">
            </div>
        </div>
    </div>
</div>

<div id="list_datlich" onclick="javascript: change_bgcl_transport('list_datlich')" style="width:405px; float:left; font-weight:normal; position:absolute; display:none; margin:90px 0 0 590px; background-color:#ffffff; border:1px solid #99bbe8; z-index:1010; padding: 0px 1px 1px 1px">
	<div id="list_datlich_main_cont">
        <div id="list_datlich_tab_bar_tit">Đặt lịch sử dụng</div>
        <div id="list_datlich_tab_bar_icon">
            <a href="javascript: void(0);" onClick="javascript: document.getElementById('list_datlich').style.display='none'" style="text-decoration:none">
            <img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_dong.png" class="img_all" title="Đóng lại"></a>
        </div>
        <div id="list_datlich_content_outsign">
        	<div id="list_datlich_cont">
            </div>
        </div>
    </div>
</div>

<div id="div_vttb_info" onclick="javascript: change_bgcl_transport('div_vttb_info')" style="width:492px; float:left; font-weight:normal; position:absolute; display:none; margin:130px 0 0 480px; background-color:#ffffff; border:1px solid #99bbe8; z-index:1010; padding: 0px 1px 1px 1px">
	<div id="div_vttb_info_main_cont">
        <div id="div_vttb_info_tab_bar_tit">Thông tin vật tư thiết bị</div>
        <div id="div_vttb_info_tab_bar_icon">
            <a href="javascript: void(0);" onClick="javascript: document.getElementById('div_vttb_info').style.display='none'" style="text-decoration:none">
            <img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_dong.png" class="img_all" title="Đóng lại"></a>
        </div>
        <div id="div_vttb_info_content_outsign">
        	<div id="div_vttb_info_cont">
            </div>
        </div>
    </div>
</div>

<?php echo '
<script language="javascript">	
	var div_vttb_arr = [\'a_e_vttbcat\',\'a_e_vttbsub\',\'a_e_vttb\',\'list_repare\',\'list_replace\',\'list_datlich\',\'div_vttb_info\'];
	
	function change_bgcl_vttb(obj){
		for(i=0;i<=div_vttb_arr.length;i++){
			if(div_vttb_arr[i] == obj){
				document.getElementById(\'div_vttb\').style.zIndex=\'2000\';
				document.getElementById(obj).style.zIndex = \'2001\'; 
				document.getElementById(obj).style.borderColor=\'#F00\';
			}else{
				document.getElementById(div_vttb_arr[i]).style.zIndex=\'2000\';
				document.getElementById(div_vttb_arr[i]).style.borderColor=\'#99bbe8\';
			}
		}
	}
	
	$("#vttb_content_outsign").mouseover( function () { 
		$( "#div_vttb" ).draggable({ disabled: true });
	});
	$("#vttb_content_outsign").mouseout( function () { 
		$( "#div_vttb" ).draggable({ disabled: false });
	});
	
	$("#vttb_menu").mouseover( function () { 
		$( "#div_vttb" ).draggable({ disabled: true });
	});
	$("#vttb_menu").mouseout( function () { 
		$( "#div_vttb" ).draggable({ disabled: false });
	});
	
	$("#a_e_vttbcat_content_outsign").mouseover( function () { 
		$( "#a_e_vttbcat" ).draggable({ disabled: true });
	});
	$("#a_e_vttbcat_content_outsign").mouseout( function () { 
		$( "#a_e_vttbcat" ).draggable({ disabled: false });
	});
		
	$("#a_e_vttbsub_content_outsign").mouseover( function () { 
		$( "#a_e_vttbsub" ).draggable({ disabled: true });
	});
	$("#a_e_vttbsub_content_outsign").mouseout( function () { 
		$( "#a_e_vttbsub" ).draggable({ disabled: false });
	});
		
	$("#a_e_vttb_content_outsign").mouseover( function () { 
		$( "#a_e_vttb" ).draggable({ disabled: true });
	});
	$("#a_e_vttb_content_outsign").mouseout( function () { 
		$( "#a_e_vttb" ).draggable({ disabled: false });
	});
	
	$("#list_repare_content_outsign").mouseover( function () {
		$( "#list_repare" ).draggable({ disabled: true });
	});
	$("#list_repare_content_outsign").mouseout( function () { 
		$( "#list_repare" ).draggable({ disabled: false });
	});
	
	$("#list_replace_content_outsign").mouseover( function () { 
		$( "#list_replace" ).draggable({ disabled: true });
	});
	$("#list_replace_content_outsign").mouseout( function () { 
		$( "#list_replace" ).draggable({ disabled: false });
	});
	
	$("#list_datlich_content_outsign").mouseover( function () { 
		$( "#list_datlich" ).draggable({ disabled: true });
	});
	$("#list_datlich_content_outsign").mouseout( function () { 
		$( "#list_datlich" ).draggable({ disabled: false });
	});
	
	$("#div_vttb_info_content_outsign").mouseover( function () { 
		$( "#div_vttb_info" ).draggable({ disabled: true });
	});
	$("#div_vttb_info_content_outsign").mouseout( function () { 
		$( "#div_vttb_info" ).draggable({ disabled: false });
	});
					
	$("#a_menu_vttb_1").click( function () { 
		for(i=0;i<div_vttb_arr.length;i++){
			document.getElementById(div_vttb_arr[i]).style.display=\'none\';
		}
				
		document.getElementById(\'vttb_content_main\').style.display=\'block\';
		$("#vttb_content_main").load("index.php?listVTTB_Chung&mod=vttbs");
		
	});
	$("#a_menu_vttb_2").click( function () { 
		for(i=0;i<div_vttb_arr.length;i++){
			document.getElementById(div_vttb_arr[i]).style.display=\'none\';
		}
				
		document.getElementById(\'vttb_content_main\').style.display=\'block\';
		$("#vttb_content_main").load("index.php?listVTTB_Chung&mod=vttbs");
	});
	
	function close_all_window_vttb(){
		document.getElementById(\'div_vttb\').style.display=\'none\';
		for(i=0;i<div_vttb_arr.length;i++){
			document.getElementById(div_vttb_arr[i]).style.display=\'none\';
		}
	}
</script>
'; ?>

<!--****************************************HET VUNG DIV CHUC NANG****************************************-->