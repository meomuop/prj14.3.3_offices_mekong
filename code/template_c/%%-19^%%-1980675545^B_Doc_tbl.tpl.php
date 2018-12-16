<?php /* Smarty version 2.6.2, created on 2018-12-16 09:50:07
         compiled from E:%5CProjects%5Cwamp64%5Cwww%5Csmarty%5Cprj14.3.3_offices_mekong%5Ccode%5Cmodules%5Cdocs/skin/B_Doc_tbl.tpl */ ?>
<?php require_once(SMARTY_DIR . 'core' . DIRECTORY_SEPARATOR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'date_format', 'E:\Projects\wamp64\www\smarty\prj14.3.3_offices_mekong\code\modules\docs/skin/B_Doc_tbl.tpl', 66, false),array('modifier', 'str_string_cut', 'E:\Projects\wamp64\www\smarty\prj14.3.3_offices_mekong\code\modules\docs/skin/B_Doc_tbl.tpl', 512, false),array('function', 'math', 'E:\Projects\wamp64\www\smarty\prj14.3.3_offices_mekong\code\modules\docs/skin/B_Doc_tbl.tpl', 505, false),)), $this); ?>
<?php echo '
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
'; ?>

<div id="doc_content_insign">
	<form method="post" name="frmList_Doc" action="?listDoc<?php echo $this->_tpl_vars['vars']['arg']; ?>
" id="frmList_Doc">
    <!------------------------------------------THEM MOI------------------------------------>
    <fieldset style="width:1012px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
        <legend class="legend_list_search">
            Thêm/Chỉnh sửa&nbsp;|&nbsp;Thông báo:&nbsp;
            <span id="mess_doc" class="msg"><?php echo $this->_tpl_vars['error'];  echo $this->_tpl_vars['complete']; ?>
</span>
            <span id="lblError_Doc" class="error">(*) là các mục bắt buộc!</span>
        </legend>
    	<table width="98%" cellspacing="0" cellpadding="0" border="0" style="margin-left:5px">
        	<tr height="10"><td colspan="2"></td></tr>
            <tr height="30">
            	<td align="center" width="30%" valign="top">
                	<div style="float:left; width:30%; line-height:25px; text-align:left">Loại sổ:</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left">
                        <select name="docLevel_id" id="docLevel_id" class="select_middle" tabindex="1">
                            <option value="0">Chọn loại sổ</option>
                            <?php if (isset($this->_sections['qi'])) unset($this->_sections['qi']);
$this->_sections['qi']['name'] = 'qi';
$this->_sections['qi']['loop'] = is_array($_loop=$this->_tpl_vars['obj_list_dlevel']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
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
                            <option value="<?php echo $this->_tpl_vars['obj_list_dlevel'][$this->_sections['qi']['index']]->docLevel_id; ?>
" <?php if ($this->_tpl_vars['obj_list_dlevel'][$this->_sections['qi']['index']]->docLevel_id == $this->_tpl_vars['obj_info']['docLevel_id']): ?>selected="selected"<?php endif; ?>>-&nbsp;<?php echo $this->_tpl_vars['obj_list_dlevel'][$this->_sections['qi']['index']]->docLevel_name; ?>
</option>
                            <?php endfor; endif; ?>
                        </select>
                        <?php echo '
                            <script type="text/javascript">
                                $("#docLevel_id").change(function(){
                                    $("#doc_num_div").load("B_num_auto.php", {docLevel_id: $("#docLevel_id").val()});
                                });
                            </script>
                        '; ?>

                    </div>
                    <div style="float:left; width:30%; line-height:25px; text-align:left">Nơi gửi đến <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left">
                    	<input type="text" value="<?php echo $this->_tpl_vars['obj_info']['unit_name']; ?>
" id="unit_name" name="unit_name" class="text_middle" tabindex="2" onfocus="hide_message_Doc();"/>
                        <?php echo '
						<script type="text/javascript">
                        $().ready(function() {
                            $("#unit_name").autocomplete("B_unit_auto.php", {
                                width: 160,
                                matchContains: true,
                                selectFirst: true
                            });
                        });
                        </script>
                        '; ?>

                    </div>
                    <div style="float:left; width:30%; line-height:25px; text-align:left">Số ký hiệu <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left">
                    	<input type="text" id="doc_code" name="doc_code" class="text_middle" value="<?php echo $this->_tpl_vars['obj_info']['doc_code']; ?>
" tabindex="3" onfocus="hide_message_Doc();"/>
                    </div>
                    <div style="float:left; width:30%; line-height:25px; text-align:left">Ngày ký <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left">
                    	<input type="text" name="doc_signed" id="doc_signed" class="text_time_callender" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['obj_info']['doc_signed'])) ? $this->_run_mod_handler('date_format', true, $_tmp, '%d/%m/%Y') : smarty_modifier_date_format($_tmp, '%d/%m/%Y')); ?>
