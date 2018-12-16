<?php /* Smarty version 2.6.2, created on 2018-12-16 10:32:42
         compiled from E:%5CProjects%5Cwamp64%5Cwww%5Csmarty%5Cprj14.3.3_offices_mekong%5Ccode%5Cmodules%5Cvttbs/skin/B_Replace_tbl.tpl */ ?>
<?php require_once(SMARTY_DIR . 'core' . DIRECTORY_SEPARATOR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'str_string_cut', 'E:\Projects\wamp64\www\smarty\prj14.3.3_offices_mekong\code\modules\vttbs/skin/B_Replace_tbl.tpl', 163, false),array('modifier', 'date_format', 'E:\Projects\wamp64\www\smarty\prj14.3.3_offices_mekong\code\modules\vttbs/skin/B_Replace_tbl.tpl', 198, false),array('function', 'math', 'E:\Projects\wamp64\www\smarty\prj14.3.3_offices_mekong\code\modules\vttbs/skin/B_Replace_tbl.tpl', 307, false),)), $this); ?>
<?php echo '
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
			//prefix: \'VNĐ \',
			centsSeparator: \'.\', 
			thousandsSeparator: \',\',
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

			// skip everything that isn\'t a number
			// and also skip the left zeroes
			function to_numbers (str) {
				var formatted = \'\';
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
				while (str.length<(centsLimit+1)) str = \'0\'+str;
				return str;
			}

			// format as price
			function price_format (str) {

				// formatting settings
				var formatted = fill_with_zeroes(to_numbers(str));
				var thousandsFormatted = \'\';
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
			$(this).bind(\'keydown\', key_check);
			$(this).bind(\'keyup\', price_it);
			if ($(this).val().length>0) price_it();
	
		});
	
	}; 		
	
})(jQuery);

$(function(){
	$(\'#vttb_replace_cost\').priceFormat({		
		centsSeparator: \'.\',
		thousandsSeparator: \'.\'
	});
});
</script>
'; ?>

<div id="list_replace_content_insign">
	<form method="post" name="frmList_Replace" action="?listReplace<?php echo $this->_tpl_vars['vars']['arg']; ?>
" id="frmList_Replace">
    <!------------------------------------------THEM MOI------------------------------------>
    <fieldset style="width:360px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
        <?php if (isset($this->_sections['qi'])) unset($this->_sections['qi']);
