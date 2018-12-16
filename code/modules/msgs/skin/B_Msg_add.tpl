{literal}
<style type="text/css">
.error { color:#FF0000;font-weight:bold; margin-left:5px; height:20px; line-height:20px}
.msg{ color:#00F; font-weight:bold; margin-left:5px; height:20px; line-height:20px}
.tbl_tit{
float:left; line-height:25px; border-right:1px solid #99bbe8; 	
}
.tbl_cont{
float:left; line-height:25px; border-right:1px solid #99bbe8; border-bottom:1px solid #99bbe8; background:#F2FFEC
}
.tbl_cont2{
float:left; line-height:25px; border-right:1px solid #99bbe8; border-bottom:1px solid #99bbe8; background:#FFF
}
</style>
{/literal}
<div id="msg_content_insign">
	<form method="post" name="frmList_Msg" action="?addMsg{$vars.arg}" id="frmList_Msg">
    <!------------------------------------MENU TIN NHAN---------------------------------------------->
    <div style="float:left">
    <fieldset style="width:125px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:292px">
        <legend class="legend" style="width:80px">
            <div style="width:60px; float:left">Thao tác</div>
        </legend>
    	<div style="float:left; height:5px; width:100%"></div>
        <div style="float:left; height:255px; width:125px;">
            <div style="float:left; line-height:30px">
            	<div style="float:left; width:20px; text-align:center">&diams;</div>
                <div style="float:left; width:100px">
                	<a href="javascript:void(0);" onclick="javascript: show_soan_msg()" {if $soan_msg eq 1} style="color:#F00" {/if}>&nbsp;Soạn tin</a>
                </div>
            </div>
            <div style="float:left; line-height:30px">
            	<div style="float:left; width:20px; text-align:center">&diams;</div>
                <div style="float:left; width:100px">
                	<a href="javascript:void(0);" onclick="javascript: show_inbox_msg()" {if $inbox eq 1} style="color:#F00" {/if}>&nbsp;Hộp thư đến</a>
                </div>
            </div>
            <div style="float:left; line-height:30px">
            	<div style="float:left; width:20px; text-align:center">&diams;</div>
                <div style="float:left; width:100px">
                	<a href="javascript:void(0);" onclick="javascript: show_outbox_msg()" {if $outbox eq 1} style="color:#F00" {/if}>&nbsp;Hộp thư đi</a>
                </div>
            </div>
            <div style="float:left; line-height:30px">
            	<div style="float:left; width:20px; text-align:center">&diams;</div>
                <div style="float:left; width:100px">
                	<a href="javascript:void(0);" onclick="javascript: show_drafmsg_msg()" {if $drafmsg eq 1} style="color:#F00" {/if}>&nbsp;Tin nháp</a>
                </div>
            </div>
            <div style="float:left; line-height:30px">
            	<div style="float:left; width:20px; text-align:center">&diams;</div>
                <div style="float:left; width:100px">
                	<a href="javascript:void(0);" onclick="javascript: show_wastemsg_msg()" {if $wastemsg eq 1} style="color:#F00" {/if}>&nbsp;Tin rác</a>
                </div>
            </div>
            <div style="float:left; line-height:30px">
            	<div style="float:left; width:20px; text-align:center">&diams;</div>
                <div style="float:left; width:100px">
                	<a href="javascript:void(0);" onclick="javascript: show_impmsg_msg()" {if $impmsg eq 1} style="color:#F00" {/if}>&nbsp;Tin quan trọng</a>
                </div>
            </div>
        </div>
        <input type="hidden" id="msg_type" name="msg_type" value="{$msg_type}" />
    </fieldset>
    </div>
    <!------------------------------------VUNG NOI DUNG---------------------------------------------->
    <div style="float:left">
    <fieldset style="width:380px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:292px">
    	<legend class="legend_list" style="width:125px">
            <div style="width:100px; float:left">Soạn tin nhắn</div>
        </legend>
        <div style="float:left; height:218px; width:380px;">
            <table width="98%" cellspacing="0" cellpadding="0" border="0" style="margin-left:5px">
                <tr height="20">
                    <td> 
                        {if $error or $complete}
                        <span class="msg">Thông báo: <font color="#FF0000">{$error}</font>{$complete}</span>{/if}
                        <span id="lblError_Msg" class="error">Thông báo: (*) là các mục bắt buộc!</span>
                    </td>
                </tr>
                <tr height="30">
                    <td align="center" valign="top">
                        <div style="float:left; width:380px">
                            <div style="float:left; width:65px; line-height:25px; text-align:left">Người gửi:</div>
                            <div style="float:left; width:120px; line-height:25px; text-align:left">
                            {$access_user_fullname}
                            </div>
                            <div style="float:left; width:65px; line-height:25px; text-align:left">Ngày gửi:</div>
                            <div style="float:left; width:120px; line-height:25px; text-align:left">
                                {$smarty.now|date_format:"%d/%m/%Y"}
                            </div>
                        </div>
                    </td>
                </tr>
                <tr height="30">
                    <td align="center">
                        <div style="float:left; width:380px">
                            <div style="float:left; width:65px; line-height:25px; text-align:left">Nội dung <font color="#FF0000">*</font>:</div>
                            <div style="float:left; width:305px; line-height:25px; text-align:left">
                                <textarea spellcheck="false" name="msg_cont" id="msg_cont" cols="30" rows="5" class="text_area">{$obj_info.msg_cont}</textarea>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr height="30">
                    <td align="center">
                        <div style="float:left; width:380px">
                            <div style="float:left; width:65px; line-height:25px; text-align:left">Gửi tới <font color="#FF0000">*</font>:</div>
                            <div style="float:left; width:305px; line-height:25px; text-align:left">
                                <select name="unit_id" id="unit_id" class="select_middle_long">
                                    <option value="0">Chọn phòng ban để thấy thành viên</option>
                                    {section name=di loop=$obj_list_department}
                                    <option value="{$obj_list_department[di]->department_id}">{$obj_list_department[di]->department_name}</option>
                                    {/section}
                                </select>
                                {literal}
								<script language="javascript">
                                $("#unit_id").change( function () { 
                                     var unit_id = $("#unit_id").val();
                                     $("#boxUser").load("index.php?MsglistUser&mod=msgs&unit_id="+unit_id); 
                                    });
                                </script>
                                {/literal}
                            </div>
                            <div style="float:left; width:65px; line-height:25px; text-align:left">&nbsp;</div>
                            <div style="float:left; width:305px; line-height:25px; height:93px; text-align:left overflow-y:scroll">
                                <div id="boxUser" style="float:left"></div>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr height="30">
                    <td align="left">
                    <input type="button" name="btnSub_Msg" id="btnSub_Msg" value="Gửi đi" class="button" />
                    <input type="button" name="btnSub_Save" id="btnSub_Save" value="Lưu nháp" class="button" />
                    <input type="hidden" name="msg_id" id="msg_id" value="{$obj_info.msg_id}">
                    <input type="hidden" name="user_rec_str" id="user_rec_str" value="">
                    <input type="reset" name="Reset" value="Hủy bỏ" class="button" />
                    {literal}
                    <script language="javascript">
                        function hide_message_Msg(){
                            $('#lblMessage_Msg').hide();
                            $('#lblError_Msg').hide();
                        }
                        
                        $(function() {
                        $('.error').hide();
                        $('#lblMessage_Msg').hide();
                         
                        $("#btnSub_Msg").click(function() {
                            $('.error').hide();
							// --------tao chuoi id nguoi nhan
							if (typeof document.frmList_Msg.user_recevie !== "undefined") {
								var user_rec_str="";
								var user_rec_arr=document.frmList_Msg.elements.length;	
								user_rec_arr=(user_rec_arr>2)?document.frmList_Msg.user_recevie.length:0;
								if (user_rec_arr>0){
									for(var i=0;i<user_rec_arr;i++)
										if(document.frmList_Msg.user_recevie[i].checked==true)
											user_rec_str+=document.frmList_Msg.user_recevie[i].value+",";
								}else{
									if(document.frmList_Msg.user_recevie.checked==true)
										user_rec_str=document.frmList_Msg.user_recevie.value;
								}
								document.frmList_Msg.user_rec_str.value=user_rec_str;
							}
							
                            var $form = $("#frmList_Msg");
                            var msg_cont = $form.find('textarea#msg_cont').val();
                            var user_rec_str = $form.find('input#user_rec_str').val();
							var msg_id = $form.find('input#msg_id').val();
							
                            //begin validate form
                            if (msg_cont == "" || user_rec_str == ""){
                                $('#lblError_Msg').show();
                            }
                            else{
                                var dataString  = "msg_cont=" + msg_cont;
                                    dataString += "&user_rec_str=" + user_rec_str;
									dataString += "&msg_id=" + msg_id;
                                    //alert (dataString);return false;
                                $.ajax({
                                    type: "POST",
                                    url: "index.php?addMsg&mod=msgs&add_edit=1",
                                    data: dataString,
                                    success: function(data) {
                                        $('#add_edit_msg').hide();
                                        $('#msg_content_main').fadeOut('fast').load('index.php?listMsg&mod=msgs&outbox=1').fadeIn("fast");
                                        $('#div_thanhcong').css({'display':'block','z-index':'2010'})
                                        tat_thongbao();diemnguoc(2);
                                    }
                                });
                                return false;
                            }
                            //end form
                        });
						//------------------------------------------------
						
						$("#btnSub_Save").click(function() {
                            $('.error').hide();
							
                            var $form = $("#frmList_Msg");
                            var msg_cont = $form.find('textarea#msg_cont').val();
							var msg_id = $form.find('input#msg_id').val();
                            //begin validate form
                            if (msg_cont == ""){
                                $('#lblError_Msg').show();
                            }
                            else{
                                var dataString  = "msg_cont=" + msg_cont;
								dataString += "&msg_id=" + msg_id;
                                    //alert (dataString);return false;
                                $.ajax({
                                    type: "POST",
                                    url: "index.php?addMsg&mod=msgs&add_edit=1&luunhap=1",
                                    data: dataString,
                                    success: function(data) {
                                        $('#add_edit_msg').hide();
                                        $('#msg_content_main').fadeOut('fast').load('index.php?listDrafMsg&mod=msgs&drafmsg=1').fadeIn("fast");
                                        $('#div_thanhcong').css({'display':'block','z-index':'2010'})
                                        tat_thongbao();diemnguoc(2);
                                    }
                                });
                                return false;
                            }
                            //end form
                        });
						//------------------------------------------------
                    });
                    </script>
                    {/literal}
                    </td>
                </tr>
            </table>
        </div>
    </fieldset>
    </div>
    </form>
</div>