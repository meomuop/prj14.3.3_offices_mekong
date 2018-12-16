<link rel="stylesheet" href="../css/admin/selectbox_atcp/jquery-ui.css" />
<script src="../js/selectbox_atcp/jquery-1.9.1.js"></script>
<script src="../js/selectbox_atcp/jquery-ui.js"></script>
{literal}
<style type="text/css">
.ui-combobox {
	position: relative;display: inline-block;
}
.ui-combobox-toggle {
	position: absolute;top: 0;bottom: 0;margin-left: -1px;padding: 0;
	/* support: IE7 */
	*height: 1.7em;*top: 0.1em;
}
.ui-combobox-input {
	margin: 0;padding: 0.3em;
}

.error { 
color:#FF0000;font-weight:bold; margin-left:5px; height:20px; line-height:20px
}
.msg{ 
color:#00F; font-weight:bold; margin-left:5px; height:20px; line-height:20px
}
.tbl_tit{
float:left; line-height:25px; border-right:1px solid #99bbe8; 	
}
.tbl_cont{
float:left; line-height:25px; border-right:1px solid #99bbe8; border-bottom:1px solid #99bbe8; background:#F2FFEC
}
.tbl_cont2{
float:left; line-height:25px; border-right:1px solid #99bbe8; border-bottom:1px solid #99bbe8; background:#FFF
}
</style>

<script language="javascript">

(function( $ ) {
	$.widget( "ui.combobox", {
		_create: function() {
		this.wrapper = $( "<span>" )
		.addClass( "ui-combobox" )
		.insertAfter( this.element );
		this._createAutocomplete();
		this._createShowAllButton();
	},
	_createAutocomplete: function() {
		var selected = this.element.children( ":selected" ),
		value = selected.val() ? selected.text() : "";
		this.input = $( "<input>" )
		.appendTo( this.wrapper )
		.val( value )
		.attr( "title", "" )
		.addClass( "ui-state-default ui-combobox-input ui-widget ui-widget-content ui-corner-left" )
		.autocomplete({
		delay: 0,
		minLength: 0,
		source: $.proxy( this, "_source" )
		})
		.tooltip({
			tooltipClass: "ui-state-highlight"
		});
		this._on( this.input, {
			autocompleteselect: function( event, ui ) {
				ui.item.option.selected = true;
				this._trigger( "select", event, {
				item: ui.item.option
			});
		},
		autocompletechange: "_removeIfInvalid"
		});
	},
	_createShowAllButton: function() {
		var wasOpen = false;
		$( "<a>" )
		.attr( "tabIndex", -1 )
		.attr( "title", "Show All Items" )
		.tooltip()
		.appendTo( this.wrapper )
		.button({
		icons: {
		primary: "ui-icon-triangle-1-s"
	},
	text: false
	})
		.removeClass( "ui-corner-all" )
		.addClass( "ui-corner-right ui-combobox-toggle" )
		.mousedown(function() {
		wasOpen = input.autocomplete( "widget" ).is( ":visible" );
	})
	.click(function() {
		input.focus();
		// Close if already visible
		if ( wasOpen ) {
			return;
		}
		// Pass empty string as value to search for, displaying all results
		input.autocomplete( "search", "" );
		});
	},
	_source: function( request, response ) {
		var matcher = new RegExp( $.ui.autocomplete.escapeRegex(request.term), "i" );
		response( this.element.children( "option" ).map(function() {
		var text = $( this ).text();
		if ( this.value && ( !request.term || matcher.test(text) ) )
		return {
		label: text,
		value: text,
		option: this
		};
		}) );
	},
	_removeIfInvalid: function( event, ui ) {
		// Selected an item, nothing to do
		if ( ui.item ) {
			return;
		}
		// Search for a match (case-insensitive)
		var value = this.input.val(),
		valueLowerCase = value.toLowerCase(),
		valid = false;
		this.element.children( "option" ).each(function() {
		if ( $( this ).text().toLowerCase() === valueLowerCase ) {
			this.selected = valid = true;
			return false;
		}
	});
	// Found a match, nothing to do
	if ( valid ) {
		return;
	}
	// Remove invalid value
	this.input
		.val( "" )
		.attr( "title", value + " Không trung hợp với danh sách" )
		.tooltip( "open" );
		this.element.val( "" );
		this._delay(function() {
		this.input.tooltip( "close" ).attr( "title", "" );
		}, 2500 );
		this.input.data( "ui-autocomplete" ).term = "";
	},
	_destroy: function() {
		this.wrapper.remove();
		this.element.show();
		}
		});
		})( jQuery );
		$(function() {
		$( "#vttb_useby" ).combobox();
		$( "#toggle" ).click(function() {
		$( "#vttb_useby" ).toggle();
	});
});