$this->_sections['qi']['name'] = 'qi';
$this->_sections['qi']['loop'] = is_array($_loop=$this->_tpl_vars['obj_list_vttb']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
$this->_sections['qi']['show'] = true;
$this->_sections['qi']['max'] = $this->_sections['qi']['loop'];
$this->_sections['qi']['step'] = 1;
$this->_sections['qi']['start'] = $this->_sections['qi']['step'] > 0 ? 0 : $this->_sections['qi']['loop']-1;
if ($this->_sections['qi']['show']) {
    $this->_sections['qi']['total'] = $this->_sections['qi']['loop'];
    if ($this->_sections['qi']['total'] == 0)
        $this->_sections['qi']['show'] = false;
} else
    $this->_sections['qi']['total'] = 0;
if ($this->_sections['qi']['show']):

            for ($this->_sections['qi']['index'] = $this->_sections['qi']['start'], $this->_sections['qi']['iteration'] = 1;
                 $this->_sections['qi']['iteration'] <= $this->_sections['qi']['total'];
                 $this->_sections['qi']['index'] += $this->_sections['qi']['step'], $this->_sections['qi']['iteration']++):
$this->_sections['qi']['rownum'] = $this->_sections['qi']['iteration'];
$this->_sections['qi']['index_prev'] = $this->_sections['qi']['index'] - $this->_sections['qi']['step'];
$this->_sections['qi']['index_next'] = $this->_sections['qi']['index'] + $this->_sections['qi']['step'];
$this->_sections['qi']['first']      = ($this->_sections['qi']['iteration'] == 1);
$this->_sections['qi']['last']       = ($this->_sections['qi']['iteration'] == $this->_sections['qi']['total']);
?>
        <?php if ($this->_tpl_vars['obj_list_vttb'][$this->_sections['qi']['index']]->vttb_id == $this->_tpl_vars['vttb_id']): ?> 
            <?php $this->assign('vttb_name', $this->_tpl_vars['obj_list_vttb'][$this->_sections['qi']['index']]->vttb_name); ?>
        <?php endif; ?>
        <?php endfor; endif; ?>
        <legend class="legend" style="width:250px">Thêm/Sửa mục thay thế cho: <span style="color:#00F" title="<?php echo $this->_tpl_vars['vttb_name']; ?>
"><?php echo ((is_array($_tmp=$this->_tpl_vars['vttb_name'])) ? $this->_run_mod_handler('str_string_cut', true, $_tmp, '45', '1') : smarty_modifier_str_string_cut($_tmp, '45', '1')); ?>
</span></legend>
    	<table width="98%" cellspacing="0" cellpadding="0" border="0" style="margin-left:5px">
            <tr height="20">
                <td colspan="2"> 
                	<?php if ($this->_tpl_vars['error'] || $this->_tpl_vars['complete']): ?>
                	<span class="msg">Thông báo: <font color="#FF0000"><?php echo $this->_tpl_vars['error']; ?>
</font><?php echo $this->_tpl_vars['complete']; ?>
</span><?php endif; ?>
            		<span id="lblError_Replace" class="error">Thông báo: (*) là các mục bắt buộc!</span>
                </td>
            </tr>
            <tr><td colspan="2"></td></tr>
            <tr height="30">
            	<td align="center" valign="top">
                	<div style="float:left; width:90px; line-height:25px; text-align:left">Mục thay thế <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:248px; line-height:25px; text-align:left">
                        <input type="text" id="vttb_replace_name" name="vttb_replace_name" class="text_middle_long" value="<?php echo $this->_tpl_vars['obj_info']['vttb_replace_name']; ?>
" onfocus="hide_message_Replace();" tabindex="1"/>
                    </div>
                    
                    <div style="float:left; width:90px; line-height:25px; text-align:left">Đơn vị thực hiện <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:248px; line-height:25px; text-align:left">
                        <input type="text" id="vttb_replace_unit" name="vttb_replace_unit" class="text_middle_long" value="<?php echo $this->_tpl_vars['obj_info']['vttb_replace_unit']; ?>
" onfocus="hide_message_Replace();" tabindex="2"/>
                    </div>
                   
                    <div style="float:left; width:90px; line-height:25px; text-align:left">Phí thay thế <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:168px; line-height:25px; text-align:left">
                    	<input type="text" id="vttb_replace_cost" name="vttb_replace_cost" class="text_short" value="<?php echo $this->_tpl_vars['obj_info']['vttb_replace_cost']; ?>
" onfocus="hide_message_Replace();" tabindex="3"/> (vnđ)
                    </div>
                    <div style="float:left; width:42px; line-height:25px; text-align:left">Phiếu <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:40px; line-height:25px; text-align:left">
                    	<input type="text" id="vttb_replace_code" name="vttb_replace_code" class="text_tiny" value="<?php echo $this->_tpl_vars['obj_info']['vttb_replace_code']; ?>
" onfocus="hide_message_Replace();" tabindex="4"/>
                    </div>
                    
                    <div style="float:left; width:90px; line-height:25px; text-align:left">Ngày thực hiện <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:95px; line-height:25px; text-align:left">
                    	<div style="float:left; width:72px; height:21px; border:1px solid #99bbe8; background-color:#FFF">
                            <?php if ($this->_tpl_vars['obj_info']['vttb_replace_date'] != '0000-00-00' && $this->_tpl_vars['obj_info']['vttb_replace_date'] != ''): ?>
                                <input type="text" id="replace_date_1" name="replace_date_1" class="text_date" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['obj_info']['vttb_replace_date'])) ? $this->_run_mod_handler('date_format', true, $_tmp, '%d') : smarty_modifier_date_format($_tmp, '%d')); ?>
