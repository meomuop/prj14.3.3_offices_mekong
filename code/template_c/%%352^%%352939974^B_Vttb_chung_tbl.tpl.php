<?php /* Smarty version 2.6.2, created on 2018-12-16 10:30:38
         compiled from E:%5CProjects%5Cwamp64%5Cwww%5Csmarty%5Cprj14.3.3_offices_mekong%5Ccode%5Cmodules%5Cvttbs/skin/B_Vttb_chung_tbl.tpl */ ?>
<?php require_once(SMARTY_DIR . 'core' . DIRECTORY_SEPARATOR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'math', 'E:\Projects\wamp64\www\smarty\prj14.3.3_offices_mekong\code\modules\vttbs/skin/B_Vttb_chung_tbl.tpl', 40, false),array('modifier', 'str_string_cut', 'E:\Projects\wamp64\www\smarty\prj14.3.3_offices_mekong\code\modules\vttbs/skin/B_Vttb_chung_tbl.tpl', 45, false),array('modifier', 'date_format', 'E:\Projects\wamp64\www\smarty\prj14.3.3_offices_mekong\code\modules\vttbs/skin/B_Vttb_chung_tbl.tpl', 196, false),)), $this); ?>
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

<div id="vttb_content_insign">
	<form method="post" name="frmList_Vttb_chung" action="?listVTTB_Chung<?php echo $this->_tpl_vars['vars']['arg']; ?>
" id="frmList_Vttb_chung">
    <!------------------------------------DANH MUC---------------------------------------------->
    <div style="float:left">
    <fieldset style="width:250px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:482px">
    <legend class="legend_list" style="width:200px">
        <div style="width:90px; float:left">Danh mục: <?php echo $this->_tpl_vars['total_num_result']; ?>
</div>
        <div style="width:90px; float:left">
        	Lọc với: <select name="vttb_cat_name_fs" id="vttb_cat_name_fs" class="select_tiny" style="width:35px" onchange="loc_vttb_cat();">
                <?php if (isset($this->_sections['sli'])) unset($this->_sections['sli']);
$this->_sections['sli']['name'] = 'sli';
$this->_sections['sli']['loop'] = is_array($_loop=$this->_tpl_vars['char_arr']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
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
                <option value="<?php echo $this->_tpl_vars['char_arr'][$this->_sections['sli']['index']]; ?>
" <?php if ($this->_tpl_vars['char_arr'][$this->_sections['sli']['index']] == $this->_tpl_vars['vttb_cat_name_fs']): ?>selected<?php endif; ?>><?php echo $this->_tpl_vars['char_arr'][$this->_sections['sli']['index']]; ?>
 </option>
                <?php endfor; endif; ?>
            </select>
        </div>
        <div style="width:20px; float:left; margin-top:2px; height:14px">
        	<?php if ($this->_tpl_vars['user_level'] == 1): ?>
            <a href="javascript: void(0)" onclick="javascript: show_a_e_vttbcat()">
        	<img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_add.png" class="img_all" title="Thêm mới"></a>
            <?php else: ?><img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_add.png" class="img_all" title="Thêm mới" onclick="alert_error(1)"><?php endif; ?>
        </div>
    </legend>
    	<div style="float:left; height:5px; width:100%"></div>
        <div style="float:left; height:455px; width:250px; overflow-y:scroll">
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
            <?php echo smarty_function_math(array('z' => $this->_sections['pi']['index'],'t' => 1,'equation' => "z+t",'assign' => 'count'), $this);?>

            <div style="float:left; line-height:30px">
            	<div style="float:left; width:20px; text-align:center; background-color:#FFF">&diams;</div>
                <div style="float:left; width:212px; white-space:nowrap; background-color:#FFF" title="<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->vttb_cat_name; ?>
">
                    <div style="float:left; width:190px; white-space:nowrap">
                    <?php echo ((is_array($_tmp=$this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->vttb_cat_name)) ? $this->_run_mod_handler('str_string_cut', true, $_tmp, '45', '1') : smarty_modifier_str_string_cut($_tmp, '45', '1')); ?>

                    </div>
                    <div style="float:right; margin:2px; height:18px; width:16px; text-align:center; background-color:#FFF" title="Chức năng mở rộng" id="extra_icon_vttbcat_<?php echo $this->_tpl_vars['count']; ?>
">
                    <?php if ($this->_tpl_vars['user_level'] == 1): ?>
                    <a href='javascript: void(0);' onclick="show_list_vttb_cat_options(<?php echo $this->_tpl_vars['count']; ?>
,<?php echo $this->_tpl_vars['total_num_result']; ?>
)">
                    <img src="<?php echo $this->_tpl_vars['css_path']; ?>
