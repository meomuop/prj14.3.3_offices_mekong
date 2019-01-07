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
<div id="user_content_insign">
	<form method="post" name="frmList_User" action="?listUser{$vars.arg}" id="frmList_User">
    <!------------------------------------------THEM MOI------------------------------------>
    <fieldset style="width:837px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:225px">
    <legend class="legend_list">
    	Thêm/Chỉnh sửa
    	&nbsp;|&nbsp;Thông báo:&nbsp;<span id="lblError" class="error">Dấu (*) là các mục bắt buộc!</span>
    </legend>
    		<div style="float:left; width:100%; height:2px"></div>
 	    	<div style="float:left; width:170px; margin-left:5px">
                <div style="float:left; width:100%; height:150px; text-align:center">
                <a href="javascript:void(0)" onClick="doUploadPic('?uploadPic&id=user_image&thumbid=thumbImg&dir=userimg');">
                <div style="float:left; width:98px; height:140px; line-height:25px;border:1px solid #99bbe8; margin:5px 0 0 31px" id="image_hoso">
                <img align="absmiddle" src="../{$obj_info.user_image}" width="98" height="140" alt="Tải ảnh"/>
                </div>
                </a>
                <input name="user_image" id="user_image" type="hidden" class="text_short" value="{$obj_info.user_image}" readonly />
                </div>
                <div style="float:left; width:35%; line-height:25px; text-align:left">Trạng thái:</div>
                <div style="float:left; width:65%; line-height:25px; text-align:left">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        {if $obj_info.user_active neq ''}
                        <td width="40%">
                        <input type="radio" id="user_active" name="user_active" value="1" {if $obj_info.user_active eq 1} checked="checked" {/if} />&nbsp;Mở</td>
                        <td>
                        <input type="radio" id="user_active" name="user_active" value="2" {if $obj_info.user_active eq 2} checked="checked" {/if} />&nbsp;Khóa</td>
                        {else}
                        <td width="40%">
                        <input type="radio" id="user_active" name="user_active" value="1" checked/>&nbsp;Mở</td>
                        <td>
                        <input type="radio" id="user_active" name="user_active" value="2" />&nbsp;Khóa</td>
                        {/if}
                      </tr>
                    </table>
                </div>
                <div style="float:left; width:100%; line-height:25px; text-align:center">
                	<input type="button" name="btnSub" id="btnSub" value="Ghi lại" class="button_red" style="margin:0 0 0 12px" />
                    <input type="hidden" name="user_id" id="user_id" value="{$obj_info.user_id}">
                    <input type="hidden" name="user_mucluong" id="user_mucluong" value="{$obj_info.user_mucluong}">
                    <input type="hidden" name="user_phucap" id="user_phucap" value="{$obj_info.user_phucap}">
               	</div>
            </div>
            <div style="float:left; width:275px">
                <div style="float:left; width:40%; line-height:25px; text-align:left">Họ tên đầy đủ <font color="#FF0000">*</font>:</div>
                <div style="float:left; width:60%; line-height:25px; text-align:left">
                <input type="text" id="user_fullname" name="user_fullname" class="text_middle" style="width:140px" value="{$obj_info.user_fullname}" onfocus="hide_message()"/>
                </div>
                <div style="float:left; width:40%; line-height:25px; text-align:left">Thuộc phòng/ban <font color="#FF0000">*</font>:</div>
                <div style="float:left; width:60%; line-height:25px; text-align:left">
                <select name="unit_id" id="unit_id" class="select_middle" style="width:148px">
                    <option value="0">Chọn phòng ban</option>
                    {section name=qi loop=$obj_list_department}
                    <option value="{$obj_list_department[qi]->department_id}" {if $obj_list_department[qi]->department_id eq $obj_info.unit_id}selected="selected"{/if}>-&nbsp;{$obj_list_department[qi]->department_name}</option>
                    {/section}
                </select>
                </div>
                <div style="float:left; width:100%; line-height:25px; text-align:left">Phụ trách (các) phòng/ban <font color="#FF0000">*</font>:</div>
                <div style="float:left; width:100%; height:100px; text-align:left">
                    <div style="float:left; width:256px; height:90px; text-align:left; overflow-y:scroll; background-color:#FFF; border:1px solid #99bbe8">
                    	{if $obj_info.department_id neq ''}
                            {section name=qi loop=$obj_list_depa_se}
                            <div style="float:left; width:220px; margin:1px">
                            <input type="checkbox" name="department_id" value="{$obj_list_depa_se[qi]->department_id}" checked>&nbsp;{$obj_list_depa_se[qi]->department_name}
                            </div>
                            {/section}
                            {section name=qi loop=$obj_list_depa_unse}
                            <div style="float:left; width:220px; margin:1px">
                            <input type="checkbox" name="department_id" value="{$obj_list_depa_unse[qi]->department_id}">&nbsp;{$obj_list_depa_unse[qi]->department_name}
                            </div>
                            {/section}
                        {else}
                            {section name=di loop=$obj_list_department}
                            <div style="float:left; width:220px; margin:1px">
                            <input type="checkbox" id="department_id" name="department_id" value="{$obj_list_department[di]->department_id}" {if $obj_list_department[di]->department_id eq $obj_info.department_id}checked{/if}>&nbsp;{$obj_list_department[di]->department_name}
                            </div>
                            {/section}
                        {/if}
                    </div>
                    <input type="hidden" name="depart_str" id="depart_str" value="">
                </div>
                <div style="float:left; width:40%; line-height:25px; text-align:left">Chức vụ hiện tại <font color="#FF0000">*</font>:</div>
                <div style="float:left; width:60%; line-height:25px; text-align:left">
                    <select name="object_id" id="object_id" class="select_middle" style="width:148px">
                        <option value="0">Chọn chức vụ</option>
                        {section name=qi loop=$obj_list_object}
                        <option value="{$obj_list_object[qi]->object_id}" {if $obj_list_object[qi]->object_id eq $obj_info.object_id}selected="selected"{/if}>-&nbsp;{$obj_list_object[qi]->object_name}</option>
                        {/section}
                    </select>
                </div>
            </div>
            <div style="float:left; width:380px">
                <div style="float:left; width:20%; line-height:25px; text-align:left">Đăng nhập <font color="#FF0000">*</font>:</div>
                <div style="float:left; width:32%; line-height:25px; text-align:left">
                <input type="text" id="user_name" name="user_name" class="text_short" value="{$obj_info.user_name}" onfocus="hide_message()"/>
                </div>
                <div style="float:left; width:19%; line-height:25px; text-align:left">Mật khẩu <font color="#FF0000">*</font>:</div>
                <div style="float:left; width:29%; line-height:25px; text-align:left">
                <input type="password" id="user_pass" name="user_pass" class="text_short" value="{$obj_info.user_encode_pass}" onfocus="hide_message()"/>
                </div>
                <div style="float:left; width:20%; line-height:25px; text-align:left">Điện thoại <font color="#FF0000">*</font>:</div>
                <div style="float:left; width:32%; line-height:25px; text-align:left">
                <input type="text" id="user_phone" name="user_phone" class="text_short" value="{$obj_info.user_phone}" onfocus="hide_message()"/>
                </div>
                <div style="float:left; width:19%; line-height:25px; text-align:left">Email <font color="#FF0000">*</font>:</div>
                <div style="float:left; width:29%; line-height:25px; text-align:left">
                <input type="text" id="user_email" name="user_email" class="text_short" value="{$obj_info.user_email}" onfocus="hide_message()"/>
                </div>
                <div style="float:left; width:20%; line-height:25px; text-align:left">Trình độ <font color="#FF0000">*</font>:</div>
                <div style="float:left; width:32%; line-height:25px; text-align:left">
                    <select name="trinhdo_id" id="trinhdo_id" class="select_short">
                        <option value="0">Chọn trình độ</option>
                        {section name=qi loop=$obj_list_trinhdo}
                        <option value="{$obj_list_trinhdo[qi]->trinhdo_id}" {if $obj_list_trinhdo[qi]->trinhdo_id eq $obj_info.trinhdo_id}selected="selected"{/if}>-&nbsp;{$obj_list_trinhdo[qi]->trinhdo_name}</option>
                        {/section}
                    </select>
                </div>
                <div style="float:left; width:19%; line-height:25px; text-align:left">Ngày nhập <font color="#FF0000">*</font>:</div>
                <div style="float:left; width:29%; text-align:left; margin-top:2px; margin-bottom:4px">
                	<div style="float:left; width:100px; border:1px solid #99bbe8; background-color:#FFF">
                    	<input type="text" id="user_nbd_1" name="user_nbd_1" class="text_date" value="{$obj_info.user_ngay_bat_dau|date_format:'%d'}" onfocus="hide_message()" maxlength="2"/>/
                        <input type="text" id="user_nbd_2" name="user_nbd_2" class="text_month" value="{$obj_info.user_ngay_bat_dau|date_format:'%m'}" onfocus="hide_message()" maxlength="2"/>/
                        <input type="text" id="user_nbd_3" name="user_nbd_3" class="text_year" value="{$obj_info.user_ngay_bat_dau|date_format:'%Y'}" onfocus="hide_message()" maxlength="4"/>
                    </div>
                </div>
                <div style="float:left; width:20%; line-height:25px; text-align:left">SMS <font color="#FF0000">*</font>:</div>
                <div style="float:left; width:32%; line-height:25px; text-align:left">
                    <select name="per_sms" id="per_sms" class="select_short">
                        <option value="0">Không thao tác</option>
                        <option value="1" {if $obj_info.per_sms eq 1} selected="selected"{/if}>Gửi tin</option>
                        <option value="2" {if $obj_info.per_sms eq 2} selected="selected"{/if}>Nhận tin</option>
                        <option value="3" {if $obj_info.per_sms eq 3} selected="selected"{/if}>Cả hai</option>
                    </select>
                </div>
                <div style="float:left; width:19%; line-height:25px; text-align:left; display: none">Thao tác <font color="#FF0000">*</font>:</div>
                <div style="float:left; width:29%; line-height:25px; text-align:left; display: none">
                    <select name="user_level_soft" id="user_level_soft" class="select_short">
                        <option value="1" {if $obj_info.user_level_soft eq 1} selected="selected"{/if}>Truyền nhận VB</option>
                        <option value="2" {if $obj_info.user_level_soft eq 2} selected="selected"{/if}>Quản lý - điều hành</option>
                        <option value="3" {if $obj_info.user_level_soft eq 3} selected="selected"{/if} selected="selected">Cả hai</option>
                    </select>
                </div>
                <div style="float:left; width:100%; line-height:25px; text-align:left">Phân quyền tại Quản lý văn bản, hợp đồng, công việc:</div>
                <div style="float:left; width:100%; line-height:25px; text-align:left">
                    <select name="user_level" id="user_level" class="select_long">
                        <option value="1" {if $obj_info.user_level eq 1} selected="selected"{/if}>Quản trị&nbsp;<em>(Được thao tác tại mọi chức năng)</em></option>
                        <option value="2" {if $obj_info.user_level eq 2} selected="selected"{/if}>Văn thư&nbsp;<em>(Nhập văn bản và tạo ra các thuộc tính văn bản)</em></option>
                        <option value="3" {if $obj_info.user_level eq 3} selected="selected"{/if}>Trợ lý&nbsp;<em>(Xem nội dung và chuyển tiếp văn bản, theo dõi văn bản dự thảo)</em></option>
                        <option value="4" {if $obj_info.user_level eq 4} selected="selected"{/if}>Giám đốc&nbsp;<em>(Xem toàn bộ VB, chỉ đạo giải quyết với văn bản của mình)</em></option>
                        <option value="5" {if $obj_info.user_level eq 5} selected="selected"{/if}>Phó giám đốc&nbsp;<em>(Xem VB của mình, chỉ đạo giải quyết)</em></option>
                        <option value="6" {if $obj_info.user_level eq 6} selected="selected"{/if}>Trưởng phòng và tương đương&nbsp;<em>(Xem VB của mình, chỉ đạo giải quyết hoặc tự giải quyết)</em></option>
                        <option value="7" {if $obj_info.user_level eq 7} selected="selected"{/if}>Phó phòng và tương đương&nbsp;<em>(Xem VB của mình, chỉ đạo giải quyết hoặc tự giải quyết)</em></option>
                        <option value="8" {if $obj_info.user_level eq 8} selected="selected"{/if}>Nhân viên&nbsp;<em>(Giải quyết văn bản)</em></option>
                        <option value="10" {if $obj_info.user_level eq 10} selected="selected"{/if}>Văn thư phòng&nbsp;<em>(Theo dõi và cập nhật trạng thái văn bản  phòng)</em></option>
                    </select>
                </div>
                <div style="float:left; width:100%; line-height:25px; text-align:left; display: none">Quyền tại Module Truyền nhận văn bản:</div>
                <div style="float:left; width:100%; line-height:25px; text-align:left; display: none">
                    <select name="user_level_tnvb" id="user_level_tnvb" class="select_long">
                        <option value="1" {if $obj_info.user_level_tnvb eq 1} selected="selected"{/if}>Quản trị&nbsp;<em>(Được thao tác tại mọi chức năng)</em></option>
                        <option value="2" {if $obj_info.user_level_tnvb eq 2} selected="selected"{/if}>Văn thư (Người dùng + liên kết dữ liệu từ Quản lý - điều hành)</option>
                        <option value="3" {if $obj_info.user_level_tnvb eq 3} selected="selected"{/if} selected="selected">Người dùng</option>
                    </select>
                </div>
                <div style="width:100px; height:20px; position:absolute; margin:178px 0 0 387px; border:1px solid #99bbe8; background-color:#dfe8f6; border-left:1px solid #dfe8f6 ">
                	<a href="javascript: void(0);" onClick="show_hide_user()" style="text-decoration:none; color:#F00">
                    <div style="line-height:20px; margin-bottom:2px; float:left"><u>Thông tin thêm</u></div>
            		&nbsp;<img src="{$css_path}icon_keo_dai.png" class="img_all"></a>
            	</div>
            </div>
            <div style="float:left; width:160px; margin-left:5px">&nbsp;</div>
            <div style="float:left; width:235px">&nbsp;</div>
            <div style="float: left; width: 402px; background-color: rgb(223, 232, 246); border-color: currentcolor rgb(153, 187, 232) rgb(153, 187, 232); border-style: none solid solid; border-width: medium 1px 1px; border-image: none 100% / 1 / 0 stretch; position: absolute; margin: 204px 0px 0px 434px;" id="thong_tin_them">
                <div style="float:left; width:380px; margin-left:15px">
                    
                    <div style="float:left; width:20%; line-height:25px; text-align:left">Ngày sinh:</div>
                    <div style="float:left; width:33.5%; text-align:left; margin-top:2px; margin-bottom:4px">
                        <div style="float:left; width:100px; border:1px solid #99bbe8; background-color:#FFF">
                            <input type="text" id="user_ns_1" name="user_ns_1" class="text_date" value="{$obj_info.user_ngay_sinh|date_format:'%d'}" onfocus="hide_message()" maxlength="2"/>/
                            <input type="text" id="user_ns_2" name="user_ns_2" class="text_month" value="{$obj_info.user_ngay_sinh|date_format:'%m'}" onfocus="hide_message()" maxlength="2"/>/
                            <input type="text" id="user_ns_3" name="user_ns_3" class="text_year" value="{$obj_info.user_ngay_sinh|date_format:'%Y'}" onfocus="hide_message()" maxlength="4"/>
                        </div>
                    </div>
                    <div style="float:left; width:18%; line-height:25px; text-align:left">Giới tính:</div>
                    <div style="float:left; width:28.5%; line-height:25px; text-align:left">
                        <select name="user_sex" id="user_sex" class="select_short">
                            <option value="1" {if $obj_info.user_sex eq 1} selected="selected"{/if}>Nam</option>
                            <option value="2" {if $obj_info.user_sex eq 2} selected="selected"{/if}>Nữ</option>
                        </select>
                    </div>
                    <div style="float:left; width:20%; line-height:25px; text-align:left">Nơi sinh:</div>
                    <div style="float:left; width:80%; line-height:25px">
                        <input type="text" id="user_noi_sinh" name="user_noi_sinh" class="text_middle" value="{$obj_info.user_noi_sinh}" onfocus="hide_message()" style="width:290px"/>
                    </div>
                    <div style="float:left; width:20%; line-height:25px; text-align:left">Số CMND:</div>
                    <div style="float:left; width:33.5%; line-height:25px">
                        <input type="text" id="user_cmnd" name="user_cmnd" class="text_short" value="{$obj_info.user_cmnd}" onfocus="hide_message()"/>
                    </div>
                    <div style="float:left; width:18%; line-height:25px; text-align:left">Ngày cấp:</div>
                    <div style="float:left; width:28.5%; text-align:left; margin-top:2px; margin-bottom:4px">
                        <div style="float:left; width:100px; border:1px solid #99bbe8; background-color:#FFF">
                            <input type="text" id="user_nc_1" name="user_nc_1" class="text_date" value="{$obj_info.user_ngay_cap|date_format:'%d'}" onfocus="hide_message()" maxlength="2"/>/
                            <input type="text" id="user_nc_2" name="user_nnc_2" class="text_month" value="{$obj_info.user_ngay_cap|date_format:'%m'}" onfocus="hide_message()" maxlength="2"/>/
                            <input type="text" id="user_nc_3" name="user_nc_3" class="text_year" value="{$obj_info.user_ngay_cap|date_format:'%Y'}" onfocus="hide_message()" maxlength="4"/>
                        </div>
                    </div>
                    <div style="float:left; width:20%; line-height:25px; text-align:left">Nơi cấp:</div>
                    <div style="float:left; width:80%; line-height:25px">
                        <input type="text" id="user_noi_cap" name="user_noi_cap" class="text_middle" value="{$obj_info.user_noi_cap}" onfocus="hide_message()" style="width:290px"/>
                    </div>
                    <div style="float:left; width:20%; line-height:25px; text-align:left">Số tài khoản:</div>
                    <div style="float:left; width:33.5%; line-height:25px">
                        <input type="text" id="user_so_tai_khoan" name="user_so_tai_khoan" class="text_short" value="{$obj_info.user_so_tai_khoan}" onfocus="hide_message()"/>
                    </div>
                    <div style="float:left; width:18%; line-height:25px; text-align:left">Ngân hàng:</div>
                    <div style="float:left; width:28.5%; text-align:left; margin-top:2px; margin-bottom:4px">
                        <input type="text" id="user_ngan_hang" name="user_ngan_hang" class="text_short" value="{$obj_info.user_ngan_hang}" onfocus="hide_message()"/>
                    </div>
                    <div style="float:left; width:20%; line-height:25px; text-align:left">Thường trú:</div>
                    <div style="float:left; width:80%; line-height:25px">
                        <input type="text" id="user_thuong_tru" name="user_thuong_tru" class="text_middle" value="{$obj_info.user_thuong_tru}" onfocus="hide_message()" style="width:290px"/>
                    </div>
                    <div style="float:left; width:20%; line-height:25px; text-align:left">Đ/c hiện tại:</div>
                    <div style="float:left; width:80%; line-height:25px">
                        <input type="text" id="user_tam_tru" name="user_tam_tru" class="text_middle" value="{$obj_info.user_tam_tru}" onfocus="hide_message()" style="width:290px"/>
                    </div>
                    
                </div>
            </div>
            {literal}
			<script language="javascript">
                function hide_message(){
                    $('#lblMessage').hide();
                    $('#lblError').hide();
                }
                
                $(function() {
                $('.error').hide();
                $('#lblMessage').hide();
                 
                $("#btnSub").click(function() {
                    $('.error').hide();
                     
					var depart_str="";
					var de_arr=document.frmList_User.elements.length;				
					de_arr=(de_arr>2)?document.frmList_User.department_id.length:0;
					if (de_arr>0){
						for(var i=0;i<de_arr;i++)
							if(document.frmList_User.department_id[i].checked==true)
								depart_str+=document.frmList_User.department_id[i].value+",";
					}else{
						if(document.frmList_User.department_id.checked==true)
							depart_str=document.frmList_User.department_id.value;
					}
					document.frmList_User.depart_str.value=depart_str;
					
                    var $form = $("#frmList_User");
                    var department_id = $form.find('input#depart_str').val();
					var unit_id = $form.find('select#unit_id :selected').val();
					var object_id = $form.find('select#object_id :selected').val();
					var user_fullname = $form.find('input#user_fullname').val();
					var user_name = $form.find('input#user_name').val();
					var user_pass = $form.find('input#user_pass').val();
					var user_phone = $form.find('input#user_phone').val();
					var user_email = $form.find('input#user_email').val();
					var trinhdo_id = $form.find('select#trinhdo_id :selected').val();
					var user_nn_1 = $form.find('input#user_nn_1').val();
					var user_nn_2 = $form.find('input#user_nn_2').val();
					var user_nn_3 = $form.find('input#user_nn_3').val();
					var user_email = $form.find('input#user_email').val();
					var user_image = $form.find('input#user_image').val();
					var user_sex = $form.find('select#user_sex :selected').val();
					var user_ns_1 = $form.find('input#user_ns_1').val();
					var user_ns_2 = $form.find('input#user_ns_2').val();
					var user_ns_3 = $form.find('input#user_ns_3').val();
					var user_noi_sinh = $form.find('input#user_noi_sinh').val();
					var user_thuong_tru = $form.find('input#user_thuong_tru').val();
					var user_tam_tru = $form.find('input#user_tam_tru').val();
					var user_id = $form.find('select#user_id :selected').val();
					var user_cmnd = $form.find('input#user_cmnd').val();
					var user_nc_1 = $form.find('input#user_nc_1').val();
					var user_nc_2 = $form.find('input#user_nc_2').val();
					var user_nc_3 = $form.find('input#user_nc_3').val();
					var user_noi_cap = $form.find('input#user_noi_cap').val();
					var user_nbd_1 = $form.find('input#user_nbd_1').val();
					var user_nbd_2 = $form.find('input#user_nbd_2').val();
					var user_nbd_3 = $form.find('input#user_nbd_3').val();
					var user_so_tai_khoan = $form.find('input#user_so_tai_khoan').val();
					var user_ngan_hang = $form.find('input#user_ngan_hang').val();
                    var user_active = $form.find('input#user_active:checked').val();
					var per_sms = $form.find('select#per_sms :selected').val();
					var user_level = $form.find('select#user_level :selected').val();
					var user_level_tnvb = $form.find('select#user_level_tnvb :selected').val();
					var user_level_soft = $form.find('select#user_level_soft :selected').val();
                    var user_mucluong = $form.find('input#user_mucluong').val();
                    var user_phucap = $form.find('input#user_phucap').val();
                    var user_id = $form.find('input#user_id').val();
                     
                    //begin validate form
                    if (department_id=="" || unit_id==0 || object_id==0 || user_name=="" || user_pass=="" || user_phone=="" || user_email=="" || trinhdo_id==0 || user_nn_1=="" || user_nn_2=="" || user_nn_3==""){
                        $('#lblError').show();
                    }
                    else{
                        var dataString  = "department_id=" + department_id;
							dataString += "&unit_id=" + unit_id;
							dataString += "&object_id=" + object_id;
							dataString += "&user_fullname=" + user_fullname;
							dataString += "&user_name=" + user_name;
							dataString += "&user_pass=" + user_pass;
							dataString += "&user_phone=" + user_phone;
							dataString += "&user_email=" + user_email;
							dataString += "&trinhdo_id=" + trinhdo_id;
							dataString += "&user_ngay_bat_dau" + user_nn_3+'-'+user_nn_2+'-'+user_nn_1;
							dataString += "&user_image=" + user_image;
							dataString += "&user_sex=" + user_sex;
							dataString += "&user_ngay_sinh=" + user_ns_3+'-'+user_ns_2+'-'+user_ns_1;
							dataString += "&user_noi_sinh=" + user_noi_sinh;
							dataString += "&user_thuong_tru=" + user_thuong_tru;
							dataString += "&user_tam_tru=" + user_tam_tru;
							dataString += "&user_id=" + user_id;
							dataString += "&user_cmnd=" + user_cmnd;
							dataString += "&user_ngay_cap=" + user_nc_3+'-'+user_nc_2+'-'+user_nc_1;
							dataString += "&user_noi_cap=" + user_noi_cap;
							dataString += "&user_ngay_bat_dau=" + user_nbd_3+'-'+user_nbd_2+'-'+user_nbd_1;
							dataString += "&user_so_tai_khoan=" + user_so_tai_khoan;
							dataString += "&user_ngan_hang=" + user_ngan_hang;
							dataString += "&per_sms=" + per_sms;
							dataString += "&user_level=" + user_level;
							dataString += "&user_level_tnvb=" + user_level_tnvb;
							dataString += "&user_level_soft=" + user_level_soft;
                            dataString += "&user_active=" + user_active;
                            dataString += "&user_mucluong=" + user_mucluong +"";
                            dataString += "&user_phucap=" + user_phucap +"";
                            dataString += "&user_id=" + user_id +"";
                            //alert (dataString);return false;
                        $.ajax({
                            type: "POST",
                            url: "index.php?listUser&mod=users&add_edit=1",
                            data: dataString,
                            success: function(data) {
                                $('#user_content_main').fadeOut('fast').load('index.php?listUser&mod=users').fadeIn("fast");
                                $('#lblMessage').show();
                            }
                        });
                        return false;
                    }
                    //end form
                });
            });
            </script>
            {/literal}
    </fieldset>
    
    <!------------------------------------DANH SACH---------------------------------------------->
    <fieldset style="width:828px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:180px">
    <legend class="legend_list" style="width:700px">
        <div style="width:130px; float:left">Danh sách: {$total_num_result}</div>
        <div style="width:70px; float:left">&nbsp;|&nbsp;Tìm kiếm&nbsp;</div>
        <div style="width:450px; float:left">
        	<input type="text" name="keyword" id="keyword" class="text_seek" value="{$vars.keyword}"/>
            <select name="department_id_fs" id="department_id_fs" class="select_middle">
                <option value="0">Chọn phòng/ban</option>
                {section name=qi loop=$obj_list_department}
                <option value="{$obj_list_department[qi]->department_id}" {if $obj_list_department[qi]->department_id eq $department_id}selected="selected"{/if}>-&nbsp;{$obj_list_department[qi]->department_name}</option>
                {/section}
            </select>
            <select name="object_id_fs" id="object_id_fs" class="select_middle">
                <option value="0">Chọn chức vụ</option>
                {section name=qi loop=$obj_list_object}
                <option value="{$obj_list_object[qi]->object_id}" {if $obj_list_object[qi]->object_id eq $object_id}selected="selected"{/if}>-&nbsp;{$obj_list_object[qi]->object_name}</option>
                {/section}
            </select>
            <input type="hidden" id="processurl" value="{$processurl}" />
        </div>
        <div style="width:50px; float:left">
        	<input type="button" name="btnSeek" id="btnSeek" value="Tìm >>" class="button_seek" onclick="search_me_User()" /></div>
    </legend>
    	<div style="float:left; height:5px; width:100%"></div>
        <div style="float:left; height:25px; width:817px; border-top:1px solid #99bbe8; border-bottom:1px solid #99bbe8 ">
            <div class="tbl_tit" style="width:30px; text-align:center"><b>STT</b></div>	
            <div class="tbl_tit" style="width:130px"><B>&nbsp;Họ tên</B></div>
            <div class="tbl_tit" style="width:120px"><B>&nbsp;Quyền hạn</B></div>
            <div class="tbl_tit" style="width:80px"><B>&nbsp;Điện thoại</B></div>
            <div class="tbl_tit" style="width:161px"><B>&nbsp;Email</B></div>
            <div class="tbl_tit" style="width:70px"><B>&nbsp;Ngày nhập</B></div>
            <div class="tbl_tit" style="width:59px; text-align:center"><B>Sắp xếp</B></div>
            <div class="tbl_tit" style="width:59px; text-align:center"><B>Hiển thị</B></div>
            <div class="tbl_tit" style="width:59px; text-align:center"><B>Chọn</B></div>
            <div class="tbl_tit" style="width:39px; text-align:center">
            <input type="hidden" name="chon" id="chon_User">
            <input type="checkbox" name="chkall" value="0" onclick="docheck_User(document.frmList.chkall.checked,0);">
            </div>
        </div>
        <div style="float:left; width:20px; text-align:right">
        <input type="button" name="del_Items" id='del_Items' value="&nbsp;" onClick="delItems_User('{$processurl}');" style="width:17px; font-size:12px; background:url(../images/admin/b_drop.png); cursor:pointer" title="Xóa lựa chọn">
        </div>
        <div style="float:left; height:125px; width:837px; overflow-y:scroll">
            {section name=pi loop=$obj_list}
            {if $smarty.section.pi.index is not div by 2} 
            {assign var="class_td" value="tbl_cont"} 
            {else}
            {assign var="class_td" value="tbl_cont2"} 
            {/if}
            {math x=$vars.curpage-1 y=$vars.numresult z=$smarty.section.pi.index t=1 equation="x*y+z+t" assign=stt}
            <div class="{$class_td}" style="width:30px; text-align:center">{$stt}</div>
            <div class="{$class_td}" style="width:130px; white-space: nowrap" title="{$obj_list[pi]->user_fullname}">
            	&nbsp;<a href="javascript: void(0);" onclick="edit_me_User({$obj_list[pi]->user_id})" >{$obj_list[pi]->user_fullname}</a>
            </div>
            <div class="{$class_td}" style="width:120px">
            	&nbsp;{if $obj_list[pi]->user_level eq 1} Quản trị
                {elseif $obj_list[pi]->user_level eq 2} Văn thư
                {elseif $obj_list[pi]->user_level eq 3} Trợ lý
                {elseif $obj_list[pi]->user_level eq 4} Giám đốc
                {elseif $obj_list[pi]->user_level eq 5} Phó giám đốc
                {elseif $obj_list[pi]->user_level eq 6} Trưởng phòng/ban
                {elseif $obj_list[pi]->user_level eq 7} Phó phòng/ban
                {elseif $obj_list[pi]->user_level eq 8} Nhân viên
                {else}Văn thư phòng
                {/if}
            </div>
            <div class="{$class_td}" style="width:80px">
            	&nbsp;{$obj_list[pi]->user_phone}
            </div>
            <div class="{$class_td}" style="width:161px">
            	&nbsp;{$obj_list[pi]->user_email}
            </div>
            <div class="{$class_td}" style="width:70px">
            	&nbsp;{$obj_list[pi]->user_ngay_bat_dau|date_format:"%d/%m/%Y"}
            </div>
            <div class="{$class_td}" style="width:59px; text-align:center">
                <select name="user_sort[]" class="select_tiny" onchange="sort_me_User({$obj_list[pi]->user_id},this.value)">
                {section name=i loop=$total_num_result}
                    <option value="{$smarty.section.i.index}" {if $smarty.section.i.index eq $obj_list[pi]->user_sort} selected="selected"{/if}>{$smarty.section.i.index}</option>
                {/section}
                </select>
                <input type="hidden" name="user_id1[]" value="{$obj_list[pi]->user_id}">
            </div>
            <div class="{$class_td}" style="width:59px; text-align:center">
                {if $obj_list[pi]->user_active eq 1}
                    <a href='javascript: void(0);' onclick="uncheck_fns_User('user_active',2,{$obj_list[pi]->user_id})"><img src="../images/admin/tick.png" width="10" height="10" border="0" title="Ẩn"></a>
                {else}
                    <a href='javascript: void(0);' onclick="uncheck_fns_User('user_active',1,{$obj_list[pi]->user_id})"><img src="../images/admin/publish_x.png" width="10" height="10" border="0" title="Hiện"></a>
                {/if}
            </div>
            <div class="{$class_td}" style="width:29px; text-align:center">
                <a href='javascript: void(0);' onclick="edit_me_User({$obj_list[pi]->user_id})">
                <img src="../images/admin/b_edit.png" width="11" height="11" border="0" title="Sửa"></a>
            </div>
            <div class="{$class_td}" style="width:29px; text-align:center">
                <a href='javascript: void(0'  onClick="delItems_User('{$processurl}', {$obj_list[pi]->user_id});">
                <img src="../images/admin/b_drop.png" width="11" height="11" border="0" title="Xóa"></a>
            </div>
            <div class="{$class_td}" style="width:39px; text-align:center">
            	<input type="checkbox" name="chkid" value="{$obj_list[pi]->user_id}" onclick="docheckone_User();">
            </div>
            {/section}
        </div>
        <input type="hidden" id="curpage_User" name="curpage" value="{$vars.curpage}" />
    </fieldset>
    </form>
