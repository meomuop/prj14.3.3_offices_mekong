{include file = '_common_header.tpl'}
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
                                <td valign="top" height="400" width="19%" style="border-right:1px solid #000">{include file="_leftmenu.tpl"}</td><td>&nbsp;</td>
                                <td valign="top" width="100%" bgColor="#ffffff" height="100%" align="center"><br>				
                                    <!-- *************** START - PHAN NOI DUNG THAY DOI   ************************** -->
                                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td valign="top" align="center">
                                                <table class="adminlist" width="100%" border="0" cellpadding="0" cellspacing="0">
                                                    <tbody>
                                                    <tr>
                                                        <td style="font-family: Arial; color:#930; font-size: 16px; font-weight: bold;" width="31%" nowrap="nowrap"><div align="left"><img src="../images/admin/module.png" align="absmiddle" height="30">&nbsp;Sao lưu và phục hồi cơ sở dữ liệu</div>
                                                        </td>	
                                                    </tr>
                                                    <tr>
                                                    	<td align="center">
                                                        	<form action="?restore" method="POST" name="theForm" id="theForm">
                                                         	<table width="100%" border="0" cellpadding="0" cellspacing="0">
                                                              <tr>
                                                                  <td align="left">
                                                                  <font class="label_font" color="#425E89">Đường dẫn *:</font></td>
                                                                  <td align="left">
                                                                  <input type="text" size="50" name="restore_file" id="restore_file" value="{$vars.restore_file}">&nbsp;<a href="javascript:window.open('upload4.php','new_page','width=500,height=300');window.history.go(1)" >[ Tải lên ]</a> 
                                                                  </td>
                                                              </tr>
                                                              <tr>
                                                                  <td colspan="2" align="left" style="padding-top:10px">
                                                                  <input type="submit" name="submitRestore" value="Khôi phục"/>		
                                                                  <input type="reset" name="reset" value="Quay lại &gt;&gt;" onClick="history.go(-1)">
                                                                  </td>
                                                              </tr>
                                                            </table>
                                                            </form>
                                                        </td>
                                                    </tr>
                                                    </tbody>
                                                 </table>
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