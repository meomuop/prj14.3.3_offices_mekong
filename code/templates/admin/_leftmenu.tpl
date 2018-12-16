{literal}
<script language="javascript">
	function show_hide1(obj){
		if(obj=='menu_1'){
			if(document.getElementById('menu_1').style.display==''){
				document.getElementById('menu_1').style.display='none';
			}else{
				document.getElementById('menu_1').style.display='';
				document.getElementById('menu_3').style.display='none';
			}
		}else if(obj=='menu_3'){
			if(document.getElementById('menu_3').style.display==''){
				document.getElementById('menu_3').style.display='none';
			}else{
				document.getElementById('menu_1').style.display='none';
				document.getElementById('menu_3').style.display='';
			}
		}
	}
</script>
{/literal}
<table width="99%" height="454" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center" valign="top">
    	<table cellspacing="0" cellpadding="2" border="0" width="100%" id="navigation">
          <tr height="12"><td></td></tr>
          <tr {if $user_level neq 1} style="display:none"{/if}>
            <td>
              <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                <tr>
                  <td colspan="3" align="left" style="border:1px solid #ddd; background-color:#ddd; line-height:20px; padding-left:5px">
                    <a href="javascript: void(0);" onclick="show_hide1('menu_1')" style="text-decoration:none; color:#000"><b><img src="../images/admin/taikhoan.png" width="16" align="absmiddle">&nbsp;Quản trị cấp cao</b></a>
                  </td>
                </tr>
                <tr height="1"><td></td></tr>
                <tr id="menu_1" style="display:none">
                  <td style="border:1px solid #ddd; background-color:#fff; line-height:16px; padding-left:15px">
                    <table cellspacing="0" cellpadding=3 width="100%" border="0">
                        <tr>
                          <td style="border-bottom:1px dashed #eee" align="left">
                              <img src="../images/admin/depart_icon.png" width="16" align="absmiddle"/>&nbsp;
                              <a href="?listDepartment&mod=departments">Quản lý phòng ban</a>
                          </td>
                        </tr>
                        <tr>
                          <td style="border-bottom:1px dashed #eee" align="left">
                              <img src="../images/admin/card_icon.png" width="16" align="absmiddle"/>&nbsp;
                              <a href="?listObject&mod=objects">Quản lý chức vụ</a>
                          </td>
                        </tr>
                        <tr>
                          <td align="left">
                              <img src="../images/admin/key_icon.png" width="16" align="absmiddle"/>&nbsp;
                              <a href="?listUser&mod=users">Quản lý thành viên</a>
                          </td>
                        </tr>
                        <tr>
                          <td style="border-bottom:1px dashed #eee" align="left">
                              <img src="../images/admin/config.png" width="16" align="absmiddle"/>&nbsp;
                              <a href="?editConfig&mod=config">Cấu hình hệ thống</a>
                          </td>
                        </tr>
                        <tr>
                          <td style="border-bottom:1px dashed #eee" align="left">
                              <img src="../images/admin/port_icon.png" width="16" align="absmiddle"/>&nbsp;
                              <a href="?listPort&mod=ports">Cấu hình cổng SMS</a>
                          </td>
                        </tr>
                        <tr>
                          <td style="border-bottom:1px dashed #eee" align="left">
                              <img src="../images/admin/arrow_icon.png" width="16" align="absmiddle">&nbsp;
                              <a href="?listHdsd&mod=hdsds">Quản lý hướng dẫn SD</a>
                          </td>
                        </tr>
                    </table>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr {if $user_level neq 1} style="display:none"{/if} height="5"><td></td></tr>
          <tr {if $user_level neq 1 and $user_level neq 2 and $user_level neq 9} style="display:none"{/if}>
            <td>
              <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                <tr>
                  <td colspan="3" align="left" style="border:1px solid #ddd; background-color:#ddd; line-height:20px; padding-left:5px">
                    <a href="javascript: void(0);" onclick="show_hide1('menu_3')" style="text-decoration:none; color:#000"><b><img src="../images/admin/soft_icon.png" width="16" align="absmiddle">&nbsp;Thuộc tính văn bản</b></a>
                  </td>
                </tr>
                <tr height="1"><td></td></tr>
                <tr id="menu_3" style="display:none">
                  <td style="border:1px solid #ddd; background-color:#fff; line-height:14px; padding-left:15px">
                    <table cellspacing="0" cellpadding=3 width="100%" border="0">
                        <tr>
                          <td style="border-bottom:1px dashed #eee" align="left">
                              <img src="../images/admin/arrow_icon.png" width="16" align="absmiddle"/>&nbsp;
                              <a href="?listSignPer&mod=signpers" align="left">Quản lý người ký</a>
                          </td>
                        </tr>
                        <tr>
                          <td style="border-bottom:1px dashed #eee" align="left">
                              <img src="../images/admin/arrow_icon.png" width="16" align="absmiddle"/>&nbsp;
                              <a href="?listInterdisci&mod=interdiscis" align="left">Người ký liên ngành</a>
                          </td>
                        </tr>
                        <tr>
                          <td style="border-bottom:1px dashed #eee" align="left">
                              <img src="../images/admin/arrow_icon.png" width="16" align="absmiddle"/>&nbsp;
                              <a href="?listSignObj&mod=signobjs" align="left">Chức vụ người ký</a>
                          </td>
                        </tr>
                        <tr>
                          <td style="border-bottom:1px dashed #eee" align="left">
                              <img src="../images/admin/arrow_icon.png" width="16" align="absmiddle"/>&nbsp;
                              <a href="?listSecret&mod=secrets" align="left">Quản lý độ mật</a>
                          </td>
                        </tr>
                        <tr>
                          <td style="border-bottom:1px dashed #eee" align="left">
                              <img src="../images/admin/arrow_icon.png" width="16" align="absmiddle"/>&nbsp;
                              <a href="?listImportant&mod=importants" align="left">Quản lý độ khẩn</a>
                          </td>
                        </tr>
                        <tr>
                          <td style="border-bottom:1px dashed #eee" align="left">
                              <img src="../images/admin/arrow_icon.png" width="16" align="absmiddle"/>&nbsp;
                              <a href="?listUnit&mod=units" align="left">Quản lý nơi gửi đến</a>
                          </td>
                        </tr>
                        <tr>
                          <td style="border-bottom:1px dashed #eee" align="left">
                              <img src="../images/admin/arrow_icon.png" width="16" align="absmiddle">&nbsp;
                              <a href="?listDocLevel&mod=docs">Quản lý khu vực</a>
                          </td>
                        </tr>
                        <tr>
                          <td style="border-bottom:1px dashed #eee" align="left">
                              <img src="../images/admin/arrow_icon.png" width="16" align="absmiddle">&nbsp;
                              <a href="?listDocField&mod=docs">Quản lý lĩnh vực</a>
                          </td>
                        </tr>
                        <tr>
                          <td style="border-bottom:1px dashed #eee" align="left">
                              <img src="../images/admin/arrow_icon.png" width="16" align="absmiddle">&nbsp;
                              <a href="?listDocCat&mod=docs">Quản lý loại văn bản</a>
                          </td>
                        </tr>
						<tr>
                          <td style="border-bottom:1px dashed #eee" align="left">
                              <img src="../images/admin/arrow_icon.png" width="16" align="absmiddle">&nbsp;
                              <a href="?listDocday&mod=daydocs">Quản lý số ngày xử lý</a>
                          </td>
                        </tr>
                    </table>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr {if $user_level neq 1 and $user_level neq 2 and $user_level neq 9} style="display:none"{/if}><td></td></tr>
          <tr>
            <td>
              <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                <tr>
                  <td colspan="3" align="left" style="border:1px solid #ddd; background-color:#ddd; line-height:20px; padding-left:5px; color:#000"">
                    <b><img src="../images/admin/soft_icon.png" width="16" align="absmiddle">&nbsp;Văn bản đến</b>
                  </td>
                </tr>
                <tr height="1"><td></td></tr>
                <tr>
                  <td style="border:1px solid #ddd; background-color:#fff; line-height:14px; padding-left:15px">
                    <table cellspacing="0" cellpadding=3 width="100%" border="0">
                        {if $user_level eq 2 or $user_level eq 9}
                        <tr>
                          <td style="border-bottom:1px dashed #eee" align="left">
                              <img src="../images/admin/arrow_icon.png" width="16" align="absmiddle">&nbsp;
                              <a href="?addDoc&mod=docs">Nhập mới</a>
                          </td>
                        </tr>
                        <tr>
                          <td style="border-bottom:1px dashed #eee" align="left">
                              <img src="../images/admin/arrow_icon.png" width="16" align="absmiddle">&nbsp;
                              <a href="?listDoc&mod=docs">Danh sách văn bản</a>
                          </td>
                        </tr>
                        {/if}
                        {if $user_level eq 3}
                        <tr>
                          <td style="border-bottom:1px dashed #eee" align="left">
                              <img src="../images/admin/arrow_icon.png" width="16" align="absmiddle">&nbsp;
                              <a href="?tranDoc&mod=docs">Phân loại văn bản</a>
                          </td>
                        </tr>
                        {/if}
                        {if $user_level eq 4 or $user_level eq 5}
                        <tr>
                          <td style="border-bottom:1px dashed #eee" align="left">
                              <img src="../images/admin/arrow_icon.png" width="16" align="absmiddle">&nbsp;
                              <a href="?replyDoc&mod=docs&user_id={$access_user_id}">Ý kiến chỉ đạo</a>
                          </td>
                        </tr>
                        {/if}
                        {if $user_level eq 4}
                        <tr>
                          <td style="border-bottom:1px dashed #eee" align="left">Xem văn bản phó giám đốc:</td>
                        </tr>
                        
                        {section name=ui loop=$user_list_4}
                        {if $user_list_4[ui]->user_level eq 5}
                        <tr>
                          <td style="border-bottom:1px dashed #eee" align="left">
                             -&nbsp;<a href="?replyDoc&mod=docs&user_id={$user_list_4[ui]->user_id}">{$user_list_4[ui]->user_fullname}</a>
                          </td>
                        </tr>
                        {/if}
                        {/section}
                        
                        <tr>
                          <td style="border-bottom:1px dashed #000"></td>
                        </tr>
                        {section name=ui loop=$user_list_4}
                        {if $user_list_4[ui]->user_level eq 3}
                        <tr>
                          <td style="border-bottom:1px dashed #eee" align="left">
                              -&nbsp;<a href="?tranDoc&mod=docs&user_id={$user_list_4[ui]->user_id}">{$user_list_4[ui]->user_fullname}</a>
                          </td>
                        </tr>
                        {/if}
                        {/section}
                        
                        <tr>
                          <td style="border-bottom:1px dashed #000"></td>
                        </tr>
                        <tr>
                          <td style="border-bottom:1px dashed #eee" align="left">Xem văn bản các phòng ban:</td>
                        </tr>
                        <tr>
                          <td style="border-bottom:1px dashed #eee" align="left">
                          	<form name="frm1" action="" method="post">
                             <select name="department_id" style="width:200px" onchange="javascript: window.location='?processDoc&mod=docs&department_id='+document.frm1.department_id.value">
                             <option value="0">Chọn phòng ban</option>
                             {section name=di loop=$obj_list_department}
                             <option value="{$obj_list_department[di]->department_id}">{$obj_list_department[di]->department_name}</option>
                             {/section}
                             </select>
                            </form>
                          </td>
                        </tr>
                        {/if}
                        
                        {if $user_level eq 3 or $user_level eq 6 or $user_level eq 7}
                        <tr>
                          <td style="border-bottom:1px dashed #eee" align="left">
                              <img src="../images/admin/arrow_icon.png" width="16" align="absmiddle">&nbsp;
                              <a href="?processDoc&mod=docs&user_id={$access_user_id}">Giải quyết, chỉ đạo</a>
                          </td>
                        </tr>
                        {/if}
                        {if $user_level eq 8}
                        <tr>
                          <td style="border-bottom:1px dashed #eee" align="left">
                              <img src="../images/admin/arrow_icon.png" width="16" align="absmiddle">&nbsp;
                              <a href="?finishDoc&mod=docs&user_id={$access_user_id}">Giải quyết văn bản đến</a>
                          </td>
                        </tr>
                        {/if}
                        <tr>
                          <td style="border-bottom:1px dashed #eee" align="left">
                              <img src="../images/admin/arrow_icon.png" width="16" align="absmiddle">&nbsp;
                              <a href="?reportDoc&mod=docs">In sổ lưu trữ</a>
                          </td>
                        </tr>
                        <tr>
                          <td style="border-bottom:1px dashed #eee" align="left">
                              <img src="../images/admin/arrow_icon.png" width="16" align="absmiddle">&nbsp;
                              <a href="?lateDoc&mod=docs">Văn bản cần theo dõi<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              (Có thời hạn giải quyết)</a>
                          </td>
                        </tr>
                        {if $user_level eq 9}
                        <tr>
                          <td style="border-bottom:1px dashed #eee" align="left">Thay quyền ban giám đốc:</td>
                        </tr>
                        {section name=ui loop=$user_list_4}
                        {if $user_list_4[ui]->user_level neq 3}
                        <tr>
                          <td style="border-bottom:1px dashed #eee" align="left">
                             <a href="?replyDoc&mod=docs&user_id={$user_list_4[ui]->user_id}">{$user_list_4[ui]->user_fullname}</a>
                          </td>
                        </tr>
                        {/if}
                        {/section}
                        <tr>
                          <td style="border-bottom:1px dashed #eee" align="left">Thay quyền chánh văn phòng:</td>
                        </tr>
                        {section name=ui loop=$user_list_4}
                        {if $user_list_4[ui]->user_level eq 3}
                        <tr>
                          <td style="border-bottom:1px dashed #eee" align="left">
                             <a href="?replyDoc&mod=docs&user_id={$user_list_4[ui]->user_id}">{$user_list_4[ui]->user_fullname}</a>
                          </td>
                        </tr>
                        {/if}
                        {/section}
                        {/if}
                    </table>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr height="5"><td></td></tr>
          <tr>
            <td>
              <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                <tr>
                  <td colspan="3" align="left" style="border:1px solid #ddd; background-color:#ddd; line-height:20px; padding-left:5px; color:#000"">
                    <b><img src="../images/admin/soft_icon.png" width="16" align="absmiddle">&nbsp;Văn bản đi
                    </b>
                  </td>
                </tr>
                <tr height="1"><td></td></tr>
                <tr>
                  <td style="border:1px solid #ddd; background-color:#fff; line-height:14px; padding-left:15px">
                  	<table cellspacing="0" cellpadding=3 width="100%" border="0">
                        {if $user_level eq 2 or $user_level eq 9}
                        <tr>
                          <td style="border-bottom:1px dashed #eee" align="left">
                              <img src="../images/admin/arrow_icon.png" width="16" align="absmiddle">&nbsp;
                              <a href="?addDocOut&mod=docs">Nhập mới</a>
                          </td>
                        </tr>
                        <tr>
                          <td style="border-bottom:1px dashed #eee" align="left">
                              <img src="../images/admin/arrow_icon.png" width="16" align="absmiddle">&nbsp;
                              <a href="?listDocOut&mod=docs">Danh sách văn bản</a>
                          </td>
                        </tr>
                        <tr>
                          <td style="border-bottom:1px dashed #eee" align="left">
                             <img src="../images/admin/arrow_icon.png" width="16" align="absmiddle">&nbsp;
                              <a href="?reportDocOut&mod=docs">In sổ lưu trữ</a>
                          </td>
                        </tr>
                        {/if}
                        {if $user_level eq 4}
                        <tr>
                          <td style="border-bottom:1px dashed #eee" align="left">
                              <img src="../images/admin/arrow_icon.png" width="16" align="absmiddle">&nbsp;
                              <a href="?listDocOut&mod=docs">Danh sách văn bản</a>
                          </td>
                        </tr>
                        <tr>
                          <td style="border-bottom:1px dashed #eee" align="left">
                             <img src="../images/admin/arrow_icon.png" width="16" align="absmiddle">Xem văn bản theo người ký
                          </td>
                        </tr>
                        {section name=ui loop=$user_list_4}
                        <tr>
                          <td style="border-bottom:1px dashed #eee" align="left">
                             -&nbsp;<a href="?listDocOut&mod=docs&user_id={$user_list_4[ui]->user_id}">{$user_list_4[ui]->user_fullname}</a>
                          </td>
                        </tr>
                        {/section}
                        <tr>
                          <td style="border-bottom:1px dashed #eee" align="left">
                             <img src="../images/admin/arrow_icon.png" width="16" align="absmiddle">&nbsp;
                              <a href="?reportDocOut&mod=docs">In sổ lưu trữ</a>
                          </td>
                        </tr>
                        {/if}
						{if $user_level eq 5}
                        <tr>
                          <td style="border-bottom:1px dashed #eee" align="left">
                              <img src="../images/admin/arrow_icon.png" width="16" align="absmiddle">&nbsp;
                              <a href="?listDocOut&mod=docs&user_id={$user_id}">Danh sách văn bản</a>
                          </td>
                        </tr>
						<tr>
                          <td style="border-bottom:1px dashed #eee" align="left">
                             <img src="../images/admin/arrow_icon.png" width="16" align="absmiddle">&nbsp;
                              <a href="?reportDocOut&mod=docs&user_id={$user_id}">In sổ lưu trữ</a>
                          </td>
                        </tr>
                        {/if}
                        {if $user_level eq 3 or $user_level eq 6 or $user_level eq 7}
                        <tr>
                          <td style="border-bottom:1px dashed #eee" align="left">
                              <img src="../images/admin/arrow_icon.png" width="16" align="absmiddle">&nbsp;
                              <a href="?listDocOut&mod=docs&department_id={$access_department_id}">Danh sách văn bản</a>
                          </td>
                        </tr>
						<tr>
                          <td style="border-bottom:1px dashed #eee" align="left">
                             <img src="../images/admin/arrow_icon.png" width="16" align="absmiddle">&nbsp;
                              <a href="?reportDocOut&mod=docs&department_id={$access_department_id}">In sổ lưu trữ</a>
                          </td>
                        </tr>
                        {/if}
                    </table>
               	  </td> 	
                </tr>
              </table>
            </td>
          </tr> 
          <tr height="5"><td></td></tr>
          <tr>
            <td>
              <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                <tr>
                  <td colspan="3" align="left" style="border:1px solid #ddd; background-color:#ddd; line-height:20px; padding-left:5px; color:#000">
                    <b><img src="../images/admin/version_check.png" width="16" align="absmiddle">&nbsp;Tin nhắn, nhắc việc</b>
                  </td>
                </tr>
                <tr height="1"><td></td></tr>
                <tr>
                  <td align="center">
                    <table cellspacing="0" cellpadding=3 width="98%" border="0">
                        <tr height="5"><td></td></tr>
                        <tr>
                          <td style="border-bottom:1px dashed #eee" align="left">
                              <img src="../images/admin/addedit.png" width="16" align="absmiddle">&nbsp;
                              <a href="?addMsg&mod=msgs">Soạn tin nhắn</a>
                          </td>
                        </tr>
                        <tr>
                          <td style="border-bottom:1px dashed #eee" align="left">
                              <img src="../images/admin/addedit.png" width="16" align="absmiddle">&nbsp;
                              <a href="?listMsg&mod=msgs&type=1">Hộp thư đi</a>
                          </td>
                        </tr>
                        <tr>
                          <td style="border-bottom:1px dashed #eee" align="left">
                              <img src="../images/admin/addedit.png" width="16" align="absmiddle">&nbsp;
                              <a href="?listMsgUser&mod=msgs">Hộp thư đến <font color="#FF0000">({$count_msg})</font></a>
                          </td>
                        </tr>
                    </table>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr height="5"><td></td></tr>
          <tr>
            <td>
              <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                <tr>
                  <td colspan="3" align="left" style="border:1px solid #ddd; background-color:#ddd; line-height:20px; padding-left:5px; color:#000">
                    <b><img src="../images/admin/version_check.png" width="16" align="absmiddle">&nbsp;Thông tin thành viên</b>
                  </td>
                </tr>
                <tr height="1"><td></td></tr>
                <tr>
                  <td align="center">
                    <table cellspacing="0" cellpadding=3 width="98%" border="0">
                        <tr height="5"><td></td></tr>
                        <tr>
                          <td style="border:1px solid #ccc;" align="center">
                          <img src="../{$user_image}" width="160" align="absmiddle">
                          </td>
                        </tr>
                        <tr>
                          <td style="line-height:20px; border-bottom:1px dashed #eee" align="left">
                          Tài khoản:&nbsp;<b>{$access_user_fullname} - {$access_user_name}</b><br />
                          </td>
                        </tr>
                        <tr>
                          <td style="line-height:20px; border-bottom:1px dashed #eee" align="left">
                          Chức vụ:&nbsp;<b>{$access_object_name}</b><br />
                          </td>
                        </tr>
                        <tr>
                          <td style="border-bottom:1px dashed #eee" align="left">
                              <img src="../images/admin/addedit.png" width="16" align="absmiddle">&nbsp;
                              <a href="?editUser&mod=users&id={$access_user_id}">Sửa thông tin</a>
                          </td>
                        </tr>
                        <tr>
                          <td style="border-bottom:1px dashed #eee" align="left">
                              <img src="../images/admin/logout_icon.jpg" width="16" align="absmiddle">&nbsp;
                              <a href="?logout">Thoát quyền</a>
                          </td>
                        </tr>
                        <tr>
                          <td style="border-bottom:1px dashed #eee" align="left">
                              <img src="../images/admin/security.png" width="16" align="absmiddle">&nbsp;
                              <a href="?">Trang quản trị</a>
                          </td>
                        </tr>
                        <tr>
                          <td style="border-bottom:1px dashed #eee" align="left">
                              <img src="../images/admin/addedit.png" width="16" align="absmiddle">&nbsp;
                              <a href="?listHdsd&mod=hdsds">Hướng dẫn sử dụng</a>
                          </td>
                        </tr>
                        <tr>
                          <td style="border-bottom:1px dashed #eee" align="left">
                              <img src="../images/admin/security.png" width="16" align="absmiddle">&nbsp;
                              <a href="http://{php}echo $_SERVER["SERVER_NAME"]{/php}/truyennhanvanban/">PM truyền nhận văn bản</a>
                          </td>
                        </tr>
                        <tr>
                          <td style="border-bottom:1px dashed #eee" align="left">
                              <img src="../images/admin/bangdieukhien.png" width="16" align="absmiddle">&nbsp;
                              <a href="http://www.sotaichinh.hanoi.gov.vn" target="_blank">Trang chủ STC HN</a>
                          </td>
                        </tr>
                    </table>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
    </td>
  </tr>
</table>