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
    <fieldset style="width:398px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
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
                        	<textarea spellcheck="false" name="cv_log_desc" id="cv_log_desc" cols="30" rows="5" class="text_area_dongbo" style="height:54px">{$obj_info.cv_log_desc}</textarea>
                        </div>
                    </div>
                	<div style="float:left; width:383px">
                        <div style="float:left; width:70px; line-height:25px; text-align:left">Ghi chú:</div>
                        <div style="float:left; width:280px; line-height:25px; text-align:left">
                        	<textarea spellcheck="false" name="cv_log_note" id="cv_log_note" cols="30" rows="5" class="text_area_dongbo" style="height:53px">{$obj_info.cv_log_note}</textarea>
                        </div>
                    </div>
                </td>
            </tr>
            <tr height="30">
                <td align="left">
                <input type="button" name="btnSub_Cv_log" id="btnSub_Cv_log" value="Ghi lại" class="button" />
                <input type="hidden" name="cv_cat_id" id="cv_cat_id" value="{$cv_cat_id}">
                <input type="hidden" name="cv_index_id" id="cv_index_id" value="{$cv_index_id}">
                <input type="hidden" name="cv_log_id" id="cv_log_id" value="{$cv_log_id}">
                <input type="reset" name="Reset" value="Hủy bỏ" class="button" />
                <i>({$access_user_fullname} tạo ngày {$smarty.now|date_format:'%d/%m/%Y'})</i>
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
						var cv_cat_id = $form.find('input#cv_cat_id').val();
						var cv_log_id = $form.find('input#cv_log_id').val();
						var cv_index_id = $form.find('input#cv_index_id').val();
						//begin validate form
						if (cv_log_desc==""){
							$('#lblError_Cv_log').show();
						}
						else{
							var dataString  = "cv_log_desc=" + cv_log_desc;
								dataString += "&cv_cat_id=" + cv_cat_id;
								dataString += "&cv_index_id=" + cv_index_id;
								dataString += "&cv_log_id=" + cv_log_id;
								dataString += "&cv_log_note=" + cv_log_note +"";
								//alert (dataString);return false;
							$.ajax({
								type: "POST",
								url: "index.php?addEditCvLog&mod=congviecs&add_edit=1",
								data: dataString,
								success: function(data) {
									$('#add_edit_cv_cat').hide();
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
                </td>
            </tr>
        </table>
    </fieldset>
    </form>
</div>