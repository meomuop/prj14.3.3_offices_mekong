{literal}
<style>
#div_user{ width: 870px; height: 500px; padding: 0px 1px 1px 1px; border:1px solid #8ea4c1; background-color:#ffffff;
	position:absolute; margin:50px 250px; z-index:100; font-size:12px
	/*display: none; position: absolute; background-color: white2; overflow: auto;	*/
}
#user_main_cont{ float:left; width:100%; height:500px; background-color:#ccd8e7}
#user_tab_bar_tit{ float:left; font-weight:bold; text-transform:uppercase; line-height:20px; padding-left:8px; width:80%;cursor:move; color:#15428b;}
#user_tab_bar_icon{ float:right; width:10%; text-align:right; padding-top:2px; padding-right:6px}
#user_content_outsign{ float:left; width:97.6%; height:445px; background-color:#ffffff; margin-left:8px; border:1px solid #99bbe8}
#user_content_insign{ float:left; width:99.7%; height:423px; background-color:#dfe8f6; margin-left:1px;}
#user_content_main{ float:left; width:99.8%; height:445px; background-color:#dfe8f6; margin-left:1px;}
#user_clear_txt{ float:left; width:100%; height:1px}
#user_tool_bar{ float:left; width:99.7%; height:20px; background-color:#dfe8f6; margin-left:1px}
#user_search_area{ float:left; width:120px; height:20px; padding-left:2px}
#user_page_area{ float:left; width:40px; height:20px; padding-left:2px}
#user_menu{ float:left; width:99.7%; height:25px; padding-left:8px; position:absolute; margin-top:21px}

