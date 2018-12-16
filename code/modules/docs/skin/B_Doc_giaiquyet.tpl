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
<div id="giaiquyet_content_insign">
	<form method="post" name="frmList_Giaiquyet" action="?Giaiquyet{$vars.arg}" id="frmList_Giaiquyet">
    <!------------------------------------------THEM MOI------------------------------------>
    <fieldset style="width:470px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
        <legend class="legend_list">Nhập kết quả: <font color="#FF0000">Số ký hiệu văn bản: {$doc_code} - Số đến: {$doc_num}</font></legend>
    	<table width="98%" cellspacing="0" cellpadding="0" border="0" style="margin-left:5px">
            <tr height="20">
                <td colspan="2"> 
                	{if $error or $complete}
                	<span class="msg">Thông báo: <font color="#FF0000">{$error}</font>{$complete}</span>{/if}
            		<span id="lblError_Giaiquyet" class="error">Thông báo: (*) là các mục bắt buộc!</span>
                </td>
            </tr>
            <tr height="30">
            	<td align="center" valign="top">
                	<div style="float:left; width:465px;">
                        <div style="float:left; width:85px; line-height:25px; text-align:left">SKH VB trả lời:</div>
                        <div style="float:left; width:185px; text-align:left">
                            <input type="text" class="text_middle" name="doc_note_code" id="doc_note_code" value="{$obj_doc->doc_note_code}" tabindex="61"/>
                        </div>
                        <div style="float:left; width:85px; line-height:25px; text-align:left">Ngày văn bản:</div>
                        <div style="float:left; width:110px; line-height:25px; text-align:left">
                            <input type="text" class="text_time_callender" name="doc_note_sign_date" id="doc_note_sign_date" value="{if $obj_doc->doc_note_sign_date neq '' and $obj_doc->doc_note_sign_date neq '1970-01-01'}{$obj_doc->doc_note_sign_date|date_format:'%d/%m/%Y'}{else}{$smarty.now|date_format:'%d/%m/%Y'}{/if}" readonly tabindex="62"/>
                            <img src="../images/admin/img.gif" align="absmiddle" id="icon_doc_note_sign_date" style="cursor: pointer; border:0" title="Chọn ngày trên lịch" tabindex="53"/>
                            {literal}
                            <script type="text/javascript">
                                Calendar.setup({
                                    inputField   :   "doc_note_sign_date",
                                    ifFormat     :   "%d/%m/%Y",
                                    button       :   "icon_doc_note_sign_date",
                                    align        :   "Br",  
                                    timeFormat   :   "24",
                                    showsTime    :   true,
                                    singleClick  :   true
                                });
                            </script>
                            {/literal}
                        </div>
                        <div style="float:left; width:85px; line-height:25px; text-align:left">Người ký:</div>
                        <div style="float:left; width:185px; line-height:25px; text-align:left">
                            <input type="text" class="text_middle" name="doc_note_sign_per" id="doc_note_sign_per" value="{$obj_doc->doc_note_sign_per}" tabindex="63"/>
                        </div>
                        <div style="float:left; width:85px; line-height:25px; text-align:left">Ngày giải quyết:</div>
                        <div style="float:left; width:110px; line-height:25px; text-align:left">
                            <input type="text" class="text_time_callender" name="doc_note_date" id="doc_note_date" value="{if $obj_doc->doc_note_date neq '' and $obj_doc->doc_note_date neq '1970-01-01'}{$obj_doc->doc_note_date|date_format:'%d/%m/%Y'}{else}{$smarty.now|date_format:'%d/%m/%Y'}{/if}" readonly/>
                        </div>
                    </div>
                    <!--------------------------------------------------------------------------------------->
                    
                    <div style="float:left; width:465px;">
                    	<div style="float:left; width:85px; line-height:25px; text-align:left">&nbsp;</div>
                        <div style="float:left; width:250px; line-height:25px; text-align:left">
                        	<input type="button" name="btnSub_Giaiquyet" id="btnSub_Giaiquyet" value="Hoàn thành công việc" class="button_long" tabindex="64"/>
                            <input type="hidden" name="doc_id" id="doc_id" value="{$obj_doc->doc_id}">
                            <input type="hidden" name="doc_theodoi" id="doc_theodoi" value="{$obj_doc->doc_theodoi}">
                            <input type="hidden" name="arg" id="arg" value="{$vars.arg}">
                            <input type="reset" name="Reset" value="Hủy bỏ" class="button" tabindex="65"/>
                            {literal}
                            <script language="javascript">
                                function hide_message_Giaiquyet(){
                                    $('#lblMessage_Giaiquyet').hide();
                                    $('#lblError_Giaiquyet').hide();
                                }
                                
                                $(function() {
                                $('.error').hide();
                                $('#lblMessage_Giaiquyet').hide();
                                 
                                $("#btnSub_Giaiquyet").click(function() {
                                    
                                    $('.error').hide();
									
                                    // -----------------lay du lieu tu cac phan tu form
                                    var $form = $("#frmList_Giaiquyet");
                                    var doc_note_code 		= $form.find('input#doc_note_code').val();
                                    var doc_note_sign_date 	= $form.find('input#doc_note_sign_date').val();
									var doc_note_sign_per 	= $form.find('input#doc_note_sign_per').val();
									var doc_note_date 		= $form.find('input#doc_note_date').val();
									var doc_id 				= $form.find('input#doc_id').val();
									var doc_theodoi 		= $form.find('input#doc_theodoi').val();
									
									var order_id 			= $form.find('input#order_id').val();
                                    
                                    //begin validate form
                                    if (doc_theodoi == 1 && (doc_note_code == "" || doc_note_sign_date == "" || doc_note_sign_per == "")){
                                        $('#lblError_Giaiquyet').show();
                                    }
                                    else{
                                        $.post('index.php?Giaiquyet&mod=docs&add_edit=1',
                                            {
                                                doc_note_code		:doc_note_code,
                                                doc_note_sign_date	:doc_note_sign_date,
												doc_note_sign_per	:doc_note_sign_per,
												doc_note_date		:doc_note_date,
                                                doc_id				:doc_id,
                                            },
                                            function(data){
                                                $('#div_giaiquyet').hide();
												
												var arg = document.getElementById('arg').value;
												var user_level_txt 	= document.getElementById('user_level_txt').value;
												if(user_level_txt==6 || user_level_txt==7){
													$('#doc_content_main').hide();
													$('#doc_content_main').fadeOut('fast').load('index.php?processDoc&arg='+arg).fadeIn("fast");
												}else if(user_level_txt==8){
													$('#doc_content_main').hide();
													$('#doc_content_main').fadeOut('fast').load('index.php?finishDoc&arg='+arg).fadeIn("fast");
												}
													
												document.getElementById('div_thanhcong').style.display='block';
												document.getElementById('div_thanhcong').style.zIndex = '2001';
												tat_thongbao();diemnguoc(2);
												
                                            }
                                        );
                                        return false;
                                    }
                                    //end form
                                });
                            });
                            </script>
                            {/literal}
                        </div>
                        <!--------------------------------------------------------------------------------->
                    </div>
                </td>
            </tr>
        </table>
    </fieldset>
    </form>
</div>