" tabindex="4" onfocus="hide_message_Doc();"/>&nbsp;<img src="../images/admin/img.gif"  align="absmiddle" id="date_doc_signed" style="cursor: pointer; border: 0" title="Chọn ngày trên lịch"/>
                        <?php echo '
						<script type="text/javascript">
                            Calendar.setup({
                                inputField   :   "doc_signed",
                                ifFormat     :   "%d/%m/%Y",
                                button       :   "date_doc_signed",
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
                    	<input type="text" value="<?php echo $this->_tpl_vars['obj_info']['docCat_id']; ?>
" id="docCat_id" name="docCat_id" class="text_middle" tabindex="5" onfocus="hide_message_Doc();"/>
                        <?php echo '
						<script type="text/javascript">
                        $().ready(function() {
                            $("#docCat_id").autocomplete("B_docCat_auto.php", {
                                width: 160,
                                matchContains: true,
								selectFirst: true
                            });
                        });
                        </script>
                        '; ?>

                    </div>
                    <div style="float:left; width:30%; line-height:25px; text-align:left">Lĩnh vực:</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left">
                    	<input type="text" value="<?php echo $this->_tpl_vars['obj_info']['docField_id']; ?>
" id="docField_id" name="docField_id" class="text_middle" tabindex="6"/>
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
                    <div style="float:left; width:30%; line-height:25px; text-align:left">&nbsp;</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left">
                    	&nbsp;<b>(Người nhập văn bản: <?php echo $this->_tpl_vars['access_user_name']; ?>
)</b>
                    </div>
                </td>
                <td align="center" valign="top">
                	<div style="float:left; width:10%; line-height:25px; text-align:left">Trích yếu <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:90%; line-height:25px; text-align:left; height:75px">
                    	<textarea spellcheck="false" name="doc_desc" id="doc_desc" cols="30" rows="5" class="text_area_long" onfocus="hide_message_Doc()" tabindex="7"><?php echo $this->_tpl_vars['obj_info']['doc_desc']; ?>
</textarea>
                    </div>
                    <div style="float:left; width:10%; line-height:25px; text-align:left">Người ký <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:30%; line-height:25px; text-align:left">
                    	<input type="text" value="<?php echo $this->_tpl_vars['obj_info']['signPer_id']; ?>
" id="signPer_id" name="signPer_id" class="text_middle" tabindex="8" onfocus="hide_message_Doc();"/>
                        <?php echo '
						<script type="text/javascript">
                        $().ready(function() {
							$("#signPer_id").autocomplete("B_signPer_auto.php", {
								width: 160,
								matchContains: true,
								selectFirst: true
							});
						});
                        </script>
                        '; ?>

                    </div>
                    <div style="float:left; width:10%; line-height:25px; text-align:left">Chức vụ <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:50%; line-height:25px; text-align:left">
                    	<input type="text" value="<?php echo $this->_tpl_vars['obj_info']['signObj_id']; ?>
" id="signObj_id" name="signObj_id" class="text_middle" tabindex="9" onfocus="hide_message_Doc();"/>
                        <?php echo '
						<script type="text/javascript">
                        $().ready(function() {
							$("#signObj_id").autocomplete("B_signObj_auto.php", {
								width: 160,
								matchContains: true,
								selectFirst: true
							});
						});
                        </script>
                        '; ?>

                    </div>
                    <div style="float:left; width:10%; line-height:25px; text-align:left">Ngày nhận:</div>
                    <div style="float:left; width:30%; line-height:25px; text-align:left">
                    	<input type="text" value="<?php echo ((is_array($_tmp=time())) ? $this->_run_mod_handler('date_format', true, $_tmp, '%d/%m/%Y') : smarty_modifier_date_format($_tmp, '%d/%m/%Y')); ?>
" id="doc_recevied" name="doc_recevied" class="text_time_callender" tabindex="10"/>&nbsp;<img src="../images/admin/img.gif"  align="absmiddle" id="date_doc_recevied" style="cursor: pointer; border: 0" title="Chọn ngày trên lịch"/>
                        <?php echo '
						<script type="text/javascript">
                            Calendar.setup({
                                inputField   :   "doc_recevied",
                                ifFormat     :   "%d/%m/%Y",
                                button       :   "date_doc_recevied",
                                align        :   "Br",  
                                timeFormat   :   "24",
                                showsTime    :   true,
                                singleClick  :   true
                            });
                        </script>
                        '; ?>

                    </div>
                    <div style="float:left; width:10%; line-height:25px; text-align:left">Số đến:</div>
                    <div style="float:left; width:50%; line-height:25px; text-align:left">
                        <div id="doc_num_div">
                            <input type="text" id="doc_num" name="doc_num" class="text_tiny" value="" tabindex="11"/>
                        </div>
                    </div>
                    <div style="float:left; width:10%; line-height:25px; text-align:left">Độ mật:</div>
                    <div style="float:left; width:30%; line-height:25px; text-align:left">
                    	<select name="secret_id" id="secret_id" class="select_short" tabindex="12">
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
                    <div style="float:left; width:50%; line-height:25px; text-align:left">
                    	<select name="important_id" id="important_id" class="select_short" tabindex="13">
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
                    <div style="float:left; width:100%; line-height:25px; text-align:left">
                    	<input type="button" name="btnSub_Doc" id="btnSub_Doc" value="Ghi lại" class="button" tabindex="14"/>
                        <input type="hidden" name="doc_id" id="doc_id" value="<?php echo $this->_tpl_vars['obj_info']['doc_id']; ?>
">
                        <input type="hidden" name="doc_note" id="doc_note" value="<?php echo $this->_tpl_vars['obj_info']['doc_note']; ?>
">
                        <input type="hidden" name="doc_note_code" id="doc_note_code" value="<?php echo $this->_tpl_vars['obj_info']['doc_note_code']; ?>
">
                        <input type="hidden" name="doc_note_sign_date" id="doc_note_sign_date" value="<?php echo $this->_tpl_vars['obj_info']['doc_note_sign_date']; ?>
">
                        <input type="hidden" name="doc_note_sign_per" id="doc_note_sign_per" value="<?php echo $this->_tpl_vars['obj_info']['doc_note_sign_per']; ?>
">
                        <input type="hidden" name="doc_note_date" id="doc_note_date" value="<?php echo $this->_tpl_vars['obj_info']['doc_note_date']; ?>
">
                        <input type="hidden" name="doc_moved" id="doc_moved" value="<?php echo $this->_tpl_vars['obj_info']['doc_moved']; ?>
">
                        <input type="hidden" name="doc_date" id="doc_date" value="<?php echo $this->_tpl_vars['obj_info']['doc_date']; ?>
">
                        <input type="hidden" name="doc_traned" id="doc_traned" value="<?php echo $this->_tpl_vars['obj_info']['doc_traned']; ?>
">
                        <input type="hidden" name="doc_replied" id="doc_replied" value="<?php echo $this->_tpl_vars['obj_info']['doc_replied']; ?>
">
                        <input type="hidden" name="doc_active" id="doc_active" value="<?php echo $this->_tpl_vars['obj_info']['doc_active']; ?>
">
                        <input type="hidden" name="doc_file" id="doc_file" value="<?php echo $this->_tpl_vars['obj_info']['doc_file']; ?>
">
                        <input type="hidden" name="user_id" id="user_id" value="<?php echo $this->_tpl_vars['obj_info']['user_id']; ?>
">
                        <input type="hidden" name="input_per" id="input_per" value="<?php echo $this->_tpl_vars['obj_info']['input_per']; ?>
">
                        <input type="hidden" name="doc_theodoi" id="doc_theodoi" value="<?php echo $this->_tpl_vars['obj_info']['doc_theodoi']; ?>
">
                        <input type="reset" name="Reset" value="Hủy bỏ" class="button" tabindex="15"/>
                        <?php echo '
                        <script language="javascript">
                            function hide_message_Doc(){
                                $(\'#lblMessage_Doc\').hide();
                                $(\'#lblError_Doc\').hide();
								$(\'#mess_doc\').hide();
                            }
                            
                            $(function() {
                            $(\'.error\').hide();
                            $(\'#lblMessage_Doc\').hide();
                             
                            $("#btnSub_Doc").click(function() {
								
                                $(\'.error\').hide();
                                 
                                var $form = $("#frmList_Doc");
                                var docLevel_id = $form.find(\'select#docLevel_id :selected\').val();
								var unit_name = $form.find(\'input#unit_name\').val();
								var doc_code = $form.find(\'input#doc_code\').val();
								var doc_signed = $form.find(\'input#doc_signed\').val();
								var docCat_id = $form.find(\'input#docCat_id\').val();
								var docField_id = $form.find(\'input#docField_id\').val();
								var doc_desc = $form.find(\'textarea#doc_desc\').val();
								var signPer_id = $form.find(\'input#signPer_id\').val();
								var signObj_id = $form.find(\'input#signObj_id\').val();
								var doc_recevied = $form.find(\'input#doc_recevied\').val();
								var doc_num = $form.find(\'input#doc_num\').val();
								var secret_id = $form.find(\'select#secret_id :selected\').val();
								var important_id = $form.find(\'select#important_id :selected\').val();
								
								var doc_id = $form.find(\'input#doc_id\').val();
                                var doc_note_code = $form.find(\'input#doc_note_code\').val();
								var doc_note_sign_date = $form.find(\'input#doc_note_sign_date\').val();
								var doc_note_sign_per = $form.find(\'input#doc_note_sign_per\').val();
								var doc_note_date = $form.find(\'input#doc_note_date\').val();
								var doc_moved = $form.find(\'input#doc_moved\').val();
								var doc_date = $form.find(\'input#doc_date\').val();
								var doc_traned = $form.find(\'input#doc_traned\').val();
								var doc_replied = $form.find(\'input#doc_replied\').val();
								var doc_active = $form.find(\'input#doc_active\').val();
								var doc_file = $form.find(\'input#doc_file\').val();
								var user_id = $form.find(\'input#user_id\').val();
								var input_per = $form.find(\'input#input_per\').val();
								var doc_theodoi = $form.find(\'input#doc_theodoi\').val();
								
                                //begin validate form
                                if (unit_name == "" || doc_code == "" || doc_signed == "" || docCat_id == "" || doc_desc == "" || signPer_id == "" || signObj_id == ""){
                                    $(\'#lblError_Doc\').show();
                                }
                                else{
									$.post(\'index.php?listDoc&mod=docs&add_edit=1\',
										{
											docLevel_id:docLevel_id,
											unit_name:unit_name,
											doc_code:doc_code,
											doc_signed:doc_signed,
											docField_id:docField_id,
											docCat_id:docCat_id,
											doc_desc:doc_desc,
											signPer_id:signPer_id,
											signObj_id:signObj_id,
											doc_recevied:doc_recevied,
											doc_num:doc_num,
											secret_id:secret_id,
											important_id:important_id,
											doc_id:doc_id,
											doc_note_code:doc_note_code,
											doc_note_sign_date:doc_note_sign_date,
											doc_note_sign_per:doc_note_sign_per,
											doc_note_date:doc_note_date,
											doc_moved:doc_moved,
											doc_date:doc_date,
											doc_traned:doc_traned,
											doc_replied:doc_replied,
											doc_active:doc_active,
											doc_file:doc_file,
											user_id:user_id,
											input_per:input_per,
											doc_theodoi:doc_theodoi,
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
                </td>
            </tr>
        </table>
    </fieldset>
    <!------------------------------------DANH SACH---------------------------------------------->
    <fieldset style="width:1012px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:247px">
        <legend class="legend_list" style="width:865px">
            <div style="width:130px; float:left">Danh sách: <?php echo $this->_tpl_vars['total_num_result']; ?>
</div>
            <div style="width:70px; float:left">&nbsp;|&nbsp;Tìm kiếm:&nbsp;</div>
            <div style="width:380px; float:left; font-weight:normal">
                <div style="float:left">
                    <div style="float:left; width:60px">- Trích yếu: </div>
                    <div style="float:left; width:300px">
                    <input type="text" id="doc_desc_fs" name="doc_desc_fs" class="text_seek_long" value="<?php echo $this->_tpl_vars['vars']['doc_desc_fs']; ?>
"/>
                    </div>
                    <input type="hidden" id="processurl" value="<?php echo $this->_tpl_vars['processurl']; ?>
" />
                </div>
                <a href="javascript: void(0);" onClick="show_hide_seek()" style="text-decoration:none; color:#F00">
                <div style="float:left; margin-left:3px"><img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_keo_dai.png" class="img_all"></div></a>
            </div>
            <div style="width:380px; float:left; font-weight:normal; position:absolute; display:none; margin:20px 0 0 200px; background-color:#ccd8e7; border:1px solid #99bbe8; border-top:none; z-index:2012" id="seek_more">
                <div style="float:left; width:100%; height:5px"></div>
                <div style="float:left; width:60px; margin-bottom:5px">- Ký hiệu: </div>
                <div style="float:left; width:80px; margin-bottom:5px">
                <input type="text" id="doc_code_fs" name="doc_code_fs" class="text_seek_tiny" value="<?php echo $this->_tpl_vars['vars']['doc_code_fs']; ?>
" />
                </div>
                <div style="float:left; width:79px; margin-bottom:5px">- Nơi gửi đến: </div>
                <div style="float:left; width:155px; margin-bottom:5px">
                <input type="text" value="<?php echo $this->_tpl_vars['vars']['unit_name_fs']; ?>
" id="unit_name_fs" name="unit_name_fs" class="text_seek_middle" />
                <?php echo '
                <script type="text/javascript">
                $().ready(function() {
                    $("#unit_name_fs").autocomplete("B_unit_auto.php", {
                        width: 160,
                        matchContains: true,
                        selectFirst: true
                    });
                });
                </script>
                '; ?>

                </div>
                <div style="float:left; width:60px; margin-bottom:5px">- Số đến: </div>
                <div style="float:left; width:80px; margin-bottom:5px">
                <input type="text" id="doc_num_fs" name="doc_num_fs" class="text_seek_tiny" value="<?php echo $this->_tpl_vars['vars']['doc_num_fs']; ?>
" />
                </div>
                <div style="float:left; width:79px; margin-bottom:5px">- Loại văn bản: </div>
                <div style="float:left; width:155px; margin-bottom:5px">
                <input type="text" value="<?php echo $this->_tpl_vars['vars']['docCat_id_fs']; ?>
" id="docCat_id_fs" name="docCat_id_fs" class="text_seek_middle" />
                <?php echo '
                <script type="text/javascript">
                $().ready(function() {
                    $("#docCat_id_fs").autocomplete("B_docCat_auto.php", {
                        width: 160,
                        matchContains: true,
                        selectFirst: true
                    });
                });
                </script>
                '; ?>

                </div>
                
            </div>
            <div style="width:45px; float:left">
                <input type="button" name="btnSeek" id="btnSeek" value="Tìm >>" class="button_seek" onclick="search_me_Doc()" />
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
            <div style="width:260px; float:left; font-weight:normal; position:absolute; display:none; margin:20px 0 0 604px; background-color:#ccd8e7; border:1px solid #99bbe8; border-top:none; z-index:2012" id="div_filter">
            	<div style="float:left; width:100%; height:5px"></div>
                <div style="float:left; width:56px; margin-bottom:5px">- Nhận:</div>
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
                
                <div style="float:left; width:56px; margin-bottom:5px">- Số đến:</div>
                <div style="float:left; width:20px; margin-bottom:5px">Từ&nbsp;</div>
                <div style="float:left; width:75px; background-color:#FFF; margin-bottom:5px">
                <input type="text" id="soden_tu" name="soden_tu" class="text_seek_tiny" value="<?php echo $this->_tpl_vars['vars']['soden_tu']; ?>
" />
                </div>
                <div style="float:left; width:24px; margin-bottom:5px; margin-left:5px">đến&nbsp;</div>
                <div style="float:left; width:75px; margin-bottom:5px; background-color:#FFF">
                <input type="text" id="soden_den" name="soden_den" class="text_seek_tiny" value="<?php echo $this->_tpl_vars['vars']['soden_den']; ?>
" />
                </div>
                
                <div style="float:left; width:76px; margin-bottom:5px">- Nơi gửi đến: </div>
                <div style="float:left; width:150px; margin-bottom:5px">
                <input type="text" value="<?php echo $this->_tpl_vars['vars']['unit_name_fil']; ?>
" id="unit_name_fil" name="unit_name_fil" class="text_seek_middle" />
                <?php echo '
                <script type="text/javascript">
                $().ready(function() {
                    $("#unit_name_fil").autocomplete("B_unit_auto.php", {
                        width: 160,
                        matchContains: true,
                        selectFirst: true
                    });
                });
                </script>
                '; ?>

                </div>
                
                <div style="float:left; width:76px; margin-bottom:5px">- Loại văn bản: </div>
                <div style="float:left; width:150px; margin-bottom:5px">
                <input type="text" value="<?php echo $this->_tpl_vars['vars']['docCat_id_fil']; ?>
" id="docCat_id_fil" name="docCat_id_fil" class="text_seek_middle" />
                <?php echo '
                <script type="text/javascript">
                $().ready(function() {
                    $("#docCat_id_fil").autocomplete("B_docCat_auto.php", {
                        width: 160,
                        matchContains: true,
                        selectFirst: true
                    });
                });
                </script>
                '; ?>

                </div>

                <div style="float:left; width:76px; margin-bottom:5px">- Lĩnh vực </div>
                <div style="float:left; width:150px; margin-bottom:5px">
                    <input type="text" value="<?php echo $this->_tpl_vars['obj_info']['docField_id']; ?>
" id="docField_id_fil" name="docField_id_fil" class="text_middle" tabindex="6"/>
                    <?php echo '
                        <script type="text/javascript">
                            $().ready(function() {
                                $("#docField_id_fil").autocomplete("B_docField_auto.php", {
                                    width: 160,
                                    matchContains: true,
                                    selectFirst: true
                                });
                            });
                        </script>
                    '; ?>

                </div>

                <div style="float:left; width:76px; margin-bottom:5px">- Phòng/ban: </div>
                <div style="float:left; width:150px; margin-bottom:5px">
                <select name="department_fil" id="department_fil" class="select_seek">
                    <option value="0">Chọn phòng ban</option>
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
                <div style="float:left; width:76px; margin-bottom:5px">- Tình trạng: </div>
                <div style="float:left; width:150px; margin-bottom:5px">
                    <select name="tinhtrang_fil" id="tinhtrang_fil" class="select_seek">
                        <option value="0">Tất cả</option>
                        <option value="1">Trong hạn</option>
                        <option value="2">Quá hạn</option>
                    </select>
                </div>
            </div>
        </legend>
    	<div style="float:left; height:5px; width:100%"></div>
        <div style="float:left; height:25px; width:890px; border-top:1px solid #99bbe8; border-bottom:1px solid #99bbe8 ">
            <div class="tbl_tit" style="width:40px; text-align:center"><b>STT</b></div>
            <div class="tbl_tit" style="width:45px; text-align:right"><B>&nbsp;Số đến&nbsp;</B></div>
            <div class="tbl_tit" style="width:75px"><B>&nbsp;Ký hiệu</B></div>
            <div class="tbl_tit" style="width:279px"><B>&nbsp;Trích yếu</B></div>
            <div class="tbl_tit" style="width:130px"><B>&nbsp;Nơi gửi</B></div>
            <div class="tbl_tit" style="width:60px"><B>&nbsp;Ngày nhập</B></div>
            <div class="tbl_tit" style="width:60px"><B>&nbsp;Hạn xử lý</B></div>
            <div class="tbl_tit" style="width:60px"><B>&nbsp;Quá hạn</B></div>
            <div class="tbl_tit" style="width:40px; text-align:center"><B>File</B></div>
            <div class="tbl_tit" style="width:59px; text-align:center"><B>Chọn</B></div>
            <div class="tbl_tit" style="width:30px; text-align:center">
            <input type="hidden" name="chon" id="chon_Doc">
            <input type="checkbox" name="chkall" value="0" onclick="docheck_Doc(document.frmList_Doc.chkall.checked,0);">
            </div>
        </div>
        <div style="float:left; width:20px; text-align:right">
        <input type="button" name="del_Items" id='del_Items' value="&nbsp;" onClick="delItems_Doc('<?php echo $this->_tpl_vars['processurl']; ?>
');" style="width:17px; font-size:12px; background:url(../images/admin/b_drop.png); cursor:pointer" title="Xóa lựa chọn">
        </div>
        <div style="float:left; height:190px; width:912px; overflow-y:scroll">
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
" style="width:40px; text-align:center"><?php echo $this->_tpl_vars['stt']; ?>
</div>
                <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:45px; text-align:right">
                    &nbsp;<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->doc_num; ?>
&nbsp;
                </div>
                <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:75px; white-space:nowrap" title="<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->doc_code; ?>
">
                    &nbsp;<?php echo ((is_array($_tmp=$this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->doc_code)) ? $this->_run_mod_handler('str_string_cut', true, $_tmp, '10', '1') : smarty_modifier_str_string_cut($_tmp, '10', '1')); ?>

                </div>
                <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:279px" title="<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->doc_desc; ?>
">
                	<?php echo smarty_function_math(array('a' => $this->_sections['pi']['index'],'b' => 1,'equation' => "a+b",'assign' => 'count'), $this);?>

                    <div style="float:left; width:254px; white-space:nowrap">&nbsp;<a href="javascript: void(0);" onclick="edit_me_Doc(<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->doc_id; ?>
)" ><?php echo ((is_array($_tmp=$this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->doc_desc)) ? $this->_run_mod_handler('str_string_cut', true, $_tmp, '63', '1') : smarty_modifier_str_string_cut($_tmp, '63', '1')); ?>
</a></div>
                    <div style="float:right; margin:2px; border:1px solid #8ea4c1; height:18px; width:16px; text-align:center; background-color:#dfe8f6" title="Chức năng mở rộng">
                    <?php if ($this->_tpl_vars['user_level'] == 9 || $this->_tpl_vars['user_level'] == 1): ?><a href='javascript: void(0);' onclick="show_list_options(<?php echo $this->_tpl_vars['count']; ?>
,<?php echo $this->_tpl_vars['total_num_result']; ?>
)">
                    <img src="<?php echo $this->_tpl_vars['css_path']; ?>
extra_icon.png" width="14" height="14" border="0" class="img_all"></a><?php endif; ?>
                    </div>
                    <div id="extra_<?php echo $this->_tpl_vars['count']; ?>
" style="position:absolute; display:none; height:auto; width:140px; margin:2px 118px; border:1px solid #8ea4c1; border-right:1px solid #8ea4c1; background-color:#dfe8f6">
                    	<?php if ($this->_tpl_vars['order_id'] == 0 || $this->_tpl_vars['order_id'] == 1): ?>
                        <div style="float:left; width:140px; height:18px; border-right:1px solid #dfe8f6"><b>&nbsp;Phân loại từ:</b></div>
                        <div style="float:left; width:140px; padding:0 0 0 3px">
                            <?php if (isset($this->_sections['ui'])) unset($this->_sections['ui']);
$this->_sections['ui']['name'] = 'ui';
$this->_sections['ui']['loop'] = is_array($_loop=$this->_tpl_vars['user_list_4']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
$this->_sections['ui']['show'] = true;
$this->_sections['ui']['max'] = $this->_sections['ui']['loop'];
$this->_sections['ui']['step'] = 1;
$this->_sections['ui']['start'] = $this->_sections['ui']['step'] > 0 ? 0 : $this->_sections['ui']['loop']-1;
if ($this->_sections['ui']['show']) {
    $this->_sections['ui']['total'] = $this->_sections['ui']['loop'];
    if ($this->_sections['ui']['total'] == 0)
        $this->_sections['ui']['show'] = false;
} else
    $this->_sections['ui']['total'] = 0;
if ($this->_sections['ui']['show']):

            for ($this->_sections['ui']['index'] = $this->_sections['ui']['start'], $this->_sections['ui']['iteration'] = 1;
                 $this->_sections['ui']['iteration'] <= $this->_sections['ui']['total'];
                 $this->_sections['ui']['index'] += $this->_sections['ui']['step'], $this->_sections['ui']['iteration']++):
$this->_sections['ui']['rownum'] = $this->_sections['ui']['iteration'];
$this->_sections['ui']['index_prev'] = $this->_sections['ui']['index'] - $this->_sections['ui']['step'];
$this->_sections['ui']['index_next'] = $this->_sections['ui']['index'] + $this->_sections['ui']['step'];
$this->_sections['ui']['first']      = ($this->_sections['ui']['iteration'] == 1);
$this->_sections['ui']['last']       = ($this->_sections['ui']['iteration'] == $this->_sections['ui']['total']);
?>
                            <?php if ($this->_tpl_vars['user_list_4'][$this->_sections['ui']['index']]->user_level == 3): ?>
                                 <div style="float:left; width:135px">- <a href="javascript: void(0)" onclick="javascript: show_phanloai(<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->doc_id; ?>
)"><?php echo $this->_tpl_vars['user_list_4'][$this->_sections['ui']['index']]->user_fullname; ?>
</a></div>
                            <?php endif; ?>
                            <?php endfor; endif; ?>
                        </div>
                        <?php endif; ?>
                        <?php if ($this->_tpl_vars['order_id'] == 1 || $this->_tpl_vars['order_id'] == 2): ?>
                        <div style="float:left; width:140px; height:18px; <?php if ($this->_tpl_vars['order_id'] == 2): ?>border-right:1px solid #dfe8f6<?php endif; ?>"><b>&nbsp;Chỉ đạo từ:</b></div>
                        <div style="float:left; width:140px; padding:0 0 0 3px">
                            <?php if (isset($this->_sections['ui'])) unset($this->_sections['ui']);
$this->_sections['ui']['name'] = 'ui';
$this->_sections['ui']['loop'] = is_array($_loop=$this->_tpl_vars['user_list_4']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
$this->_sections['ui']['show'] = true;
$this->_sections['ui']['max'] = $this->_sections['ui']['loop'];
$this->_sections['ui']['step'] = 1;
$this->_sections['ui']['start'] = $this->_sections['ui']['step'] > 0 ? 0 : $this->_sections['ui']['loop']-1;
if ($this->_sections['ui']['show']) {
    $this->_sections['ui']['total'] = $this->_sections['ui']['loop'];
    if ($this->_sections['ui']['total'] == 0)
        $this->_sections['ui']['show'] = false;
} else
    $this->_sections['ui']['total'] = 0;
if ($this->_sections['ui']['show']):

            for ($this->_sections['ui']['index'] = $this->_sections['ui']['start'], $this->_sections['ui']['iteration'] = 1;
                 $this->_sections['ui']['iteration'] <= $this->_sections['ui']['total'];
                 $this->_sections['ui']['index'] += $this->_sections['ui']['step'], $this->_sections['ui']['iteration']++):
$this->_sections['ui']['rownum'] = $this->_sections['ui']['iteration'];
$this->_sections['ui']['index_prev'] = $this->_sections['ui']['index'] - $this->_sections['ui']['step'];
$this->_sections['ui']['index_next'] = $this->_sections['ui']['index'] + $this->_sections['ui']['step'];
$this->_sections['ui']['first']      = ($this->_sections['ui']['iteration'] == 1);
$this->_sections['ui']['last']       = ($this->_sections['ui']['iteration'] == $this->_sections['ui']['total']);
?>
                            <?php if ($this->_tpl_vars['user_list_4'][$this->_sections['ui']['index']]->user_level != 3): ?>
                            <div style="float:left; width:135px">- <a href="javascript: void(0)" onclick="javascript: show_list_reply(<?php echo $this->_tpl_vars['user_list_4'][$this->_sections['ui']['index']]->user_id; ?>
,<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->doc_id; ?>
)"><?php echo $this->_tpl_vars['user_list_4'][$this->_sections['ui']['index']]->user_fullname; ?>
</a></div>
                            <?php endif; ?>
                            <?php endfor; endif; ?>
                        </div>
                        <?php endif; ?>
                        <?php if ($this->_tpl_vars['order_id'] == 0 || $this->_tpl_vars['order_id'] == 1 || $this->_tpl_vars['order_id'] == 2): ?>
                        <div style="float:left; width:140px; height:3px">
                        	<hr width="100%" size="1" />
                        </div>
                        <?php endif; ?>
                        <div style="float:left; width:140px; padding:0 0 0 3px">
                             - <a href="javascript: void(0)" onclick="javascript: show_thongtin_vanban(<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->doc_id; ?>
)">Thông tin văn bản</a>
                        </div>
                    </div>
                </div>
                <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:130px" title="<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->unit_name; ?>
">
                    &nbsp;<?php echo ((is_array($_tmp=$this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->unit_name)) ? $this->_run_mod_handler('str_string_cut', true, $_tmp, '25', '1') : smarty_modifier_str_string_cut($_tmp, '25', '1')); ?>

                </div>
                <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:60px">
                    &nbsp;<?php echo ((is_array($_tmp=$this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->doc_date)) ? $this->_run_mod_handler('date_format', true, $_tmp, "%d/%m/%Y") : smarty_modifier_date_format($_tmp, "%d/%m/%Y")); ?>

                </div>
                <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:60px">
                    <?php 
                        $songayqh = 0;
                        $sql = "select * from tbl_docreplys where doc_id = ".$this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->doc_id." order by docReply_id asc limit 1";
                        $result = mysql_query($sql) or die($sql);
                        if(mysql_num_rows($result)>0){
                            $row = mysql_fetch_array($result);
                            if($row['docReply_limit_time'] != "0000-00-00"){
                                echo '&nbsp;'.date('d/m/Y',strtotime($row['docReply_limit_time']));
                                $songayqh = (strtotime(date('Y-m-d'))-strtotime($row['docReply_limit_time']))/(24*60*60);
                            }else{
                                echo "&nbsp;";
                            }
                        }else{
                            echo "&nbsp;";
                        }
                     ?>
                </div>
                <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:60px; text-align:right; color: #FF0000">
                    <?php if($songayqh>0) echo $songayqh.' ngày'; ?>&nbsp;
                </div>
                <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:40px; text-align:center">
                    <?php if ($this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->doc_file == 2): ?>
                    <a href='javascript: void(0);' onclick="show_list_file(<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->doc_id; ?>
)">
                    <img src="../images/admin/empty_icon.png" width="14" height="14" border="0"></a>
                    <?php else: ?>
                    <a href='javascript: void(0);' onclick="show_list_file(<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->doc_id; ?>
)">
                    <img src="../images/admin/folder_icon.png" width="14" height="14" border="0"></a>
                    <?php endif; ?>
                </div>
                <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:29px; text-align:center">
                    <a href='javascript: void(0);' onclick="edit_me_Doc(<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->doc_id; ?>
)">
                    <img src="../images/admin/b_edit.png" width="11" height="11" border="0" title="Sửa"></a>
                </div>
                <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:29px; text-align:center">
                    <a href='javascript: void(0)' onClick="delItems_Doc('<?php echo $this->_tpl_vars['processurl']; ?>
', <?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->doc_id; ?>
);">
                    <img src="../images/admin/b_drop.png" width="11" height="11" border="0" title="Xóa"></a>
                </div>
                <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:30px; text-align:center">
                    <input type="checkbox" name="chkid" value="<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->doc_id; ?>
" onclick="docheckone_Doc();">
                </div>
            </div>
            <?php endfor; endif; ?>
        </div>
        <input type="hidden" id="curpage_Doc" name="curpage" value="<?php echo $this->_tpl_vars['vars']['curpage']; ?>
" />
        <input type="hidden" name="arg" id="arg" value="<?php echo $this->_tpl_vars['vars']['arg']; ?>
">
        <input type="hidden" name="arg_doc" id="arg_doc" value="<?php echo $this->_tpl_vars['vars']['arg_doc']; ?>
">
    </fieldset>
    </form>
</div>
<!------------------------------------------------- Tool bar --------------------------------------------->
<div id="doc_clear_txt"></div>
<div id="doc_tool_bar">

    <div id="doc_search_area">
    <select name="order" id = "order_Doc" style="width:120px; font-size:12px; border:1px solid #99bbe8; margin-left:1px" onchange="reloadPage_Doc('<?php echo $this->_tpl_vars['processurl']; ?>
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
    <a href="javascript: void(0)" id="first_page" onclick="gotoPage_Doc('<?php echo $this->_tpl_vars['processurl']; ?>
',parseInt(1));" title="Trang đầu">
    	<img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_first_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="pre_page" onclick="gotoPage_Doc('<?php echo $this->_tpl_vars['processurl']; ?>
',parseInt(document.getElementById('page_Doc').value)-parseInt(1));" title="Trang trước">
    	<img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_pre_page.png" class="img_all">
    </a>
    <?php endif; ?>
    </div>
    <div style="float:left; line-height:19px">
        <div style="float:left; width:35px">Trang</div> 
        <div style="float:left; width:35px">
        <input type="text" value="<?php echo $this->_tpl_vars['vars']['curpage']; ?>
" name="page" id="page_Doc" onblur=" gotoPage_Doc('<?php echo $this->_tpl_vars['processurl']; ?>
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
    <a href="javascript: void(0)" id="next_page" onclick="gotoPage_Doc('<?php echo $this->_tpl_vars['processurl']; ?>
',parseInt(document.getElementById('page_Doc').value)+parseInt(1));" title="Trang tiếp">
    	<img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_next_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="last_page" onclick="gotoPage_Doc('<?php echo $this->_tpl_vars['processurl']; ?>
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
    <a href="javascript: void(0)" id="a_ref_Doc" title="Tải lại"><img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_refresh.png" class="img_all"></a>
    </div>
    
    <div style="float:left; width:12px; background-image:url(<?php echo $this->_tpl_vars['css_path']; ?>
gach_doc.png)">&nbsp;</div>
    <div style="float:right; line-height:19px; margin-right:2px">
        <div style="float:left; width:40px">Xem</div>
        <div style="float:left; width:52px">
            <select name="numresult" id="numresult_Doc" style="width:50px; font-size:12px; border:1px solid #99bbe8" onchange="reloadPage_Doc('<?php echo $this->_tpl_vars['processurl']; ?>
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
	function show_list_options(count,total){
		for(i=1;i<=total;i++){
			if(i==count){
				if(document.getElementById(\'extra_\'+i).style.display==\'none\')
					document.getElementById(\'extra_\'+i).style.display=\'block\';
				else
					document.getElementById(\'extra_\'+i).style.display=\'none\';
			}
			else
				document.getElementById(\'extra_\'+i).style.display=\'none\';
		}
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
	
	function docheck_Doc(status,from_){
		var alen=document.frmList_Doc.elements.length;
		alen=(alen>5)?document.frmList_Doc.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
			document.frmList_Doc.chkid[i].checked=status;
		}
		else{
			document.frmList_Doc.chkid.checked=status;
		}
		if(from_>0) document.frmList_Doc.chkall.checked=status;
	}
		
	function docheckone_Doc(){
		var alen=document.frmList_Doc.elements.length;
		var isChecked=true;
		alen=(alen>4)?document.frmList_Doc.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_Doc.chkid[i].checked==false)
					isChecked=false;
		}else{
			if(document.frmList_Doc.chkid.checked==false)
				isChecked=false;
		}				
		document.frmList_Doc.chkall.checked=isChecked;
	}
	
	function calculatechon_Doc(){			
		var strchon="";
		var alen=document.frmList_Doc.elements.length;				
		alen=(alen>2)?document.frmList_Doc.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_Doc.chkid[i].checked==true)
					strchon+=document.frmList_Doc.chkid[i].value+",";
		}else{
			if(document.frmList_Doc.chkid.checked==true)
				strchon=document.frmList_Doc.chkid.value;
		}
		document.frmList_Doc.chon_Doc.value=strchon;
	}
	
	function delItems_Doc(processurl,delStr){
		if (delStr == undefined){
			calculatechon_Doc();
			delStr = document.getElementById("chon_Doc").value;
		}
		if (delStr == ""){
			return false;
		}
		if(!confirm("THÔNG BÁO: \\n\\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
			return false;
		}	
		
		var numresult_Doc,order_Doc,curpage_Doc;
		numresult = $("#numresult_Doc").val();
		order = $("#order_Doc").val();
		curpage = $("#curpage_Doc").val();
		
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
	
	function reloadPage_Doc(processurl){
		var numresult_Doc,order_Doc,cur_pos;
		numresult = $("#numresult_Doc").val();
		order = $("#order_Doc").val();
		cur_pos = 0;
		$("#doc_content_main").load(processurl+"&numresult="+numresult+"&order="+order+"&cur_pos="+cur_pos);
	}
	
	function show_list_file(doc_id){
		var arg_doc = document.getElementById(\'arg_doc\').value;
		document.getElementById(\'list_file\').style.display=\'block\';
		$("#list_file_cont").load("?listDocFile&mod=docs"+arg_doc+"&doc_id="+doc_id);
	}
	
	function show_list_reply(user_id,doc_id){
		document.getElementById(\'list_reply\').style.display=\'block\';
		var arg = document.getElementById(\'arg\').value;
		$("#list_reply_cont").load("?listDocReply"+arg+"&doc_id="+doc_id+"&user_id="+user_id);
	}
	
	function show_phanloai(doc_id){
		document.getElementById(\'list_phanloai\').style.display=\'block\';
		var arg = document.getElementById(\'arg\').value;
		$("#list_phanloai_cont").load("?Phanloai&"+arg+"&doc_id="+doc_id);
	}
	
	function show_thongtin_vanban(doc_id){
		document.getElementById(\'div_view_doc\').style.display=\'block\';
		$("#list_view_doc_cont").load("?viewDoc&mod=docs&doc_id="+doc_id);
	}
		
	function gotoPage_Doc(processurl,page){
		var numresult_Doc,order_Doc,cur_pos;
		numresult = $("#numresult_Doc").val();
		order = $("#order_Doc").val();
		//alert(processurl+\'-\'+page+\'-\'+numresult+\'-\'+order);
		$("#doc_content_main").load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+page);
	}
	
	function uncheck_fns_Doc(field,val,id){
		$("#doc_content_main").load("?listDoc&mod=docs&checkUncheck="+val+"&setfield="+field+"&checkUncheckID="+id);
	}
	
	function sort_me_Doc(id,val){
		$("#doc_content_main").load("?listDoc&mod=docs&sort_me=1&doc_id="+id+"&val="+val);
	}
	
	function search_me_Doc(){
		var doc_desc_fs 	= document.getElementById(\'doc_desc_fs\').value;
		var doc_code_fs 	= document.getElementById(\'doc_code_fs\').value;
		var doc_num_fs 		= document.getElementById(\'doc_num_fs\').value;
		var unit_name_fs 	= document.getElementById(\'unit_name_fs\').value;
		var docCat_id_fs 	= document.getElementById(\'docCat_id_fs\').value;
		
		if (doc_desc_fs == "" && doc_code_fs == "" && doc_num_fs == "" && unit_name_fs == "" && docCat_id_fs == ""){
			return false;
		}
		
		$.post(\'?listDoc&mod=docs&search_me=1\',
			{
				doc_desc_fs:doc_desc_fs,
				doc_code_fs:doc_code_fs,
				doc_num_fs:doc_num_fs,
				unit_name_fs:unit_name_fs,
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
		
		var soden_tu 	= document.getElementById(\'soden_tu\').value;
		var soden_den 	= document.getElementById(\'soden_den\').value;
		
		var unit_name_fil 	= document.getElementById(\'unit_name_fil\').value;
		var docCat_id_fil 	= document.getElementById(\'docCat_id_fil\').value;
        var docField_id_fil = document.getElementById(\'docField_id_fil\').value;
		var department_fil 	= document.getElementById(\'department_fil\').value;
        var tinhtrang_fil 	= document.getElementById(\'tinhtrang_fil\').value;
		
		var tungay = tungay_3+\'-\'+tungay_2+\'-\'+tungay_1;
		var denngay = denngay_3+\'-\'+denngay_2+\'-\'+denngay_1;
				
		if ((tungay == "" && denngay == "") && (soden_tu == "" && soden_den == "") ){
			return false;
		}
		
		if(exptype==3){
			document.getElementById(\'div_doc_report\').style.display=\'block\';
			$.post(\'?expDocReport&mod=docs&exptype=\'+exptype,
				{
					tungay:tungay,
					denngay:denngay,
					soden_tu:soden_tu,
					soden_den:soden_den,
					unit_name_fil:unit_name_fil,
					docCat_id_fil:docCat_id_fil,
                    docField_id_fil:docField_id_fil,
                    tinhtrang_fil:tinhtrang_fil

				},
				function(data){
					$(\'#doc_report_content_main\').html(data);
					$("#doc_report_content_main").show();
				}
			);
			
			$(\'#doc_content_main\').hide();
			$(\'#doc_content_main\').fadeOut(\'fast\').load(\'index.php?listDoc&mod=docs\').fadeIn("fast");
			//$(\'#doc_report_content_main\').load("?expDocReport&mod=docs&exptype="+exptype+"&tungay="+tungay+"&denngay="+denngay);
		}else{
			window.location="?expDocReport&mod=docs&exptype="+exptype+"&tungay="+tungay+"&denngay="+denngay;
		}
	}
	
	function edit_me_Doc(id){
		$("#doc_content_main").load("?listDoc&mod=docs&edit_me=1&doc_id="+id);
	}
		
	$("#a_ref_Doc").click( function () { 
			$(\'#doc_content_main\').hide();
			$(\'#doc_content_main\').fadeOut(\'fast\').load(\'index.php?listDoc&mod=docs\').fadeIn("fast");
		});
</script>
'; ?>

