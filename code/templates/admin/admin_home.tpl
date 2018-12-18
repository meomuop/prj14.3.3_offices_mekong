<!DOCTYPE html>
<html lang="vi">
<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<!-------------------------style for dragable division---------------------->
<link rel="stylesheet" href="../css/admin/style.css" type="text/css" />
<link rel="stylesheet" href="../js/jquery/draggable_div/jquery.ui.all.css">
<script src="../js/jquery/draggable_div/jquery-1.8.0.js"></script>
<script src="../js/jquery/draggable_div/jquery.ui.core.js"></script>
<script src="../js/jquery/draggable_div/jquery.ui.widget.js"></script>
<script src="../js/jquery/draggable_div/jquery.ui.mouse.js"></script>
<script src="../js/jquery/draggable_div/jquery.ui.draggable.js"></script>
<link rel="stylesheet" href="../js/jquery/draggable_div/demos.css">

<!------------------------default style----------------------------->
<script type="text/javascript" src="../js/library.js"></script>
<script type="text/javascript" src="../js/admin/calendar.js"></script>
<script type="text/javascript" src="../js/admin/calendar-vi.js"></script>
<script type="text/javascript" src="../js/admin/calendar-setup.js"></script>
<script type="text/javascript" src="../js/admin/tabs.js"></script>
<link rel="stylesheet" type="text/css" media="all" href="../css/admin/calendar-blue.css"/>
<script type="text/javascript" src="../js/admin/jquery-1.3.2.min.js"></script>

<!--<LINK href="../css/transdmin.css" type=text/css rel=stylesheet> -->

<script language="JavaScript" src="../js/admin/JSCookMenu.js" type="text/javascript"></script>
<script src="../js/ajax_common.js" type="text/javascript"></script>
<script language="JavaScript" src="../js/admin/theme.js" type="text/javascript"></script>
<script language="JavaScript" src="../js/admin/joomla.js" type="text/javascript"></script>
<script src="../js/admin/ad_common.js" type="text/javascript"></script>
<script language="JavaScript" src="../js/admin/validate_form.js" type="text/javascript"></script>
<script type="text/javascript" src="../js/admin/jquery.js"></script>
<script type="text/javascript" src="../FCKeditor/fckeditor.js"></script>

<script type="text/javascript" src="../js/admin/jquery.js"></script>
<script type="text/javascript" src="../js/admin/jquery.autocomplete.js"></script>
<link rel="stylesheet" href="../css/admin/jquery.autocomplete.css" type="text/css" />


<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>MEKONG GROUP OFFICES MANAGE SYSTEM</title>
</head>
{literal}
<style>
.black_overlay{
	display: none; position: absolute; top: 0%; left: 0%; width: 100%; height: 100%; background-color: black;
	z-index:1001; -moz-opacity: 0.8; opacity:.80; filter: alpha(opacity=80);
}
</style>
<script>
// --- thay doi do rong
function create_width(){
	document.getElementById('div_config').style.width='42%';
	document.getElementById('div_config').style.height='500px';
}

