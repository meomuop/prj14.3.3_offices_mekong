{include file = '_common_header.tpl'}
{literal}
<script language="javascript" type="text/javascript">
function loadFCK1()
{
	var oFCKeditor = new FCKeditor( 'ngansach_desc' ) ;
	oFCKeditor.BasePath	= '../FCKeditor/' ;
	oFCKeditor.Width = 500;
	oFCKeditor.Height = 120;
	oFCKeditor.ToolbarSet = 'Basic';
	oFCKeditor.ReplaceTextarea() ;
}
</script>
{/literal}
<body topmargin="0" bottommargin="0" leftmargin="0" rightmargin="0">
<table cellspacing="0" cellpadding="0" width="1100" align="center" border="0">
    <tr>
        <td valign="top">
            <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
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
                                        	<td valign="top" height="400" width="19%" style="border-right:1px solid #000">{include file="_leftmenu.tpl"}</td><td>&nbsp;</td>
											<td valign="top" width="100%" bgColor="#ffffff" height="100%" align="center"><br>				
												<!-- *************** START - PHAN NOI DUNG THAY DOI   ************************** -->
                                               	<table width="100%" border="0" cellpadding="0" cellspacing="0">
                 									<tr>
     													<td valign="top" align="center">
          	 												<table class="adminlist" width="100%" border="0" cellpadding="0" cellspacing="0">
																<form name="frm2" method="post" action=""></form>
																<tbody>
                                                                <tr>
	  																<td  style="font-family: Arial; color:#930; font-size: 16px; font-weight: bold;" width="31%" nowrap="nowrap"><div align="left"><img src="../images/admin/module.png" align="absmiddle" height="30">&nbsp;Danh sách nguồn ngân sách</div>
                                                                    </td>	
	  															</tr>
																</tbody>
   															 </table>
                                                             <br />
															 <fieldset style="width: 90%; ">
															 <legend >&nbsp;Thêm mới nguồn ngân sách&nbsp;&nbsp;</legend>	
                                                             {if $complete eq 1}
                                                                <div><img src="images/spacer.gif" height="30px" /></div>
                                                                <div align="center" class="complele_alert">
                                                                <h2>Thêm nguồn ngân sách thành công</h2><br /><br />
                                                                </div>
                                                             {else}
                                                             <form action="?addNgansach{$vars.arg}" method="POST" name="theForm">
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
                                                                    <font class="label_font" color="#425E89">Tên nguồn ngân sách *:</font></td>		
								  									<td align="left">
                                                                    <input type="text" id="ngansach_name" name="ngansach_name" size="50" value="{$vars.ngansach_name}"/>
                                                                    </td>
																</tr>
                                                                <tr>
                                                                    <td align="left">
                                                                    <font class="label_font" color="#425E89">Mô tả:</font></td>
                                                                    <td align="left">
                                                                    <textarea name="ngansach_desc" cols="30" rows="5" style="font-size:12px;width:60%; height:100px;">{$vars.ngansach_desc}</textarea>
                                                                    {literal}
																	<script language="javascript">
                                                                        loadFCK1()
                                                                    </script>
                                                                    {/literal}
                                                                    </td>
                        										</tr>
                                                                <tr>
								  									<td align="left" height="20">
                                                                    <font class="label_font" color="#425E89">Kiểu :</font></td>		
								  									<td align="left">
                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                          <tr>
                                                                            <td width="20%">
                                                                            <input type="radio" id="ngansach_type" name="ngansach_type" value="1" checked/>&nbsp;Thẩm định giá</td>
                                                                            <td>
                                                                            <input type="radio" id="ngansach_type" name="ngansach_type" value="0"/>&nbsp;Bán đấu giá</td>
                                                                             <td>
                                                                            <input type="radio" id="ngansach_type" name="ngansach_type" value="2"/>&nbsp;Cả hai</td>
                                                                          </tr>
                                                                        </table>
                                                                    </td>
																</tr>
                                                                <tr>
								  									<td align="left" height="20">
                                                                    <font class="label_font" color="#425E89">Tình trạng :</font></td>		
								  									<td align="left">
                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                          <tr>
                                                                            <td width="20%">
                                                                            <input type="radio" id="ngansach_active" name="ngansach_active" value="1" checked/>&nbsp;Hiển thị</td>
                                                                            <td>
                                                                            <input type="radio" id="ngansach_active" name="ngansach_active" value="0"/>&nbsp;Không hiển thị</td>
                                                                          </tr>
                                                                        </table>
                                                                    </td>
																</tr>
																<tr>
								  									<td colspan="2" align="left" style="padding-top:10px">
                                                                    <input type="submit" name="submitNgansach" value="Thêm mới"/>
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
        </td>
	<tr>
</table>
<!--  END ./winuser/view.html  -->
</body>
</html>