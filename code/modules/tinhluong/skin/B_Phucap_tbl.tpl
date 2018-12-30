{literal}
    <style type="text/css">
    .error { color:#FF0000;font-weight:bold; margin-left:5px; height:20px; line-height:20px}
    .msg{ color:#00F; font-weight:bold; margin-left:5px; height:20px; line-height:20px}
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
    <script type="text/javascript">
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
            $('#hdmua_giatri').priceFormat({
                centsSeparator: '.',
                thousandsSeparator: '.'
            });

            $('#hdmua_giatri_quydoi').priceFormat({
                centsSeparator: '.',
                thousandsSeparator: '.'
            });

            $('#hdmua_gttt').priceFormat({
                centsSeparator: '.',
                thousandsSeparator: '.'
            });

            $('#hdmua_gttt_quydoi').priceFormat({
                centsSeparator: '.',
                thousandsSeparator: '.'
            });

            $('#phucap_giatri').priceFormat({
                centsSeparator: '.',
                thousandsSeparator: '.'
            });
        });
    </script>
{/literal}
<div id="thangluong_content_insign">
	<form method="post" name="frmList_Phucap" action="?listPhucap{$vars.arg}" id="frmList_Phucap">
    <!------------------------------------------THEM MOI------------------------------------>
    <fieldset style="width:1162px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
    <legend class="legend_list">
        Thêm/Chỉnh sửa&nbsp;|&nbsp;Thông báo:&nbsp;
        <span id="lblError_Phucap" class="error">Dấu (*) là các mục bắt buộc!</span>
        <span id="lblError_Phucap_2" class="error">Hệ số và số năm phải là số!</span>
    </legend>
    	<table width="98%" cellspacing="0" cellpadding="0" border="0" style="margin-left:5px">
        	<tr height="10"><td colspan="4"></td></tr>
            <tr height="30">
            	<td align="center">
                    <div style="float:left; width:8%; line-height:25px; text-align:left">Tên phụ cấp <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:62%; line-height:25px; text-align:left">
                    <input type="text" name="phucap_ten" id="phucap_ten" class="text_super_long" value="{$obj_info.phucap_ten}" onfocus="hide_message_Phucap()"/>
                    </div>
                    <div style="float:left; width:8%; line-height:25px; text-align:left">Tiền phụ cấp <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:22%; line-height:25px; text-align:left">
                    <input type="text" name="phucap_giatri" id="phucap_giatri" class="text_number" value="{$obj_info.phucap_giatri}" onfocus="hide_message_Phucap()"/>&nbsp;(VNĐ)
                    </div>
                    <div style="float:left; width:8%; line-height:25px; text-align:left">Diễn giải:</div>
                    <div style="float:left; width:62%; line-height:25px; text-align:left">
                        <textarea spellcheck="false" name="phucap_diengiai" id="phucap_diengiai" cols="30" rows="5" class="text_area_long" onfocus="hide_message_Doc()" tabindex="7">{$obj_info.phucap_diengiai}</textarea>
                    </div>
                	<div style="float:left; width:8%; line-height:25px; text-align:left">Tình trạng :</div>
                    <div style="float:left; width:18%; line-height:25px; text-align:left">
                    	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            {if $obj_info.phucap_active neq ''}
                            <td width="35%">
                            <input type="radio" id="phucap_active" name="phucap_active" value="1" {if $obj_info.phucap_active eq 1} checked="checked" {/if} />&nbsp;Hiển thị</td>
                            <td>
                            <input type="radio" id="phucap_active" name="phucap_active" value="2" {if $obj_info.phucap_active eq 2} checked="checked" {/if} />&nbsp;Không hiển thị</td>
                            {else}
                            <td width="35%">
                            <input type="radio" id="phucap_active" name="phucap_active" value="1" checked/>&nbsp;Hiển thị</td>
                            <td>
                            <input type="radio" id="phucap_active" name="phucap_active" value="2" />&nbsp;Không hiển thị</td>
                            {/if}
                          </tr>
                        </table>
                    </div>
                    <div style="float:left; line-height:25px; text-align:left">
                    	<input type="button" name="btnSub_Phucap" id="btnSub_Phucap" value="Ghi lại" class="button" />
                        <input type="hidden" name="phucap_id" id="phucap_id" value="{$obj_info.phucap_id}">
                        <input type="reset" name="Reset" value="Hủy bỏ" class="button" />
                        {literal}
                        <script language="javascript">
                            function hide_message_Phucap(){
                                $('#lblError_Phucap').hide();
                                $('#lblError_Phucap_2').hide();
                            }
                            
                            $(function() {
                            $('.error').hide();
                             
                            $("#btnSub_Phucap").click(function() {
                                $('.error').hide();
                                
                                var $form = $("#frmList_Phucap");
								var phucap_ten = $form.find('input#phucap_ten').val();
                                var phucap_giatri = $form.find('input#phucap_giatri').val();
								var phucap_diengiai = $form.find('textarea#phucap_diengiai').val();
                                var phucap_active = $form.find('input#phucap_active:checked').val();
                                var phucap_id = $form.find('input#phucap_id').val();
                                //begin validate form
                                if (phucap_giatri == 0 || phucap_ten == ""){
                                    $('#lblError_Phucap').show();
                                }else{
                                    var dataString = "&phucap_ten=" + phucap_ten;
                                        dataString += "&phucap_giatri=" + phucap_giatri;
										dataString += "&phucap_diengiai=" + phucap_diengiai;
                                        dataString += "&phucap_active=" + phucap_active;
                                        dataString += "&phucap_id=" + phucap_id +"";
                                        //alert (dataString);return false;
                                    $.ajax({
                                        type: "POST",
                                        url: "index.php?listPhucap&mod=tinhluong&add_edit=1",
                                        data: dataString,
                                        success: function(data) {
                                            $('#tinhluong_content_main').fadeOut('fast').load('index.php?listPhucap&mod=tinhluong').fadeIn("fast");
                                            //$('#lblMessage_Phucap').show();
                                        }
                                    });
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
    <fieldset style="width:1162px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:223px">
    <legend class="legend_list_search">
        <div style="width:130px; float:left">Danh sách: {$total_num_result}</div>
        <div style="width:70px; float:left">&nbsp;|&nbsp;Tìm kiếm&nbsp;</div>
        <div style="width:155px; float:left">
        	<select name="chucvu_id_seek" id="chucvu_id_seek" class="select_seek" onfocus="hide_message_Phucap()">
                <option value="0">Chọn chức vụ</option>
                {section name=qi loop=$obj_list_object}
                <option value="{$obj_list_object[qi]->object_id}" {if $obj_list_object[qi]->object_id eq $obj_info.chucvu_id}selected="selected"{/if}>-&nbsp;{$obj_list_object[qi]->object_name}</option>
                {/section}
            </select>
        </div>
        <div style="width:50px; float:left">
        	<input type="button" name="btnSeek" id="btnSeek" value="Tìm >>" class="button_seek" onclick="search_me_Phucap()" /></div>
    </legend>
    	<div style="float:left; height:5px; width:100%"></div>
        <div style="float:left; height:25px; width:1142px; border-top:1px solid #99bbe8; border-bottom:1px solid #99bbe8 ">
            <div class="tbl_tit" style="width:30px; text-align:center"><b>STT</b></div>	
            <div class="tbl_tit" style="width:200px"><B>&nbsp;Tên phụ cấp</B></div>
            <div class="tbl_tit" style="width:100px; text-align:right"><B>&nbsp;Giá trị (VNĐ)&nbsp;</B></div>
            <div class="tbl_tit" style="width:503px"><B>&nbsp;Diễn giải</B></div>
            <div class="tbl_tit" style="width:80px"><B>&nbsp;Ngày tạo</B></div>
            <div class="tbl_tit" style="width:60px; text-align:center"><B>Sắp xếp</B></div>
            <div class="tbl_tit" style="width:60px; text-align:center"><B>Hiển thị</B></div>
            <div class="tbl_tit" style="width:60px; text-align:center"><B>Chọn</B></div>
            <div class="tbl_tit" style="width:40px; text-align:center">
            <input type="hidden" name="chon" id="chon_Phucap">
            <input type="checkbox" name="chkall" value="0" onclick="docheck_Phucap(document.frmList_Phucap.chkall.checked,0);">
            </div>
        </div>
        <div style="float:left; width:20px; text-align:right">
        <input type="button" name="del_Items" id='del_Items' value="&nbsp;" onClick="delItems_Phucap('{$processurl}');" style="width:17px; font-size:12px; background:url(../images/admin/b_drop.png); cursor:pointer" title="Xóa lựa chọn">
        </div>
        <div style="float:left; height:169px; width:1162px; overflow-y:scroll">
            {section name=pi loop=$obj_list}
            {if $smarty.section.pi.index is not div by 2} 
            {assign var="class_td" value="tbl_cont"} 
            {else}
            {assign var="class_td" value="tbl_cont2"} 
            {/if}
            {math x=$vars.curpage-1 y=$vars.numresult z=$smarty.section.pi.index t=1 equation="x*y+z+t" assign=stt}
            <div class="{$class_td}" style="width:30px; text-align:center">{$stt}</div>
            <div class="{$class_td}" style="width:200px">
            	&nbsp;{$obj_list[pi]->phucap_ten}
            </div>
            <div class="{$class_td}" style="width:100px; text-align:right">
                &nbsp;{$obj_list[pi]->phucap_giatri|price_format}&nbsp;
            </div>
            <div class="{$class_td}" style="width:503px">
                &nbsp;{$obj_list[pi]->phucap_diengiai}
            </div>
            <div class="{$class_td}" style="width:80px">
            	&nbsp;{$obj_list[pi]->phucap_date|date_format:"%d/%m/%Y"}
            </div>
            <div class="{$class_td}" style="width:60px; text-align:center">
                <select name="phucap_sort[]" class="select_tiny" onchange="sort_me_Phucap({$obj_list[pi]->phucap_id},this.value)">
                {section name=i loop=$total_num_result}
                    <option value="{$smarty.section.i.index}" {if $smarty.section.i.index eq $obj_list[pi]->phucap_sort} selected="selected"{/if}>{$smarty.section.i.index}</option>
                {/section}
                </select>
                <input type="hidden" name="phucap_id1[]" value="{$obj_list[pi]->phucap_id}">
            </div>
            <div class="{$class_td}" style="width:60px; text-align:center">
                {if $obj_list[pi]->phucap_active eq 1}
                    <a href='javascript: void(0);' onclick="uncheck_fns_Phucap('phucap_active',2,{$obj_list[pi]->phucap_id})"><img src="../images/admin/tick.png" width="10" height="10" border="0" title="Ẩn"></a>
                {else}
                    <a href='javascript: void(0);' onclick="uncheck_fns_Phucap('phucap_active',1,{$obj_list[pi]->phucap_id})"><img src="../images/admin/publish_x.png" width="10" height="10" border="0" title="Hiện"></a>
                {/if}
            </div>
            <div class="{$class_td}" style="width:30px; text-align:center">
                <a href='javascript: void(0);' onclick="edit_me_Phucap({$obj_list[pi]->phucap_id})">
                <img src="../images/admin/b_edit.png" width="11" height="11" border="0" title="Sửa"></a>
            </div>
            <div class="{$class_td}" style="width:29px; text-align:center">
                <a href='javascript: void(0)' onClick="delItems_Phucap('{$processurl}', {$obj_list[pi]->phucap_id});">
                <img src="../images/admin/b_drop.png" width="11" height="11" border="0" title="Xóa"></a>
            </div>
            <div class="{$class_td}" style="width:40px; text-align:center">
            	<input type="checkbox" name="chkid" value="{$obj_list[pi]->phucap_id}" onclick="docheckone_Phucap();">
            </div>
            {/section}
        </div>
        <input type="hidden" id="curpage_Phucap" name="curpage" value="{$vars.curpage}" />
    </fieldset>
    </form>
</div>
<!------------------------------------------------- Tool bar --------------------------------------------->
<div id="user_clear_txt"></div>
<div id="user_tool_bar">

    <div id="user_search_area">
    <select name="order" id = "order_Phucap" style="width:120px; font-size:12px; border:1px solid #99bbe8" onchange="reloadPage_Phucap('{$processurl}');">
    {section name=sli loop=$order_arr}
        <option value="{$smarty.section.sli.index}" {if $smarty.section.sli.index eq $vars.order}selected{/if} >
        {$order_arr[sli]}
        </option>
    {/section}
    </select>
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div id="user_page_area">
    {if $vars.curpage eq 1}
    	<img src="{$css_path}icon_first_page.png" class="img_all">
    	<img src="{$css_path}icon_pre_page.png" class="img_all">
    {else}
    <a href="javascript: void(0)" id="first_page" onclick="gotoPage_Phucap('{$processurl}',parseInt(1));" title="Trang đầu">
    	<img src="{$css_path}icon_first_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="pre_page" onclick="gotoPage_Phucap('{$processurl}',parseInt(document.getElementById('page_Phucap').value)-parseInt(1));" title="Trang trước">
    	<img src="{$css_path}icon_pre_page.png" class="img_all">
    </a>
    {/if}
    </div>
    <div style="float:left; line-height:19px">
        <div style="float:left; width:35px">Trang</div> 
        <div style="float:left; width:35px">
        <input type="text" value="{$vars.curpage}" name="page" id="page_Phucap" onblur=" gotoPage_Phucap('{$processurl}',this.value);" style="width:30px; font-size:12px; height:15px; border:1px solid #99bbe8">
        </div>
        <div style="float:left; width:42px"> / {$num_page}</div>
    </div>
    <div id="user_page_area">
    {if $vars.curpage eq $num_page}
    	<img src="{$css_path}icon_next_page.png" class="img_all">
        <img src="{$css_path}icon_last_page.png" class="img_all">
    {else}
    <a href="javascript: void(0)" id="next_page" onclick="gotoPage_Phucap('{$processurl}',parseInt(document.getElementById('page_Phucap').value)+parseInt(1));" title="Trang tiếp">
    	<img src="{$css_path}icon_next_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="last_page" onclick="gotoPage_Phucap('{$processurl}',parseInt({$num_page}));" title="Trang cuối">
    	<img src="{$css_path}icon_last_page.png" class="img_all">
    </a>
    {/if}
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:left; width:15px">
    <a href="javascript: void(0)" id="a_ref_Phucap" title="Tải lại"><img src="{$css_path}icon_refresh.png" class="img_all"></a>
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:right; line-height:19px; margin-right:2px">
        <div style="float:left; width:40px">Xem</div>
        <div style="float:left; width:52px">
            <select name="numresult" id="numresult_Phucap" style="width:50px; font-size:12px; border:1px solid #99bbe8" onchange="reloadPage_Phucap('{$processurl}');">
                {section name=sli loop=$nrs_arr}
                <option value="{$nrs_arr[sli]}" {if $nrs_arr[sli] eq $vars.numresult}selected{/if}>{$nrs_arr[sli]} </option>
                {/section}
            </select>
        </div>
        <div style="float:left">dòng / trang</div>
    </div>
    
</div>
{literal}
<script language="javascript">	
	function docheck_Phucap(status,from_){
		var alen=document.frmList_Phucap.elements.length;
		alen=(alen>5)?document.frmList_Phucap.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
			document.frmList_Phucap.chkid[i].checked=status;
		}
		else{
			document.frmList_Phucap.chkid.checked=status;
		}
		if(from_>0) document.frmList_Phucap.chkall.checked=status;
	}
		
	function docheckone_Phucap(){
		var alen=document.frmList_Phucap.elements.length;
		var isChecked=true;
		alen=(alen>4)?document.frmList_Phucap.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_Phucap.chkid[i].checked==false)
					isChecked=false;
		}else{
			if(document.frmList_Phucap.chkid.checked==false)
				isChecked=false;
		}				
		document.frmList_Phucap.chkall.checked=isChecked;
	}
	
	function calculatechon_Phucap(){			
		var strchon="";
		var alen=document.frmList_Phucap.elements.length;				
		alen=(alen>2)?document.frmList_Phucap.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_Phucap.chkid[i].checked==true)
					strchon+=document.frmList_Phucap.chkid[i].value+",";
		}else{
			if(document.frmList_Phucap.chkid.checked==true)
				strchon=document.frmList_Phucap.chkid.value;
		}
		document.frmList_Phucap.chon_Phucap.value=strchon;
	}
	
	function delItems_Phucap(processurl,delStr){
		if (delStr == undefined){
			calculatechon_Phucap();
			delStr = document.getElementById("chon_Phucap").value;
		}
		if (delStr == ""){
			return false;
		}
		if(!confirm("THÔNG BÁO: \n\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
			return false;
		}	
		
		var numresult_Phucap,order_Phucap,curpage_Phucap;
		numresult = $("#numresult_Phucap").val();
		order = $("#order_Phucap").val();
		curpage = $("#curpage_Phucap").val();
		
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
				$('#tinhluong_content_main').fadeOut('fast').load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+curpage).fadeIn("fast");
			}
		});
	}
	
	function reloadPage_Phucap(processurl){
		var numresult_Phucap,order_Phucap,cur_pos;
		numresult = $("#numresult_Phucap").val();
		order = $("#order_Phucap").val();
		cur_pos = 0;
		$("#tinhluong_content_main").load(processurl+"&numresult="+numresult+"&order="+order+"&cur_pos="+cur_pos);
	}
	
	function gotoPage_Phucap(processurl,page){
		var numresult_Phucap,order_Phucap,cur_pos;
		numresult = $("#numresult_Phucap").val();
		order = $("#order_Phucap").val();
		//alert(processurl+'-'+page+'-'+numresult+'-'+order);
		$("#tinhluong_content_main").load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+page);
	}
	
	function uncheck_fns_Phucap(field,val,id){
		$("#tinhluong_content_main").load("?listPhucap&mod=tinhluong&checkUncheck="+val+"&setfield="+field+"&checkUncheckID="+id);
	}
	
	function sort_me_Phucap(id,val){
		$("#tinhluong_content_main").load("?listPhucap&mod=tinhluong&sort_me=1&phucap_id="+id+"&val="+val);
	}
	
	function search_me_Phucap(){
		var chucvu_id_seek = document.getElementById('chucvu_id_seek').value;
		if (chucvu_id_seek == 0){
			return false;
		}
		
		$.post('?listPhucap&mod=tinhluong',
			{chucvu_id_seek:chucvu_id_seek},
			function(data){
				$('#tinhluong_content_main').html(data);
				$("#tinhluong_content_main").show();
			}
		);
	}
	
	function edit_me_Phucap(id){
		$("#tinhluong_content_main").load("?listPhucap&mod=tinhluong&edit_me=1&phucap_id="+id);
	}
		
	$("#a_ref_Phucap").click( function () { 
			$('#tinhluong_content_main').hide();
			$('#tinhluong_content_main').fadeOut('fast').load('index.php?listPhucap&mod=tinhluong').fadeIn("fast");
		});
</script>
{/literal}