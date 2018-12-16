{literal}
<style>
#div_chatol{ width: 55%; height: 550px; padding: 0px 1px 1px 1px; border:1px solid #8ea4c1; background-color:#ffffff;
	position:absolute; margin:40px 200px; z-index:100; font-size:12px
	/*display: none; position: absolute; background-color: white2; overflow: auto;	*/
}
#chatol_main_cont{ float:left; width:100%; height:550px; background-color:#ccd8e7}
#chatol_tab_bar_tit{ float:left; font-weight:bold; text-transform:uppercase; line-height:20px; padding-left:8px; width:80%;cursor:move; color:#15428b;}
#chatol_tab_bar_icon{ float:right; width:10%; text-align:right; padding-top:2px; padding-right:6px}
#chatol_content_outsign{ float:left; width:97.3%; height:511px; background-color:#ffffff; margin-left:8px; border:1px solid #99bbe8}
#chatol_content_insign{ float:left; width:99.7%; height:492px; background-color:#dfe8f6; margin-left:1px;}
#chatol_content_main{ float:left; width:99.7%; height:510px; background-color:#dfe8f6; margin-left:1px;}

#chatol_clear_txt{ float:left; width:100%; height:1px}
#chatol_tool_bar{ float:left; width:99.7%; height:20px; background-color:#dfe8f6; margin-left:1px}
#chatol_search_area{ float:left; width:120px; height:20px; padding-left:2px}
#chatol_page_area{ float:left; width:40px; height:20px; padding-left:2px}
/*------------------------------------------------------------------------------------------------------*/

.img_all{opacity:0.7}
.img_all:hover{opacity:1}
</style>
<script>
$(function() {
	$( "#div_chatol" ).draggable();
});
function min_size_chatol(){
	if(document.getElementById('div_chatol').style.height=='550px'){
		document.getElementById('div_chatol').style.height='20px';
		document.getElementById('chatol_main_cont').style.height='20px';
		document.getElementById('chatol_content_outsign').style.display='none';
		document.getElementById('chatol_content_insign').style.display='none';
		document.getElementById('chatol_tool_bar').style.display='none';
		document.getElementById('chatol_menu').style.display='none';
	}else{
		document.getElementById('div_chatol').style.height='550px';
		document.getElementById('chatol_main_cont').style.height='550px';
		document.getElementById('chatol_content_outsign').style.display='';
		document.getElementById('chatol_content_insign').style.display='';
		document.getElementById('chatol_tool_bar').style.display='';
		document.getElementById('chatol_menu').style.display='';
	}
}
function reset_pos_chatol(){
	document.getElementById('div_chatol').style.margin='40px 200px';
}
function max_size_chatol(){
	if(document.getElementById('div_chatol').style.width=='50%'){
		document.getElementById('div_chatol').style.margin='0';
		document.getElementById('div_chatol').style.width='98%';
		document.getElementById('div_chatol').style.height='600px';
		document.getElementById('chatol_main_cont').style.height='600px';
		document.getElementById('chatol_content_outsign').style.height='545px';
		document.getElementById('chatol_content_insign').style.height='523px';
	}else{
		document.getElementById('div_chatol').style.margin='10px 200px';
		document.getElementById('div_chatol').style.width='50%';
		document.getElementById('div_chatol').style.height='550px';
		document.getElementById('chatol_main_cont').style.height='550px';
		document.getElementById('chatol_content_outsign').style.height='495px';
		document.getElementById('chatol_content_insign').style.height='473px';
	}
}

</script>
{/literal}
<!--*******************************************VUNG DIV CHUC NANG*****************************************-->
<div id="div_chatol" class="ui-widget-content" style="display:none" onclick="javascript: change_Zindex('div_chatol')">
    <div id="chatol_main_cont">
        <!-- Tab bar -->
        <div id="chatol_tab_bar_tit">Chat trực tuyến</div>
        <div id="chatol_tab_bar_icon">
            <a href="javascript: void(0);" onClick="min_size_chatol();" style="text-decoration:none">
            <img src="{$css_path}icon_thu_gon.png" class="img_all" title="Ẩn/hiện"></a>
            <a href="javascript: void(0);" onClick="max_size_chatol();" style="text-decoration:none">
            <img src="{$css_path}icon_mo_rong.png" class="img_all" title="Mở rộng/thu nhỏ"></a>
            <a href="javascript: void(0);" onClick="javascript: do_all_statment('{$http_root}','{$access_user_name}','{$access_user_pass_encode}')" style="text-decoration:none">
            <img src="{$css_path}icon_dong.png" class="img_all" title="Đóng lại"></a>
        </div>
        <!-- Menu -->
        <div style="float:left; height:10px; width:100%"></div>
        <!-- Content -->
        <div id="chatol_content_outsign">
        	<!-- Main -->
            <div id="chatol_content_main" style="display:none">
            	<iframe id="chalol" src="{$http_root}modules/chat/index.php?u_name={$access_user_name}&u_pass={$access_user_pass_encode}" style="border:none; width: 655px; height:510px"></iframe>
            </div>
            <!-------####---------->
        </div>
    </div>
</div>
{literal}
<script language="javascript">	
	
	$("#chatol_content_outsign").mouseover( function () { 
		$( "#div_chatol" ).draggable({ disabled: true });
	});
	$("#chatol_content_outsign").mouseout( function () { 
		$( "#div_chatol" ).draggable({ disabled: false });
	});
	
	function do_all_statment(http_root,access_user_name,access_user_pass_encode){
		document.getElementById('chalol').src = http_root+'modules/chat/index.php?u_name='+access_user_name+'&u_pass='+access_user_pass_encode; 
		close_all_window_chatol(); 
		change_style_chatol(1);
	}
	
	function close_all_window_chatol(){
		document.getElementById('div_chatol').style.display='none';
		for(i=0;i<div_tnvb_arr.length;i++){
			document.getElementById(div_tnvb_arr[i]).style.display='none';
		}
	}
	
</script>
{/literal}
<!--****************************************HET VUNG DIV CHUC NANG****************************************-->
