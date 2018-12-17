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
<div id="add_edit_kdl_content_insign">
	<form method="post" name="frmList_Kdl" action="?addEditKDL{$vars.arg}" id="frmList_Kdl">
    <!------------------------------------------THEM MOI------------------------------------>
    <fieldset style="width:523px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
        <legend class="legend_middle">Thêm danh mục dữ liệu:</legend>
    	<table width="98%" cellspacing="0" cellpadding="0" border="0" style="margin-left:5px">
            <tr height="20">
                <td colspan="2"> 
                	{if $error or $complete}
                	<span class="msg">Thông báo: <font color="#FF0000">{$error}</font>{$complete}</span>{/if}
            		<span id="lblError_Kdl" class="error">Thông báo: (*) là các mục bắt buộc!</span>
                </td>
            </tr>
            <tr height="30">
            	<td align="center" valign="top">
                	<div style="float:left; width:500px">
                        <div style="float:left; width:100px; line-height:25px; text-align:left">Tên danh mục <font color="#FF0000">*</font>:</div>
                        <div style="float:left; width:400px; line-height:25px; text-align:left">
                        <input type="text" name="kdl_name" id="kdl_name" class="text_long" value="{$obj_info.kdl_name}" onfocus="hide_message_Kdl()"/>
                        </div>
                    </div>
                    <div style="float:left; width:500px">
                        <div style="float:left; width:100px; line-height:25px; text-align:left">Người được xem:</div>
                        <div style="float:left; width:225px; line-height:25px; text-align:left">
                            <select name="kdl_type" id="kdl_type" class="select_middle" style="width:142px">
                                <option value="1" {if $obj_info.kdl_type eq 1}selected="selected"{/if}>Tất cả</option>
                                <option value="2" {if $obj_info.kdl_type eq 2}selected="selected"{/if}>Phòng ban</option>
                                <option value="3" {if $obj_info.kdl_type eq 3}selected="selected"{/if}>Cá nhân</option>
                            </select>
                        </div>
                        <div style="float:left; width:70px; line-height:25px; text-align:left">Ngày tháng:</div>
                        <div style="float:left; width:105px; line-height:25px; text-align:left">
                            {$smarty.now|date_format:'%d/%m/%Y'}
                        </div>
                    </div>
                </td>
            </tr>
            <tr height="30">
            	<td align="center">
                    <div style="float:left; width:500px">
                        <div style="float:left; width:100px; line-height:25px; text-align:left">Tình trạng:</div>
                        <div style="float:left; width:225px; line-height:25px; text-align:left">
                            {if $obj_info.kdl_active neq ''}
                            <div style="float:left; width:80px">
                            <input type="radio" id="kdl_active" name="kdl_active" value="1" {if $obj_info.kdl_active eq 1} checked="checked" {/if} />&nbsp;Hiển thị
                            </div>
                            <div style="float:left; width:110px">
                            <input type="radio" id="kdl_active" name="kdl_active" value="2" {if $obj_info.kdl_active eq 2} checked="checked" {/if} />&nbsp;Không hiển thị
                            </div>
                            {else}
                            <div style="float:left; width:80px">
                            <input type="radio" id="kdl_active" name="kdl_active" value="1" checked/>&nbsp;Hiển thị
                            </div>
                            <div style="float:left; width:110px">
                            <input type="radio" id="kdl_active" name="kdl_active" value="2" />&nbsp;Không hiển thị
                            </div>
                            {/if}
                        </div>
                        <div style="float:left; width:70px; line-height:25px; text-align:left">Người tạo:</div>
                        <div style="float:left; width:105px; line-height:25px; text-align:left">
                            {$access_user_fullname}
                        </div>
                    </div>
                </td>
            </tr>
            <tr height="30">
                <td align="left">
                <input type="button" name="btnSub_Kdl" id="btnSub_Kdl" value="Ghi lại" class="button" />
                <input type="hidden" name="kdl_id" id="kdl_id" value="{$obj_info.kdl_id}">
                <input type="reset" name="Reset" value="Hủy bỏ" class="button" />
                {literal}
				<script language="javascript">
					function hide_message_Kdl(){
						$('#lblMessage_Kdl').hide();
						$('#lblError_Kdl').hide();
					}
					
					$(function() {
					$('.error').hide();
					$('#lblMessage_Kdl').hide();
					 
					$("#btnSub_Kdl").click(function() {
						$('.error').hide();
						 
						var $form = $("#frmList_Kdl");
						var kdl_name = $form.find('input#kdl_name').val();
						var kdl_type = $form.find('select#kdl_type :selected').val();
						var kdl_active = $form.find('input#kdl_active:checked').val();
						var kdl_id = $form.find('input#kdl_id').val();
						//begin validate form
						if (kdl_name == ""){
							$('#lblError_Kdl').show();
						}
						else{
							var dataString  = "kdl_name=" + kdl_name;
								dataString += "&kdl_type=" + kdl_type;
								dataString += "&kdl_active=" + kdl_active;
								dataString += "&kdl_id=" + kdl_id +"";
								//alert (dataString);return false;
							$.ajax({
								type: "POST",
								url: "index.php?addEditKDL&mod=kdls&add_edit=1",
								data: dataString,
								success: function(data) {
									$('#add_edit_kdl').hide();
									$('#kdl_content_main').fadeOut('fast').load('index.php?listKDL_Chung&mod=kdls&kdl_type=' + kdl_type).fadeIn("fast");
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