// --- xac dinh div focus
function change_Zindex(obj){
	var div_arr_zindex 	= ['div_user','div_config','div_thuoctinh','div_tthd','div_vttb','div_plan','div_doc','div_transport','div_cv_cat','div_msg','div_kdl','div_chatol','div_danhba'];
	var div_doc_arr = ['list_file','list_reply','list_phanloai','div_view_doc','div_doc_report','div_huongdan'];
	var div_tnvb_arr = ['div_view_transport','list_truyenvb'];	
	var div_kdl_arr = ['add_edit_kdl','add_edit_dl','dl_file'];
	var div_msg_arr = ['div_nd_msg'];
	
	for(i=0;i<=div_arr_zindex.length;i++){
		if(div_arr_zindex[i] == obj){
			document.getElementById(obj).style.zIndex='2000';
			if(obj=='div_doc'){
				for(j=0;j<=div_doc_arr.length;j++){
						document.getElementById(div_doc_arr[j]).style.zIndex='2001';
				}
				for(j=0;j<=div_tnvb_arr.length;j++){
						document.getElementById(div_tnvb_arr[j]).style.zIndex='101';
				}
				for(j=0;j<=div_kdl_arr.length;j++){
						document.getElementById(div_kdl_arr[j]).style.zIndex='101';
				}
				for(j=0;j<=div_msg_arr.length;j++){
						document.getElementById(div_msg_arr[j]).style.zIndex='101';
				}
				for(j=0;j<=div_congviec_arr.length;j++){
						document.getElementById(div_congviec_arr[j]).style.zIndex='101';
				}
				for(j=0;j<=div_vttb_arr.length;j++){
						document.getElementById(div_vttb_arr[j]).style.zIndex='101';
				}
			}else if(obj=='div_transport'){
				for(j=0;j<=div_doc_arr.length;j++){
						document.getElementById(div_doc_arr[j]).style.zIndex='101';
				}
				for(j=0;j<=div_tnvb_arr.length;j++){
						document.getElementById(div_tnvb_arr[j]).style.zIndex='2001';
				}
				for(j=0;j<=div_kdl_arr.length;j++){
						document.getElementById(div_kdl_arr[j]).style.zIndex='101';
				}
				for(j=0;j<=div_msg_arr.length;j++){
						document.getElementById(div_msg_arr[j]).style.zIndex='101';
				}
			}else if(obj=='div_kdl'){
				for(j=0;j<=div_doc_arr.length;j++){
						document.getElementById(div_doc_arr[j]).style.zIndex='101';
				}
				for(j=0;j<=div_tnvb_arr.length;j++){
						document.getElementById(div_tnvb_arr[j]).style.zIndex='101';
				}
				for(j=0;j<=div_kdl_arr.length;j++){
						document.getElementById(div_kdl_arr[j]).style.zIndex='2001';
				}
				for(j=0;j<=div_msg_arr.length;j++){
						document.getElementById(div_msg_arr[j]).style.zIndex='101';
				}
			}else if(obj=='div_msg'){
				for(j=0;j<=div_doc_arr.length;j++){
						document.getElementById(div_doc_arr[j]).style.zIndex='101';
				}
				for(j=0;j<=div_tnvb_arr.length;j++){
						document.getElementById(div_tnvb_arr[j]).style.zIndex='101';
				}
				for(j=0;j<=div_kdl_arr.length;j++){
						document.getElementById(div_kdl_arr[j]).style.zIndex='101';
				}
				for(j=0;j<=div_msg_arr.length;j++){
						document.getElementById(div_msg_arr[j]).style.zIndex='2001';
				}
			}
		}else{
			document.getElementById(div_arr_zindex[i]).style.zIndex='100';
		}
	}
}

function close_div(obj){
	$('#'+obj).hide();
}

</script>

