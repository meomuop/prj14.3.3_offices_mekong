{include file="_common_header.tpl"}
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<link rel="stylesheet" href="../css/admin/style.css" type="text/css" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>ĐĂNG NHẬP HỆ THỐNG PHẦN MỀM</title>
</head>
{literal}
<script language="javascript">
	function CheckLogin()
	{
		if(document.frmLogin.user_nickname.value=='')
		{
			alert("Xin vui lòng nhập USERNAME! ");
			document.frmLogin.user_nickname.focus();
			return false;
		}
		
		else if (!fnsCheckNumAlpha(document.frmLogin.user_nickname.value))
		{
		alert ("USER NAME nhập vào chỉ bao gồm ký tự từ a-z , 0-9 không được là Unicode,khoảng trắng, hay các ký tự lạ");
		document.frmLogin.user_nickname.focus();
		return false;
		}
				
		else if (document.frmLogin.user_nickname.value.length < 4 || document.frmLogin.user_nickname.value.length > 20)
		{
			 alert ("User Name nhập vào phải nhiều hơn 6 ký tự và nhỏ hơn 20 ký tự");							             
			 document.frmLogin.user_nickname.focus();
			 return false
			}
			
		else if(document.frmLogin.user_password.value=='')
		{
			alert("Xin vui lòng nhập PASSWORD! ");
			document.frmLogin.user_password.focus();
			return false;
		}
		
		else if (!fnsCheckNumAlpha(document.frmLogin.user_password.value))
		{
		alert ("PASSWORD nhập vào chỉ bao gồm ký tự từ a-z, từ 0-9 không được là Unicode,khoảng trắng, hay các ký tự lạ");
		document.frmLogin.user_password.focus();
		return false;
		}
		
		
		else if (document.frmLogin.user_password.value.length < 6 || document.frmLogin.user_password.value.length > 20)
		{
			 alert ("Password nhập vào phải nhiều hơn 6 ký tự và nhỏ hơn 20 ký tự");							            
			  document.frmLogin.user_password.focus();
			 return false
		}else
		{

		/*else if(frmLogin.code.value=='')
		{
			alert("Xin vui lòng nhập mã bảo vệ! ");
			frmLogin.code.focus();
			return false;
		}*/
		
		
		//document.frmLogin.mod.value='login';
		document.frmLogin.submit();
		return true;
		}
	}
</script>
{/literal}

<body onload="document.frmLogin.user_name.focus()">
	<form action="login.php" method="post" name="frmLogin" id="frmLogin">
    <input type="hidden" name="login" value="yes">
	<div id="login" style="width:100%; height:672px; background:url(../css/admin/img/Hacinco_login.jpg)">
    	<div id="text" style="float:left; margin-left: 63%; margin-top: 12%">
        <ul>
        	<li>
        	<input id="user_name" class="inputText w70pe" type="text" value="" name="user_name" style="color:#000000; background:#FFF; border:none;">
            </li>
            <li>
        	<input id="user_pass" class="inputText w70pe" type="password" value="" name="user_pass" style="color:#000000; background:#FFF;  border:none;margin-top:3px;">
            </li>
            <li>
        	<input id="db_year" class="inputText w70pe" type="text" value="{$smarty.now|date_format:'%Y'}" name="db_year" style="width:60px;color:#000000; background:#FFF; border:none; margin-top:10px; ">
            </li>
            
        </ul>
        </div>
        <div id="link" style="position:absolute; top:332px; right:355px; line-height:28px;">
        	<ul>
            	<li><a href="{$http_root}/images/Soffice.ico">Dowload icon tạo shortcut</a></li>
                <li><a href="https://www.mozilla.org/en-US/firefox/new/">Trình duyệt sử dụng : Firefox 3.5 trở lên [Tải trình duyệt]</a></li>
                <li><a href="{$http_root}admin/uploads/hdsd_phan_mem.pdf">Hướng dẫn sử dụng phần mềm [Tải hướng dẫn]</a></li>
                <li>Hỗ trợ kỹ thuật: Lê Anh Văn - 0972 559 746</li>
            </ul>
        </div>
		 <div id="btn" style="position:absolute; top:452px; right:410px; line-height:28px;">
         	<ul>
            	<li style="float:left;"><a href="#"><input type="submit"  onClick="return CheckLogin();" style="background: url(../css/admin/img/btndangnhap1.png) repeat scroll 0% 0% transparent; width: 106px; height: 39px; border: 0px none; cursor:pointer;" onmouseout="this.style.background='url(../css/admin/img/btndangnhap1.png)'" onmouseover="this.style.background='url(../css/admin/img/btndangnhap.png)'" value="" name="dx"></a></li>
                <li style="float:left;"><a href="#"><input type="reset" style="background: url(../css/admin/img/btnlamlai1.png) repeat scroll 0% 0% transparent; width: 106px; height: 39px; border: 0px none; cursor:pointer;" onmouseout="this.style.background='url(../css/admin/img/btnlamlai1.png)'" onmouseover="this.style.background='url(../css/admin/img/btnlamlai.png)'" value="" name="dx"></a></li>
            </ul>
		</div>
    </div>
    </form>
</body>
</html>