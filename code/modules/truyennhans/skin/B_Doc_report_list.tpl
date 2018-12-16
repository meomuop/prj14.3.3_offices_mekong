{include file = '_common_header.tpl'}
<body topmargin="0" bottommargin="0" leftmargin="0" rightmargin="0">
<table cellspacing="0" cellpadding="0" width="800" align="center" border="0">
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
                                    <div id='loadingTable' style="display:none; text-align:center; font-size: 16px; color:#006699; font-weight:bold;">
                                    <img src="../images/admin/loadingAnimation.gif" /><br />
                                    <label style="padding-top: 10px; ">Đang tải dữ liệu. Xin chờ trong giây lát...</label>
                                    </div>
                                    <div id='listTable'>
                                      {include file = $display}
                                    </div>
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