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
<div id="a_e_vttb_sub_content_insign">
	<form method="post" name="frmList_VttbSub" action="?addEditVTTBSub{$vars.arg}" id="frmList_VttbSub">
    <!------------------------------------------THEM MOI------------------------------------>
    <fieldset style="width:381px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
        <legend class="legend" style="width:120px">Thêm/sửa phụ mục:</legend>
    	<table width="98%" cellspacing="0" cellpadding="0" border="0" style="margin-left:5px">
            <tr height="20">
                <td colspan="2"> 
                	{if $error or $complete}
                	<span class="msg">Thông báo: <font color="#FF0000">{$error}</font>{$complete}</span>{/if}
            		<span id="lblError_VttbSub" class="error">Thông báo: (*) là các mục bắt buộc!</span>
                </td>
            </tr>
            <tr height="30">
            	<td align="center" valign="top">
                	<div style="float:left; width:360px">
                        <div style="float:left; width:90px; line-height:25px; text-align:left">Tên phụ mục <font color="#FF0000">*</font>:</div>
                        <div style="float:left; width:270px; line-height:25px; text-align:left">
                        <input type="text" name="vttb_sub_name" id="vttb_sub_name" class="text_middle_long" value="{$obj_info.vttb_sub_name}" onfocus="hide_message_Vttb()"/>
                        </div>
                    </div>
                    <div style="float:left; width:360px">
                        <div style="float:left; width:90px; line-height:25px; text-align:left">Ngày tạo:</div>
                        <div style="float:left; width:100px; line-height:25px; text-align:left">
                            {$smarty.now|date_format:'%d/%m/%Y'}
                        </div>
                        <div style="float:left; width:70px; line-height:25px; text-align:left">Người tạo:</div>
                        <div style="float:left; width:100px; line-height:25px; text-align:left">
                            {$access_user_fullname}
                        </div>
                    </div>
                </td>
            </tr>
            <tr height="30">
            	<td align="center">
                    <div style="float:left; width:360px">
                        <div style="float:left; width:90px; line-height:25px; text-align:left">Cách sử dụng:</div>
                        <div style="float:left; width:200px; line-height:25px; text-align:left">
                             <select name="vttb_sub_type" id="vttb_sub_type" class="select_middle" style="width:142px">
                                <option value="1" {if $obj_info.vttb_sub_type eq 1}selected="selected"{/if}>Chỉ định sử dụng</option>
                                <option value="2" {if $obj_info.vttb_sub_type eq 2}selected="selected"{/if}>Đặt lịch sử dụng</option>
                            </select>
                        </div>
                    </div>
                </td>
            </tr>
            <tr height="30">
            	<td align="center">
                    <div style="float:left; width:360px">
                        <div style="float:left; width:90px; line-height:25px; text-align:left">Tình trạng:</div>
                        <div style="float:left; width:200px; line-height:25px; text-align:left">
                            {if $obj_info.vttb_sub_active neq ''}
                            <div style="float:left; width:80px">
                            <input type="radio" id="vttb_sub_active" name="vttb_sub_active" value="1" {if $obj_info.vttb_sub_active eq 1} checked="checked" {/if} />&nbsp;Hiển thị
                            </div>
                            <div style="float:left; width:90px">
                            <input type="radio" id="vttb_sub_active" name="vttb_sub_active" value="2" {if $obj_info.vttb_sub_active eq 2} checked="checked" {/if} />&nbsp;Không hiển thị
                            </div>
                            {else}
                            <div style="float:left; width:80px">
                            <input type="radio" id="vttb_sub_active" name="vttb_sub_active" value="1" checked/>&nbsp;Hiển thị
                            </div>
                            <div style="float:left; width:90px">
                            <input type="radio" id="vttb_sub_active" name="vttb_sub_active" value="2" />&nbsp;Không hiển thị
                            </div>
                            {/if}
                        </div>
                    </div>
                </td>
            </tr>
            <tr height="30">
                <td align="left">
                <input type="button" name="btnSub_VttbSub" id="btnSub_VttbSub" value="Ghi lại" class="button" />
                <input type="hidden" name="vttb_cat_id" id="vttb_cat_id" value="{$vttb_cat_id}">
                <input type="hidden" name="vttb_sub_id" id="vttb_sub_id" value="{$obj_info.vttb_sub_id}">
                <input type="reset" name="Reset" value="Hủy bỏ" class="button" />
                {literal}
				<script language="javascript">
					function hide_message_Vttb(){
						$('#lblMessage_VttbSub').hide();
						$('#lblError_VttbSub').hide();
					}
					
					$(function() {
					$('.error').hide();
					$('#lblMessage_VttbSub').hide();
					 
					$("#btnSub_VttbSub").click(function() {
						$('.error').hide();
						 
						var $form = $("#frmList_VttbSub");
						var vttb_sub_name = $form.find('input#vttb_sub_name').val();
						var vttb_sub_type = $form.find('select#vttb_sub_type :selected').val();
						var vttb_sub_active = $form.find('input#vttb_sub_active:checked').val();
						var vttb_cat_id = $form.find('input#vttb_cat_id').val();
						var vttb_sub_id = $form.find('input#vttb_sub_id').val();
						//begin validate form
						if (vttb_sub_name == ""){
							$('#lblError_VttbSub').show();
						}
						else{
							var dataString  = "vttb_sub_name=" + vttb_sub_name;
								dataString += "&vttb_sub_type=" + vttb_sub_type;
								dataString += "&vttb_sub_active=" + vttb_sub_active;
								dataString += "&vttb_cat_id=" + vttb_cat_id +"";
								dataString += "&vttb_sub_id=" + vttb_sub_id +"";
								//alert (dataString);return false;
							$.ajax({
								type: "POST",
								url: "index.php?addEditVTTBSub&mod=vttbs&add_edit=1",
								data: dataString,
								success: function(data) {
									$('#a_e_vttbsub').hide();
									$('#vttb_content_main').fadeOut('fast').load('index.php?listVTTB_Chung&mod=vttbs').fadeIn("fast");
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