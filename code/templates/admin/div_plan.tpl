{literal}
<style>
#div_plan{ width: 665px; height: 568px; padding: 0px 1px 1px 1px; border:1px solid #8ea4c1; background-color:#ffffff;
	position:absolute; margin:30px 200px; z-index:100; font-size:12px
	/*display: none; position: absolute; background-color: white2; overflow: auto;	*/
}
#plan_main_cont{ float:left; width:100%; height:568px; background-color:#ccd8e7}
#plan_tab_bar_tit{ float:left; font-weight:bold; text-transform:uppercase; line-height:20px; padding-left:8px; width:80%;cursor:move; color:#15428b;}
#plan_tab_bar_icon{ float:right; width:10%; text-align:right; padding-top:2px; padding-right:6px}
#plan_content_outsign{ float:left; width:97.2%; height:512px; background-color:#ffffff; margin-left:8px; border:1px solid #99bbe8}
#plan_content_insign{ float:left; width:99.7%; height:508px; background-color:#dfe8f6; margin-left:1px;}
#plan_content_main{ float:left; width:99.8%; height:511px; background-color:#dfe8f6; margin-left:1px;}

#plan_clear_txt{ float:left; width:100%; height:1px}
#plan_tool_bar{ float:left; width:99.7%; height:20px; background-color:#dfe8f6; margin-left:1px}
#plan_search_area{ float:left; width:120px; height:20px; padding-left:2px}
#plan_page_area{ float:left; width:40px; height:20px; padding-left:2px}
#plan_menu{ float:left; width:99.7%; height:25px; padding-left:8px; position:absolute; margin-top:21px}

/*----------------------add_edit_plan div---------------------*/
#add_edit_plan_main_cont{ float:left; width:100%; height:440px; background-color:#ccd8e7}
#add_edit_plan_tab_bar_tit{ float:left; font-weight:bold; text-transform:uppercase; line-height:20px; padding-left:8px; width:80%;cursor:move; color:#15428b;}
#add_edit_plan_tab_bar_icon{ float:right; width:10%; text-align:right; padding-top:2px; padding-right:6px}
#add_edit_plan_content_outsign{ float:left; width:95.7%; height:414px; background-color:#ffffff; margin-left:8px; border:1px solid #99bbe8}
#add_edit_plan_content_insign{ float:left; width:99.6%; height:327px; background-color:#dfe8f6; margin-left:1px;}
#list_add_edit_plan_cont{ float:left; width:99.7%; height:329px; background-color:#dfe8f6; margin-left:1px;}
#add_edit_plan_clear_txt{ float:left; width:100%; height:1px}
#add_edit_plan_tool_bar{ float:left; width:99.8%; height:20px; background-color:#dfe8f6; margin-left:1px}
#add_edit_plan_search_area{ float:left; width:120px; height:20px; padding-left:2px}
#add_edit_plan_page_area{ float:left; width:40px; height:20px; padding-left:2px}
#add_edit_plan_menu{ float:left; width:99.8%; height:25px; padding-left:8px; position:absolute; margin-top:21px}
/*----------------------end add_edit_plan div---------------------*/

/*----------------------show_plan div---------------------*/
#show_plan_main_cont{ float:left; width:100%; height:360px; background-color:#ccd8e7}
#show_plan_tab_bar_tit{ float:left; font-weight:bold; text-transform:uppercase; line-height:20px; padding-left:8px; width:80%;cursor:move; color:#15428b;}
#show_plan_tab_bar_icon{ float:right; width:10%; text-align:right; padding-top:2px; padding-right:6px}
#show_plan_content_outsign{ float:left; width:95.7%; height:334px; background-color:#ffffff; margin-left:8px; border:1px solid #99bbe8}
#show_plan_content_insign{ float:left; width:99.6%; height:257px; background-color:#dfe8f6; margin-left:1px;}
#list_show_plan_cont{ float:left; width:99.7%; height:259px; background-color:#dfe8f6; margin-left:1px;}
#show_plan_clear_txt{ float:left; width:100%; height:1px}
#show_plan_tool_bar{ float:left; width:99.8%; height:20px; background-color:#dfe8f6; margin-left:1px}
#show_plan_search_area{ float:left; width:120px; height:20px; padding-left:2px}
#show_plan_page_area{ float:left; width:40px; height:20px; padding-left:2px}
#show_plan_menu{ float:left; width:99.8%; height:25px; padding-left:8px; position:absolute; margin-top:21px}
/*----------------------end show_plan div---------------------*/