extra_icon.png" width="14" height="14" border="0" class="img_all" style="margin:1px"></a>
                    <?php else: ?><img src="<?php echo $this->_tpl_vars['css_path']; ?>
extra_icon.png" width="14" height="14" border="0" class="img_all" style="margin:1px" onclick="alert_error(1)"><?php endif; ?>
                    </div>
                    <div id="extra_vttbcat_<?php echo $this->_tpl_vars['count']; ?>
" style="position:absolute; display:none; height:auto; width:90px; margin:2px 101px; border:1px solid #8ea4c1; border-right:1px solid #8ea4c1; background-color:#dfe8f6; z-index:2011">
                        <div style="float:left; width:90px; height:18px; border-right:1px solid #dfe8f6"><b>&nbsp;Thao tác:</b></div>
                        <div style="float:left; width:90px; padding:0 0 0 3px">
                             - <a href="javascript: void(0)" onclick="javascript: show_edit_vttbcat(<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->vttb_cat_id; ?>
)">Sửa</a>
                        </div>
                        <div style="float:left; width:90px; padding:0 0 0 3px">
                             - <a href="javascript: void(0)" onclick="javascript: delete_vttbcat(<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->vttb_cat_id; ?>
)">Xóa</a>
                        </div>
                        <div style="float:left; width:90px; padding:0 0 0 3px">
                             - <a href="javascript: void(0)" onclick="javascript: show_a_e_vttbsub(<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->vttb_cat_id; ?>
)">Thêm phụ mục</a>
                        </div>
                    </div>
                </div>
                <div style="float:left; width:192px; white-space:nowrap; margin-left:40px">
                    <?php 
                        $sql = "select * from tbl_vttb_subs where vttb_cat_id = ".$this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->vttb_cat_id;
                        $result = mysql_query($sql);
                        if($result):
                        $i=1;
                        $total = mysql_num_rows($result);
                        while($row=mysql_fetch_array($result)):
                         ?>
                        <div style="float:left; line-height:30px">
                            <div style="float:left; width:170px; white-space:nowrap <?php if ($this->_tpl_vars['vttb_sub_id'] == $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->vttb_sub_id): ?>; color:#F00<?php endif; ?>">
                                &bull; <a href="javascript:void(0);" onclick="javascript: show_list_vttb(<?php echo $row['vttb_sub_id'] ?>,'<?php echo $this->_tpl_vars['vars']['arg']; ?>
')" <?php  if($row['vttb_sub_id'] == $this->_tpl_vars['vttb_sub_id']): ?> style="color:#F00"<?php endif; ?>><?php echo fnsSubstr($row['vttb_sub_name'],50,1) ?></a>
                            </div>
                            <div style="float:right; margin:2px; height:18px; width:16px; text-align:center; background-color:#dfe8f6" title="Chức năng mở rộng" id="extra_icon_vttbsub_<?php echo $this->_tpl_vars['count']; ?>
_<?php echo $i; ?>">
                            <?php if ($this->_tpl_vars['user_level'] == 1): ?>
                            <a href='javascript: void(0);' onclick="show_list_vttb_sub_options(<?php echo $this->_tpl_vars['count']; ?>
,<?php echo $this->_tpl_vars['total_num_result']; ?>
,<?php echo $i; ?>,<?php echo $total; ?>)">
                            <img src="<?php echo $this->_tpl_vars['css_path']; ?>
extra_icon_sub.png" width="14" height="14" border="0" class="img_all" style="margin:1px"></a>
                            <?php else: ?><img src="<?php echo $this->_tpl_vars['css_path']; ?>
