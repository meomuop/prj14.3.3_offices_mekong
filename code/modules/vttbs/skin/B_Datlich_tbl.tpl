{literal}
<style type="text/css">
.error { color:#FF0000;font-weight:bold; margin-left:5px; height:20px; line-height:20px}
.msg{ color:#00F; font-weight:bold; margin-left:5px; height:20px; line-height:20px}
.tbl_tit{
float:left; line-height:25px; border-right:1px solid #99bbe8; font-size:12px
}
.tbl_cont{
float:left; line-height:25px; border-right:1px solid #99bbe8; border-bottom:1px solid #99bbe8; background:#F2FFEC
}
.tbl_cont2{
float:left; line-height:25px; border-right:1px solid #99bbe8; border-bottom:1px solid #99bbe8; background:#FFF
}
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
	$('#vttb_datlich_cost').priceFormat({		
		centsSeparator: '.',
		thousandsSeparator: '.'
	});
});
</script>
{/literal}
<div id="list_datlich_content_insign">
	<form method="post" name="frmList_Datlich" action="?listDatlich{$vars.arg}" id="frmList_Datlich">
    <!------------------------------------------THEM MOI------------------------------------>
    <fieldset style="width:373px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
        {section name=qi loop=$obj_list_vttb}
        {if $obj_list_vttb[qi]->vttb_id eq $vttb_id} 
            {assign var = "vttb_name" value = $obj_list_vttb[qi]->vttb_name}
        {/if}
        {/section}
        <legend class="legend" style="width:250px">Đặt lịch/ sửa lịch: <span style="color:#00F" title="{$vttb_name}">{$vttb_name|str_string_cut:"45":"1"}</span></legend>
    	<table width="98%" cellspacing="0" cellpadding="0" border="0" style="margin-left:5px">
            <tr height="20">
                <td colspan="2"> 
                	{if $error or $complete}
                	<span class="msg">Thông báo: <font color="#FF0000">{$error}</font>{$complete}</span>{/if}
            		<span id="lblError_Datlich" class="error">Thông báo: (*) là các mục bắt buộc!</span>
                </td>
            </tr>
            <tr><td colspan="2"></td></tr>
            <tr height="30">
            	<td align="center" valign="top">
                	<div style="float:left; width:60px; line-height:25px; text-align:left">Mục đích <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:248px; line-height:25px; text-align:left">
                        <textarea id="vttb_datlich_name" name="vttb_datlich_name" class="text_area" style="height:45px" spellcheck="false" onfocus="hide_message_Datlich();" tabindex="1">{$obj_info.vttb_datlich_name}</textarea>
                    </div>
                    
                    <div style="float:left; width:60px; line-height:25px; height:25px; text-align:left">Bắt đầu <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:106px; line-height:25px; height:25px; text-align:left">
                    	<div style="float:left; width:72px; height:21px; border:1px solid #99bbe8; background-color:#FFF; margin-bottom:2px">
                            {if $obj_info.vttb_datlich_start neq '0000-00-00 00:00:00' and $obj_info.vttb_datlich_start neq ''}
                                <input type="text" id="dl_start_1" name="dl_start_1" class="text_date" value="{$obj_info.vttb_datlich_start|date_format:'%d'}" onkeypress="set_focus('dl_start_1','dl_start_2')" onfocus="hide_message()" maxlength="2" tabindex="5"/>/
                                <input type="text" id="dl_start_2" name="dl_start_2" class="text_month" value="{$obj_info.vttb_datlich_start|date_format:'%m'}" onkeypress="set_focus('dl_start_2','dl_start_3')" onfocus="hide_message()" maxlength="2" tabindex="6"/>/
                                <input type="text" id="dl_start_3" name="dl_start_3" class="text_year" value="{$obj_info.vttb_datlich_start|date_format:'%Y'}" onfocus="hide_message()" maxlength="4" tabindex="7"/>
                            {else}
                                <input type="text" id="dl_start_1" name="dl_start_1" class="text_date" value="" onkeypress="set_focus('dl_start_1','dl_start_2')" onfocus="hide_message()" maxlength="2" tabindex="5"/>/
                                <input type="text" id="dl_start_2" name="dl_start_2" class="text_month" value="" onkeypress="set_focus('dl_start_2','dl_start_3')" onfocus="hide_message()" maxlength="2" tabindex="6"/>/
                                <input type="text" id="dl_start_3" name="dl_start_3" class="text_year" value="" onfocus="hide_message()" maxlength="4" tabindex="7"/>
                            {/if}
                        </div>
                        <div style="float:left; width:30px; height:25px; margin-top:2px">
                        <input type="hidden" name="dl_start_date" id="dl_start_date" value="" tabindex="4" onchange="change_dl_start()"/>
                        <img src="../images/admin/img.gif" align="absmiddle" id="dl_start_icon" style="cursor: pointer; border: 0" title="Chọn ngày trên lịch"/>
                        {literal}
                        <script type="text/javascript">
                            Calendar.setup({
                                inputField   :   "dl_start_date",
                                ifFormat     :   "%d/%m/%Y",
                                button       :   "dl_start_icon",
                                align        :   "Br",  
                                timeFormat   :   "24",
                                showsTime    :   true,
                                singleClick  :   true
                            });
							function change_dl_start(){
								var dl_start_date = document.getElementById('dl_start_date').value.split("/");
								document.getElementById('dl_start_1').value = dl_start_date[0];
								document.getElementById('dl_start_2').value = dl_start_date[1];
								document.getElementById('dl_start_3').value = dl_start_date[2];
								document.getElementById('dl_end_1').value = dl_start_date[0];
								document.getElementById('dl_end_2').value = dl_start_date[1];
								document.getElementById('dl_end_3').value = dl_start_date[2];
							}
                        </script>
                        {/literal}
                        </div>
                    </div>
                    <div style="float:left; width:26px; line-height:25px; height:25px; text-align:left">Giờ:</div>
                    <div style="float:left; width:46px; line-height:25px; height:25px; text-align:left">
                        <select name="startHour" id="startHour" class="select_micro" tabindex="8">
                            <option value="1" {if $obj_info.vttb_datlich_start|date_format2:'h' eq '1'} selected="selected"{/if}>1</option>
                            <option value="2" {if $obj_info.vttb_datlich_start|date_format2:'h' eq '2'} selected="selected"{/if}>2</option>
                            <option value="3" {if $obj_info.vttb_datlich_start|date_format2:'h' eq '3'} selected="selected"{/if}>3</option>
                            <option value="4" {if $obj_info.vttb_datlich_start|date_format2:'h' eq '4'} selected="selected"{/if}>4</option>
                            <option value="5" {if $obj_info.vttb_datlich_start|date_format2:'h' eq '5'} selected="selected"{/if}>5</option>
                            <option value="6" {if $obj_info.vttb_datlich_start|date_format2:'h' eq '6'} selected="selected"{/if}>6</option>
                            <option value="7" {if $obj_info.vttb_datlich_start|date_format2:'h' eq '7'} selected="selected"{/if}>7</option>
                            <option value="8" {if $obj_info.vttb_datlich_start|date_format2:'h' eq '8' or $obj_info.vttb_datlich_id eq ''} selected="selected"{/if}>8</option>
                            <option value="9" {if $obj_info.vttb_datlich_start|date_format2:'h' eq '9'} selected="selected"{/if}>9</option>
                            <option value="10" {if $obj_info.vttb_datlich_start|date_format2:'h' eq '10'} selected="selected"{/if}>10</option>
                            <option value="11" {if $obj_info.vttb_datlich_start|date_format2:'h' eq '11'} selected="selected"{/if}>11</option>
                            <option value="12" {if $obj_info.vttb_datlich_start|date_format2:'h' eq '12'} selected="selected"{/if}>12</option>
                        </select>		
                    </div>
                    <div style="float:left; width:26px; line-height:25px; height:25px; text-align:left">Phút:</div>
                    <div style="float:left; width:46px; line-height:25px; height:25px; text-align:left">
                        <select name="startMin" id="startMin" class="select_micro" tabindex="9">
                            <option value="00" {if $obj_info.vttb_datlich_start|date_format2:'i' eq '00'} selected="selected"{/if}>00</option>
                            <option value="10" {if $obj_info.vttb_datlich_start|date_format2:'i' eq '10'} selected="selected"{/if}>10</option>
                            <option value="20" {if $obj_info.vttb_datlich_start|date_format2:'i' eq '20'} selected="selected"{/if}>20</option>
                            <option value="30" {if $obj_info.vttb_datlich_start|date_format2:'i' eq '30'} selected="selected"{/if}>30</option>
                            <option value="40" {if $obj_info.vttb_datlich_start|date_format2:'i' eq '40'} selected="selected"{/if}>40</option>
                            <option value="50" {if $obj_info.vttb_datlich_start|date_format2:'i' eq '50'} selected="selected"{/if}>50</option>
                        </select>		
                    </div>
                    <div style="float:left; width:50px; line-height:25px; height:25px; text-align:left">
                        <select name="startMeridiem" id="startMeridiem" class="select_tiny" tabindex="10">
                            <option value="1" {if $obj_info.vttb_datlich_start|date_format2:'H' lt '12'} selected="selected"{/if}>Sáng</option>
                            <option value="2" {if $obj_info.vttb_datlich_start|date_format2:'H' gt '12'} selected="selected"{/if}>Chiều</option>
                        </select>			
                    </div>
                    
                    <div style="float:left; width:60px; line-height:25px; height:25px; text-align:left">Kết thúc <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:106px; line-height:25px; height:25px; text-align:left">
                    	<div style="float:left; width:72px; height:21px; border:1px solid #99bbe8; background-color:#FFF; margin-bottom:2px">
                            {if $obj_info.vttb_datlich_end neq '0000-00-00 00:00:00' and $obj_info.vttb_datlich_end neq ''}
                                <input type="text" id="dl_end_1" name="dl_end_1" class="text_date" value="{$obj_info.vttb_datlich_end|date_format:'%d'}" onkeypress="set_focus('dl_end_1','dl_end_2')" onfocus="hide_message()" maxlength="2" tabindex="11"/>/
                                <input type="text" id="dl_end_2" name="dl_end_2" class="text_month" value="{$obj_info.vttb_datlich_end|date_format:'%m'}" onkeypress="set_focus('dl_end_2','dl_end_3')" onfocus="hide_message()" maxlength="2" tabindex="12"/>/
                                <input type="text" id="dl_end_3" name="dl_end_3" class="text_year" value="{$obj_info.vttb_datlich_end|date_format:'%Y'}" onfocus="hide_message()" maxlength="4" tabindex="13"/>
                            {else}
                                <input type="text" id="dl_end_1" name="dl_end_1" class="text_date" value="" onkeypress="set_focus('dl_end_1','dl_end_2')" onfocus="hide_message()" maxlength="2" tabindex="11"/>/
                                <input type="text" id="dl_end_2" name="dl_end_2" class="text_month" value="" onkeypress="set_focus('dl_end_2','dl_end_3')" onfocus="hide_message()" maxlength="2" tabindex="12"/>/
                                <input type="text" id="dl_end_3" name="dl_end_3" class="text_year" value="" onfocus="hide_message()" maxlength="4" tabindex="13"/>
                            {/if}
                        </div>
                        <div style="float:left; width:30px; height:25px; margin-top:2px">
                        <input type="hidden" name="dl_end_date" id="dl_end_date" value="" tabindex="4" onchange="change_dl_end()"/>
                        <img src="../images/admin/img.gif" align="absmiddle" id="dl_end_icon" style="cursor: pointer; border: 0" title="Chọn ngày trên lịch"/>
                        {literal}
                        <script type="text/javascript">
                            Calendar.setup({
                                inputField   :   "dl_end_date",
                                ifFormat     :   "%d/%m/%Y",
                                button       :   "dl_end_icon",
                                align        :   "Br",  
                                timeFormat   :   "24",
                                showsTime    :   true,
                                singleClick  :   true
                            });
							function change_dl_end(){
								var dl_end_date = document.getElementById('dl_end_date').value.split("/");
								document.getElementById('dl_end_1').value = dl_end_date[0];
								document.getElementById('dl_end_2').value = dl_end_date[1];
								document.getElementById('dl_end_3').value = dl_end_date[2];
							}
                        </script>
                        {/literal}
                        </div>
                    </div>
                    <div style="float:left; width:26px; line-height:25px; height:25px; text-align:left">Giờ:</div>
                    <div style="float:left; width:46px; line-height:25px; height:25px; text-align:left">
                        <select name="endHour" id="endHour" class="select_micro" tabindex="14">
                            <option value="1" {if $obj_info.vttb_datlich_end|date_format2:'h' eq '1'} selected="selected"{/if}>1</option>
                            <option value="2" {if $obj_info.vttb_datlich_end|date_format2:'h' eq '2'} selected="selected"{/if}>2</option>
                            <option value="3" {if $obj_info.vttb_datlich_end|date_format2:'h' eq '3'} selected="selected"{/if}>3</option>
                            <option value="4" {if $obj_info.vttb_datlich_end|date_format2:'h' eq '4'} selected="selected"{/if}>4</option>
                            <option value="5" {if $obj_info.vttb_datlich_end|date_format2:'h' eq '5'} selected="selected"{/if}>5</option>
                            <option value="6" {if $obj_info.vttb_datlich_end|date_format2:'h' eq '6'} selected="selected"{/if}>6</option>
                            <option value="7" {if $obj_info.vttb_datlich_end|date_format2:'h' eq '7'} selected="selected"{/if}>7</option>
                            <option value="8" {if $obj_info.vttb_datlich_end|date_format2:'h' eq '8' or $obj_info.vttb_datlich_id eq ''} selected="selected"{/if}>8</option>
                            <option value="9" {if $obj_info.vttb_datlich_end|date_format2:'h' eq '9'} selected="selected"{/if}>9</option>
                            <option value="10" {if $obj_info.vttb_datlich_end|date_format2:'h' eq '10'} selected="selected"{/if}>10</option>
                            <option value="11" {if $obj_info.vttb_datlich_end|date_format2:'h' eq '11'} selected="selected"{/if}>11</option>
                            <option value="12" {if $obj_info.vttb_datlich_end|date_format2:'h' eq '12'} selected="selected"{/if}>12</option>
                        </select>		
                    </div>
                    <div style="float:left; width:26px; line-height:25px; height:25px; text-align:left">Phút:</div>
                    <div style="float:left; width:46px; line-height:25px; height:25px; text-align:left">
                        <select name="endMin" id="endMin" class="select_micro" tabindex="15">
                            <option value="00" {if $obj_info.vttb_datlich_end|date_format2:'i' eq '00'} selected="selected"{/if}>00</option>
                            <option value="10" {if $obj_info.vttb_datlich_end|date_format2:'i' eq '10'} selected="selected"{/if}>10</option>
                            <option value="20" {if $obj_info.vttb_datlich_end|date_format2:'i' eq '20'} selected="selected"{/if}>20</option>
                            <option value="30" {if $obj_info.vttb_datlich_end|date_format2:'i' eq '30'} selected="selected"{/if}>30</option>
                            <option value="40" {if $obj_info.vttb_datlich_end|date_format2:'i' eq '40'} selected="selected"{/if}>40</option>
                            <option value="50" {if $obj_info.vttb_datlich_end|date_format2:'i' eq '50'} selected="selected"{/if}>50</option>
                        </select>		
                    </div>
                    <div style="float:left; width:50px; line-height:25px; height:25px; text-align:left">
                        <select name="endMeridiem" id="endMeridiem" class="select_tiny" tabindex="16">
                            <option value="1" {if $obj_info.vttb_datlich_end|date_format2:'H' lt '12'} selected="selected"{/if}>Sáng</option>
                            <option value="2" {if $obj_info.vttb_datlich_end|date_format2:'H' gt '12'} selected="selected"{/if}>Chiều</option>
                        </select>			
                    </div>
                   
                    <div style="float:left; width:60px; line-height:25px; text-align:left">Chi phí:</div>
                    <div style="float:left; width:288px; line-height:25px; text-align:left">
                    	<input type="text" id="vttb_datlich_cost" name="vttb_datlich_cost" class="text_short" value="{$obj_info.vttb_datlich_cost}" onfocus="hide_message_Datlich();" tabindex="17"/> (vnđ)&nbsp;<i>(nếu có, ví dụ: cho thuê)</i>
                    </div>
                    
                    <div style="float:left; width:100%; line-height:25px; text-align:left">
                    	<input type="button" name="btnSub_Datlich" id="btnSub_Datlich" value="Ghi lại" class="button" tabindex="18"/>
                        <input type="hidden" name="vttb_datlich_id" id="vttb_datlich_id" value="{$obj_info.vttb_datlich_id}">
                        <input type="hidden" name="vttb_last_dl_start" id="vttb_last_dl_start" value="{$vttb_last_dl_start}">
                        <input type="hidden" name="vttb_last_dl_end" id="vttb_last_dl_end" value="{$vttb_last_dl_end}">
                        <input type="hidden" name="vttb_sub_id" id="vttb_sub_id" value="{$vars.vttb_sub_id}">
                        <input type="hidden" name="user_id" id="user_id" value="{$obj_info.user_id}">
                        <input type="hidden" name="vttb_id" id="vttb_id" value="{$vars.vttb_id}">
                        <input type="reset" name="Reset" value="Hủy bỏ" class="button" tabindex="19"/> (Người đặt lịch: {$access_user_fullname})
                        <div id="check_datlich" style="float:left"></div>
                        {literal}
                        <script language="javascript">
                            function hide_message_Datlich(){
                                $('#lblMessage_Datlich').hide();
                                $('#lblError_Datlich').hide();
                            }
                            
                            $(function() {
                            $('.error').hide();
                            $('#lblMessage_Datlich').hide();
                             
                            $("#btnSub_Datlich").click(function() {
								
                                $('.error').hide();
                                 
                                var $form 			= $("#frmList_Datlich");
								var vttb_datlich_name 	= $form.find('textarea#vttb_datlich_name').val();
								var vttb_datlich_cost 	= $form.find('input#vttb_datlich_cost').val();
								
								var dl_start_1 		= $form.find('input#dl_start_1').val();
								var dl_start_2 		= $form.find('input#dl_start_2').val();
								var dl_start_3 		= $form.find('input#dl_start_3').val();
								
								var startHour 		= $form.find('select#startHour :selected').val();
								var startMin 		= $form.find('select#startMin :selected').val();
								var startMeridiem 	= $form.find('select#startMeridiem :selected').val();
								
								var dl_end_1 		= $form.find('input#dl_end_1').val();
								var dl_end_2 		= $form.find('input#dl_end_2').val();
								var dl_end_3 		= $form.find('input#dl_end_3').val();
								
								var endHour 		= $form.find('select#endHour :selected').val();
								var endMin 			= $form.find('select#endMin :selected').val();
								var endMeridiem 	= $form.find('select#endMeridiem :selected').val();
						
								var vttb_id 		= $form.find('input#vttb_id').val();
								var vttb_datlich_id = $form.find('input#vttb_datlich_id').val();
								
								var vttb_sub_id 		= $form.find('input#vttb_sub_id').val();
								var vttb_last_dl_start 	= $form.find('input#vttb_last_dl_start').val();
								var vttb_last_dl_end 	= $form.find('input#vttb_last_dl_end').val();
								
								var ngay_dau = new Date(vttb_last_dl_start);
								var ngay_cuoi = new Date(vttb_last_dl_end);
								var	ngay_kiemtra = ngay_cuoi.getDate() +'/'+ (ngay_cuoi.getMonth()+1) +'/'+ ngay_cuoi.getFullYear();
								var vttb_datlich_start,vttb_datlich_end;
								if(startMeridiem == 1)
									var vttb_datlich_start = dl_start_3+'-'+dl_start_2+'-'+dl_start_1+' '+startHour+':'+startMin;
								else{
									startHour = parseInt(startHour)+12;
									var vttb_datlich_start = dl_start_3+'-'+dl_start_2+'-'+dl_start_1+' '+startHour+':'+startMin;
								}
								
								if(endMeridiem == 1)
									var vttb_datlich_end = dl_end_3+'-'+dl_end_2+'-'+dl_end_1+' '+endHour+':'+endMin;
								else{
									endHour = parseInt(endHour)+12;
									var vttb_datlich_end = dl_end_3+'-'+dl_end_2+'-'+dl_end_1+' '+endHour+':'+endMin;
								}
								
								$.post('index.php?checkDatlich&mod=vttbs&add_edit=1',
									{
										vttb_id:vttb_id,
										vttb_datlich_start:vttb_datlich_start,
										vttb_datlich_end:vttb_datlich_end,
									},
									function(data){
										$('#check_datlich').html(data);
										$("#check_datlich").show();
									}
								);
								
								var ngay_can_kt = new Date(dl_start_3+'/'+dl_start_2+'/'+dl_start_1);
								var ngay_dl_end = new Date(dl_end_3+'/'+dl_end_2+'/'+dl_end_1);
								
                                //begin validate form
                                if (vttb_datlich_name == "" || dl_start_1 == "" || dl_start_2 == "" || dl_start_3 == "" || dl_end_1 == "" || dl_end_2 == "" || dl_end_3 == ""){
                                    $('#lblError_Datlich').show();
                                }else if ([-1,0].indexOf(dates.compare(ngay_can_kt,ngay_dl_end)) == -1 ){
                                    alert('Ngày kết thúc không thể trước ngày bắt đầu!');
									return false;
                                }
                                else{
									if(document.getElementById('check_datlich_txt').value>0){
										if(!confirm("THÔNG BÁO: \n\t- Lịch bạn đặt đã bị trùng.\n\t- Lịch của bạn có thể bị từ chối, Bạn có muốn tiếp tục?")){
											return false;
										}
									}
									
									$.post('index.php?listDatlich&mod=vttbs&add_edit=1',
										{
											vttb_datlich_name:vttb_datlich_name,
											vttb_datlich_cost:vttb_datlich_cost,
											vttb_datlich_start:vttb_datlich_start,
											vttb_datlich_end:vttb_datlich_end,
											vttb_id:vttb_id,
											vttb_datlich_id:vttb_datlich_id,
											
											vttb_sub_id:vttb_sub_id,
										},
										function(data){
											$('#list_datlich_cont').html(data);
											$("#list_datlich_cont").show();
										}
									);
                                    return false;
                                }
                                //end form
                            });
                        });
                        </script>
                        {/literal}
                    </div>
                </td>
            </tr>
        </table>
    </fieldset>
    <!------------------------------------DANH SACH---------------------------------------------->
    <fieldset style="width:373px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:186px">
        <legend class="legend"><div style="width:130px; float:left">Danh sách: {$total_num_result}</div></legend>
    	<div style="float:left; height:5px; width:100%"></div>
        <div style="float:left; height:25px; width:356px; border-top:1px solid #99bbe8; border-bottom:1px solid #99bbe8 ">
            <div class="tbl_tit" style="width:30px; text-align:center"><b>STT</b></div>	
            <div class="tbl_tit" style="width:81px"><B>&nbsp;Mục đích</B></div>
            <div class="tbl_tit" style="width:90px"><B>&nbsp;Bắt đầu</B></div>
            <div class="tbl_tit" style="width:90px"><B>&nbsp;Kết thúc</B></div>
            <div class="tbl_tit" style="width:60px; text-align:center"><B>Chọn</B></div>
        </div>
        <div style="float:left; width:18px; height:25px">&nbsp;</div>
        <div style="float:left; height:132px; width:374px; overflow-y:scroll">
            {section name=pi loop=$obj_list}
            {if $smarty.section.pi.index is not div by 2} 
            {assign var="class_td" value="tbl_cont"} 
            {else}
            {assign var="class_td" value="tbl_cont2"} 
            {/if}
            {math x=$vars.curpage-1 y=$vars.numresult z=$smarty.section.pi.index t=1 equation="x*y+z+t" assign=stt}
            <div style="float:left">
                <div class="{$class_td}" style="width:30px; text-align:center">{$stt}</div>
                <div class="{$class_td}" style="width:81px; white-space:nowrap" title="{$obj_list[pi]->vttb_datlich_name}">
                	&nbsp;{if $obj_list[pi]->user_id eq $access_user_id}
                    <a href='javascript: void(0);' onclick="edit_me_Datlich({$obj_list[pi]->vttb_datlich_id},{$vttb_sub_id})">{$obj_list[pi]->vttb_datlich_name|str_string_cut:"20":"1"}</a>
                    {else}{$obj_list[pi]->vttb_datlich_name|str_string_cut:"20":"1"}{/if}
                </div>
                <div class="{$class_td}" style="width:90px; text-align:left">
                    &nbsp;{$obj_list[pi]->vttb_datlich_start|date_format:"%d/%m/%Y %H:%M"}
                </div>
                <div class="{$class_td}" style="width:90px; text-align:left">
                    &nbsp;{$obj_list[pi]->vttb_datlich_end|date_format:"%d/%m/%Y %H:%M"}
                </div>
                <div class="{$class_td}" style="width:29px; text-align:center">
                	{if $obj_list[pi]->user_id eq $access_user_id}
                    <a href='javascript: void(0);' onclick="edit_me_Datlich({$obj_list[pi]->vttb_datlich_id},{$vttb_sub_id})">
                    <img src="../images/admin/b_edit.png" width="11" height="11" border="0" title="Sửa"></a>
                    {else}-{/if}
                </div>
                <div class="{$class_td}" style="width:30px; text-align:center">
                	{if $obj_list[pi]->user_id eq $access_user_id}
                    <a href='javascript: void(0)' onClick="delItems_Datlich('{$processurl}', {$obj_list[pi]->vttb_datlich_id},{$vttb_sub_id});">
                    <img src="../images/admin/b_drop.png" width="11" height="11" border="0" title="Xóa"></a>
                    {else}-{/if}
                </div>
            </div>
            {/section}
        </div>
        <input type="hidden" id="curpage_Datlich" name="curpage" value="{$vars.curpage}" />
    </fieldset>
    </form>
