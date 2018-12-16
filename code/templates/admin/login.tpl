<html>
<head>
    <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <title>HACINCO - OFFICE</title>
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
<body leftmargin="5" rightmargin="0" onload="document.frmLogin.user_name.focus()">
<div style="float:left; width: 100%">
    <!-----------------------------------phan banner---------------------------------------------->
    <div style="float:left; width:1200px; height:auto; margin:0 3% 0 2%; border:1px solid #bad2d5"><img src="../images/banner.jpg" width="1200"></div>

    <!-----------------------------------phan noi dung------------------------------------>
    <div style="float:left; width:1200px; height:535px; margin:1% 3% 0 2%; border:1px solid #bad2d5; background:url(../images/login_bg.jpg)">
        <fieldset class="login_fieldset">
            <legend class="login_legend">
                <div style="float:left; margin-left:5px; width:100px" id="cont_legend">Đăng nhập</div>
                <div style="float:left; font-size:12px; font-weight:normal; text-transform:none; margin-left:10px; color:#F00"><?php if(isset($lg_msg)) echo $lg_msg;?></div>
            </legend>
            <div style="float:left; width:400px; margin:5px" id="cont_div">
                <div style="float:left; width:150px">
                    <img src="../images/login_icon.png" width="140">
                </div>
                <div style="float:left; width:250px; line-height:30px">
                    <form name="frmLogin" id="frmLogin" action="login.php" method="post">
                        <div style="float:left; margin-top:10px">
                            <div style="float:left;width:100px">Tên đăng nhập:</div>
                            <div style="float:left;width:150px"><input type="text" name="user_name" id="user_name" class="login_txt" value=""></div>
                        </div>
                        <div style="float:left">
                            <div style="float:left;width:100px">Mật khẩu:</div>
                            <div style="float:left;width:150px"><input type="password" name="user_pass" id="user_pass" class="login_txt" value=""></div>
                        </div>
                        <div style="float:left">
                            <div style="float:left;width:100px">Năm dữ liệu:</div>
                            <div style="float:left;width:150px"><input type="text" name="db_year" id="db_year" class="login_txt" value="{$smarty.now|date_format:'%Y'}" style="width:60px"></div>
                        </div>
                        <div style="float:left">
                            <div style="float:left;width:100px">&nbsp;</div>
                            <div style="float:left;width:150px">
                                <input type="hidden" name="login" value="yes">
                                <input type="submit" onClick="return CheckLogin();" name="sub_btn" id="sub_btn" class="login_btn" value="Đăng nhập">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </fieldset>
    </div>
</div>
</body>
</html>