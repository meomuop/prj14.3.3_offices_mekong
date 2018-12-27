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

            $('#hdmua_tl_huybo').priceFormat({
                centsSeparator: '.',
                thousandsSeparator: '.'
            });
        });
    </script>
{/literal}
<div id="hdmua_content_insign">
	<form method="post" name="frmList_Hdmua" action="?listHdmua{$vars.arg}" id="frmList_Hdmua">
    <!------------------------------------------THEM MOI------------------------------------>
    <fieldset style="width:1012px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
        <legend class="legend_list_search" style="width: 600px">
            Thêm/Chỉnh sửa&nbsp;|&nbsp;Thông báo:&nbsp;
            <span id="mess_doc" class="msg">{$error}{$complete}</span>
            <span id="lblError_Hdmua" class="error">(*) là các mục bắt buộc!</span>
        </legend>
    	<table width="98%" cellspacing="0" cellpadding="0" border="0" style="margin-left:5px">
        	<tr height="10"><td colspan="2"></td></tr>
            <tr height="30">
            	<td align="center" width="30%" valign="top">
                    <div style="float:left; width:30%; line-height:25px; text-align:left">Số hợp đồng <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left">
                        <input type="text" id="hdmua_sohd" name="hdmua_sohd" class="text_short" value="{$obj_info.hdmua_sohd}" tabindex="1" onfocus="hide_message_Hdmua();"/>
                    </div>
                    <div style="float:left; width:30%; line-height:25px; text-align:left">Ngày ký <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left">
                        <input type="text" name="hdmua_ngayhd" id="hdmua_ngayhd" class="text_time_callender" value="{$obj_info.hdmua_ngayhd|date_format:'%d/%m/%Y'}" tabindex="2" onfocus="hide_message_Hdmua();"/>&nbsp;<img src="../images/admin/img.gif"  align="absmiddle" id="date_hdmua_ngayhd" style="cursor: pointer; border: 0" title="Chọn ngày trên lịch"/>
                        {literal}
                            <script type="text/javascript">
                                Calendar.setup({
                                    inputField   :   "hdmua_ngayhd",
                                    ifFormat     :   "%d/%m/%Y",
                                    button       :   "date_hdmua_ngayhd",
                                    align        :   "Br",
                                    timeFormat   :   "24",
                                    showsTime    :   true,
                                    singleClick  :   true
                                });
                            </script>
                        {/literal}
                    </div>
                    <div style="float:left; width:30%; line-height:25px; text-align:left">Ngày hiệu lực <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left">
                        <input type="text" name="hdmua_hieuluc" id="hdmua_hieuluc" class="text_time_callender" value="{$obj_info.hdmua_hieuluc|date_format:'%d/%m/%Y'}" tabindex="3" onfocus="hide_message_Hdmua();"/>&nbsp;<img src="../images/admin/img.gif"  align="absmiddle" id="date_hdmua_hieuluc" style="cursor: pointer; border: 0" title="Chọn ngày trên lịch"/>
                        {literal}
                            <script type="text/javascript">
                                Calendar.setup({
                                    inputField   :   "hdmua_hieuluc",
                                    ifFormat     :   "%d/%m/%Y",
                                    button       :   "date_hdmua_hieuluc",
                                    align        :   "Br",
                                    timeFormat   :   "24",
                                    showsTime    :   true,
                                    singleClick  :   true
                                });
                            </script>
                        {/literal}
                    </div>
                	<div style="float:left; width:30%; line-height:25px; text-align:left">Nhà cung cấp:</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left">
                        <select name="doitac_id" id="doitac_id" class="select_middle" tabindex="4">
                            <option value="0">Chọn đối tác</option>
                            {section name=qi loop=$obj_list_doitac}
                            <option value="{$obj_list_doitac[qi]->doitac_id}" {if $obj_list_doitac[qi]->doitac_id eq $obj_info.doitac_id}selected="selected"{/if}>-&nbsp;{$obj_list_doitac[qi]->doitac_name}</option>
                            {/section}
                        </select>
                    </div>
                    <div style="float:left; width:30%; line-height:25px; text-align:left" title="Thời gian thực hiện">TG thực hiện <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:20%; line-height:25px; text-align:left">
                    	<input type="text" value="{$obj_info.hdmua_tgth}" id="hdmua_tgth" name="hdmua_tgth" class="text_tiny" tabindex="5"/>
                    </div>
                    <div style="float:left; width:40%; line-height:25px; text-align:left">
                        <select name="hdmua_kieu_tgth" id="hdmua_kieu_tgth" class="select_short" tabindex="6">
                            <option value="1" {if $obj_info.hdmua_kieu_tgth eq 1}selected="selected"{/if}>-&nbsp;Ngày</option>
                            <option value="2" {if $obj_info.hdmua_kieu_tgth eq 2}selected="selected"{/if}>-&nbsp;Tháng</option>
                            <option value="3" {if $obj_info.hdmua_kieu_tgth eq 3}selected="selected"{/if}>-&nbsp;Năm</option>
                        </select>
                    </div>

                    <div style="float:left; width:30%; line-height:25px; text-align:left" title="Phòng/ban phụ trách">P/B phụ trách:</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left">
                        <select name="department_id" id="department_id" class="select_middle" tabindex="6">
                            <option value="0">Chọn phòng/ban</option>
                            {section name=qi loop=$obj_list_department}
                                <option value="{$obj_list_department[qi]->department_id}" {if $obj_list_department[qi]->department_id eq $obj_info.department_id}selected="selected"{/if}>{$obj_list_department[qi]->department_name}</option>
                            {/section}
                        </select>
                        {literal}
                        <script type="text/javascript">
                            $("#department_id").change(function(){
                                $("#div_hdmua_user_id").load('index.php?listUserSelect&mod=users&department_id='+$("#department_id").val());
                            });
                        </script>
                        {/literal}
                    </div>
                    <div style="float:left; width:30%; line-height:25px; text-align:left">Người theo dõi:</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left" id="div_hdmua_user_id">
                        <select name="user_id" id="user_id" class="select_middle" tabindex="7">
                            <option value="0">Chọn nhân viên</option>
                            {if $obj_info.user_id}
                                {section name=qi loop=$obj_list_user}
                                    {if $obj_list_user[qi]->user_id eq $obj_info.user_id}
                                        <option value="{$obj_list_user[qi]->user_id}" selected="selected">{$obj_list_user[qi]->user_fullname}</option>
                                    {/if}
                                {/section}
                            {/if}
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
                        <input type="text" value="{$obj_info.hdmua_giatri}" id="hdmua_giatri" name="hdmua_giatri" class="text_short text_number" tabindex="10"/>
                    </div>
                    <div style="float:left; width:40%; line-height:25px; text-align:left" title="Thanh toán hủy hợp đồng">Quy đổi (VND):</div>
                    <div style="float:left; width:60%; line-height:25px; text-align:left">
                        <input type="text" value="{$obj_info.hdmua_giatri_quydoi}" id="hdmua_giatri_quydoi" name="hdmua_giatri_quydoi" class="text_short text_number" tabindex="11"/>
                    </div>

                    <div style="float:left; width:40%; line-height:25px; text-align:left">GT thanh toán:</div>
                    <div style="float:left; width:60%; line-height:25px; text-align:left">
                        <input type="text" value="{$obj_info.hdmua_gttt}" id="hdmua_gttt" name="hdmua_gttt" class="text_short text_number" tabindex="12"/>
                    </div>
                    <div style="float:left; width:40%; line-height:25px; text-align:left">Quy đổi (VND):</div>
                    <div style="float:left; width:60%; line-height:25px; text-align:left">
                        <input type="text" value="{$obj_info.hdmua_gttt_quydoi}" id="hdmua_gttt_quydoi" name="hdmua_gttt_quydoi" class="text_short text_number" tabindex="13"/>
                    </div>
                    <div style="float:left; width:40%; line-height:25px; text-align:left">TT hủy HĐ (VND):</div>
                    <div style="float:left; width:60%; line-height:25px; text-align:left">
                        <input type="text" value="{$obj_info.hdmua_tl_huybo}" id="hdmua_tl_huybo" name="hdmua_tl_huybo" class="text_short text_number" tabindex="15"/>
                    </div>
                    <div style="float:left; width:100%; line-height:25px; text-align:left">
                        <input type="button" name="btnSub_Hdmua" id="btnSub_Hdmua" value="Ghi lại" class="button" tabindex="18"/>
                        <input type="hidden" name="hdmua_id" id="hdmua_id" value="{$obj_info.hdmua_id}">
                        <input type="hidden" name="hdmua_file" id="hdmua_file" value="{$obj_info.hdmua_file}">
                        <input type="reset" name="Reset" value="Hủy bỏ" class="button" tabindex="19"/>
                    </div>
                </td>

                <td align="center" valign="top">
                	<div style="float:left; width:15%; line-height:25px; text-align:left">Nội dung <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:85%; line-height:25px; text-align:left; height:50px">
                    	<textarea spellcheck="false" name="hdmua_noidung" id="hdmua_noidung" cols="30" rows="5" class="text_area_small" onfocus="hide_message_Hdmua()" tabindex="8">{$obj_info.hdmua_noidung}</textarea>
                    </div>

                    <div style="float:left; width:15%; line-height:25px; text-align:left" title="Điều khoản khác">ĐK khác:</div>
                    <div style="float:left; width:85%; line-height:25px; text-align:left; height:50px">
                        <textarea spellcheck="false" name="hdmua_dieukhoankhac" id="hdmua_dieukhoankhac" cols="30" rows="5" class="text_area_small" onfocus="hide_message_Hdmua()" tabindex="14">{$obj_info.hdmua_dieukhoankhac}</textarea>
                    </div>

                    <div style="float:left; width:15%; line-height:25px; text-align:left">Tình trạng <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:85%; line-height:25px; text-align:left">
                        <select name="hdmua_tinhtrang" id="hdmua_tinhtrang" class="select_middle" tabindex="17">
                            <option value="1" {if $obj_info.hdmua_tinhtrang eq 1}selected="selected"{/if}>-&nbsp;Hợp đồng mới</option>
                            <option value="2" {if $obj_info.hdmua_tinhtrang eq 2}selected="selected"{/if}>-&nbsp;Đang thực hiện</option>
                            <option value="3" {if $obj_info.hdmua_tinhtrang eq 3}selected="selected"{/if}>-&nbsp;Đã hoàn thành</option>
                            <option value="4" {if $obj_info.hdmua_tinhtrang eq 4}selected="selected"{/if}>-&nbsp;Đã hủy</option>
                        </select>
                    </div>

                    <div style="float:left; width:15%; line-height:25px; text-align:left" title="Lý do hủy hợp đồng">Lý do hủy:</div>
                    <div style="float:left; width:85%; line-height:25px; text-align:left">
                        <input type="text" value="{$obj_info.hdmua_lydo_huybo}" id="hdmua_lydo_huybo" name="hdmua_lydo_huybo" class="text_long" tabindex="16"/>
                    </div>

                    <div style="float:left; width:30%; line-height:25px; text-align:left">
                        &nbsp;<b>(Người nhập: {$access_user_name})</b>
                    </div>
                </td>
                {literal}
                    <script language="javascript">
                        function hide_message_Hdmua(){
                            $('#lblMessage_Hdmua').hide();
                            $('#lblError_Hdmua').hide();
                            $('#mess_doc').hide();
                        }

                        $(function() {
                            $('.error').hide();
                            $('#lblMessage_Hdmua').hide();

                            $("#btnSub_Hdmua").click(function() {

                                $('.error').hide();

                                var $form = $("#frmList_Hdmua");

                                var hdmua_sohd = $form.find('input#hdmua_sohd').val();
                                var hdmua_ngayhd = $form.find('input#hdmua_ngayhd').val();
                                var hdmua_hieuluc = $form.find('input#hdmua_hieuluc').val();
                                var hdmua_noidung = $form.find('textarea#hdmua_noidung').val();
                                var hdmua_tgth = $form.find('input#hdmua_tgth').val();
                                var hdmua_kieu_tgth = $form.find('input#hdmua_kieu_tgth').val();
                                var hdmua_giatri = $form.find('input#hdmua_giatri').val();
                                var hdmua_giatri_quydoi = $form.find('input#hdmua_giatri_quydoi').val();
                                var hdmua_gttt = $form.find('input#hdmua_gttt').val();
                                var hdmua_gttt_quydoi = $form.find('input#hdmua_gttt_quydoi').val();
                                var hdmua_tl_huybo = $form.find('input#hdmua_tl_huybo').val();
                                var hdmua_lydo_huybo = $form.find('input#hdmua_lydo_huybo').val();
                                var hdmua_dieukhoankhac = $form.find('textarea#hdmua_dieukhoankhac').val();
                                var doitac_id = $form.find('select#doitac_id :selected').val();
                                var department_id = $form.find('select#department_id :selected').val();
                                var phongban_name = $form.find('select#department_id :selected').text();
                                var dvtiente_id = $form.find('select#dvtiente_id :selected').val();
                                var hdmua_tinhtrang = $form.find('select#hdmua_tinhtrang :selected').val();
                                var user_id = $form.find('select#user_id :selected').val();
                                var nguoi_theodoi = $form.find('select#user_id :selected').text();
                                var hdmua_id = $form.find('input#hdmua_id').val();
                                var hdmua_nguoinhap = $form.find('input#hdmua_nguoinhap').val();
                                var hdmua_file = $form.find('input#hdmua_file').val();


                                //begin validate form
                                if (hdmua_sohd == "" || hdmua_ngayhd == "" || hdmua_noidung == "" || hdmua_giatri_quydoi == "" || hdmua_gttt_quydoi == "" || doitac_id == "" ){
                                    $('#lblError_Hdmua').show();
                                }
                                else{
                                    $.post('index.php?listHdmua&mod=hdmua&add_edit=1',
                                        {
                                            hdmua_sohd:hdmua_sohd,
                                            hdmua_ngayhd:hdmua_ngayhd,
                                            hdmua_hieuluc:hdmua_hieuluc,
                                            hdmua_noidung:hdmua_noidung,
                                            hdmua_tgth:hdmua_tgth,
                                            hdmua_kieu_tgth:hdmua_kieu_tgth,
                                            hdmua_giatri:hdmua_giatri,
                                            hdmua_giatri_quydoi:hdmua_giatri_quydoi,
                                            hdmua_gttt:hdmua_gttt,
                                            hdmua_gttt_quydoi:hdmua_gttt_quydoi,
                                            hdmua_tl_huybo:hdmua_tl_huybo,
                                            hdmua_lydo_huybo:hdmua_lydo_huybo,
                                            hdmua_dieukhoankhac:hdmua_dieukhoankhac,
                                            doitac_id:doitac_id,
                                            department_id:department_id,
                                            phongban_name:phongban_name,
                                            dvtiente_id:dvtiente_id,
                                            hdmua_tinhtrang:hdmua_tinhtrang,
                                            user_id:user_id,
                                            nguoi_theodoi:nguoi_theodoi,
                                            hdmua_id:hdmua_id,
                                            hdmua_nguoinhap:hdmua_nguoinhap,
                                            hdmua_file:hdmua_file,
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
    <fieldset style="width:1012px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:247px">
        <legend class="legend_list" style="width:885px">
            <div style="width:130px; float:left">Danh sách: {$total_num_result}</div>
            <div style="width:70px; float:left">&nbsp;|&nbsp;Tìm kiếm:&nbsp;</div>
            <div style="width:380px; float:left; font-weight:normal">
                <div style="float:left">
                    <div style="float:left; width:60px">- Trích yếu: </div>
                    <div style="float:left; width:300px">
                    <input type="text" id="hdmua_noidung_fs" name="hdmua_noidung_fs" class="text_seek_long" value="{$vars.hdmua_noidung_fs}"/>
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
                <input type="text" id="hdmua_code_fs" name="hdmua_code_fs" class="text_seek_tiny" value="{$vars.hdmua_code_fs}" />
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
                <input type="button" name="btnSeek" id="btnSeek" value="Tìm >>" class="button_seek" onclick="search_me_Hdmua()" />
            </div>
            <!-----------------------------------------KET XUAT--------------------------------------->
            <div style="width:80px; float:left">&nbsp;|&nbsp;Kết xuất:&nbsp;</div>
            <a href="javascript: void(0);" onClick="show_hide_filter()" style="text-decoration:none">
            <div style="float:left; margin-left:10px; width:78px">Lọc dữ liệu</div></a>
            <div style="width:92px; float:left; height:20px; margin-top:1px">
                <a href="javascript: void(0);" onClick="export_hdmua(1)" style="text-decoration:none; color:#F00">
                <div style="float:left; margin-left:5px; width:26px">
                <img src="../images/admin/word_icon.png" class="img_all" height="20" title="Kết xuất MS Word"></div>
                </a>
                <a href="javascript: void(0);" onClick="export_hdmua(2)" style="text-decoration:none; color:#F00">
                <div style="float:left; margin-left:5px; width:26px">
                <img src="../images/admin/excel_icon.png" class="img_all" height="20" title="Kết xuất MS Excel"></div>
                </a>
                <a href="javascript: void(0);" onClick="export_hdmua(3)" style="text-decoration:none; color:#F00">
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
            <div class="tbl_tit" style="width:70px"><B>&nbsp;Ngày ký</B></div>
            <div class="tbl_tit" style="width:301px"><B>&nbsp;Nội dung</B></div>
            <div class="tbl_tit" style="width:160px"><B>&nbsp;Nhà cung cấp</B></div>
            <div class="tbl_tit" style="width:110px"><B>&nbsp;Tình trạng</B></div>
            <div class="tbl_tit" style="width:70px"><B>&nbsp;Ngày nhập</B></div>
            <div class="tbl_tit" style="width:40px; text-align:center"><B>File</B></div>
            <div class="tbl_tit" style="width:59px; text-align:center"><B>Chọn</B></div>
            <div class="tbl_tit" style="width:30px; text-align:center">
            <input type="hidden" name="chon" id="chon_Hdmua">
            <input type="checkbox" name="chkall" value="0" onclick="docheck_Hdmua(document.frmList_Hdmua.chkall.checked,0);">
            </div>
        </div>
        <div style="float:left; width:20px; text-align:right">
        <input type="button" name="del_Items" id='del_Items' value="&nbsp;" onClick="delItems_Hdmua('{$processurl}');" style="width:17px; font-size:12px; background:url(../images/admin/b_drop.png); cursor:pointer" title="Xóa lựa chọn">
        </div>
        <div style="float:left; height:190px; width:1012px; overflow-y:scroll">
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
                    &nbsp;{$obj_list[pi]->hdmua_sohd}&nbsp;
                </div>
                <div class="{$class_td}" style="width:70px">
                    &nbsp;{$obj_list[pi]->hdmua_ngayhd|date_format:"%d/%m/%Y"}
                </div>
                <div class="{$class_td}" style="width:301px" title="{$obj_list[pi]->hdmua_noidung}">
                	{math a=$smarty.section.pi.index b=1 equation="a+b" assign=count}
                    <div style="float:left; width:274px; white-space:nowrap">&nbsp;<a href="javascript: void(0);" onclick="edit_me_Hdmua({$obj_list[pi]->hdmua_id})" >{$obj_list[pi]->hdmua_noidung|str_string_cut:"63":"1"}</a></div>
                    <div style="float:right; margin:2px; border:1px solid #8ea4c1; height:18px; width:16px; text-align:center; background-color:#dfe8f6" title="Chức năng mở rộng">
                    {if $user_level eq 9 or $user_level eq 1}<a href='javascript: void(0);' onclick="show_list_options({$count},{$total_num_result})">
                    <img src="{$css_path}extra_icon.png" width="14" height="14" border="0" class="img_all"></a>{/if}
                    </div>
                    <div id="extra_{$count}" style="position:absolute; display:none; height:auto; width:140px; margin:2px 141px; border:1px solid #8ea4c1; border-right:1px solid #8ea4c1; background-color:#dfe8f6">
                        <div style="float:left; width:140px; height:18px; border-right:1px solid #dfe8f6"><b>&nbsp;Chọn thao tác:</b></div>
                        <div style="float:left; width:140px; padding:0 0 0 3px">
                            - <a href="javascript: void(0)" onclick="javascript: show_hdmua_chungtu({$obj_list[pi]->hdmua_id})">Quản lý chứng từ</a>
                        </div>
                        <div style="float:left; width:140px; padding:0 0 0 3px">
                             - <a href="javascript: void(0)" onclick="javascript: show_hdmua_vanban({$obj_list[pi]->hdmua_id})">Liên kết văn bản</a>
                        </div>
                        <div style="float:left; width:140px; padding:0 0 0 3px">
                            - <a href="javascript: void(0)" onclick="javascript: show_hdmua_tientrinh({$obj_list[pi]->hdmua_id})">Tiến trình thực hiện</a>
                        </div>
                        <div style="float:left; width:140px; padding:0 0 0 3px">
                            - <a href="javascript: void(0)" onclick="javascript: show_hdmua_thongtin({$obj_list[pi]->hdmua_id})">Thông tin hợp đồng</a>
                        </div>
                    </div>
                </div>
                <div class="{$class_td}" style="width:160px; white-space:nowrap" title="{$obj_list[pi]->doitac_viettat}">
                    &nbsp;{$obj_list[pi]->doitac_viettat|str_string_cut:"25":"1"}
                </div>
                <div class="{$class_td}" style="width:110px">
                    &nbsp;{if $obj_list[pi]->hdmua_tinhtrang eq 1}
                        Hợp đồng mới
                     {elseif $obj_list[pi]->hdmua_tinhtrang eq 2}
                        Đang thực hiện
                     {elseif $obj_list[pi]->hdmua_tinhtrang eq 3}
                        Đã hoàn thành
                     {else}
                        Đã hủy
                     {/if}
                </div>
                <div class="{$class_td}" style="width:70px">
                    &nbsp;{$obj_list[pi]->hdmua_date|date_format:"%d/%m/%Y"}
                </div>

                <div class="{$class_td}" style="width:40px; text-align:center">
                    {if $obj_list[pi]->hdmua_file eq 2}
                    <a href='javascript: void(0);' onclick="show_list_file({$obj_list[pi]->hdmua_id})">
                    <img src="../images/admin/empty_icon.png" width="14" height="14" border="0"></a>
                    {else}
                    <a href='javascript: void(0);' onclick="show_list_file({$obj_list[pi]->hdmua_id})">
                    <img src="../images/admin/folder_icon.png" width="14" height="14" border="0"></a>
                    {/if}
                </div>
                <div class="{$class_td}" style="width:29px; text-align:center">
                    <a href='javascript: void(0);' onclick="edit_me_Hdmua({$obj_list[pi]->hdmua_id})">
                    <img src="../images/admin/b_edit.png" width="11" height="11" border="0" title="Sửa"></a>
                </div>
                <div class="{$class_td}" style="width:29px; text-align:center">
                    <a href='javascript: void(0)' onClick="delItems_Hdmua('{$processurl}', {$obj_list[pi]->hdmua_id});">
                    <img src="../images/admin/b_drop.png" width="11" height="11" border="0" title="Xóa"></a>
                </div>
                <div class="{$class_td}" style="width:30px; text-align:center">
                    <input type="checkbox" name="chkid" value="{$obj_list[pi]->hdmua_id}" onclick="docheckone_Hdmua();">
                </div>
            </div>
            {/section}
        </div>
        <input type="hidden" id="curpage_Hdmua" name="curpage" value="{$vars.curpage}" />
        <input type="hidden" name="arg" id="arg" value="{$vars.arg}">
        <input type="hidden" name="arg_doc" id="arg_doc" value="{$vars.arg_doc}">
    </fieldset>
    </form>
</div>
<!------------------------------------------------- Tool bar --------------------------------------------->
<div id="hdmua_clear_txt"></div>
<div id="hdmua_tool_bar">

    <div id="hdmua_search_area">
    <select name="order" id = "order_Hdmua" style="width:120px; font-size:12px; border:1px solid #99bbe8; margin-left:1px" onchange="reloadPage_Hdmua('{$processurl}');">
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
    <a href="javascript: void(0)" id="first_page" onclick="gotoPage_Hdmua('{$processurl}',parseInt(1));" title="Trang đầu">
    	<img src="{$css_path}icon_first_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="pre_page" onclick="gotoPage_Hdmua('{$processurl}',parseInt(document.getElementById('page_Hdmua').value)-parseInt(1));" title="Trang trước">
    	<img src="{$css_path}icon_pre_page.png" class="img_all">
    </a>
    {/if}
    </div>
    <div style="float:left; line-height:19px">
        <div style="float:left; width:35px">Trang</div> 
        <div style="float:left; width:35px">
        <input type="text" value="{$vars.curpage}" name="page" id="page_Hdmua" onblur=" gotoPage_Hdmua('{$processurl}',this.value);" style="width:30px; font-size:12px; height:15px; border:1px solid #99bbe8">
        </div>
        <div style="float:left; width:42px"> / {$num_page}</div>
    </div>
    <div id="hdmua_page_area">
    {if $vars.curpage eq $num_page}
    	<img src="{$css_path}icon_next_page.png" class="img_all">
        <img src="{$css_path}icon_last_page.png" class="img_all">
    {else}
    <a href="javascript: void(0)" id="next_page" onclick="gotoPage_Hdmua('{$processurl}',parseInt(document.getElementById('page_Hdmua').value)+parseInt(1));" title="Trang tiếp">
    	<img src="{$css_path}icon_next_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="last_page" onclick="gotoPage_Hdmua('{$processurl}',parseInt({$num_page}));" title="Trang cuối">
    	<img src="{$css_path}icon_last_page.png" class="img_all">
    </a>
    {/if}
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:left; width:15px">
    <a href="javascript: void(0)" id="a_ref_Hdmua" title="Tải lại"><img src="{$css_path}icon_refresh.png" class="img_all"></a>
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:right; line-height:19px; margin-right:2px">
        <div style="float:left; width:40px">Xem</div>
        <div style="float:left; width:52px">
            <select name="numresult" id="numresult_Hdmua" style="width:50px; font-size:12px; border:1px solid #99bbe8" onchange="reloadPage_Hdmua('{$processurl}');">
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
	
	function docheck_Hdmua(status,from_){
		var alen=document.frmList_Hdmua.elements.length;
		alen=(alen>5)?document.frmList_Hdmua.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
			document.frmList_Hdmua.chkid[i].checked=status;
		}
		else{
			document.frmList_Hdmua.chkid.checked=status;
		}
		if(from_>0) document.frmList_Hdmua.chkall.checked=status;
	}
		
	function docheckone_Hdmua(){
		var alen=document.frmList_Hdmua.elements.length;
		var isChecked=true;
		alen=(alen>4)?document.frmList_Hdmua.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_Hdmua.chkid[i].checked==false)
					isChecked=false;
		}else{
			if(document.frmList_Hdmua.chkid.checked==false)
				isChecked=false;
		}				
		document.frmList_Hdmua.chkall.checked=isChecked;
	}
	
	function calculatechon_Hdmua(){			
		var strchon="";
		var alen=document.frmList_Hdmua.elements.length;				
		alen=(alen>2)?document.frmList_Hdmua.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_Hdmua.chkid[i].checked==true)
					strchon+=document.frmList_Hdmua.chkid[i].value+",";
		}else{
			if(document.frmList_Hdmua.chkid.checked==true)
				strchon=document.frmList_Hdmua.chkid.value;
		}
		document.frmList_Hdmua.chon_Hdmua.value=strchon;
	}
	
	function delItems_Hdmua(processurl,delStr){
		if (delStr == undefined){
			calculatechon_Hdmua();
			delStr = document.getElementById("chon_Hdmua").value;
		}
		if (delStr == ""){
			return false;
		}
		if(!confirm("THÔNG BÁO: \n\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
			return false;
		}	
		
		var numresult_Hdmua,order_Hdmua,curpage_Hdmua;
		numresult = $("#numresult_Hdmua").val();
		order = $("#order_Hdmua").val();
		curpage = $("#curpage_Hdmua").val();
		
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
	
	function reloadPage_Hdmua(processurl){
		var numresult_Hdmua,order_Hdmua,cur_pos;
		numresult = $("#numresult_Hdmua").val();
		order = $("#order_Hdmua").val();
		cur_pos = 0;
		$("#hdmua_content_main").load(processurl+"&numresult="+numresult+"&order="+order+"&cur_pos="+cur_pos);
	}
	
	function show_list_file_hdmua(hdmua_id){
		var arg_doc = document.getElementById('arg_doc').value;
		document.getElementById('list_file').style.display='block';
		$("#list_file_cont").load("?listHdmuaFile&mod=hdmua"+arg_doc+"&hdmua_id="+hdmua_id);
	}

	function show_list_reply(user_id,hdmua_id){
		document.getElementById('list_reply').style.display='block';
		var arg = document.getElementById('arg').value;
		$("#list_reply_cont").load("?listHdmuaReply"+arg+"&hdmua_id="+hdmua_id+"&user_id="+user_id);
	}
	
	function show_hdmua_chungtu(hdmua_id){
        change_style_hdmua(2);
        document.getElementById('hdmua_content_main').style.display='block';
		//var arg = document.getElementById('arg').value;
		$("#hdmua_content_main").load("?listHdmuaHoadon&mod=hdmua&hdmua_id="+hdmua_id);
	}

    function show_hdmua_vanban(hdmua_id){
        document.getElementById('div_hdmua_lkvb').style.display='block';
        $("#list_hdmua_lkvb_cont").load("?listHdmuaLkvb&mod=hdmua&hdmua_id="+hdmua_id);
    }

    function show_hdmua_tientrinh(hdmua_id){
        document.getElementById('div_thuchien').style.display='block';
        $("#list_thuchien_cont").load("?listHdmuaTientrinh&mod=hdmua&hdmua_id="+hdmua_id);
    }

	function show_hdmua_thongtin(hdmua_id){
		document.getElementById('div_view_hdmua').style.display='block';
		$("#list_view_hdmua_cont").load("?viewHdmua&mod=hdmua&hdmua_id="+hdmua_id);
	}
		
	function gotoPage_Hdmua(processurl,page){
		var numresult_Hdmua,order_Hdmua,cur_pos;
		numresult = $("#numresult_Hdmua").val();
		order = $("#order_Hdmua").val();
		//alert(processurl+'-'+page+'-'+numresult+'-'+order);
		$("#hdmua_content_main").load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+page);
	}
	
	function search_me_Hdmua(){
		var hdmua_noidung_fs 	= document.getElementById('hdmua_noidung_fs').value;
		var hdmua_code_fs 	= document.getElementById('hdmua_code_fs').value;
		var hdmua_num_fs 		= document.getElementById('hdmua_num_fs').value;
		var hdmua_tgth_fs 	= document.getElementById('hdmua_tgth_fs').value;
		var docCat_id_fs 	= document.getElementById('docCat_id_fs').value;
		
		if (hdmua_noidung_fs == "" && hdmua_code_fs == "" && hdmua_num_fs == "" && hdmua_tgth_fs == "" && docCat_id_fs == ""){
			return false;
		}
		
		$.post('?listHdmua&mod=hdmua&search_me=1',
			{
				hdmua_noidung_fs:hdmua_noidung_fs,
				hdmua_code_fs:hdmua_code_fs,
				hdmua_num_fs:hdmua_num_fs,
				hdmua_tgth_fs:hdmua_tgth_fs,
				docCat_id_fs:docCat_id_fs
			},
			function(data){
				$('#hdmua_content_main').html(data);
				$("#hdmua_content_main").show();
			}
		);
	}
	
	// ----- ket xuat
	function export_hdmua(exptype){
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
			document.getElementById('div_hdmua_report').style.display='block';
			$.post('?expHdmuaReport&mod=hdmua&exptype='+exptype,
				{
					tungay:tungay,
					denngay:denngay,
                    department_fil:department_fil,
                    tinhtrang_fil:tinhtrang_fil

				},
				function(data){
					$('#hdmua_report_content_main').html(data);
					$("#hdmua_report_content_main").show();
				}
			);
			
			$('#hdmua_content_main').hide();
			$('#hdmua_content_main').fadeOut('fast').load('index.php?listHdmua&mod=hdmua').fadeIn("fast");
			//$('#hdmua_report_content_main').load("?expHdmuaReport&mod=hdmua&exptype="+exptype+"&tungay="+tungay+"&denngay="+denngay);
		}else{
			window.location="?expHdmuaReport&mod=hdmua&exptype="+exptype+"&tungay="+tungay+"&denngay="+denngay;
		}
	}
	
	function edit_me_Hdmua(id){
		$("#hdmua_content_main").load("?listHdmua&mod=hdmua&edit_me=1&hdmua_id="+id);
	}
		
	$("#a_ref_Hdmua").click( function () { 
			$('#hdmua_content_main').hide();
			$('#hdmua_content_main').fadeOut('fast').load('index.php?listHdmua&mod=hdmua').fadeIn("fast");
		});
</script>
{/literal}
