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
	$('#vttb_replace_cost').priceFormat({		
		centsSeparator: '.',
		thousandsSeparator: '.'
	});
});
</script>
{/literal}
<div id="list_replace_content_insign">
	<form method="post" name="frmList_Replace" action="?listReplace{$vars.arg}" id="frmList_Replace">
    <!------------------------------------------THEM MOI------------------------------------>
    <fieldset style="width:407px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
        {section name=qi loop=$obj_list_vttb}
        {if $obj_list_vttb[qi]->vttb_id eq $vttb_id} 
            {assign var = "vttb_name" value = $obj_list_vttb[qi]->vttb_name}
        {/if}
        {/section}
        <legend class="legend" style="width:200px">Thêm/Sửa mục thay thế:</legend>
    	<table width="98%" cellspacing="0" cellpadding="0" border="0" style="margin-left:5px">
            <tr height="20">
                <td colspan="2"> 
                	{if $error or $complete}
                	<span class="msg">Thông báo: <font color="#FF0000">{$error}</font>{$complete}</span>{/if}
            		<span id="lblError_Replace" class="error">Thông báo: (*) là các mục bắt buộc!</span>
                </td>
            </tr>
			<tr height="30">
				<td colspan="2">
					Hạng mục: <span style="color:#00F" title="{$vttb_name}">{$vttb_name|str_string_cut:"45":"1"}</span>
				</td>
			</tr>
            <tr><td colspan="2"></td></tr>
            <tr height="30">
            	<td align="center" valign="top">
                	<div style="float:left; width:105px; line-height:25px; text-align:left">Mục thay thế <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:248px; line-height:25px; text-align:left">
                        <input type="text" id="vttb_replace_name" name="vttb_replace_name" class="text_middle_long" value="{$obj_info.vttb_replace_name}" onfocus="hide_message_Replace();" tabindex="1"/>
                    </div>
                    
                    <div style="float:left; width:105px; line-height:25px; text-align:left">Đơn vị thực hiện <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:248px; line-height:25px; text-align:left">
                        <input type="text" id="vttb_replace_unit" name="vttb_replace_unit" class="text_middle_long" value="{$obj_info.vttb_replace_unit}" onfocus="hide_message_Replace();" tabindex="2"/>
                    </div>
                   
                    <div style="float:left; width:105px; line-height:25px; text-align:left">Phí thay thế <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:162px; line-height:25px; text-align:left">
                    	<input type="text" id="vttb_replace_cost" name="vttb_replace_cost" class="text_short" value="{$obj_info.vttb_replace_cost}" onfocus="hide_message_Replace();" tabindex="3"/> (vnđ)
                    </div>
                    <div style="float:left; width:48px; line-height:25px; text-align:left">Phiếu <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:40px; line-height:25px; text-align:left">
                    	<input type="text" id="vttb_replace_code" name="vttb_replace_code" class="text_tiny" value="{$obj_info.vttb_replace_code}" onfocus="hide_message_Replace();" tabindex="4"/>
                    </div>
                    
                    <div style="float:left; width:105px; line-height:25px; text-align:left">Ngày thực hiện <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:111px; line-height:25px; text-align:left">
                    	<div style="float:left; width:90px; height:21px; border:1px solid #99bbe8; background-color:#FFF">
                            {if $obj_info.vttb_replace_date neq '0000-00-00' and $obj_info.vttb_replace_date neq ''}
                                <input type="text" id="replace_date_1" name="replace_date_1" class="text_date" value="{$obj_info.vttb_replace_date|date_format:'%d'}" onkeypress="set_focus('replace_date_1','replace_date_2')" onfocus="hide_message()" maxlength="2" tabindex="5"/>/
                                <input type="text" id="replace_date_2" name="replace_date_2" class="text_month" value="{$obj_info.vttb_replace_date|date_format:'%m'}" onkeypress="set_focus('replace_date_2','replace_date_3')" onfocus="hide_message()" maxlength="2" tabindex="6"/>/
                                <input type="text" id="replace_date_3" name="replace_date_3" class="text_year" value="{$obj_info.vttb_replace_date|date_format:'%Y'}" onfocus="hide_message()" maxlength="4" tabindex="7"/>
                            {else}
                                <input type="text" id="replace_date_1" name="replace_date_1" class="text_date" value="" onkeypress="set_focus('replace_date_1','replace_date_2')" onfocus="hide_message()" maxlength="2" tabindex="5"/>/
                                <input type="text" id="replace_date_2" name="replace_date_2" class="text_month" value="" onkeypress="set_focus('replace_date_2','replace_date_3')" onfocus="hide_message()" maxlength="2" tabindex="6"/>/
                                <input type="text" id="replace_date_3" name="replace_date_3" class="text_year" value="" onfocus="hide_message()" maxlength="4" tabindex="7"/>
                            {/if}
                        </div>
                    </div>
                    <div style="float:left; width:75px; line-height:25px; text-align:left">Thanh toán <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:65px; line-height:25px; text-align:left">
                    	<select id="vttb_replace_paid_type" name="vttb_replace_paid_type" class="select_short" tabindex="8">
                            <option value="1" {if $obj_info.vttb_replace_paid_type eq 1}selected="selected"{/if}>Tiền mặt</option>
                            <option value="2" {if $obj_info.vttb_replace_paid_type eq 2}selected="selected"{/if}>Công nợ</option>
                        </select>
                    </div>
                    
                    <div style="float:left; width:100%; line-height:25px; text-align:left">
                    	<input type="button" name="btnSub_Replace" id="btnSub_Replace" value="Ghi lại" class="button" tabindex="9"/>
                        <input type="hidden" name="vttb_replace_id" id="vttb_replace_id" value="{$obj_info.vttb_replace_id}">
                        <input type="hidden" name="vttb_sub_id" id="vttb_sub_id" value="{$vars.vttb_sub_id}">
                        <input type="hidden" name="user_id" id="user_id" value="{$obj_info.user_id}">
                        <input type="hidden" name="vttb_id" id="vttb_id" value="{$vars.vttb_id}">
                        <input type="reset" name="Reset" value="Hủy bỏ" class="button" tabindex="10"/>
                        {literal}
                        <script language="javascript">
                            function hide_message_Replace(){
                                $('#lblMessage_Replace').hide();
                                $('#lblError_Replace').hide();
                            }
                            
                            $(function() {
                            $('.error').hide();
                            $('#lblMessage_Replace').hide();
                             
                            $("#btnSub_Replace").click(function() {
								
                                $('.error').hide();
                                 
                                var $form 			= $("#frmList_Replace");
								var vttb_replace_name 	= $form.find('input#vttb_replace_name').val();
								var vttb_replace_unit 	= $form.find('input#vttb_replace_unit').val();
								var vttb_replace_code 	= $form.find('input#vttb_replace_code').val();
								var vttb_replace_cost 	= $form.find('input#vttb_replace_cost').val();
								var vttb_replace_paid_type 	= $form.find('select#vttb_replace_paid_type :selected').val();
								
								var replace_date_1 		= $form.find('input#replace_date_1').val();
								var replace_date_2 		= $form.find('input#replace_date_2').val();
								var replace_date_3 		= $form.find('input#replace_date_3').val();
						
								var vttb_id 			= $form.find('input#vttb_id').val();
								var vttb_replace_id 		= $form.find('input#vttb_replace_id').val();
								
								var vttb_sub_id 		= $form.find('input#vttb_sub_id').val();
								
                                //begin validate form
                                if (vttb_replace_name == "" || vttb_replace_unit == "" || replace_date_1 == "" || replace_date_2 == "" || replace_date_3 == "" || vttb_replace_code == "" || vttb_replace_cost == "" || vttb_replace_paid_type == ""){
                                    $('#lblError_Replace').show();
                                }
                                else{
									$.post('index.php?listReplace&mod=vttbs&add_edit=1',
										{
											vttb_replace_name:vttb_replace_name,
											vttb_replace_unit:vttb_replace_unit,
											vttb_replace_code:vttb_replace_code,
											vttb_replace_cost:vttb_replace_cost,
											vttb_replace_paid_type:vttb_replace_paid_type,
											vttb_replace_date:replace_date_3+'-'+replace_date_2+'-'+replace_date_1,
											vttb_id:vttb_id,
											vttb_replace_id:vttb_replace_id,
											
											vttb_sub_id:vttb_sub_id,
										},
										function(data){
											$('#list_replace_cont').html(data);
											$("#list_replace_cont").show();
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
    <fieldset style="width:407px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:185px">
        <legend class="legend"><div style="width:130px; float:left">Danh sách: {$total_num_result}</div></legend>
    	<div style="float:left; height:5px; width:100%"></div>
        <div style="float:left; height:25px; width:389px; border-top:1px solid #99bbe8; border-bottom:1px solid #99bbe8 ">
            <div class="tbl_tit" style="width:30px; text-align:center"><b>STT</b></div>	
            <div class="tbl_tit" style="width:220px"><B>&nbsp;Mục thay thế</B></div>
            <div class="tbl_tit" style="width:75px"><B>&nbsp;Ngày</B></div>
            <div class="tbl_tit" style="width:60px; text-align:center"><B>Chọn</B></div>
        </div>
        <div style="float:left; width:18px; height:25px">&nbsp;</div>
        <div style="float:left; height:132px; width:406px; overflow-y:scroll">
            {section name=pi loop=$obj_list}
            {if $smarty.section.pi.index is not div by 2} 
            {assign var="class_td" value="tbl_cont"} 
            {else}
            {assign var="class_td" value="tbl_cont2"} 
            {/if}
            {math x=$vars.curpage-1 y=$vars.numresult z=$smarty.section.pi.index t=1 equation="x*y+z+t" assign=stt}
            <div style="float:left">
                <div class="{$class_td}" style="width:30px; text-align:center">{$stt}</div>
                <div class="{$class_td}" style="width:220px; white-space:nowrap" title="{$obj_list[pi]->vttb_replace_name}">
                	{if $obj_list[pi]->user_id eq $access_user_id}
                    &nbsp;<a href='javascript: void(0);' onclick="edit_me_Replace({$obj_list[pi]->vttb_replace_id},{$vttb_sub_id})">{$obj_list[pi]->vttb_replace_name|str_string_cut:"45":"1"}</a>
                    {else}{$obj_list[pi]->vttb_replace_name}{/if}
                </div>
                <div class="{$class_td}" style="width:75px; text-align:left">
                    {$obj_list[pi]->vttb_replace_date|date_format:"%d/%m/%Y"}
                </div>
                <div class="{$class_td}" style="width:29px; text-align:center">
                	{if $obj_list[pi]->user_id eq $access_user_id}
                    <a href='javascript: void(0);' onclick="edit_me_Replace({$obj_list[pi]->vttb_replace_id},{$vttb_sub_id})">
                    <img src="../images/admin/b_edit.png" width="11" height="11" border="0" title="Sửa"></a>
                    {else}-{/if}
                </div>
                <div class="{$class_td}" style="width:29px; text-align:center">
                	{if $obj_list[pi]->user_id eq $access_user_id}
                    <a href='javascript: void(0)' onClick="delItems_Replace('{$processurl}', {$obj_list[pi]->vttb_replace_id},{$vttb_sub_id});">
                    <img src="../images/admin/b_drop.png" width="11" height="11" border="0" title="Xóa"></a>
                    {else}-{/if}
                </div>
            </div>
            {/section}
        </div>
        <input type="hidden" id="curpage_Replace" name="curpage" value="{$vars.curpage}" />
    </fieldset>
    </form>
</div>
<!------------------------------------------------- Tool bar --------------------------------------------->
<div id="list_replace_clear_txt"></div>
<div id="list_replace_tool_bar">    
    <div id="list_replace_page_area">
    {if $vars.curpage eq 1}
    	<img src="{$css_path}icon_first_page.png" class="img_all">
    	<img src="{$css_path}icon_pre_page.png" class="img_all">
    {else}
    <a href="javascript: void(0)" id="first_page" onclick="gotoPage_Replace('{$processurl}',parseInt(1));" title="Trang đầu">
    	<img src="{$css_path}icon_first_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="pre_page" onclick="gotoPage_Replace('{$processurl}',parseInt(document.getElementById('page_Replace').value)-parseInt(1));" title="Trang trước">
    	<img src="{$css_path}icon_pre_page.png" class="img_all">
    </a>
    {/if}
    </div>
    <div style="float:left; line-height:19px">
        <div style="float:left; width:35px">Trang</div> 
        <div style="float:left; width:35px">
        <input type="text" value="{$vars.curpage}" name="page" id="page_Replace" onblur=" gotoPage_Replace('{$processurl}',this.value);" style="width:30px; font-size:12px; height:15px; border:1px solid #99bbe8">
        </div>
        <div style="float:left; width:22px"> / {$num_page}</div>
    </div>
    <div id="list_replace_page_area">
    {if $vars.curpage eq $num_page}
    	<img src="{$css_path}icon_next_page.png" class="img_all">
        <img src="{$css_path}icon_last_page.png" class="img_all">
    {else}
    <a href="javascript: void(0)" id="next_page" onclick="gotoPage_Replace('{$processurl}',parseInt(document.getElementById('page_Replace').value)+parseInt(1));" title="Trang tiếp">
    	<img src="{$css_path}icon_next_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="last_page" onclick="gotoPage_Replace('{$processurl}',parseInt({$num_page}));" title="Trang cuối">
    	<img src="{$css_path}icon_last_page.png" class="img_all">
    </a>
    {/if}
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_vttb.png)">&nbsp;</div>
    <div style="float:left; width:15px">
    <a href="javascript: void(0)" id="a_ref_Replace" title="Tải lại"><img src="{$css_path}icon_refresh.png" class="img_all"></a>
    </div>    
</div>
{literal}
<script language="javascript">		
	function docheck_Replace(status,from_){
		var alen=document.frmList_Replace.elements.length;
		alen=(alen>5)?document.frmList_Replace.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
			document.frmList_Replace.chkid[i].checked=status;
		}
		else{
			document.frmList_Replace.chkid.checked=status;
		}
		if(from_>0) document.frmList_Replace.chkall.checked=status;
	}
		
	function docheckone_Replace(){
		var alen=document.frmList_Replace.elements.length;
		var isChecked=true;
		alen=(alen>4)?document.frmList_Replace.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_Replace.chkid[i].checked==false)
					isChecked=false;
		}else{
			if(document.frmList_Replace.chkid.checked==false)
				isChecked=false;
		}				
		document.frmList_Replace.chkall.checked=isChecked;
	}
	
	function calculatechon_Replace(){			
		var strchon="";
		var alen=document.frmList_Replace.elements.length;				
		alen=(alen>2)?document.frmList_Replace.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_Replace.chkid[i].checked==true)
					strchon+=document.frmList_Replace.chkid[i].value+",";
		}else{
			if(document.frmList_Replace.chkid.checked==true)
				strchon=document.frmList_Replace.chkid.value;
		}
		document.frmList_Replace.chon_Replace.value=strchon;
	}
	
	function delItems_Replace(processurl,delStr){
		if (delStr == undefined){
			calculatechon_Replace();
			delStr = document.getElementById("chon_Replace").value;
		}
		if (delStr == ""){
			return false;
		}
		if(!confirm("THÔNG BÁO: \n\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
			return false;
		}	
		
		var numresult_Replace,order_Replace,curpage_Replace;
		numresult = $("#numresult_Replace").val();
		order = $("#order_Replace").val();
		curpage = $("#curpage_Replace").val();
		
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
				$('#list_replace_cont').fadeOut('fast').load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+curpage).fadeIn("fast");
			}
		});
	}
	
	function reloadPage_Replace(processurl){
		var numresult_Replace,order_Replace,cur_pos;
		numresult = $("#numresult_Replace").val();
		order = $("#order_Replace").val();
		cur_pos = 0;
		$("#list_replace_cont").load(processurl+"&numresult="+numresult+"&order="+order+"&cur_pos="+cur_pos);
	}
	
	function gotoPage_Replace(processurl,page){
		var numresult_Replace,order_Replace,cur_pos;
		numresult = $("#numresult_Replace").val();
		order = $("#order_Replace").val();
		//alert(processurl+'-'+page+'-'+numresult+'-'+order);
		$("#list_replace_cont").load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+page);
	}
	
	function edit_me_Replace(id,vttb_sub_id){
		var vttb_id = document.frmList_Replace.vttb_id.value;
		$("#list_replace_cont").load("?listReplace&mod=vttbs&edit_me=1&vttb_replace_id="+id+"&vttb_id="+vttb_id+"&vttb_sub_id="+vttb_sub_id);
	}
			
	$("#a_ref_Replace").click( function () { 
		var vttb_id = document.frmList_Replace.vttb_id.value;
		var vttb_sub_id = document.frmList_Replace.vttb_sub_id.value;
		$('#list_replace_cont').hide();
		$('#list_replace_cont').fadeOut('fast').load("?listReplace&mod=vttbs&vttb_id="+vttb_id+"&vttb_sub_id="+vttb_sub_id).fadeIn("fast");
	});
</script>
{/literal}