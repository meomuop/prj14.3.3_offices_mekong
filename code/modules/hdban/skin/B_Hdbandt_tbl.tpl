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
            $('#dthdban_giatri').priceFormat({
                centsSeparator: '.',
                thousandsSeparator: '.'
            });

            $('#dthdban_giatri_quydoi').priceFormat({
                centsSeparator: '.',
                thousandsSeparator: '.'
            });

            $('#dthdban_gttt').priceFormat({
                centsSeparator: '.',
                thousandsSeparator: '.'
            });

            $('#dthdban_gttt_quydoi').priceFormat({
                centsSeparator: '.',
                thousandsSeparator: '.'
            });

            $('#dthdban_tl_huybo').priceFormat({
                centsSeparator: '.',
                thousandsSeparator: '.'
            });
        });
    </script>
{/literal}
<div id="hdban_content_insign">
	<form method="post" name="frmList_Hdbandt" action="?listHdbandt{$vars.arg}" id="frmList_Hdbandt">
    <!------------------------------------------THEM MOI------------------------------------>
    <fieldset style="width:1012px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
        <legend class="legend_list_search" style="width: 600px">
            Thêm/Chỉnh sửa&nbsp;|&nbsp;Thông báo:&nbsp;
            <span id="mess_doc" class="msg">{$error}{$complete}</span>
            <span id="lblError_Hdbandt" class="error">(*) là các mục bắt buộc!</span>
        </legend>
    	<table width="98%" cellspacing="0" cellpadding="0" border="0" style="margin-left:5px">
        	<tr height="10"><td colspan="2"></td></tr>
            <tr height="30">
            	<td align="center" width="30%" valign="top">
                    <div style="float:left; width:30%; line-height:25px; text-align:left">Số hợp đồng <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left">
                        <input type="text" id="dthdban_sohd" name="dthdban_sohd" class="text_short" value="{$obj_info.dthdban_sohd}" tabindex="1" onfocus="hide_message_Hdbandt();"/>
                    </div>
                    <div style="float:left; width:30%; line-height:25px; text-align:left">Ngày hiệu lực <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left">
                        <input type="text" name="dthdban_hieuluc" id="dthdban_hieuluc" class="text_short" value="" tabindex="3" onfocus="hide_message_Hdbandt();"/>&nbsp;(ngày)
                    </div>
                	<div style="float:left; width:30%; line-height:25px; text-align:left">Khách hàng:</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left">
                        <select name="khachhang_id" id="khachhang_id" class="select_middle" tabindex="4">
                            <option value="0">Chọn khách hàng</option>
                            {section name=qi loop=$obj_list_khachhang}
                            <option value="{$obj_list_khachhang[qi]->khachhang_id}" {if $obj_list_khachhang[qi]->khachhang_id eq $obj_info.khachhang_id}selected="selected"{/if}>-&nbsp;{$obj_list_khachhang[qi]->khachhang_name}</option>
                            {/section}
                        </select>
                    </div>
                    <div style="float:left; width:30%; line-height:25px; text-align:left" title="Thời gian thực hiện">TG thực hiện <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:20%; line-height:25px; text-align:left">
                    	<input type="text" value="{$obj_info.dthdban_tgth}" id="dthdban_tgth" name="dthdban_tgth" class="text_tiny" tabindex="5"/>
                    </div>
                    <div style="float:left; width:40%; line-height:25px; text-align:left">
                        <select name="dthdban_kieu_tgth" id="dthdban_kieu_tgth" class="select_short" tabindex="6">
                            <option value="1" {if $obj_info.dthdban_kieu_tgth eq 1}selected="selected"{/if}>-&nbsp;Ngày</option>
                            <option value="2" {if $obj_info.dthdban_kieu_tgth eq 2}selected="selected"{/if}>-&nbsp;Tháng</option>
                            <option value="3" {if $obj_info.dthdban_kieu_tgth eq 3}selected="selected"{/if}>-&nbsp;Năm</option>
                        </select>
                    </div>

                    <div style="float:left; width:30%; line-height:25px; text-align:left" title="Phòng/ban phụ trách">P/B phụ trách:</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left">
                        <select name="department_id" id="department_id" class="select_middle" tabindex="6">
                            {section name=qi loop=$obj_list_department}
                                {if $obj_list_department[qi]->department_id eq $access_unit_id}
                                <option value="{$obj_list_department[qi]->department_id}" selected="selected">{$obj_list_department[qi]->department_name}</option>
                                {/if}
                            {/section}
                        </select>
                    </div>
                    <div style="float:left; width:30%; line-height:25px; text-align:left">Người theo dõi:</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left" id="div_dthdban_user_id">
                        <select name="user_id" id="user_id" class="select_middle" tabindex="7">
                            {section name=qi loop=$obj_list_user}
                                {if $obj_list_user[qi]->user_id eq $access_user_id}
                                    <option value="{$obj_list_user[qi]->user_id}" selected="selected">{$obj_list_user[qi]->user_fullname}</option>
                                {/if}
                            {/section}
                        </select>
                    </div>
                </td>

                <td align="center" width="25%" valign="top">
                    <div style="float:left; width:40%; line-height:25px; text-align:left">Tiền tệ:</div>
                    <div style="float:left; width:60%; line-height:25px; text-align:left">
                        <select name="dvtiente_id" id="dvtiente_id" class="select_short" tabindex="9">
                            <option value="0">Chọn kiểu tiền</option>
                            {section name=qi loop=$obj_list_dvtiente}
                                <option value="{$obj_list_dvtiente[qi]->dvtiente_id}" {if $obj_list_dvtiente[qi]->dvtiente_id eq $obj_info.dvtiente_id}selected="selected"{/if}>{$obj_list_dvtiente[qi]->dvtiente_unit}</option>
                            {/section}
                        </select>
                    </div>
                    <div style="float:left; width:40%; line-height:25px; text-align:left">Giá trị:</div>
                    <div style="float:left; width:60%; line-height:25px; text-align:left">
                        <input type="text" value="{$obj_info.dthdban_giatri}" id="dthdban_giatri" name="dthdban_giatri" class="text_short text_number" tabindex="10"/>
                    </div>
                    <div style="float:left; width:40%; line-height:25px; text-align:left" title="Thanh toán hủy hợp đồng">Quy đổi (VND):</div>
                    <div style="float:left; width:60%; line-height:25px; text-align:left">
                        <input type="text" value="{$obj_info.dthdban_giatri_quydoi}" id="dthdban_giatri_quydoi" name="dthdban_giatri_quydoi" class="text_short text_number" tabindex="11"/>
                    </div>

                    <div style="float:left; width:40%; line-height:25px; text-align:left">GT thanh toán:</div>
                    <div style="float:left; width:60%; line-height:25px; text-align:left">
                        <input type="text" value="{$obj_info.dthdban_gttt}" id="dthdban_gttt" name="dthdban_gttt" class="text_short text_number" tabindex="12"/>
                    </div>
                    <div style="float:left; width:40%; line-height:25px; text-align:left">Quy đổi (VND):</div>
                    <div style="float:left; width:60%; line-height:25px; text-align:left">
                        <input type="text" value="{$obj_info.dthdban_gttt_quydoi}" id="dthdban_gttt_quydoi" name="dthdban_gttt_quydoi" class="text_short text_number" tabindex="13"/>
                    </div>
                    <div style="float:left; width:100%; line-height:25px; text-align:left">
                        <input type="button" name="btnSub_Hdbandt" id="btnSub_Hdbandt" value="Ghi lại" class="button" tabindex="18"/>
                        <input type="hidden" name="dthdban_id" id="dthdban_id" value="{$obj_info.dthdban_id}">
                        <input type="hidden" name="dthdban_file" id="dthdban_file" value="{$obj_info.dthdban_file}">
                        <input type="reset" name="Reset" value="Hủy bỏ" class="button" tabindex="19"/>
                    </div>
                </td>

                <td align="center" valign="top">
                	<div style="float:left; width:15%; line-height:25px; text-align:left">Nội dung <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:85%; line-height:25px; text-align:left; height:50px">
                    	<textarea spellcheck="false" name="dthdban_noidung" id="dthdban_noidung" cols="30" rows="5" class="text_area_small" onfocus="hide_message_Hdbandt()" tabindex="8">{$obj_info.dthdban_noidung}</textarea>
                    </div>

                    <div style="float:left; width:15%; line-height:25px; text-align:left" title="Điều khoản khác">ĐK khác:</div>
                    <div style="float:left; width:85%; line-height:25px; text-align:left; height:50px">
                        <textarea spellcheck="false" name="dthdban_dieukhoankhac" id="dthdban_dieukhoankhac" cols="30" rows="5" class="text_area_small" onfocus="hide_message_Hdbandt()" tabindex="14">{$obj_info.dthdban_dieukhoankhac}</textarea>
                    </div>

                    <div style="float:left; width:15%; line-height:25px; text-align:left">Tình trạng <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:85%; line-height:25px; text-align:left">
                        <select name="dthdban_tinhtrang" id="dthdban_tinhtrang" class="select_middle" tabindex="17">
                            <option value="1" {if $obj_info.dthdban_tinhtrang eq 1}selected="selected"{/if}>-&nbsp;Mới dự thảo</option>
                            <option value="2" {if $obj_info.dthdban_tinhtrang eq 2}selected="selected"{/if}>-&nbsp;Trưởng phòng đã duyệt</option>
                            <option value="3" {if $obj_info.dthdban_tinhtrang eq 3}selected="selected"{/if}>-&nbsp;Giám đốc đã duyệt</option>
                            <option value="4" {if $obj_info.dthdban_tinhtrang eq 4}selected="selected"{/if}>-&nbsp;Đã ký kết</option>
                            <option value="5" {if $obj_info.dthdban_tinhtrang eq 5}selected="selected"{/if}>-&nbsp;Đã hủy bỏ</option>
                        </select>
                    </div>

                    <div style="float:left; width:30%; line-height:25px; text-align:left">
                        &nbsp;<b>(Người nhập: {$access_user_name})</b>
                    </div>
                </td>
                {literal}
                    <script language="javascript">
                        function hide_message_Hdbandt(){
                            $('#lblMessage_Hdbandt').hide();
                            $('#lblError_Hdbandt').hide();
                            $('#mess_doc').hide();
                        }

                        $(function() {
                            $('.error').hide();
                            $('#lblMessage_Hdbandt').hide();

                            $("#btnSub_Hdbandt").click(function() {

                                $('.error').hide();

                                var $form = $("#frmList_Hdbandt");

                                var dthdban_sohd = $form.find('input#dthdban_sohd').val();
                                var dthdban_hieuluc = $form.find('input#dthdban_hieuluc').val();
                                var dthdban_noidung = $form.find('textarea#dthdban_noidung').val();
                                var dthdban_tgth = $form.find('input#dthdban_tgth').val();
                                var dthdban_kieu_tgth = $form.find('select#dthdban_kieu_tgth :selected').val();
                                var dthdban_giatri = $form.find('input#dthdban_giatri').val();
                                var dthdban_giatri_quydoi = $form.find('input#dthdban_giatri_quydoi').val();
                                var dthdban_gttt = $form.find('input#dthdban_gttt').val();
                                var dthdban_gttt_quydoi = $form.find('input#dthdban_gttt_quydoi').val();
                                var dthdban_dieukhoankhac = $form.find('textarea#dthdban_dieukhoankhac').val();
                                var khachhang_id = $form.find('select#khachhang_id :selected').val();
                                var department_id = $form.find('select#department_id :selected').val();
                                var dvtiente_id = $form.find('select#dvtiente_id :selected').val();
                                var dthdban_tinhtrang = $form.find('select#dthdban_tinhtrang :selected').val();
                                var user_id = $form.find('select#user_id :selected').val();
                                var dthdban_id = $form.find('input#dthdban_id').val();
                                var dthdban_file = $form.find('input#dthdban_file').val();


                                //begin validate form
                                if (dthdban_sohd == "" || dthdban_noidung == "" || dthdban_giatri_quydoi == "" || dthdban_gttt_quydoi == "" || khachhang_id == "" ){
                                    $('#lblError_Hdbandt').show();
                                }
                                else{
                                    $.post('index.php?listHdbandt&mod=hdban&add_edit=1',
                                        {
                                            dthdban_sohd:dthdban_sohd,
                                            dthdban_hieuluc:dthdban_hieuluc,
                                            dthdban_noidung:dthdban_noidung,
                                            dthdban_tgth:dthdban_tgth,
                                            dthdban_kieu_tgth:dthdban_kieu_tgth,
                                            dthdban_giatri:dthdban_giatri,
                                            dthdban_giatri_quydoi:dthdban_giatri_quydoi,
                                            dthdban_gttt:dthdban_gttt,
                                            dthdban_gttt_quydoi:dthdban_gttt_quydoi,
                                            dthdban_dieukhoankhac:dthdban_dieukhoankhac,
                                            khachhang_id:khachhang_id,
                                            department_id:department_id,
                                            dvtiente_id:dvtiente_id,
                                            dthdban_tinhtrang:dthdban_tinhtrang,
                                            user_id:user_id,
                                            dthdban_id:dthdban_id,
                                            dthdban_file:dthdban_file
                                        },
                                        function(data){
                                            $('#hdban_content_main').html(data);
                                            $("#hdban_content_main").show();
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
    <fieldset style="width:1012px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:274px">
        <legend class="legend_list" style="width:885px">
            <div style="width:130px; float:left">Danh sách: {$total_num_result}</div>
            <div style="width:70px; float:left">&nbsp;|&nbsp;Tìm kiếm:&nbsp;</div>
            <div style="width:380px; float:left; font-weight:normal">
                <div style="float:left">
                    <div style="float:left; width:60px">- Trích yếu: </div>
                    <div style="float:left; width:300px">
                    <input type="text" id="dthdban_noidung_fs" name="dthdban_noidung_fs" class="text_seek_long" value="{$vars.dthdban_noidung_fs}"/>
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
                <input type="text" id="dthdban_code_fs" name="dthdban_code_fs" class="text_seek_tiny" value="{$vars.dthdban_code_fs}" />
                </div>

                <div style="float:left; width:79px; margin-bottom:5px">- Phòng/ban: </div>
                <div style="float:left; width:155px; margin-bottom:5px">
                    <select name="department_fil" id="department_fil" class="select_seek">
                        <option value="0">Chọn phòng ban</option>
                        {section name=di loop=$obj_list_department}
                            <option value="{$obj_list_department[di]->department_id}">{$obj_list_department[di]->department_name}</option>
                        {/section}
                    </select>
                </div>
                
            </div>
            <div style="width:45px; float:left">
                <input type="button" name="btnSeek" id="btnSeek" value="Tìm >>" class="button_seek" onclick="search_me_Hdbandt()" />
            </div>
            <!-----------------------------------------KET XUAT--------------------------------------->
            <div style="width:80px; float:left">&nbsp;|&nbsp;Kết xuất:&nbsp;</div>
            <a href="javascript: void(0);" onClick="show_hide_filter()" style="text-decoration:none">
            <div style="float:left; margin-left:10px; width:78px">Lọc dữ liệu</div></a>
            <div style="width:92px; float:left; height:20px; margin-top:1px">
                <a href="javascript: void(0);" onClick="export_dthdban(1)" style="text-decoration:none; color:#F00">
                <div style="float:left; margin-left:5px; width:26px">
                <img src="../images/admin/word_icon.png" class="img_all" height="20" title="Kết xuất MS Word"></div>
                </a>
                <a href="javascript: void(0);" onClick="export_dthdban(2)" style="text-decoration:none; color:#F00">
                <div style="float:left; margin-left:5px; width:26px">
                <img src="../images/admin/excel_icon.png" class="img_all" height="20" title="Kết xuất MS Excel"></div>
                </a>
                <a href="javascript: void(0);" onClick="export_dthdban(3)" style="text-decoration:none; color:#F00">
                <div style="float:left; margin-left:5px; width:25px">
                <img src="../images/admin/print_pre_icon.png" class="img_all" height="20" title="Xem trước khi in"></div>
                </a>
            </div>
            <div style="width:280px; float:left; font-weight:normal; position:absolute; display:none; margin:20px 0 0 604px; background-color:#ccd8e7; border:1px solid #99bbe8; border-top:none; z-index:2012" id="div_filter">
            	<div style="float:left; width:100%; height:5px"></div>
                <div style="float:left; width:46px; margin-bottom:5px">- Nhận:</div>
                <div style="float:left; width:20px; margin-bottom:5px">Từ&nbsp;</div>
                <div style="float:left; width:90px; background-color:#FFF; margin-bottom:5px">
                <input type="text" id="tungay_1" name="tungay_1" class="text_date" value="{$smarty.now|date_format:'%d'}" maxlength="2"/>
                /<input type="text" id="tungay_2" name="tungay_2" class="text_month" value="{$smarty.now|date_format:'%m'}" maxlength="2" />
                /<input type="text" id="tungay_3" name="tungay_3" class="text_year" value="{$smarty.now|date_format:'%Y'}" maxlength="4" />
                </div>
                <div style="float:left; width:24px; margin-bottom:5px; margin-left:5px">đến&nbsp;</div>
                <div style="float:left; width:90px; margin-bottom:5px; background-color:#FFF">
                <input type="text" id="denngay_1" name="denngay_1" class="text_date" value="{$smarty.now|date_format:'%d'}" maxlength="2" />
                /<input type="text" id="denngay_2" name="denngay_2" class="text_month" value="{$smarty.now|date_format:'%m'}" maxlength="2" />
                /<input type="text" id="denngay_3" name="denngay_3" class="text_year" value="{$smarty.now|date_format:'%Y'}" maxlength="4" />
                </div>

                <div style="float:left; width:66px; margin-bottom:5px">- Phg/Ban: </div>
                <div style="float:left; width:150px; margin-bottom:5px">
                <select name="department_fil" id="department_fil" class="select_seek">
                    <option value="0">Chọn phòng ban</option>
                    {section name=di loop=$obj_list_department}
                    <option value="{$obj_list_department[di]->department_id}">{$obj_list_department[di]->department_name}</option>
                    {/section}
                </select>
                </div>
                <div style="float:left; width:66px; margin-bottom:5px">- Tình trạng: </div>
                <div style="float:left; width:150px; margin-bottom:5px">
                    <select name="tinhtrang_fil" id="tinhtrang_fil" class="select_seek">
                        <option value="1">Hợp đồng mới</option>
                        <option value="2">Đang thực hiện</option>
                        <option value="3">Đã hoàn thành</option>
                        <option value="4">Đã hủy</option>
                    </select>
                </div>
            </div>
        </legend>
    	<div style="float:left; height:5px; width:100%"></div>
        <div style="float:left; height:25px; width:990px; border-top:1px solid #99bbe8; border-bottom:1px solid #99bbe8 ">
            <div class="tbl_tit" style="width:40px; text-align:center"><b>STT</b></div>
            <div class="tbl_tit" style="width:100px"><B>&nbsp;Số hợp đồng</B></div>
            <div class="tbl_tit" style="width:372px"><B>&nbsp;Nội dung</B></div>
            <div class="tbl_tit" style="width:160px"><B>&nbsp;Khách hàng</B></div>
            <div class="tbl_tit" style="width:110px"><B>&nbsp;Tình trạng</B></div>
            <div class="tbl_tit" style="width:70px"><B>&nbsp;Ngày nhập</B></div>
            <div class="tbl_tit" style="width:40px; text-align:center"><B>File</B></div>
            <div class="tbl_tit" style="width:59px; text-align:center"><B>Chọn</B></div>
            <div class="tbl_tit" style="width:30px; text-align:center">
            <input type="hidden" name="chon" id="chon_Hdbandt">
            <input type="checkbox" name="chkall" value="0" onclick="docheck_Hdbandt(document.frmList_Hdbandt.chkall.checked,0);">
            </div>
        </div>
        <div style="float:left; width:20px; text-align:right">
        <input type="button" name="del_Items" id='del_Items' value="&nbsp;" onClick="delItems_Hdbandt('{$processurl}');" style="width:17px; font-size:12px; background:url(../images/admin/b_drop.png); cursor:pointer" title="Xóa lựa chọn">
        </div>
        <div style="float:left; height:220px; width:1012px; overflow-y:scroll">
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
                    &nbsp;{$obj_list[pi]->dthdban_sohd}&nbsp;
                </div>
                <div class="{$class_td}" style="width:372px" title="{$obj_list[pi]->dthdban_noidung}">
                	{math a=$smarty.section.pi.index b=1 equation="a+b" assign=count}
                    <div style="float:left; width:274px; white-space:nowrap">&nbsp;<a href="javascript: void(0);" onclick="edit_me_Hdbandt({$obj_list[pi]->dthdban_id})" >{$obj_list[pi]->dthdban_noidung|str_string_cut:"63":"1"}</a></div>
                    <div style="float:right; margin:2px; border:1px solid #8ea4c1; height:18px; width:16px; text-align:center; background-color:#dfe8f6" title="Chức năng mở rộng">
                    {if $user_level eq 9 or $user_level eq 1}<a href='javascript: void(0);' onclick="show_list_options({$count},{$total_num_result})">
                    <img src="{$css_path}extra_icon.png" width="14" height="14" border="0" class="img_all"></a>{/if}
                    </div>
                    <div id="extra_{$count}" style="position:absolute; display:none; height:auto; width:140px; margin:2px 141px; border:1px solid #8ea4c1; border-right:1px solid #8ea4c1; background-color:#dfe8f6">
                        <div style="float:left; width:140px; height:18px; border-right:1px solid #dfe8f6"><b>&nbsp;Chọn thao tác:</b></div>
                        <div style="float:left; width:140px; padding:0 0 0 3px">
                            - <a href="javascript: void(0)" onclick="javascript: show_dthdban_chungtu({$obj_list[pi]->dthdban_id})">Quản lý chứng từ</a>
                        </div>
                        <div style="float:left; width:140px; padding:0 0 0 3px">
                             - <a href="javascript: void(0)" onclick="javascript: show_dthdban_vanban({$obj_list[pi]->dthdban_id})">Liên kết văn bản</a>
                        </div>
                        <div style="float:left; width:140px; padding:0 0 0 3px">
                            - <a href="javascript: void(0)" onclick="javascript: show_dthdban_tientrinh({$obj_list[pi]->dthdban_id})">Tiến trình thực hiện</a>
                        </div>
                        <div style="float:left; width:140px; padding:0 0 0 3px">
                            - <a href="javascript: void(0)" onclick="javascript: show_dthdban_thongtin({$obj_list[pi]->dthdban_id})">Thông tin hợp đồng</a>
                        </div>
                    </div>
                </div>
                <div class="{$class_td}" style="width:160px; white-space:nowrap" title="{$obj_list[pi]->khachhang_viettat}">
                    &nbsp;{$obj_list[pi]->khachhang_viettat|str_string_cut:"25":"1"}
                </div>
                <div class="{$class_td}" style="width:110px">
                    &nbsp;{if $obj_list[pi]->dthdban_tinhtrang eq 1}
                        Hợp đồng mới
                     {elseif $obj_list[pi]->dthdban_tinhtrang eq 2}
                        Đang thực hiện
                     {elseif $obj_list[pi]->dthdban_tinhtrang eq 3}
                        Đã hoàn thành
                     {else}
                        Đã hủy
                     {/if}
                </div>
                <div class="{$class_td}" style="width:70px">
                    &nbsp;{$obj_list[pi]->dthdban_date|date_format:"%d/%m/%Y"}
                </div>

                <div class="{$class_td}" style="width:40px; text-align:center">
                    {if $obj_list[pi]->dthdban_file eq 2}
                    <a href='javascript: void(0);' onclick="show_list_file_dthdban({$obj_list[pi]->dthdban_id})">
                    <img src="../images/admin/empty_icon.png" width="14" height="14" border="0"></a>
                    {else}
                    <a href='javascript: void(0);' onclick="show_list_file_dthdban({$obj_list[pi]->dthdban_id})">
                    <img src="../images/admin/folder_icon.png" width="14" height="14" border="0"></a>
                    {/if}
                </div>
                <div class="{$class_td}" style="width:29px; text-align:center">
                    <a href='javascript: void(0);' onclick="edit_me_Hdbandt({$obj_list[pi]->dthdban_id})">
                    <img src="../images/admin/b_edit.png" width="11" height="11" border="0" title="Sửa"></a>
                </div>
                <div class="{$class_td}" style="width:29px; text-align:center">
                    <a href='javascript: void(0)' onClick="delItems_Hdbandt('{$processurl}', {$obj_list[pi]->dthdban_id});">
                    <img src="../images/admin/b_drop.png" width="11" height="11" border="0" title="Xóa"></a>
                </div>
                <div class="{$class_td}" style="width:30px; text-align:center">
                    <input type="checkbox" name="chkid" value="{$obj_list[pi]->dthdban_id}" onclick="docheckone_Hdbandt();">
                </div>
            </div>
            {/section}
        </div>
        <input type="hidden" id="curpage_Hdbandt" name="curpage" value="{$vars.curpage}" />
        <input type="hidden" name="arg" id="arg" value="{$vars.arg}">
        <input type="hidden" name="arg_doc" id="arg_doc" value="{$vars.arg_doc}">
    </fieldset>
    </form>
</div>
<!------------------------------------------------- Tool bar --------------------------------------------->
<div id="hdban_clear_txt"></div>
<div id="hdban_tool_bar">

    <div id="hdban_search_area">
    <select name="order" id = "order_Hdbandt" style="width:120px; font-size:12px; border:1px solid #99bbe8; margin-left:1px" onchange="reloadPage_Hdbandt('{$processurl}');">
    {section name=sli loop=$order_arr}
        <option value="{$smarty.section.sli.index}" {if $smarty.section.sli.index eq $vars.order}selected{/if} >
        {$order_arr[sli]}
        </option>
    {/section}
    </select>
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div id="hdban_page_area">
    {if $vars.curpage eq 1}
    	<img src="{$css_path}icon_first_page.png" class="img_all">
    	<img src="{$css_path}icon_pre_page.png" class="img_all">
    {else}
    <a href="javascript: void(0)" id="first_page" onclick="gotoPage_Hdbandt('{$processurl}',parseInt(1));" title="Trang đầu">
    	<img src="{$css_path}icon_first_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="pre_page" onclick="gotoPage_Hdbandt('{$processurl}',parseInt(document.getElementById('page_Hdbandt').value)-parseInt(1));" title="Trang trước">
    	<img src="{$css_path}icon_pre_page.png" class="img_all">
    </a>
    {/if}
    </div>
    <div style="float:left; line-height:19px">
        <div style="float:left; width:35px">Trang</div> 
        <div style="float:left; width:35px">
        <input type="text" value="{$vars.curpage}" name="page" id="page_Hdbandt" onblur=" gotoPage_Hdbandt('{$processurl}',this.value);" style="width:30px; font-size:12px; height:15px; border:1px solid #99bbe8">
        </div>
        <div style="float:left; width:42px"> / {$num_page}</div>
    </div>
    <div id="hdban_page_area">
    {if $vars.curpage eq $num_page}
    	<img src="{$css_path}icon_next_page.png" class="img_all">
        <img src="{$css_path}icon_last_page.png" class="img_all">
    {else}
    <a href="javascript: void(0)" id="next_page" onclick="gotoPage_Hdbandt('{$processurl}',parseInt(document.getElementById('page_Hdbandt').value)+parseInt(1));" title="Trang tiếp">
    	<img src="{$css_path}icon_next_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="last_page" onclick="gotoPage_Hdbandt('{$processurl}',parseInt({$num_page}));" title="Trang cuối">
    	<img src="{$css_path}icon_last_page.png" class="img_all">
    </a>
    {/if}
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:left; width:15px">
    <a href="javascript: void(0)" id="a_ref_Hdbandt" title="Tải lại"><img src="{$css_path}icon_refresh.png" class="img_all"></a>
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:right; line-height:19px; margin-right:2px">
        <div style="float:left; width:40px">Xem</div>
        <div style="float:left; width:52px">
            <select name="numresult" id="numresult_Hdbandt" style="width:50px; font-size:12px; border:1px solid #99bbe8" onchange="reloadPage_Hdbandt('{$processurl}');">
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
	
	function docheck_Hdbandt(status,from_){
		var alen=document.frmList_Hdbandt.elements.length;
		alen=(alen>5)?document.frmList_Hdbandt.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
			document.frmList_Hdbandt.chkid[i].checked=status;
		}
		else{
			document.frmList_Hdbandt.chkid.checked=status;
		}
		if(from_>0) document.frmList_Hdbandt.chkall.checked=status;
	}
		
	function docheckone_Hdbandt(){
		var alen=document.frmList_Hdbandt.elements.length;
		var isChecked=true;
		alen=(alen>4)?document.frmList_Hdbandt.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_Hdbandt.chkid[i].checked==false)
					isChecked=false;
		}else{
			if(document.frmList_Hdbandt.chkid.checked==false)
				isChecked=false;
		}				
		document.frmList_Hdbandt.chkall.checked=isChecked;
	}
	
	function calculatechon_Hdbandt(){			
		var strchon="";
		var alen=document.frmList_Hdbandt.elements.length;				
		alen=(alen>2)?document.frmList_Hdbandt.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_Hdbandt.chkid[i].checked==true)
					strchon+=document.frmList_Hdbandt.chkid[i].value+",";
		}else{
			if(document.frmList_Hdbandt.chkid.checked==true)
				strchon=document.frmList_Hdbandt.chkid.value;
		}
		document.frmList_Hdbandt.chon_Hdbandt.value=strchon;
	}
	
	function delItems_Hdbandt(processurl,delStr){
		if (delStr == undefined){
			calculatechon_Hdbandt();
			delStr = document.getElementById("chon_Hdbandt").value;
		}
		if (delStr == ""){
			return false;
		}
		if(!confirm("THÔNG BÁO: \n\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
			return false;
		}	
		
		var numresult_Hdbandt,order_Hdbandt,curpage_Hdbandt;
		numresult = $("#numresult_Hdbandt").val();
		order = $("#order_Hdbandt").val();
		curpage = $("#curpage_Hdbandt").val();
		
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
				$('#hdban_content_main').fadeOut('fast').load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+curpage).fadeIn("fast");
			}
		});
	}
	
	function reloadPage_Hdbandt(processurl){
		var numresult_Hdbandt,order_Hdbandt,cur_pos;
		numresult = $("#numresult_Hdbandt").val();
		order = $("#order_Hdbandt").val();
		cur_pos = 0;
		$("#hdban_content_main").load(processurl+"&numresult="+numresult+"&order="+order+"&cur_pos="+cur_pos);
	}
	
	function show_list_file_dthdban(dthdban_id){
		var arg_doc = document.getElementById('arg_doc').value;
		document.getElementById('list_file_dthdban').style.display='block';
		$("#list_dthdban_file_cont").load("?listHdbandtFile&mod=hdban"+arg_doc+"&dthdban_id="+dthdban_id);
	}

	function show_list_reply(user_id,dthdban_id){
		document.getElementById('list_reply').style.display='block';
		var arg = document.getElementById('arg').value;
		$("#list_reply_cont").load("?listHdbandtReply"+arg+"&dthdban_id="+dthdban_id+"&user_id="+user_id);
	}
	
	function show_dthdban_chungtu(dthdban_id){
        change_style_dthdban(2);
        document.getElementById('hdban_content_main').style.display='block';
		//var arg = document.getElementById('arg').value;
		$("#hdban_content_main").load("?listHdbandtHoadon&mod=hdban&dthdban_id="+dthdban_id);
	}

    function show_dthdban_vanban(dthdban_id){
        document.getElementById('div_dthdban_lkvb').style.display='block';
        $("#list_dthdban_lkvb_cont").load("?listHdbandtLkvb&mod=hdban&dthdban_id="+dthdban_id);
    }

    function show_dthdban_tientrinh(dthdban_id){
        document.getElementById('div_thuchien_dthdban').style.display='block';
        $("#list_thuchien_dthdban_cont").load("?listHdbandtTientrinh&mod=hdban&dthdban_id="+dthdban_id);
    }

	function show_dthdban_thongtin(dthdban_id){
		document.getElementById('div_view_dthdban').style.display='block';
		$("#list_view_dthdban_cont").load("?viewHdbandt&mod=hdban&dthdban_id="+dthdban_id);
	}
		
	function gotoPage_Hdbandt(processurl,page){
		var numresult_Hdbandt,order_Hdbandt,cur_pos;
		numresult = $("#numresult_Hdbandt").val();
		order = $("#order_Hdbandt").val();
		//alert(processurl+'-'+page+'-'+numresult+'-'+order);
		$("#hdban_content_main").load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+page);
	}
	
	function search_me_Hdbandt(){
		var dthdban_noidung_fs 	= document.getElementById('dthdban_noidung_fs').value;
		var dthdban_code_fs 	= document.getElementById('dthdban_code_fs').value;
		var dthdban_num_fs 		= document.getElementById('dthdban_num_fs').value;
		var dthdban_tgth_fs 	= document.getElementById('dthdban_tgth_fs').value;
		var docCat_id_fs 	= document.getElementById('docCat_id_fs').value;
		
		if (dthdban_noidung_fs == "" && dthdban_code_fs == "" && dthdban_num_fs == "" && dthdban_tgth_fs == "" && docCat_id_fs == ""){
			return false;
		}
		
		$.post('?listHdbandt&mod=hdban&search_me=1',
			{
				dthdban_noidung_fs:dthdban_noidung_fs,
				dthdban_code_fs:dthdban_code_fs,
				dthdban_num_fs:dthdban_num_fs,
				dthdban_tgth_fs:dthdban_tgth_fs,
				docCat_id_fs:docCat_id_fs
			},
			function(data){
				$('#hdban_content_main').html(data);
				$("#hdban_content_main").show();
			}
		);
	}
	
	// ----- ket xuat
	function export_dthdban(exptype){
		var tungay_1 	= document.getElementById('tungay_1').value;
		var tungay_2 	= document.getElementById('tungay_2').value;
		var tungay_3 	= document.getElementById('tungay_3').value;
		
		var denngay_1 	= document.getElementById('denngay_1').value;
		var denngay_2 	= document.getElementById('denngay_2').value;
		var denngay_3 	= document.getElementById('denngay_3').value;

		var department_fil 	= document.getElementById('department_fil').value;
        var tinhtrang_fil 	= document.getElementById('tinhtrang_fil').value;
		
		var tungay = tungay_3+'-'+tungay_2+'-'+tungay_1;
		var denngay = denngay_3+'-'+denngay_2+'-'+denngay_1;
				
		if (tungay == "" && denngay == ""){
			return false;
		}
		
		if(exptype==3){
			document.getElementById('div_dthdban_report').style.display='block';
			$.post('?expHdbandtReport&mod=hdban&exptype='+exptype,
				{
					tungay:tungay,
					denngay:denngay,
                    department_fil:department_fil,
                    tinhtrang_fil:tinhtrang_fil

				},
				function(data){
					$('#dthdban_report_content_main').html(data);
					$("#dthdban_report_content_main").show();
				}
			);
			
			$('#hdban_content_main').hide();
			$('#hdban_content_main').fadeOut('fast').load('index.php?listHdbandt&mod=hdban').fadeIn("fast");
			//$('#dthdban_report_content_main').load("?expHdbandtReport&mod=hdban&exptype="+exptype+"&tungay="+tungay+"&denngay="+denngay);
		}else{
			window.location="?expHdbandtReport&mod=hdban&exptype="+exptype+"&tungay="+tungay+"&denngay="+denngay;
		}
	}
	
	function edit_me_Hdbandt(id){
		$("#hdban_content_main").load("?listHdbandt&mod=hdban&edit_me=1&dthdban_id="+id);
	}
		
	$("#a_ref_Hdbandt").click( function () { 
			$('#hdban_content_main').hide();
			$('#hdban_content_main').fadeOut('fast').load('index.php?listHdbandt&mod=hdban').fadeIn("fast");
		});
</script>
{/literal}
