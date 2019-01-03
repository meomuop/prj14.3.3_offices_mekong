{literal}
<style>
#div_tinhluong{ width: 1190px; height: 450px; padding: 0px 1px 1px 1px; border:1px solid #8ea4c1; background-color:#ffffff;
	position:absolute; margin:40px 85px; z-index:100; font-size:12px
	/*display: none; position: absolute; background-color: white2; overflow: auto;	*/
}
#tinhluong_main_cont{ float:left; width:100%; height:450px; background-color:#ccd8e7}
#tinhluong_tab_bar_tit{ float:left; font-weight:bold; text-transform:uppercase; line-height:20px; padding-left:8px; width:80%;cursor:move; color:#15428b;}
#tinhluong_tab_bar_icon{ float:right; width:10%; text-align:right; padding-top:2px; padding-right:6px}
#tinhluong_content_outsign{ float:left; width:98.6%; height:394px; background-color:#ffffff; margin-left:8px; border:1px solid #99bbe8}
#tinhluong_content_insign{ float:left; width:99.7%; height:375px; background-color:#dfe8f6; margin-left:1px;}
#thangluong_content_insign{ float:left; width:99.7%; height:371px; background-color:#dfe8f6; margin-left:1px;}
#cauhinhluong_content_insign{ float:left; width:28%; height:371px; background-color:#dfe8f6; margin-left:1px; margin-right: 15px}
#luongnhanvien_content_insign{ float:left; width:70%; height:371px; background-color:#dfe8f6; margin-left:1px;}
#tinhluong_content_main{ float:left; width:99.8%; height:393px; background-color:#dfe8f6; margin-left:1px;}

#tinhluong_clear_txt{ float:left; width:100%; height:1px}
#tinhluong_tool_bar{ float:left; width:99.7%; height:20px; background-color:#dfe8f6; margin-left:1px}
#tinhluong_search_area{ float:left; width:120px; height:20px; padding-left:2px}
#tinhluong_page_area{ float:left; width:40px; height:20px; padding-left:2px}
#tinhluong_menu{ float:left; width:99.7%; height:25px; padding-left:8px; position:absolute; margin-top:21px}

/*----------------------report_tinhluong div---------------------*/
#report_tinhluong_main_cont{ float:left; width:100%; height:450px; background-color:#ccd8e7}
#report_tinhluong_tab_bar_tit{ float:left; font-weight:bold; text-transform:uppercase; line-height:20px; padding-left:8px; width:80%;cursor:move; color:#15428b;}
#report_tinhluong_tab_bar_icon{ float:right; width:10%; text-align:right; padding-top:2px; padding-right:6px}
#report_tinhluong_content_outsign{ float:left; width:98%; height:420px; background-color:#ffffff; margin-left:8px; border:1px solid #99bbe8}
#report_tinhluong_content_insign{ float:left; width:100%; height:419px; background-color:#dfe8f6; margin-left:1px;}
#report_tinhluong_cont{ float:left; width:99.8%; height:419px; background-color:#dfe8f6; margin-left:1px;}
#report_tinhluong_clear_txt{ float:left; width:100%; height:1px}
#report_tinhluong_tool_bar{ float:left; width:100%; height:20px; background-color:#dfe8f6; margin-left:1px}
#report_tinhluong_search_area{ float:left; width:120px; height:20px; padding-left:2px}
#report_tinhluong_page_area{ float:left; width:40px; height:20px; padding-left:2px}
#report_tinhluong_menu{ float:left; width:99.7%; height:25px; padding-left:8px; position:absolute; margin-top:21px}
/*----------------------end report_tinhluong div---------------------*/