extra_icon_sub.png" width="14" height="14" border="0" class="img_all" style="margin:1px" onclick="alert_error(1)"><?php endif; ?>
                            </div>
                            <div id="extra_vttbsub_<?php echo $this->_tpl_vars['count']; ?>
_<?php echo $i; ?>" style="position:absolute; display:none; height:auto; width:60px; margin:2px 111px; border:1px solid #8ea4c1; border-right:1px solid #8ea4c1; background-color:#dfe8f6">
                                <div style="float:left; width:60px; height:18px; border-right:1px solid #dfe8f6"><b>&nbsp;Thao tác:</b></div>
                                <div style="float:left; width:60px; padding:0 0 0 3px">
                                     - <a href="javascript: void(0)" onclick="javascript: show_edit_vttbsub(<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->vttb_cat_id; ?>
,<?php echo $row['vttb_sub_id'] ?>)">Sửa</a>
                                </div>
                                <div style="float:left; width:60px; padding:0 0 0 3px">
                                     - <a href="javascript: void(0)" onclick="javascript: delete_vttbsub(<?php echo $row['vttb_sub_id'] ?>)">Xóa</a>
                                </div>
                            </div>
                        </div>
                        <?php 
                        $i++;
                        endwhile;
                        endif;
                     ?>
                </div>
            </div>
            <?php endfor; endif; ?>
        </div>
    </fieldset>
    </div>
    <!------------------------------------DANH SACH VTTB---------------------------------------------->
    <div style="float:left">
    <fieldset style="width:525px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:482px">
    <legend class="legend_list" style="width:340px">
        <div style="width:100px; float:left">Danh sách: <?php echo $this->_tpl_vars['total_vttb']; ?>
</div>
        <div style="width:70px; float:left">&nbsp;|&nbsp;Tìm kiếm&nbsp;</div>
        <div style="width:100px; float:left">
        	<input type="text" name="keyword" id="keyword" class="text_seek" value="<?php echo $this->_tpl_vars['vars']['keyword']; ?>
"/>
            <input type="hidden" id="processurl" value="<?php echo $this->_tpl_vars['processurl']; ?>
" />
        </div>
        <div style="width:50px; float:left">
        	<input type="button" name="btnSeek" id="btnSeek" value="Tìm >>" class="button_seek" onclick="search_me_Vttb(<?php echo $this->_tpl_vars['vttb_sub_id']; ?>
)" /></div>
        <div style="width:20px; float:left; margin-top:2px; height:14px">
        	<?php if ($this->_tpl_vars['user_level'] == 1): ?>
        	<a href="javascript: void(0)" onclick="javascript: show_add_vttb_form(<?php echo $this->_tpl_vars['vttb_sub_id']; ?>
)">
        	<img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_add.png" class="img_all" title="Thêm mới"></a>
            <?php else: ?><img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_add.png" class="img_all" title="Thêm mới" onclick="alert_error(1)"><?php endif; ?>
        </div>
    </legend>
    	<div style="float:left; height:5px; width:100%"></div>
    	<div style="float:left; height:25px; width:507px; border-top:1px solid #99bbe8; border-bottom:1px solid #99bbe8 ">
            <div class="tbl_tit" style="width:30px; text-align:center"><b>STT</b></div>	
            <div class="tbl_tit" style="width:242px"><B>&nbsp;Tên vật tư thiết bị</B></div>
            <div class="tbl_tit" style="width:70px"><B>&nbsp;Sử dụng từ</B></div>
            <div class="tbl_tit" style="width:70px"><B>&nbsp;Dự kiến đến</B></div>
            <div class="tbl_tit" style="width:90px"><B>&nbsp;Tình trạng</B></div>
        </div>
        <div style="float:left; height:428px; width:525px; overflow-y:scroll">
        	<?php if ($this->_tpl_vars['obj_list_vttb']): ?>
            <?php if (isset($this->_sections['vttb_i'])) unset($this->_sections['vttb_i']);
