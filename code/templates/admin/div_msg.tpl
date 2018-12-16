{literal}
<style>
#div_msg{ width: 539px; height: 360px; padding: 0px 1px 1px 1px; border:1px solid #8ea4c1; background-color:#ffffff;
	position:absolute; margin:100px 240px; z-index:100; font-size:12px
	/*display: none; position: absolute; background-color: white2; overflow: auto;	*/
}
#msg_main_cont{ float:left; width:100%; height:360px; background-color:#ccd8e7}
#msg_tab_bar_tit{ float:left; font-weight:bold; text-transform:uppercase; line-height:20px; padding-left:8px; width:80%;cursor:move; color:#15428b;}
#msg_tab_bar_icon{ float:right; width:10%; text-align:right; padding-top:2px; padding-right:6px}
#msg_content_outsign{ float:left; width:97.0%; height:304px; background-color:#ffffff; margin-left:8px; border:1px solid #99bbe8}
#msg_content_insign{ float:left; width:99.4%; height:282px; background-color:#dfe8f6; margin-left:1px;}
#msg_content_main{ float:left; width:99.6%; height:303px; background-color:#dfe8f6; margin-left:1px;}

#msg_clear_txt{ float:left; width:100%; height:1px}
#msg_tool_bar{ float:left; width:100%; height:20px; background-color:#dfe8f6; margin-left:1px}
#msg_search_area{ float:left; width:120px; height:20px; padding-left:2px}
#msg_page_area{ float:left; width:40px; height:20px; padding-left:2px}
#msg_menu{ float:left; width:99.7%; height:25px; padding-left:8px; position:absolute; margin-top:21px}

/*----------------------div_nd_msg div---------------------*/
#div_nd_msg_main_cont{ float:left; width:100%; height:220px; background-color:#ccd8e7}
#div_nd_msg_tab_bar_tit{ float:left; font-weight:bold; text-transform:uppercase; line-height:20px; padding-left:8px; width:80%;cursor:move; color:#15428b;}
#div_nd_msg_tab_bar_icon{ float:right; width:10%; text-align:right; padding-top:2px; padding-right:6px}
#div_nd_msg_content_outsign{ float:left; width:96.4%; height:190px; background-color:#ffffff; margin-left:8px; border:1px solid #99bbe8}
#div_nd_msg_content_insign{ float:left; width:99.8%; height:177px; background-color:#dfe8f6; margin-left:1px;}
#list_div_nd_msg_cont{ float:left; width:99.7%; height:189px; background-color:#dfe8f6; margin-left:1px;}
#div_nd_msg_clear_txt{ float:left; width:100%; height:1px}
#div_nd_msg_tool_bar{ float:left; width:99.8%; height:20px; background-color:#dfe8f6; margin-left:1px}
#div_nd_msg_search_area{ float:left; width:120px; height:20px; padding-left:2px}
#div_nd_msg_page_area{ float:left; width:40px; height:20px; padding-left:2px}
#div_nd_msg_menu{ float:left; width:99.8%; height:25px; padding-left:8px; position:absolute; margin-top:21px}
/*----------------------end div_nd_msg div---------------------*/

