{include file = '_common_header.tpl'}
{literal}
<script language="javascript">
 function check_user(obj){
 	if(obj.user_fullname.value==""){
		alert("Bạn cần nhập họ tên người dùng");
		obj.user_fullname.focus();
		return false;
	}
	
	if(obj.user_name.value==""){
		alert("Bạn cần nhập tên đăng nhập");
		obj.user_fullname.focus();
		return false;
	}
	
	if(obj.user_pass.value==""){
		alert("Bạn cần nhập mật khẩu");
		obj.user_fullname.focus();
		return false;
	}
	
	if(obj.user_pass.value!=obj.userPassConfirm.value){
		alert("Mật khẩu không trùng khớp");
		obj.user_fullname.focus();
		return false;
	}
	
	return true;
 }
</script>
{/literal}
<body topmargin="0" bottommargin="0" leftmargin="0" rightmargin="0">
<table cellspacing="0" cellpadding="0" width="1000" align="center" border="0">
    <tr align="center"><td><div align="left">{include file="_header.tpl"}</div></td></tr>
    <!-- Top Menu -->
    <tr>
        <td align="center">
            <div id="main" style="border:1px solid #CCC">
            <table width="99%" border="0" cellpadding="0" cellspacing="0" height="400">
                <tr>
                    <td valign="top" height="400" >
                        <table height="100%" cellSpacing="0" cellPadding="0" width="100%" border="0">
                            <tr>
                                <td valign="top" width="100%" bgColor="#ffffff" height="100%" align="center"><br>				
                                    <!-- *************** START - PHAN NOI DUNG THAY DOI   ************************** -->
                                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td valign="top" align="center">
                                                <table class="adminlist" width="100%" border="0" cellpadding="0" cellspacing="0">
                                                    <form name="frm2" method="post" action=""></form>
                                                    <tbody>
                                                    <tr>
                                                        <td  style="font-family: Arial; color:#930; font-size: 16px; font-weight: bold;" width="31%" nowrap="nowrap"><div align="left"><img src="../images/admin/module.png" align="absmiddle" height="30">&nbsp;Đăng ký tài khoản sử dụng phần mềm</div>
                                                        </td>
                                                        <td align="left">Mời quý vị hoàn tất các mục được đánh dấu (*)</td>
                                                    </tr>
                                                    </tbody>
                                                 </table>
                                                 <br />
                                                 <fieldset style="width: 90%; ">
                                                 <legend >&nbsp;Thông tin đăng ký&nbsp;&nbsp;</legend>	
                                                 {if $complete eq 1}
                                                    <div><img src="images/spacer.gif" height="30px" /></div>
                                                    <div align="center" class="complele_alert">
                                                    <h2>Thêm thành viên thành công</h2><br /><br />
                                                    </div>
                                                 {else}
                                                 <form action="?addUser{$vars.arg}" enctype="multipart/form-data" method="POST" name="addForm" onSubmit="return check_user(this);">
                                                 {if $error neq ""}
                                                    <div align="left" style="width: 400px; background-color:#FFFFCC; padding: 10px 20px 10px 50px;">
                                                    <label style=" font-size: 16px; color:#990000; font-weight:bold; padding-bottom:5px;">Thông báo lỗi:</label><BR />
                                                    <li style=" padding: 0px; padding-left: 10px; font-size: 14px; color:#C24510">{$error}</li>
                                                    </div>
                                                 {/if}	
                                                 <div><img src="../images/admin/spacer.gif" style="height:10px;" /></div>
                                                 <div align="center">
                                                 {literal}
                                                 <script language="javascript">	
                                                      function show_level(){	
                                                            document.getElementById('permiss').style.display='';
                                                      }	
                                                      
                                                      function hide_level(){	
                                                            document.getElementById('permiss').style.display='none';
                                                      }	
                                                 </script>
                                                 {/literal}
                                                 <table width="95%">
                                                    <tr>
                                                        <td width="25%" align="left" height="20">
                                                        <font class="label_font" color="#425E89">Họ tên đầy đủ *:</font></td>		
                                                        <td align="left">
                                                        <input type="text" id="user_fullname" name="user_fullname" style="width:180px" value="{$vars.user_fullname}"/></td>
                                                    </tr>
                                                    <tr height="10"><td></td></tr>
                                                    <tr>
                                                        <td align="left">
                                                        <font class="label_font" color="#425E89">Ảnh:</font></td>
                                                        <td align="left">
                                                        <input name="user_image" id="user_image" type="text" style="width:180px"  value="{$vars.user_image}" maxlength="250" readonly="true" />&nbsp;<a href="#" onClick="doUploadPic('?uploadPic&id=user_image&thumbid=thumbImg&dir=userimg');">Tải ảnh</a><br><br>
                                                            {if $vars.user_image neq ''}Ảnh hiện tại:<br>
                                                            <img align="absmiddle" src="../{$vars.user_image}" width="100"/>{/if}
                                                        </td>
                                                    </tr>
                                                    <tr height="10"><td></td></tr>
                                                    <tr>
                                                        <td align="left" height="20">
                                                        <font class="label_font" color="#425E89">Phòng ban họat động *:</font></td>		
                                                        <td align="left">
                                                        	<select name="unit_id" style="width:180px">
                                                                <option value="0">Chọn phòng ban</option>
                                                                {section name=qi loop=$obj_list_department}
                                                                <option value="{$obj_list_department[qi]->department_id}" {if $obj_list_department[qi]->department_id eq $vars.unit_id}selected="selected"{/if}>-&nbsp;{$obj_list_department[qi]->department_name}</option>
                                                                {/section}
                                                            </select>
                                                        </td>
                                                    </tr>
                                                    <tr height="10"><td></td></tr>
                                                    <tr>
                                                        <td align="left" height="20">
                                                        <font class="label_font" color="#425E89">Chức vụ *:</font></td>		
                                                        <td align="left">
                                                            <select name="object_id" style="width:180px">
                                                                <option value="0">Chọn chức vụ</option>
                                                                {section name=qi loop=$obj_list_object}
                                                                <option value="{$obj_list_object[qi]->object_id}" {if $obj_list_object[qi]->object_id eq $vars.object_id}selected="selected"{/if}>-&nbsp;{$obj_list_object[qi]->object_name}</option>
                                                                {/section}
                                                            </select>
                                                        </td>
                                                    </tr>
                                                    <tr height="10"><td></td></tr>
                                                    <tr>
                                                        <td align="left" height="20">
                                                        <font class="label_font" color="#425E89">Tên đăng nhập *:</font></td>		
                                                        <td align="left">
                                                        <input type="text" id="user_name" name="user_name" size="20" value=""/></td>
                                                    </tr>
                                                    <tr height="10"><td></td></tr>
                                                    <tr>
                                                        <td align="left" height="20">
                                                        <font class="label_font" color="#425E89">Mật khẩu *:</font></td>
                                                        <td align="left">
                                                        <input type="password" id="user_pass" name="user_pass" size="20" value=""/></td>
                                                    </tr>
                                                    <tr height="10"><td></td></tr>
                                                    <tr>
                                                        <td align="left" height="20">
                                                        <font class="label_font" color="#425E89">Xác nhận mật khẩu *:</font></td>
                                                        <td align="left">
                                                        <input type="password" id="userPassConfirm" name="userPassConfirm" size="20" value=""/></td>
                                                    </tr>
                                                    <tr height="10"><td></td></tr>
                                                    <tr>
                                                        <td align="left" height="20">
                                                        <font class="label_font" color="#425E89">Điện thoại *:</font></td>
                                                        <td align="left">
                                                        <input type="text" id="user_phone" name="user_phone" size="30" value="{$vars.user_phone}"/></td>
                                                    </tr>
                                                    <tr height="10"><td></td></tr>
                                                    <tr>
                                                        <td align="left" height="20">
                                                        <font class="label_font" color="#425E89">Thư điện tử:</font></td>
                                                        <td align="left">
                                                        <input type="text" id="user_email" name="user_email" size="30" value="{$vars.user_email}"/></td>
                                                    </tr>
                                                    <tr height="10"><td></td></tr>
                                                    <tr>
                                                        <td colspan="2" align="left" style="padding-top:10px">
                                                        <input type="submit" name="submitUser" value="Thêm mới"/>
                                                        <input type="hidden" name="user_active" value="2" />	
                                                        <input type="hidden" name="arg" value="{$vars.arg}" />		
                                                        <input type="reset" name="reset" value="Quay lại &gt;&gt;" onClick="history.go(-1)">
                                                        </td>
                                                    </tr>
                                                 </table>
                                                 </div>
                                                 </form>							
                                                 {/if}								
                                                 </fieldset>
                                            </td>
                                        </tr>
                                    </table>
                                    <!-- *************** END - PHAN NOI DUNG THAY DOI   ************************** -->
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            </div>
        </td>
    </tr>
    <tr><td>{include file="_footer.tpl"}</td></tr>
</table>
<!--  END ./winuser/view.html  -->
</body>
</html>