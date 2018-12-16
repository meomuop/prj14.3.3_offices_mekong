{include file = '_common_header.tpl'}
{literal}
<script language="javascript">
	function set_focus(){
		document.theForm.docLevel_id.focus();
	}
</script>
{/literal}
{literal}
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

	$('.hopdong_gtts_dn_td').priceFormat({		
		centsSeparator: '.',
		thousandsSeparator: '.'
	});
	
	$('.hopdong_ptt_vat').priceFormat({		
		centsSeparator: '.',
		thousandsSeparator: '.'
	});
	
	$('.hopdong_sophai_datcoc').priceFormat({		
		centsSeparator: '.',
		thousandsSeparator: '.'
	});
	
});
</script>
{/literal}
<body topmargin="0" bottommargin="0" leftmargin="0" rightmargin="0" onLoad="set_focus()">
<table cellspacing="0" cellpadding="0" width="1100" align="center" border="0">
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
                                                        <td  style="font-family: Arial; color:#930; font-size: 16px; font-weight: bold;" width="31%" nowrap="nowrap"><div align="left"><img src="../images/admin/module.png" align="absmiddle" height="30">&nbsp;Danh sách hợp động</div>
                                                        </td>	
                                                    </tr>
                                                    </tbody>
                                                 </table>
                                                 <br />
                                                 <fieldset style="width: 98%; ">
                                                 <legend >&nbsp;Thêm mới hợp động&nbsp;&nbsp;<em>(Ngày tháng có dạng dd-mm-YYYY hoặc dd/mm/YYYY)</em></legend>	
                                                 {if $complete eq 1}
                                                    <div align="left" style="width: 400px; background-color:#FFFFCC; padding: 10px 20px 10px 50px;">
                                                    <li style=" padding: 0px; padding-left: 10px; font-size: 14px; color:#00F">Số đến:&nbsp;<font style="font-size:28px; font-weight:bold">{$lastNum}</font></li>
                                                    </div>
                                                 {/if}	
                                                 <form action="?addHopdong{$vars.arg}" method="POST" name="theForm">
                                                 {if $error neq ""}
                                                    <div align="left" style="width: 400px; background-color:#FFFFCC; padding: 10px 20px 10px 50px;">
                                                    <label style=" font-size: 16px; color:#990000; font-weight:bold; padding-bottom:5px;">Thông báo:</label><BR />
                                                    <li style=" padding: 0px; padding-left: 10px; font-size: 14px; color:#C24510">{$error}</li>
                                                    </div>
                                                 {/if}	
                                                 <div><img src="../images/admin/spacer.gif" style="height:10px;" /></div>
                                                 <div align="center">
                                                 <table width="100%">
                                                 	<tr>
                                                    	<td align="left">
                                                        Trích yếu văn bản:<br>
                                                        {$doc_info.doc_desc}
                                                        </td>
                                                    </tr>
                                                    <tr height="10"><td></td></tr>
                                                    <tr>
                                                        <td align="center" colspan="2">
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                              <tr>
                                                                <td width="15%" align="left" height="20">
                                                                <font class="label_font" color="#425E89">Văn bản đến *:</font></td>		
                                                                <td align="left" width="25%">
                                                                <input type="hidden" style="width: 160px;" value="{$doc_info.doc_id}" id="doc_code" name="doc_code" class="ac_input"/>{$doc_info.doc_code}
                                                                </td>
                                                                <td align="left" height="20" width="15%">
                                                                <font class="label_font" color="#425E89">Người tạo/sửa *:</font></td>		
                                                                <td align="left">
                                                                	<input type="hidden" style="width: 160px;" value="{$access_user_id}" id="hopdong_nguoitao" name="hopdong_nguoitao" class="ac_input"/>{$access_user_fullname}
                                                                </td>
                                                              </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr height="10"><td></td></tr>
                                                    <tr>
                                                        <td align="center" colspan="2">
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                              <tr>
                                                                <td width="15%" align="left" height="20">
                                                                <font class="label_font" color="#425E89">Thời điểm tạo *:</font></td>		
                                                                <td align="left" width="25%">
                                                                <input type="text" name="hopdong_ngaytao" id="hopdong_ngaytao" value="{$vars.hopdong_ngaytao}" maxlength="250" class="text" style="width:127px"/>
                                                                &nbsp;
                                                                <img src="../images/admin/img.gif"  align="absmiddle" id="icon_date01" style="cursor: pointer; border: 0" title="Chọn ngày trên lịch"/>
                                                                </td>
                                                                {literal}
                                                                <script type="text/javascript">
                                                                    Calendar.setup({
                                                                        inputField   :   "hopdong_ngaytao",
                                                                        ifFormat     :   "%d-%m-%Y",
                                                                        button       :   "icon_date01",
                                                                        align        :   "Br",  
                                                                        timeFormat   :   "24",
                                                                        showsTime    :   true,
                                                                        singleClick  :   true
                                                                    });
                                                                </script>
                                                                {/literal}
                                                                <td width="15%" align="left" height="20">
                                                                <font class="label_font" color="#425E89">Báo cáo sau *:</font></td>		
                                                                <td align="left" width="15%">
                                                                <input type="text" style="width: 40px;" value="{$vars.hopdong_ngaybaocao}" id="hopdong_ngaybaocao" name="hopdong_ngaybaocao" class="ac_input"/>(ngày)
                                                                </td>
                                                                <td width="15%" align="left" height="20">
                                                                <font class="label_font" color="#425E89">Hợp đồng là *:</font></td>		
                                                                <td align="left">
                                                                <input type="text" style="width: 40px;" value="{$vars.hopdong_ngaydukien}" id="hopdong_ngaydukien" name="hopdong_ngaydukien" class="ac_input"/>(ngày)
                                                                </td>
                                                              </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr height="10"><td></td></tr>
                                                    <tr height="10"><td>Phân loại tài sản:</td></tr>
                                                    <tr>
                                                        <td align="center" colspan="2">
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                              <tr>
                                                                <td width="15%" align="left" height="20">
                                                                <font class="label_font" color="#425E89">Ngân sách *:</font></td>		
                                                                <td align="left" width="25%">
                                                                <select name="ngansach_id" style="width:160px">
                                                                	<option value="0">Chọn nguồn ngân sách</option>
                                                                    {section name=qi loop=$obj_list_ngansach}
                                                                    <option value="{$obj_list_ngansach[qi]->ngansach_id}" {if $obj_list_ngansach[qi]->ngansach_id eq $vars.ngansach_id}selected="selected"{/if}>-&nbsp;{$obj_list_ngansach[qi]->ngansach_name}</option>
                                                                    {/section}
                                                                </select>
                                                                </td>
                                                                <td width="15%" align="left" height="20">
                                                                <font class="label_font" color="#425E89">Nhóm tài sản *:</font></td>		
                                                                <td align="left" width="15%">
                                                                <select name="taisan_id" id="taisan_id" style="width:90px">
                                                                	<option value="0">Chọn nhóm</option>
                                                                    {section name=qi loop=$obj_list_taisan}
                                                                    <option value="{$obj_list_taisan[qi]->taisan_id}" {if $obj_list_taisan[qi]->taisan_id eq $vars.taisan_id}selected="selected"{/if}>-&nbsp;{$obj_list_taisan[qi]->taisan_standfor}</option>
                                                                    {/section}
                                                                </select>
                                                                {literal}
																<script language="javascript">
                                                                $("#taisan_id").change( function () { 
                                                                     var taisan_id = $("#taisan_id").val();
                                                                     $("#j_taisan").load("index.php?B_getlistLoaitaisans&taisan_id="+taisan_id);
                                                                    });
                                                                </script>
                                                                {/literal}
                                                                </td>
                                                                <td width="15%" align="left" height="20">
                                                                <font class="label_font" color="#425E89">Loại tài sản *:</font></td>		
                                                                <td align="left">
                                                                <div id="j_taisan">
                                                                <select name="loaitaisan_id" id="loaitaisan_id" style="width:90px">
                                                                <option value="0">Chọn loại</option>
                                                                </select>
                                                                </div>
                                                                </td>
                                                              </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr height="10"><td></td></tr>
                                                    <tr>
                                                        <td align="center" colspan="2">
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                              <tr>
                                                                <td width="15%" align="left" height="20">
                                                                <font class="label_font" color="#425E89">Tình trạng *:</font></td>		
                                                                <td align="left">
                                                                <select name="hopdong_tinhtrang" style="width:160px">
                                                                	<option value="0">Đang thực hiện</option>
                                                                    <option value="1">Hủy bỏ</option>
                                                                    <option value="2">Đã hoàn thành</option>
                                                                </select>
                                                                </td>
                                                              </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr height="10"><td></td></tr>
                                                    <tr>
                                                        <td align="center" colspan="2">
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                	<td width="15%" align="left" height="20">
                                                                    <font class="label_font" color="#425E89">Khách hàng *:</font></td>
                                                                    <td align="left">
                                                                    <input type="text" style="width: 683px;" value="{$doc_info.unit_name}" id="hopdong_khachhang" name="hopdong_khachhang" class="ac_input" readonly/>
                                                                    </td>
                                                                </tr>
                                                             </table>
                                                        </td>
                                                    </tr>
                                                    <tr height="10"><td></td></tr>
                                                    <tr>
                                                        <td align="center" colspan="2">
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                	<td align="left" height="20">
                                                                    <font class="label_font" color="#425E89">Trích dẫn nội dung hợp đồng *:</font></td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="left">
                                                                    <textarea name="hopdong_trichdan" cols="10" rows="10" style="width:810px; height:60px" spellcheck="false">{$vars.hopdong_trichdan}</textarea>
                                                                    </td>
                                                                </tr>
                                                             </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                    	<td align="center">
                                                        	 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                              <tr>
                                                                <td width="15%" align="left" height="20">
                                                                <font class="label_font" color="#425E89">Giai đoạn HĐ *:</font></td>		
                                                                <td align="left">
                                                                <select name="hopdong_giaidoan" style="width:250px">
                                                                    <option value="0">Chọn giá trị</option>
                                                                    <option value="1">Cấp số hợp đồng/ phụ lục/ tái thẩm</option>
                                                                    <option value="2">Cấp số chứng thư/ thánh lý</option>                                                            	</select>
                                                                </td>
                                                              </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                    	<td align="center">
                                                        	 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                              <tr>
                                                                <td width="15%" align="left" height="20">
                                                                <font class="label_font" color="#425E89">Loại *:</font></td>		
                                                                <td align="left">
                                                                <input type="radio" name="hopdong_type" value="1" checked> Hợp đồng
                                                                {if $hd_num gt 0}
                                                                <input type="radio" name="hopdong_type" value="2"> Phụ lục
                                                                <input type="radio" name="hopdong_type" value="3"> Tái thẩm
                                                                {/if}
                                                                </td>
                                                              </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr height="10"><td></td></tr>
                                                    <tr><td colspan="2">Dành cho hợp đồng thẩm định</td></tr>
                                                    <tr>
                                                        <td align="center" colspan="2">
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                              <tr>
                                                                <td width="15%" align="left" height="20">
                                                                <font class="label_font" color="#425E89">GTTS đề nghị TĐ:</font></td>		
                                                                <td align="left" width="13%">
                                                                <input type="text" style="width: 85px;" value="{$vars.hopdong_gtts_dn_td}" name="hopdong_gtts_dn_td" class="hopdong_gtts_dn_td"/>
                                                                </td>
                                                                <td width="12%" align="left" height="20">
                                                                <font class="label_font" color="#425E89">Phí tạm tính:</font></td>		
                                                                <td align="left" width="30%">
                                                                Tỉ lệ: <input type="text" style="width: 20px;" value="{$vars.hopdong_tile_ptt}" name="hopdong_tile_ptt"/>%&nbsp;&nbsp;
                                                                Phí có VAT: 
                                                                <input type="text" style="width: 85px;" value="{$vars.hopdong_ptt_vat}" name="hopdong_ptt_vat" class="hopdong_ptt_vat"/>
                                                                </td>
                                                                <td width="15%" align="left" height="20">
                                                                <font class="label_font" color="#425E89">Số phải đặt cọc:</font></td>		
                                                                <td align="left">
                                                                <input type="text" style="width: 85px;" value="{$vars.hopdong_sophai_datcoc}" name="hopdong_sophai_datcoc" class="hopdong_sophai_datcoc"/>
                                                                </td>
                                                              </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr><td colspan="2">Dành cho hợp đồng bán đấu giá</td></tr>
                                                    <tr>
                                                        <td align="center" colspan="2">
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                              <tr>
                                                                <td width="15%" align="left" height="20">
                                                                <font class="label_font" color="#425E89">Giá trị hợp đồng:</font></td>		
                                                                <td align="left">
                                                                <input type="text" style="width: 85px;" value="{$vars.hopdong_gtts_dn_td}" name="hopdong_gtts_dn_td" class="hopdong_gtts_dn_td"/>
                                                                </td>
                                                              </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr height="10"><td></td></tr>
                                                    <tr>
                                                        <td colspan="2" align="left" style="padding-top:10px">
                                                        <input type="submit" name="submitHopdong" value="Thêm mới"/>
                                                        <input type="hidden" name="arg" value="{$vars.arg}" />	
                                                        <input type="hidden" name="input_per" value="{$access_user_id}">	
                                                        <input type="reset" name="reset" value="Quay lại &gt;&gt;" onClick="history.go(-1)">&nbsp;<b>(Người nhập hợp động: {$access_user_name})</b>
                                                        </td>
                                                    </tr>
                                                 </table>
                                                 </div>
                                                 </form>							
                                                 </fieldset>
                                            </td>
                                        </tr>
                                    </table>
                                    <!-- *************** END - PHAN NOI DUNG THAY DOI *********************** -->
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