{/literal}
<body topmargin="0" bottommargin="0" leftmargin="0" rightmargin="0" onLoad="create_width(); maxWindow()">
    <!--*******************************************VUNG DIV CHUC NANG*****************************************-->
    {include file="div_config.tpl"}
    {include file="div_thuoctinh.tpl"}
    {include file="div_thuoctinh_hopdong.tpl"}
    {include file="div_tthd.tpl"}
    {include file="div_user.tpl"}
    {include file="div_vttb.tpl"}
    {include file="div_plan.tpl"}
    {include file="div_doc.tpl"}
    {include file="div_doc_report.tpl"}
    {include file="div_transport.tpl"}
    {include file="div_congviec.tpl"}
    {include file="div_msg.tpl"}
    {include file="div_chatol.tpl"}
    {include file="div_kdl.tpl"}
    {include file="div_danhba.tpl"}
    {include file="div_alert_all.tpl"}
    <!--****************************************HETVUNG DIV CHUC NANG****************************************-->
    <div id="wrap" style="margin-top:0px">
    	<div id="banner"><img src="{$css_img_bg}banner.jpg" width="1200" /></div>
        <div id="main" style="line-height: 1.2em;">
        	<div id="l-main">
            	<img src="{$css_img_bg}b1.jpg" height="520" />
            </div>
            <!--***************************************KHUNG CHUC NANG**************************************-->
            <div id="c-main">
            	<input type="hidden" value="{$http_root}" name="http_root" id="http_root">
            	<!----------------------------------QUAN TRI CAO CAP------------------------------------------->
                <div class="c1" style="margin: 8px 8px 0 8px">
                	<div class="c11">
                    	<a class="a1"> QUẢN TRỊ CAO CẤP </a>
                        <div class="c12">
                            <ul>
                                <li class="outside">
                                	<ul class="inside">
                                    	<li><input type="button" class="main_item_icon" style="background: url({$css_btn_bg}config_btn_blur.png) repeat scroll 0% 0% transparent;" onmouseout="this.style.background='url({$css_btn_bg}config_btn_blur.png)'" onmouseover="this.style.background='url({$css_btn_bg}config_btn_focus.png)'" value="" name="config" id="config" onClick="javascript: document.getElementById('div_config').style.display='block'" {if $user_level neq 1} disabled{/if}></li>
                                        <li class="main_btn_caption">Cấu hình</li>
                                    </ul>
                                    {literal}
                                    <script language="javascript">
									$("#config").click( function () { 
										$("#config_content_main").load("index.php?editConfig&mod=config");
									});
									</script>
                                    {/literal}
                                </li>
                                <li class="outside">
                                    <ul class="inside">
                                        <li><input type="button" class="main_item_icon" style="background: url({$css_btn_bg}doc_config_btn_blur.png) repeat scroll 0% 0% transparent;" onmouseout="this.style.background='url({$css_btn_bg}doc_config_btn_blur.png)'" onmouseover="this.style.background='url({$css_btn_bg}doc_config_btn_focus.png)'" value="" name="thuoctinh" id="thuoctinh" onClick="javascript: document.getElementById('div_thuoctinh').style.display='block'" {if $user_level neq 1} disabled{/if}></li>
                                        <li class="main_btn_caption">Thuộc tính văn bản</li>
                                    </ul>
                                    {literal}
                                        <script language="javascript">
                                            $("#thuoctinh").click( function () {
                                                $("#thuoctinh_content_main").load("index.php?listDocCat&mod=docs");
                                            });
                                        </script>
                                    {/literal}
                                </li>

                                <li class="outside">
                                    <ul class="inside">
                                        <li><input type="button" class="main_item_icon" style="background: url({$css_btn_bg}contract_config_btn_blur.png) repeat scroll 0% 0% transparent;" onmouseout="this.style.background='url({$css_btn_bg}contract_config_btn_blur.png)'" onmouseover="this.style.background='url({$css_btn_bg}contract_config_btn_focus.png)'" value="" name="tthd" id="tthd" onClick="javascript: document.getElementById('div_tthd').style.display='block'" {if $user_level neq 1} disabled{/if}></li>
                                        <li class="main_btn_caption">Thuộc tính hợp đồng</li>
                                    </ul>
                                    {literal}
                                        <script language="javascript">
                                            $("#tthd").click( function () {
                                                $("#tthd_content_main").load("index.php?listDanhmuc&mod=tthopdong");
                                            });
                                        </script>
                                    {/literal}
                                </li>


                                <li class="outside">
                                    <ul class="inside">
                                        <li><input type="button" class="main_item_icon" style="background: url({$css_btn_bg}user_btn_blur.png) repeat scroll 0% 0% transparent;" onmouseout="this.style.background='url({$css_btn_bg}user_btn_blur.png)'" onmouseover="this.style.background='url({$css_btn_bg}user_btn_focus.png)'" value="" name="user" id="user" onClick="javascript: document.getElementById('div_user').style.display=''" {if $user_level neq 1} disabled{/if}></li>
                                        <li class="main_btn_caption">Nhân sự</li>
                                    </ul>
                                    {literal}
                                        <script language="javascript">
                                            $("#user").click( function () {
                                                $("#user_content_main").load("index.php?listUser&mod=users");
                                            });
                                        </script>
                                    {/literal}
                                </li>

                                <li class="outside">
                                    <ul class="inside">
                                        <li><input type="button" class="main_item_icon" style="background: url({$css_btn_bg}sms_btn_blur.png) repeat scroll 0% 0% transparent;" onmouseout="this.style.background='url({$css_btn_bg}sms_btn_blur.png)'" onmouseover="this.style.background='url({$css_btn_bg}sms_btn_focus.png)'" value="" name="iconmsg" id="iconmsg" onClick="javascript: document.getElementById('div_msg').style.display=''"></li>
                                        <li class="main_btn_caption">Tin nhắn</li>
                                    </ul>
                                    {literal}
                                        <script language="javascript">
                                            $("#iconmsg").click( function () {
                                                document.getElementById('msg_content_main').style.display='block';
                                                $("#msg_content_main").load("index.php?listMsgUser&mod=msgs&inbox=1");
                                            });
                                        </script>
                                    {/literal}
                                </li>

                            </ul>
                    	</div>
                    </div>
                </div>
                <!-------------------------------------##################------------------------------------>
                <div id="c2">&nbsp;</div>
                
                <!--------------------------------DANH MUC CHUC NANG----------------------------------------->
                <input type="hidden" name="user_level_txt" id="user_level_txt" value="{$user_level}">
                <input type="hidden" name="user_level_tnvb" id="user_level_tnvb" value="{$user_level_tnvb}">
                <div class="c1" style="margin: 0 8px">
                	<div class="c11">
                    	<a class="a1" href="#"> DANH MỤC CHỨC NĂNG </a>
                        <div class="c12">
                            <ul>
                            	<!----------------Chuc nang quan ly van ban va dieu hanh noi bo--------------->
                                <li class="outside">
                                	<ul class="inside">
                                    	<li><input type="button" class="main_item_icon" style="background: url({$css_btn_bg}doc_btn_blur.png) repeat scroll 0% 0% transparent;" onmouseout="this.style.background='url({$css_btn_bg}doc_btn_blur.png)'" onmouseover="this.style.background='url({$css_btn_bg}doc_btn_focus.png)'" value="" name="icondoc" id="icondoc" onClick="javascript: document.getElementById('div_doc').style.display=''"></li>
                                        <li class="main_btn_caption">Văn bản - Giấy tờ</li>
                                    </ul>
                                    {literal}
                                    <script language="javascript">
									$("#icondoc").click( function () {
										var user_level_txt 	= document.getElementById('user_level_txt').value;
										
										document.getElementById('doc_content_main').style.display='block';
										if(user_level_txt==1 || user_level_txt==2 || user_level_txt==9)
											$("#doc_content_main").load("index.php?listDoc&mod=docs");
										else if(user_level_txt==4 || user_level_txt==5)
											$("#doc_content_main").load("index.php?replyDoc&mod=docs");
										else if(user_level_txt==3)
											$("#doc_content_main").load("index.php?tranDoc&mod=docs");
										else if(user_level_txt==6 || user_level_txt==7)
											$("#doc_content_main").load("index.php?processDoc&mod=docs");
										else if(user_level_txt==8)
											$("#doc_content_main").load("index.php?finishDoc&mod=docs");
                                        else if(user_level_txt==10)
                                            $("#doc_content_main").load("index.php?finishDocAll&mod=docs");
									});
									</script>
                                    {/literal}
                                </li>
                                
                                <!-----------------------chuc nang truyen nhan van ban------------------------->
                                <li class="outside">
                                	<ul class="inside">
                                    	<li><input type="button" class="main_item_icon" style="background: url({$css_btn_bg}contract_btn_blur.png) repeat scroll 0% 0% transparent;" onmouseout="this.style.background='url({$css_btn_bg}contract_btn_blur.png)'" onmouseover="this.style.background='url({$css_btn_bg}contract_btn_focus.png)'" value="" name="iconcontract" id="iconcontract" onClick="javascript: document.getElementById('div_transport').style.display=''"></li>
                                        <li class="main_btn_caption">Hợp đồng</li>
                                    </ul>
                                    {literal}
                                    <script language="javascript">
									$("#iconcontract").click( function () {
										
										//var user_level_tnvb 	= document.getElementById('user_level_tnvb').value;
										
										document.getElementById('contract_content_main').style.display='block';
										//if(user_level_tnvb==1 || user_level_tnvb==2)
											$("#contract_content_main").load("index.php?listHopdong&mod=hopdong");
										//else
											//$("#contract_content_main").load("index.php?listHopdong&mod=hopdong");
									});
									</script>
                                    {/literal}
                                </li>
                                
                                <li class="outside">
                                	<ul class="inside">
                                    	<li><input type="button" class="main_item_icon" style="background: url({$css_btn_bg}task_btn_blur.png) repeat scroll 0% 0% transparent;" onmouseout="this.style.background='url({$css_btn_bg}task_btn_blur.png)'" onmouseover="this.style.background='url({$css_btn_bg}task_btn_focus.png)'" value="" name="iconcv" id="iconcv" onClick="javascript: document.getElementById('div_cv_cat').style.display=''"></li>
                                        <li class="main_btn_caption">Công việc</li>
                                    </ul>
                                    {literal}
                                    <script language="javascript">
									$("#iconcv").click( function () {
										document.getElementById('cv_cat_content_main').style.display='block';
										$("#cv_cat_content_main").load("index.php?listCvCat&mod=congviecs");
									});
									</script>
                                    {/literal}
                                </li>

                                <li class="outside">
                                    <ul class="inside">
                                        <li><input type="button" class="main_item_icon" style="background: url({$css_btn_bg}salary_btn_blur.png) repeat scroll 0% 0% transparent;" onmouseout="this.style.background='url({$css_btn_bg}salary_btn_blur.png)'" onmouseover="this.style.background='url({$css_btn_bg}salary_btn_focus.png)'" value="" name="iconcv" id="iconcv" onClick="javascript: document.getElementById('div_cv_cat').style.display=''"></li>
                                        <li class="main_btn_caption">Chấm công - Lương</li>
                                    </ul>
                                    {literal}
                                        <script language="javascript">
                                            $("#iconcv").click( function () {
                                                document.getElementById('cv_cat_content_main').style.display='block';
                                                $("#cv_cat_content_main").load("index.php?listCvCat&mod=congviecs");
                                            });
                                        </script>
                                    {/literal}
                                </li>

                                <li class="outside">
                                    <ul class="inside">
                                        <li><input type="button" class="main_item_icon" style="background: url({$css_btn_bg}storage_btn_blur.png) repeat scroll 0% 0% transparent;" onmouseout="this.style.background='url({$css_btn_bg}storage_btn_blur.png)'" onmouseover="this.style.background='url({$css_btn_bg}storage_btn_focus.png)'" value="" name="iconvttb" id="iconvttb" onClick="javascript: document.getElementById('div_vttb').style.display=''"></li>
                                        <li class="main_btn_caption">Vật tư thiết bị</li>
                                    </ul>
                                    {literal}
                                        <script language="javascript">
                                            $("#iconvttb").click( function () {
                                                document.getElementById('vttb_content_main').style.display='block';
                                                $("#vttb_content_main").load("index.php?listVTTB_Chung&mod=vttbs");
                                            });
                                        </script>
                                    {/literal}
                                </li>
                                <li class="outside">
                                    <ul class="inside">
                                        <li><input type="button" class="main_item_icon" style="background: url({$css_btn_bg}schedule_btn_blur.png) repeat scroll 0% 0% transparent;" onmouseout="this.style.background='url({$css_btn_bg}schedule_btn_blur.png)'" onmouseover="this.style.background='url({$css_btn_bg}schedule_btn_focus.png)'" value="" name="iconplan" id="iconplan" onClick="javascript: document.getElementById('div_plan').style.display=''"></li>
                                        <li class="main_btn_caption">Lịch biểu</li>
                                    </ul>
                                    {literal}
                                        <script language="javascript">
                                            $("#iconplan").click( function () {
                                                document.getElementById('plan_content_main').style.display='block';
                                                $("#plan_content_main").load("index.php?mainPlan&mod=plans");
                                            });
                                        </script>
                                    {/literal}
                                </li>

                                <li class="outside">
                                    <ul class="inside">
                                        <li><input type="button" class="main_item_icon" style="background: url({$css_btn_bg}phone_btn_blur.png) repeat scroll 0% 0% transparent;" onmouseout="this.style.background='url({$css_btn_bg}phone_btn_blur.png)'" onmouseover="this.style.background='url({$css_btn_bg}phone_btn_focus.png)'" value="" name="icondanhba" id="icondanhba" onClick="javascript: document.getElementById('div_danhba').style.display=''"></li>
                                        <li class="main_btn_caption">Danh bạ</li>
                                    </ul>
                                    {literal}
                                        <script language="javascript">
                                            $("#icondanhba").click( function () {
                                                document.getElementById('danhba_content_main').style.display='block';
                                                $("#danhba_content_main").load("index.php?listUserPhone&mod=users");
                                            });
                                        </script>
                                    {/literal}
                                </li>
                                
                                {*<li class="outside">*}
                                	{*<ul class="inside">*}
                                    	{*<li><input type="button" class="main_item_icon" style="background: url({$css_btn_bg}email_buttom.png) repeat scroll 0% 0% transparent;" onmouseout="this.style.background='url({$css_btn_bg}email_buttom.png)'" onmouseover="this.style.background='url({$css_btn_bg}email_buttom_02.png)'" value="" name="dx"></li>*}
                                        {*<li>Công cụ thư tín</li>*}
                                    {*</ul>*}
                                {*</li>*}
                                
                                <li class="outside">
                                	<ul class="inside">
                                    	<li><input type="button" class="main_item_icon" style="background: url({$css_btn_bg}file_btn_blur.png) repeat scroll 0% 0% transparent;" onmouseout="this.style.background='url({$css_btn_bg}file_btn_blur.png)'" onmouseover="this.style.background='url({$css_btn_bg}file_btn_focus.png)'" value="" name="iconkdl" id="iconkdl" onClick="javascript: document.getElementById('div_kdl').style.display=''"></li>
                                        <li class="main_btn_caption">Kho dữ liệu</li>
                                    </ul>
                                    {literal}
                                    <script language="javascript">
									$("#iconkdl").click( function () {
										document.getElementById('kdl_content_main').style.display='block';
										$("#kdl_content_main").load("index.php?listKDL_Chung&mod=kdls&kdl_type=1");
									});
									</script>
                                    {/literal}
                                </li>
                                
                                {*<li class="outside">*}
                                	{*<ul class="inside">*}
                                    	{*<li><input type="button" class="main_item_icon" style="background: url({$css_btn_bg}chat_icon.png) repeat scroll 0% 0% transparent;" onmouseout="this.style.background='url({$css_btn_bg}chat_icon.png)'" onmouseover="this.style.background='url({$css_btn_bg}chat_icon_02.png)'" value="" name="iconchatol" id="iconchatol" onClick="javascript: document.getElementById('div_chatol').style.display=''"></li>*}
                                        {*<li>Chat trực tuyến</li>*}
                                    {*</ul>*}
                                    {*{literal}*}
                                    {*<script language="javascript">*}
									{*$("#iconchatol").click( function () {*}
										{*document.getElementById('chatol_content_main').style.display='block';*}
									{*});*}
									{*</script>*}
                                    {*{/literal}*}
                                {*</li>*}

                            </ul>
                    	</div>
                    </div>
                </div>
                <!--------------------------------##################----------------------------------------->
            </div>
            <!--*************************************HET KHUNG CHUC NANG*************************************-->
            <!--*************************************KHUNG HDSD - NGUOI DUNG*********************************-->
            <div id="r-main">
            	<!-----------------------------------HUONG DAN SU DUNG------------------------------------------->
                <div class="c2">
                    <div class="c21">
                        <a class="a2" href="#"> HƯỚNG DẪN SỬ DỤNG </a>
                        <div class="c22" style="height:218px; line-height:20px; width:254px; overflow-y:scroll">
                            {section name=hi loop=$hdsd_list}
                            	&nbsp;&bull; <a href="javascript:void(0)" onClick="javascript:show_video({$hdsd_list[hi]->hdsd_id})">{$hdsd_list[hi]->hdsd_name}</a><br>
                            {/section}
                        </div>
                        {literal}
						<script language="javascript">
							function show_video(obj){
								$('#div_video_hdsd').css({'display':'block','z-index':'2010'});
								$("#div_video_hdsd_cont").load("index.php?viewHdsd&mod=hdsds&hdsd_id="+obj);
							}
                        </script>
                        {/literal}
                    </div>
                </div>
                <!-----------------------------------##################------------------------------------------>

                {literal}
                    <script language="javascript">
                        function hide_systray() {
                            $('#div_systray_info').css({'display':'none'});

                            return setTimeout('show_systray()', 5000);
                        }

                        function show_systray() {
                            $( "#div_systray_info" ).load( "systray_info.php", function(response) {
                                if(parseInt(response) != 1){
                                    $('#div_systray_info').css({'display':'block'});
                                }
                            });

                            return setTimeout('hide_systray()', 5000);
                        }
                        setTimeout('show_systray()', 5000);
                    </script>
                {/literal}
                <!-----------------------------------THONG TIN NGUOI DUNG---------------------------------------->
                <div class="c2" style="margin-top:16px">
                    <div class="c21">
                        <a class="a2" href="#"> THÔNG TIN NGƯỜI DÙNG </a>
                        <div class="c22">
                        	<div style="float:left; width:90px; height:120px; border:1px solid #ccc; margin-left:2px; padding:2px">
                                {if $user_image neq ''}
                            	    <img src="../{$user_image}" width="90" height="120" align="absmiddle">
                                {else}
                                    <img src="../images/admin/user-icon.gif" width="90" height="120" align="absmiddle">
                                {/if}
                            </div>
                            <div style="float:left; width:153px; height:130px; margin-left:4px; font-size:12px">
                                <div style="float: left">- Họ tên:&nbsp;<b>{$access_user_fullname}</b><br><br>
                                - Tài khoản:&nbsp;<b>{$access_user_name}</b><br><br>
                                - C/V:&nbsp;<b>{$access_object_name}</b><br><br>
                                - P/B:&nbsp;<b>{$access_department_name}</b><br><br></div>
                                <div style="float: left">
                                    <input class="text_short" type="text" name="clock_txt1" id="clock_txt1" value="" style="border:none; background-color:transparent; font-size:12px" readonly></div>
                                </div>
                            </div>
                            <div style="float:left; width:250px; margin-top:4px; margin-left:2px; font-size:12px">
                            <span style=" line-height:22px">
                            <img src="../images/admin/users.png" width="16" align="absmiddle">&nbsp;
                            <a href="javascript: void(0)" onClick="javascript:show_user_edit({$access_user_id})">Sửa thông tin tài khoản cá nhân</a>
                            </span><br>
                            <span style=" line-height:22px">
                            <img src="../images/admin/logout_icon.png" width="16" align="absmiddle">&nbsp;
                            <a href="?logout">Thoát quyền (Đăng xuất)</a>
                            </span><br>
                            <span style=" line-height:22px">
                            <img src="../images/admin/bangdieukhien.png" width="16" align="absmiddle">&nbsp;
                            <a href="http://tha.vn" target="_blank">Trang tin điện tử của đơn vị</a>
                            </span>
                            </div>
                            {literal}
                                <script language="javascript">
                                    function show_user_edit(obj){
                                        $('#div_edit_pass').css({'display':'block','z-index':'2010'});
                                        $("#edit_pass_cont").load("changepass.php?user_id="+obj);
                                    }
                                </script>
                            {/literal}
                        </div>
                    </div>
                </div>
                <!-----------------------------------##################------------------------------------------>
            </div>
            <!--**************************************HET KHUNG HDSD - NGUOI DUNG******************************-->
            <!--*******************************************KHUNG FOOTER****************************************-->
            <div style="float:left; width:100%; line-height:25px; font-size: 11px; margin-top: 15px">
                <br>
                <a href="http://mekonggroup.net/" target="_blank" style="text-decoration:none; color:#666; font-size: 11px">&copy; 2018 - {php}echo date('Y');{/php} Tập đoàn MEKONG.</a>&nbsp;|&nbsp;
                <span style="text-decoration:none; color:#666; font-size: 11px">Trụ sở:</span>
                Tầng 5, tòa nhà 21 T2, dự án Hapulico Complex, số 1 Nguyễn Huy Tưởng , Thanh Xuân Trung, Thanh Xuân, Hà Nội
                &nbsp;|&nbsp;<span style="text-decoration:none; color:#666; font-size: 11px">Điện thoại:</span>
                (84-4)35584167&nbsp;|&nbsp;
                <span style="text-decoration:none; color:#666; font-size: 11px">Website:</span> <a href="http://mekonggroup.net/" target="_blank" style="text-decoration:none; color:#666; font-size: 11px">mekonggroup.net</a>
                &nbsp;|&nbsp;{php}echo "Today: ".date('d')."-".date('m')."-".date('Y');{/php}
            </div>
            <!--*******************************************HET KHUNG FOOTER***********************************-->
        </div>
    </div>
    <div id="fade" class="black_overlay"></div>
    {literal}
	<style type="text/css">
    /*----------------------div_video_hdsd div---------------------*/
    #div_video_hdsd_main_cont{ float:left; width:100%; height:430px; background-color:#ccd8e7}
    #div_video_hdsd_tab_bar_tit{ float:left; font-weight:bold; text-transform:uppercase; line-height:20px; padding-left:8px; width:80%;cursor:move; color:#15428b;}
    #div_video_hdsd_tab_bar_icon{ float:right; width:10%; text-align:right; padding-top:2px; padding-right:6px}
    #div_video_hdsd_content_outsign{ float:left; width:97%; height:400px; background-color:#ffffff; margin-left:8px; border:1px solid #99bbe8}
    #div_video_hdsd_content_insign{ float:left; width:99.7%; height:379px; background-color:#dfe8f6; margin-left:1px;}
    #div_video_hdsd_cont{ float:left; width:99.7%; height:399px; background-color:#dfe8f6; margin-left:1px;}
    #div_video_hdsd_clear_txt{ float:left; width:100%; height:1px}
    #div_video_hdsd_tool_bar{ float:left; width:99.7%; height:20px; background-color:#dfe8f6; margin-left:1px}
    #div_video_hdsd_search_area{ float:left; width:120px; height:20px; padding-left:2px}
    #div_video_hdsd_page_area{ float:left; width:40px; height:20px; padding-left:2px}
    #div_video_hdsd_menu{ float:left; width:99.7%; height:25px; padding-left:8px; position:absolute; margin-top:21px}
    /*----------------------end div_video_hdsd div---------------------*/
    </style>
    {/literal}
    <div id="div_video_hdsd" style="width:530px; float:left; font-weight:normal; position:absolute; display:none; margin:-500px 0 0 300px; background-color:#ffffff; border:1px solid #99bbe8; z-index:1010; padding: 0px 1px 1px 1px">
        <div id="div_video_hdsd_main_cont">
            <div id="div_video_hdsd_tab_bar_tit">Video hướng dẫn sử dụng</div>
            <div id="div_video_hdsd_tab_bar_icon">
                <a href="javascript: void(0);" onClick="javascript: document.getElementById('div_video_hdsd').style.display='none'" style="text-decoration:none">
                <img src="{$css_path}icon_dong.png" class="img_all" title="Đóng lại"></a>
            </div>
            <div id="div_video_hdsd_content_outsign">
                <div id="div_video_hdsd_cont">
                </div>
            </div>
        </div>
    </div>
    {literal}
        <style type="text/css">
            /*----------------------div_edit_pass div---------------------*/
            #edit_pass_main_cont{ float:left; width:100%; height:125px; background-color:#ccd8e7}
            #edit_pass_tab_bar_tit{ float:left; font-weight:bold; text-transform:uppercase; line-height:20px; padding-left:8px; width:80%;cursor:move; color:#15428b;}
            #edit_pass_tab_bar_icon{ float:right; width:10%; text-align:right; padding-top:2px; padding-right:6px}
            #edit_pass_content_outsign{ float:left; width:93%; height:95px; background-color:#ffffff; margin-left:8px; border:1px solid #99bbe8}
            #edit_pass_content_insign{ float:left; width:99.3%; height:62px; background-color:#dfe8f6; margin-left:1px;}
            #edit_pass_cont{ float:left; width:99.5%; height:94px; background-color:#dfe8f6; margin-left:1px;}
            /*----------------------end div_edit_pass div---------------------*/
        </style>
    {/literal}
    <div id="div_edit_pass" style="position:absolute; margin:-230px 0 0 930px; width:240px; background-color:#ffffff; border:1px solid #99bbe8; display:none; z-index:100">
        <div id="edit_pass_main_cont">
            <div id="edit_pass_tab_bar_tit">Đổi mật khẩu</div>
            <div id="edit_pass_tab_bar_icon">
                <a href="javascript: void(0);" onClick="javascript: document.getElementById('div_edit_pass').style.display='none'" style="text-decoration:none">
                    <img src="../js/jquery/draggable_div/images/icon_dong.png" class="img_all" title="Đóng lại"></a>
            </div>
            <div id="edit_pass_content_outsign">
                <div id="edit_pass_cont">
                </div>
            </div>
        </div>
    </div>
    <div id="div_systray_info" style="position: absolute; display: none; border: 1px solid #F00; background-color: #fff; width: 1200px; height: 30px; margin: 10px 50px 30px 82px; padding-top:3px">
        Không có thông báo mới
    </div>
</body>
</html>
