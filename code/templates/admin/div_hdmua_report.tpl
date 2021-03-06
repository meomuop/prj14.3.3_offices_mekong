﻿{literal}
<style>
#div_hdmua_report{ width: 865px; height: 420px; padding: 0px 1px 1px 1px; border:1px solid #8ea4c1; background-color:#ffffff;
	position:absolute; margin:90px 240px; z-index:100; font-size:12px
	/*display: none; position: absolute; background-color: white2; overflow: auto;	*/
}
#hdmua_report_main_cont{ float:left; width:100%; height:420px; background-color:#ccd8e7}
#hdmua_report_tab_bar_tit{ float:left; font-weight:bold; text-transform:uppercase; line-height:20px; padding-left:8px; width:80%;cursor:move; color:#15428b;}
#hdmua_report_tab_bar_icon{ float:right; width:10%; text-align:right; padding-top:2px; padding-right:6px}
#hdmua_report_content_outsign{ float:left; width:98.4%; height:390px; background-color:#ffffff; margin-left:8px; border:1px solid #99bbe8}
#hdmua_report_content_insign{ float:left; width:99.8%; height:368px; background-color:#dfe8f6; margin-left:1px;}
#hdmua_report_content_main{ float:left; width:99.8%; height:390px; background-color:#dfe8f6; margin-left:1px;}

#hdmua_report_clear_txt{ float:left; width:100%; height:1px}
#hdmua_report_tool_bar{ float:left; width:99.8%; height:20px; background-color:#dfe8f6; margin-left:1px}
#hdmua_report_search_area{ float:left; width:120px; height:20px; padding-left:2px}
#hdmua_report_page_area{ float:left; width:40px; height:20px; padding-left:2px}

.c_menu_hdmua{float:left; border-right:1px solid #99bbe8; line-height:21px; height:21px; padding-left:2px; border-top:1px solid #99bbe8; margin-top:4px}
.legend{margin-left:20px; border:1px solid #99bbe8; width:100px; font-weight:bold; padding-left:2px; line-height:20px; background-color:#ccd8e7}
.legend_list{margin-left:20px; border:1px solid #99bbe8; width:350px; font-weight:bold; padding-left:2px; line-height:20px; background-color:#ccd8e7}
.legend_list_search{margin-left:20px; border:1px solid #99bbe8; width:410px; font-weight:bold; padding-left:2px; line-height:20px; background-color:#ccd8e7}

.img_all{opacity:0.7}
.img_all:hover{opacity:1}
</style>
<script>
$(function() {
	$( "#div_hdmua_report" ).draggable();
});
function min_size_hdmua_report(){
	if(document.getElementById('div_hdmua_report').style.height=='420px'){
		document.getElementById('div_hdmua_report').style.height='20px';
		document.getElementById('hdmua_report_main_cont').style.height='20px';
		document.getElementById('hdmua_report_content_outsign').style.display='none';
		document.getElementById('hdmua_report_content_insign').style.display='none';
		document.getElementById('hdmua_report_tool_bar').style.display='none';
	}else{
		document.getElementById('div_hdmua_report').style.height='420px';
		document.getElementById('hdmua_report_main_cont').style.height='420px';
		document.getElementById('hdmua_report_content_outsign').style.display='';
		document.getElementById('hdmua_report_content_insign').style.display='';
		document.getElementById('hdmua_report_tool_bar').style.display='';
	}
}
function reset_pos_hdmua_report(){
	document.getElementById('div_hdmua_report').style.margin='90px 240px';
}
function max_size_hdmua_report(){
	if(document.getElementById('div_hdmua_report').style.width=='80%'){
		document.getElementById('div_hdmua_report').style.margin='0';
		document.getElementById('div_hdmua_report').style.width='98.5%';
		document.getElementById('div_hdmua_report').style.height='600px';
		document.getElementById('hdmua_report_main_cont').style.height='600px';
		document.getElementById('hdmua_report_content_outsign').style.height='545px';
		document.getElementById('hdmua_report_content_insign').style.height='523px';
	}else{
		document.getElementById('div_hdmua_report').style.margin='90px 240px';
		document.getElementById('div_hdmua_report').style.width='80%';
		document.getElementById('div_hdmua_report').style.height='420px';
		document.getElementById('hdmua_report_main_cont').style.height='420px';
		document.getElementById('hdmua_report_content_outsign').style.height='390px';
		document.getElementById('hdmua_report_content_insign').style.height='368px';
	}
}
</script>
{/literal}
<!--*******************************************VUNG DIV CHUC NANG*****************************************-->
<div id="div_hdmua_report" class="ui-widget-content" style="display:none">
    <div id="hdmua_report_main_cont">
        <!-- Tab bar -->
        <div id="hdmua_report_tab_bar_tit">Kết xuất dữ liệu</div>
        <div id="hdmua_report_tab_bar_icon">
        	<a href="javascript: void(0);" onClick="print_page();" style="text-decoration:none">
            <img src="../images/admin/printer_icon.png" class="img_all" height="16" title="In"></a>
            <a href="javascript: void(0);" onClick="min_size_hdmua_report();" style="text-decoration:none">
            <img src="{$css_path}icon_thu_gon.png" class="img_all" title="Ẩn/hiện"></a>
            <a href="javascript: void(0);" onClick="max_size_hdmua_report();" style="text-decoration:none">
            <img src="{$css_path}icon_mo_rong.png" class="img_all" title="Mở rộng/thu nhỏ"></a>
            <a href="javascript: void(0);" onClick="javascript: document.getElementById('div_hdmua_report').style.display='none';" style="text-decoration:none">
            <img src="{$css_path}icon_dong.png" class="img_all" title="Đóng lại"></a>
        </div>
        <!-- Content -->
        <div id="hdmua_report_content_outsign">
        	<!-- Main -->
            <div id="hdmua_report_content_main">
            </div>
            <!-------####---------->
        </div>
    </div>
</div>
{literal}
<script language="javascript">	
	$("#hdmua_report_content_outsign").mouseover( function () { 
		$( "#div_hdmua_report" ).draggable({ disabled: true });
	});
	
	$("#hdmua_report_content_outsign").mouseout( function () { 
		$( "#div_hdmua_report" ).draggable({ disabled: false });
	});
		
	function print_page(){
		var w;
		w=window.open();
		w.document.write($('#div_cont_print').html());
		w.print();
		w.close();
	}
</script>
{/literal}
<!--****************************************HET VUNG DIV CHUC NANG****************************************-->
