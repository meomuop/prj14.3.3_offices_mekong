{literal}
    <style type="text/css">
        .error { color:#FF0000;font-weight:bold; }
        .msg{ color:#00F; font-weight:bold; margin-left:5px; height:20px; line-height:20px}
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
<form enctype="multipart/form-data" action="?editConfig{$vars.arg}" method="post" name="frEdit" id="frEdit">
    <div id="config_content_insign">
        <fieldset style="width:98%; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
            <legend class="legend">Chỉnh sửa</legend>
            <h4 class="msg">Thông báo:
                <span id="lblMessage" class="msg">Cập nhật đã thành công!</span>
                <span id="lblError" class="error">Mời bạn nhập đủ dữ liệu!</span>
            </h4>
            <table width="98%" cellspacing="0" cellpadding="0" border="0" style="margin-left:5px">
                <tr height="10"><td></td></tr>
                <tr height="30">
                    <td align="left">Lương cơ bản:</td>
                    <td align="left">
                        <input type="text" id="luong_coban" name="luong_coban" class="text_short" value="{$vars.luong_coban|price_format}" style="text-align: right"/>&nbsp;(VNĐ)</td>
                </tr>
                <tr height="30">
                    <td align="left">Thử bảy:</td>
                    <td align="left">
                        <input type="radio" name="sat_ra" id="sat_ra" value="0" {if $vars.sat_ra eq 0} checked{/if}>
                        &nbsp;Làm cả ngày&nbsp;&nbsp;
                        <input type="radio" name="sat_ra" id="sat_ra" value="1" {if $vars.sat_ra eq 1} checked{/if}>
                        &nbsp;Làm nửa ngày&nbsp;&nbsp;
                        <input type="radio" name="sat_ra" id="sat_ra" value="2" {if $vars.sat_ra eq 2} checked{/if}>
                        &nbsp;Nghỉ
                    </td>
                </tr>
                <tr height="30">
                    <td>&nbsp;</td>
                    <td align="left">
                        <input type="button" name="editAct" id="editAct" value="Ghi lại" class="button" />
                        <input type="hidden" name="arg" value="{$vars.arg}"/>
                        <input type="hidden" name="config_id" id="config_id" value="{$vars.config_id}">
                        <input type="reset" name="Reset" value="Hủy bỏ" class="button" />
                        {literal}
                            <script language="javascript">
                                $(function() {
                                    $('.error').hide();
                                    $('#lblMessage').hide();

                                    $("#editAct").click(function() {
                                        $('.error').hide();

                                        var $form = $("#frEdit");
                                        var luong_coban = $form.find('input#luong_coban').val();
                                        var sat_ra = $form.find('input#sat_ra:checked').val();
                                        var config_id = $form.find('input#config_id').val();

                                        //begin validate form
                                        if (owner_name == "" || owner_url == ""){
                                            $('#lblError').show();
                                        }
                                        else{
                                            var dataString = "&luong_coban=" + luong_coban;
                                            dataString += "&sat_ra=" + sat_ra;
                                            dataString += "&config_id=" + config_id +"";
                                            //alert (dataString);return false;
                                            $.ajax({
                                                type: "POST",
                                                url: "index.php?editConfig&mod=config",
                                                data: dataString,
                                                success: function(data) {
                                                    $('#lblMessage').show();
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
    </div>
    <!-- Tool bar -->
    <div id="config_clear_txt"></div>
    <div id="config_tool_bar">
        &nbsp;
    </div>
</form>
