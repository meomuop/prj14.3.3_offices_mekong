{include file = '_common_header.tpl'}
<body topmargin="0" bottommargin="0" leftmargin="0" rightmargin="0">
<table cellspacing="0" cellpadding="0" width="1100" align="center" border="0">
    <tr>
        <td valign="top">
            <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                <tr align="center"><td><div align="left">{include file="_header.tpl"}</div></td></tr>
                <!-- Top Menu -->
                <tr><td align="left"></td></tr>
                <!-- end of Top Menu -->
				
				<tr>
					<td>
						<div id="main" style="border:1px solid #CCC">
						<table width="100%" border="0" cellpadding="0" cellspacing="0" height="700">
							<tr>
								<td valign="top" height="400" >
									<table height="100%" cellSpacing="0" cellPadding="0" width="100%" border="0">
										<tr>
											<td class="control_tooltip" width="100%" style="padding:20px " align="left">
												<font class=label_font color="#0033FF" style="font-size:12px">
                                                Bạn đang truy cập với tài khoản: <b>{$access_user_name}</b>&nbsp;<em>({$access_object_name} tại {$access_department_name} thuộc {$access_unit_name})</em>
                                                </font> </td>
										</tr>
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
	  																<td  style="font-family: Arial; color:#930; font-size: 16px; font-weight: bold;" width="31%" nowrap="nowrap"><div align="left"><img src="../images/admin/module.png" align="absmiddle" height="30">&nbsp;Danh sách module</div>
                                                                    </td>	
	  															</tr>
																</tbody>
   															 </table>
                                                             <br />
															 <fieldset style="width: 90%; ">
															 <legend >&nbsp;Sửa thông tin module&nbsp;&nbsp;</legend>	
                                                             {if $complete eq 1}
                                                                <div><img src="images/spacer.gif" height="30px" /></div>
                                                                <div align="center" class="complele_alert">
                                                                <h2>Sửa module thành công</h2><br /><br />
                                                                </div>
                                                             {else}
                                                             <form action="?editModule{$arg.arg}" method="POST" name="editForm">
                                                             {if $error neq ""}
                                                                <div align="left" style="width: 400px; background-color:#FFFFCC; padding: 10px 20px 10px 50px;">
                                                                <label style=" font-size: 16px; color:#990000; font-weight:bold; padding-bottom:5px;">Thông báo:</label><BR />
                                                                <li style=" padding: 0px; padding-left: 10px; font-size: 14px; color:#C24510">{$error}</li>
                                                                </div>
															 {/if}	
															 <div><img src="../images/admin/spacer.gif" style="height:10px;" /></div>
															 <div align="center">
							  								 <table width="95%">
                                                             	<tr>
								  									<td width="30%" align="left" height="20">
                                                                    <font class="label_font" color="#425E89">Tên dịch vụ <font color="#FF0000">*</font>:</font></td>		
								  									<td align="left">
                                                                    <input type="text" id="mod_name" name="mod_name" size="50" value="{$vars.mod_name}"/ readonly>
                                                                    </td>
																</tr>
																<tr>
								  									<td width="30%" align="left" height="20">
                                                                    <font class="label_font" color="#425E89">Mô tả:</font></td>		
								  									<td align="left">
                                                                    <input type="text" id="mod_desc" name="mod_desc" size="50" value="{$vars.mod_desc}"/>
                                                                    </td>
																</tr>
                                                                <tr>
								  									<td align="left" height="20">
                                                                    <font class="label_font" color="#425E89">Tình trạng :</font></td>		
								  									<td align="left">
                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                          <tr>
                                                                            <td width="20%">
                                                                            <input type="radio" id="mod_active" name="mod_active" value="1" {if $vars.mod_active eq 1} checked="checked" {/if}/>&nbsp;Hiển thị</td>
                                                                            <td>
                                                                            <input type="radio" id="mod_active" name="mod_active" value="0" {if $vars.mod_active eq 0} checked="checked" {/if}/>&nbsp;Không hiển thị</td>
                                                                          </tr>
                                                                        </table>
                                                                    </td>
																</tr>
                                                                
																<tr>
								  									<td colspan="2" align="left" style="padding-top:10px">
                                                                    <input type="submit" name="submitMod" value="Cập nhật"/>
                                                                    <input type="hidden" name="arg" value="{$arg.arg}" />
                                                                    <input type="hidden" name="mod_id" value="{$vars.mod_id}">	
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
        </td>
	<tr>
</table>
<!--  END ./winuser/view.html  -->
</body>
</html>