" onkeypress="set_focus('replace_date_1','replace_date_2')" onfocus="hide_message()" maxlength="2" tabindex="5"/>/
                                <input type="text" id="replace_date_2" name="replace_date_2" class="text_month" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['obj_info']['vttb_replace_date'])) ? $this->_run_mod_handler('date_format', true, $_tmp, '%m') : smarty_modifier_date_format($_tmp, '%m')); ?>
" onkeypress="set_focus('replace_date_2','replace_date_3')" onfocus="hide_message()" maxlength="2" tabindex="6"/>/
                                <input type="text" id="replace_date_3" name="replace_date_3" class="text_year" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['obj_info']['vttb_replace_date'])) ? $this->_run_mod_handler('date_format', true, $_tmp, '%Y') : smarty_modifier_date_format($_tmp, '%Y')); ?>
" onfocus="hide_message()" maxlength="4" tabindex="7"/>
                            <?php else: ?>
                                <input type="text" id="replace_date_1" name="replace_date_1" class="text_date" value="" onkeypress="set_focus('replace_date_1','replace_date_2')" onfocus="hide_message()" maxlength="2" tabindex="5"/>/
                                <input type="text" id="replace_date_2" name="replace_date_2" class="text_month" value="" onkeypress="set_focus('replace_date_2','replace_date_3')" onfocus="hide_message()" maxlength="2" tabindex="6"/>/
                                <input type="text" id="replace_date_3" name="replace_date_3" class="text_year" value="" onfocus="hide_message()" maxlength="4" tabindex="7"/>
                            <?php endif; ?>
                        </div>
                    </div>
                    <div style="float:left; width:65px; line-height:25px; text-align:left">Thanh toán <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:65px; line-height:25px; text-align:left">
                    	<select id="vttb_replace_paid_type" name="vttb_replace_paid_type" class="select_short" tabindex="8">
                            <option value="1" <?php if ($this->_tpl_vars['obj_info']['vttb_replace_paid_type'] == 1): ?>selected="selected"<?php endif; ?>>Tiền mặt</option>
                            <option value="2" <?php if ($this->_tpl_vars['obj_info']['vttb_replace_paid_type'] == 2): ?>selected="selected"<?php endif; ?>>Công nợ</option>
                        </select>
                    </div>
                    
                    <div style="float:left; width:100%; line-height:25px; text-align:left">
                    	<input type="button" name="btnSub_Replace" id="btnSub_Replace" value="Ghi lại" class="button" tabindex="9"/>
                        <input type="hidden" name="vttb_replace_id" id="vttb_replace_id" value="<?php echo $this->_tpl_vars['obj_info']['vttb_replace_id']; ?>
">
                        <input type="hidden" name="vttb_sub_id" id="vttb_sub_id" value="<?php echo $this->_tpl_vars['vars']['vttb_sub_id']; ?>
">
                        <input type="hidden" name="user_id" id="user_id" value="<?php echo $this->_tpl_vars['obj_info']['user_id']; ?>
">
                        <input type="hidden" name="vttb_id" id="vttb_id" value="<?php echo $this->_tpl_vars['vars']['vttb_id']; ?>