.c_menu_msg{float:left; border-right:1px solid #99bbe8; line-height:21px; height:21px; padding-left:2px; border-top:1px solid #99bbe8; margin-top:4px}

.img_all{opacity:0.7}
.img_all:hover{opacity:1}
</style>
<script>
$(function() {
	$( "#div_msg" ).draggable();
	$( "#div_nd_msg" ).draggable();
	$( "#add_edit_dl" ).draggable();
	$( "#dl_file" ).draggable();
});
function min_size_msg(){
	if(document.getElementById('div_msg').style.height=='360px'){
		document.getElementById('div_msg').style.height='20px';
		document.getElementById('msg_main_cont').style.height='20px';
		document.getElementById('msg_content_outsign').style.display='none';
		document.getElementById('msg_content_insign').style.display='none';
		document.getElementById('msg_tool_bar').style.display='none';
		document.getElementById('msg_menu').style.display='none';
	}else{
		document.getElementById('div_msg').style.height='360px';
		document.getElementById('msg_main_cont').style.height='360px';
		document.getElementById('msg_content_outsign').style.display='';
		document.getElementById('msg_content_insign').style.display='';
		document.getElementById('msg_tool_bar').style.display='';
		document.getElementById('msg_menu').style.display='';
	}
}
function reset_pos_msg(){
	document.getElementById('div_msg').style.margin='40px 200px';
}
function max_size_msg(){
	if(document.getElementById('div_msg').style.width=='40%'){
		document.getElementById('div_msg').style.margin='0';
		document.getElementById('div_msg').style.width='98%';
		document.getElementById('div_msg').style.height='600px';
		document.getElementById('msg_main_cont').style.height='600px';
		document.getElementById('msg_content_outsign').style.height='545px';
		document.getElementById('msg_content_insign').style.height='523px';
	}else{
		document.getElementById('div_msg').style.margin='10px 200px';
		document.getElementById('div_msg').style.width='40%';
		document.getElementById('div_msg').style.height='360px';
		document.getElementById('msg_main_cont').style.height='360px';
		document.getElementById('msg_content_outsign').style.height='304px';
		document.getElementById('msg_content_insign').style.height='282px';
	}
}
function change_style_msg(obj){
	for(i=1;i<=3;i++){
		if(i==obj){
			document.getElementById('c_menu_msg_'+i).style.borderLeft = '1px solid #99bbe8';
			document.getElementById('c_menu_msg_'+i).style.borderRight = '1px solid #99bbe8';
			document.getElementById('c_menu_msg_'+i).style.borderBottom = '1px solid #dfe8f6';
			document.getElementById('c_menu_msg_'+i).style.backgroundColor = '#dfe8f6';
			document.getElementById('c_menu_msg_'+i).style.height = '25px';
			document.getElementById('c_menu_msg_'+i).style.marginTop = '0px';
		}
		else{
			if(i!=1){
				document.getElementById('c_menu_msg_'+i).style.borderLeft = 'none';
			}
			if(i==obj-1){
				document.getElementById('c_menu_msg_'+i).style.borderRight = 'none';
			}else{
				document.getElementById('c_menu_msg_'+i).style.borderRight = '1px solid #99bbe8';
			}
			document.getElementById('c_menu_msg_'+i).style.borderBottom = 'none';
			document.getElementById('c_menu_msg_'+i).style.backgroundColor = '#ccd8e7';
			document.getElementById('c_menu_msg_'+i).style.height = '20px';
			document.getElementById('c_menu_msg_'+i).style.marginTop = '4px';
		}
	}
}
</script>
{/literal}
<!--*******************************************VUNG DIV CHUC NANG*****************************************-->
<div id="div_msg" class="ui-widget-content" style="display:none" onclick="javascript: change_Zindex('div_msg')">
    <div id="msg_main_cont">
        <!-- Tab bar -->
        <div id="msg_tab_bar_tit">Tin nhắn</div>
        <div id="msg_tab_bar_icon">
            <a href="javascript: void(0);" onClick="min_size_msg();" style="text-decoration:none">
            <img src="{$css_path}icon_thu_gon.png" class="img_all" title="Ẩn/hiện"></a>
            <a href="javascript: void(0);" onClick="max_size_msg();" style="text-decoration:none">
            <img src="{$css_path}icon_mo_rong.png" class="img_all" title="Mở rộng/thu nhỏ"></a>
            <a href="javascript: void(0);" onClick="javascript: close_all_window_msg(); change_style_msg(1)" style="text-decoration:none">
            <img src="{$css_path}icon_dong.png" class="img_all" title="Đóng lại"></a>
        </div>
        <!-- Menu -->
        <div id="msg_menu">
        	<div style="width:10px; float:left">&nbsp;</div>
            <a href="javascript: void(0)" onclick="change_style_msg(1)" id="a_menu_msg_1">
            <div class="c_menu_msg" id="c_menu_msg_1" style="width:110px; border-left:1px solid #99bbe8; border-bottom:1px solid #dfe8f6; background-color:#dfe8f6; height:25px; margin-top:0px">Tin nhắn nội bộ</div></a>
            <!--<a href="javascript: void(0)" onclick="change_style_msg(2)" id="a_menu_msg_2">
            <div class="c_menu_msg" id="c_menu_msg_2" style="width:110px;">Tin nhắn bên ngoài</div></a>-->
        </div>
        <div style="float:left; height:26px; width:100%"></div>
        <!-- Content -->
        <div id="msg_content_outsign">
        	<!-- Main -->
            <div id="msg_content_main" style="display:none"></div>
            <!-------####---------->
        </div>
    </div>
</div>

<div id="div_nd_msg" onclick="javascript: change_bgcl_msg('div_nd_msg')" style="width:420px; float:left; font-weight:normal; position:absolute; display:none; margin:180px 0 0 337px; background-color:#ffffff; border:1px solid #99bbe8; z-index:1010; padding: 0px 1px 1px 1px">
	<div id="div_nd_msg_main_cont">
        <div id="div_nd_msg_tab_bar_tit">Tin nhắn SMS</div>
        <div id="div_nd_msg_tab_bar_icon">
            <a href="javascript: void(0);" onClick="javascript: document.getElementById('div_nd_msg').style.display='none'" style="text-decoration:none">
            	<img src="{$css_path}icon_dong.png" class="img_all" title="Đóng lại"></a>
        </div>
        <div id="div_nd_msg_content_outsign">
        	<div id="list_div_nd_msg_cont">
            </div>
        </div>
    </div>
</div>

{literal}
<script language="javascript">	
	var div_msg_arr = ['div_nd_msg'];
	
	function change_bgcl_msg(obj){
		for(i=0;i<=div_msg_arr.length;i++){
			if(div_msg_arr[i] == obj){
				document.getElementById('div_msg').style.zIndex='2000';
				document.getElementById(obj).style.zIndex = '2001'; 
				document.getElementById(obj).style.borderColor='#F00';
			}else{
				document.getElementById(div_msg_arr[i]).style.zIndex='2000';
				document.getElementById(div_msg_arr[i]).style.borderColor='#99bbe8';
			}
		}
	}
	
	$("#msg_content_outsign").mouseover( function () { 
		$( "#div_msg" ).draggable({ disabled: true });
	});
	$("#msg_content_outsign").mouseout( function () { 
		$( "#div_msg" ).draggable({ disabled: false });
	});
	
	$("#msg_menu").mouseover( function () { 
		$( "#div_msg" ).draggable({ disabled: true });
	});
	$("#msg_menu").mouseout( function () { 
		$( "#div_msg" ).draggable({ disabled: false });
	});
	
	$("#div_nd_msg_tab_bar_tit").mouseover( function () { 
		$( "#div_nd_msg" ).draggable({ disabled: false });
	});
	$("#div_nd_msg_tab_bar_tit").mouseout( function () { 
		$( "#div_nd_msg" ).draggable({ disabled: true });
	});
					
	$("#a_menu_msg_1").click( function () { 
		for(i=0;i<div_msg_arr.length;i++){
			document.getElementById(div_msg_arr[i]).style.display='none';
		}
				
		document.getElementById('msg_content_main').style.display='block';
		$("#msg_content_main").load("index.php?listMsgUser&mod=msgs");
		
	});
	
	function show_soan_msg(){
		$('#msg_content_main').load('index.php?addMsg&mod=msgs&soan_msg=1').fadeIn("fast");	
	}
	
	function show_inbox_msg(){
		$('#msg_content_main').load('index.php?listMsgUser&mod=msgs&inbox=1').fadeIn("fast");
	}
	
	function show_outbox_msg(){
		$('#msg_content_main').load('index.php?listMsg&mod=msgs&outbox=1').fadeIn("fast");
	}
	
	function show_drafmsg_msg(){
		$('#msg_content_main').load('index.php?listDrafMsg&mod=msgs&drafmsg=1').fadeIn("fast");
	}
	
	function show_impmsg_msg(){
		$('#msg_content_main').load('index.php?listMsgImp&mod=msgs&impmsg=1').fadeIn("fast");
	}
	
	function show_wastemsg_msg(){
		$('#msg_content_main').load('index.php?listMsgRac&mod=msgs&wastemsg=1').fadeIn("fast");
	}
	
	function show_noidung_msg(msg_id,page){
		$('#div_nd_msg').css({'display':'block','z-index':'2010'});
		$('#list_div_nd_msg_cont').load('index.php?viewMsg&mod=msgs&msg_id='+msg_id).fadeIn("fast");
		
		if(page=='listMsgUser')
		$('#msg_content_main').fadeOut("fast").load('index.php?'+page+'&mod=msgs&inbox=1').fadeIn("fast");
		else if(page=='listMsgImp')
		$('#msg_content_main').fadeOut("fast").load('index.php?'+page+'&mod=msgs&impmsg=1').fadeIn("fast");
		else if(page=='listMsgRac')
		$('#msg_content_main').fadeOut("fast").load('index.php?'+page+'&mod=msgs&wastemsg=1').fadeIn("fast");
	}
		
	function close_all_window_msg(){
		document.getElementById('div_msg').style.display='none';
		for(i=0;i<div_msg_arr.length;i++){
			document.getElementById(div_msg_arr[i]).style.display='none';
		}
	}
</script>
{/literal}
<!--****************************************HET VUNG DIV CHUC NANG****************************************-->