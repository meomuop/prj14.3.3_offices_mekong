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
<div id="add_edit_cv_cat_content_insign">
	<form method="post" name="frmAdd_CvCat" action="?addEditCvCat{$vars.arg}" id="frmAdd_CvCat">
    <!------------------------------------------THEM MOI------------------------------------>
    <fieldset style="width:398px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
        <legend class="legend" style="width:125px">Thêm/Sửa đầu việc:</legend>
    	<table width="98%" cellspacing="0" cellpadding="0" border="0" style="margin-left:5px">
            <tr height="20">
                <td colspan="2"> 
                	{if $error or $complete}
                	<span class="msg">Thông báo: <font color="#FF0000">{$error}</font>{$complete}</span>{/if}
            		<span id="lblError_Cv_cat" class="error">Thông báo: (*) là các mục bắt buộc!</span>
                </td>
            </tr>
            <tr height="30">
            	<td align="center" valign="top">
                	<div style="float:left; width:383px">
                        <div style="float:left; width:70px; line-height:25px; text-align:left">Đầu việc <font color="#FF0000">*</font>:</div>
                        <div style="float:left; width:280px; line-height:25px; text-align:left">
                        	<input type="text" name="cv_cat_name" id="cv_cat_name" class="text_dongbo" value="{$obj_info.cv_cat_name}" onfocus="hide_message_Cv_cat()"/>
                        </div>
                    </div>
                    <div style="float:left; width:383px">
                        <div style="float:left; width:70px; line-height:25px; text-align:left">Mô tả <font color="#FF0000">*</font>:</div>
                        <div style="float:left; width:280px; line-height:25px; text-align:left">
                        	<textarea spellcheck="false" name="cv_cat_desc" id="cv_cat_desc" cols="30" rows="5" class="text_area_dongbo">{$obj_info.cv_cat_desc}</textarea>
                        </div>
                    </div>
                    <div style="float:left; width:383px">
                        <div style="float:left; width:70px; line-height:25px; text-align:left">Tình trạng:</div>
                        <div style="float:left; width:160px; line-height:25px; text-align:left">
                            {if $obj_info.cv_cat_active neq ''}
                            <div style="float:left; width:80px">
                            <input type="radio" id="cv_cat_active" name="cv_cat_active" value="1" {if $obj_info.cv_cat_active eq 1} checked="checked" {/if} />&nbsp;Thực hiện
                            </div>
                            <div style="float:left; width:60px">
                            <input type="radio" id="cv_cat_active" name="cv_cat_active" value="2" {if $obj_info.cv_cat_active eq 2} checked="checked" {/if} />&nbsp;Hủy
                            </div>
                            {else}
                            <div style="float:left; width:80px">
                            <input type="radio" id="cv_cat_active" name="cv_cat_active" value="1" checked/>&nbsp;Thực hiện
                            </div>
                            <div style="float:left; width:60px">
                            <input type="radio" id="cv_cat_active" name="cv_cat_active" value="2" />&nbsp;Hủy
                            </div>
                            {/if}
                        </div>
                        <div style="float:left; width:70px; line-height:25px; text-align:left">Ngày tháng:</div>
                        <div style="float:left; width:70px; line-height:25px; text-align:left">
                            {$smarty.now|date_format:'%d/%m/%Y'}
                        </div>
                    </div>
                </td>
            </tr>
            <tr height="30">
                <td align="left">
                <input type="button" name="btnSub_Cv_cat" id="btnSub_Cv_cat" value="Ghi lại" class="button" />
                <input type="hidden" name="cv_cat_id" id="cv_cat_id" value="{$obj_info.cv_cat_id}">
                <input type="reset" name="Reset" value="Hủy bỏ" class="button" />
                <i>(Người tạo: {$access_user_fullname})</i>
                {literal}
				<script language="javascript">
					function hide_message_Cv_cat(){
						$('#lblMessage_Cv_cat').hide();
						$('#lblError_Cv_cat').hide();
					}
					
					$(function() {
					$('.error').hide();
					$('#lblMessage_Cv_cat').hide();
					 
					$("#btnSub_Cv_cat").click(function() {
						$('.error').hide();
						
						var $form = $("#frmAdd_CvCat");
						var cv_cat_name = $form.find('input#cv_cat_name').val();
						var cv_cat_desc = $form.find('textarea#cv_cat_desc').val();
						var cv_cat_active = $form.find('input#cv_cat_active:checked').val();
						var cv_cat_id = $form.find('input#cv_cat_id').val();
						//begin validate form
						if (cv_cat_name == ""){
							$('#lblError_Cv_cat').show();
						}
						else{
							var dataString  = "cv_cat_name=" + cv_cat_name;
								dataString += "&cv_cat_desc=" + cv_cat_desc;
								dataString += "&cv_cat_active=" + cv_cat_active;
								dataString += "&cv_cat_id=" + cv_cat_id +"";
								//alert (dataString);return false;
							$.ajax({
								type: "POST",
								url: "index.php?addEditCvCat&mod=congviecs&add_edit=1",
								data: dataString,
								success: function(data) {
									$('#add_edit_cv_cat').hide();
									$('#cv_cat_content_main').fadeOut('fast').load('index.php?listCvCat&mod=congviecs').fadeIn("fast");
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