<?php /* Smarty version 2.6.2, created on 2018-12-16 10:29:05
         compiled from E:%5CProjects%5Cwamp64%5Cwww%5Csmarty%5Cprj14.3.3_offices_mekong%5Ccode%5Cmodules%5Cdocs/skin/B_DocDT_tbl.tpl */ ?>
<?php require_once(SMARTY_DIR . 'core' . DIRECTORY_SEPARATOR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'date_format', 'E:\Projects\wamp64\www\smarty\prj14.3.3_offices_mekong\code\modules\docs/skin/B_DocDT_tbl.tpl', 69, false),array('modifier', 'str_string_cut', 'E:\Projects\wamp64\www\smarty\prj14.3.3_offices_mekong\code\modules\docs/skin/B_DocDT_tbl.tpl', 410, false),array('function', 'math', 'E:\Projects\wamp64\www\smarty\prj14.3.3_offices_mekong\code\modules\docs/skin/B_DocDT_tbl.tpl', 392, false),)), $this); ?>
<?php echo '
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
'; ?>

<?php if ($this->_tpl_vars['user_level'] == 1 || $this->_tpl_vars['user_level'] == 2 || $this->_tpl_vars['user_level'] == 9): ?>
<?php echo '
<script language="javascript">
	function set_focus(){
		document.frmList_DocDT.docDT_num.focus();
	}
	
	// Select box to box
	function listbox_moveacross(sourceID, destID) {
		var src = document.getElementById(sourceID);
		var dest = document.getElementById(destID);
		for(var count=0; count < src.options.length; count++) {
			if(src.options[count].selected == true) {
				var option = src.options[count];
				var newOption = document.createElement("option");
				newOption.value = option.value;
				newOption.text = option.text;
				newOption.selected = true;
				try {
						 dest.add(newOption, null); //Standard
						 src.remove(count, null);
				 }catch(error) {
						 dest.add(newOption); // IE only
						 src.remove(count);
				 }
				count--;
			}
		}
	}
	window.onload=set_focus();
</script>
'; ?>

<?php endif; ?>
<div id="doc_content_insign">
	<form method="post" name="frmList_DocDT" action="?listDocDT<?php echo $this->_tpl_vars['vars']['arg']; ?>
" id="frmList_DocDT">
    <?php if ($this->_tpl_vars['user_level'] == 1 || $this->_tpl_vars['user_level'] == 2 || $this->_tpl_vars['user_level'] == 9 || $this->_tpl_vars['user_level'] == 10): ?>
    <!------------------------------------------THEM MOI------------------------------------>
    <fieldset style="width:912px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
        <legend class="legend_list_search">
            Thêm/Chỉnh sửa&nbsp;|&nbsp;Thông báo:&nbsp;
            <span class="msg"><?php echo $this->_tpl_vars['error'];  echo $this->_tpl_vars['complete']; ?>
</span>
            <span id="lblError_DocDT" class="error">(*) là các mục bắt buộc!</span>
        </legend>
    	<table width="98%" cellspacing="0" cellpadding="0" border="0" style="margin-left:5px">
        	<tr height="10"><td colspan="2"></td></tr>
            <tr height="30">
            	<td align="center" width="30%" valign="top">
                	<div style="float:left; width:30%; line-height:25px; text-align:left; color:#F00">Số dự thảo <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left">
                    	<input type="text" id="docDT_num" name="docDT_num" value="<?php if ($this->_tpl_vars['obj_info']['docDT_num'] != ''):  echo $this->_tpl_vars['obj_info']['docDT_num'];  else:  echo $this->_tpl_vars['obj_info']['docDT_num_typical'];  endif; ?>"  class="text_short" style="color:#F00" tabindex="1"/>
                    </div>
                    <div style="float:left; width:30%; line-height:25px; text-align:left">Ngày dự thảo <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left">
                    	<input type="text" name="docDT_date" id="docDT_date" value="<?php if ($this->_tpl_vars['vars']['docDT_date'] != ''):  echo ((is_array($_tmp=$this->_tpl_vars['obj_info']['docDT_date'])) ? $this->_run_mod_handler('date_format', true, $_tmp, "%d/%m/%Y") : smarty_modifier_date_format($_tmp, "%d/%m/%Y"));  else:  echo ((is_array($_tmp=time())) ? $this->_run_mod_handler('date_format', true, $_tmp, "%d/%m/%Y") : smarty_modifier_date_format($_tmp, "%d/%m/%Y"));  endif; ?>" class="text_time_callender" tabindex="2"/>&nbsp;<img src="../images/admin/img.gif" align="absmiddle" id="date_docDT" style="cursor: pointer; border: 0" title="Chọn ngày trên lịch"/>
                        <?php echo '
						<script type="text/javascript">
                            Calendar.setup({
                                inputField   :   "docDT_date",
                                ifFormat     :   "%d/%m/%Y",
                                button       :   "date_docDT",
                                align        :   "Br",  
                                timeFormat   :   "24",
                                showsTime    :   true,
                                singleClick  :   true
                            });
                        </script>
                        '; ?>

                    </div>
                    <div style="float:left; width:30%; line-height:25px; text-align:left">Loại văn bản <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left">
                    	<select name="docCat_id" id="docCat_id" class="select_middle" tabindex="3">
                            <option value="0">Chọn loại văn bản</option>
                            <?php if (isset($this->_sections['qi'])) unset($this->_sections['qi']);