</div>
<!------------------------------------------------- Tool bar --------------------------------------------->
<div id="list_datlich_clear_txt"></div>
<div id="list_datlich_tool_bar">    
    <div id="list_datlich_page_area">
    {if $vars.curpage eq 1}
    	<img src="{$css_path}icon_first_page.png" class="img_all">
    	<img src="{$css_path}icon_pre_page.png" class="img_all">
    {else}
    <a href="javascript: void(0)" id="first_page" onclick="gotoPage_Datlich('{$processurl}',parseInt(1));" title="Trang đầu">
    	<img src="{$css_path}icon_first_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="pre_page" onclick="gotoPage_Datlich('{$processurl}',parseInt(document.getElementById('page_Datlich').value)-parseInt(1));" title="Trang trước">
    	<img src="{$css_path}icon_pre_page.png" class="img_all">
    </a>
    {/if}
    </div>
    <div style="float:left; line-height:19px">
        <div style="float:left; width:35px">Trang</div> 
        <div style="float:left; width:35px">
        <input type="text" value="{$vars.curpage}" name="page" id="page_Datlich" onblur=" gotoPage_Datlich('{$processurl}',this.value);" style="width:30px; font-size:12px; height:15px; border:1px solid #99bbe8">
        </div>
        <div style="float:left; width:22px"> / {$num_page}</div>
    </div>
    <div id="list_datlich_page_area">
    {if $vars.curpage eq $num_page}
    	<img src="{$css_path}icon_next_page.png" class="img_all">
        <img src="{$css_path}icon_last_page.png" class="img_all">
    {else}
    <a href="javascript: void(0)" id="next_page" onclick="gotoPage_Datlich('{$processurl}',parseInt(document.getElementById('page_Datlich').value)+parseInt(1));" title="Trang tiếp">
    	<img src="{$css_path}icon_next_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="last_page" onclick="gotoPage_Datlich('{$processurl}',parseInt({$num_page}));" title="Trang cuối">
    	<img src="{$css_path}icon_last_page.png" class="img_all">
    </a>
    {/if}
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_vttb.png)">&nbsp;</div>
    <div style="float:left; width:15px">
    <a href="javascript: void(0)" id="a_ref_Datlich" title="Tải lại"><img src="{$css_path}icon_refresh.png" class="img_all"></a>
    </div>    
