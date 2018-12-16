<?php /* Smarty version 2.6.2, created on 2018-12-16 10:29:01
         compiled from E:%5CProjects%5Cwamp64%5Cwww%5Csmarty%5Cprj14.3.3_offices_mekong%5Ccode%5Cmodules%5Cdocs/skin/B_DocOut_tbl.tpl */ ?>
<?php require_once(SMARTY_DIR . 'core' . DIRECTORY_SEPARATOR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'date_format', 'E:\Projects\wamp64\www\smarty\prj14.3.3_offices_mekong\code\modules\docs/skin/B_DocOut_tbl.tpl', 69, false),array('modifier', 'str_string_cut', 'E:\Projects\wamp64\www\smarty\prj14.3.3_offices_mekong\code\modules\docs/skin/B_DocOut_tbl.tpl', 598, false),array('function', 'math', 'E:\Projects\wamp64\www\smarty\prj14.3.3_offices_mekong\code\modules\docs/skin/B_DocOut_tbl.tpl', 562, false),)), $this); ?>
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
		document.frmList_DocOut.docOut_num.focus();
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
	<form method="post" name="frmList_DocOut" action="?listDocOut<?php echo $this->_tpl_vars['vars']['arg']; ?>
" id="frmList_DocOut">
    <?php if ($this->_tpl_vars['user_level'] == 1 || $this->_tpl_vars['user_level'] == 2 || $this->_tpl_vars['user_level'] == 9): ?>
    <!------------------------------------------THEM MOI------------------------------------>
    <fieldset style="width:912px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
        <legend class="legend_list_search">
            Thêm/Chỉnh sửa&nbsp;|&nbsp;Thông báo:&nbsp;
            <span class="msg"><?php echo $this->_tpl_vars['error'];  echo $this->_tpl_vars['complete']; ?>