</div>
<!------------------------------------------------- Tool bar --------------------------------------------->
<div id="user_clear_txt"></div>
<div id="user_tool_bar">

    <div id="user_search_area">
    <select name="order" id="order_User" style="width:120px; font-size:12px; border:1px solid #99bbe8" onchange="reloadPage_User('{$processurl}');">
    {section name=sli loop=$order_arr}
        <option value="{$smarty.section.sli.index}" {if $smarty.section.sli.index eq $vars.order}selected{/if} >
        {$order_arr[sli]}
        </option>
    {/section}
    </select>
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div id="user_page_area">
    {if $vars.curpage eq 1}
    	<img src="{$css_path}icon_first_page.png" class="img_all">
    	<img src="{$css_path}icon_pre_page.png" class="img_all">
    {else}
    <a href="javascript: void(0)" id="first_page" onclick="gotoPage_User('{$processurl}',parseInt(1));" title="Trang đầu">
    	<img src="{$css_path}icon_first_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="pre_page" onclick="gotoPage_User('{$processurl}',parseInt(document.getElementById('page_User').value)-parseInt(1));" title="Trang trước">
    	<img src="{$css_path}icon_pre_page.png" class="img_all">
    </a>
    {/if}
    </div>
    <div style="float:left; line-height:19px">
        <div style="float:left; width:35px">Trang</div> 
        <div style="float:left; width:35px">
        <input type="text" value="{$vars.curpage}" name="page" id="page_User" onblur=" gotoPage_User('{$processurl}',this.value);" style="width:30px; font-size:12px; height:15px; border:1px solid #99bbe8">
        </div>
        <div style="float:left; width:42px"> / {$num_page}</div>
    </div>
    <div id="user_page_area">
    {if $vars.curpage eq $num_page}
    	<img src="{$css_path}icon_next_page.png" class="img_all">
        <img src="{$css_path}icon_last_page.png" class="img_all">
    {else}
    <a href="javascript: void(0)" id="next_page" onclick="gotoPage_User('{$processurl}',parseInt(document.getElementById('page_User').value)+parseInt(1));" title="Trang tiếp">
    	<img src="{$css_path}icon_next_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="last_page" onclick="gotoPage_User('{$processurl}',parseInt({$num_page}));" title="Trang cuối">
    	<img src="{$css_path}icon_last_page.png" class="img_all">
    </a>
    {/if}
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:left; width:15px">
    <a href="javascript: void(0)" id="a_ref_User" title="Tải lại"><img src="{$css_path}icon_refresh.png" class="img_all"></a>
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:right; line-height:19px; margin-right:2px">
        <div style="float:left; width:40px">Xem</div>
        <div style="float:left; width:52px">
            <select name="numresult" id="numresult_User" style="width:50px; font-size:12px; border:1px solid #99bbe8" onchange="reloadPage_User('{$processurl}');">
                {section name=sli loop=$nrs_arr}
                <option value="{$nrs_arr[sli]}" {if $nrs_arr[sli] eq $vars.numresult}selected{/if}>{$nrs_arr[sli]} </option>
                {/section}
            </select>
        </div>
        <div style="float:left">dòng / trang</div>
    </div>
    