$this->_sections['qi']['name'] = 'qi';
$this->_sections['qi']['loop'] = is_array($_loop=$this->_tpl_vars['obj_list_dcat']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
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
                            <option value="<?php echo $this->_tpl_vars['obj_list_dcat'][$this->_sections['qi']['index']]->docCat_id; ?>
" <?php if ($this->_tpl_vars['obj_list_dcat'][$this->_sections['qi']['index']]->docCat_id == $this->_tpl_vars['obj_info']['docCat_id']): ?>selected="selected"<?php endif; ?>>-&nbsp;<?php echo $this->_tpl_vars['obj_list_dcat'][$this->_sections['qi']['index']]->docCat_name; ?>
</option>
                            <?php endfor; endif; ?>
                        </select>
                    </div>
                    <div style="float:left; width:30%; line-height:25px; text-align:left">Nơi dự thảo <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left">
                    	<?php if ($this->_tpl_vars['user_level'] == 2 || $this->_tpl_vars['user_level'] == 3): ?>
                            <select name="department_id" id="department_id" class="select_middle" tabindex="4">
                                <option value="0">Chọn đơn vị dự thảo</option>
                                <?php if (isset($this->_sections['qi'])) unset($this->_sections['qi']);
$this->_sections['qi']['name'] = 'qi';
$this->_sections['qi']['loop'] = is_array($_loop=$this->_tpl_vars['obj_list_department']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
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
                                <option value="<?php echo $this->_tpl_vars['obj_list_department'][$this->_sections['qi']['index']]->department_id; ?>
" <?php if ($this->_tpl_vars['obj_list_department'][$this->_sections['qi']['index']]->department_id == $this->_tpl_vars['obj_info']['department_id']): ?>selected="selected"<?php endif; ?>>-&nbsp;<?php echo $this->_tpl_vars['obj_list_department'][$this->_sections['qi']['index']]->department_name; ?>
</option>
                                <?php endfor; endif; ?>
                            </select>
                        <?php elseif ($this->_tpl_vars['user_level'] == 10): ?>
                            <select name="department_id" id="department_id" class="select_middle" tabindex="4">
                                <?php if (isset($this->_sections['qi'])) unset($this->_sections['qi']);
$this->_sections['qi']['name'] = 'qi';
$this->_sections['qi']['loop'] = is_array($_loop=$this->_tpl_vars['obj_list_department']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
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
                                    <?php if ($this->_tpl_vars['obj_list_department'][$this->_sections['qi']['index']]->department_id == $this->_tpl_vars['access_unit_id']): ?>
                                    <option value="<?php echo $this->_tpl_vars['obj_list_department'][$this->_sections['qi']['index']]->department_id; ?>
">-&nbsp;<?php echo $this->_tpl_vars['obj_list_department'][$this->_sections['qi']['index']]->department_name; ?>
</option>
                                    <?php endif; ?>
                                <?php endfor; endif; ?>
                            </select>
                        <?php endif; ?>
                    </div>
                </td>
                <td align="center" valign="top">
                	<div style="float:left; width:10%; line-height:25px; text-align:left">Trích yếu <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:90%; line-height:25px; text-align:left; height:75px">
                    	<textarea spellcheck="false" name="docDT_desc" id="docDT_desc" cols="30" rows="5" class="text_area_long" onfocus="hide_message_DocDT()" tabindex="8"><?php echo $this->_tpl_vars['obj_info']['docDT_desc']; ?>
</textarea>
                    </div>
                    <div style="float:left; width:10%; line-height:25px; text-align:left">Tình trạng <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:20%; line-height:25px; text-align:left">
                        <select name="docDT_status" id="docDT_status" class="select_short" tabindex="4">
                            <option value="0" <?php if ($this->_tpl_vars['obj_info']['docDT_status'] == 0): ?>selected="selected"<?php endif; ?>>Mới nhập</option>
                            <option value="1" <?php if ($this->_tpl_vars['obj_info']['docDT_status'] == 1): ?>selected="selected"<?php endif; ?>>Chờ hiệu chỉnh</option>
                            <option value="2" <?php if ($this->_tpl_vars['obj_info']['docDT_status'] == 2): ?>selected="selected"<?php endif; ?>>Đã trình ký</option>
                            <option value="3" <?php if ($this->_tpl_vars['obj_info']['docDT_status'] == 3): ?>selected="selected"<?php endif; ?>>Đã ký</option>
                            <option value="4" <?php if ($this->_tpl_vars['obj_info']['docDT_status'] == 4): ?>selected="selected"<?php endif; ?>>Đã vào sổ đi</option>
                        </select>
                    </div>
                    <div style="float:left; width:20%; line-height:25px; text-align:left">
                    	&nbsp;<b>(Người nhập: <?php echo $this->_tpl_vars['access_user_name']; ?>
)</b>
                    </div>
                    <div style="float:left; width:26.5%; line-height:25px; text-align:right">
                    	<input type="button" name="btnSub_DocDT" id="btnSub_DocDT" value="Ghi lại" class="button" tabindex="13"/>
                        <input type="hidden" name="docDT_id" id="docDT_id" value="<?php echo $this->_tpl_vars['obj_info']['docDT_id']; ?>
">
                        <input type="hidden" name="docDT_file" id="docDT_file" value="<?php echo $this->_tpl_vars['obj_info']['docDT_file']; ?>
">
                        <input type="hidden" name="input_per" id="input_per" value="<?php echo $this->_tpl_vars['obj_info']['input_per']; ?>
">
                        <input type="reset" name="Reset" value="Hủy bỏ" class="button" tabindex="14"/>
                        <?php echo '
                        <script language="javascript">
                            function hide_message_DocDT(){
                                $(\'#lblMessage_DocDT\').hide();
                                $(\'#lblError_DocDT\').hide();
                            }
                            
                            $(function() {
                            $(\'.error\').hide();
                            $(\'#lblMessage_DocDT\').hide();
                             
                            $("#btnSub_DocDT").click(function() {
                                $(\'.error\').hide();

                                var $form = $("#frmList_DocDT");
                                var docDT_num = $form.find(\'input#docDT_num\').val();
								var docDT_date = $form.find(\'input#docDT_date\').val();
								var docCat_id = $form.find(\'select#docCat_id :selected\').val();
								var department_id = $form.find(\'select#department_id :selected\').val();
								var docDT_desc = $form.find(\'textarea#docDT_desc\').val();
                                var docDT_status = $form.find(\'select#docDT_status :selected\').val();

								var docDT_id = $form.find(\'input#docDT_id\').val();
								var docDT_file = $form.find(\'input#docDT_file\').val();
								var input_per = $form.find(\'input#input_per\').val();
								
                                //begin validate form
                                if (docDT_num == "" || docDT_date == "" || docCat_id == 0 || department_id == 0  || docDT_desc == ""){
                                    $(\'#lblError_DocDT\').show();
                                }
                                else{
									$.post(\'index.php?listDocDT&mod=docs&add_edit=1\',
										{
											docDT_num:docDT_num,
											docDT_date:docDT_date,
											docCat_id:docCat_id,
											department_id:department_id,
											docDT_desc:docDT_desc,
                                            docDT_status:docDT_status,

											docDT_id:docDT_id,
											docDT_file:docDT_file,
											input_per:input_per
										},
										function(data){
											$(\'#doc_content_main\').html(data);
											$("#doc_content_main").show();
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
                    <div style="position:absolute; width:625px; margin:201px 0 0 -5px; height:80px; text-align:left; display:none; background-color:#dfe8f6; border:1px solid #99bbe8; border-top:none; z-index:1005" id="div_add_more">
                    <div style="float:left; width:10%; line-height:25px; text-align:left; margin-left:4px">Người ký liên ngành:</div>
                    <div style="float:left; width:89%; line-height:25px; text-align:left; height:55px">
                    	<?php if ($this->_tpl_vars['obj_info']['interdisci_move'] != ''): ?>
                        <div style="float:left; width:246px; margin-top:2px">
                        	<select id="interdisci_move" multiple="multiple" class="select_middle" style="width:246px; height:46px">
                                 <?php if (isset($this->_sections['qi'])) unset($this->_sections['qi']);
$this->_sections['qi']['name'] = 'qi';
$this->_sections['qi']['loop'] = is_array($_loop=$this->_tpl_vars['obj_list_interdisci_notin']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
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
                                <option value="<?php echo $this->_tpl_vars['obj_list_interdisci_notin'][$this->_sections['qi']['index']]->interdisci_id; ?>
">-&nbsp;<?php echo $this->_tpl_vars['obj_list_interdisci_notin'][$this->_sections['qi']['index']]->interdisci_name; ?>
</option>
                                <?php endfor; endif; ?>
                            </select>
                        </div>
                        <div style="float:left; width:60px">
                            <div style="float:left; padding-left:10px; padding-top:2px">
                            <input type="button" name="addto" onClick="listbox_moveacross('interdisci_move', 'interdisci_name')" value="&gt;&gt;" class="button_small"></div>
                            <div style="float:left; padding-left:10px">
                            <input type="button" name="addto" onClick="listbox_moveacross('interdisci_name', 'interdisci_move')" value="&lt;&lt;" class="button_small"></div>
                        </div>
                        <div style="float:left; width:246px; margin-top:2px">
                            <select name="interdisci_name" id="interdisci_name" size="5" multiple="multiple"  class="select_middle" style="width:246px; height:46px">
                            <?php if (isset($this->_sections['qi'])) unset($this->_sections['qi']);
$this->_sections['qi']['name'] = 'qi';
$this->_sections['qi']['loop'] = is_array($_loop=$this->_tpl_vars['obj_list_interdisci_in']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
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
                            <option value="<?php echo $this->_tpl_vars['obj_list_interdisci_in'][$this->_sections['qi']['index']]->interdisci_id; ?>
">-&nbsp;<?php echo $this->_tpl_vars['obj_list_interdisci_in'][$this->_sections['qi']['index']]->interdisci_name; ?>
</option>
                            <?php endfor; endif; ?>
                            </select>
                        </div>
                        <?php else: ?>
                        <div style="float:left; width:246px; margin-top:2px">
                        	<select id="interdisci_move" multiple="multiple" class="select_middle" style="width:246px; height:46px">
                                <?php if (isset($this->_sections['qi'])) unset($this->_sections['qi']);
$this->_sections['qi']['name'] = 'qi';
$this->_sections['qi']['loop'] = is_array($_loop=$this->_tpl_vars['obj_list_interdisci']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
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
                                <option value="<?php echo $this->_tpl_vars['obj_list_interdisci'][$this->_sections['qi']['index']]->interdisci_id; ?>
">-&nbsp;<?php echo $this->_tpl_vars['obj_list_interdisci'][$this->_sections['qi']['index']]->interdisci_name; ?>
</option>
                                <?php endfor; endif; ?>
                            </select>
                        </div>
                        <div style="float:left; width:60px">
                            <div style="float:left; padding-left:10px; padding-top:2px">
                            <input type="button" name="addto" onClick="listbox_moveacross('interdisci_move', 'interdisci_name')" value="&gt;&gt;" class="button_small"></div>
                            <div style="float:left; padding-left:10px">
                            <input type="button" name="addto" onClick="listbox_moveacross('interdisci_name', 'interdisci_move')" value="&lt;&lt;" class="button_small"></div>
                        </div>
                        <div style="float:left; width:246px; margin-top:2px">
                            <select name="interdisci_name" id="interdisci_name" size="5" multiple="multiple"  class="select_middle" style="width:246px; height:46px"></select>
                        </div>
                        <?php endif; ?>
                    </div>
                    <div style="float:left; width:10%; line-height:25px; text-align:left; margin-left:4px">Tự nhập:</div>
                    <div style="float:left; width:57.5%; line-height:25px; text-align:left">
                    	<input type="text" id="interdisci_name_02" name="interdisci_name_02" size="10" value="<?php echo $this->_tpl_vars['interdisci_name_02']; ?>
" class="text_long"/>
                    </div>
                    </div>
                </td>
            </tr>
        </table>
    </fieldset>
    <?php endif; ?>
    <!------------------------------------DANH SACH---------------------------------------------->
    <fieldset style="width:912px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; <?php if ($this->_tpl_vars['user_level'] == 1 || $this->_tpl_vars['user_level'] == 2 || $this->_tpl_vars['user_level'] == 9 || $this->_tpl_vars['user_level'] == 10): ?>height:325px<?php else: ?>height:462px<?php endif; ?>">
        <legend class="legend_list" style="width:865px">
            <div style="width:130px; float:left">Danh sách: <?php echo $this->_tpl_vars['total_num_result']; ?>
</div>
            <div style="width:70px; float:left">&nbsp;|&nbsp;Tìm kiếm:&nbsp;</div>
            <div style="width:380px; float:left; font-weight:normal">
                <div style="float:left">
                    <div style="float:left; width:60px">- Trích yếu: </div>
                    <div style="float:left; width:300px">
                    <input type="text" id="docDT_desc_fs" name="docDT_desc_fs" class="text_seek_long" value="<?php echo $this->_tpl_vars['vars']['docDT_desc_fs']; ?>
"/>
                    </div>
                    <input type="hidden" id="processurl" value="<?php echo $this->_tpl_vars['processurl']; ?>
" />
                </div>
                <a href="javascript: void(0);" onClick="show_hide_seek()" style="text-decoration:none; color:#F00">
                <div style="float:left; margin-left:3px"><img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_keo_dai.png" class="img_all"></div></a>
            </div>
            <div style="width:380px; float:left; font-weight:normal; position:absolute; display:none; margin:20px 0 0 200px; background-color:#ccd8e7; border:1px solid #99bbe8; border-top:none; padding-top: 5px" id="seek_more">
                <div style="float:left; width:60px; margin-bottom:5px">- Số đi: </div>
                <div style="float:left; width:80px; margin-bottom:5px">
                    <input type="text" id="docDT_num_fs" name="docDT_num_fs" class="text_seek_tiny" value="<?php echo $this->_tpl_vars['vars']['docDT_num_fs']; ?>
" />
                </div>
                <div style="float:left; width:79px; margin-bottom:5px">- ĐV dự thảo: </div>
                <div style="float:left; width:155px; margin-bottom:6px">
                <select name="department_id_fs" id="department_id_fs" class="text_seek_middle">
                    <option value="0">Chọn đơn vị dự thảo</option>
                    <?php if (isset($this->_sections['qi'])) unset($this->_sections['qi']);
$this->_sections['qi']['name'] = 'qi';
$this->_sections['qi']['loop'] = is_array($_loop=$this->_tpl_vars['obj_list_department']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
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
                    <option value="<?php echo $this->_tpl_vars['obj_list_department'][$this->_sections['qi']['index']]->department_id; ?>
">-&nbsp;<?php echo $this->_tpl_vars['obj_list_department'][$this->_sections['qi']['index']]->department_name; ?>
</option>
                    <?php endfor; endif; ?>
                </select>
                </div>
                <div style="float:left; width:60px; margin-bottom:5px">- Ngày VB:</div>
                <div style="float:left; width:80px; margin-bottom:5px">
                    <div style="float:left; width:60px; background-color:#FFF">
                        <input type="text" id="ngay_vb_1" name="ngay_vb_1" class="text_date" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['obj_info']['ngay_vb'])) ? $this->_run_mod_handler('date_format', true, $_tmp, '%d') : smarty_modifier_date_format($_tmp, '%d')); ?>
" onfocus="hide_message()" maxlength="2"/>/
                        <input type="text" id="ngay_vb_2" name="ngay_vb_2" class="text_month" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['obj_info']['ngay_vb'])) ? $this->_run_mod_handler('date_format', true, $_tmp, '%m') : smarty_modifier_date_format($_tmp, '%m')); ?>
" onfocus="hide_message()" maxlength="2"/>/
                        <input type="text" id="ngay_vb_3" name="ngay_vb_3" class="text_month" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['db_year'])) ? $this->_run_mod_handler('date_format', true, $_tmp, "%y") : smarty_modifier_date_format($_tmp, "%y")); ?>
" readonly="readonly"/>
                    </div>
                </div>
                <div style="float:left; width:79px; margin-bottom:5px">- Loại văn bản: </div>
                <div style="float:left; width:155px; margin-bottom:6px">
                <select name="docCat_id_fs" id="docCat_id_fs" class="text_seek_middle">
                    <option value="0">Chọn loại văn bản</option>
                    <?php if (isset($this->_sections['qi'])) unset($this->_sections['qi']);
$this->_sections['qi']['name'] = 'qi';
$this->_sections['qi']['loop'] = is_array($_loop=$this->_tpl_vars['obj_list_dcat']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
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
                    <option value="<?php echo $this->_tpl_vars['obj_list_dcat'][$this->_sections['qi']['index']]->docCat_id; ?>
">-&nbsp;<?php echo $this->_tpl_vars['obj_list_dcat'][$this->_sections['qi']['index']]->docCat_name; ?>
</option>
                    <?php endfor; endif; ?>
                </select>
                </div>
            </div>
            <div style="width:45px; float:left">
                <input type="button" name="btnSeek" id="btnSeek" value="Tìm >>" class="button_seek" onclick="search_me_DocDT()" />
            </div>
            <!-----------------------------------------KET XUAT--------------------------------------->
            <div style="width:60px; float:left">&nbsp;|&nbsp;Kết xuất:&nbsp;</div>
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
            <div style="width:260px; float:left; font-weight:normal; position:absolute; display:none; margin:20px 0 0 604px; background-color:#ccd8e7; border:1px solid #99bbe8; border-top:none; padding-top: 5px" id="div_filter">
                <div style="float:left; width:56px; margin-bottom:5px">- Dự thảo:</div>
                <div style="float:left; width:20px; margin-bottom:5px">Từ&nbsp;</div>
                <div style="float:left; width:75px; background-color:#FFF; margin-bottom:5px">
                <input type="text" id="tungay_1" name="tungay_1" class="text_date" value="<?php echo ((is_array($_tmp=time())) ? $this->_run_mod_handler('date_format', true, $_tmp, '%d') : smarty_modifier_date_format($_tmp, '%d')); ?>
" maxlength="2"/>
                /<input type="text" id="tungay_2" name="tungay_2" class="text_month" value="<?php echo ((is_array($_tmp=time())) ? $this->_run_mod_handler('date_format', true, $_tmp, '%m') : smarty_modifier_date_format($_tmp, '%m')); ?>
" maxlength="2" />
                /<input type="text" id="tungay_3" name="tungay_3" class="text_year" value="<?php echo ((is_array($_tmp=time())) ? $this->_run_mod_handler('date_format', true, $_tmp, '%Y') : smarty_modifier_date_format($_tmp, '%Y')); ?>
" maxlength="4" />
                </div>
                <div style="float:left; width:24px; margin-bottom:5px; margin-left:5px">đến&nbsp;</div>
                <div style="float:left; width:75px; margin-bottom:5px; background-color:#FFF">
                <input type="text" id="denngay_1" name="denngay_1" class="text_date" value="<?php echo ((is_array($_tmp=time())) ? $this->_run_mod_handler('date_format', true, $_tmp, '%d') : smarty_modifier_date_format($_tmp, '%d')); ?>
" maxlength="2" />
                /<input type="text" id="denngay_2" name="denngay_2" class="text_month" value="<?php echo ((is_array($_tmp=time())) ? $this->_run_mod_handler('date_format', true, $_tmp, '%m') : smarty_modifier_date_format($_tmp, '%m')); ?>
" maxlength="2" />
                /<input type="text" id="denngay_3" name="denngay_3" class="text_year" value="<?php echo ((is_array($_tmp=time())) ? $this->_run_mod_handler('date_format', true, $_tmp, '%Y') : smarty_modifier_date_format($_tmp, '%Y')); ?>
" maxlength="4" />
                </div>
                
                <div style="float:left; width:56px; margin-bottom:5px">- Số DT:</div>
                <div style="float:left; width:20px; margin-bottom:5px">Từ&nbsp;</div>
                <div style="float:left; width:75px; background-color:#FFF; margin-bottom:5px">
                <input type="text" id="sodi_tu" name="sodi_tu" class="text_seek_tiny" value="<?php echo $this->_tpl_vars['vars']['sodi_tu']; ?>
" />
                </div>
                <div style="float:left; width:24px; margin-bottom:5px; margin-left:5px">đến&nbsp;</div>
                <div style="float:left; width:75px; margin-bottom:5px; background-color:#FFF">
                <input type="text" id="sodi_den" name="sodi_den" class="text_seek_tiny" value="<?php echo $this->_tpl_vars['vars']['sodi_den']; ?>
" />
                </div>
                
                <div style="float:left; width:76px; margin-bottom:5px">- Loại văn bản: </div>
                <div style="float:left; width:150px; margin-bottom:5px">
                <select name="docCat_id_fil" id="docCat_id_fil" class="select_seek">
                    <option value="0">Chọn loại văn bản</option>
                    <?php if (isset($this->_sections['qi'])) unset($this->_sections['qi']);
$this->_sections['qi']['name'] = 'qi';
$this->_sections['qi']['loop'] = is_array($_loop=$this->_tpl_vars['obj_list_dcat']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
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
                    <option value="<?php echo $this->_tpl_vars['obj_list_dcat'][$this->_sections['qi']['index']]->docCat_id; ?>
">-&nbsp;<?php echo $this->_tpl_vars['obj_list_dcat'][$this->_sections['qi']['index']]->docCat_name; ?>
</option>
                    <?php endfor; endif; ?>
                </select>
                </div>
                
                <div style="float:left; width:76px; margin-bottom:5px">- ĐV dự thảo: </div>
                <div style="float:left; width:150px; margin-bottom:5px">
                <select name="department_fil" id="department_fil" class="select_seek">
                    <option value="">Chọn phòng ban</option>
                    <?php if (isset($this->_sections['di'])) unset($this->_sections['di']);
$this->_sections['di']['name'] = 'di';
$this->_sections['di']['loop'] = is_array($_loop=$this->_tpl_vars['obj_list_department']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
$this->_sections['di']['show'] = true;
$this->_sections['di']['max'] = $this->_sections['di']['loop'];
$this->_sections['di']['step'] = 1;
$this->_sections['di']['start'] = $this->_sections['di']['step'] > 0 ? 0 : $this->_sections['di']['loop']-1;
if ($this->_sections['di']['show']) {
    $this->_sections['di']['total'] = $this->_sections['di']['loop'];
    if ($this->_sections['di']['total'] == 0)
        $this->_sections['di']['show'] = false;
} else
    $this->_sections['di']['total'] = 0;
if ($this->_sections['di']['show']):

            for ($this->_sections['di']['index'] = $this->_sections['di']['start'], $this->_sections['di']['iteration'] = 1;
                 $this->_sections['di']['iteration'] <= $this->_sections['di']['total'];
                 $this->_sections['di']['index'] += $this->_sections['di']['step'], $this->_sections['di']['iteration']++):
$this->_sections['di']['rownum'] = $this->_sections['di']['iteration'];
$this->_sections['di']['index_prev'] = $this->_sections['di']['index'] - $this->_sections['di']['step'];
$this->_sections['di']['index_next'] = $this->_sections['di']['index'] + $this->_sections['di']['step'];
$this->_sections['di']['first']      = ($this->_sections['di']['iteration'] == 1);
$this->_sections['di']['last']       = ($this->_sections['di']['iteration'] == $this->_sections['di']['total']);
?>
                    <option value="<?php echo $this->_tpl_vars['obj_list_department'][$this->_sections['di']['index']]->department_id; ?>
"><?php echo $this->_tpl_vars['obj_list_department'][$this->_sections['di']['index']]->department_name; ?>
</option>
                    <?php endfor; endif; ?>
                </select>
                </div>

            </div>
        </legend>
    	<div style="float:left; height:5px; width:100%"></div>
        <div style="float:left; height:25px; width:890px; border-top:1px solid #99bbe8; border-bottom:1px solid #99bbe8 ">
            <div class="tbl_tit" style="width:47px; text-align:center"><b>STT</b></div>	
            <div class="tbl_tit" style="width:95px"><B>&nbsp;Loại văn bản</B></div>
            <div class="tbl_tit" style="width:50px; text-align:right"><B>&nbsp;Số DT&nbsp;</B></div>
            <div class="tbl_tit" style="width:70px"><B>&nbsp;Ngày DT</B></div>
            <div class="tbl_tit" style="width:390px"><B>&nbsp;Trích yếu</B></div>
            <div class="tbl_tit" style="width:50px; text-align:center"><B>Tệp tin</B></div>
            <div class="tbl_tit" style="width:90px;"><B>&nbsp;Tình trạng</B></div>
            <div class="tbl_tit" style="width:59px; text-align:center"><B>Chọn</B></div>
            <div class="tbl_tit" style="width:30px; text-align:center">
            <input type="hidden" name="chon" id="chon_DocDT">
            <input type="checkbox" name="chkall" value="0" onclick="docheck_DocDT(document.frmList_DocDT.chkall.checked,0);">
            </div>
        </div>
        <div style="float:left; width:20px; text-align:right">
        <?php if ($this->_tpl_vars['user_level'] == 2 || $this->_tpl_vars['user_level'] == 9 || $this->_tpl_vars['user_level'] == 10): ?>
        <input type="button" name="del_Items" id='del_Items' value="&nbsp;" onClick="delItems_DocDT('<?php echo $this->_tpl_vars['processurl']; ?>
');" style="width:17px; font-size:12px; background:url(../images/admin/b_drop.png); cursor:pointer" title="Xóa lựa chọn">
        <?php else: ?>
        <input type="button" name="del_Items" id='del_Items' value="&nbsp;" disabled="disabled" style="width:17px; font-size:12px; background:url(../images/admin/b_drop.png); cursor:pointer" title="Xóa lựa chọn">
        <?php endif; ?>
        </div>
        <div style="float:left; <?php if ($this->_tpl_vars['user_level'] == 1 || $this->_tpl_vars['user_level'] == 2 || $this->_tpl_vars['user_level'] == 9 || $this->_tpl_vars['user_level'] == 10): ?>height:272px<?php else: ?>height:405px<?php endif; ?>; width:912px; overflow-y:scroll">
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

            <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:47px; text-align:center"><?php echo $this->_tpl_vars['stt']; ?>
</div>
            <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:95px" title="<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docCat_id; ?>
">&nbsp;
                <?php if (isset($this->_sections['qi'])) unset($this->_sections['qi']);
$this->_sections['qi']['name'] = 'qi';
$this->_sections['qi']['loop'] = is_array($_loop=$this->_tpl_vars['obj_list_dcat']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
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
                    <?php if ($this->_tpl_vars['obj_list_dcat'][$this->_sections['qi']['index']]->docCat_id == $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docCat_id): ?>
                    <?php echo $this->_tpl_vars['obj_list_dcat'][$this->_sections['qi']['index']]->docCat_name; ?>

                    <?php endif; ?>
                <?php endfor; endif; ?>
            </div>
            <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:50px; text-align:right">
               <?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docDT_num; ?>
&nbsp;
            </div>
            <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:70px">
            	&nbsp;<?php echo ((is_array($_tmp=$this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docDT_date)) ? $this->_run_mod_handler('date_format', true, $_tmp, "%d-%m-%Y") : smarty_modifier_date_format($_tmp, "%d-%m-%Y")); ?>

            </div>
            <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:390px; white-space:nowrap" title="<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docDT_desc; ?>
">
            	&nbsp;
                <?php if ($this->_tpl_vars['per_edit'] == 1): ?>
                <a href="javascript: void(0);" onclick="show_me_DocDT(<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docDT_id; ?>
)" ><?php echo ((is_array($_tmp=$this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docDT_desc)) ? $this->_run_mod_handler('str_string_cut', true, $_tmp, '92', '1') : smarty_modifier_str_string_cut($_tmp, '92', '1')); ?>
</a>
                <?php else:  echo ((is_array($_tmp=$this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docDT_desc)) ? $this->_run_mod_handler('str_string_cut', true, $_tmp, '92', '1') : smarty_modifier_str_string_cut($_tmp, '92', '1'));  endif; ?>
            </div>

            <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:50px; text-align:center">
                <?php if ($this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docDT_file == 0 || $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docDT_file == 2): ?>
                <a href='javascript: void(0);' onclick="javascript: show_list_file_dt(<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docDT_id; ?>
)">
                <img src="../images/admin/empty_icon.png" width="14" height="14" border="0"></a>
                <?php else: ?>
                <a href='javascript: void(0);' onclick="javascript: show_list_file_dt(<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docDT_id; ?>
)">
                <img src="../images/admin/folder_icon.png" width="14" height="14" border="0"></a>
                <?php endif; ?>
            </div>
            <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:90px">
                <?php if ($this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docDT_status == 0): ?>
                    &nbsp;Mới nhập
                <?php elseif ($this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docDT_status == 1): ?>
                    &nbsp;Chờ hiệu chỉnh
                <?php elseif ($this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docDT_status == 2): ?>
                    &nbsp;Đã trình ký
                <?php elseif ($this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docDT_status == 3): ?>
                    &nbsp;Đã ký
                <?php else: ?>
                    &nbsp;Đã vào sổ đi
                <?php endif; ?>
            </div>
            <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:29px; text-align:center">
            	<?php if ($this->_tpl_vars['user_level'] == 2 || $this->_tpl_vars['user_level'] == 3 || $this->_tpl_vars['user_level'] == 10): ?>
                <a href='javascript: void(0);' onclick="edit_me_DocDT(<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docDT_id; ?>
)">
                <img src="../images/admin/b_edit.png" width="11" height="11" border="0" title="Sửa"></a>
                <?php else: ?>-<?php endif; ?>
            </div>
            <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:29px; text-align:center">
            	<?php if ($this->_tpl_vars['user_level'] == 2 || $this->_tpl_vars['user_level'] == 3 || $this->_tpl_vars['user_level'] == 10): ?>
                <a href='javascript: void(0)' onClick="delItems_DocDT('<?php echo $this->_tpl_vars['processurl']; ?>
', <?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docDT_id; ?>
);">
                <img src="../images/admin/b_drop.png" width="11" height="11" border="0" title="Xóa"></a>
                <?php else: ?>-<?php endif; ?>
            </div>
            <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:30px; text-align:center">
            	<input type="checkbox" name="chkid" value="<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docDT_id; ?>
" onclick="docheckone_DocDT();">
            </div>
            <?php endfor; endif; ?>
        </div>
        <input type="hidden" id="curpage_DocDT" name="curpage" value="<?php echo $this->_tpl_vars['vars']['curpage']; ?>
" />
    </fieldset>
    </form>
</div>
<!------------------------------------------------- Tool bar --------------------------------------------->
<div id="doc_clear_txt"></div>
<div id="doc_tool_bar">

    <div id="doc_search_area">
    <select name="order" id = "order_DocDT" style="width:120px; font-size:12px; border:1px solid #99bbe8; margin-left:1px" onchange="reloadPage_DocDT('<?php echo $this->_tpl_vars['processurl']; ?>
');">
    <?php if (isset($this->_sections['sli'])) unset($this->_sections['sli']);
$this->_sections['sli']['name'] = 'sli';
$this->_sections['sli']['loop'] = is_array($_loop=$this->_tpl_vars['order_arr']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
$this->_sections['sli']['show'] = true;
$this->_sections['sli']['max'] = $this->_sections['sli']['loop'];
$this->_sections['sli']['step'] = 1;
$this->_sections['sli']['start'] = $this->_sections['sli']['step'] > 0 ? 0 : $this->_sections['sli']['loop']-1;
if ($this->_sections['sli']['show']) {
    $this->_sections['sli']['total'] = $this->_sections['sli']['loop'];
    if ($this->_sections['sli']['total'] == 0)
        $this->_sections['sli']['show'] = false;
} else
    $this->_sections['sli']['total'] = 0;
if ($this->_sections['sli']['show']):

            for ($this->_sections['sli']['index'] = $this->_sections['sli']['start'], $this->_sections['sli']['iteration'] = 1;
                 $this->_sections['sli']['iteration'] <= $this->_sections['sli']['total'];
                 $this->_sections['sli']['index'] += $this->_sections['sli']['step'], $this->_sections['sli']['iteration']++):
$this->_sections['sli']['rownum'] = $this->_sections['sli']['iteration'];
$this->_sections['sli']['index_prev'] = $this->_sections['sli']['index'] - $this->_sections['sli']['step'];
$this->_sections['sli']['index_next'] = $this->_sections['sli']['index'] + $this->_sections['sli']['step'];
$this->_sections['sli']['first']      = ($this->_sections['sli']['iteration'] == 1);
$this->_sections['sli']['last']       = ($this->_sections['sli']['iteration'] == $this->_sections['sli']['total']);
?>
        <option value="<?php echo $this->_sections['sli']['index']; ?>
" <?php if ($this->_sections['sli']['index'] == $this->_tpl_vars['vars']['order']): ?>selected<?php endif; ?> >
        <?php echo $this->_tpl_vars['order_arr'][$this->_sections['sli']['index']]; ?>

        </option>
    <?php endfor; endif; ?>
    </select>
    </div>
    
    <div style="float:left; width:12px; background-image:url(<?php echo $this->_tpl_vars['css_path']; ?>
gach_doc.png)">&nbsp;</div>
    <div id="doc_page_area">
    <?php if ($this->_tpl_vars['vars']['curpage'] == 1): ?>
    	<img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_first_page.png" class="img_all">
    	<img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_pre_page.png" class="img_all">
    <?php else: ?>
    <a href="javascript: void(0)" id="first_page" onclick="gotoPage_DocDT('<?php echo $this->_tpl_vars['processurl']; ?>
',parseInt(1));" title="Trang đầu">
    	<img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_first_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="pre_page" onclick="gotoPage_DocDT('<?php echo $this->_tpl_vars['processurl']; ?>
',parseInt(document.getElementById('page_DocDT').value)-parseInt(1));" title="Trang trước">
    	<img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_pre_page.png" class="img_all">
    </a>
    <?php endif; ?>
    </div>
    <div style="float:left; line-height:19px">
        <div style="float:left; width:35px">Trang</div> 
        <div style="float:left; width:35px">
        <input type="text" value="<?php echo $this->_tpl_vars['vars']['curpage']; ?>
" name="page" id="page_DocDT" onblur=" gotoPage_DocDT('<?php echo $this->_tpl_vars['processurl']; ?>
',this.value);" style="width:30px; font-size:12px; height:15px; border:1px solid #99bbe8">
        </div>
        <div style="float:left; width:42px"> / <?php echo $this->_tpl_vars['num_page']; ?>
</div>
    </div>
    <div id="doc_page_area">
    <?php if ($this->_tpl_vars['vars']['curpage'] == $this->_tpl_vars['num_page']): ?>
    	<img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_next_page.png" class="img_all">
        <img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_last_page.png" class="img_all">
    <?php else: ?>
    <a href="javascript: void(0)" id="next_page" onclick="gotoPage_DocDT('<?php echo $this->_tpl_vars['processurl']; ?>
',parseInt(document.getElementById('page_DocDT').value)+parseInt(1));" title="Trang tiếp">
    	<img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_next_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="last_page" onclick="gotoPage_DocDT('<?php echo $this->_tpl_vars['processurl']; ?>
',parseInt(<?php echo $this->_tpl_vars['num_page']; ?>
));" title="Trang cuối">
    	<img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_last_page.png" class="img_all">
    </a>
    <?php endif; ?>
    </div>
    
    <div style="float:left; width:12px; background-image:url(<?php echo $this->_tpl_vars['css_path']; ?>
gach_doc.png)">&nbsp;</div>
    <div style="float:left; width:15px">
    <a href="javascript: void(0)" id="a_ref_DocDT" title="Tải lại"><img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_refresh.png" class="img_all"></a>
    </div>
    
    <div style="float:left; width:12px; background-image:url(<?php echo $this->_tpl_vars['css_path']; ?>
gach_doc.png)">&nbsp;</div>
    <div style="float:right; line-height:19px; margin-right:2px">
        <div style="float:left; width:40px">Xem</div>
        <div style="float:left; width:52px">
            <select name="numresult" id="numresult_DocDT" style="width:50px; font-size:12px; border:1px solid #99bbe8" onchange="reloadPage_DocDT('<?php echo $this->_tpl_vars['processurl']; ?>
');">
                <?php if (isset($this->_sections['sli'])) unset($this->_sections['sli']);
$this->_sections['sli']['name'] = 'sli';
$this->_sections['sli']['loop'] = is_array($_loop=$this->_tpl_vars['nrs_arr']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
$this->_sections['sli']['show'] = true;
$this->_sections['sli']['max'] = $this->_sections['sli']['loop'];
$this->_sections['sli']['step'] = 1;
$this->_sections['sli']['start'] = $this->_sections['sli']['step'] > 0 ? 0 : $this->_sections['sli']['loop']-1;
if ($this->_sections['sli']['show']) {
    $this->_sections['sli']['total'] = $this->_sections['sli']['loop'];
    if ($this->_sections['sli']['total'] == 0)
        $this->_sections['sli']['show'] = false;
} else
    $this->_sections['sli']['total'] = 0;
if ($this->_sections['sli']['show']):

            for ($this->_sections['sli']['index'] = $this->_sections['sli']['start'], $this->_sections['sli']['iteration'] = 1;
                 $this->_sections['sli']['iteration'] <= $this->_sections['sli']['total'];
                 $this->_sections['sli']['index'] += $this->_sections['sli']['step'], $this->_sections['sli']['iteration']++):
$this->_sections['sli']['rownum'] = $this->_sections['sli']['iteration'];
$this->_sections['sli']['index_prev'] = $this->_sections['sli']['index'] - $this->_sections['sli']['step'];
$this->_sections['sli']['index_next'] = $this->_sections['sli']['index'] + $this->_sections['sli']['step'];
$this->_sections['sli']['first']      = ($this->_sections['sli']['iteration'] == 1);
$this->_sections['sli']['last']       = ($this->_sections['sli']['iteration'] == $this->_sections['sli']['total']);
?>
                <option value="<?php echo $this->_tpl_vars['nrs_arr'][$this->_sections['sli']['index']]; ?>
" <?php if ($this->_tpl_vars['nrs_arr'][$this->_sections['sli']['index']] == $this->_tpl_vars['vars']['numresult']): ?>selected<?php endif; ?>><?php echo $this->_tpl_vars['nrs_arr'][$this->_sections['sli']['index']]; ?>
 </option>
                <?php endfor; endif; ?>
            </select>
        </div>
        <div style="float:left; margin-right:1px">dòng / trang</div>
    </div>
    
</div>
<?php echo '
<script language="javascript">	
	function add_more(){
		if(document.getElementById(\'div_add_more\').style.display==\'none\')
			document.getElementById(\'div_add_more\').style.display=\'\';
		else document.getElementById(\'div_add_more\').style.display=\'none\';
	}
	
	function show_hide_seek(){
		if(document.getElementById(\'seek_more\').style.display==\'none\')
			document.getElementById(\'seek_more\').style.display=\'\';
		else document.getElementById(\'seek_more\').style.display=\'none\';
	}
	
	function show_hide_filter(){
		if(document.getElementById(\'div_filter\').style.display==\'none\')
			document.getElementById(\'div_filter\').style.display=\'\';
		else document.getElementById(\'div_filter\').style.display=\'none\';
	}
	
	function docheck_DocDT(status,from_){
		var alen=document.frmList_DocDT.elements.length;
		alen=(alen>5)?document.frmList_DocDT.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
			document.frmList_DocDT.chkid[i].checked=status;
		}
		else{
			document.frmList_DocDT.chkid.checked=status;
		}
		if(from_>0) document.frmList_DocDT.chkall.checked=status;
	}
		
	function docheckone_DocDT(){
		var alen=document.frmList_DocDT.elements.length;
		var isChecked=true;
		alen=(alen>4)?document.frmList_DocDT.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_DocDT.chkid[i].checked==false)
					isChecked=false;
		}else{
			if(document.frmList_DocDT.chkid.checked==false)
				isChecked=false;
		}				
		document.frmList_DocDT.chkall.checked=isChecked;
	}
	
	function calculatechon_DocDT(){			
		var strchon="";
		var alen=document.frmList_DocDT.elements.length;				
		alen=(alen>2)?document.frmList_DocDT.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_DocDT.chkid[i].checked==true)
					strchon+=document.frmList_DocDT.chkid[i].value+",";
		}else{
			if(document.frmList_DocDT.chkid.checked==true)
				strchon=document.frmList_DocDT.chkid.value;
		}
		document.frmList_DocDT.chon_DocDT.value=strchon;
	}
	
	function delItems_DocDT(processurl,delStr){
		if (delStr == undefined){
			calculatechon_DocDT();
			delStr = document.getElementById("chon_DocDT").value;
		}
		if (delStr == ""){
			return false;
		}
		if(!confirm("THÔNG BÁO: \\n\\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
			return false;
		}	
		
		var numresult_DocDT,order_DocDT,curpage_DocDT;
		numresult = $("#numresult_DocDT").val();
		order = $("#order_DocDT").val();
		curpage = $("#curpage_DocDT").val();
		
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
				$(\'#doc_content_main\').fadeOut(\'fast\').load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+curpage).fadeIn("fast");
			}
		});
	}
	
	function reloadPage_DocDT(processurl){
		var numresult_DocDT,order_DocDT,cur_pos;
		numresult = $("#numresult_DocDT").val();
		order = $("#order_DocDT").val();
		cur_pos = 0;
		$("#doc_content_main").load(processurl+"&numresult="+numresult+"&order="+order+"&cur_pos="+cur_pos);
	}
	
	function gotoPage_DocDT(processurl,page){
		var numresult_DocDT,order_DocDT,cur_pos;
		numresult = $("#numresult_DocDT").val();
		order = $("#order_DocDT").val();
		//alert(processurl+\'-\'+page+\'-\'+numresult+\'-\'+order);
		$("#doc_content_main").load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+page);
	}
	
	function show_list_file_dt(docDT_id){
		document.getElementById(\'list_file_dt\').style.display=\'block\';
        document.getElementById(\'div_doc\').style.zIndex=\'2000\';
        document.getElementById(\'list_file_dt\').style.zIndex = \'2001\';
		$("#list_file_dt_cont").load("?listDocDTFile&mod=docs"+"&docDT_id="+docDT_id);
	}
	
	function uncheck_fns_DocDT(field,val,id){
		$("#doc_content_main").load("?listDocDT&mod=docs&checkUncheck="+val+"&setfield="+field+"&checkUncheckID="+id);
	}
	
	function sort_me_DocDT(id,val){
		$("#doc_content_main").load("?listDocDT&mod=docs&sort_me=1&docDT_id="+id+"&val="+val);
	}
	
	function search_me_DocDT(){
		var docDT_desc_fs 	= document.getElementById(\'docDT_desc_fs\').value;
		var docDT_code_fs 	= document.getElementById(\'docDT_code_fs\').value;
		var docDT_num_fs 		= document.getElementById(\'docDT_num_fs\').value;
		var department_id_fs 	= document.getElementById(\'department_id_fs\').value;
		var docCat_id_fs 	= document.getElementById(\'docCat_id_fs\').value;
		if (docDT_desc_fs == "" && docDT_code_fs == "" && docDT_num_fs == "" && department_id_fs == 0 && docCat_id_fs == 0 && user_id_fs == 0){
			return false;
		}
		$.post(\'?listDocDT&mod=docs&search_me=1\',
			{
				docDT_desc_fs:docDT_desc_fs,
				docDT_code_fs:docDT_code_fs,
				docDT_num_fs:docDT_num_fs,
				department_id_fs:department_id_fs,
				docCat_id_fs:docCat_id_fs
			},
			function(data){
				$(\'#doc_content_main\').html(data);
				$("#doc_content_main").show();
			}
		);
	}
	
	// ----- ket xuat
	function export_doc(exptype){
		
		var tungay_1 	= document.getElementById(\'tungay_1\').value;
		var tungay_2 	= document.getElementById(\'tungay_2\').value;
		var tungay_3 	= document.getElementById(\'tungay_3\').value;
		
		var denngay_1 	= document.getElementById(\'denngay_1\').value;
		var denngay_2 	= document.getElementById(\'denngay_2\').value;
		var denngay_3 	= document.getElementById(\'denngay_3\').value;
		
		var sodi_tu 	= document.getElementById(\'sodi_tu\').value;
		var sodi_den 	= document.getElementById(\'sodi_den\').value;
		
		var docCat_id_fil 	= document.getElementById(\'docCat_id_fil\').value;
		var department_fil 	= document.getElementById(\'department_fil\').value;
		
		var tungay = tungay_3+\'-\'+tungay_2+\'-\'+tungay_1;
		var denngay = denngay_3+\'-\'+denngay_2+\'-\'+denngay_1;
				
		if ((tungay == "" && denngay == "") && (sodi_tu == "" && sodi_den == "") ){
			return false;
		}
		if(exptype==3){
			document.getElementById(\'div_doc_report\').style.display=\'block\';
			$.post(\'?expDocDTReport&mod=docs&exptype=\'+exptype,
				{
					tungay:tungay,
					denngay:denngay,
					sodi_tu:sodi_tu,
					sodi_den:sodi_den,
					docCat_id_fil:docCat_id_fil,
					department_fil:department_fil
				},
				function(data){
					$(\'#doc_report_content_main\').html(data);
					$("#doc_report_content_main").show();
				}
			);
			$(\'#doc_content_main\').hide();
			$(\'#doc_content_main\').fadeOut(\'fast\').load(\'index.php?listDocDT&mod=docs\').fadeIn("fast");
		}else{
			window.location="?expDocDTReport&mod=docs&exptype="+exptype+"&tungay="+tungay+"&denngay="+denngay;
		}
	}
	
	function edit_me_DocDT(id){
		$("#doc_content_main").load("?listDocDT&mod=docs&edit_me=1&docDT_id="+id);
	}
	
	function show_me_DocDT(id){
		$(\'#div_view_docout\').css({\'display\':\'block\',\'z-index\':\'2010\'});
		$("#list_view_docout_cont").load("?viewDocDT&mod=docs&docDT_id="+id);
	}
		
	$("#a_ref_DocDT").click( function () { 
			$(\'#doc_content_main\').hide();
			$(\'#doc_content_main\').fadeOut(\'fast\').load(\'index.php?listDocDT&mod=docs\').fadeIn("fast");
		});
</script>
'; ?>