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
	$('#vttb_repare_cost').priceFormat({		
		centsSeparator: '.',
		thousandsSeparator: '.'
	});
});
</script>
{/literal}
<div id="list_repare_content_insign">
	<form method="post" name="frmList_Repare" action="?listRepare{$vars.arg}" id="frmList_Repare">
    <!------------------------------------------THEM MOI------------------------------------>
    <fieldset style="width:407px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
        {section name=qi loop=$obj_list_vttb}
        {if $obj_list_vttb[qi]->vttb_id eq $vttb_id} 
            {assign var = "vttb_name" value = $obj_list_vttb[qi]->vttb_name}
        {/if}
        {/section}
        <legend class="legend" style="width:200px">Thêm/Sửa mục sửa chữa:</legend>
    	<table width="98%" cellspacing="0" cellpadding="0" border="0" style="margin-left:5px">
            <tr height="20">
                <td colspan="2"> 
                	{if $error or $complete}
                	<span class="msg">Thông báo: <font color="#FF0000">{$error}</font>{$complete}</span>{/if}
            		<span id="lblError_Repare" class="error">Thông báo: (*) là các mục bắt buộc!</span>
                </td>
            </tr>
			<tr height="30">
				<td colspan="2">
					Hạng mục: <span style="color:#00F" title="{$vttb_name}">{$vttb_name|str_string_cut:"80":"1"}</span>
				</td>
			</tr>
            <tr><td colspan="2"></td></tr>
            <tr height="30">
            	<td align="center" valign="top">
                	<div style="float:left; width:105px; line-height:25px; text-align:left">Mục sửa chữa <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:248px; line-height:25px; text-align:left">
                        <input type="text" id="vttb_repare_name" name="vttb_repare_name" class="text_middle_long" value="{$obj_info.vttb_repare_name}" onfocus="hide_message_Repare();" tabindex="1"/>
                    </div>
                    
                    <div style="float:left; width:105px; line-height:25px; text-align:left">Đơn vị thực hiện <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:248px; line-height:25px; text-align:left">
                        <input type="text" id="vttb_repare_unit" name="vttb_repare_unit" class="text_middle_long" value="{$obj_info.vttb_repare_unit}" onfocus="hide_message_Repare();" tabindex="2"/>
                    </div>
                   
                    <div style="float:left; width:105px; line-height:25px; text-align:left">Phí sửa chữa <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:162px; line-height:25px; text-align:left">
                    	<input type="text" id="vttb_repare_cost" name="vttb_repare_cost" class="text_short" value="{$obj_info.vttb_repare_cost}" onfocus="hide_message_Repare();" tabindex="3"/> (vnđ)
                    </div>
                    <div style="float:left; width:48px; line-height:25px; text-align:left">Phiếu <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:40px; line-height:25px; text-align:left">
                    	<input type="text" id="vttb_repare_code" name="vttb_repare_code" class="text_tiny" value="{$obj_info.vttb_repare_code}" onfocus="hide_message_Repare();" tabindex="4"/>
                    </div>
                    
                    <div style="float:left; width:105px; line-height:25px; text-align:left">Ngày thực hiện <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:111px; line-height:25px; text-align:left">
                    	<div style="float:left; width:90px; height:21px; border:1px solid #99bbe8; background-color:#FFF">
                            {if $obj_info.vttb_repare_date neq '0000-00-00' and $obj_info.vttb_repare_date neq ''}
                                <input type="text" id="repare_date_1" name="repare_date_1" class="text_date" value="{$obj_info.vttb_repare_date|date_format:'%d'}" onkeypress="set_focus('repare_date_1','repare_date_2')" onfocus="hide_message()" maxlength="2" tabindex="5"/>/
                                <input type="text" id="repare_date_2" name="repare_date_2" class="text_month" value="{$obj_info.vttb_repare_date|date_format:'%m'}" onkeypress="set_focus('repare_date_2','repare_date_3')" onfocus="hide_message()" maxlength="2" tabindex="6"/>/
                                <input type="text" id="repare_date_3" name="repare_date_3" class="text_year" value="{$obj_info.vttb_repare_date|date_format:'%Y'}" onfocus="hide_message()" maxlength="4" tabindex="7"/>
                            {else}
                                <input type="text" id="repare_date_1" name="repare_date_1" class="text_date" value="" onkeypress="set_focus('repare_date_1','repare_date_2')" onfocus="hide_message()" maxlength="2" tabindex="5"/>/
                                <input type="text" id="repare_date_2" name="repare_date_2" class="text_month" value="" onkeypress="set_focus('repare_date_2','repare_date_3')" onfocus="hide_message()" maxlength="2" tabindex="6"/>/
                                <input type="text" id="repare_date_3" name="repare_date_3" class="text_year" value="" onfocus="hide_message()" maxlength="4" tabindex="7"/>
                            {/if}
                        </div>
                    </div>
                    <div style="float:left; width:75px; line-height:25px; text-align:left">Thanh toán <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:65px; line-height:25px; text-align:left">
                    	<select id="vttb_repare_paid_type" name="vttb_repare_paid_type" class="select_short" tabindex="8">
                            <option value="1" {if $obj_info.vttb_repare_paid_type eq 1}selected="selected"{/if}>Tiền mặt</option>
                            <option value="2" {if $obj_info.vttb_repare_paid_type eq 2}selected="selected"{/if}>Công nợ</option>
                        </select>
                    </div>
                    
                    <div style="float:left; width:100%; line-height:25px; text-align:left">
                    	<input type="button" name="btnSub_Repare" id="btnSub_Repare" value="Ghi lại" class="button" tabindex="9"/>
                        <input type="hidden" name="vttb_repare_id" id="vttb_repare_id" value="{$obj_info.vttb_repare_id}">
                        <input type="hidden" name="vttb_sub_id" id="vttb_sub_id" value="{$vars.vttb_sub_id}">
                        <input type="hidden" name="user_id" id="user_id" value="{$obj_info.user_id}">
                        <input type="hidden" name="vttb_id" id="vttb_id" value="{$vars.vttb_id}">
                        <input type="reset" name="Reset" value="Hủy bỏ" class="button" tabindex="10"/>
                        {literal}
                        <script language="javascript">
                            function hide_message_Repare(){
                                $('#lblMessage_Repare').hide();
                                $('#lblError_Repare').hide();
                            }
                            
                            $(function() {
                            $('.error').hide();
                            $('#lblMessage_Repare').hide();
                             
                            $("#btnSub_Repare").click(function() {
								
                                $('.error').hide();
                                 
                                var $form 			= $("#frmList_Repare");
								var vttb_repare_name 	= $form.find('input#vttb_repare_name').val();
								var vttb_repare_unit 	= $form.find('input#vttb_repare_unit').val();
								var vttb_repare_code 	= $form.find('input#vttb_repare_code').val();
								var vttb_repare_cost 	= $form.find('input#vttb_repare_cost').val();
								var vttb_repare_paid_type 	= $form.find('select#vttb_repare_paid_type :selected').val();
								
								var repare_date_1 		= $form.find('input#repare_date_1').val();
								var repare_date_2 		= $form.find('input#repare_date_2').val();
								var repare_date_3 		= $form.find('input#repare_date_3').val();
						
								var vttb_id 			= $form.find('input#vttb_id').val();
								var vttb_repare_id 		= $form.find('input#vttb_repare_id').val();
								
								var vttb_sub_id 		= $form.find('input#vttb_sub_id').val();
								
                                //begin validate form
                                if (vttb_repare_name == "" || vttb_repare_unit == "" || repare_date_1 == "" || repare_date_2 == "" || repare_date_3 == "" || vttb_repare_code == "" || vttb_repare_cost == "" || vttb_repare_paid_type == ""){
                                    $('#lblError_Repare').show();
                                }
                                else{
									$.post('index.php?listRepare&mod=vttbs&add_edit=1',
										{
											vttb_repare_name:vttb_repare_name,
											vttb_repare_unit:vttb_repare_unit,
											vttb_repare_code:vttb_repare_code,
											vttb_repare_cost:vttb_repare_cost,
											vttb_repare_paid_type:vttb_repare_paid_type,
											vttb_repare_date:repare_date_3+'-'+repare_date_2+'-'+repare_date_1,
											vttb_id:vttb_id,
											vttb_repare_id:vttb_repare_id,
											
											vttb_sub_id:vttb_sub_id,
										},
										function(data){
											$('#list_repare_cont').html(data);
											$("#list_repare_cont").show();
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
            <div class="tbl_tit" style="width:220px"><B>&nbsp;Mục sửa chữa</B></div>
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
                <div class="{$class_td}" style="width:220px; white-space:nowrap" title="{$obj_list[pi]->vttb_repare_name}">
                	{if $obj_list[pi]->user_id eq $access_user_id}
                    &nbsp;<a href='javascript: void(0);' onclick="edit_me_Repare({$obj_list[pi]->vttb_repare_id},{$vttb_sub_id})">{$obj_list[pi]->vttb_repare_name|str_string_cut:"45":"1"}</a>
                    {else}{$obj_list[pi]->vttb_repare_name}{/if}
                </div>
                <div class="{$class_td}" style="width:75px; text-align:left">
                    {$obj_list[pi]->vttb_repare_date|date_format:"%d/%m/%Y"}
                </div>
                <div class="{$class_td}" style="width:29px; text-align:center">
                	{if $obj_list[pi]->user_id eq $access_user_id}
                    <a href='javascript: void(0);' onclick="edit_me_Repare({$obj_list[pi]->vttb_repare_id},{$vttb_sub_id})">
                    <img src="../images/admin/b_edit.png" width="11" height="11" border="0" title="Sửa"></a>
                    {else}-{/if}
                </div>
                <div class="{$class_td}" style="width:29px; text-align:center">
                	{if $obj_list[pi]->user_id eq $access_user_id}
                    <a href='javascript: void(0)' onClick="delItems_Repare('{$processurl}', {$obj_list[pi]->vttb_repare_id},{$vttb_sub_id});">
                    <img src="../images/admin/b_drop.png" width="11" height="11" border="0" title="Xóa"></a>
                    {else}-{/if}
                </div>
            </div>
            {/section}
        </div>
        <input type="hidden" id="curpage_Repare" name="curpage" value="{$vars.curpage}" />
    </fieldset>
    </form>
</div>
<!------------------------------------------------- Tool bar --------------------------------------------->
<div id="list_repare_clear_txt"></div>
<div id="list_repare_tool_bar">    
    <div id="list_repare_page_area">
    {if $vars.curpage eq 1}
    	<img src="{$css_path}icon_first_page.png" class="img_all">
    	<img src="{$css_path}icon_pre_page.png" class="img_all">
    {else}
    <a href="javascript: void(0)" id="first_page" onclick="gotoPage_Repare('{$processurl}',parseInt(1));" title="Trang đầu">
    	<img src="{$css_path}icon_first_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="pre_page" onclick="gotoPage_Repare('{$processurl}',parseInt(document.getElementById('page_Repare').value)-parseInt(1));" title="Trang trước">
    	<img src="{$css_path}icon_pre_page.png" class="img_all">
    </a>
    {/if}
    </div>
    <div style="float:left; line-height:19px">
        <div style="float:left; width:35px">Trang</div> 
        <div style="float:left; width:35px">
        <input type="text" value="{$vars.curpage}" name="page" id="page_Repare" onblur=" gotoPage_Repare('{$processurl}',this.value);" style="width:30px; font-size:12px; height:15px; border:1px solid #99bbe8">
        </div>
        <div style="float:left; width:22px"> / {$num_page}</div>
    </div>
    <div id="list_repare_page_area">
    {if $vars.curpage eq $num_page}
    	<img src="{$css_path}icon_next_page.png" class="img_all">
        <img src="{$css_path}icon_last_page.png" class="img_all">
    {else}
    <a href="javascript: void(0)" id="next_page" onclick="gotoPage_Repare('{$processurl}',parseInt(document.getElementById('page_Repare').value)+parseInt(1));" title="Trang tiếp">
    	<img src="{$css_path}icon_next_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="last_page" onclick="gotoPage_Repare('{$processurl}',parseInt({$num_page}));" title="Trang cuối">
    	<img src="{$css_path}icon_last_page.png" class="img_all">
    </a>
    {/if}
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_vttb.png)">&nbsp;</div>
    <div style="float:left; width:15px">
    <a href="javascript: void(0)" id="a_ref_Repare" title="Tải lại"><img src="{$css_path}icon_refresh.png" class="img_all"></a>
    </div>    
</div>
{literal}
<script language="javascript">		
	function docheck_Repare(status,from_){
		var alen=document.frmList_Repare.elements.length;
		alen=(alen>5)?document.frmList_Repare.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
			document.frmList_Repare.chkid[i].checked=status;
		}
		else{
			document.frmList_Repare.chkid.checked=status;
		}
		if(from_>0) document.frmList_Repare.chkall.checked=status;
	}
		
	function docheckone_Repare(){
		var alen=document.frmList_Repare.elements.length;
		var isChecked=true;
		alen=(alen>4)?document.frmList_Repare.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_Repare.chkid[i].checked==false)
					isChecked=false;
		}else{
			if(document.frmList_Repare.chkid.checked==false)
				isChecked=false;
		}				
		document.frmList_Repare.chkall.checked=isChecked;
	}
	
	function calculatechon_Repare(){			
		var strchon="";
		var alen=document.frmList_Repare.elements.length;				
		alen=(alen>2)?document.frmList_Repare.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_Repare.chkid[i].checked==true)
					strchon+=document.frmList_Repare.chkid[i].value+",";
		}else{
			if(document.frmList_Repare.chkid.checked==true)
				strchon=document.frmList_Repare.chkid.value;
		}
		document.frmList_Repare.chon_Repare.value=strchon;
	}
	
	function delItems_Repare(processurl,delStr){
		if (delStr == undefined){
			calculatechon_Repare();
			delStr = document.getElementById("chon_Repare").value;
		}
		if (delStr == ""){
			return false;
		}
		if(!confirm("THÔNG BÁO: \n\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
			return false;
		}	
		
		var numresult_Repare,order_Repare,curpage_Repare;
		numresult = $("#numresult_Repare").val();
		order = $("#order_Repare").val();
		curpage = $("#curpage_Repare").val();
		
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
				$('#list_repare_cont').fadeOut('fast').load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+curpage).fadeIn("fast");
			}
		});
	}
	
	function reloadPage_Repare(processurl){
		var numresult_Repare,order_Repare,cur_pos;
		numresult = $("#numresult_Repare").val();
		order = $("#order_Repare").val();
		cur_pos = 0;
		$("#list_repare_cont").load(processurl+"&numresult="+numresult+"&order="+order+"&cur_pos="+cur_pos);
	}
	
	function gotoPage_Repare(processurl,page){
		var numresult_Repare,order_Repare,cur_pos;
		numresult = $("#numresult_Repare").val();
		order = $("#order_Repare").val();
		//alert(processurl+'-'+page+'-'+numresult+'-'+order);
		$("#list_repare_cont").load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+page);
	}
	
	function edit_me_Repare(id,vttb_sub_id){
		var vttb_id = document.frmList_Repare.vttb_id.value;
		$("#list_repare_cont").load("?listRepare&mod=vttbs&edit_me=1&vttb_repare_id="+id+"&vttb_id="+vttb_id+"&vttb_sub_id="+vttb_sub_id);
	}
			
	$("#a_ref_Repare").click( function () { 
		var vttb_id = document.frmList_Repare.vttb_id.value;
		var vttb_sub_id = document.frmList_Repare.vttb_sub_id.value;
		$('#list_repare_cont').hide();
		$('#list_repare_cont').fadeOut('fast').load("?listRepare&mod=vttbs&vttb_id="+vttb_id+"&vttb_sub_id="+vttb_sub_id).fadeIn("fast");
	});
</script>
{/literal}