</div>
{literal}
<script language="javascript">		
	function docheck_Datlich(status,from_){
		var alen=document.frmList_Datlich.elements.length;
		alen=(alen>5)?document.frmList_Datlich.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
			document.frmList_Datlich.chkid[i].checked=status;
		}
		else{
			document.frmList_Datlich.chkid.checked=status;
		}
		if(from_>0) document.frmList_Datlich.chkall.checked=status;
	}
		
	function docheckone_Datlich(){
		var alen=document.frmList_Datlich.elements.length;
		var isChecked=true;
		alen=(alen>4)?document.frmList_Datlich.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_Datlich.chkid[i].checked==false)
					isChecked=false;
		}else{
			if(document.frmList_Datlich.chkid.checked==false)
				isChecked=false;
		}				
		document.frmList_Datlich.chkall.checked=isChecked;
	}
	
	function calculatechon_Datlich(){			
		var strchon="";
		var alen=document.frmList_Datlich.elements.length;				
		alen=(alen>2)?document.frmList_Datlich.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_Datlich.chkid[i].checked==true)
					strchon+=document.frmList_Datlich.chkid[i].value+",";
		}else{
			if(document.frmList_Datlich.chkid.checked==true)
				strchon=document.frmList_Datlich.chkid.value;
		}
		document.frmList_Datlich.chon_Datlich.value=strchon;
	}
	
	function delItems_Datlich(processurl,delStr){
		if (delStr == undefined){
			calculatechon_Datlich();
			delStr = document.getElementById("chon_Datlich").value;
		}
		if (delStr == ""){
			return false;
		}
		if(!confirm("THÔNG BÁO: \n\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
			return false;
		}	
		
		var numresult_Datlich,order_Datlich,curpage_Datlich;
		numresult = $("#numresult_Datlich").val();
		order = $("#order_Datlich").val();
		curpage = $("#curpage_Datlich").val();
		
		var dataString  = "numresult=" + numresult;
			dataString += "&order=" + order;
			dataString += "&curpage=" + curpage;
			dataString += "&dlStr=" + delStr +"";
			//alert (processurl+'--'+dataString);
		$.ajax({
			type: "POST",
			url: processurl,
			data: dataString,
			success: function(data) {
				$('#list_datlich_cont').fadeOut('fast').load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+curpage).fadeIn("fast");
			}
		});
	}
	
	function reloadPage_Datlich(processurl){
		var numresult_Datlich,order_Datlich,cur_pos;
		numresult = $("#numresult_Datlich").val();
		order = $("#order_Datlich").val();
		cur_pos = 0;
		$("#list_datlich_cont").load(processurl+"&numresult="+numresult+"&order="+order+"&cur_pos="+cur_pos);
	}
	
	function gotoPage_Datlich(processurl,page){
		var numresult_Datlich,order_Datlich,cur_pos;
		numresult = $("#numresult_Datlich").val();
		order = $("#order_Datlich").val();
		//alert(processurl+'-'+page+'-'+numresult+'-'+order);
		$("#list_datlich_cont").load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+page);
	}
	
	function edit_me_Datlich(id,vttb_sub_id){
		var vttb_id = document.frmList_Datlich.vttb_id.value;
		$("#list_datlich_cont").load("?listDatlich&mod=vttbs&edit_me=1&vttb_datlich_id="+id+"&vttb_id="+vttb_id+"&vttb_sub_id="+vttb_sub_id);
	}
			
	$("#a_ref_Datlich").click( function () { 
		var vttb_id = document.frmList_Datlich.vttb_id.value;
		var vttb_sub_id = document.frmList_Datlich.vttb_sub_id.value;
		$('#list_datlich_cont').hide();
		$('#list_datlich_cont').fadeOut('fast').load("?listDatlich&mod=vttbs&vttb_id="+vttb_id+"&vttb_sub_id="+vttb_sub_id).fadeIn("fast");
	});
</script>
{/literal}