.c_menu_tinhluong{float:left; border-right:1px solid #99bbe8; line-height:21px; height:21px; padding-left:2px; border-top:1px solid #99bbe8; margin-top:4px}
.c_menu_cv_sub{float:left; border-right:1px solid #99bbe8; line-height:21px; height:21px; padding-left:2px; border-top:1px solid #99bbe8; margin-top:4px}


.img_all{opacity:0.7}
.img_all:hover{opacity:1}
</style>
<script>
$(function() {
	$( "#div_tinhluong" ).draggable();
	$( "#add_edit_tinhluong" ).draggable();
	$( "#report_tinhluong" ).draggable();
});
function min_size_tinhluong(){
	if(document.getElementById('div_tinhluong').style.height=='550px'){
		document.getElementById('div_tinhluong').style.height='20px';
		document.getElementById('tinhluong_main_cont').style.height='20px';
		document.getElementById('tinhluong_content_outsign').style.display='none';
		document.getElementById('tinhluong_content_insign').style.display='none';
		document.getElementById('tinhluong_tool_bar').style.display='none';
		document.getElementById('tinhluong_menu').style.display='none';
	}else{
		document.getElementById('div_tinhluong').style.height='550px';
		document.getElementById('tinhluong_main_cont').style.height='550px';
		document.getElementById('tinhluong_content_outsign').style.display='';
		document.getElementById('tinhluong_content_insign').style.display='';
		document.getElementById('tinhluong_tool_bar').style.display='';
		document.getElementById('tinhluong_menu').style.display='';
	}
}
function reset_pos_tinhluong(){
	document.getElementById('div_tinhluong').style.margin='40px 200px';
}
function max_size_tinhluong(){
	if(document.getElementById('div_tinhluong').style.width=='50%'){
		document.getElementById('div_tinhluong').style.margin='0';
		document.getElementById('div_tinhluong').style.width='98%';
		document.getElementById('div_tinhluong').style.height='600px';
		document.getElementById('tinhluong_main_cont').style.height='600px';
		document.getElementById('tinhluong_content_outsign').style.height='545px';
		document.getElementById('tinhluong_content_insign').style.height='523px';
	}else{
		document.getElementById('div_tinhluong').style.margin='10px 200px';
		document.getElementById('div_tinhluong').style.width='50%';
		document.getElementById('div_tinhluong').style.height='550px';
		document.getElementById('tinhluong_main_cont').style.height='550px';
		document.getElementById('tinhluong_content_outsign').style.height='495px';
		document.getElementById('tinhluong_content_insign').style.height='473px';
	}
}
function change_style_tinhluong(obj){
	for(i=1;i<=4;i++){
		if(i==obj){
			document.getElementById('c_menu_tinhluong_'+i).style.borderLeft = '1px solid #99bbe8';
			document.getElementById('c_menu_tinhluong_'+i).style.borderRight = '1px solid #99bbe8';
			document.getElementById('c_menu_tinhluong_'+i).style.borderBottom = '1px solid #dfe8f6';
			document.getElementById('c_menu_tinhluong_'+i).style.backgroundColor = '#dfe8f6';
			document.getElementById('c_menu_tinhluong_'+i).style.height = '25px';
			document.getElementById('c_menu_tinhluong_'+i).style.marginTop = '0px';
		}
		else{
			if(i!=1){
				document.getElementById('c_menu_tinhluong_'+i).style.borderLeft = 'none';
			}
			if(i==obj-1){
				document.getElementById('c_menu_tinhluong_'+i).style.borderRight = 'none';
			}else{
				document.getElementById('c_menu_tinhluong_'+i).style.borderRight = '1px solid #99bbe8';
			}
			document.getElementById('c_menu_tinhluong_'+i).style.borderBottom = 'none';
			document.getElementById('c_menu_tinhluong_'+i).style.backgroundColor = '#ccd8e7';
			document.getElementById('c_menu_tinhluong_'+i).style.height = '20px';
			document.getElementById('c_menu_tinhluong_'+i).style.marginTop = '4px';
		}
	}
}
</script>
{/literal}
<!--*******************************************VUNG DIV CHUC NANG*****************************************-->
<div id="div_tinhluong" class="ui-widget-content" style="display:none" onclick="javascript: change_Zindex('div_tinhluong')">
    <div id="tinhluong_main_cont">
        <!-- Tab bar -->
        <div id="tinhluong_tab_bar_tit">Chấm công - Lương</div>
        <div id="tinhluong_tab_bar_icon">
            <a href="javascript: void(0);" onClick="min_size_tinhluong();" style="text-decoration:none">
            <img src="{$css_path}icon_thu_gon.png" class="img_all" title="Ẩn/hiện"></a>
            <a href="javascript: void(0);" onClick="max_size_tinhluong();" style="text-decoration:none">
            <img src="{$css_path}icon_mo_rong.png" class="img_all" title="Mở rộng/thu nhỏ"></a>
            <a href="javascript: void(0);" onClick="javascript: close_all_window_tinhluong(); change_style_tinhluong(1)" style="text-decoration:none">
            <img src="{$css_path}icon_dong.png" class="img_all" title="Đóng lại"></a>
        </div>
        <!-- Menu -->
        <div id="tinhluong_menu">
        	<div style="width:10px; float:left">&nbsp;</div>
            <a href="javascript: void(0)" onclick="change_style_tinhluong(1)" id="a_menu_tinhluong_1">
            <div class="c_menu_tinhluong" id="c_menu_tinhluong_1" style="width:105px; border-left:1px solid #99bbe8; border-bottom:1px solid #dfe8f6; background-color:#dfe8f6; height:25px; margin-top:0px">Bảng chấm công</div></a>
			<a href="javascript: void(0)" onclick="change_style_tinhluong(2)" id="a_menu_tinhluong_2">
				<div class="c_menu_tinhluong" id="c_menu_tinhluong_2" style="width:155px;">Bảng lương doanh nghiệp</div></a>
			<a href="javascript: void(0)" onclick="change_style_tinhluong(3)" id="a_menu_tinhluong_3">
				<div class="c_menu_tinhluong" id="c_menu_tinhluong_3" style="width:90px;">Bảng Phụ cấp</div></a>
			<a href="javascript: void(0)" onclick="change_style_tinhluong(4)" id="a_menu_tinhluong_4">
				<div class="c_menu_tinhluong" id="c_menu_tinhluong_4" style="width:105px;">Cấu hình lương</div></a>
        </div>
        <div style="float:left; height:26px; width:100%"></div>
        <!-- Content -->
        <div id="tinhluong_content_outsign">
        	<!-- Main -->
            <div id="tinhluong_content_main" style="display:none"></div>
            <!-------####---------->
        </div>
    </div>
</div>

<div id="report_tinhluong" onclick="javascript: change_bgcl_transport('report_tinhluong')" style="width:943px; float:left; font-weight:normal; position:absolute; display:none; margin:120px 0 0 320px; background-color:#ffffff; border:1px solid #99bbe8; z-index:1010; padding: 0px 1px 1px 1px">
	<div id="report_tinhluong_main_cont">
        <div id="report_tinhluong_tab_bar_tit">In bảng lương tháng</div>
        <div id="report_tinhluong_tab_bar_icon">
        	<a href="javascript: void(0);" onClick="print_tinhluong_page();" style="text-decoration:none">
            <img src="../images/admin/printer_icon.png" class="img_all" height="16" title="In"></a>
            <a href="javascript: void(0);" onClick="javascript: document.getElementById('report_tinhluong').style.display='none'" style="text-decoration:none">
            <img src="{$css_path}icon_dong.png" class="img_all" title="Đóng lại"></a>
        </div>
        <div id="report_tinhluong_content_outsign">
        	<div id="report_tinhluong_cont" style="overflow-y:scroll">
            </div>
        </div>
    </div>
</div>
{literal}
<script language="javascript">	
	var div_tinhluong_arr = ['',''];
	
	function change_bgcl_tinhluong(obj){
		for(i=0;i<=div_tinhluong_arr.length;i++){
			if(div_tinhluong_arr[i] == obj){
				document.getElementById('div_tinhluong').style.zIndex='2000';
				document.getElementById(obj).style.zIndex = '2001'; 
				document.getElementById(obj).style.borderColor='#F00';
			}else{
				document.getElementById(div_tinhluong_arr[i]).style.zIndex='2000';
				document.getElementById(div_tinhluong_arr[i]).style.borderColor='#99bbe8';
			}
		}
	}
	
	$("#tinhluong_content_outsign").mouseover( function () { 
		$( "#div_tinhluong" ).draggable({ disabled: true });
	});
	$("#tinhluong_content_outsign").mouseout( function () { 
		$( "#div_tinhluong" ).draggable({ disabled: false });
	});
	
	$("#tinhluong_menu").mouseover( function () { 
		$( "#div_tinhluong" ).draggable({ disabled: true });
	});
	$("#tinhluong_menu").mouseout( function () { 
		$( "#div_tinhluong" ).draggable({ disabled: false });
	});
		
	$("#add_edit_tinhluong_menu").mouseover( function () { 
		$( "#div_tinhluong" ).draggable({ disabled: true });
	});
	$("#add_edit_tinhluong_menu").mouseout( function () { 
		$( "#div_tinhluong" ).draggable({ disabled: false });
	});
	
	$("#report_tinhluong_cont").mouseover( function () { 
		$( "#report_tinhluong" ).draggable({ disabled: true });
	});
	$("#report_tinhluong_cont").mouseout( function () { 
		$( "#report_tinhluong" ).draggable({ disabled: false });
	});
				
	$("#a_menu_tinhluong_1").click( function () { 
		$("#tinhluong_content_main").load("index.php?listChamcong&mod=tinhluong");
		
	});

	$("#a_menu_tinhluong_2").click( function () {
		$("#tinhluong_content_main").load("index.php?listTldn&mod=tinhluong");
	});

	// $("#a_menu_tinhluong_3").click( function () {
	// 	$("#tinhluong_content_main").load("index.php?listThangluong&mod=tinhluong");
	// });

	$("#a_menu_tinhluong_3").click( function () {
		$("#tinhluong_content_main").load("index.php?listPhucap&mod=tinhluong");
	});

	$("#a_menu_tinhluong_4").click( function () {
		$("#tinhluong_content_main").load("index.php?cauhinhLuong&mod=tinhluong");
	});
	
	function print_tinhluong_page(){
        var thangluong = document.getElementById('thangluong').value;
		var w;
		w=window.open('index.php?InBangluong&mod=tinhluong&thangluong='+thangluong);
		//w.document.write($('#div_cont_print').load().html());
		w.print();
		w.close();
	}
	
	// ----- ket xuat
	function export_tinhluong(tinhluong_id,exptype){
				
		if(exptype==3){
			$('#report_tinhluong').css({'display':'block','z-index':'2010'});
			document.getElementById('report_tinhluong').style.display='block';
			$.post('?expChamcongReport&mod=tinhluong&exptype='+exptype,
				{
					tinhluong_id:tinhluong_id,
				},
				function(data){
					$('#report_tinhluong_cont').html(data);
					$("#report_tinhluong_cont").show();
				}
			);
		}
	}
	
	function close_all_window_tinhluong(){
		document.getElementById('div_tinhluong').style.display='none';
		for(i=0;i<div_tinhluong_arr.length;i++){
			document.getElementById(div_tinhluong_arr[i]).style.display='none';
		}
	}
</script>
{/literal}
<!--****************************************HET VUNG DIV CHUC NANG****************************************-->