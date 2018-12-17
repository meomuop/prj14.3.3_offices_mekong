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
<div id="add_edit_cv_sub_content_insign">
	<form method="post" name="frmAdd_CvSub" action="?addEditCvSub{$vars.arg}" id="frmAdd_CvSub">
    <!------------------------------------------THEM MOI------------------------------------>
    <fieldset style="width:595px; height: 295px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
        <legend class="legend" style="width:140px">Thêm/Sửa nhánh việc:</legend>
    	<table width="98%" cellspacing="0" cellpadding="0" border="0" style="margin-left:5px">
            <tr height="20">
                <td colspan="2"> 
                	{if $error or $complete}
                	<span class="msg">Thông báo: <font color="#FF0000">{$error}</font>{$complete}</span>{/if}
            		<span id="lblError_Cv_sub" class="error">Thông báo: (*) là các mục bắt buộc!</span>
                </td>
            </tr>
            <tr height="30">
            	<td align="center" valign="top">
                	<div style="float:left; width:583px">
                        <div style="float:left; width:80px; line-height:25px; text-align:left">Nhánh việc <font color="#FF0000">*</font>:</div>
                        <div style="float:left; width:490px; line-height:25px; text-align:left">
                        	<input type="text" name="cv_sub_name" id="cv_sub_name" class="text_long" style="width: 490px" value="{$obj_info.cv_sub_name}" onfocus="hide_message_Cv_sub()"/>
                        </div>
                    </div>
                    <div style="float:left; width:583px">
                        <div style="float:left; width:80px; line-height:25px; text-align:left">Ghi chú:</div>
                        <div style="float:left; width:490px; line-height:25px; text-align:left">
                            <input type="text" name="cv_sub_desc" id="cv_sub_desc" class="text_long" style="width: 490px" value="{$obj_info.cv_sub_desc}"/>
                        </div>
                    </div>
                    <!--{if $user_level eq 4}
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
                    {/if}-->
                    <div style="float:left; width:583px">
                        <div style="float:left; width:80px; line-height:25px; text-align:left">Chủ trì <font color="#FF0000">*</font>:</div>
                        <div style="float:left; width:490px; line-height:25px; text-align:left">
                            {section name=qi loop=$obj_list_depart}
                                <div style="float:left; width: 95px" title="{$obj_list_depart[qi]->department_name}">
                                    <input type="checkbox" name="department_id_{$smarty.section.qi.index}" id="department_id_{$smarty.section.qi.index}" value="{$obj_list_depart[qi]->department_id}" {if $obj_list_depart[qi]->department_id eq $obj_info.department_id}checked="true"{/if}>&nbsp;{$obj_list_depart[qi]->department_standfor}</option>
                                </div>
                            {/section}
                        </div>
                    </div>
                    <!--<div style="float:left; width:583px">
                        <div style="float:left; width:70px; line-height:25px; text-align:left">Phối hợp:</div>
                        <div style="float:left; width:480px; line-height:25px; text-align:left">
                            {section name=qi loop=$obj_list_depart}
                                <div style="float:left; width: 95px" title="{$obj_list_depart[qi]->department_name}">
                                    <input type="checkbox" name="department_ph_id_{$smarty.section.qi.index}" id="department_ph_id_{$smarty.section.qi.index}" value="{$obj_list_depart[qi]->department_id}" {if $obj_list_depart[qi]->department_id eq $obj_info.department_id}checked="true"{/if}>&nbsp;{$obj_list_depart[qi]->department_standfor}</option>
                                </div>
                            {/section}
                        </div>
                    </div>-->
                    <div style="float:left; width:583px">
                        <div style="float:left; width:80px; line-height:25px; text-align:left">Thời hạn <font color="#FF0000">*</font>:</div>
                        <div style="float:left; width:110px; line-height:25px; text-align:left">
                            <input type="text" class="text_time_callender" name="cv_sub_time_limit" id="cv_sub_time_limit" value="{if $obj_info.cv_sub_time_limit}{$obj_info.cv_sub_time_limit|date_format:'%d/%m/%Y'}{else}{$smarty.now|date_format:'%d/%m/%Y'}{/if}" readonly/>
                            <img src="../images/admin/img.gif"  align="absmiddle" id="icon_cv_sub_time_limit" style="cursor: pointer; border: 0" title="Chọn ngày trên lịch"/>
                            {literal}
                                <script type="text/javascript">
                                    Calendar.setup({
                                        inputField   :   "cv_sub_time_limit",
                                        ifFormat     :   "%d/%m/%Y",
                                        button       :   "icon_cv_sub_time_limit",
                                        align        :   "Br",
                                        timeFormat   :   "24",
                                        showsTime    :   true,
                                        singleClick  :   true
                                    });
                                </script>
                            {/literal}
                        </div>
                        <div style="float:left; width:380px; line-height:25px; text-align:left">
                            <input type="button" name="btnSub_Cv_sub" id="btnSub_Cv_sub" value="Ghi lại" class="button" />
                            <input type="hidden" name="cv_cat_id" id="cv_cat_id" value="{$cv_cat_id}">
                            <input type="hidden" name="cv_sub_id" id="cv_sub_id" value="{$obj_info.cv_sub_id}">
                            <input type="hidden" name="total_depart" id="total_depart" value="{$total_depart}">
                            <input type="reset" name="Reset" value="Hủy bỏ" class="button" /><br>
                            <i>({$access_user_fullname} tạo ngày {$smarty.now|date_format:'%d/%m/%Y'})</i>
                        </div>
                    </div>
                </td>
            </tr>
            {literal}
                <script language="javascript">
                    function hide_message_Cv_sub(){
                        $('#lblMessage_Cv_sub').hide();
                        $('#lblError_Cv_sub').hide();
                    }

                    $(function() {
                        $('.error').hide();
                        $('#lblMessage_Cv_sub').hide();

                        $("#btnSub_Cv_sub").click(function() {
                            $('.error').hide();

                            var $form = $("#frmAdd_CvSub");
                            var cv_sub_name = $form.find('input#cv_sub_name').val();
                            var cv_sub_desc = $form.find('input#cv_sub_desc').val();

                            var total_depart = $form.find('input#total_depart').val();

                            var department_id = new Array;
                            for(i=0; i<total_depart;i++) {
                                if ($('input#department_id_'+i).is(':checked')) {
                                    department_id[i]= $form.find('input#department_id_'+i).val();
                                }else{
                                    department_id[i]=0;
                                }
                            }

                            /*var department_ph_id = new Array;
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
                            }*/

                            var cv_sub_time_limit = $form.find('input#cv_sub_time_limit').val();
                            var cv_cat_id = $form.find('input#cv_cat_id').val();
                            var cv_sub_id = $form.find('input#cv_sub_id').val();

                            //begin validate form
                            if (cv_sub_name=="" || cv_sub_time_limit==""){
                                $('#lblError_Cv_sub').show();
                            }
                            else{
                                var dataString  = "cv_sub_name=" + cv_sub_name;
                                dataString += "&cv_sub_desc=" + cv_sub_desc;
                                dataString += "&cv_sub_time_limit=" + cv_sub_time_limit;
                                dataString += "&department_id=" + department_id;
                                //dataString += "&department_ph_id=" + department_ph_id;
                                //dataString += "&user_id=" + user_id;
                                dataString += "&cv_cat_id=" + cv_cat_id;
                                dataString += "&cv_sub_id=" + cv_sub_id +"";
                                //alert (dataString);return false;
                                $.ajax({
                                    type: "POST",
                                    url: "index.php?addEditCvSub&mod=congviecs&add_edit=1",
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