/*----------------------report_plan div---------------------*/
#report_plan_main_cont{ float:left; width:100%; height:440px; background-color:#ccd8e7}
#report_plan_tab_bar_tit{ float:left; font-weight:bold; text-transform:uppercase; line-height:20px; padding-left:8px; width:80%;cursor:move; color:#15428b;}
#report_plan_tab_bar_icon{ float:right; width:10%; text-align:right; padding-top:2px; padding-right:6px}
#report_plan_content_outsign{ float:left; width:98%; height:414px; background-color:#ffffff; margin-left:8px; border:1px solid #99bbe8}
#report_plan_content_insign{ float:left; width:99.6%; height:337px; background-color:#dfe8f6; margin-left:1px;}
#report_plan_cont{ float:left; width:99.7%; height:313px; background-color:#dfe8f6; margin-left:1px;}
#report_plan_clear_txt{ float:left; width:100%; height:1px}
#report_plan_tool_bar{ float:left; width:99.8%; height:20px; background-color:#dfe8f6; margin-left:1px}
#report_plan_search_area{ float:left; width:120px; height:20px; padding-left:2px}
#report_plan_page_area{ float:left; width:40px; height:20px; padding-left:2px}
#report_plan_menu{ float:left; width:99.8%; height:25px; padding-left:8px; position:absolute; margin-top:21px}
/*----------------------end report_plan div---------------------*/

