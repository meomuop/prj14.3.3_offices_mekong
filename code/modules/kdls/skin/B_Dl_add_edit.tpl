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
<div id="add_edit_dl_content_insign">
	<form method="post" name="frmList_Dl" action="?addEditDL{$vars.arg}" id="frmList_Dl">
    <!------------------------------------------THEM MOI------------------------------------>
    <fieldset style="width:523px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
        <legend class="legend_middle">Thêm danh mục dữ liệu:</legend>
    	<table width="98%" cellspacing="0" cellpadding="0" border="0" style="margin-left:5px">
            <tr height="20">
                <td colspan="2"> 
                	{if $error or $complete}
                	<span class="msg">Thông báo: <font color="#FF0000">{$error}</font>{$complete}</span>{/if}
            		<span id="lblError_Dl" class="error">Thông báo: (*) là các mục bắt buộc!</span>
                </td>
            </tr>
            <tr height="30">
            	<td align="center" valign="top">
                	<div style="float:left; width:500px">
                        <div style="float:left; width:90px; line-height:25px; text-align:left">Tên dữ liệu <font color="#FF0000">*</font>:</div>
                        <div style="float:left; width:400px; line-height:25px; text-align:left">
                        <input type="text" name="dl_name" id="dl_name" class="text_long" value="{$obj_info.dl_name}" onfocus="hide_message_Dl()"/>
                        </div>
                    </div>
                    <div style="float:left; width:500px">
                        <div style="float:left; width:90px; line-height:25px; text-align:left">Mô tả:</div>
                        <div style="float:left; width:400px; line-height:25px; text-align:left">
                            <input type="text" name="dl_note" id="dl_note" class="text_long" value="{$obj_info.dl_note}"/>
                        </div>
                    </div>
                </td>
            </tr>
            <tr height="30">
            	<td align="center">
                    <div style="float:left; width:500px">
                        <div style="float:left; width:90px; line-height:25px; text-align:left">Ngày tháng:</div>
                        <div style="float:left; width:200px; line-height:25px; text-align:left">
                            {$smarty.now|date_format:'%d/%m/%Y'}
                        </div>
                        <div style="float:left; width:70px; line-height:25px; text-align:left">Người tạo:</div>
                        <div style="float:left; width:120px; line-height:25px; text-align:left">
                            {$access_user_fullname}
                        </div>
                    </div>
                </td>
            </tr>
            <tr height="30">
                <td align="left">
                <input type="button" name="btnSub_Dl" id="btnSub_Dl" value="Ghi lại" class="button" />
                <input type="hidden" name="dl_id" id="dl_id" value="{$obj_info.dl_id}">
                <input type="hidden" name="dl_active" id="dl_active" value="{$obj_info.dl_active}">
                <input type="hidden" name="dl_file" id="dl_file" value="{$obj_info.dl_file}">
                <input type="hidden" name="kdl_id" id="kdl_id" value="{$kdl_id}">
                <input type="hidden" name="kdl_type" id="kdl_type" value="{$kdl_type}">
                <input type="reset" name="Reset" value="Hủy bỏ" class="button" />
                {literal}
				<script language="javascript">
					function hide_message_Dl(){
						$('#lblMessage_Dl').hide();
						$('#lblError_Dl').hide();
					}
					
					$(function() {
					$('.error').hide();
					$('#lblMessage_Dl').hide();
					 
					$("#btnSub_Dl").click(function() {
						$('.error').hide();
						 
						var $form = $("#frmList_Dl");
						var dl_name = $form.find('input#dl_name').val();
						var dl_note = $form.find('input#dl_note').val();
						var kdl_id = $form.find('input#kdl_id').val();
						var kdl_type = $form.find('input#kdl_type').val();
						
						var dl_id = $form.find('input#dl_id').val();
						var dl_active = $form.find('input#dl_active').val();
						var dl_file = $form.find('input#dl_file').val();
						//begin validate form
						if (dl_name == ""){
							$('#lblError_Dl').show();
						}
						else{
							var dataString  = "dl_name=" + dl_name;
								dataString += "&dl_note=" + dl_note;
								dataString += "&kdl_id=" + kdl_id;
								dataString += "&dl_id=" + dl_id ;
								dataString += "&dl_active=" + dl_active ;
								dataString += "&dl_file=" + dl_file ;
								//alert (dataString);return false;
							$.ajax({
								type: "POST",
								url: "index.php?addEditDL&mod=kdls&add_edit=1",
								data: dataString,
								success: function(data) {
									$('#add_edit_dl').hide();
									$('#kdl_content_main').fadeOut('fast').load('index.php?listKDL_Chung&mod=kdls&kdl_id='+kdl_id+'&kdl_type=' + kdl_type).fadeIn("fast");
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