$this->_sections['vttb_i']['name'] = 'vttb_i';
$this->_sections['vttb_i']['loop'] = is_array($_loop=$this->_tpl_vars['obj_list_vttb']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
$this->_sections['vttb_i']['show'] = true;
$this->_sections['vttb_i']['max'] = $this->_sections['vttb_i']['loop'];
$this->_sections['vttb_i']['step'] = 1;
$this->_sections['vttb_i']['start'] = $this->_sections['vttb_i']['step'] > 0 ? 0 : $this->_sections['vttb_i']['loop']-1;
if ($this->_sections['vttb_i']['show']) {
    $this->_sections['vttb_i']['total'] = $this->_sections['vttb_i']['loop'];
    if ($this->_sections['vttb_i']['total'] == 0)
        $this->_sections['vttb_i']['show'] = false;
} else
    $this->_sections['vttb_i']['total'] = 0;
if ($this->_sections['vttb_i']['show']):

            for ($this->_sections['vttb_i']['index'] = $this->_sections['vttb_i']['start'], $this->_sections['vttb_i']['iteration'] = 1;
                 $this->_sections['vttb_i']['iteration'] <= $this->_sections['vttb_i']['total'];
                 $this->_sections['vttb_i']['index'] += $this->_sections['vttb_i']['step'], $this->_sections['vttb_i']['iteration']++):
$this->_sections['vttb_i']['rownum'] = $this->_sections['vttb_i']['iteration'];
$this->_sections['vttb_i']['index_prev'] = $this->_sections['vttb_i']['index'] - $this->_sections['vttb_i']['step'];
$this->_sections['vttb_i']['index_next'] = $this->_sections['vttb_i']['index'] + $this->_sections['vttb_i']['step'];
$this->_sections['vttb_i']['first']      = ($this->_sections['vttb_i']['iteration'] == 1);
$this->_sections['vttb_i']['last']       = ($this->_sections['vttb_i']['iteration'] == $this->_sections['vttb_i']['total']);
?>
            <?php if (!(!($this->_sections['vttb_i']['index'] % 2))): ?> 
            <?php $this->assign('class_td', 'tbl_cont'); ?> 
            <?php else: ?>
            <?php $this->assign('class_td', 'tbl_cont2'); ?> 
            <?php endif; ?>
            <?php echo smarty_function_math(array('z' => $this->_sections['vttb_i']['index'],'t' => 1,'equation' => "z+t",'assign' => 'stt'), $this);?>

            <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:30px; text-align:center"><?php echo $this->_tpl_vars['stt']; ?>
</div>
            <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:242px; white-space:nowrap" title="<?php echo $this->_tpl_vars['obj_list_vttb'][$this->_sections['vttb_i']['index']]->vttb_desc; ?>
">
            	<div style="float:left; width:130px; white-space:nowrap">
                    <a href='javascript: void(0);' onclick="show_vttb_info(<?php echo $this->_tpl_vars['obj_list_vttb'][$this->_sections['vttb_i']['index']]->vttb_id; ?>
,<?php echo $this->_tpl_vars['obj_list_vttb'][$this->_sections['vttb_i']['index']]->vttb_sub_id; ?>
)">
                    &nbsp;<?php echo ((is_array($_tmp=$this->_tpl_vars['obj_list_vttb'][$this->_sections['vttb_i']['index']]->vttb_name)) ? $this->_run_mod_handler('str_string_cut', true, $_tmp, '20', '1') : smarty_modifier_str_string_cut($_tmp, '20', '1')); ?>