">
                        <input type="reset" name="Reset" value="Hủy bỏ" class="button" tabindex="10"/>
                        <?php echo '
                        <script language="javascript">
                            function hide_message_Replace(){
                                $(\'#lblMessage_Replace\').hide();
                                $(\'#lblError_Replace\').hide();
                            }
                            
                            $(function() {
                            $(\'.error\').hide();
                            $(\'#lblMessage_Replace\').hide();
                             
                            $("#btnSub_Replace").click(function() {
								
                                $(\'.error\').hide();
                                 
                                var $form 			= $("#frmList_Replace");
								var vttb_replace_name 	= $form.find(\'input#vttb_replace_name\').val();
								var vttb_replace_unit 	= $form.find(\'input#vttb_replace_unit\').val();
								var vttb_replace_code 	= $form.find(\'input#vttb_replace_code\').val();
								var vttb_replace_cost 	= $form.find(\'input#vttb_replace_cost\').val();
								var vttb_replace_paid_type 	= $form.find(\'select#vttb_replace_paid_type :selected\').val();
								
								var replace_date_1 		= $form.find(\'input#replace_date_1\').val();
								var replace_date_2 		= $form.find(\'input#replace_date_2\').val();
								var replace_date_3 		= $form.find(\'input#replace_date_3\').val();
						
								var vttb_id 			= $form.find(\'input#vttb_id\').val();
								var vttb_replace_id 		= $form.find(\'input#vttb_replace_id\').val();
								
								var vttb_sub_id 		= $form.find(\'input#vttb_sub_id\').val();
								
                                //begin validate form
                                if (vttb_replace_name == "" || vttb_replace_unit == "" || replace_date_1 == "" || replace_date_2 == "" || replace_date_3 == "" || vttb_replace_code == "" || vttb_replace_cost == "" || vttb_replace_paid_type == ""){
                                    $(\'#lblError_Replace\').show();
                                }
                                else{
									$.post(\'index.php?listReplace&mod=vttbs&add_edit=1\',
										{
											vttb_replace_name:vttb_replace_name,
											vttb_replace_unit:vttb_replace_unit,
											vttb_replace_code:vttb_replace_code,
											vttb_replace_cost:vttb_replace_cost,
											vttb_replace_paid_type:vttb_replace_paid_type,
											vttb_replace_date:replace_date_3+\'-\'+replace_date_2+\'-\'+replace_date_1,
											vttb_id:vttb_id,
											vttb_replace_id:vttb_replace_id,
											
											vttb_sub_id:vttb_sub_id,
										},
										function(data){
											$(\'#list_replace_cont\').html(data);
											$("#list_replace_cont").show();
										}
									);
                                    return false;
                                }
                                //end form
                            });
                        });
                        </script>
                        '; ?>

                    </div>
                </td>
            </tr>
        </table>
    </fieldset>
    <!------------------------------------DANH SACH---------------------------------------------->
    <fieldset style="width:360px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:167px">
        <legend class="legend"><div style="width:130px; float:left">Danh sách: <?php echo $this->_tpl_vars['total_num_result']; ?>
</div></legend>
    	<div style="float:left; height:5px; width:100%"></div>
        <div style="float:left; height:25px; width:342px; border-top:1px solid #99bbe8; border-bottom:1px solid #99bbe8 ">
            <div class="tbl_tit" style="width:30px; text-align:center"><b>STT</b></div>	
            <div class="tbl_tit" style="width:178px"><B>&nbsp;Mục thay thế</B></div>
            <div class="tbl_tit" style="width:70px"><B>&nbsp;Ngày</B></div>
            <div class="tbl_tit" style="width:60px; text-align:center"><B>Chọn</B></div>
        </div>
        <div style="float:left; width:18px; height:25px">&nbsp;</div>
        <div style="float:left; height:112px; width:359px; overflow-y:scroll">
            <?php if (isset($this->_sections['pi'])) unset($this->_sections['pi']);
$this->_sections['pi']['name'] = 'pi';
$this->_sections['pi']['loop'] = is_array($_loop=$this->_tpl_vars['obj_list']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
$this->_sections['pi']['show'] = true;
$this->_sections['pi']['max'] = $this->_sections['pi']['loop'];
$this->_sections['pi']['step'] = 1;
$this->_sections['pi']['start'] = $this->_sections['pi']['step'] > 0 ? 0 : $this->_sections['pi']['loop']-1;
if ($this->_sections['pi']['show']) {
    $this->_sections['pi']['total'] = $this->_sections['pi']['loop'];
    if ($this->_sections['pi']['total'] == 0)
        $this->_sections['pi']['show'] = false;
} else
    $this->_sections['pi']['total'] = 0;
if ($this->_sections['pi']['show']):

            for ($this->_sections['pi']['index'] = $this->_sections['pi']['start'], $this->_sections['pi']['iteration'] = 1;
                 $this->_sections['pi']['iteration'] <= $this->_sections['pi']['total'];
                 $this->_sections['pi']['index'] += $this->_sections['pi']['step'], $this->_sections['pi']['iteration']++):
$this->_sections['pi']['rownum'] = $this->_sections['pi']['iteration'];
$this->_sections['pi']['index_prev'] = $this->_sections['pi']['index'] - $this->_sections['pi']['step'];
$this->_sections['pi']['index_next'] = $this->_sections['pi']['index'] + $this->_sections['pi']['step'];
$this->_sections['pi']['first']      = ($this->_sections['pi']['iteration'] == 1);
$this->_sections['pi']['last']       = ($this->_sections['pi']['iteration'] == $this->_sections['pi']['total']);
?>
            <?php if (!(!($this->_sections['pi']['index'] % 2))): ?> 
            <?php $this->assign('class_td', 'tbl_cont'); ?> 
            <?php else: ?>
            <?php $this->assign('class_td', 'tbl_cont2'); ?> 
            <?php endif; ?>
            <?php echo smarty_function_math(array('x' => $this->_tpl_vars['vars']['curpage']-1,'y' => $this->_tpl_vars['vars']['numresult'],'z' => $this->_sections['pi']['index'],'t' => 1,'equation' => "x*y+z+t",'assign' => 'stt'), $this);?>

            <div style="float:left">
                <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:30px; text-align:center"><?php echo $this->_tpl_vars['stt']; ?>
</div>
                <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:178px; white-space:nowrap" title="<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->vttb_replace_name; ?>
">
                	<?php if ($this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->user_id == $this->_tpl_vars['access_user_id']): ?>
                    &nbsp;<a href='javascript: void(0);' onclick="edit_me_Replace(<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->vttb_replace_id; ?>
,<?php echo $this->_tpl_vars['vttb_sub_id']; ?>
)"><?php echo ((is_array($_tmp=$this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->vttb_replace_name)) ? $this->_run_mod_handler('str_string_cut', true, $_tmp, '25', '1') : smarty_modifier_str_string_cut($_tmp, '25', '1')); ?>
</a>
                    <?php else:  echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->vttb_replace_name;  endif; ?>
                </div>
                <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:70px; text-align:left">
                    <?php echo ((is_array($_tmp=$this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->vttb_replace_date)) ? $this->_run_mod_handler('date_format', true, $_tmp, "%d/%m/%Y") : smarty_modifier_date_format($_tmp, "%d/%m/%Y")); ?>

                </div>
                <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:29px; text-align:center">
                	<?php if ($this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->user_id == $this->_tpl_vars['access_user_id']): ?>
                    <a href='javascript: void(0);' onclick="edit_me_Replace(<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->vttb_replace_id; ?>
,<?php echo $this->_tpl_vars['vttb_sub_id']; ?>
)">
                    <img src="../images/admin/b_edit.png" width="11" height="11" border="0" title="Sửa"></a>
                    <?php else: ?>-<?php endif; ?>
                </div>
                <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:29px; text-align:center">
                	<?php if ($this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->user_id == $this->_tpl_vars['access_user_id']): ?>
                    <a href='javascript: void(0)' onClick="delItems_Replace('<?php echo $this->_tpl_vars['processurl']; ?>
', <?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->vttb_replace_id; ?>
,<?php echo $this->_tpl_vars['vttb_sub_id']; ?>
);">
                    <img src="../images/admin/b_drop.png" width="11" height="11" border="0" title="Xóa"></a>
                    <?php else: ?>-<?php endif; ?>
                </div>
            </div>
            <?php endfor; endif; ?>
        </div>
        <input type="hidden" id="curpage_Replace" name="curpage" value="<?php echo $this->_tpl_vars['vars']['curpage']; ?>
" />
    </fieldset>
    </form>
</div>
<!------------------------------------------------- Tool bar --------------------------------------------->
<div id="list_replace_clear_txt"></div>
<div id="list_replace_tool_bar">    
    <div id="list_replace_page_area">
    <?php if ($this->_tpl_vars['vars']['curpage'] == 1): ?>
    	<img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_first_page.png" class="img_all">
    	<img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_pre_page.png" class="img_all">
    <?php else: ?>
    <a href="javascript: void(0)" id="first_page" onclick="gotoPage_Replace('<?php echo $this->_tpl_vars['processurl']; ?>
',parseInt(1));" title="Trang đầu">
    	<img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_first_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="pre_page" onclick="gotoPage_Replace('<?php echo $this->_tpl_vars['processurl']; ?>
',parseInt(document.getElementById('page_Replace').value)-parseInt(1));" title="Trang trước">
    	<img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_pre_page.png" class="img_all">
    </a>
    <?php endif; ?>
    </div>
    <div style="float:left; line-height:19px">
        <div style="float:left; width:35px">Trang</div> 
        <div style="float:left; width:35px">
        <input type="text" value="<?php echo $this->_tpl_vars['vars']['curpage']; ?>
" name="page" id="page_Replace" onblur=" gotoPage_Replace('<?php echo $this->_tpl_vars['processurl']; ?>
',this.value);" style="width:30px; font-size:12px; height:15px; border:1px solid #99bbe8">
        </div>
        <div style="float:left; width:22px"> / <?php echo $this->_tpl_vars['num_page']; ?>
</div>
    </div>
    <div id="list_replace_page_area">
    <?php if ($this->_tpl_vars['vars']['curpage'] == $this->_tpl_vars['num_page']): ?>
    	<img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_next_page.png" class="img_all">
        <img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_last_page.png" class="img_all">
    <?php else: ?>
    <a href="javascript: void(0)" id="next_page" onclick="gotoPage_Replace('<?php echo $this->_tpl_vars['processurl']; ?>
',parseInt(document.getElementById('page_Replace').value)+parseInt(1));" title="Trang tiếp">
    	<img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_next_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="last_page" onclick="gotoPage_Replace('<?php echo $this->_tpl_vars['processurl']; ?>
',parseInt(<?php echo $this->_tpl_vars['num_page']; ?>
));" title="Trang cuối">
    	<img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_last_page.png" class="img_all">
    </a>
    <?php endif; ?>
    </div>
    
    <div style="float:left; width:12px; background-image:url(<?php echo $this->_tpl_vars['css_path']; ?>
gach_vttb.png)">&nbsp;</div>
    <div style="float:left; width:15px">
    <a href="javascript: void(0)" id="a_ref_Replace" title="Tải lại"><img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_refresh.png" class="img_all"></a>
    </div>    
</div>
<?php echo '
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
		if(!confirm("THÔNG BÁO: \\n\\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
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
			//alert (processurl+\'--\'+dataString);
		$.ajax({
			type: "POST",
			url: processurl,
			data: dataString,
			success: function(data) {
				$(\'#list_replace_cont\').fadeOut(\'fast\').load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+curpage).fadeIn("fast");
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
		//alert(processurl+\'-\'+page+\'-\'+numresult+\'-\'+order);
		$("#list_replace_cont").load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+page);
	}
	
	function edit_me_Replace(id,vttb_sub_id){
		var vttb_id = document.frmList_Replace.vttb_id.value;
		$("#list_replace_cont").load("?listReplace&mod=vttbs&edit_me=1&vttb_replace_id="+id+"&vttb_id="+vttb_id+"&vttb_sub_id="+vttb_sub_id);
	}
			
	$("#a_ref_Replace").click( function () { 
		var vttb_id = document.frmList_Replace.vttb_id.value;
		var vttb_sub_id = document.frmList_Replace.vttb_sub_id.value;
		$(\'#list_replace_cont\').hide();
		$(\'#list_replace_cont\').fadeOut(\'fast\').load("?listReplace&mod=vttbs&vttb_id="+vttb_id+"&vttb_sub_id="+vttb_sub_id).fadeIn("fast");
	});
</script>
'; ?>