</span>
            <span id="lblError_DocOut" class="error">(*) là các mục bắt buộc!</span>
        </legend>
    	<table width="98%" cellspacing="0" cellpadding="0" border="0" style="margin-left:5px">
        	<tr height="10"><td colspan="2"></td></tr>
            <tr height="30">
            	<td align="center" width="30%" valign="top">
                	<div style="float:left; width:30%; line-height:25px; text-align:left; color:#F00">Số văn bản <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left">
                    	<input type="text" id="docOut_num" name="docOut_num" value="<?php if ($this->_tpl_vars['obj_info']['docOut_num'] != ''):  echo $this->_tpl_vars['obj_info']['docOut_num'];  else:  echo $this->_tpl_vars['obj_info']['docOut_num_typical'];  endif; ?>"  class="text_short" style="color:#F00" tabindex="1"/>
                    </div>
                    <div style="float:left; width:30%; line-height:25px; text-align:left">Ngày văn bản <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left">
                    	<input type="text" name="docOut_date" id="docOut_date" value="<?php if ($this->_tpl_vars['vars']['docOut_date'] != ''):  echo ((is_array($_tmp=$this->_tpl_vars['obj_info']['docOut_date'])) ? $this->_run_mod_handler('date_format', true, $_tmp, "%d/%m/%Y") : smarty_modifier_date_format($_tmp, "%d/%m/%Y"));  else:  echo ((is_array($_tmp=time())) ? $this->_run_mod_handler('date_format', true, $_tmp, "%d/%m/%Y") : smarty_modifier_date_format($_tmp, "%d/%m/%Y"));  endif; ?>" class="text_time_callender" tabindex="2"/>&nbsp;<img src="../images/admin/img.gif" align="absmiddle" id="date_docOut" style="cursor: pointer; border: 0" title="Chọn ngày trên lịch"/>
                        <?php echo '
						<script type="text/javascript">
                            Calendar.setup({
                                inputField   :   "docOut_date",
                                ifFormat     :   "%d/%m/%Y",
                                button       :   "date_docOut",
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
                    	<?php if ($this->_tpl_vars['user_level'] == 6 || $this->_tpl_vars['user_level'] == 7 || $this->_tpl_vars['user_level'] == 8): ?>
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
                            <?php if ($this->_tpl_vars['obj_list_department'][$this->_sections['qi']['index']]->department_id == $this->_tpl_vars['access_unit_id']): ?>
                            <option value="<?php echo $this->_tpl_vars['obj_list_department'][$this->_sections['qi']['index']]->department_id; ?>
">-&nbsp;<?php echo $this->_tpl_vars['obj_list_department'][$this->_sections['qi']['index']]->department_name; ?>
</option>
                            <?php endif; ?>
                            <?php endfor; endif; ?>
                        </select>
                        <?php else: ?>
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
                        <?php endif; ?>
                        <?php echo '
                        <script language="javascript">
                        $("#department_id").change( function () { 
                             var docCat_id  = $("#docCat_id").val();
                             var docOut_num = $("#docOut_num").val();
                             var department_id = $("#department_id").val();
                             $("#j_docOut_code").load("index.php?B_docOut_code&docCat_id="+docCat_id+"&docOut_num="+docOut_num+"&department_id="+department_id); 
                            });
                        </script>
                        '; ?>

                    </div>
                    <div style="float:left; width:30%; line-height:25px; text-align:left">Số ký hiệu <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left" id="j_docOut_code">
                        <input type="text" id="docOut_code" name="docOut_code" class="text_middle" value="<?php echo $this->_tpl_vars['obj_info']['docOut_code']; ?>
" readonly/>
                    </div>
                    <div style="float:left; width:30%; line-height:25px; text-align:left">Lĩnh vực:</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left">
                    	<input type="text" value="<?php echo $this->_tpl_vars['obj_info']['docField_id']; ?>
" id="docField_id" name="docField_id" class="text_middle" tabindex="5"/>
                        <?php echo '
						<script type="text/javascript">
                        $().ready(function() {
                            $("#docField_id").autocomplete("B_docField_auto.php", {
                                width: 160,
                                matchContains: true,
								selectFirst: true
                            });
                        });
                        </script>
                        '; ?>

                    </div>
                    <div style="float:left; width:30%; line-height:25px; text-align:left">Người ký <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left">
                    	<select name="docOut_signed" id="docOut_signed" class="select_middle" tabindex="6">
                            <option value="0">Chọn người ký</option>
                            <?php if (isset($this->_sections['qi'])) unset($this->_sections['qi']);
$this->_sections['qi']['name'] = 'qi';
$this->_sections['qi']['loop'] = is_array($_loop=$this->_tpl_vars['obj_list_user_bgd']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
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
                            <option value="<?php echo $this->_tpl_vars['obj_list_user_bgd'][$this->_sections['qi']['index']]->user_id; ?>
" <?php if ($this->_tpl_vars['obj_list_user_bgd'][$this->_sections['qi']['index']]->user_id == $this->_tpl_vars['obj_info']['docOut_signed']): ?>selected="selected"<?php endif; ?>>-&nbsp;<?php echo $this->_tpl_vars['obj_list_user_bgd'][$this->_sections['qi']['index']]->user_fullname; ?>
</option>
                            <?php endfor; endif; ?>
                        </select>
                        <?php echo '
						<script type="text/javascript">
                        $("#docOut_signed").change( function () { 
							var docOut_signed = document.getElementById(\'docOut_signed\').value;
							$("#j_user_obj").load("index.php?B_user_obj&docOut_signed="+docOut_signed); 
						});
                        </script>
                        '; ?>

                    </div>
                    <div style="float:left; width:30%; line-height:25px; text-align:left">Chức vụ <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left" id="j_user_obj">
                    	<input type="text" value="<?php echo $this->_tpl_vars['obj_info']['docOut_obj']; ?>
" id="docOut_obj" name="docOut_obj" class="text_middle" tabindex="7" onfocus="hide_message_DocOut();" readonly="readonly"/>
                    </div>
                </td>
                <td align="center" valign="top">
                	<div style="float:left; width:10%; line-height:25px; text-align:left">Trích yếu <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:90%; line-height:25px; text-align:left; height:75px">
                    	<textarea spellcheck="false" name="docOut_desc" id="docOut_desc" cols="30" rows="5" class="text_area_long" onfocus="hide_message_DocOut()" tabindex="8"><?php echo $this->_tpl_vars['obj_info']['docOut_desc']; ?>
</textarea>
                    </div>
                    <div style="float:left; width:10%; line-height:25px; text-align:left">Độ mật:</div>
                    <div style="float:left; width:20%; line-height:25px; text-align:left">
                    	<select name="secret_id" id="secret_id" class="select_short" tabindex="9">
                            <?php if (isset($this->_sections['qi'])) unset($this->_sections['qi']);
$this->_sections['qi']['name'] = 'qi';
$this->_sections['qi']['loop'] = is_array($_loop=$this->_tpl_vars['obj_list_secret']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
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
                            <option value="<?php echo $this->_tpl_vars['obj_list_secret'][$this->_sections['qi']['index']]->secret_id; ?>
" <?php if ($this->_tpl_vars['obj_list_secret'][$this->_sections['qi']['index']]->secret_id == $this->_tpl_vars['obj_info']['secret_id']): ?>selected="selected"<?php endif; ?>>-&nbsp;<?php echo $this->_tpl_vars['obj_list_secret'][$this->_sections['qi']['index']]->secret_name; ?>
</option>
                            <?php endfor; endif; ?>
                        </select>
                    </div>
                    <div style="float:left; width:10%; line-height:25px; text-align:left">Độ khẩn:</div>
                    <div style="float:left; width:20%; line-height:25px; text-align:left">
                    	<select name="important_id" id="important_id" class="select_short" tabindex="10">
                            <?php if (isset($this->_sections['qi'])) unset($this->_sections['qi']);
$this->_sections['qi']['name'] = 'qi';
$this->_sections['qi']['loop'] = is_array($_loop=$this->_tpl_vars['obj_list_important']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
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
                            <option value="<?php echo $this->_tpl_vars['obj_list_important'][$this->_sections['qi']['index']]->important_id; ?>
" <?php if ($this->_tpl_vars['obj_list_important'][$this->_sections['qi']['index']]->important_id == $this->_tpl_vars['obj_info']['important_id']): ?>selected="selected"<?php endif; ?>>-&nbsp;<?php echo $this->_tpl_vars['obj_list_important'][$this->_sections['qi']['index']]->important_name; ?>
</option>
                            <?php endfor; endif; ?>
                        </select>
                    </div>
                    <div style="float:left; width:10%; line-height:25px; text-align:left">Số trang <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:10%; line-height:25px; text-align:left">
                    	<input type="text" id="docOut_pagenum" name="docOut_pagenum" value="<?php echo $this->_tpl_vars['obj_info']['docOut_pagenum']; ?>
" class="text_tiny" tabindex="11"/>
                    </div>
                    <div style="float:left; width:20%; line-height:25px; text-align:left">
                    	&nbsp;<b>(Người nhập: <?php echo $this->_tpl_vars['access_user_name']; ?>
)</b>
                    </div>


                    <!-------------------------------------------------------------------------->
                    <div style="float:left; width:10%; line-height:25px; text-align:left">Lựa chọn <font color="#FF0000">*</font>:<br>nơi nhận<br>hoặc....</div>
                    <?php if ($this->_tpl_vars['obj_info']['unit_name'] != ''): ?>
                        <div id="noinhan_chon" style="float:left; width:90%; line-height:25px; text-align:left; height:76px">
                            <div style="float:left; width:246px; margin-top:2px">
                                <select id="unit_move" size="6" multiple="multiple" class="select_middle" style="width:246px; height:69px" tabindex="13">
                                    <?php if (isset($this->_sections['qi'])) unset($this->_sections['qi']);
$this->_sections['qi']['name'] = 'qi';
$this->_sections['qi']['loop'] = is_array($_loop=$this->_tpl_vars['obj_list_unit_notin']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
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
                                        <option value="<?php echo $this->_tpl_vars['obj_list_unit_notin'][$this->_sections['qi']['index']]->unit_id; ?>
">-&nbsp;<?php echo $this->_tpl_vars['obj_list_unit_notin'][$this->_sections['qi']['index']]->unit_name; ?>
</option>
                                    <?php endfor; endif; ?>
                                </select>
                            </div>
                            <div style="float:left; width:60px">
                                <div style="float:left; padding-left:10px; padding-top:10px">
                                    <input type="button" name="addto" onClick="listbox_moveacross('unit_move', 'unit_name')" value="&gt;&gt;" class="button_small"></div>
                                <div style="float:left; padding-left:10px">
                                    <input type="button" name="addto" onClick="listbox_moveacross('unit_name', 'unit_move')" value="&lt;&lt;" class="button_small"></div>
                            </div>
                            <div style="float:left; width:246px; margin-top:2px">
                                <select name="unit_name" id="unit_name" size="6" multiple="multiple" class="select_middle" style="width:246px; height:69px">
                                    <?php if (isset($this->_sections['qi'])) unset($this->_sections['qi']);
$this->_sections['qi']['name'] = 'qi';
$this->_sections['qi']['loop'] = is_array($_loop=$this->_tpl_vars['obj_list_unit_in']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
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
                                        <option value="<?php echo $this->_tpl_vars['obj_list_unit_in'][$this->_sections['qi']['index']]->unit_id; ?>
">-&nbsp;<?php echo $this->_tpl_vars['obj_list_unit_in'][$this->_sections['qi']['index']]->unit_name; ?>
</option>
                                    <?php endfor; endif; ?>
                                </select>
                            </div>
                        </div>
                    <?php else: ?>
                        <div id="noinhan_chon" style="float:left; width:90%; line-height:25px; text-align:left; height:76px">
                            <div style="float:left; width:246px; margin-top:2px">
                                <select id="unit_move" size="6" multiple="multiple" class="select_middle" style="width:246px; height:69px" tabindex="13">
                                    <?php if (isset($this->_sections['qi'])) unset($this->_sections['qi']);
$this->_sections['qi']['name'] = 'qi';
$this->_sections['qi']['loop'] = is_array($_loop=$this->_tpl_vars['obj_list_unit']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
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
                                        <option value="<?php echo $this->_tpl_vars['obj_list_unit'][$this->_sections['qi']['index']]->unit_id; ?>
">-&nbsp;<?php echo $this->_tpl_vars['obj_list_unit'][$this->_sections['qi']['index']]->unit_name; ?>
</option>
                                    <?php endfor; endif; ?>
                                </select>
                            </div>
                            <div style="float:left; width:60px">
                                <div style="float:left; padding-left:10px; padding-top:10px">
                                    <input type="button" name="addto" onClick="listbox_moveacross('unit_move', 'unit_name')" value="&gt;&gt;" class="button_small"></div>
                                <div style="float:left; padding-left:10px">
                                    <input type="button" name="addto" onClick="listbox_moveacross('unit_name', 'unit_move')" value="&lt;&lt;" class="button_small"></div>
                            </div>
                            <div style="float:left; width:246px; margin-top:2px">
                                <select name="unit_name" id="unit_name" size="6" multiple="multiple" class="select_middle" style="width:246px; height:69px"></select>
                            </div>
                        </div>
                    <?php endif; ?>
                    <!------------------------------------------------------------------------------------->

                    <div style="float: left; width:100%">
                    <div style="float:left; width:10%; line-height:25px; text-align:left">Nhập tay:</div>
                    <div style="float:left; width:57.5%; line-height:25px; text-align:left">
                    	<input type="text" id="unit_name_02" name="unit_name_02" size="10" value="<?php echo $this->_tpl_vars['obj_info']['unit_name_02']; ?>
" class="text_long" tabindex="12"/>
                    </div>

                    <div style="float:left; width:4.5%; line-height:25px; text-align:left">
                    <a href="javascript: void(0);" onClick="add_more()" style="text-decoration:none; color:#F00">
                	<div style="float:left; margin-left:3px">
                    <img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_keo_dai.png" class="img_all"></div></a>
                    </div>
                    <div style="float:left; width:26.5%; line-height:25px; text-align:right">
                    	<input type="button" name="btnSub_DocOut" id="btnSub_DocOut" value="Ghi lại" class="button" tabindex="13"/>
                        <input type="hidden" name="docOut_id" id="docOut_id" value="<?php echo $this->_tpl_vars['obj_info']['docOut_id']; ?>
">
                        <input type="hidden" name="docOut_file" id="docOut_file" value="<?php echo $this->_tpl_vars['obj_info']['docOut_file']; ?>
">
                        <input type="hidden" name="input_per" id="input_per" value="<?php echo $this->_tpl_vars['obj_info']['input_per']; ?>
">
                        <input type="reset" name="Reset" value="Hủy bỏ" class="button" tabindex="14"/>
                        <?php echo '
                        <script language="javascript">
                            function hide_message_DocOut(){
                                $(\'#lblMessage_DocOut\').hide();
                                $(\'#lblError_DocOut\').hide();
                            }
                            
                            $(function() {
                            $(\'.error\').hide();
                            $(\'#lblMessage_DocOut\').hide();
                             
                            $("#btnSub_DocOut").click(function() {
                                $(\'.error\').hide();
                                 
                                var $form = $("#frmList_DocOut");
                                var docOut_num = $form.find(\'input#docOut_num\').val();
								var docOut_date = $form.find(\'input#docOut_date\').val();
								var docCat_id = $form.find(\'select#docCat_id :selected\').val();
								var department_id = $form.find(\'select#department_id :selected\').val();
								var docOut_code = $form.find(\'input#docOut_code\').val();
								var docField_id = $form.find(\'input#docField_id\').val();
								var docOut_signed = $form.find(\'select#docOut_signed :selected\').val();
								var docOut_obj = $form.find(\'input#docOut_obj\').val();
								var docOut_desc = $form.find(\'textarea#docOut_desc\').val();docOut_pagenum
								var secret_id = $form.find(\'select#secret_id :selected\').val();
								var important_id = $form.find(\'select#important_id :selected\').val();
								var docOut_pagenum = $form.find(\'input#docOut_pagenum\').val();
								// --- get data from list box
								var items = [];
								$(\'#unit_name option:selected\').each(function(){ items.push($(this).val()); });
								var unit_name = items.join(\', \');
								var unit_name_02 = $form.find(\'input#unit_name_02\').val(); // tu nhap
								// --- get data from list box
								var items = [];
								$(\'#interdisci_name option:selected\').each(function(){ items.push($(this).val()); });
								var interdisci_name = items.join(\', \');
								var interdisci_name_02 = $form.find(\'input#interdisci_name_02\').val(); // tu nhap
								
								var docOut_id = $form.find(\'input#docOut_id\').val();
								var docOut_file = $form.find(\'input#docOut_file\').val();
								var input_per = $form.find(\'input#input_per\').val();
								
                                //begin validate form
                                if (docOut_num == "" || docOut_date == "" || docCat_id == 0 || department_id == 0 || docOut_code == "" || docOut_signed == "" || docOut_obj == "" || docOut_desc == "" || docOut_pagenum == "" ||( unit_name == "" && unit_name_02 == "")){
                                    $(\'#lblError_DocOut\').show();
                                }
                                else{
									$.post(\'index.php?listDocOut&mod=docs&add_edit=1\',
										{
											docOut_num:docOut_num,
											docOut_date:docOut_date,
											docCat_id:docCat_id,
											department_id:department_id,
											docOut_code:docOut_code,
											docField_id:docField_id,
											docOut_signed:docOut_signed,
											docOut_obj:docOut_obj,
											docOut_desc:docOut_desc,
											secret_id:secret_id,
											important_id:important_id,
											docOut_pagenum:docOut_pagenum,
											unit_name:unit_name,
											unit_name_02:unit_name_02,
											interdisci_name:interdisci_name,
											interdisci_name_02:interdisci_name_02,
											
											docOut_id:docOut_id,
											docOut_file:docOut_file,
											input_per:input_per,
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
    <fieldset style="width:912px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; <?php if ($this->_tpl_vars['user_level'] == 1 || $this->_tpl_vars['user_level'] == 2 || $this->_tpl_vars['user_level'] == 9): ?>height:223px<?php else: ?>height:462px<?php endif; ?>">
        <legend class="legend_list" style="width:865px">
            <div style="width:130px; float:left">Danh sách: <?php echo $this->_tpl_vars['total_num_result']; ?>
</div>
            <div style="width:70px; float:left">&nbsp;|&nbsp;Tìm kiếm:&nbsp;</div>
            <div style="width:380px; float:left; font-weight:normal">
                <div style="float:left">
                    <div style="float:left; width:60px">- Trích yếu: </div>
                    <div style="float:left; width:300px">
                    <input type="text" id="docOut_desc_fs" name="docOut_desc_fs" class="text_seek_long" value="<?php echo $this->_tpl_vars['vars']['docOut_desc_fs']; ?>
"/>
                    </div>
                    <input type="hidden" id="processurl" value="<?php echo $this->_tpl_vars['processurl']; ?>
" />
                </div>
                <a href="javascript: void(0);" onClick="show_hide_seek()" style="text-decoration:none; color:#F00">
                <div style="float:left; margin-left:3px"><img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_keo_dai.png" class="img_all"></div></a>
            </div>
            <div style="width:380px; float:left; font-weight:normal; position:absolute; display:none; margin:23px 0 0 200px; background-color:#ccd8e7; border:1px solid #99bbe8; border-top:none" id="seek_more">
                <div style="float:left; width:60px; margin-bottom:5px">- Ký hiệu: </div>
                <div style="float:left; width:80px; margin-bottom:5px">
                <input type="text" id="docOut_code_fs" name="docOut_code_fs" class="text_seek_tiny" value="<?php echo $this->_tpl_vars['vars']['docOut_code_fs']; ?>
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
                <div style="float:left; width:60px; margin-bottom:5px">- Số đi: </div>
                <div style="float:left; width:80px; margin-bottom:5px">
                <input type="text" id="docOut_num_fs" name="docOut_num_fs" class="text_seek_tiny" value="<?php echo $this->_tpl_vars['vars']['docOut_num_fs']; ?>
" />
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
                <div style="float:left; width:79px; margin-bottom:5px">- Người ký: </div>
                <div style="float:left; width:155px; margin-bottom:5px">
                <select name="user_id_fs" id="user_id_fs" class="text_seek_middle">
                    <option value="0">Chọn người ký</option>
                    <?php if (isset($this->_sections['qi'])) unset($this->_sections['qi']);
$this->_sections['qi']['name'] = 'qi';
$this->_sections['qi']['loop'] = is_array($_loop=$this->_tpl_vars['obj_list_user_bgd']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
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
                    <option value="<?php echo $this->_tpl_vars['obj_list_user_bgd'][$this->_sections['qi']['index']]->user_id; ?>
">-&nbsp;<?php echo $this->_tpl_vars['obj_list_user_bgd'][$this->_sections['qi']['index']]->user_fullname; ?>
</option>
                    <?php endfor; endif; ?>
                </select>
                </div>
                
            </div>
            <div style="width:45px; float:left">
                <input type="button" name="btnSeek" id="btnSeek" value="Tìm >>" class="button_seek" onclick="search_me_DocOut()" />
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
            <div style="width:260px; float:left; font-weight:normal; position:absolute; display:none; margin:23px 0 0 604px; background-color:#ccd8e7; border:1px solid #99bbe8; border-top:none" id="div_filter">
                <div style="float:left; width:56px; margin-bottom:5px">- Ban hành:</div>
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
                
                <div style="float:left; width:56px; margin-bottom:5px">- Số đi:</div>
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
                
                <div style="float:left; width:76px; margin-bottom:5px">- Loại sổ: </div>
                <div style="float:left; width:150px; margin-bottom:5px">
                <select name="docOut_typical" id="docOut_typical" class="select_seek">
                    <option value="0" <?php if ($this->_tpl_vars['docOut_typical'] == 0): ?> selected="selected"<?php endif; ?>>Sổ thường</option>
                    <option value="1" <?php if ($this->_tpl_vars['docOut_typical'] == 1): ?> selected="selected"<?php endif; ?>>Sổ giấy mời</option>
                </select>
                </div>
            </div>
        </legend>
    	<div style="float:left; height:5px; width:100%"></div>
        <div style="float:left; height:25px; width:890px; border-top:1px solid #99bbe8; border-bottom:1px solid #99bbe8 ">
            <div class="tbl_tit" style="width:47px; text-align:center"><b>STT</b></div>	
            <div class="tbl_tit" style="width:95px"><B>&nbsp;Loại văn bản</B></div>
            <div class="tbl_tit" style="width:50px; text-align:right"><B>&nbsp;Số đi&nbsp;</B></div>
            <div class="tbl_tit" style="width:70px"><B>&nbsp;Ký hiệu</B></div>
            <div class="tbl_tit" style="width:70px"><B>&nbsp;Ngày tháng</B></div>
            <div class="tbl_tit" style="width:259px"><B>&nbsp;Trích yếu</B></div>
            <div class="tbl_tit" style="width:150px"><B>&nbsp;Nơi nhận</B></div>
            <div class="tbl_tit" style="width:50px; text-align:center"><B>Tệp tin</B></div>
            <div class="tbl_tit" style="width:59px; text-align:center"><B>Chọn</B></div>
            <div class="tbl_tit" style="width:30px; text-align:center">
            <input type="hidden" name="chon" id="chon_DocOut">
            <input type="checkbox" name="chkall" value="0" onclick="docheck_DocOut(document.frmList_DocOut.chkall.checked,0);">
            </div>
        </div>
        <div style="float:left; width:20px; text-align:right">
        <?php if ($this->_tpl_vars['user_level'] == 2 || $this->_tpl_vars['user_level'] == 9): ?>
        <input type="button" name="del_Items" id='del_Items' value="&nbsp;" onClick="delItems_DocOut('<?php echo $this->_tpl_vars['processurl']; ?>
');" style="width:17px; font-size:12px; background:url(../images/admin/b_drop.png); cursor:pointer" title="Xóa lựa chọn">
        <?php else: ?>
        <input type="button" name="del_Items" id='del_Items' value="&nbsp;" disabled="disabled" style="width:17px; font-size:12px; background:url(../images/admin/b_drop.png); cursor:pointer" title="Xóa lựa chọn">
        <?php endif; ?>
        </div>
        <div style="float:left; <?php if ($this->_tpl_vars['user_level'] == 1 || $this->_tpl_vars['user_level'] == 2 || $this->_tpl_vars['user_level'] == 9): ?>height:166px<?php else: ?>height:405px<?php endif; ?>; width:912px; overflow-y:scroll">
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
            	&nbsp;
                <?php if ($this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docOut_num != '' && $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docOut_num != 0): ?>
                <?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docOut_num; ?>

                <?php else: ?>
                <?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docOut_num_typical; ?>

                <?php endif; ?>
                &nbsp;
            </div>
            <?php 
            $mystr = $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docOut_code;
            $code_str = substr($mystr,strpos($mystr,'/')+1,strlen($mystr) - strpos($mystr,'/')+1);
             ?>
            <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:70px; white-space:nowrap" title="<?php echo $code_str ?>">&nbsp;
                <?php echo fnsSubstr($code_str,7,1); ?>
            </div>
            <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:70px">
            	&nbsp;<?php echo ((is_array($_tmp=$this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docOut_date)) ? $this->_run_mod_handler('date_format', true, $_tmp, "%d-%m-%Y") : smarty_modifier_date_format($_tmp, "%d-%m-%Y")); ?>

            </div>
            <?php if (isset($this->_sections['qi'])) unset($this->_sections['qi']);
$this->_sections['qi']['name'] = 'qi';
$this->_sections['qi']['loop'] = is_array($_loop=$this->_tpl_vars['obj_list_user_bgd']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
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
                <?php if ($this->_tpl_vars['obj_list_user_bgd'][$this->_sections['qi']['index']]->user_id == $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docOut_signed): ?>
                	<?php $this->assign('nguoi_ky', $this->_tpl_vars['obj_list_user_bgd'][$this->_sections['qi']['index']]->user_fullname); ?>
                <?php endif; ?>
            <?php endfor; endif; ?>
            <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:259px; white-space:nowrap" title="<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docOut_desc; ?>
&nbsp;(Người ký: <?php echo $this->_tpl_vars['nguoi_ky']; ?>
 - <?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docOut_obj; ?>
)">
            	&nbsp;
                <?php if ($this->_tpl_vars['per_edit'] == 1): ?>
                <a href="javascript: void(0);" onclick="show_me_DocOut(<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docOut_id; ?>
)" ><?php echo ((is_array($_tmp=$this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docOut_desc)) ? $this->_run_mod_handler('str_string_cut', true, $_tmp, '62', '1') : smarty_modifier_str_string_cut($_tmp, '62', '1')); ?>
</a>
                <?php else:  echo ((is_array($_tmp=$this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docOut_desc)) ? $this->_run_mod_handler('str_string_cut', true, $_tmp, '62', '1') : smarty_modifier_str_string_cut($_tmp, '62', '1'));  endif; ?>
            </div>
            <?php if ($this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->unit_name != ''): ?>
            <?php 
                $sql = "select * from tbl_units where unit_id in(".$this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->unit_name.")";
                $result = mysql_query($sql) or die($sql);
                $unit_name_str = "";
                $i=0;
                while($row = mysql_fetch_array($result)):
                    if($i < mysql_num_rows($result)):
                        $unit_name_str .=  $row['unit_name'].", ";
                    else:
                        $unit_name_str .= $row['unit_name'];
                    endif;
                    $i++;
                endwhile;
                
             ?>
            <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:150px; white-space:nowrap" title="<?php echo $unit_name_str ?>">&nbsp;<?php echo fnsSubstr($unit_name_str,33,1); ?></div>
            <?php else: ?>
            <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:150px; white-space:nowrap" title="<?php echo $unit_name_02 ?>">&nbsp;<?php echo ((is_array($_tmp=$this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->unit_name_02)) ? $this->_run_mod_handler('str_string_cut', true, $_tmp, '33', '1') : smarty_modifier_str_string_cut($_tmp, '33', '1')); ?>
</div>
            <?php endif; ?>
            <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:50px; text-align:center">
                <?php if ($this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docOut_file == 0 || $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docOut_file == 2): ?>
                <a href='javascript: void(0);' onclick="javascript: show_list_file(<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docOut_id; ?>
)">
                <img src="../images/admin/empty_icon.png" width="14" height="14" border="0"></a>
                <?php else: ?>
                <a href='javascript: void(0);' onclick="javascript: show_list_file(<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docOut_id; ?>
)">
                <img src="../images/admin/folder_icon.png" width="14" height="14" border="0"></a>
                <?php endif; ?>
            </div>
            <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:29px; text-align:center">
            	<?php if ($this->_tpl_vars['user_level'] == 2 || $this->_tpl_vars['user_level'] == 9): ?>
                <a href='javascript: void(0);' onclick="edit_me_DocOut(<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docOut_id; ?>
)">
                <img src="../images/admin/b_edit.png" width="11" height="11" border="0" title="Sửa"></a>
                <?php else: ?>-<?php endif; ?>
            </div>
            <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:29px; text-align:center">
            	<?php if ($this->_tpl_vars['user_level'] == 2 || $this->_tpl_vars['user_level'] == 9): ?>
                <a href='javascript: void(0)' onClick="delItems_DocOut('<?php echo $this->_tpl_vars['processurl']; ?>
', <?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docOut_id; ?>
);">
                <img src="../images/admin/b_drop.png" width="11" height="11" border="0" title="Xóa"></a>
                <?php else: ?>-<?php endif; ?>
            </div>
            <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:30px; text-align:center">
            	<input type="checkbox" name="chkid" value="<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docOut_id; ?>
" onclick="docheckone_DocOut();">
            </div>
            <?php endfor; endif; ?>
        </div>
        <input type="hidden" id="curpage_DocOut" name="curpage" value="<?php echo $this->_tpl_vars['vars']['curpage']; ?>
" />
    </fieldset>
    </form>
</div>
<!------------------------------------------------- Tool bar --------------------------------------------->
<div id="doc_clear_txt"></div>
<div id="doc_tool_bar">

    <div id="doc_search_area">
    <select name="order" id = "order_DocOut" style="width:120px; font-size:12px; border:1px solid #99bbe8; margin-left:1px" onchange="reloadPage_DocOut('<?php echo $this->_tpl_vars['processurl']; ?>
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
    <a href="javascript: void(0)" id="first_page" onclick="gotoPage_DocOut('<?php echo $this->_tpl_vars['processurl']; ?>
',parseInt(1));" title="Trang đầu">
    	<img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_first_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="pre_page" onclick="gotoPage_DocOut('<?php echo $this->_tpl_vars['processurl']; ?>
',parseInt(document.getElementById('page_DocOut').value)-parseInt(1));" title="Trang trước">
    	<img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_pre_page.png" class="img_all">
    </a>
    <?php endif; ?>
    </div>
    <div style="float:left; line-height:19px">
        <div style="float:left; width:35px">Trang</div> 
        <div style="float:left; width:35px">
        <input type="text" value="<?php echo $this->_tpl_vars['vars']['curpage']; ?>
" name="page" id="page_DocOut" onblur=" gotoPage_DocOut('<?php echo $this->_tpl_vars['processurl']; ?>
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
    <a href="javascript: void(0)" id="next_page" onclick="gotoPage_DocOut('<?php echo $this->_tpl_vars['processurl']; ?>
',parseInt(document.getElementById('page_DocOut').value)+parseInt(1));" title="Trang tiếp">
    	<img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_next_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="last_page" onclick="gotoPage_DocOut('<?php echo $this->_tpl_vars['processurl']; ?>
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
    <a href="javascript: void(0)" id="a_ref_DocOut" title="Tải lại"><img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_refresh.png" class="img_all"></a>
    </div>
    
    <div style="float:left; width:12px; background-image:url(<?php echo $this->_tpl_vars['css_path']; ?>
gach_doc.png)">&nbsp;</div>
    <div style="float:right; line-height:19px; margin-right:2px">
        <div style="float:left; width:40px">Xem</div>
        <div style="float:left; width:52px">
            <select name="numresult" id="numresult_DocOut" style="width:50px; font-size:12px; border:1px solid #99bbe8" onchange="reloadPage_DocOut('<?php echo $this->_tpl_vars['processurl']; ?>
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
	
	function docheck_DocOut(status,from_){
		var alen=document.frmList_DocOut.elements.length;
		alen=(alen>5)?document.frmList_DocOut.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
			document.frmList_DocOut.chkid[i].checked=status;
		}
		else{
			document.frmList_DocOut.chkid.checked=status;
		}
		if(from_>0) document.frmList_DocOut.chkall.checked=status;
	}
		
	function docheckone_DocOut(){
		var alen=document.frmList_DocOut.elements.length;
		var isChecked=true;
		alen=(alen>4)?document.frmList_DocOut.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_DocOut.chkid[i].checked==false)
					isChecked=false;
		}else{
			if(document.frmList_DocOut.chkid.checked==false)
				isChecked=false;
		}				
		document.frmList_DocOut.chkall.checked=isChecked;
	}
	
	function calculatechon_DocOut(){			
		var strchon="";
		var alen=document.frmList_DocOut.elements.length;				
		alen=(alen>2)?document.frmList_DocOut.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_DocOut.chkid[i].checked==true)
					strchon+=document.frmList_DocOut.chkid[i].value+",";
		}else{
			if(document.frmList_DocOut.chkid.checked==true)
				strchon=document.frmList_DocOut.chkid.value;
		}
		document.frmList_DocOut.chon_DocOut.value=strchon;
	}
	
	function delItems_DocOut(processurl,delStr){
		if (delStr == undefined){
			calculatechon_DocOut();
			delStr = document.getElementById("chon_DocOut").value;
		}
		if (delStr == ""){
			return false;
		}
		if(!confirm("THÔNG BÁO: \\n\\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
			return false;
		}	
		
		var numresult_DocOut,order_DocOut,curpage_DocOut;
		numresult = $("#numresult_DocOut").val();
		order = $("#order_DocOut").val();
		curpage = $("#curpage_DocOut").val();
		
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
	
	function reloadPage_DocOut(processurl){
		var numresult_DocOut,order_DocOut,cur_pos;
		numresult = $("#numresult_DocOut").val();
		order = $("#order_DocOut").val();
		cur_pos = 0;
		$("#doc_content_main").load(processurl+"&numresult="+numresult+"&order="+order+"&cur_pos="+cur_pos);
	}
	
	function gotoPage_DocOut(processurl,page){
		var numresult_DocOut,order_DocOut,cur_pos;
		numresult = $("#numresult_DocOut").val();
		order = $("#order_DocOut").val();
		//alert(processurl+\'-\'+page+\'-\'+numresult+\'-\'+order);
		$("#doc_content_main").load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+page);
	}
	
	function show_list_file(docOut_id){
		document.getElementById(\'list_file\').style.display=\'block\';
		$("#list_file_cont").load("?listDocOutFile&mod=docs"+"&docOut_id="+docOut_id);
	}
	
	function uncheck_fns_DocOut(field,val,id){
		$("#doc_content_main").load("?listDocOut&mod=docs&checkUncheck="+val+"&setfield="+field+"&checkUncheckID="+id);
	}
	
	function sort_me_DocOut(id,val){
		$("#doc_content_main").load("?listDocOut&mod=docs&sort_me=1&docOut_id="+id+"&val="+val);
	}
	
	function search_me_DocOut(){
		var docOut_desc_fs 	= document.getElementById(\'docOut_desc_fs\').value;
		var docOut_code_fs 	= document.getElementById(\'docOut_code_fs\').value;
		var docOut_num_fs 		= document.getElementById(\'docOut_num_fs\').value;
		var department_id_fs 	= document.getElementById(\'department_id_fs\').value;
		var docCat_id_fs 	= document.getElementById(\'docCat_id_fs\').value;
		if (docOut_desc_fs == "" && docOut_code_fs == "" && docOut_num_fs == "" && department_id_fs == 0 && docCat_id_fs == 0 && user_id_fs == 0){
			return false;
		}
		$.post(\'?listDocOut&mod=docs&search_me=1\',
			{
				docOut_desc_fs:docOut_desc_fs,
				docOut_code_fs:docOut_code_fs,
				docOut_num_fs:docOut_num_fs,
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
		
		var docOut_typical 	= document.getElementById(\'docOut_typical\').value;
		var docCat_id_fil 	= document.getElementById(\'docCat_id_fil\').value;
		var department_fil 	= document.getElementById(\'department_fil\').value;
		
		var tungay = tungay_3+\'-\'+tungay_2+\'-\'+tungay_1;
		var denngay = denngay_3+\'-\'+denngay_2+\'-\'+denngay_1;
				
		if ((tungay == "" && denngay == "") && (sodi_tu == "" && sodi_den == "") ){
			return false;
		}
		if(exptype==3){
			document.getElementById(\'div_doc_report\').style.display=\'block\';
			$.post(\'?expDocOutReport&mod=docs&exptype=\'+exptype,
				{
					tungay:tungay,
					denngay:denngay,
					sodi_tu:sodi_tu,
					sodi_den:sodi_den,
					docOut_typical:docOut_typical,
					docCat_id_fil:docCat_id_fil,
					department_fil:department_fil
				},
				function(data){
					$(\'#doc_report_content_main\').html(data);
					$("#doc_report_content_main").show();
				}
			);
			$(\'#doc_content_main\').hide();
			$(\'#doc_content_main\').fadeOut(\'fast\').load(\'index.php?listDocOut&mod=docs\').fadeIn("fast");
		}else{
			window.location="?expDocOutReport&mod=docs&exptype="+exptype+"&tungay="+tungay+"&denngay="+denngay;
		}
	}
	
	function edit_me_DocOut(id){
		$("#doc_content_main").load("?listDocOut&mod=docs&edit_me=1&docOut_id="+id);
	}
	
	function show_me_DocOut(id){
		$(\'#div_view_docout\').css({\'display\':\'block\',\'z-index\':\'2010\'});
		$("#list_view_docout_cont").load("?viewDocOut&mod=docs&docOut_id="+id);
	}
		
	$("#a_ref_DocOut").click( function () { 
			$(\'#doc_content_main\').hide();
			$(\'#doc_content_main\').fadeOut(\'fast\').load(\'index.php?listDocOut&mod=docs\').fadeIn("fast");
		});
</script>
'; ?>