</a>
                    <?php if ($this->_tpl_vars['obj_list_vttb'][$this->_sections['vttb_i']['index']]->vttb_useby != 0): ?>
                    	(<?php if (isset($this->_sections['ui'])) unset($this->_sections['ui']);
$this->_sections['ui']['name'] = 'ui';
$this->_sections['ui']['loop'] = is_array($_loop=$this->_tpl_vars['obj_list_user']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
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
                            <?php if ($this->_tpl_vars['obj_list_user'][$this->_sections['ui']['index']]->user_id == $this->_tpl_vars['obj_list_vttb'][$this->_sections['vttb_i']['index']]->vttb_useby): ?>
                                <?php echo $this->_tpl_vars['obj_list_user'][$this->_sections['ui']['index']]->user_fullname; ?>
 - <?php if (isset($this->_sections['di'])) unset($this->_sections['di']);
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
 if ($this->_tpl_vars['obj_list_user'][$this->_sections['ui']['index']]->unit_id == $this->_tpl_vars['obj_list_department'][$this->_sections['di']['index']]->department_id):  echo $this->_tpl_vars['obj_list_department'][$this->_sections['di']['index']]->department_standfor;  endif;  endfor; endif; ?>
                            <?php endif; ?>
                        <?php endfor; endif; ?>)
                    <?php endif; ?>
                </div>
                <div style="float:right; margin:2px; border:1px solid #8ea4c1; height:18px; width:16px; text-align:center; background-color:#dfe8f6" title="Chức năng mở rộng">
                <a href='javascript: void(0);' onclick="show_list_vttb_options(<?php echo $this->_tpl_vars['stt']; ?>
,<?php echo $this->_tpl_vars['total_vttb']; ?>
)">
                <img src="<?php echo $this->_tpl_vars['css_path']; ?>
extra_icon.png" width="14" height="14" border="0" class="img_all"></a>
                </div>
                <div id="extra_vttb_<?php echo $this->_tpl_vars['stt']; ?>
" style="position:absolute; display:none; height:auto; width:120px; margin:2px 102px; border:1px solid #8ea4c1; border-right:1px solid #8ea4c1; background-color:#dfe8f6">
                    <div style="float:left; width:120px; height:18px; border-right:1px solid #dfe8f6"><b>&nbsp;Thao tác:</b></div>
                    <?php if ($this->_tpl_vars['user_level'] == 1): ?>
                    <div style="float:left; width:120px; padding:0 0 0 3px">
                         - <a href="javascript: void(0)" onclick="javascript: show_edit_vttb_form(<?php echo $this->_tpl_vars['obj_list_vttb'][$this->_sections['vttb_i']['index']]->vttb_id; ?>
,<?php echo $this->_tpl_vars['vttb_sub_id']; ?>
)">Sửa bản ghi</a>
                    </div>
                    <div style="float:left; width:120px; padding:0 0 0 3px">
                         - <a href="javascript: void(0)" onclick="javascript: delete_vttb(<?php echo $this->_tpl_vars['obj_list_vttb'][$this->_sections['vttb_i']['index']]->vttb_id; ?>
,<?php echo $this->_tpl_vars['vttb_sub_id']; ?>
)">Xóa bản ghi</a>
                    </div>
                    <?php endif; ?>
                    <?php if ($this->_tpl_vars['obj_sub_info']['vttb_sub_type'] == 2): ?>
                    <?php if ($this->_tpl_vars['user_level'] == 1): ?>
                    <div style="float:left; width:120px; padding:0 0 0 3px">
                         - <a href="javascript: void(0)" onclick="javascript: show_list_repare(<?php echo $this->_tpl_vars['obj_list_vttb'][$this->_sections['vttb_i']['index']]->vttb_id; ?>
,<?php echo $this->_tpl_vars['vttb_sub_id']; ?>
)">Sửa chữa thiết bị</a>
                    </div>
                    <div style="float:left; width:120px; padding:0 0 0 3px">
                         - <a href="javascript: void(0)" onclick="javascript: show_list_replace(<?php echo $this->_tpl_vars['obj_list_vttb'][$this->_sections['vttb_i']['index']]->vttb_id; ?>
,<?php echo $this->_tpl_vars['vttb_sub_id']; ?>
)">Thay thế - nâng cấp</a>
                    </div>
                    <?php endif; ?>
                    <?php else: ?>
                    <?php if ($this->_tpl_vars['user_level'] != 1): ?>
                    <div style="float:left; width:120px; padding:0 0 0 3px">
                         - <a href="javascript: void(0)" onclick="javascript: show_list_repare(<?php echo $this->_tpl_vars['obj_list_vttb'][$this->_sections['vttb_i']['index']]->vttb_id; ?>
,<?php echo $this->_tpl_vars['vttb_sub_id']; ?>
)">Sửa chữa thiết bị</a>
                    </div>
                    <div style="float:left; width:120px; padding:0 0 0 3px">
                         - <a href="javascript: void(0)" onclick="javascript: show_list_replace(<?php echo $this->_tpl_vars['obj_list_vttb'][$this->_sections['vttb_i']['index']]->vttb_id; ?>
