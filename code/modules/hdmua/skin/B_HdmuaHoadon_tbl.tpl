{literal}
    <style type="text/css">
    .error { color:#FF0000;font-weight:bold; margin-left:5px; height:20px; line-height:20px}
    .msg{ color:#00F; font-weight:bold; margin-left:5px; height:20px; line-height:20px}
    .tbl_tit{
    float:left; line-height:25px; border-right:1px solid #99bbe8;
    }
    .tbl_cont{
    float:left; line-height:25px; border-right:1px solid #99bbe8; border-bottom:1px solid #99bbe8; background:#F2FFEC; font-size:12px
    }
    .tbl_cont2{
    float:left; line-height:25px; border-right:1px solid #99bbe8; border-bottom:1px solid #99bbe8; background:#FFF; font-size:12px
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
            $('#hoadon_giatri').priceFormat({
                centsSeparator: '.',
                thousandsSeparator: '.'
            });
        });
    </script>
{/literal}
<div id="hdmua_content_insign">
	<form method="post" name="frmList_HdmuaHoadon" action="?listHdmuaHoadon{$vars.arg}" id="frmList_HdmuaHoadon">
    <!------------------------------------------THEM MOI------------------------------------>
    <fieldset style="width:1012px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
        <legend class="legend_list_search" style="width: 600px">
            Thêm/Chỉnh sửa&nbsp;|&nbsp;Thông báo:&nbsp;
            <span id="mess_doc" class="msg">{$error}{$complete}</span>
            <span id="lblError_HdmuaHoadon" class="error">(*) là các mục bắt buộc!</span>
        </legend>
    	<table width="98%" cellspacing="0" cellpadding="0" border="0" style="margin-left:5px">
        	<tr height="10"><td colspan="2"></td></tr>
            <tr height="30">
            	<td align="center" width="24%" valign="top">
                    <div style="float:left; width:35%; line-height:25px; text-align:left">Số hóa đơn <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:65%; line-height:25px; text-align:left">
                        <input type="text" id="hoadon_sohd" name="hoadon_sohd" class="text_short" value="{$obj_info.hoadon_sohd}" tabindex="1" onfocus="hide_message_HdmuaHoadon();"/>
                    </div>
                    <div style="float:left; width:35%; line-height:25px; text-align:left">Ngày xuất <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:65%; line-height:25px; text-align:left">
                        <input type="text" name="hoadon_ngayhd" id="hoadon_ngayhd" class="text_time_callender" value="{$obj_info.hoadon_ngayhd|date_format:'%d/%m/%Y'}" tabindex="2" onfocus="hide_message_HdmuaHoadon();"/>&nbsp;<img src="../images/admin/img.gif"  align="absmiddle" id="date_hoadon_ngayhd" style="cursor: pointer; border: 0" title="Chọn ngày trên lịch"/>
                        {literal}
                            <script type="text/javascript">
                                Calendar.setup({
                                    inputField   :   "hoadon_ngayhd",
                                    ifFormat     :   "%d/%m/%Y",
                                    button       :   "date_hoadon_ngayhd",
                                    align        :   "Br",
                                    timeFormat   :   "24",
                                    showsTime    :   true,
                                    singleClick  :   true
                                });
                            </script>
                        {/literal}
                    </div>
                    <div style="float:left; width:35%; line-height:25px; text-align:left">Giá trị:</div>
                    <div style="float:left; width:65%; line-height:25px; text-align:left">
                        <input type="text" value="{$obj_info.hoadon_giatri}" id="hoadon_giatri" name="hoadon_giatri" class="text_short text_number" tabindex="10"/>
                    </div>
                </td>

                <td align="center" width="32%" valign="top">
                    <div style="float:left; width:35%; line-height:25px; text-align:left">PT thanh toán <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:65%; line-height:25px; text-align:left">
                        <select name="hoadon_pttt" id="hoadon_pttt" class="select_middle" tabindex="17">
                            <option value="1" {if $obj_info.hoadon_pttt eq 1}selected="selected"{/if}>-&nbsp;Tiền mặt</option>
                            <option value="2" {if $obj_info.hoadon_pttt eq 2}selected="selected"{/if}>-&nbsp;Chuyển khoản</option>
                        </select>
                    </div>
                    <div style="float:left; width:35%; line-height:25px; text-align:left">Tình trạng <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:65%; line-height:25px; text-align:left">
                        <select name="hoadon_active" id="hoadon_active" class="select_middle" tabindex="17">
                            <option value="1" {if $obj_info.hoadon_active eq 1}selected="selected"{/if}>-&nbsp;Có hiệu lực</option>
                            <option value="2" {if $obj_info.hoadon_active eq 2}selected="selected"{/if}>-&nbsp;Bị hủy</option>
                        </select>
                    </div>
                    <div style="float:left; width:35%; line-height:25px; text-align:left">Tệp tin:</div>
                    <div style="float:left; width:65%; line-height:25px; text-align:left">
                        <input type="text" class="text_short" name="hoadon_file" id="hoadon_file" value="{$obj_info.hoadon_file}" onfocus="hide_message_HdmuaHoadon();">&nbsp;<a href="javascript:void(0)" onclick="javascript:window.open('upload_hdmua_hoadon.php','new_page','width=420,height=245')" >[ Tải lên ]</a>
                    </div>
                    <div style="float:left; width:35%; line-height:25px; text-align:left">&nbsp;</div>
                    <div style="float:left; width:65%; line-height:25px; text-align:left">
                        <input type="button" name="btnSub_HdmuaHoadon" id="btnSub_HdmuaHoadon" value="Ghi lại" class="button" tabindex="18"/>
                        <input type="hidden" name="hoadon_id" id="hoadon_id" value="{$obj_info.hoadon_id}">
                        <input type="hidden" name="hdmua_id" id="hdmua_id" value="{$hdmua_id}">
                        <input type="hidden" name="hdmua_sohd" id="hdmua_sohd" value="{$hdmua_info.hdmua_sohd}">
                        <input type="reset" name="Reset" value="Hủy bỏ" class="button" tabindex="19"/>
                    </div>
                </td>

                <td align="center" valign="top">
                    <div style="float:left; width:15%; line-height:25px; text-align:left">Nội dung <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:85%; line-height:25px; text-align:left; height:50px">
                        <textarea spellcheck="false" name="hoadon_noidung" id="hoadon_noidung" cols="30" rows="5" class="text_area_small" onfocus="hide_message_Hdmua()" tabindex="8">{$obj_info.hoadon_noidung}</textarea>
                    </div>
                    <div style="float:left; width:15%; line-height:25px; text-align:left">Hợp đồng:</div>
                    <div style="float:left; width:55%; line-height:25px; text-align:left">{$hdmua_info.hdmua_sohd} (Ngày ký: {$hdmua_info.hdmua_ngayhd|date_format:"%d/%m/%Y"})</div>
                    <div style="float:left; width:30%; line-height:25px; text-align:left">
                        &nbsp;<b>(Người nhập: {$access_user_name})</b>
                    </div>
                </td>
                {literal}
                    <script language="javascript">
                        function hide_message_HdmuaHoadon(){
                            $('#lblMessage_HdmuaHoadon').hide();
                            $('#lblError_HdmuaHoadon').hide();
                            $('#mess_doc').hide();
                        }

                        $(function() {
                            $('.error').hide();
                            $('#lblMessage_HdmuaHoadon').hide();

                            $("#btnSub_HdmuaHoadon").click(function() {

                                $('.error').hide();

                                var $form = $("#frmList_HdmuaHoadon");

                                var hoadon_sohd = $form.find('input#hoadon_sohd').val();
                                var hoadon_ngayhd = $form.find('input#hoadon_ngayhd').val();
                                var hoadon_noidung = $form.find('textarea#hoadon_noidung').val();
                                var hoadon_giatri = $form.find('input#hoadon_giatri').val();
                                var hoadon_pttt = $form.find('select#hoadon_pttt :selected').val();
                                var hoadon_active = $form.find('select#hoadon_active :selected').val();
                                var hoadon_id = $form.find('input#hoadon_id').val();
                                var hoadon_nguoinhap = $form.find('input#hoadon_nguoinhap').val();
                                var hoadon_file = $form.find('input#hoadon_file').val();
                                var hdmua_id = $form.find('input#hdmua_id').val();
                                var hdmua_sohd = $form.find('input#hdmua_sohd').val();


                                //begin validate form
                                if (hoadon_sohd == "" || hoadon_ngayhd == "" || hoadon_giatri == "" ){
                                    $('#lblError_HdmuaHoadon').show();
                                }
                                else{
                                    $.post('index.php?listHdmuaHoadon&mod=hdmua&add_edit=1',
                                        {
                                            hoadon_sohd:hoadon_sohd,
                                            hoadon_ngayhd:hoadon_ngayhd,
                                            hoadon_noidung:hoadon_noidung,
                                            hoadon_giatri:hoadon_giatri,
                                            hoadon_pttt:hoadon_pttt,
                                            hoadon_active:hoadon_active,
                                            hoadon_id:hoadon_id,
                                            hoadon_nguoinhap:hoadon_nguoinhap,
                                            hoadon_file:hoadon_file,
                                            hdmua_id:hdmua_id,
                                            hdmua_sohd:hdmua_sohd
                                        },
                                        function(data){
                                            $('#hdmua_content_main').html(data);
                                            $("#hdmua_content_main").show();
                                        }
                                    );
                                    return false;
                                }
                                //end form
                            });
                        });
                    </script>
                {/literal}
            </tr>
        </table>
    </fieldset>
    <!------------------------------------DANH SACH---------------------------------------------->
    <fieldset style="width:1012px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:322px">
        <legend class="legend_list" style="width:885px">
            <div style="width:130px; float:left">Danh sách: {$total_num_result}</div>
            <div style="width:70px; float:left">&nbsp;|&nbsp;Tìm kiếm:&nbsp;</div>
            <div style="width:380px; float:left; font-weight:normal">
                <div style="float:left">
                    <div style="float:left; width:60px">- Nội dung: </div>
                    <div style="float:left; width:300px">
                    <input type="text" id="hoadon_noidung_fs" name="hoadon_noidung_fs" class="text_seek_long" value="{$vars.hoadon_noidung_fs}"/>
                    </div>
                    <input type="hidden" id="processurl" value="{$processurl}" />
                </div>
                <a href="javascript: void(0);" onClick="show_hide_seek()" style="text-decoration:none; color:#F00">
                <div style="float:left; margin-left:3px"><img src="{$css_path}icon_keo_dai.png" class="img_all"></div></a>
            </div>
            <div style="width:380px; float:left; font-weight:normal; position:absolute; display:none; margin:20px 0 0 200px; background-color:#ccd8e7; border:1px solid #99bbe8; border-top:none; z-index:2012" id="seek_more">
                <div style="float:left; width:100%; height:5px"></div>
                <div style="float:left; width:60px; margin-bottom:5px">- Số HĐ: </div>
                <div style="float:left; width:80px; margin-bottom:5px">
                <input type="text" id="hoadon_sohd_fs" name="hoadon_sohd_fs" class="text_seek_tiny" value="{$vars.hoadon_sohd_fs}" />
                </div>

                <div style="float:left; width:79px; margin-bottom:5px">- Ngày xuất: </div>
                <div style="float:left; width:155px; margin-bottom:5px">
                    <div style="float:left; width:90px; background-color:#FFF; margin-bottom:5px">
                    <input type="text" id="ngayxuat_1" name="ngayxuat_1" class="text_date" value="{$vars.ngayxuat_1}" maxlength="2"/>
                    /<input type="text" id="ngayxuat_2" name="ngayxuat_2" class="text_month" value="{$vars.ngayxuat_2}" maxlength="2" />
                    /<input type="text" id="ngayxuat_3" name="ngayxuat_3" class="text_year" value="{$vars.ngayxuat_3}" maxlength="4" />
                    </div>
                </div>
                
            </div>
            <div style="width:45px; float:left">
                <input type="button" name="btnSeek" id="btnSeek" value="Tìm >>" class="button_seek" onclick="search_me_HdmuaHoadon()" />
            </div>
            <!-----------------------------------------KET XUAT--------------------------------------->
            <div style="width:80px; float:left">&nbsp;|&nbsp;Kết xuất:&nbsp;</div>
            <a href="javascript: void(0);" onClick="show_hide_filter()" style="text-decoration:none">
            <div style="float:left; margin-left:10px; width:78px">Lọc dữ liệu</div></a>
            <div style="width:92px; float:left; height:20px; margin-top:1px">
                <a href="javascript: void(0);" onClick="export_doc(1)" style="text-decoration:none; color:#F00">
                <div style="float:left; margin-left:5px; width:26px">
                <img src="../images/admin/word_icon.png" class="img_all" height="20" title="Kết xuất MS Word"></div>
                </a>
                <a href="javascript: void(0);" onClick="export_doc(2)" style="text-decoration:none; color:#F00">
                <div style="float:left; margin-left:5px; width:26px">
                <img src="../images/admin/excel_icon.png" class="img_all" height="20" title="Kết xuất MS Excel"></div>
                </a>
                <a href="javascript: void(0);" onClick="export_doc(3)" style="text-decoration:none; color:#F00">
                <div style="float:left; margin-left:5px; width:25px">
                <img src="../images/admin/print_pre_icon.png" class="img_all" height="20" title="Xem trước khi in"></div>
                </a>
            </div>
            <div style="width:280px; float:left; font-weight:normal; position:absolute; display:none; margin:20px 0 0 604px; background-color:#ccd8e7; border:1px solid #99bbe8; border-top:none; z-index:2012" id="div_filter">
            	<div style="float:left; width:100%; height:5px"></div>
                <div style="float:left; width:46px; margin-bottom:5px">- Xuất:</div>
                <div style="float:left; width:20px; margin-bottom:5px">Từ&nbsp;</div>
                <div style="float:left; width:90px; background-color:#FFF; margin-bottom:5px">
                <input type="text" id="ngayxuat_1" name="ngayxuat_1" class="text_date" value="{$smarty.now|date_format:'%d'}" maxlength="2"/>
                /<input type="text" id="ngayxuat_2" name="ngayxuat_2" class="text_month" value="{$smarty.now|date_format:'%m'}" maxlength="2" />
                /<input type="text" id="ngayxuat_3" name="ngayxuat_3" class="text_year" value="{$smarty.now|date_format:'%Y'}" maxlength="4" />
                </div>
                <div style="float:left; width:24px; margin-bottom:5px; margin-left:5px">đến&nbsp;</div>
                <div style="float:left; width:90px; margin-bottom:5px; background-color:#FFF">
                <input type="text" id="denngay_1" name="denngay_1" class="text_date" value="{$smarty.now|date_format:'%d'}" maxlength="2" />
                /<input type="text" id="denngay_2" name="denngay_2" class="text_month" value="{$smarty.now|date_format:'%m'}" maxlength="2" />
                /<input type="text" id="denngay_3" name="denngay_3" class="text_year" value="{$smarty.now|date_format:'%Y'}" maxlength="4" />
                </div>

                <div style="float:left; width:66px; margin-bottom:5px">- Tình trạng: </div>
                <div style="float:left; width:150px; margin-bottom:5px">
                    <select name="tinhtrang_fil" id="tinhtrang_fil" class="select_seek">
                        <option value="1">Có hiệu lực</option>
                        <option value="2">Bị hủy</option>
                    </select>
                </div>
            </div>
        </legend>
    	<div style="float:left; height:5px; width:100%"></div>
        <div style="float:left; height:25px; width:990px; border-top:1px solid #99bbe8; border-bottom:1px solid #99bbe8 ">
            <div class="tbl_tit" style="width:40px; text-align:center"><b>STT</b></div>
            <div class="tbl_tit" style="width:100px"><B>&nbsp;Số hóa đơn</B></div>
            <div class="tbl_tit" style="width:70px"><B>&nbsp;Ngày xuất</B></div>
            <div class="tbl_tit" style="width:120px;text-align:right"><B>&nbsp;Giá trị&nbsp;</B></div>
            <div class="tbl_tit" style="width:100px"><B>&nbsp;PT thanh toán</B></div>
            <div class="tbl_tit" style="width:270px"><B>&nbsp;Nội dung</B></div>
            <div class="tbl_tit" style="width:80px"><B>&nbsp;Tình trạng</B></div>
            <div class="tbl_tit" style="width:70px"><B>&nbsp;Ngày nhập</B></div>
            <div class="tbl_tit" style="width:40px; text-align:center"><B>File</B></div>
            <div class="tbl_tit" style="width:59px; text-align:center"><B>Chọn</B></div>
            <div class="tbl_tit" style="width:30px; text-align:center">
            <input type="hidden" name="chon" id="chon_HdmuaHoadon">
            <input type="checkbox" name="chkall" value="0" onclick="docheck_HdmuaHoadon(document.frmList_HdmuaHoadon.chkall.checked,0);">
            </div>
        </div>
        <div style="float:left; width:20px; text-align:right">
        <input type="button" name="del_Items" id='del_Items' value="&nbsp;" onClick="delItems_HdmuaHoadon('{$processurl}');" style="width:17px; font-size:12px; background:url(../images/admin/b_drop.png); cursor:pointer" title="Xóa lựa chọn">
        </div>
        <div style="float:left; height:269px; width:1012px; overflow-y:scroll">
            {section name=pi loop=$obj_list}
            {if $smarty.section.pi.index is not div by 2} 
            {assign var="class_td" value="tbl_cont"} 
            {else}
            {assign var="class_td" value="tbl_cont2"} 
            {/if}
            {math x=$vars.curpage-1 y=$vars.numresult z=$smarty.section.pi.index t=1 equation="x*y+z+t" assign=stt}
            <div style="float:left">
                <div class="{$class_td}" style="width:40px; text-align:center">{$stt}</div>
                <div class="{$class_td}" style="width:100px; text-align:left">
                    &nbsp;{$obj_list[pi]->hoadon_sohd}&nbsp;
                </div>
                <div class="{$class_td}" style="width:70px">
                    &nbsp;{$obj_list[pi]->hoadon_ngayhd|date_format:"%d/%m/%Y"}
                </div>
                <div class="{$class_td}" style="width:120px;text-align:right">
                    &nbsp;{$obj_list[pi]->hoadon_giatri|price_format}&nbsp;
                </div>
                <div class="{$class_td}" style="width:100px">
                    &nbsp;{if $obj_list[pi]->hoadon_pttt eq 1}Tiền mặt{else}Chuyển khoản{/if}
                </div>
                <div class="{$class_td}" style="width:270px" title="{$obj_list[pi]->hoadon_noidung}">
                	{math a=$smarty.section.pi.index b=1 equation="a+b" assign=count}
                    <div style="float:left; width:248px; white-space:nowrap">&nbsp;<a href="javascript: void(0);" onclick="edit_me_HdmuaHoadon({$obj_list[pi]->hoadon_id})" >{$obj_list[pi]->hoadon_noidung|str_string_cut:"60":"1"}</a></div>
                    <div style="float:right; margin:2px; border:1px solid #8ea4c1; height:18px; width:16px; text-align:center; background-color:#dfe8f6" title="Chức năng mở rộng">
                    {if $user_level eq 9 or $user_level eq 1}<a href='javascript: void(0);' onclick="show_list_options({$count},{$total_num_result})">
                    <img src="{$css_path}extra_icon.png" width="14" height="14" border="0" class="img_all"></a>{/if}
                    </div>
                    <div id="extra_{$count}" style="position:absolute; display:none; height:auto; width:140px; margin:2px 111px; border:1px solid #8ea4c1; border-right:1px solid #8ea4c1; background-color:#dfe8f6">
                        <div style="float:left; width:140px; height:18px; border-right:1px solid #dfe8f6"><b>&nbsp;Thao tác:</b></div>
                        <div style="float:left; width:140px; padding:0 0 0 3px">
                            <div style="float:left; width:135px">- <a href="javascript: void(0)" onclick="javascript: show_tonkho({$obj_list[pi]->hoadon_id})">Quản lý tồn</a></div>
                        </div>
                        <div style="float:left; width:140px; padding:0 0 0 3px">
                             - <a href="javascript: void(0)" onclick="javascript: show_hdmua_hopdong({$obj_list[pi]->hdmua_id})">Thông tin hợp đồng</a>
                        </div>
                    </div>
                </div>
                <div class="{$class_td}" style="width:80px">
                    &nbsp;{if $obj_list[pi]->hoadon_active eq 1}
                        Có hiệu lực
                     {else}
                        Bị hủy
                     {/if}
                </div>
                <div class="{$class_td}" style="width:70px">
                    &nbsp;{$obj_list[pi]->hoadon_date|date_format:"%d/%m/%Y"}
                </div>

                <div class="{$class_td}" style="width:40px; text-align:center">
                    <a href='{$obj_list[pi]->hoadon_file}' target="new">
                        <img src="../images/admin/download_icon.png" width="16" height="16" border="0" title="Tải về"></a>
                </div>
                <div class="{$class_td}" style="width:29px; text-align:center">
                    <a href='javascript: void(0);' onclick="edit_me_HdmuaHoadon({$obj_list[pi]->hoadon_id})">
                    <img src="../images/admin/b_edit.png" width="11" height="11" border="0" title="Sửa"></a>
                </div>
                <div class="{$class_td}" style="width:29px; text-align:center">
                    <a href='javascript: void(0)' onClick="delItems_HdmuaHoadon('{$processurl}', {$obj_list[pi]->hoadon_id});">
                    <img src="../images/admin/b_drop.png" width="11" height="11" border="0" title="Xóa"></a>
                </div>
                <div class="{$class_td}" style="width:30px; text-align:center">
                    <input type="checkbox" name="chkid" value="{$obj_list[pi]->hoadon_id}" onclick="docheckone_HdmuaHoadon();">
                </div>
            </div>
            {/section}
        </div>
        <input type="hidden" id="curpage_HdmuaHoadon" name="curpage" value="{$vars.curpage}" />
        <input type="hidden" name="arg" id="arg" value="{$vars.arg}">
        <input type="hidden" name="arg_doc" id="arg_doc" value="{$vars.arg_doc}">
    </fieldset>
    </form>
</div>
<!------------------------------------------------- Tool bar --------------------------------------------->
<div id="hdmua_clear_txt"></div>
<div id="hdmua_tool_bar">

    <div id="hdmua_search_area">
    <select name="order" id = "order_HdmuaHoadon" style="width:120px; font-size:12px; border:1px solid #99bbe8; margin-left:1px" onchange="reloadPage_HdmuaHoadon('{$processurl}');">
    {section name=sli loop=$order_arr}
        <option value="{$smarty.section.sli.index}" {if $smarty.section.sli.index eq $vars.order}selected{/if} >
        {$order_arr[sli]}
        </option>
    {/section}
    </select>
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div id="hdmua_page_area">
    {if $vars.curpage eq 1}
    	<img src="{$css_path}icon_first_page.png" class="img_all">
    	<img src="{$css_path}icon_pre_page.png" class="img_all">
    {else}
    <a href="javascript: void(0)" id="first_page" onclick="gotoPage_HdmuaHoadon('{$processurl}',parseInt(1));" title="Trang đầu">
    	<img src="{$css_path}icon_first_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="pre_page" onclick="gotoPage_HdmuaHoadon('{$processurl}',parseInt(document.getElementById('page_HdmuaHoadon').value)-parseInt(1));" title="Trang trước">
    	<img src="{$css_path}icon_pre_page.png" class="img_all">
    </a>
    {/if}
    </div>
    <div style="float:left; line-height:19px">
        <div style="float:left; width:35px">Trang</div> 
        <div style="float:left; width:35px">
        <input type="text" value="{$vars.curpage}" name="page" id="page_HdmuaHoadon" onblur=" gotoPage_HdmuaHoadon('{$processurl}',this.value);" style="width:30px; font-size:12px; height:15px; border:1px solid #99bbe8">
        </div>
        <div style="float:left; width:42px"> / {$num_page}</div>
    </div>
    <div id="hdmua_page_area">
    {if $vars.curpage eq $num_page}
    	<img src="{$css_path}icon_next_page.png" class="img_all">
        <img src="{$css_path}icon_last_page.png" class="img_all">
    {else}
    <a href="javascript: void(0)" id="next_page" onclick="gotoPage_HdmuaHoadon('{$processurl}',parseInt(document.getElementById('page_HdmuaHoadon').value)+parseInt(1));" title="Trang tiếp">
    	<img src="{$css_path}icon_next_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="last_page" onclick="gotoPage_HdmuaHoadon('{$processurl}',parseInt({$num_page}));" title="Trang cuối">
    	<img src="{$css_path}icon_last_page.png" class="img_all">
    </a>
    {/if}
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:left; width:15px">
    <a href="javascript: void(0)" id="a_ref_HdmuaHoadon" title="Tải lại"><img src="{$css_path}icon_refresh.png" class="img_all"></a>
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:right; line-height:19px; margin-right:2px">
        <div style="float:left; width:40px">Xem</div>
        <div style="float:left; width:52px">
            <select name="numresult" id="numresult_HdmuaHoadon" style="width:50px; font-size:12px; border:1px solid #99bbe8" onchange="reloadPage_HdmuaHoadon('{$processurl}');">
                {section name=sli loop=$nrs_arr}
                <option value="{$nrs_arr[sli]}" {if $nrs_arr[sli] eq $vars.numresult}selected{/if}>{$nrs_arr[sli]} </option>
                {/section}
            </select>
        </div>
        <div style="float:left; margin-right:1px">dòng / trang</div>
    </div>
    
</div>
{literal}
<script language="javascript">	
	function show_list_options(count,total){
		for(i=1;i<=total;i++){
			if(i==count){
				if(document.getElementById('extra_'+i).style.display=='none')
					document.getElementById('extra_'+i).style.display='block';
				else
					document.getElementById('extra_'+i).style.display='none';
			}
			else
				document.getElementById('extra_'+i).style.display='none';
		}
	}
	function show_hide_seek(){
		if(document.getElementById('seek_more').style.display=='none')
			document.getElementById('seek_more').style.display='';
		else document.getElementById('seek_more').style.display='none';
	}
	
	function show_hide_filter(){
		if(document.getElementById('div_filter').style.display=='none')
			document.getElementById('div_filter').style.display='';
		else document.getElementById('div_filter').style.display='none';
	}
	
	function docheck_HdmuaHoadon(status,from_){
		var alen=document.frmList_HdmuaHoadon.elements.length;
		alen=(alen>5)?document.frmList_HdmuaHoadon.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
			document.frmList_HdmuaHoadon.chkid[i].checked=status;
		}
		else{
			document.frmList_HdmuaHoadon.chkid.checked=status;
		}
		if(from_>0) document.frmList_HdmuaHoadon.chkall.checked=status;
	}
		
	function docheckone_HdmuaHoadon(){
		var alen=document.frmList_HdmuaHoadon.elements.length;
		var isChecked=true;
		alen=(alen>4)?document.frmList_HdmuaHoadon.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_HdmuaHoadon.chkid[i].checked==false)
					isChecked=false;
		}else{
			if(document.frmList_HdmuaHoadon.chkid.checked==false)
				isChecked=false;
		}				
		document.frmList_HdmuaHoadon.chkall.checked=isChecked;
	}
	
	function calculatechon_HdmuaHoadon(){			
		var strchon="";
		var alen=document.frmList_HdmuaHoadon.elements.length;				
		alen=(alen>2)?document.frmList_HdmuaHoadon.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_HdmuaHoadon.chkid[i].checked==true)
					strchon+=document.frmList_HdmuaHoadon.chkid[i].value+",";
		}else{
			if(document.frmList_HdmuaHoadon.chkid.checked==true)
				strchon=document.frmList_HdmuaHoadon.chkid.value;
		}
		document.frmList_HdmuaHoadon.chon_HdmuaHoadon.value=strchon;
	}
	
	function delItems_HdmuaHoadon(processurl,delStr){
		if (delStr == undefined){
			calculatechon_HdmuaHoadon();
			delStr = document.getElementById("chon_HdmuaHoadon").value;
		}
		if (delStr == ""){
			return false;
		}
		if(!confirm("THÔNG BÁO: \n\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
			return false;
		}	
		
		var numresult_HdmuaHoadon,order_HdmuaHoadon,curpage_HdmuaHoadon;
		numresult = $("#numresult_HdmuaHoadon").val();
		order = $("#order_HdmuaHoadon").val();
		curpage = $("#curpage_HdmuaHoadon").val();
		
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
				$('#hdmua_content_main').fadeOut('fast').load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+curpage).fadeIn("fast");
			}
		});
	}
	
	function reloadPage_HdmuaHoadon(processurl){
		var numresult_HdmuaHoadon,order_HdmuaHoadon,cur_pos;
		numresult = $("#numresult_HdmuaHoadon").val();
		order = $("#order_HdmuaHoadon").val();
		cur_pos = 0;
		$("#hdmua_content_main").load(processurl+"&numresult="+numresult+"&order="+order+"&cur_pos="+cur_pos);
	}

	
	function show_tonkho(hoadon_id){
        change_style_hdmua(3);
		document.getElementById('hdmua_content_main').style.display='block';
		//var arg = document.getElementById('arg').value;
		$("#hdmua_content_main").load("?listTonkho&mod=hdmua&hoadon_id="+hoadon_id);
	}

	function show_hdmua_hopdong(hoadon_id){
		document.getElementById('div_view_doc').style.display='block';
		$("#list_view_hoadon_cont").load("?viewHdmuaHoadon&mod=hdmua&hoadon_id="+hoadon_id);
	}
		
	function gotoPage_HdmuaHoadon(processurl,page){
		var numresult_HdmuaHoadon,order_HdmuaHoadon,cur_pos;
		numresult = $("#numresult_HdmuaHoadon").val();
		order = $("#order_HdmuaHoadon").val();
		//alert(processurl+'-'+page+'-'+numresult+'-'+order);
		$("#hdmua_content_main").load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+page);
	}

	function search_me_HdmuaHoadon(){
		var hoadon_noidung_fs 	= document.getElementById('hoadon_noidung_fs').value;
		var hoadon_sohd_fs 	= document.getElementById('hoadon_sohd_fs').value;
		var ngayxuat_1 		= document.getElementById('ngayxuat_1').value;
		var ngayxuat_2 	= document.getElementById('ngayxuat_2').value;
		var ngayxuat_3 	= document.getElementById('ngayxuat_3').value;
		
		if (hoadon_noidung_fs == "" && hoadon_sohd_fs == "" && ngayxuat_1 == "" && ngayxuat_2 == "" && ngayxuat_3 == ""){
			return false;
		}
		
		$.post('?listHdmuaHoadon&mod=hdmua&search_me=1',
			{
				hoadon_noidung_fs:hoadon_noidung_fs,
                hoadon_sohd_fs:hoadon_sohd_fs,
                ngayxuat_1:ngayxuat_1,
                ngayxuat_2:ngayxuat_2,
                ngayxuat_3:ngayxuat_3
			},
			function(data){
				$('#hdmua_content_main').html(data);
				$("#hdmua_content_main").show();
			}
		);
	}
	
	// ----- ket xuat
	function export_doc(exptype){
		var ngayxuat_1 	= document.getElementById('ngayxuat_1').value;
		var ngayxuat_2 	= document.getElementById('ngayxuat_2').value;
		var ngayxuat_3 	= document.getElementById('ngayxuat_3').value;
		
		var denngay_1 	= document.getElementById('denngay_1').value;
		var denngay_2 	= document.getElementById('denngay_2').value;
		var denngay_3 	= document.getElementById('denngay_3').value;

        var tinhtrang_fil 	= document.getElementById('tinhtrang_fil').value;
		
		var ngayxuat = ngayxuat_3+'-'+ngayxuat_2+'-'+ngayxuat_1;
		var denngay = denngay_3+'-'+denngay_2+'-'+denngay_1;
				
		if (ngayxuat == "" && denngay == ""){
			return false;
		}
		
		if(exptype==3){
			document.getElementById('div_hdmua_report').style.display='block';
			$.post('?expHdmuaHDReport&mod=hdmua&exptype='+exptype,
				{
					ngayxuat:ngayxuat,
					denngay:denngay,
                    tinhtrang_fil:tinhtrang_fil

				},
				function(data){
					$('#hdmua_report_content_main').html(data);
					$("#hdmua_report_content_main").show();
				}
			);
			
			$('#hdmua_content_main').hide();
			$('#hdmua_content_main').fadeOut('fast').load('index.php?listHdmuaHoadon&mod=hdmua').fadeIn("fast");
			//$('#hdmua_report_content_main').load("?expHdmuaHDReport&mod=hdmua&exptype="+exptype+"&ngayxuat="+ngayxuat+"&denngay="+denngay);
		}else{
			window.location="?expHdmuaHDReport&mod=hdmua&exptype="+exptype+"&ngayxuat="+ngayxuat+"&denngay="+denngay;
		}
	}
	
	function edit_me_HdmuaHoadon(id){
		$("#hdmua_content_main").load("?listHdmuaHoadon&mod=hdmua&edit_me=1&hdmua_id="+id);
	}
		
	$("#a_ref_HdmuaHoadon").click( function () { 
			$('#hdmua_content_main').hide();
			$('#hdmua_content_main').fadeOut('fast').load('index.php?listHdmuaHoadon&mod=hdmua').fadeIn("fast");
		});
</script>
{/literal}