.c_menu_user{float:left; border-right:1px solid #99bbe8; line-height:21px; height:21px; padding-left:2px; border-top:1px solid #99bbe8; margin-top:4px}

.img_all{opacity:0.7}
.img_all:hover{opacity:1}
</style>
<script>
$(function() {
	$( "#div_user" ).draggable();
});
function min_size_user(){
	if(document.getElementById('div_user').style.height=='500px'){
		document.getElementById('div_user').style.height='20px';
		document.getElementById('user_main_cont').style.height='20px';
		document.getElementById('user_content_outsign').style.display='none';
		document.getElementById('user_content_insign').style.display='none';
		document.getElementById('user_tool_bar').style.display='none';
		document.getElementById('user_menu').style.display='none';
	}else{
		document.getElementById('div_user').style.height='500px';
		document.getElementById('user_main_cont').style.height='500px';
		document.getElementById('user_content_outsign').style.display='';
		document.getElementById('user_content_insign').style.display='';
		document.getElementById('user_tool_bar').style.display='';
		document.getElementById('user_menu').style.display='';
	}
}
function reset_pos_user(){
	document.getElementById('div_user').style.margin='50px 250px';
}
function max_size_user(){
	if(document.getElementById('div_user').style.width=='60%'){
		document.getElementById('div_user').style.margin='0';
		document.getElementById('div_user').style.width='98%';
		document.getElementById('div_user').style.height='600px';
		document.getElementById('user_main_cont').style.height='600px';
		document.getElementById('user_content_outsign').style.height='545px';
		document.getElementById('user_content_insign').style.height='523px';
	}else{
		document.getElementById('div_user').style.margin='50px 250px';
		document.getElementById('div_user').style.width='60%';
		document.getElementById('div_user').style.height='500px';
		document.getElementById('user_main_cont').style.height='500px';
		document.getElementById('user_content_outsign').style.height='445px';
		document.getElementById('user_content_insign').style.height='423px';
	}
}
function change_style_user(obj){
	for(i=1;i<=5;i++){
		//alert('obj: '+obj+' c_menu_user_'+i);
		if(i==obj){
			document.getElementById('c_menu_user_'+i).style.borderLeft = '1px solid #99bbe8';
			document.getElementById('c_menu_user_'+i).style.borderRight = '1px solid #99bbe8';
			document.getElementById('c_menu_user_'+i).style.borderBottom = '1px solid #dfe8f6';
			document.getElementById('c_menu_user_'+i).style.backgroundColor = '#dfe8f6';
			document.getElementById('c_menu_user_'+i).style.height = '25px';
			document.getElementById('c_menu_user_'+i).style.marginTop = '0px';
		}
		else{
			if(i!=1){
				document.getElementById('c_menu_user_'+i).style.borderLeft = 'none';
			}
			if(i==obj-1){
				document.getElementById('c_menu_user_'+i).style.borderRight = 'none';
			}else{
				document.getElementById('c_menu_user_'+i).style.borderRight = '1px solid #99bbe8';
			}
			document.getElementById('c_menu_user_'+i).style.borderBottom = 'none';
			document.getElementById('c_menu_user_'+i).style.backgroundColor = '#ccd8e7';
			document.getElementById('c_menu_user_'+i).style.height = '20px';
			document.getElementById('c_menu_user_'+i).style.marginTop = '4px';
		}
	}
}
</script>
{/literal}
<!--*******************************************VUNG DIV CHUC NANG*****************************************-->
<div id="div_user" class="ui-widget-content" style="display:none" onclick="javascript: change_Zindex('div_user')">
    <div id="user_main_cont">
        <!-- Tab bar -->
        <div id="user_tab_bar_tit">Quản lý nhân sự</div>
        <div id="user_tab_bar_icon">
            <a href="javascript: void(0);" onClick="min_size_user();" style="text-decoration:none">
            <img src="{$css_path}icon_thu_gon.png" class="img_all" title="Ẩn/hiện"></a>
            <a href="javascript: void(0);" onClick="max_size_user();" style="text-decoration:none">
            <img src="{$css_path}icon_mo_rong.png" class="img_all" title="Mở rộng/thu nhỏ"></a>
            <a href="javascript: void(0);" onClick="javascript: document.getElementById('div_user').style.display='none'; change_style_user(1)" style="text-decoration:none">
            <img src="{$css_path}icon_dong.png" class="img_all" title="Đóng lại"></a>
        </div>
        <!-- Menu -->
        <div id="user_menu">
        	<div style="width:10px; float:left">&nbsp;</div>
            <a href="javascript: void(0)" onclick="change_style_user(1)" id="a_menu_user_1">
            <div class="c_menu_user" id="c_menu_user_1" style="width:105px; border-left:1px solid #99bbe8; border-bottom:1px solid #dfe8f6; background-color:#dfe8f6; height:25px; margin-top:0px">Hồ sơ nhân sự</div></a>
            <a href="javascript: void(0)" onclick="change_style_user(2)" id="a_menu_user_2">
            <div class="c_menu_user" id="c_menu_user_2" style="width:75px;">Chức vụ</div></a>
            <a href="javascript: void(0)" onclick="change_style_user(3)" id="a_menu_user_3">
            <div class="c_menu_user" id="c_menu_user_3" style="width:75px;">Trình độ</div></a>
            <a href="javascript: void(0)" onclick="change_style_user(4)" id="a_menu_user_4">
            <div class="c_menu_user" id="c_menu_user_4" style="width:145px;">Phòng / ban / chi nhánh</div></a>
            <a href="javascript: void(0)" onclick="change_style_user(5)" id="a_menu_user_5">
            <div class="c_menu_user" id="c_menu_user_5" style="width:115px;">Thang bảng lương</div></a>
        </div>
        <div style="float:left; height:26px; width:100%"></div>
        <!-- Content -->
        <div id="user_content_outsign">
        	<!-- Main -->
            <div id="user_content_main"></div>
            <!-------####---------->
        </div>
    </div>
</div>
{literal}
<script language="javascript">	
	$("#user_content_outsign").mouseover( function () { 
		$( "#div_user" ).draggable({ disabled: true });
	});
	
	$("#user_content_outsign").mouseout( function () { 
		$( "#div_user" ).draggable({ disabled: false });
	});
	
	$("#a_menu_user_1").click( function () { 
		$("#user_content_main").load("index.php?listUser&mod=users");
	});
	$("#a_menu_user_2").click( function () { 
		$("#user_content_main").load("index.php?listObject&mod=objects");
	});
	$("#a_menu_user_3").click( function () { 
		$("#user_content_main").load("index.php?listTrinhdo&mod=trinhdos");
	});
	$("#a_menu_user_4").click( function () { 
		$("#user_content_main").load("index.php?listDepartment&mod=departments");
	});
	$("#a_menu_user_5").click( function () { 
		$("#user_content_main").load("index.php?listThangluong&mod=thangluongs");
	});
</script>
{/literal}
<!--****************************************HET VUNG DIV CHUC NANG****************************************-->