.c_menu_plan{float:left; border-right:1px solid #99bbe8; line-height:21px; height:21px; padding-left:2px; border-top:1px solid #99bbe8; margin-top:4px}

.img_all{opacity:0.7}
.img_all:hover{opacity:1}
</style>
<script>
$(function() {
	$( "#div_plan" ).draggable();
	$( "#add_edit_plan" ).draggable();
	$( "#show_plan" ).draggable();
	$( "#report_plan" ).draggable();
});
function min_size_plan(){
	if(document.getElementById('div_plan').style.height=='568px'){
		document.getElementById('div_plan').style.height='20px';
		document.getElementById('plan_main_cont').style.height='20px';
		document.getElementById('plan_content_outsign').style.display='none';
		document.getElementById('plan_content_insign').style.display='none';
		document.getElementById('plan_tool_bar').style.display='none';
		document.getElementById('plan_menu').style.display='none';
	}else{
		document.getElementById('div_plan').style.height='568px';
		document.getElementById('plan_main_cont').style.height='568px';
		document.getElementById('plan_content_outsign').style.display='';
		document.getElementById('plan_content_insign').style.display='';
		document.getElementById('plan_tool_bar').style.display='';
		document.getElementById('plan_menu').style.display='';
	}
}
function reset_pos_plan(){
	document.getElementById('div_plan').style.margin='80px 200px';
}
function max_size_plan(){
	if(document.getElementById('div_plan').style.width=='720px'){
		document.getElementById('div_plan').style.margin='0';
		document.getElementById('div_plan').style.width='98%';
		document.getElementById('div_plan').style.height='600px';
		document.getElementById('plan_main_cont').style.height='600px';
		document.getElementById('plan_content_outsign').style.height='512px';
		document.getElementById('plan_content_insign').style.height='508px';
	}else{
		document.getElementById('div_plan').style.margin='10px 200px';
		document.getElementById('div_plan').style.width='711px';
		document.getElementById('div_plan').style.height='568px';
		document.getElementById('plan_main_cont').style.height='568px';
		document.getElementById('plan_content_outsign').style.height='512px';
		document.getElementById('plan_content_insign').style.height='508px';
	}
}
function change_style_plan(obj){
	for(i=1;i<=3;i++){
		if(i==obj){
			$('#c_menu_plan_'+i).css({
				'borderLeft':'1px solid #99bbe8','borderRight':'1px solid #99bbe8',
				'borderBottom':'1px solid #dfe8f6','backgroundColor':'#dfe8f6',
				'height':'25px','marginTop':'0px'
			});
			if(i==2){
				 $('#c_menu_plan_2').css({'width':'565px'});
				 $('#div_more_lich').css({'display':'block'});
			}
			else{
				 $('#c_menu_plan_2').css({'width':'70px'});
				 $('#div_more_lich').css({'display':'none'});
			}
		}
		else{
			if(i!=1) $('#c_menu_plan_'+i).css({'borderLeft':'none'});
			if(i==obj-1) $('#c_menu_plan_'+i).css({'borderRight':'none'});
			else $('#c_menu_plan_'+i).css({'borderRight':'1px solid #99bbe8'});
			$('#c_menu_plan_'+i).css({
				'borderBottom':'none','backgroundColor':'#ccd8e7','height':'20px','marginTop':'4px'});
		}
	}
}
</script>
{/literal}
<!--*******************************************VUNG DIV CHUC NANG*****************************************-->
<div id="div_plan" class="ui-widget-content" style="display:none" onclick="javascript: change_Zindex('div_plan')">
    <div id="plan_main_cont">
        <!-- Tab bar -->
        <div id="plan_tab_bar_tit">Quản lý lịch biểu</div>
        <div id="plan_tab_bar_icon">
            <a href="javascript: void(0);" onClick="min_size_plan();" style="text-decoration:none">
            <img src="{$css_path}icon_thu_gon.png" class="img_all" title="Ẩn/hiện"></a>
            <a href="javascript: void(0);" onClick="max_size_plan();" style="text-decoration:none">
            <img src="{$css_path}icon_mo_rong.png" class="img_all" title="Mở rộng/thu nhỏ"></a>
            <a href="javascript: void(0);" onClick="javascript: close_all_window_plan(); change_style_plan(1)" style="text-decoration:none">
            <img src="{$css_path}icon_dong.png" class="img_all" title="Đóng lại"></a>
        </div>
        <!-- Menu -->
        <div id="plan_menu">
        	<div style="width:10px; float:left">&nbsp;</div>
            <a href="javascript: void(0)" onclick="change_style_plan(1)" id="a_menu_plan_1">
            <div class="c_menu_plan" id="c_menu_plan_1" style="width:55px; border-left:1px solid #99bbe8; border-bottom:1px solid #dfe8f6; background-color:#dfe8f6; height:25px; margin-top:0px">Cá nhân</div></a>
            <a href="javascript: void(0)" onclick="change_style_plan(2)" id="a_menu_plan_2">
                <div class="c_menu_plan" id="c_menu_plan_2" style="width:70px;">
                    Công ty
                </div>
            </a>
            <div id="div_more_lich" style="position:absolute; margin:7px 130px; width:540px; display:none">
                <div style="float:left; width:220px; line-height:20px; height:20px; text-align:left"></div>
                <div style="float:left; width:45px; line-height:20px; height:20px; text-align:left">Tuần từ:</div>
                <div style="float:left; width:48px; line-height:20px; height:20px; text-align:left">
                    <div style="float:left; width:38px; height:18px; border:1px solid #99bbe8; background-color:#FFF; margin-bottom:2px">
                            <input type="text" id="tu_ngay_1" name="tu_ngay_1" class="text_date" value="{$tu_ngay|date_format:'%d'}" onkeypress="set_focus('tu_ngay_1','tu_ngay_2')" maxlength="2" tabindex="1"/>/
                            <input type="text" id="tu_ngay_2" name="tu_ngay_2" class="text_month" value="{$tu_ngay|date_format:'%m'}" maxlength="2" tabindex="2"/>
                    </div>
                </div>
                <div style="float:left; width:27px; line-height:20px; height:20px; text-align:left">đến:</div>
                <div style="float:left; width:48px; line-height:20px; height:20px; text-align:left">
                    <div style="float:left; width:38px; height:18px; border:1px solid #99bbe8; background-color:#FFF; margin-bottom:2px">
                            <input type="text" id="den_ngay_1" name="den_ngay_1" class="text_date" value="{$den_ngay|date_format:'%d'}" onkeypress="set_focus('den_ngay_1','den_ngay_2')" maxlength="2" tabindex="3"/>/
                            <input type="text" id="den_ngay_2" name="den_ngay_2" class="text_month" value="{$den_ngay|date_format:'%m'}" maxlength="2" tabindex="4"/>
                    </div>
                </div>
                <div style="float:left; width:27px; line-height:20px; height:20px; text-align:left">Năm:</div>
                    <div style="float:left; width:35px; line-height:20px; height:20px; text-align:left">
                        <div style="float:left; width:30px; height:18px; border:1px solid #99bbe8; background-color:#FFF; margin-bottom:2px">
                              <input type="text" id="lich_nam" name="lich_nam" class="text_year" value="{$lich_nam|date_format:'%Y'}" maxlength="4" tabindex="5"/>
                        </div>
                    </div>
                    <div style="width:60px; float:left; height:20px;">
                    <a href="javascript: void(0);" onClick="export_plan(1)" style="text-decoration:none; color:#F00">
                    <div style="float:left; margin-left:3px; width:26px">
                    <img src="../images/admin/word_icon.png" class="img_all" height="20" title="Kết xuất MS Word"></div>
                    </a>
                    <a href="javascript: void(0);" onClick="export_plan(3)" style="text-decoration:none; color:#F00">
                    <div style="float:left; margin-left:3px; width:25px">
                    <img src="../images/admin/print_pre_icon.png" class="img_all" height="20" title="Xem trước khi in"></div>
                    </a>
                </div>
            </div>
        </div>
        <div style="float:left; height:26px; width:100%"></div>
        <!-- Content -->
        <div id="plan_content_outsign">
        	<!-- Main -->
            <div id="plan_content_main" style="display:none"></div>
            <!-------####---------->
        </div>
    </div>
</div>

<div id="add_edit_plan" onclick="javascript: change_bgcl_plan('add_edit_plan')" style="width:426px; float:left; font-weight:normal; position:absolute; display:none; margin:150px 0 0 337px; background-color:#ffffff; border:1px solid #99bbe8; z-index:1010; padding: 0px 1px 1px 1px">
	<div id="add_edit_plan_main_cont">
        <div id="add_edit_plan_tab_bar_tit">Thêm/sửa lịch</div>
        <div id="add_edit_plan_tab_bar_icon">
            <a href="javascript: void(0);" onClick="javascript: document.getElementById('add_edit_plan').style.display='none'" style="text-decoration:none">
            	<img src="{$css_path}icon_dong.png" class="img_all" title="Đóng lại"></a>
        </div>
        <div id="add_edit_plan_content_outsign">
        	<div id="list_add_edit_plan_cont">
            </div>
        </div>
    </div>
</div>

<div id="show_plan" onclick="javascript: change_bgcl_plan('show_plan')" style="width:426px; float:left; font-weight:normal; position:absolute; display:none; margin:180px 0 0 437px; background-color:#ffffff; border:1px solid #99bbe8; z-index:1010; padding: 0px 1px 1px 1px">
	<div id="show_plan_main_cont">
        <div id="show_plan_tab_bar_tit">Chi tiết lịch</div>
        <div id="show_plan_tab_bar_icon">
            <a href="javascript: void(0);" onClick="javascript: document.getElementById('show_plan').style.display='none'" style="text-decoration:none">
            	<img src="{$css_path}icon_dong.png" class="img_all" title="Đóng lại"></a>
        </div>
        <div id="show_plan_content_outsign">
        	<div id="list_show_plan_cont">
            </div>
        </div>
    </div>
</div>

<div id="report_plan" onclick="javascript: change_bgcl_plan('report_plan')" style="width:806px; float:left; font-weight:normal; position:absolute; display:none; margin:80px 0 0 227px; background-color:#ffffff; border:1px solid #99bbe8; z-index:1010; padding: 0px 1px 1px 1px">
	<div id="report_plan_main_cont">
        <div id="report_plan_tab_bar_tit">Kết xuất lịch</div>
        <div id="report_plan_tab_bar_icon">
        	<a href="javascript: void(0);" onClick="print_plan_page();" style="text-decoration:none">
            <img src="../images/admin/printer_icon.png" class="img_all" height="16" title="In"></a>
            <a href="javascript: void(0);" onClick="javascript: document.getElementById('report_plan').style.display='none'" style="text-decoration:none">
            	<img src="{$css_path}icon_dong.png" class="img_all" title="Đóng lại"></a>
        </div>
        <div id="report_plan_content_outsign">
        	<div id="report_plan_cont">
            </div>
        </div>
    </div>
</div>

{literal}
<script language="javascript">	
	var div_plan_arr = ['add_edit_plan','show_plan','report_plan'];
	
	function change_bgcl_plan(obj){
		for(i=0;i<=div_plan_arr.length;i++){
			if(div_plan_arr[i] == obj){
				document.getElementById('div_plan').style.zIndex='2000';
				document.getElementById(obj).style.zIndex = '2001'; 
				document.getElementById(obj).style.borderColor='#F00';
			}else{
				document.getElementById(div_plan_arr[i]).style.zIndex='2000';
				document.getElementById(div_plan_arr[i]).style.borderColor='#99bbe8';
			}
		}
	}
	
	function print_plan_page(){
		var w;
		w=window.open();
		w.document.write($('#div_plan_cont_print').html());
		w.print();
		w.close();
	}
	
	$("#plan_content_outsign").mouseover( function () { 
		$( "#div_plan" ).draggable({ disabled: true });
	});
	$("#plan_content_outsign").mouseout( function () { 
		$( "#div_plan" ).draggable({ disabled: false });
	});
	
	$("#plan_menu").mouseover( function () { 
		$( "#div_plan" ).draggable({ disabled: true });
	});
	$("#plan_menu").mouseout( function () { 
		$( "#div_plan" ).draggable({ disabled: false });
	});
		
	$("#add_edit_plan_tab_bar_tit").mouseover( function () { 
		$( "#add_edit_plan" ).draggable({ disabled: false });
	});
	$("#add_edit_plan_tab_bar_tit").mouseout( function () { 
		$( "#add_edit_plan" ).draggable({ disabled: true });
	});
	
	$("#show_plan_tab_bar_tit").mouseover( function () { 
		$( "#show_plan" ).draggable({ disabled: false });
	});
	$("#show_plan_tab_bar_tit").mouseout( function () { 
		$( "#show_plan" ).draggable({ disabled: true });
	});
	
	$("#report_plan_tab_bar_tit").mouseover( function () { 
		$( "#report_plan" ).draggable({ disabled: false });
	});
	$("#report_plan_tab_bar_tit").mouseout( function () { 
		$( "#report_plan" ).draggable({ disabled: true });
	});

    $("#report_plan_content_outsign").mouseover( function () {
        $( "#report_plan" ).draggable({ disabled: true });
    });
    $("#report_plan_content_outsign").mouseout( function () {
        $( "#report_plan" ).draggable({ disabled: false });
    });
						
	$("#a_menu_plan_1").click( function () { 
		for(i=0;i<div_plan_arr.length;i++){
			document.getElementById(div_plan_arr[i]).style.display='none';
		}
				
		document.getElementById('plan_content_main').style.display='block';
		$("#plan_content_main").load("index.php?mainPlan&mod=plans");
		
	});
	
	$("#a_menu_plan_2").click( function () { 
		for(i=0;i<div_plan_arr.length;i++){
			document.getElementById(div_plan_arr[i]).style.display='none';
		}
				
		document.getElementById('plan_content_main').style.display='block';
		$("#plan_content_main").load("index.php?mainPlan&mod=plans&bld=1");
	});
	
	function show_calender_edit(obj,bld,user_ld){
		var http_root = document.getElementById('http_root').value;
		$('#show_plan').css({'display':'none','z-index':'2000'});
		window.parent.document.getElementById('add_edit_plan').style.display='block';
		window.parent.$('#list_add_edit_plan_cont').load(http_root+'calendar/json_edit.php?bld='+bld+'&user_ld='+user_ld+'&plan_id='+obj).fadeIn("fast");
		//calendar.fullCalendar('unselect');
	}
	
	function changepage(obj){
		for(i=0;i<div_plan_arr.length;i++){
			document.getElementById(div_plan_arr[i]).style.display='none';
		}
				
		document.getElementById('plan_content_main').style.display='block';
		$("#plan_content_main").load("index.php?mainPlan&mod=plans&bld=1&user_ld="+obj);
	}
	
	// ----- ket xuat
	function export_plan(exptype){
		
		var tu_ngay_1 	= document.getElementById('tu_ngay_1').value;
		var tu_ngay_2 	= document.getElementById('tu_ngay_2').value;
		
		var den_ngay_1 	= document.getElementById('den_ngay_1').value;
		var den_ngay_2 	= document.getElementById('den_ngay_2').value;
		
		var lich_nam 	= document.getElementById('lich_nam').value;
		
		var tu_ngay = lich_nam+'-'+tu_ngay_2+'-'+tu_ngay_1;
		var den_ngay = lich_nam+'-'+den_ngay_2+'-'+den_ngay_1;
		
		if (tu_ngay == "" && den_ngay == ""){
			return false;
		}
		
		if(exptype==3){
			$('#report_plan').css({'display':'block','z-index':'2010'});
			document.getElementById('report_plan').style.display='block';
			$.post('?expPlanReport&mod=plans&exptype='+exptype,
				{
					tu_ngay:tu_ngay,
					den_ngay:den_ngay
				},
				function(data){
					$('#report_plan_cont').html(data);
					$("#report_plan_cont").show();
				}
			);
		}else{
			window.location="?expPlanReport&mod=plans&exptype="+exptype+"&tu_ngay="+tu_ngay+"&den_ngay="+den_ngay;
		}
	}
	
	function close_all_window_plan(){
		document.getElementById('div_plan').style.display='none';
		for(i=0;i<div_plan_arr.length;i++){
			document.getElementById(div_plan_arr[i]).style.display='none';
		}
	}
</script>
{/literal}
<!--****************************************HET VUNG DIV CHUC NANG****************************************-->