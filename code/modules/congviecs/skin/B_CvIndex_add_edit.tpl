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
<div id="add_edit_cv_index_content_insign">
	<form method="post" name="frmAdd_CvIndex" action="?addEditCvIndex{$vars.arg}" id="frmAdd_CvIndex">
    <!------------------------------------------THEM MOI------------------------------------>
    <fieldset style="width:398px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
        <legend class="legend" style="width:125px">Thêm/Sửa nhóm việc:</legend>
    	<table width="98%" cellspacing="0" cellpadding="0" border="0" style="margin-left:5px">
            <tr height="20">
                <td colspan="2"> 
                	{if $error or $complete}
                	<span class="msg">Thông báo: <font color="#FF0000">{$error}</font>{$complete}</span>{/if}
            		<span id="lblError_Cv_index" class="error">Thông báo: (*) là các mục bắt buộc!</span>
                </td>
            </tr>
            <tr height="30">
            	<td align="center" valign="top">
                	<div style="float:left; width:389px">
                        <div style="float:left; width:87px; line-height:25px; text-align:left">Giao việc cho <font color="#FF0000">*</font>:</div>
                        <div style="float:left; width:300px; border:1px solid #99bbe8; background-color: #ffffff; line-height:25px; height:125px; text-align:left; overflow-y:scroll">
                        	{section name=qi loop=$obj_list_user}
                            	<div style="float:left; width:136px; margin:2px">
                                <input type="checkbox" name="process_user" id="process_user" value="{$obj_list_user[qi]->user_id}">
                                {$obj_list_user[qi]->user_fullname}
                                </div>
                            {/section}
                        </div>
                    </div>
                </td>
            </tr>
            <tr height="30">
                <td align="left">
                <input type="button" name="btnSub_Cv_index" id="btnSub_Cv_index" value="Ghi lại" class="button" />
                <input type="hidden" name="cv_cat_id" id="cv_cat_id" value="{$cv_cat_id}">
                <input type="hidden" name="cv_sub_id" id="cv_sub_id" value="{$cv_sub_id}">
                <input type="hidden" name="user_cv_srt" id="user_cv_srt" value="">
                <input type="reset" name="Reset" value="Hủy bỏ" class="button" />
                <i>({$access_user_fullname} tạo ngày {$smarty.now|date_format:'%d/%m/%Y'})</i>
                {literal}
				<script language="javascript">
					function hide_message_Cv_index(){
						$('#lblMessage_Cv_index').hide();
						$('#lblError_Cv_index').hide();
					}
					
					$(function() {
					$('.error').hide();
					$('#lblMessage_Cv_index').hide();
					 
					$("#btnSub_Cv_index").click(function() {
						$('.error').hide();
						
						if (typeof document.frmAdd_CvIndex.process_user !== "undefined") {
							var user_cv_srt="";
							var user_rec_arr=document.frmAdd_CvIndex.elements.length;	
							user_rec_arr=(user_rec_arr>2)?document.frmAdd_CvIndex.process_user.length:0;
							if (user_rec_arr>0){
								for(var i=0;i<user_rec_arr;i++)
									if(document.frmAdd_CvIndex.process_user[i].checked==true)
										user_cv_srt+=document.frmAdd_CvIndex.process_user[i].value+",";
							}else{
								if(document.frmAdd_CvIndex.process_user.checked==true)
									user_cv_srt=document.frmAdd_CvIndex.process_user.value;
							}
							document.frmAdd_CvIndex.user_cv_srt.value=user_cv_srt;
						}
						
						var $form = $("#frmAdd_CvIndex");
						var process_user = $form.find('input#user_cv_srt').val();
						var cv_cat_id = $form.find('input#cv_cat_id').val();
						var cv_sub_id = $form.find('input#cv_sub_id').val();
						//begin validate form
						if (process_user==""){
							$('#lblError_Cv_index').show();
						}
						else{
							var dataString  = "process_user=" + process_user;
								dataString += "&cv_cat_id=" + cv_cat_id;
								dataString += "&cv_sub_id=" + cv_sub_id +"";
								//alert (dataString);return false;
							$.ajax({
								type: "POST",
								url: "index.php?addEditCvIndex&mod=congviecs&add_edit=1",
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