// --- price format
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
	$('#vttb_cost').priceFormat({		
		centsSeparator: '.',
		thousandsSeparator: '.'
	});
});
</script>
{/literal}
<div id="add_edit_vttb_content_insign">
	<form method="post" name="frmList_Vttb" action="?addEditVTTB{$vars.arg}" id="frmList_Vttb">
    <!------------------------------------------THEM MOI------------------------------------>
    <fieldset style="width:463px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
        <legend class="legend_middle">Thêm danh mục thiết bị:</legend>
    	<table width="98%" cellspacing="0" cellpadding="0" border="0" style="margin-left:5px">
            <tr height="20">
                <td colspan="2"> 
                	{if $error or $complete}
                	<span class="msg">Thông báo: <font color="#FF0000">{$error}</font>{$complete}</span>{/if}
            		<span id="lblError_Vttb" class="error">Thông báo: (*) là các mục bắt buộc!</span>
                </td>
            </tr>
            <tr height="30">
            	<td align="center" valign="top">
                	<div style="float:left; width:445px">
                        <div style="float:left; width:90px; line-height:25px; text-align:left">Tên thiết bị <font color="#FF0000">*</font>:</div>
                        <div style="float:left; width:190px; line-height:25px; text-align:left">
                        <input type="text" name="vttb_name" id="vttb_name" class="text_middle" value="{$obj_info.vttb_name}" onfocus="hide_message_Vttb()"/>
                        </div>
                        <div style="float:left; width:90px; line-height:25px; text-align:left">Ngày sử dụng:</div>
                        <div style="float:left; width:75px; line-height:25px; padding-top:1px; text-align:left">
                            <div style="float:left; width:72px; height:21px; border:1px solid #99bbe8; background-color:#FFF">
                            	{if $obj_info.vttb_commission neq '0000-00-00' and $obj_info.vttb_commission neq ''}
                                    <input type="text" id="vttb_bd_1" name="vttb_bd_1" class="text_date" value="{$obj_info.vttb_commission|date_format:'%d'}" onkeypress="set_focus('vttb_bd_1','vttb_bd_2')" onfocus="hide_message()" maxlength="2"/>/
                                    <input type="text" id="vttb_bd_2" name="vttb_bd_2" class="text_month" value="{$obj_info.vttb_commission|date_format:'%m'}" onkeypress="set_focus('vttb_bd_2','vttb_bd_3')" onfocus="hide_message()" maxlength="2"/>/
                                    <input type="text" id="vttb_bd_3" name="vttb_bd_3" class="text_year" value="{$obj_info.vttb_commission|date_format:'%Y'}" onfocus="hide_message()" maxlength="4"/>
                                {else}
                                    <input type="text" id="vttb_bd_1" name="vttb_bd_1" class="text_date" value="" onkeypress="set_focus('vttb_bd_1','vttb_bd_2')" onfocus="hide_message()" maxlength="2"/>/
                                    <input type="text" id="vttb_bd_2" name="vttb_bd_2" class="text_month" value="" onkeypress="set_focus('vttb_bd_2','vttb_bd_3')" onfocus="hide_message()" maxlength="2"/>/
                                    <input type="text" id="vttb_bd_3" name="vttb_bd_3" class="text_year" value="" onfocus="hide_message()" maxlength="4"/>
                                {/if}
                            </div>
                        </div>
                    </div>
                    
                    <div style="float:left; width:445px">
                        <div style="float:left; width:90px; line-height:25px; text-align:left">Chi phí:</div>
                        <div style="float:left; width:190px; line-height:25px; text-align:left">
                            <input type="text" name="vttb_cost" id="vttb_cost" class="text_short" value="{$obj_info.vttb_cost}"/> (vnđ)
                        </div>
                        <div style="float:left; width:90px; line-height:25px; text-align:left">Dự kiến hết hạn:</div>
                        <div style="float:left; width:75px; line-height:25px; padding-top:1px; text-align:left">
                            <div style="float:left; width:72px; height:21px; border:1px solid #99bbe8; background-color:#FFF">
                            	{if $obj_info.vttb_limit neq '0000-00-00' and $obj_info.vttb_limit neq ''}
                                    <input type="text" id="vttb_limit_1" name="vttb_limit_1" class="text_date" value="{$obj_info.vttb_limit|date_format:'%d'}" onkeypress="set_focus('vttb_limit_1','vttb_limit_2')" onfocus="hide_message()" maxlength="2"/>/
                                	<input type="text" id="vttb_limit_2" name="vttb_limit_2" class="text_month" value="{$obj_info.vttb_limit|date_format:'%m'}" onkeypress="set_focus('vttb_limit_2','vttb_limit_3')" onfocus="hide_message()" maxlength="2"/>/
                                	<input type="text" id="vttb_limit_3" name="vttb_limit_3" class="text_year" value="{$obj_info.vttb_limit|date_format:'%Y'}" onfocus="hide_message()" maxlength="4"/>
                                {else}
                                    <input type="text" id="vttb_limit_1" name="vttb_limit_1" class="text_date" value="" onkeypress="set_focus('vttb_limit_1','vttb_limit_2')" onfocus="hide_message()" maxlength="2"/>/
                                    <input type="text" id="vttb_limit_2" name="vttb_limit_2" class="text_month" value="" onkeypress="set_focus('vttb_limit_2','vttb_limit_3')" onfocus="hide_message()" maxlength="2"/>/
                                    <input type="text" id="vttb_limit_3" name="vttb_limit_3" class="text_year" value="" onfocus="hide_message()" maxlength="4"/>
                                {/if}
                                
                                
                            </div>
                        </div>
                    </div>
                    
                    <div style="float:left; width:445px">
                        <div style="float:left; width:90px; line-height:25px; text-align:left">Sử dụng bởi:</div>
                        <div style="float:left; width:190px; line-height:25px; text-align:left">
                            <div class="ui-widget">
                            <select id="vttb_useby" name="vttb_useby" style="display:none">
                                <option value="0"></option>
                                {if $obj_sub_info.vttb_sub_type eq 1}
                                {section name=ui loop=$obj_list_user}
                                <option value="{$obj_list_user[ui]->user_id}" {if $obj_list_user[ui]->user_id eq $obj_info.vttb_useby}selected="selected"{/if}>{$obj_list_user[ui]->user_fullname} - {section name=di loop=$obj_list_department}{if $obj_list_user[ui]->unit_id eq $obj_list_department[di]->department_id}{$obj_list_department[di]->department_standfor}{/if}{/section}</option>
                                {/section}
                                {/if}
                            </select>
                            </div>
                        </div>
                        <div style="float:left; width:90px; line-height:25px; text-align:left">Ngày loại bỏ:</div>
                        <div style="float:left; width:75px; line-height:25px; padding-top:1px; text-align:left">
                            <div style="float:left; width:72px; height:21px; border:1px solid #99bbe8; background-color:#FFF">
                            	{if $obj_info.vttb_decommission neq '0000-00-00' and $obj_info.vttb_decommission neq ''}
                                    <input type="text" id="vttb_kt_1" name="vttb_kt_1" class="text_date" value="{$obj_info.vttb_decommission|date_format:'%d'}" onkeypress="set_focus('vttb_kt_1','vttb_kt_2')" onfocus="hide_message()" maxlength="2"/>/
                                	<input type="text" id="vttb_kt_2" name="vttb_kt_2" class="text_month" value="{$obj_info.vttb_decommission|date_format:'%m'}" onkeypress="set_focus('vttb_limit_1','vttb_kt_3')" onfocus="hide_message()" maxlength="2"/>/
                                	<input type="text" id="vttb_kt_3" name="vttb_kt_3" class="text_year" value="{$obj_info.vttb_decommission|date_format:'%Y'}" onfocus="hide_message()" maxlength="4"/>
                                {else}
                                    <input type="text" id="vttb_kt_1" name="vttb_kt_1" class="text_date" value="" onkeypress="set_focus('vttb_kt_1','vttb_kt_2')" onfocus="hide_message()" maxlength="2"/>/
                                    <input type="text" id="vttb_kt_2" name="vttb_kt_2" class="text_month" value="" onkeypress="set_focus('vttb_limit_1','vttb_kt_3')" onfocus="hide_message()" maxlength="2"/>/
                                    <input type="text" id="vttb_kt_3" name="vttb_kt_3" class="text_year" value="" onfocus="hide_message()" maxlength="4"/>
                                 {/if}
                            </div>
                        </div>
                    </div>
                    <div style="float:left; width:445px">
                        <div style="float:left; width:90px; line-height:25px; text-align:left">Mô tả:</div>
                        <div style="float:left; width:350px; line-height:25px; text-align:left">
                            <input type="text" name="vttb_desc" id="vttb_desc" class="text_long" value="{$obj_info.vttb_desc}"/>
                        </div>
                    </div>
                </td>
            </tr>
            <tr height="30">
            	<td align="center">
                    <div style="float:left; width:445px">
                        <div style="float:left; width:90px; line-height:25px; text-align:left">Tình trạng:</div>
                        <div style="float:left; width:190px; line-height:25px; text-align:left">
                            <select id="vttb_active" name="vttb_active" class="select_short">
                                <option value="1" {if $obj_info.vttb_active eq 1}selected="selected"{/if}>Sử dụng</option>
                                <option value="2" {if $obj_info.vttb_active eq 2}selected="selected"{/if}>Không sử dụng</option>
                            </select>
                        </div>
                        <div style="float:left; width:90px; line-height:25px; text-align:left">Ngày tháng:</div>
                        <div style="float:left; width:75px; line-height:25px; text-align:left">
                            {$smarty.now|date_format:'%d/%m/%Y'}
                        </div>
                    </div>
                </td>
            </tr>
            <tr height="30">
                <td align="left">
                <input type="button" name="btnSub_Vttb" id="btnSub_Vttb" value="Ghi lại" class="button" />
                <input type="hidden" name="vttb_id" id="vttb_id" value="{$obj_info.vttb_id}">
                <input type="hidden" name="vttb_sub_id" id="vttb_sub_id" value="{$vttb_sub_id}">
                <input type="reset" name="Reset" value="Hủy bỏ" class="button" />&nbsp;(Người tạo: {$access_user_fullname})
                {literal}
				<script language="javascript">
					function hide_message_Vttb(){
						$('#lblMessage_Vttb').hide();
						$('#lblError_Vttb').hide();
					}
					
					$(function() {
					$('.error').hide();
					$('#lblMessage_Vttb').hide();
					 
					$("#btnSub_Vttb").click(function() {
						$('.error').hide();
						 
						var $form = $("#frmList_Vttb");
						var vttb_name = $form.find('input#vttb_name').val();
						var vttb_desc = $form.find('input#vttb_desc').val();
						var vttb_cost = $form.find('input#vttb_cost').val();
						
						var vttb_bd_1 = $form.find('input#vttb_bd_1').val();
						var vttb_bd_2 = $form.find('input#vttb_bd_2').val();
						var vttb_bd_3 = $form.find('input#vttb_bd_3').val();
						
						var vttb_limit_1 = $form.find('input#vttb_limit_1').val();
						var vttb_limit_2 = $form.find('input#vttb_limit_2').val();
						var vttb_limit_3 = $form.find('input#vttb_limit_3').val();
						
						var vttb_kt_1 = $form.find('input#vttb_kt_1').val();
						var vttb_kt_2 = $form.find('input#vttb_kt_2').val();
						var vttb_kt_3 = $form.find('input#vttb_kt_3').val();
						
						var vttb_useby = $form.find('select#vttb_useby :selected').val();
						var vttb_sub_id = $form.find('input#vttb_sub_id').val();
						
						var vttb_id = $form.find('input#vttb_id').val();
						var vttb_active = $form.find('select#vttb_active :selected').val();
						//begin validate form
						if (vttb_name == ""){
							$('#lblError_Vttb').show();
						}
						else{
							var dataString  = "vttb_name=" + vttb_name;
								dataString += "&vttb_desc=" + vttb_desc;
								dataString += "&vttb_cost=" + vttb_cost;
								
								dataString += "&vttb_commission=" + vttb_bd_3+'-'+vttb_bd_2+'-'+vttb_bd_1;
								dataString += "&vttb_limit=" + vttb_limit_3+'-'+vttb_limit_2+'-'+vttb_limit_1;
								dataString += "&vttb_decommission=" + vttb_kt_3+'-'+vttb_kt_2+'-'+vttb_kt_1;
								
								dataString += "&vttb_useby=" + vttb_useby;
								dataString += "&vttb_sub_id=" + vttb_sub_id;
								dataString += "&vttb_id=" + vttb_id ;
								dataString += "&vttb_active=" + vttb_active ;
								//alert (dataString);return false;
							$.ajax({
								type: "POST",
								url: "index.php?addEditVTTB&mod=vttbs&add_edit=1",
								data: dataString,
								success: function(data) {
									$('#a_e_vttb').hide();
									$('#vttb_content_main').fadeOut('fast').load('index.php?listVTTB_Chung&mod=vttbs&vttb_sub_id='+vttb_sub_id).fadeIn("fast");
									$('#div_thanhcong').css({'display':'block','z-index':'2010'})
									tat_thongbao();diemnguoc(2);
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
    </form>
</div>