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
                                                 <legend >&nbsp;Thông tin hợp động&nbsp;&nbsp;</legend>	
                                                 {if $complete eq 1}
                                                    <div><img src="images/spacer.gif" height="30px" /></div>
                                                    <div align="center" class="complele_alert">
                                                    <h2>Sửa hợp động thành công</h2><br /><br />
                                                    </div>
                                                 {else}
                                                 <form action="?editHopdong{$arg.arg}" method="POST" name="editForm">
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
                                                                	<input type="hidden" style="width: 160px;" value="{$vars.hopdong_nguoitao}" id="hopdong_nguoitao" name="hopdong_nguoitao" class="ac_input"/>{$users_info.user_fullname}
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
                                                                {if $vars.hopdong_nguoitao eq $access_user_id}
                                                                <input type="text" name="hopdong_ngaytao" id="hopdong_ngaytao" value="{$vars.hopdong_ngaytao|date_format:'%d-%m-%Y'}" maxlength="250" class="text" style="width:127px"/>
                                                                &nbsp;
                                                                <img src="../images/admin/img.gif"  align="absmiddle" id="icon_date01" style="cursor: pointer; border: 0" title="Chọn ngày trên lịch"/>
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
                                                                {else}
                                                                <input type="text" name="hopdong_ngaytao" id="hopdong_ngaytao" value="{$vars.hopdong_ngaytao|date_format:'%d-%m-%Y'}" style="width:127px; border:none"/>
                                                                {/if}
                                                                </td>
                                                                <td width="15%" align="left" height="20">
                                                                <font class="label_font" color="#425E89">Báo cáo sau *:</font></td>		
                                                                <td align="left" width="15%">
                                                                {if $user_level eq 6}
                                                                <input type="text" style="width: 40px;" value="{$vars.hopdong_ngaybaocao}" id="hopdong_ngaybaocao" name="hopdong_ngaybaocao" class="ac_input"/>
                                                                {else}
                                                                {$vars.hopdong_ngaybaocao}
                                                                <input type="hidden" value="{$vars.hopdong_ngaybaocao}" name="hopdong_ngaybaocao"/>
                                                                {/if}
                                                                (ngày)
                                                                </td>
                                                                <td width="15%" align="left" height="20">
                                                                <font class="label_font" color="#425E89">Hợp đồng là *:</font></td>		
                                                                <td align="left">
                                                                {if $user_level eq 6}
                                                                <input type="text" style="width: 40px;" value="{$vars.hopdong_ngaydukien}" id="hopdong_ngaydukien" name="hopdong_ngaydukien" class="ac_input"/>
                                                                {else}
                                                                {$vars.hopdong_ngaydukien}
                                                                <input type="hidden" value="{$vars.hopdong_ngaydukien}" name="hopdong_ngaydukien"/>
                                                                {/if}
                                                                (ngày)
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
                                                                {if $vars.hopdong_nguoitao eq $access_user_id}
                                                                <select name="ngansach_id" style="width:160px">
                                                                	<option value="0">Chọn nguồn ngân sách</option>
                                                                    {section name=qi loop=$obj_list_ngansach}
                                                                    <option value="{$obj_list_ngansach[qi]->ngansach_id}" {if $obj_list_ngansach[qi]->ngansach_id eq $vars.ngansach_id}selected="selected"{/if}>-&nbsp;{$obj_list_ngansach[qi]->ngansach_name}</option>
                                                                    {/section}
                                                                </select>
                                                                {else}
                                                                	{section name=qi loop=$obj_list_ngansach}
                                                                    {if $obj_list_ngansach[qi]->ngansach_id eq $vars.ngansach_id}
                                                                    {$obj_list_ngansach[qi]->ngansach_name}
                                                                    {/if}
                                                                    {/section}
                                                                    <input type="hidden" value="{$vars.ngansach_id}" name="ngansach_id"/>
                                                                {/if}
                                                                </td>
                                                                <td width="15%" align="left" height="20">
                                                                <font class="label_font" color="#425E89">Nhóm tài sản *:</font></td>		
                                                                <td align="left" width="15%">
                                                                {if $vars.hopdong_nguoitao eq $access_user_id}
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
                                                                {else}
                                                                	{section name=qi loop=$obj_list_taisan}
                                                                    {if $obj_list_taisan[qi]->taisan_id eq $vars.taisan_id}
                                                                    {$obj_list_taisan[qi]->taisan_standfor}
                                                                    {/if}
                                                                    {/section}
                                                                    <input type="hidden" value="{$vars.taisan_id}" name="taisan_id"/>
                                                                {/if}
                                                                </td>
                                                                <td width="15%" align="left" height="20">
                                                                <font class="label_font" color="#425E89">Loại tài sản *:</font></td>		
                                                                <td align="left">
                                                                <div id="j_taisan">
                                                                {if $vars.hopdong_nguoitao eq $access_user_id}
                                                                <select name="loaitaisan_id" id="loaitaisan_id" style="width:90px">
                                                                <option value="0">Chọn loại</option>
                                                                {section name=lts loop=$obj_list_loaitaisan}
                                                                {if $obj_list_loaitaisan[lts]->loaitaisan_id eq $vars.loaitaisan_id}
                                                                <option value="{$obj_list_loaitaisan[lts]->loaitaisan_id}" selected="selected">-&nbsp;{$obj_list_loaitaisan[lts]->loaitaisan_standfor}</option>
                                                                {/if}
                                                                {/section}
                                                                </select>
                                                                {else}
                                                                	{section name=lts loop=$obj_list_loaitaisan}
                                                                    {if $obj_list_loaitaisan[lts]->loaitaisan_id eq $vars.loaitaisan_id}
                                                                    {$obj_list_loaitaisan[lts]->loaitaisan_standfor}
                                                                    {/if}
                                                                    {/section}
                                                                    <input type="hidden" value="{$vars.loaitaisan_id}" name="loaitaisan_id"/>
                                                                {/if}
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
                                                                {if $vars.hopdong_nguoitao eq $access_user_id}
                                                                <select name="hopdong_tinhtrang" style="width:160px">
                                                                	<option value="0" {if $vars.hopdong_tinhtrang eq 0}selected{/if}>Đang thực hiện</option>
                                                                    <option value="1" {if $vars.hopdong_tinhtrang eq 1}selected{/if}>Hủy bỏ</option>
                                                                    <option value="2" {if $vars.hopdong_tinhtrang eq 2}selected{/if}>Đã hoàn thành</option>
                                                                </select>
                                                                {else}
                                                                	{if $vars.hopdong_tinhtrang eq 0}Đang thực hiện{/if}
                                                                    {if $vars.hopdong_tinhtrang eq 1}Hủy bỏ{/if}
                                                                    {if $vars.hopdong_tinhtrang eq 2}Đã hoàn thành{/if}
                                                                    <input type="hidden" value="{$vars.hopdong_tinhtrang}" name="hopdong_tinhtrang"/>
                                                                {/if}
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
                                                                    <input type="text" style="width: 683px; border:none" value="{$doc_info.unit_name}" id="hopdong_khachhang" name="hopdong_khachhang" class="ac_input" readonly/>
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
                                                                    {if $vars.hopdong_nguoitao eq $access_user_id}
                                                                    <textarea name="hopdong_trichdan" cols="10" rows="10" style="width:810px; height:60px" spellcheck="false">{$vars.hopdong_trichdan}</textarea>
                                                                    {else}
                                                                        <textarea name="hopdong_trichdan" cols="10" rows="10" style="width:715px; height:60px; border:none" spellcheck="false" readonly>{$vars.hopdong_trichdan}</textarea>
                                                                        
                                                                    {/if}
                                                                    </td>
                                                                </tr>
                                                             </table>
                                                        </td>
                                                    </tr>
                                                    <tr height="10"><td></td></tr>
                                                    <tr>
                                                    	<td align="center">
                                                        	 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                              <tr>
                                                                <td width="15%" align="left" height="20">
                                                                <font class="label_font" color="#425E89">Giai đoạn HĐ *:</font></td>		
                                                                <td align="left">
                                                                {if $vars.hopdong_nguoitao eq $access_user_id}
                                                                <select name="hopdong_giaidoan" style="width:250px">
                                                                    <option value="0">Chọn giá trị</option>
                                                                    <option value="1" {if $vars.hopdong_giaidoan eq 1}selected{/if}>Cấp số hợp đồng/ phụ lục/ tái thẩm</option>
                                                                    <option value="2" {if $vars.hopdong_giaidoan eq 2}selected{/if}>Cấp số chứng thư/ thánh lý</option>                       </select>
                                                                {else}
                                                                	{if $vars.hopdong_giaidoan eq 1}Cấp số hợp đồng/ phụ lục/ tái thẩm{/if}
                                                                    {if $vars.hopdong_giaidoan eq 2}Cấp số chứng thư/ thánh lý{/if}
                                                                    <input type="hidden" value="{$vars.hopdong_giaidoan}" name="hopdong_giaidoan"/>
                                                                {/if}
                                                                </td>
                                                              </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr height="10"><td></td></tr>
                                                    <tr>
                                                    	<td align="center">
                                                        	 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                              <tr>
                                                                <td width="15%" align="left" height="20">
                                                                <font class="label_font" color="#425E89">Loại *:</font></td>		
                                                                <td align="left">
                                                                <input type="radio" name="hopdong_type" value="1" {if $vars.hopdong_type eq 1} checked {/if}> Hợp đồng
                                                                {if $hd_num gt 0}
                                                                <input type="radio" name="hopdong_type" value="2" {if $vars.hopdong_type eq 2} checked {/if}> Phụ lục
                                                                <input type="radio" name="hopdong_type" value="3" {if $vars.hopdong_type eq 3} checked {/if}> Tái thẩm
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
                                                                {if $hopdong_tile_ptt neq ''}
                                                                    {if $vars.hopdong_nguoitao eq $access_user_id}
                                                                    <input type="text" style="width: 85px;" value="{$vars.hopdong_gtts_dn_td}" class="hopdong_gtts_dn_td" name="hopdong_gtts_dn_td"/>
                                                                    {else}
                                                                    <input type="hidden" value="{$vars.hopdong_gtts_dn_td}" name="hopdong_gtts_dn_td"/>
                                                                    {/if}
                                                                {else}
                                                                <input type="text" style="width: 85px;" value="" class="hopdong_gtts_dn_td" name="hopdong_gtts_dn_td"/>
                                                                {/if}
                                                                </td>
                                                                <td width="12%" align="left" height="20">
                                                                <font class="label_font" color="#425E89">Phí tạm tính:</font></td>		
                                                                <td align="left" width="30%">
                                                                {if $vars.hopdong_nguoitao eq $access_user_id}
                                                                Tỉ lệ: <input type="text" style="width: 20px;" value="{$vars.hopdong_tile_ptt}" name="hopdong_tile_ptt"/>%&nbsp;&nbsp;
                                                                Phí có VAT: 
                                                                <input type="text" style="width: 85px;" value="{$vars.hopdong_ptt_vat}" name="hopdong_ptt_vat" class="hopdong_ptt_vat"/>
                                                                {else}
                                                                <input type="hidden" value="{$vars.hopdong_tile_ptt}" name="hopdong_tile_ptt"/>
                                                                <input type="hidden" value="{$vars.hopdong_ptt_vat}" name="hopdong_ptt_vat"/>
                                                                {/if}
                                                                </td>
                                                                <td width="15%" align="left" height="20">
                                                                <font class="label_font" color="#425E89">Số phải đặt cọc:</font></td>		
                                                                <td align="left">
                                                                {if $vars.hopdong_nguoitao eq $access_user_id}
                                                                <input type="text" style="width: 85px;" value="{$vars.hopdong_sophai_datcoc}" class="hopdong_sophai_datcoc" name="hopdong_sophai_datcoc"/>
                                                                {else}
                                                                <input type="hidden" value="{$vars.hopdong_sophai_datcoc}" name="hopdong_sophai_datcoc"/>
                                                                {/if}
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
                                                                {if $vars.hopdong_nguoitao eq $access_user_id}
                                                                <input type="text" style="width: 85px;" value="{$vars.hopdong_gtts_dn_td}" class="hopdong_gtts_dn_td" name="hopdong_gtts_dn_td"/>
                                                                {else}
                                                                <input type="hidden" value="{$vars.hopdong_gtts_dn_td}" name="hopdong_gtts_dn_td"/>
                                                                {/if}
                                                                </td>
                                                              </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr height="10"><td></td></tr>
                                                    {if $user_level eq 6 or $user_level eq 7 or $user_level eq 8}
                                                    <tr>
                                                        <td colspan="2" align="left" style="padding-top:10px">
                                                        <input type="submit" name="submitHopdong" value="Cập nhật"/>
                                                        <input type="hidden" name="arg" value="{$arg.arg}" />
                                                        <input type="hidden" name="hopdong_id" value="{$vars.hopdong_id}">
                                                        <input type="hidden" name="hopdong_sohd" value="{$vars.hopdong_sohd}">
                                                        <input type="hidden" name="hopdong_ngaycap_sohd" value="{$vars.hopdong_ngaycap_sohd}">
                                                        <input type="hidden" name="hopdong_soct" value="{$vars.hopdong_soct}">
                                                        <input type="hidden" name="hopdong_ngaycap_soct" value="{$vars.hopdong_ngaycap_soct}">
                                                        <input type="reset" name="reset" value="Quay lại &gt;&gt;" onClick="history.go(-1)">
                                                        </td>
                                                    </tr>
                                                    {/if}
                                                 </table>
                                                 </div>
                                                 </form>
                                                 </fieldset>
                                                 
                                                 
                                                 <!--Phan hien thi thong tin do ke toan cap nhat-->
                                                 <fieldset style="width: 98%; ">
                                                 <legend >&nbsp;Các khoản tiền liên quan&nbsp;&nbsp;</legend>	
                                                 <table width="100%">
                                                    <tr>
                                                    	<td align="left" width="25%">Số đã đặt cọc:</td>
                                                        <td align="left" width="25%">{$ketoan_info.so_tien_da_dat_coc|price_format}</td>
                                                        <td align="left">Tổng GT TĐ	thực tế:</td>
                                                        <td align="left">{$ketoan_info.gt_ts_tham_dinh_thuc|price_format}</td>
                                                    </tr>
                                                 </table>
                                                 </fieldset>
                                                 
                                                 <!--Phan danh cho van thu cap nhat-->
                                                 <fieldset style="width: 98%; ">
                                                 <legend >&nbsp;Số hợp đồng/phụ lục/tái thẩm - Số chứng thư/thanh lý&nbsp;&nbsp;</legend>	
                                                 <form action="?editHopdong{$arg.arg}" method="POST" name="theeditForm">
                                                 <div align="center">
                                                 <table width="100%">
                                                    <tr>
                                                    	<td>
                                                    		<table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                              <tr>
                                                                <td width="30%" align="left" height="20">
                                                                <font class="label_font" color="#425E89">Số hợp đồng/ phụ lục/ tái thẩm:</font></td>		
                                                                <td align="left">
                                                                {if $user_level eq 9}
                                                                <input type="text" style="width: 135px;" value="{$vars.hopdong_sohd}" id="hopdong_sohd" name="hopdong_sohd" class="ac_input"/>
                                                                {else}<input type="text" style="width: 135px; border:none" value="{$vars.hopdong_sohd}" id="hopdong_sohd" name="hopdong_sohd" class="ac_input" readonly/>{/if}
                                                                </td>
                                                                <td width="15%" align="left" height="20">
                                                                <font class="label_font" color="#425E89">Ngày cấp *:</font></td>		
                                                                <td align="left" width="25%">
                                                                {if $user_level eq 9}
                                                                <input type="text" name="hopdong_ngaycap_sohd" id="hopdong_ngaycap_sohd" value="{if $vars.hopdong_ngaycap_sohd neq '0000-00-00'}{$vars.hopdong_ngaycap_sohd|date_format:'%d-%m-%Y'}{/if}" maxlength="250" class="text" style="width:127px"/>
                                              					&nbsp;
                                                                <img src="../images/admin/img.gif"  align="absmiddle" id="icon_date02" style="cursor: pointer; border: 0" title="Chọn ngày trên lịch"/>
                                                                {literal}
                                                                <script type="text/javascript">
                                                                    Calendar.setup({
                                                                        inputField   :   "hopdong_ngaycap_sohd",
                                                                        ifFormat     :   "%d-%m-%Y",
                                                                        button       :   "icon_date02",
                                                                        align        :   "Br",  
                                                                        timeFormat   :   "24",
                                                                        showsTime    :   true,
                                                                        singleClick  :   true
                                                                    });
                                                                </script>
                                                                {/literal}                  	
                                                             	{else}
                                                               	<input type="text" name="hopdong_ngaycap_sohd" id="hopdong_ngaycap_sohd" value="{if $vars.hopdong_ngaycap_sohd neq '0000-00-00'}{$vars.hopdong_ngaycap_sohd|date_format:'%d-%m-%Y'}{/if}" class="text" style="width:127px; border:none" readonly/>
                                                                {/if}
                                                                </td>
                                                              </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    {if $vars.hopdong_giaidoan eq 2}
                                                    <tr height="10"><td></td></tr>
                                                    <tr>
                                                    	<td>
                                                    		<table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                              <tr>
                                                                <td width="30%" align="left" height="20">
                                                                <font class="label_font" color="#425E89">Số chứng thư/thanh lý:</font></td>		
                                                                <td align="left">
                                                                {if $user_level eq 9}
                                                                <input type="text" style="width: 135px;" value="{$vars.hopdong_soct}" id="hopdong_soct" name="hopdong_soct" class="ac_input"/>
                                                                {else}
                                                                <input type="text" style="width: 135px; border:none" value="{$vars.hopdong_soct}" id="hopdong_soct" name="hopdong_soct" class="ac_input" readonly/>
                                                                {/if}
                                                                </td>
                                                                <td width="15%" align="left" height="20">
                                                                <font class="label_font" color="#425E89">Ngày cấp *:</font></td>		
                                                                <td align="left" width="25%">
                                                                {if $user_level eq 9}
                                                                <input type="text" name="hopdong_ngaycap_soct" id="hopdong_ngaycap_soct" value="{if $vars.hopdong_ngaycap_soct neq ''}{$vars.hopdong_ngaycap_soct|date_format:'%d-%m-%Y'}{/if}" maxlength="250" class="text" style="width:127px"/>
                                                                &nbsp;
                                                                <img src="../images/admin/img.gif"  align="absmiddle" id="icon_date03" style="cursor: pointer; border: 0" title="Chọn ngày trên lịch"/>
                                                                {literal}
                                                                <script type="text/javascript">
                                                                    Calendar.setup({
                                                                        inputField   :   "hopdong_ngaycap_soct",
                                                                        ifFormat     :   "%d-%m-%Y",
                                                                        button       :   "icon_date03",
                                                                        align        :   "Br",  
                                                                        timeFormat   :   "24",
                                                                        showsTime    :   true,
                                                                        singleClick  :   true
                                                                    });
                                                                </script>
                                                                {/literal}
                                                                {else}
                                                                <input type="text" name="hopdong_ngaycap_soct" id="hopdong_ngaycap_soct" value="{if $vars.hopdong_ngaycap_soct neq '0000-00-00'}{$vars.hopdong_ngaycap_soct|date_format:'%d-%m-%Y'}{/if}" style="width:127px; border:none"/>
                                                                {/if}
                                                                </td>
                                                              </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    {/if}
                                                    <tr height="10"><td></td></tr>
                                                    {if $user_level eq 9}
                                                    <tr>
                                                        <td colspan="2" align="left" style="padding-top:10px">
                                                        <input type="submit" name="editSHD" value="Lưu lại"/>
                                                        <input type="hidden" name="arg" value="{$arg.arg}" />
                                                        <input type="hidden" name="hopdong_id" value="{$vars.hopdong_id}">
                                                        <input type="reset" name="reset" value="Quay lại &gt;&gt;" onClick="history.go(-1)">
                                                        </td>
                                                    </tr>
                                                    {/if}
                                                 </table>
                                                 </div>
                                                 </form>
                                                 </fieldset>
                                                 
                                                 <!--Phan danh cho cap nhat giai doan va cac buoc-->
                                                 <fieldset style="width: 98%; ">
                                                 <legend >&nbsp;Quy trình thực hiện hợp đồng&nbsp;&nbsp;</legend>	
                                                 <form action="?editHopdong{$arg.arg}" method="POST" name="theForm">
                                                 <div align="center">
                                                 <table width="100%">
                                                    {if $vars.hopdong_nguoitao eq $access_user_id}
                                                    <tr>
                                                        <td align="center" colspan="2">
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                              <tr>
                                                                <td width="15%" align="left" height="20">
                                                                <font class="label_font" color="#425E89">Giai đoạn *:</font></td>		
                                                                <td align="left" width="35%">
                                                                <select name="quytrinh_id" id="quytrinh_id" style="width:200px">
                                                                	<option value="0">Chọn quy trình</option>
                                                                    {section name=qi loop=$obj_list_quytrinh}
                                                                    <option value="{$obj_list_quytrinh[qi]->quytrinh_id}" {if $obj_list_quytrinh[qi]->quytrinh_id eq $vars.quytrinh_id}selected="selected"{/if}>-&nbsp;{$obj_list_quytrinh[qi]->quytrinh_name}</option>
                                                                    {/section}
                                                                </select>
                                                                {literal}
																<script language="javascript">
                                                                $("#quytrinh_id").change( function () { 
                                                                     var quytrinh_id = $("#quytrinh_id").val();
                                                                     $("#j_giaidoan").load("index.php?B_getlistQuytrinhs&quytrinh_id="+quytrinh_id);
                                                                    });
                                                                </script>
                                                                {/literal}
                                                                </td>
                                                                <td width="15%" align="left" height="20">
                                                                <font class="label_font" color="#425E89">Bước *:</font></td>		
                                                                <td align="left">
                                                                <div id="j_giaidoan">
                                                                <select name="giaidoan_id" id="giaidoan_id" style="width:200px">
                                                                <option value="0">Chọn bước</option>
                                                                </select>
                                                                </div>
                                                                </td>
                                                              </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr height="10"><td></td></tr>
                                                    <tr>
                                                    	<td>
                                                    		<table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                              <tr>
                                                                <td width="15%" align="left" height="20">
                                                                <font class="label_font" color="#425E89">Chú thích:</font></td>		
                                                                <td align="left">
                                                                <input type="text" style="width: 624px;" value="{$vars.trangthai_note}" id="trangthai_note" name="trangthai_note" class="ac_input"/>
                                                                </td>
                                                              </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr height="10"><td></td></tr>
                                                    <tr>
                                                    	<td>
                                                    		<table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                              <tr>
                                                                <td width="15%" align="left" height="20">
                                                                <font class="label_font" color="#425E89">Tệp tin *:</font></td>		
                                                                <td align="left">
                                                                <input type="text" style="width:195px" name="trangthai_file" id="trangthai_file" value="{$vars.trangthai_file}">&nbsp;<a href="javascript:window.open('upload4.php','new_page','width=500,height=300');window.history.go(1)" >[ Tải lên ]</a> 
                                                                </td>
                                                              </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    {/if}
                                                    <tr height="10"><td></td></tr>
                                                    <tr>
                                                    	<td>
                                                        	<table width="100%" border="1" cellspacing="0" cellpadding="0" class="adminlist">
                                                              <tr  bgcolor="#EEEEEE" >
                                                                <td width="5%" align="center"><b>STT</b></td>	
                                                                <td width="16%" align="left" ><B>Quy trình</B></td>
                                                                <td width="16%" align="left" ><B>Giai đoạn</B></td>
                                                                <td width="16%" align="center" ><B>Tệp tin</B></td>
                                                                <td align="left" ><B>Chú thích</B></td>
                                                                <td width="10%" align="center" ><B>Ngày</B></td>
                                                                <td width="5%" align="center" ><B>Xóa</B></td>
                                                              </tr>
                                                              {section name = ti loop = $obj_list_trangthai}
                                                              <tr {if $smarty.section.pi.index is not div by 2} bgcolor="#F2FFEC" {/if}>
                                                                <td width="5%" align="center">
                                                                {math z=$smarty.section.ti.index t=1 equation="z+t" assign=stt}{$stt}
                                                                </td>	
                                                                <td width="16%" align="left" >
                                                                	{section name=qi loop=$obj_list_quytrinh}
                                                                	{if $obj_list_quytrinh[qi]->quytrinh_id eq $obj_list_trangthai[ti]->quytrinh_id}
                                                                    {$obj_list_quytrinh[qi]->quytrinh_name}
                                                                    {/if}
                                                                    {/section}
                                                                </td>
                                                                <td width="16%" align="left" >
                                                                	{section name=qi loop=$obj_list_giaidoan}
                                                                	{if $obj_list_giaidoan[qi]->giaidoan_id eq $obj_list_trangthai[ti]->giaidoan_id}
                                                                    {$obj_list_giaidoan[qi]->giaidoan_name}
                                                                    {/if}
                                                                    {/section}
                                                                </td>
                                                                <td width="16%" align="center" >
                                                                	{if $obj_list_trangthai[ti]->trangthai_file neq ''}
                                                                	<a href="{$obj_list_trangthai[ti]->trangthai_file}" target="_blank">[Tải xuống]</a>
                                                                    {else}-
                                                                    {/if}
                                                                </td>
                                                                <td align="left" >
                                                                	{$obj_list_trangthai[ti]->trangthai_note}
                                                                </td>
                                                                <td width="10%" align="center" >
                                                                	{$obj_list_trangthai[ti]->trangthai_date|date_format:"%d/%m/%Y"}
                                                                </td>
                                                                <td align="center" >
                                                                	<a href="?editHopdong{$arg.arg}&del=1&trangthai_id={$obj_list_trangthai[ti]->trangthai_id}">
                                                                    <img src="../images/admin/b_drop.png" width="16" height="16" border="0" title="Xóa">
                                                                    </a>
                                                                </td>
                                                              </tr>
                                                              {/section}
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr height="10"><td></td></tr>
                                                    {if $vars.hopdong_nguoitao eq $access_user_id}
                                                    <tr>
                                                        <td colspan="2" align="left" style="padding-top:10px">
                                                        <input type="submit" name="addQuytrinh" value="Lưu lại"/>
                                                        <input type="hidden" name="arg" value="{$arg.arg}" />
                                                        <input type="hidden" name="hopdong_id" value="{$vars.hopdong_id}">
                                                        <input type="reset" name="reset" value="Quay lại &gt;&gt;" onClick="history.go(-1)">
                                                        </td>
                                                    </tr>
                                                    {/if}
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
<!--  END ./winuser/view.html  -->
</body>
</html>