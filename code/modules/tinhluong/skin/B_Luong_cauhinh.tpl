{literal}
    <style type="text/css">
        .error { color:#FF0000;font-weight:bold; }
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

            $('.luong_coban').priceFormat({
                centsSeparator: '.',
                thousandsSeparator: '.'
            });
        });
    </script>
{/literal}
<form action="?cauhinhLuong{$vars.arg}" method="post" name="frCauhinhLuong" id="frCauhinhLuong">
    <div id="cauhinhluong_content_insign">
        <fieldset style="width:100%; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
            <legend class="legend">Cấu hình lương</legend>
            <h4 class="msg">Thông báo:
                <span id="lblMessage_Cauhinhluong" class="msg">Cập nhật đã thành công!</span>
                <span id="lblError_Cauhinhluong" class="error">Mời bạn nhập đủ dữ liệu!</span>
            </h4>
            <table width="98%" cellspacing="0" cellpadding="0" border="0" style="margin-left:5px">
                <tr height="10"><td></td></tr>
                <tr height="30">
                    <td align="left" width="30%">Lương cơ bản:</td>
                    <td align="left">
                        <input type="text" id="luong_coban" name="luong_coban" class="text_short" value="{$vars.luong_coban|price_format}" style="text-align: right"/>&nbsp;(VNĐ)</td>
                </tr>
                <tr height="30">
                    <td>&nbsp;</td>
                    <td align="left">
                        <input type="button" name="cauhinhLuong_btn" id="cauhinhLuong_btn" value="Ghi lại" class="button" />
                        <input type="hidden" name="arg" value="{$vars.arg}"/>
                        <input type="hidden" name="config_id" id="config_id" value="{$vars.config_id}">
                        <input type="reset" name="Reset" value="Hủy bỏ" class="button" />
                        {literal}
                            <script language="javascript">
                                $(function() {
                                    $('.error').hide();
                                    $('#lblMessage_Cauhinhluong').hide();

                                    $("#cauhinhLuong_btn").click(function() {
                                        $('.error').hide();

                                        var $form = $("#frCauhinhLuong");
                                        var luong_coban = $form.find('input#luong_coban').val();
                                        var config_id = $form.find('input#config_id').val();

                                        //begin validate form
                                        if (luong_coban == ""){
                                            $('#lblError_Cauhinhluong').show();
                                        }
                                        else{
                                            var dataString = "&luong_coban=" + luong_coban;
                                            dataString += "&config_id=" + config_id +"";
                                            //alert (dataString);return false;
                                            $.ajax({
                                                type: "POST",
                                                url: "index.php?cauhinhLuong&mod=tinhluong",
                                                data: dataString,
                                                success: function(data) {
                                                    $('#lblMessage_Cauhinhluong').show();
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
                <tr>
                    <td id="div_to_show"></td>
                </tr>
            </table>
        </fieldset>
    </div>
</form>
<form action="?cauhinhLuong{$vars.arg}" method="post" name="frLuongNhanvien" id="frLuongNhanvien">
    <div id="luongnhanvien_content_insign">
        <fieldset style="width:100%; border:1px solid #99bbe8; margin-top:5px">
            <legend class="legend_list">
                <div style="float:left; width: 250px">Xác định lương cán bộ / công - nhân viên</div>
                <div style="float:left;">
                    <input type="button" name="luongNhanvien_btn" id="luongNhanvien_btn" value="Ghi lại" class="button_red" />
                </div>
            </legend>
            <div style="float:left; height:5px; width:100%"></div>
            <div style="float:left; width:802px; border-top:1px solid #99bbe8; border-bottom:1px solid #99bbe8 ">
                <div class="tbl_tit" style="width:30px; text-align:center;"><b>STT</b></div>
                <div class="tbl_tit" style="width:150px;"><B>&nbsp;Họ tên</B></div>
                <div class="tbl_tit" style="width:90px;"><B>&nbsp;Mã NV</B></div>
                <div class="tbl_tit" style="width:156px;"><B>&nbsp;Chức vụ</B></div>
                <div class="tbl_tit" style="width:185px;"><B>&nbsp;Mức lương</B></div>
                <div class="tbl_tit" style="width:185px;"><B>&nbsp;Phụ cấp</B></div>
            </div>
            <div style="float:left; height:303px; width:820px; overflow-y:scroll">
                {section name=pi loop=$obj_list_user}
                    {if $smarty.section.pi.index is not div by 2}
                        {assign var="class_td" value="tbl_cont"}
                    {else}
                        {assign var="class_td" value="tbl_cont2"}
                    {/if}
                    {math z=$smarty.section.pi.index t=1 equation="z+t" assign=stt}
                    <div class="{$class_td}" style="width:30px; text-align:center;">{$stt}</div>
                    <div class="{$class_td}" style="width:150px; white-space:nowrap; ">&nbsp;{$obj_list_user[pi]->user_fullname}</div>
                    <div class="{$class_td}" style="width:90px; white-space:nowrap; ">&nbsp;{$obj_list_user[pi]->user_name}</div>
                    <div class="{$class_td}" style="width:156px; white-space:nowrap; ">&nbsp;
                        {section name=qi loop=$obj_list_object}
                            {if $obj_list_object[qi]->object_id eq $obj_list_user[pi]->object_id}
                                {$obj_list_object[qi]->object_name}
                            {/if}
                        {/section}
                    </div>
                    <div class="{$class_td}" style="width:185px; white-space:nowrap; ">&nbsp;
                        <input type="hidden" name="user_id[{$stt}]" id="user_id" value="{$obj_list_user[pi]->user_id}">
                        <select name="user_mucluong[{$stt}]" id="user_mucluong" class="select_middle">
                            {section name=qi loop=$obj_list_tldn}
                                <option value="{$obj_list_tldn[qi]->tldn_id}" {if $obj_list_tldn[qi]->tldn_id eq $obj_list_user[pi]->user_mucluong}selected="selected"{/if}>-&nbsp;{$obj_list_tldn[qi]->tldn_ten}</option>
                            {/section}
                        </select>
                    </div>
                    <div class="{$class_td}" style="width:185px; white-space:nowrap; ">&nbsp;
                        <select name="user_phucap[{$stt}]" id="user_phucap" class="select_middle">
                            {section name=qi loop=$obj_list_phucap}
                                <option value="{$obj_list_phucap[qi]->phucap_id}" {if $obj_list_phucap[qi]->phucap_id eq $obj_list_user[pi]->user_phucap}selected="selected"{/if}>-&nbsp;{$obj_list_phucap[qi]->phucap_ten}</option>
                            {/section}
                        </select>
                    </div>
                {/section}
            </div>
            {literal}
                <script language="javascript">
                    $(function() {
                        $("#luongNhanvien_btn").click(function() {
                            $('.error').hide();

                            var $form = $("#frLuongNhanvien");
                            var strData = $("#frLuongNhanvien").serialize();
                            $.ajax({
                                type: "POST",
                                url: "index.php?cauhinhLuong&mod=tinhluong&act=2",
                                data: strData,
                                success: function(data) {
                                    $('#div_thanhcong').css({'display':'block','z-index':'2010'})
                                    tat_thongbao();diemnguoc(2);
                                }
                            });
                            return false;
                            //end form
                        });
                    });
                </script>
            {/literal}
        </fieldset>
    </div>
</form>
