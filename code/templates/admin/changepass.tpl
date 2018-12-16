<link rel="stylesheet" href="../css/admin/style_login.css" type="text/css" />
<form action="" method="POST" name="addForm" id="addForm">
<div align="center">
<table width="100%">
  <tr>
      <td align="right" height="20">Mật khẩu hiện tại *:</td>
      <td align="left">
      <input type="password" id="user_cur_pass" name="user_cur_pass" autocomplete="off" class="text_short" value=""/></td>
  </tr>
  <tr>
      <td align="right" height="20">Mật khẩu mới *:</td>
      <td align="left">
      <input type="password" id="user_pass" name="user_pass" autocomplete="off" class="text_short" value=""/></td>
  </tr>
  <tr>
      <td align="right" height="20">Xác nhận mật khẩu *:</td>
      <td align="left">
      <input type="password" id="userPassConfirm" name="userPassConfirm" autocomplete="off" class="text_short" value=""/></td>
  </tr>
  <tr>
  	  <td align="left" height="20">&nbsp;</td>
      <td align="left">
      <input type="button" id="submitUser" name="submitUser" value="Ghi lại" class="button_middle"/>
      <input type="hidden" name="arg" value="{$vars.arg}" />		
      </td>
      {literal}
	  <script language="javascript">
       		$("#submitUser").click(function() {
              $('.error').hide();
               
              var $form = $("#addForm");
			  var user_cur_pass = $form.find('input#user_cur_pass').val();
			  var user_pass = $form.find('input#user_pass').val();
			  var userPassConfirm = $form.find('input#userPassConfirm').val();
               
              //begin validate form
              if(user_pass!=userPassConfirm){
				  alert("Mật khẩu không trùng khớp");
				  $('#user_pass').focus();
				  return false;
			  }else{
				  var dataString  = "user_cur_pass=" + user_cur_pass;
                      dataString += "&user_pass=" + user_pass;
                      //alert (dataString);return false;
                  $.ajax({
                      type: "POST",
                      url: "changepass.php?add_edit=1",
                      data: dataString,
                      success: function(data) {
						  if(data!=1)
						  	  alert("Mật khẩu hiện tại không chính xác.");
						  else{
							  $('#div_edit_pass').css({'display':'none'});
							  alert("Thay đổi mật khẩu thành công.");
						  }
                      }
                  });
                  return false;
              }
              //end form
          });
      </script>
      {/literal}
  </tr>
</table>
</div>
</form>							
