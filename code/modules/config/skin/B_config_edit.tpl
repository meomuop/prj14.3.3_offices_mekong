{literal}
<style type="text/css">
.error { color:#FF0000;font-weight:bold; }
.msg{ color:#00F; font-weight:bold; margin-left:5px; height:20px; line-height:20px}
</style>
<script language="javascript">
(function($) {

	$.fn.priceFormat = function(options) {

		var defaults = {
			//prefix: 'VNĐ ',
			centsSeparator: '.', 
			thousandsSeparator: ',',
			limit: false,
			centsLimit: 3
		};

		var options = $.extend(defaults, options);

		return this.each(function() {

			// pre defined options
			var obj = $(this);
			var is_number = /[0-9]/;

			// load the pluggings settings
			var prefix = options.prefix;
			var centsSeparator = options.centsSeparator;
			var thousandsSeparator = options.thousandsSeparator;
			var limit = options.limit;
			var centsLimit = options.centsLimit;

			// skip everything that isn't a number
			// and also skip the left zeroes
			function to_numbers (str) {
				var formatted = '';
				for (var i=0;i<(str.length);i++) {
					char = str.charAt(i);
					if (formatted.length==0 && char==0) char = false;
					if (char && char.match(is_number)) {
						if (limit) {
							if (formatted.length < limit) formatted = formatted+char;
						}else{
							formatted = formatted+char;
						}
					}
				}
				return formatted;
			}

			// format to fill with zeros to complete cents chars
			function fill_with_zeroes (str) {
				while (str.length<(centsLimit+1)) str = '0'+str;
				return str;
			}

			// format as price
			function price_format (str) {

				// formatting settings
				var formatted = fill_with_zeroes(to_numbers(str));
				var thousandsFormatted = '';
				var thousandsCount = 0;

				// split integer from cents
				var centsVal = formatted.substr(formatted.length-centsLimit,centsLimit);
				var integerVal = formatted.substr(0,formatted.length-centsLimit);

				// apply cents pontuation
				formatted = integerVal+centsSeparator+centsVal;

				// apply thousands pontuation
				if (thousandsSeparator) {
					for (var j=integerVal.length;j>0;j--) {
						char = integerVal.substr(j-1,1);
						thousandsCount++;
						if (thousandsCount%3==0) char = thousandsSeparator+char;
						thousandsFormatted = char+thousandsFormatted;
					}
					if (thousandsFormatted.substr(0,1)==thousandsSeparator) thousandsFormatted = thousandsFormatted.substring(1,thousandsFormatted.length);
					formatted = thousandsFormatted+centsSeparator+centsVal;
				}

				// apply the prefix
				if (prefix) formatted = prefix+formatted;

				return formatted;

			}

			// filter what user type (only numbers and functional keys)
			function key_check (e) {
		
				var code = (e.keyCode ? e.keyCode : e.which);
				var typed = String.fromCharCode(code);
				var functional = false;
				var str = obj.val();
				var newValue = price_format(str+typed);
				
				// allow keypad numbers, 0 to 9
				if(code >= 96 && code <= 105) functional = true;

				// check Backspace, Tab, Enter, and left/right arrows
				if (code ==  8) functional = true;
				if (code ==  9) functional = true;
				if (code == 13) functional = true;
				if (code == 37) functional = true;
				if (code == 39) functional = true;

				if (!functional) {
					e.preventDefault();
					e.stopPropagation();
					if (str!=newValue) obj.val(newValue);
				}

			}

			// inster formatted price as a value of an input field
			function price_it () {
				var str = obj.val();
				var price = price_format(str);
				if (str != price) obj.val(price);
			}

			// bind the actions
			$(this).bind('keydown', key_check);
			$(this).bind('keyup', price_it);
			if ($(this).val().length>0) price_it();
	
		});
	
	}; 		
	
})(jQuery);

$(function(){

	$('.site_logo').priceFormat({		
		centsSeparator: '.',
		thousandsSeparator: '.'
	});
});
</script>
{/literal}
<form enctype="multipart/form-data" action="?editConfig{$vars.arg}" method="post" name="frEdit" id="frEdit">
<div id="config_content_insign">
    <fieldset style="width:98%; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
    <legend class="legend">Chỉnh sửa</legend>
    	<h4 class="msg">Thông báo: 
        <span id="lblMessage" class="msg">Cập nhật đã thành công!</span>
        <span id="lblError" class="error">Mời bạn nhập đủ dữ liệu!</span>
        </h4>
    	<table width="98%" cellspacing="0" cellpadding="0" border="0" style="margin-left:5px">
        	<tr height="10"><td></td></tr>
            <tr height="30">
                <td width="25%">Tên đơn vị/tổ chức:</td>		
                <td align="left">
                <input type="text" id="owner_name" name="owner_name" class="text_long" value="{$vars.owner_name}"/></td>
            </tr>
            <tr height="30">
                <td align="left">Tên viết tắt:</td>
                <td align="left">
                <input type="text" id="owner_url" name="owner_url" class="text_short" value="{$vars.owner_url}"/></td>
            </tr>
            <tr height="30">
                <td align="left">Địa chỉ:</td>		
                <td align="left">
                <input type="text" id="owner_add" name="owner_add" class="text_long" value="{$vars.owner_add}"/></td>
            </tr>
            <tr height="30">
                <td align="left">Số điện thoại:</td>
                <td align="left">
                <input type="text" id="owner_phone" name="owner_phone" class="text_short" value="{$vars.owner_phone}"/></td>
            </tr>
            <tr height="30">
                <td align="left">Số fax:</td>
                <td align="left">
                <input type="text" id="owner_fax" name="owner_fax" class="text_short" value="{$vars.owner_fax}"/></td>
            </tr>
            <tr height="30">
                <td align="left">Email gửi tin:</td>
                <td align="left">
                <input type="text" id="owner_email" name="owner_email" class="text_middle" value="{$vars.owner_email}"/></td>
            </tr>
            <tr height="30">
                <td align="left">Lương cơ bản:</td>
                <td align="left">
                <input type="text" id="site_logo" name="site_logo" class="text_short" value="{$vars.site_logo}"/>&nbsp;(VNĐ)</td>
            </tr>
            <tr height="30">
                <td align="left">Cổng kết nối 3G:</td>
                <td align="left">
                <select name="site_port" id="site_port" class="select_short">
                    <option value="0">Chọn cổng</option>
                    {section name=pi loop=$obj_list_port}
                    <option value="{$obj_list_port[pi]->port_name}" {if $obj_list_port[pi]->port_name eq $vars.site_port}selected{/if}>{$obj_list_port[pi]->port_name}</option>
                    {/section}
                </select>&nbsp;(Có thể thay đổi mỗi khi kết nối USB 3G)
                </td>
            </tr>
            <tr height="30">
                <td align="left">Ngày mặc định:</td>
                <td align="left">
                <input type="text" id="site_banner" name="site_banner" class="text_short" value="{$vars.site_banner}"/>&nbsp;(Sẽ là ngày được dùng khi hạn xử lý bỏ trống)</td>
            </tr>
            <tr height="30">
                <td align="left">Thử bảy:</td>
                <td align="left">
                <input type="radio" name="sat_ra" id="sat_ra" value="0" {if $vars.sat_ra eq 0} checked{/if}>
                &nbsp;Làm cả ngày&nbsp;&nbsp;
                <input type="radio" name="sat_ra" id="sat_ra" value="1" {if $vars.sat_ra eq 1} checked{/if}>
                &nbsp;Làm nửa ngày&nbsp;&nbsp;
                <input type="radio" name="sat_ra" id="sat_ra" value="2" {if $vars.sat_ra eq 2} checked{/if}>
                &nbsp;Nghỉ
                </td>
            </tr>
            <tr height="30">
                <td align="left">Chủ nhật:</td>
                <td align="left">
                <input type="radio" name="sun_ra" id="sun_ra" value="0" {if $vars.sun_ra eq 0} checked{/if}>
                &nbsp;Làm cả ngày&nbsp;&nbsp;
                <input type="radio" name="sun_ra" id="sun_ra" value="1" {if $vars.sun_ra eq 1} checked{/if}>
                &nbsp;Làm nửa ngày&nbsp;&nbsp;
                <input type="radio" name="sun_ra" id="sun_ra" value="2" {if $vars.sun_ra eq 2} checked{/if}>
                &nbsp;Nghỉ
                </td>
            </tr>
            <tr height="30">
                <td>&nbsp;</td>
                <td align="left">
                <input type="button" name="editAct" id="editAct" value="Ghi lại" class="button" />
                <input type="hidden" name="arg" value="{$vars.arg}"/>
                <input type="hidden" name="config_id" id="config_id" value="{$vars.config_id}">
                <input type="reset" name="Reset" value="Hủy bỏ" class="button" />
                {literal}
				<script language="javascript">
					$(function() {
					$('.error').hide();
					$('#lblMessage').hide();
					 
					$("#editAct").click(function() {
						$('.error').hide();
						 
						var $form = $("#frEdit");
						var owner_name = $form.find('input#owner_name').val();
						var owner_url = $form.find('input#owner_url').val();
						var owner_add = $form.find('input#owner_add').val(); 
						var owner_phone = $form.find('input#owner_phone').val();     
						var owner_fax = $form.find('input#owner_fax').val();
						var owner_email = $form.find('input#owner_email').val();
						var site_logo = $form.find('input#site_logo').val();
						var site_port = $form.find('select#site_port :selected').val();
						var site_banner = $form.find('input#site_banner').val();
						var sat_ra = $form.find('input#sat_ra:checked').val();
						var sun_ra = $form.find('input#sun_ra:checked').val();
						var config_id = $form.find('input#config_id').val();
						 
						//begin validate form
						if (owner_name == "" || owner_url == ""){
							$('#lblError').show();
						}
						else{
							var dataString  = "owner_name=" + owner_name;
								dataString += "&owner_url=" + owner_url;
								dataString += "&owner_add=" + owner_add;
								dataString += "&owner_phone=" + owner_phone
								dataString += "&owner_fax=" + owner_fax
								dataString += "&owner_email=" + owner_email
								dataString += "&site_logo=" + site_logo
								dataString += "&site_port=" + site_port
								dataString += "&site_banner=" + site_banner
								dataString += "&sat_ra=" + sat_ra
								dataString += "&sun_ra=" + sun_ra
								dataString += "&config_id=" + config_id +"";
							//alert (dataString);return false;
							$.ajax({
								type: "POST",
								url: "index.php?editConfig&mod=config",
								data: dataString,
								success: function(data) {
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
                </td>
            </tr>
        </table>
    </fieldset>
</div>
<!-- Tool bar -->
<div id="config_clear_txt"></div>
<div id="config_tool_bar">
    &nbsp;
</div>
</form>
