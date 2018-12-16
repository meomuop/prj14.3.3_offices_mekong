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
<div id="add_edit_cv_log_content_insign">
	<form method="post" name="frmAdd_CvLog" action="?addEditCvLog{$vars.arg}" id="frmAdd_CvLog">
    <!------------------------------------------THEM MOI------------------------------------>
    <fieldset style="width:595px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
        <legend class="legend" style="width:125px">Thêm/Sửa yêu cầu:</legend>
    	<table width="98%" cellspacing="0" cellpadding="0" border="0" style="margin-left:5px">
            <tr height="20">
                <td colspan="2"> 
                	{if $error or $complete}
                	<span class="msg">Thông báo: <font color="#FF0000">{$error}</font>{$complete}</span>{/if}
            		<span id="lblError_Cv_log" class="error">Thông báo: (*) là các mục bắt buộc!</span>
                </td>
            </tr>
            <tr height="30">
            	<td align="center" valign="top">
                	<div style="float:left; width:383px">
                        <div style="float:left; width:70px; line-height:25px; text-align:left">Mô tả <font color="#FF0000">*</font>:</div>
                        <div style="float:left; width:280px; line-height:25px; text-align:left">
                        	<textarea spellcheck="false" name="cv_log_desc" id="cv_log_desc" cols="30" rows="5" class="text_area_dongbo" style="width:510px; height:40px">{$obj_info.cv_log_desc}</textarea>
                        </div>
                    </div>
                	<div style="float:left; width:383px">
                        <div style="float:left; width:70px; line-height:25px; text-align:left">Ghi chú:</div>
                        <div style="float:left; width:280px; line-height:25px; text-align:left">
                        	<textarea spellcheck="false" name="cv_log_note" id="cv_log_note" cols="30" rows="5" class="text_area_dongbo" style="width:510px; height:72px">{$obj_info.cv_log_note}</textarea>
                        </div>
                    </div>
                    {if $user_level eq 4}
                        <div style="float:left; width:583px">
                            <div style="float:left; width:70px; line-height:25px; text-align:left">Giám sát:</div>
                            <div style="float:left; width:510px; line-height:25px; text-align:left">
                                {section name=ui loop=$obj_list_user}
                                    <div style="float:left; width: auto; margin-right: 20px" title="{$obj_list_user[ui]->user_name}">
                                        <input type="checkbox" name="user_id_{$smarty.section.ui.index}" id="user_id_{$smarty.section.ui.index}" value="{$obj_list_user[ui]->user_id}" {if $obj_list_user[ui]->user_id eq $obj_info.user_id}checked="true"{/if}>&nbsp;{$obj_list_user[ui]->user_fullname}</option>
                                    </div>
                                {/section}
                            </div>
                        </div>
                    {/if}
                    <div style="float:left; width:583px">
                        <div style="float:left; width:70px; line-height:25px; text-align:left">Phối hợp:</div>
                        <div style="float:left; width:480px; line-height:25px; text-align:left">
                            {section name=qi loop=$obj_list_depart}
                                <div style="float:left; width: 95px" title="{$obj_list_depart[qi]->department_name}">
                                    <input type="checkbox" name="department_ph_id_{$smarty.section.qi.index}" id="department_ph_id_{$smarty.section.qi.index}" value="{$obj_list_depart[qi]->department_id}" {if $obj_list_depart[qi]->department_id eq $obj_info.department_id}checked="true"{/if}>&nbsp;{$obj_list_depart[qi]->department_standfor}</option>
                                </div>
                            {/section}
                        </div>
                    </div>
                    <div style="float:left; width:70px; line-height:25px; text-align:left">Thời hạn <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:110px; line-height:25px; text-align:left">
                        <input type="text" class="text_time_callender" name="cv_log_date" id="cv_log_date" value="{if $obj_info.cv_log_date}{$obj_info.cv_log_date|date_format:'%d/%m/%Y'}{else}{$smarty.now|date_format:'%d/%m/%Y'}{/if}" readonly/>
                        <img src="../images/admin/img.gif"  align="absmiddle" id="icon_cv_log_date" style="cursor: pointer; border: 0" title="Chọn ngày trên lịch"/>
                        {literal}
                            <script type="text/javascript">
                                Calendar.setup({
                                    inputField   :   "cv_log_date",
                                    ifFormat     :   "%d/%m/%Y",
                                    button       :   "icon_cv_log_date",
                                    align        :   "Br",
                                    timeFormat   :   "24",
                                    showsTime    :   true,
                                    singleClick  :   true
                                });
                            </script>
                        {/literal}
                    </div>
                    <div style="float:left; width:400px; line-height:25px; text-align:left">
                        <input type="button" name="btnSub_Cv_log" id="btnSub_Cv_log" value="Ghi lại" class="button" />
                        <input type="hidden" name="cv_sub_id" id="cv_sub_id" value="{$cv_sub_id}">
                        <input type="hidden" name="cv_cat_id" id="cv_cat_id" value="{$cv_cat_id}">
                        <input type="hidden" name="cv_index_id" id="cv_index_id" value="{$cv_index_id}">
                        <input type="hidden" name="total_depart" id="total_depart" value="{$total_depart}">
                        <input type="hidden" name="cv_log_id" id="cv_log_id" value="{$cv_log_id}">
                        <input type="reset" name="Reset" value="Hủy bỏ" class="button" />
                        <i>({$access_user_fullname} tạo ngày {$smarty.now|date_format:'%d/%m/%Y'})</i>
                    </div>
                </td>
            </tr>
            {literal}
                <script language="javascript">
                    function hide_message_Cv_log(){
                        $('#lblMessage_Cv_log').hide();
                        $('#lblError_Cv_log').hide();
                    }

                    $(function() {
                        $('.error').hide();
                        $('#lblMessage_Cv_log').hide();

                        $("#btnSub_Cv_log").click(function() {
                            $('.error').hide();

                            var $form = $("#frmAdd_CvLog");
                            var cv_log_desc = $form.find('textarea#cv_log_desc').val();
                            var cv_log_note = $form.find('textarea#cv_log_note').val();
                            var cv_sub_id = $form.find('input#cv_sub_id').val();
                            var cv_cat_id = $form.find('input#cv_cat_id').val();
                            var cv_log_id = $form.find('input#cv_log_id').val();
                            var cv_log_date = $form.find('input#cv_log_date').val();

                            var total_depart = $form.find('input#total_depart').val();

                            var department_ph_id = new Array;
                            for(i=0; i<total_depart;i++) {
                                if ($('input#department_ph_id_'+i).is(':checked')) {
                                    department_ph_id[i]= $form.find('input#department_ph_id_'+i).val();
                                }else{
                                    department_ph_id[i]=0;
                                }
                            }

                            var user_id = new Array;
                            for(i=0; i<total_depart;i++) {
                                if ($('input#user_id_'+i).is(':checked')) {
                                    user_id[i]= $form.find('input#user_id_'+i).val();
                                }else{
                                    user_id[i]=0;
                                }
                            }

                            //begin validate form
                            if (cv_log_desc==""){
                                $('#lblError_Cv_log').show();
                            }
                            else{
                                var dataString  = "cv_log_desc=" + cv_log_desc;
                                dataString += "&cv_cat_id=" + cv_cat_id;
                                dataString += "&cv_sub_id=" + cv_sub_id;
                                dataString += "&cv_log_id=" + cv_log_id;
                                dataString += "&department_ph_id=" + department_ph_id;
                                dataString += "&user_id=" + user_id;
                                dataString += "&cv_log_note=" + cv_log_note;
                                dataString += "&cv_log_date=" + cv_log_date;
                                //alert (dataString);return false;
                                $.ajax({
                                    type: "POST",
                                    url: "index.php?addEditCvLogLd&mod=congviecs&add_edit=1",
                                    data: dataString,
                                    success: function(data) {
                                        $('#add_edit_cv_sub').hide();
                                        $('#cv_cat_content_main').fadeOut('fast').load('index.php?listCvCat&mod=congviecs&show_luong=1&cv_cat_id='+cv_cat_id).fadeIn("fast");
                                        $('#div_thanhcong').css({'display':'block','z-index':'2010'})
                                        tat_thongbao();diemnguoc(2);
                                    }
                                });
                                return false;
                            }
                            //end form
                        });
                    });
                </script>
            {/literal}
        </table>
    </fieldset>
    </form>
</div>