,<?php echo $this->_tpl_vars['vttb_sub_id']; ?>
)">Thay thế - nâng cấp</a>
                    </div>
                    <?php endif; ?>
                    <?php endif; ?>
                    <?php if ($this->_tpl_vars['obj_sub_info']['vttb_sub_type'] == 2 && $this->_tpl_vars['user_level'] != 1): ?>
                    <div style="float:left; width:120px; padding:0 0 0 3px">
                         - <a href="javascript: void(0)" onclick="javascript: show_list_datlich(<?php echo $this->_tpl_vars['obj_list_vttb'][$this->_sections['vttb_i']['index']]->vttb_id; ?>
,<?php echo $this->_tpl_vars['vttb_sub_id']; ?>
)">Đặt lịch sử dụng</a>
                    </div>
                    <?php endif; ?>
                </div>
            </div>
            <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:70px">
            	&nbsp;<?php echo ((is_array($_tmp=$this->_tpl_vars['obj_list_vttb'][$this->_sections['vttb_i']['index']]->vttb_commission)) ? $this->_run_mod_handler('date_format', true, $_tmp, '%d/%m/%Y') : smarty_modifier_date_format($_tmp, '%d/%m/%Y')); ?>

            </div>
            <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:70px">
            	&nbsp;<?php echo ((is_array($_tmp=$this->_tpl_vars['obj_list_vttb'][$this->_sections['vttb_i']['index']]->vttb_limit)) ? $this->_run_mod_handler('date_format', true, $_tmp, '%d/%m/%Y') : smarty_modifier_date_format($_tmp, '%d/%m/%Y')); ?>

            </div>
            <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:90px">
            	&nbsp;<?php if ($this->_tpl_vars['obj_list_vttb'][$this->_sections['vttb_i']['index']]->vttb_active == 1): ?>Đang sử dụng<?php else: ?>Không sử dụng<?php endif; ?>
            </div>
            <?php endfor; endif; ?>
            <?php else: ?><div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:507px; text-align:center">Mời chọn danh mục</div><?php endif; ?>
        </div>
    </fieldset>
    </div>
    </form>
