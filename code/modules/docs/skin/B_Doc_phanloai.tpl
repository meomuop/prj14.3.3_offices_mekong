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
<div id="phanloai_content_insign">
	<form method="post" name="frmList_Phanloai" action="?Phanloai{$vars.arg}" id="frmList_Phanloai">
    <!------------------------------------------THEM MOI------------------------------------>
    <fieldset style="width:523px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
        <legend class="legend_list">Tham mưu: <font color="#FF0000">Số ký hiệu văn bản: {$doc_code} - Số đến: {$doc_num}</font></legend>
    	<table width="98%" cellspacing="0" cellpadding="0" border="0" style="margin-left:5px">
            <tr height="20">
                <td colspan="2"> 
                	{if $error or $complete}
                	<span class="msg">Thông báo: <font color="#FF0000">{$error}</font>{$complete}</span>{/if}
            		<span id="lblError_Phanloai" class="error">Thông báo: (*) là các mục bắt buộc!</span>
                </td>
            </tr>
            <tr height="30">
            	<td align="center" valign="top">
                	<div style="float:left; width:518px;">
                        <div style="float:left; width:90px; line-height:25px; text-align:left">Nội dung ý kiến <font color="#FF0000">*</font>:</div>
                        <div style="float:left; width:380px; text-align:left">
                            <textarea spellcheck="false" class="text_area_wide" name="doc_note" id="doc_note" spellcheck="false" onfocus="hide_message_Phanloai();" tabindex="51">{$obj_doc->doc_note}</textarea>
                        </div>
                        <div style="float:left; width:90px; line-height:25px; text-align:left">Ngày tham mưu <font color="#FF0000">*</font>:</div>
                        <div style="float:left; width:120px; line-height:25px; text-align:left">
                            <input type="text" class="text_time_callender" name="doc_moved_1" id="doc_moved_1" value="{if $obj_doc->doc_moved neq '' and $obj_doc->doc_moved neq '1970-01-01'}{$obj_doc->doc_moved|date_format:'%d/%m/%Y'}{else}{$smarty.now|date_format:'%d/%m/%Y'}{/if}" readonly tabindex="52"/>
                            <img src="../images/admin/img.gif" align="absmiddle" id="icon_doc_moved" style="cursor: pointer; border:0" title="Chọn ngày trên lịch" tabindex="53"/>
                            {literal}
                            <script type="text/javascript">
                                Calendar.setup({
                                    inputField   :   "doc_moved_1",
                                    ifFormat     :   "%d/%m/%Y",
                                    button       :   "icon_doc_moved",
                                    align        :   "Br",  
                                    timeFormat   :   "24",
                                    showsTime    :   true,
                                    singleClick  :   true
                                });
                            </script>
                            {/literal}
                        </div>
                        <div style="float:left; width:70px; line-height:25px; text-align:left">Người nhận <font color="#FF0000">*</font>:</div>
                        <div style="float:left; width:238px; line-height:25px; text-align:left">
                            <select name="user_id" id="user_id" class="select_middle_long" onChange="set_txtarea()" onfocus="hide_message_Phanloai();" tabindex="54">
                                <option value="0">Chọn người nhận chỉ đạo</option>
                                {section name=ui loop=$obj_list_user}
                                <option value="{$obj_list_user[ui]->user_id}"  {if $obj_list_user[ui]->user_id eq $obj_doc->user_id}selected="selected"{/if}>
                                    {$obj_list_user[ui]->user_fullname}
                                    {section name=qi loop=$obj_list_object}
                                    {if $obj_list_object[qi]->object_id eq $obj_list_user[ui]->object_id}
                                    - {$obj_list_object[qi]->object_name}
                                    {/if}
                                    {/section}
                                </option>
                                {/section}
                            </select>
                        </div>
                    </div>
                    <!--------------------------------------------------------------------------------------->
                    
                    <div style="float:left; width:518px;">
                    	<div style="float:left; width:90px; line-height:25px; text-align:left">&nbsp;</div>
                        <div style="float:left; width:190px; line-height:25px; text-align:left">
                        	<input type="button" name="btnSub_Phanloai" id="btnSub_Phanloai" value="Ghi lại" class="button" tabindex="55"/>
                            <input type="hidden" name="doc_id" id="doc_id" value="{if $doc_id neq ''}{$doc_id}{else}{$obj_doc->doc_id}{/if}">
                            <input type="hidden" name="arg" id="arg" value="{$vars.arg}">
                            <input type="reset" name="Reset" value="Hủy bỏ" class="button" tabindex="56"/>
                            {literal}
                            <script language="javascript">
                                function hide_message_Phanloai(){
                                    $('#lblMessage_Phanloai').hide();
                                    $('#lblError_Phanloai').hide();
                                }
                                
                                $(function() {
                                $('.error').hide();
                                $('#lblMessage_Phanloai').hide();
                                 
                                $("#btnSub_Phanloai").click(function() {
                                    
                                    $('.error').hide();
									
                                    // -----------------lay du lieu tu cac phan tu form
                                    var $form = $("#frmList_Phanloai");
                                    var doc_note 	= $form.find('textarea#doc_note').val();
                                    var doc_moved 	= $form.find('input#doc_moved_1').val();
									var doc_id 		= $form.find('input#doc_id').val();
									var user_id 	= $form.find('select#user_id :selected').val();
									
									var order_id 	= $form.find('input#order_id').val();
                                    
                                    //begin validate form
                                    if (doc_note == "" || doc_moved == "" || user_id == 0){
                                        $('#lblError_Phanloai').show();
                                    }
                                    else{
                                        $.post('index.php?Phanloai&mod=docs&add_edit=1',
                                            {
                                                doc_note:doc_note,
                                                doc_moved:doc_moved,
                                                doc_id:doc_id,
												user_id:user_id,
                                            },
                                            function(data){
                                                $('#list_phanloai').hide();
												
												var arg = document.getElementById('arg').value;
												var user_level_txt = document.getElementById('user_level_txt').value;
												if(user_level_txt==1 || user_level_txt==2 || user_level_txt==9){
													$('#doc_content_main').hide();
													$('#doc_content_main').fadeOut('fast').load('index.php?listDoc&arg='+arg).fadeIn("fast");
												}else if(user_level_txt==3){
													$('#doc_content_main').hide();
													$('#doc_content_main').fadeOut('fast').load('index.php?tranDoc&arg='+arg).fadeIn("fast");
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