</div>
{literal}
<script language="javascript">	
	function show_hide_user(){
		if(document.getElementById('thong_tin_them').style.display=='none')
			document.getElementById('thong_tin_them').style.display='';
		else document.getElementById('thong_tin_them').style.display='none';
	}
	
	function docheck_User(status,from_){
		var alen=document.frmList_User.elements.length;
		alen=(alen>5)?document.frmList_User.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
			document.frmList_User.chkid[i].checked=status;
		}
		else{
			document.frmList_User.chkid.checked=status;
		}
		if(from_>0) document.frmList_User.chkall.checked=status;
	}
		
	function docheckone_User(){
		var alen=document.frmList_User.elements.length;
		var isChecked=true;
		alen=(alen>4)?document.frmList_User.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_User.chkid[i].checked==false)
					isChecked=false;
		}else{
			if(document.frmList_User.chkid.checked==false)
				isChecked=false;
		}				
		document.frmList_User.chkall.checked=isChecked;
	}
	
	function calculatechon_User(){			
		var strchon="";
		var alen=document.frmList_User.elements.length;				
		alen=(alen>2)?document.frmList_User.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_User.chkid[i].checked==true)
					strchon+=document.frmList_User.chkid[i].value+",";
		}else{
			if(document.frmList_User.chkid.checked==true)
				strchon=document.frmList_User.chkid.value;
		}
		document.frmList_User.chon_User.value=strchon;
	}
	
	function delItems_User(processurl,delStr){
		if (delStr == undefined){
			calculatechon_User();
			delStr = document.getElementById("chon_User").value;
		}
		if (delStr == ""){
			return false;
		}
		if(!confirm("THÔNG BÁO: \n\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
			return false;
		}	
		
		var numresult_User,order_User,curpage_User;
		numresult = $("#numresult_User").val();
		order = $("#order_User").val();
		curpage = $("#curpage_User").val();
		
		var dataString  = "numresult=" + numresult;
			dataString += "&order=" + order;
			dataString += "&curpage=" + curpage;
			dataString += "&dlStr=" + delStr +"";
			//alert (processurl+'--'+dataString);
		$.ajax({
			type: "POST",
			url: processurl,
			data: dataString,
			success: function(data) {
				$('#user_content_main').fadeOut('fast').load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+curpage).fadeIn("fast");
			}
		});
	}
	
	function reloadPage_User(processurl){
		var numresult_User,order_User,cur_pos;
		numresult = $("#numresult_User").val();
		order = $("#order_User").val();
		cur_pos = 0;
		$("#user_content_main").load(processurl+"&numresult="+numresult+"&order="+order+"&cur_pos="+cur_pos);
	}
	
	function gotoPage_User(processurl,page){
		var numresult_User,order_User,cur_pos;
		numresult = $("#numresult_User").val();
		order = $("#order_User").val();
		//alert(processurl+'-'+page+'-'+numresult+'-'+order);
		$("#user_content_main").load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+page);
	}
	
	function uncheck_fns_User(field,val,id){
		$("#user_content_main").load("?listUser&mod=users&checkUncheck="+val+"&setfield="+field+"&checkUncheckID="+id);
	}
	
	function sort_me_User(id,val){
		$("#user_content_main").load("?listUser&mod=users&sort_me=1&user_id="+id+"&val="+val);
	}
	
	function search_me_User(){
		var keyword 			= document.getElementById('keyword').value;
		var department_id_fs 	= document.getElementById('department_id_fs').value;
		var object_id_fs 		= document.getElementById('object_id_fs').value;
		if (keyword == "" && department_id_fs == 0 && department_id_fs == 0){
			return false;
		}
		
		$.post('?listUser&mod=users',
			{keyword:keyword,department_id_fs:department_id_fs,object_id_fs:object_id_fs},
			function(data){
				$('#user_content_main').html(data);
				$("#user_content_main").show();
			}
		);
	}
	
	function edit_me_User(id){
		$("#user_content_main").load("?listUser&mod=users&edit_me=1&user_id="+id);
	}
		
	$("#a_ref_User").click( function () { 
			$('#user_content_main').hide();
			$('#user_content_main').fadeOut('fast').load('index.php?listUser&mod=users').fadeIn("fast");
		});
</script>
{/literal}