</div>
<?php echo '
<script language="javascript">	

	function show_list_vttb_cat_options(count,total){
		for(i=1;i<=total;i++){
			if(i==count){
				if(document.getElementById(\'extra_vttbcat_\'+i).style.display==\'none\'){
					document.getElementById(\'extra_vttbcat_\'+i).style.display=\'block\';
					$(\'#extra_icon_vttbcat_\'+i).css({\'border\':\'1px solid #8ea4c1\'});
				}else{
					document.getElementById(\'extra_vttbcat_\'+i).style.display=\'none\';
					$(\'#extra_icon_vttbcat_\'+i).css({\'border\':\'none\'});
				}
			}
			else{
				document.getElementById(\'extra_vttbcat_\'+i).style.display=\'none\';
				$(\'#extra_icon_vttbcat_\'+i).css({\'border\':\'none\'});
			}
		}
	}
	
	function show_list_vttb_sub_options(count,total,count2,total2){
		for(i=1;i<=total;i++){
			if(i==count){
				for(j=1;j<=total2;j++){
					if(j==count2){
						if(document.getElementById(\'extra_vttbsub_\'+i+\'_\'+j).style.display==\'none\'){
							document.getElementById(\'extra_vttbsub_\'+i+\'_\'+j).style.display=\'block\';
							$(\'#extra_icon_vttbsub_\'+i+\'_\'+j).css({\'border\':\'1px solid #8ea4c1\'});
						}else{
							document.getElementById(\'extra_vttbsub_\'+i+\'_\'+j).style.display=\'none\';
							$(\'#extra_icon_vttbsub_\'+i+\'_\'+j).css({\'border\':\'none\'});
						}
					}
					else{
						document.getElementById(\'extra_vttbsub_\'+i+\'_\'+j).style.display=\'none\';
						$(\'#extra_icon_vttbsub_\'+i+\'_\'+j).css({\'border\':\'none\'});
					}
				}
			}else{
				for(j=1;j<=100;j++){ // can co cach khac de thay so 100 bang so vttb_sub lon nhat
					if (document.getElementById(\'extra_vttbsub_\'+i+\'_\'+j) != null ) {
						document.getElementById(\'extra_vttbsub_\'+i+\'_\'+j).style.display=\'none\';
						$(\'#extra_icon_vttbsub_\'+i+\'_\'+j).css({\'border\':\'none\'});
					}
				}
			}
		}
	}
	
	function delete_vttbcat(delStr){
		if(!confirm("THÔNG BÁO: \\n\\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
			return false;
		}	
				
		var dataString = "dlStr=" + delStr +"";
			//alert (dataString);
		$.ajax({
			type: "POST",
			url: \'index.php?listVTTB_Chung&mod=vttbs&del_vttb_cat=1\',
			data: dataString,
			success: function(data) {
				$(\'#vttb_content_main\').fadeOut(\'fast\').load(\'index.php?listVTTB_Chung&mod=vttbs\').fadeIn("fast");
			}
		});
	}
	function delete_vttbsub(delStr){
		if(!confirm("THÔNG BÁO: \\n\\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
			return false;
		}	
				
		var dataString = "dlStr=" + delStr +"";
			//alert (dataString);
		$.ajax({
			type: "POST",
			url: \'index.php?listVTTB_Chung&mod=vttbs&del_vttb_sub=1\',
			data: dataString,
			success: function(data) {
				$(\'#vttb_content_main\').fadeOut(\'fast\').load(\'index.php?listVTTB_Chung&mod=vttbs\').fadeIn("fast");
			}
		});
	}
	
	function show_list_vttb_options(count,total){
		for(i=1;i<=total;i++){
			if(i==count){
				if(document.getElementById(\'extra_vttb_\'+i).style.display==\'none\')
					document.getElementById(\'extra_vttb_\'+i).style.display=\'block\';
				else
					document.getElementById(\'extra_vttb_\'+i).style.display=\'none\';
			}
			else
				document.getElementById(\'extra_vttb_\'+i).style.display=\'none\';
		}
	}
	
	function delete_vttb(delStr,vttb_sub_id){
		if(!confirm("THÔNG BÁO: \\n\\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
			return false;
		}	
				
		var dataString = "dlStr=" + delStr +"";
			//alert (dataString);
		$.ajax({
			type: "POST",
			url: \'index.php?listVTTB_Chung&mod=vttbs&del_vttb=1\',
			data: dataString,
			success: function(data) {
				$(\'#vttb_content_main\').fadeOut(\'fast\').load(\'index.php?listVTTB_Chung&mod=vttbs&vttb_sub_id=\'+vttb_sub_id).fadeIn("fast");
			}
		});
	}
	
	function show_list_vttb(vttb_sub_id,vars_arg){
		$(\'#vttb_content_main\').load(\'index.php?listVTTB_Chung&mod=vttbs\'+vars_arg+\'&vttb_sub_id=\'+vttb_sub_id).fadeIn("fast");
	}
	
	function search_me_Vttb(vttb_sub_id){
		var keyword 			= document.getElementById(\'keyword\').value;
		if (keyword == ""){
			return false;
		}
		
		$.post(\'?listVTTB_Chung&mod=vttbs&vttb_sub_id=\'+vttb_sub_id,
			{keyword:keyword},
			function(data){
				$(\'#vttb_content_main\').html(data);
				$("#vttb_content_main").show();
			}
		);
	}
	
	function loc_vttb_cat(){
		var vttb_cat_name_fs = document.getElementById(\'vttb_cat_name_fs\').value;		
		$.post(\'?listVTTB_Chung&mod=vttbs\',
			{vttb_cat_name_fs:vttb_cat_name_fs},
			function(data){
				$(\'#vttb_content_main\').html(data);
				$("#vttb_content_main").show();
			}
		);
	}
	
	function show_vttb_info(vttb_id, vttb_sub_id){
		$(\'#div_vttb_info\').css({\'display\':\'block\',\'z-index\':\'2010\'});
		$(\'#div_vttb_info_cont\').load(\'index.php?viewVTTB&mod=vttbs&vttb_id=\'+vttb_id+\'&vttb_sub_id=\'+vttb_sub_id).fadeIn("fast");	
	}
		
	function show_a_e_vttbcat(){
		$(\'#a_e_vttbcat\').css({\'display\':\'block\',\'z-index\':\'2010\'});
		$(\'#list_a_e_vttbcat_cont\').load(\'index.php?addEditVTTBCat&mod=vttbs\').fadeIn("fast");	
	}
	
	function show_a_e_vttbsub(vttb_cat_id){
		$(\'#a_e_vttbsub\').css({\'display\':\'block\',\'z-index\':\'2010\'});
		$(\'#list_a_e_vttbsub_cont\').load(\'index.php?addEditVTTBSub&mod=vttbs&vttb_cat_id=\'+vttb_cat_id).fadeIn("fast");	
	}
	
	function show_edit_vttbcat(vttb_cat_id){
		$(\'#a_e_vttbcat\').css({\'display\':\'block\',\'z-index\':\'2010\'});
		$(\'#list_a_e_vttbcat_cont\').load(\'index.php?addEditVTTBCat&mod=vttbs&edit_me=1&vttb_cat_id=\'+vttb_cat_id).fadeIn("fast");	
	}
	
	function show_edit_vttbsub(vttb_cat_id,vttb_sub_id){
		$(\'#a_e_vttbsub\').css({\'display\':\'block\',\'z-index\':\'2010\'});
		$(\'#list_a_e_vttbsub_cont\').load(\'index.php?addEditVTTBSub&mod=vttbs&edit_me=1&vttb_cat_id=\'+vttb_cat_id+\'&vttb_sub_id=\'+vttb_sub_id).fadeIn("fast");	
	}
	
	function show_add_vttb_form(vttb_sub_id){
		if(typeof vttb_sub_id == \'undefined\'){ 
			alert(\'Bạn cần chọn danh mục trước khi thêm bản ghi\'); 
			return false;
		}
		$(\'#a_e_vttb\').css({\'display\':\'block\',\'z-index\':\'2010\'});
		$(\'#list_a_e_vttb_cont\').load(\'index.php?addEditVTTB&mod=vttbs&vttb_sub_id=\'+vttb_sub_id).fadeIn("fast");	
	}
	
	function show_edit_vttb_form(vttb_id,vttb_sub_id){
		$(\'#a_e_vttb\').css({\'display\':\'block\',\'z-index\':\'2010\'});
		$(\'#list_a_e_vttb_cont\').load(\'index.php?addEditVTTB&mod=vttbs&edit_me=1&vttb_id=\'+vttb_id+\'&vttb_sub_id=\'+vttb_sub_id).fadeIn("fast");	
	}
	
	function show_list_repare(vttb_id,vttb_sub_id){
		$(\'#list_repare\').css({\'display\':\'block\',\'z-index\':\'2010\'});
		$(\'#list_repare_cont\').load(\'index.php?listRepare&mod=vttbs&vttb_id=\'+vttb_id+\'&vttb_sub_id=\'+vttb_sub_id).fadeIn("fast");
	}
	
	function show_list_replace(vttb_id,vttb_sub_id){
		$(\'#list_replace\').css({\'display\':\'block\',\'z-index\':\'2010\'});
		$(\'#list_replace_cont\').load(\'index.php?listReplace&mod=vttbs&vttb_id=\'+vttb_id+\'&vttb_sub_id=\'+vttb_sub_id).fadeIn("fast");
	}
	
	function show_list_datlich(vttb_id,vttb_sub_id){
		$(\'#list_datlich\').css({\'display\':\'block\',\'z-index\':\'2010\'});
		$(\'#list_datlich_cont\').load(\'index.php?listDatlich&mod=vttbs&vttb_id=\'+vttb_id+\'&vttb_sub_id=\'+vttb_sub_id).fadeIn("fast");
	}
		
	$("#a_ref_Vttb_chung").click( function () { 
		$(\'#vttb_content_main\').hide();
		$(\'#vttb_content_main\').fadeOut(\'fast\').load(\'index.php?listVTTB_Chung&mod=vttbs\').fadeIn("fast");
	});
</script>
'; ?>