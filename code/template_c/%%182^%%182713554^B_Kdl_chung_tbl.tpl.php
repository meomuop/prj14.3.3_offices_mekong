<?php /* Smarty version 2.6.2, created on 2018-12-16 10:43:47
         compiled from E:%5CProjects%5Cwamp64%5Cwww%5Csmarty%5Cprj14.3.3_offices_mekong%5Ccode%5Cmodules%5Ckdls/skin/B_Kdl_chung_tbl.tpl */ ?>
<?php require_once(SMARTY_DIR . 'core' . DIRECTORY_SEPARATOR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'math', 'E:\Projects\wamp64\www\smarty\prj14.3.3_offices_mekong\code\modules\kdls/skin/B_Kdl_chung_tbl.tpl', 38, false),array('modifier', 'str_string_cut', 'E:\Projects\wamp64\www\smarty\prj14.3.3_offices_mekong\code\modules\kdls/skin/B_Kdl_chung_tbl.tpl', 43, false),array('modifier', 'date_format', 'E:\Projects\wamp64\www\smarty\prj14.3.3_offices_mekong\code\modules\kdls/skin/B_Kdl_chung_tbl.tpl', 120, false),)), $this); ?>
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

<div id="kdl_content_insign">
	<form method="post" name="frmList_Kdl_chung" action="?listKDL_Chung<?php echo $this->_tpl_vars['vars']['arg']; ?>
" id="frmList_Kdl_chung">
    <!------------------------------------KHO DU LIEU---------------------------------------------->
    <div style="float:left">
    <fieldset style="width:250px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:482px">
    <legend class="legend_list" style="width:200px">
        <div style="width:90px; float:left">Danh mục: <?php echo $this->_tpl_vars['total_num_result']; ?>
</div>
        <div style="width:90px; float:left">
        	Lọc với: <select name="kdl_name_fs" id="kdl_name_fs" class="select_tiny" style="width:35px" onchange="loc_dl(<?php echo $this->_tpl_vars['kdl_type']; ?>
);">
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
" <?php if ($this->_tpl_vars['char_arr'][$this->_sections['sli']['index']] == $this->_tpl_vars['kdl_name_fs']): ?>selected<?php endif; ?>><?php echo $this->_tpl_vars['char_arr'][$this->_sections['sli']['index']]; ?>
 </option>
                <?php endfor; endif; ?>
            </select>
        </div>
        <div style="width:20px; float:left; margin-top:2px; height:14px">
        	<a href="javascript: void(0)" onclick="javascript: show_add_form()">
        	<img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_add.png" class="img_all" title="Thêm mới"></a>
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
            	<div style="float:left; width:20px; text-align:center">&diams;</div>
                <div style="float:left; width:212px; white-space:nowrap" title="<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->kdl_name; ?>
">
                    <div style="float:left; width:190px; white-space:nowrap">
                    <a href="javascript:void(0);" onclick="javascript: show_list_dl(<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->kdl_id; ?>
,<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->kdl_type; ?>
,'<?php echo $this->_tpl_vars['vars']['arg']; ?>
')" <?php if ($this->_tpl_vars['kdl_id'] == $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->kdl_id): ?>} style="color:#F00" <?php endif; ?>><?php echo ((is_array($_tmp=$this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->kdl_name)) ? $this->_run_mod_handler('str_string_cut', true, $_tmp, '45', '1') : smarty_modifier_str_string_cut($_tmp, '45', '1')); ?>
</a>
                    </div>
                    <div style="float:right; margin:2px; height:18px; width:16px; text-align:center; background-color:#dfe8f6" title="Chức năng mở rộng" id="extra_icon_kdl_<?php echo $this->_tpl_vars['count']; ?>
">
                    <a href='javascript: void(0);' onclick="show_list_kdl_options(<?php echo $this->_tpl_vars['count']; ?>
,<?php echo $this->_tpl_vars['total_num_result']; ?>
)">
                    <img src="<?php echo $this->_tpl_vars['css_path']; ?>
extra_icon.png" width="14" height="14" border="0" class="img_all" style="margin:1px"></a>
                    </div>
                    <div id="extra_kdl_<?php echo $this->_tpl_vars['count']; ?>
" style="position:absolute; display:none; height:auto; width:60px; margin:2px 131px; border:1px solid #8ea4c1; border-right:1px solid #8ea4c1; background-color:#dfe8f6">
                        <div style="float:left; width:60px; height:18px; border-right:1px solid #dfe8f6"><b>&nbsp;Thao tác:</b></div>
                        <div style="float:left; width:60px; padding:0 0 0 3px">
                             - <a href="javascript: void(0)" onclick="javascript: show_edit_form(<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->kdl_id; ?>
,<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->kdl_type; ?>
)">Sửa</a>
                        </div>
                        <div style="float:left; width:60px; padding:0 0 0 3px">
                             - <a href="javascript: void(0)" onclick="javascript: delete_kdl(<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->kdl_id; ?>
,<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->kdl_type; ?>
)">Xóa</a>
                        </div>
                    </div>
                </div>
            </div>
            <?php endfor; endif; ?>
        </div>
        <input type="hidden" id="kdl_type" name="kdl_type" value="<?php echo $this->_tpl_vars['kdl_type']; ?>
" />
    </fieldset>
    </div>
    <!------------------------------------DU LIEU---------------------------------------------->
    <div style="float:left">
    <fieldset style="width:525px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:482px">
    <legend class="legend_list" style="width:340px">
        <div style="width:100px; float:left">Dữ liệu: <?php echo $this->_tpl_vars['total_dl']; ?>
</div>
        <div style="width:70px; float:left">&nbsp;|&nbsp;Tìm kiếm&nbsp;</div>
        <div style="width:100px; float:left">
        	<input type="text" name="keyword" id="keyword" class="text_seek" value="<?php echo $this->_tpl_vars['vars']['keyword']; ?>
"/>
            <input type="hidden" id="processurl" value="<?php echo $this->_tpl_vars['processurl']; ?>
" />
        </div>
        <div style="width:50px; float:left">
        	<input type="button" name="btnSeek" id="btnSeek" value="Tìm >>" class="button_seek" onclick="search_me_Dl(<?php echo $this->_tpl_vars['kdl_id']; ?>
,<?php echo $this->_tpl_vars['kdl_type']; ?>
)" /></div>
        <div style="width:20px; float:left; margin-top:2px; height:14px">
        	<a href="javascript: void(0)" onclick="javascript: show_add_dl_form(<?php echo $this->_tpl_vars['kdl_id']; ?>
,<?php echo $this->_tpl_vars['kdl_type']; ?>
)">
        	<img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_add.png" class="img_all" title="Thêm mới"></a>
        </div>
    </legend>
    	<div style="float:left; height:5px; width:100%"></div>
    	<div style="float:left; height:25px; width:507px; border-top:1px solid #99bbe8; border-bottom:1px solid #99bbe8 ">
            <div class="tbl_tit" style="width:30px; text-align:center"><b>STT</b></div>	
            <div class="tbl_tit" style="width:160px"><B>&nbsp;Tên dữ liệu</B></div>
            <div class="tbl_tit" style="width:192px"><B>&nbsp;Mô tả</B></div>
            <div class="tbl_tit" style="width:70px"><B>&nbsp;Ngày tháng</B></div>
            <div class="tbl_tit" style="width:50px"><B>&nbsp;Tệp tin</B></div>
        </div>
        <div style="float:left; height:428px; width:525px; overflow-y:scroll">
        	<?php if ($this->_tpl_vars['obj_list_dl']): ?>
            <?php if (isset($this->_sections['dli'])) unset($this->_sections['dli']);
$this->_sections['dli']['name'] = 'dli';
$this->_sections['dli']['loop'] = is_array($_loop=$this->_tpl_vars['obj_list_dl']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
$this->_sections['dli']['show'] = true;
$this->_sections['dli']['max'] = $this->_sections['dli']['loop'];
$this->_sections['dli']['step'] = 1;
$this->_sections['dli']['start'] = $this->_sections['dli']['step'] > 0 ? 0 : $this->_sections['dli']['loop']-1;
if ($this->_sections['dli']['show']) {
    $this->_sections['dli']['total'] = $this->_sections['dli']['loop'];
    if ($this->_sections['dli']['total'] == 0)
        $this->_sections['dli']['show'] = false;
} else
    $this->_sections['dli']['total'] = 0;
if ($this->_sections['dli']['show']):

            for ($this->_sections['dli']['index'] = $this->_sections['dli']['start'], $this->_sections['dli']['iteration'] = 1;
                 $this->_sections['dli']['iteration'] <= $this->_sections['dli']['total'];
                 $this->_sections['dli']['index'] += $this->_sections['dli']['step'], $this->_sections['dli']['iteration']++):
$this->_sections['dli']['rownum'] = $this->_sections['dli']['iteration'];
$this->_sections['dli']['index_prev'] = $this->_sections['dli']['index'] - $this->_sections['dli']['step'];
$this->_sections['dli']['index_next'] = $this->_sections['dli']['index'] + $this->_sections['dli']['step'];
$this->_sections['dli']['first']      = ($this->_sections['dli']['iteration'] == 1);
$this->_sections['dli']['last']       = ($this->_sections['dli']['iteration'] == $this->_sections['dli']['total']);
?>
            <?php if (!(!($this->_sections['dli']['index'] % 2))): ?> 
            <?php $this->assign('class_td', 'tbl_cont'); ?> 
            <?php else: ?>
            <?php $this->assign('class_td', 'tbl_cont2'); ?> 
            <?php endif; ?>
            <?php echo smarty_function_math(array('z' => $this->_sections['dli']['index'],'t' => 1,'equation' => "z+t",'assign' => 'stt'), $this);?>

            <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:30px; text-align:center"><?php echo $this->_tpl_vars['stt']; ?>
</div>
            <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:160px; white-space:nowrap" title="<?php echo $this->_tpl_vars['obj_list_dl'][$this->_sections['dli']['index']]->dl_name; ?>
">
            	<div style="float:left; width:130px; white-space:nowrap">&nbsp;<?php echo ((is_array($_tmp=$this->_tpl_vars['obj_list_dl'][$this->_sections['dli']['index']]->dl_name)) ? $this->_run_mod_handler('str_string_cut', true, $_tmp, '30', '1') : smarty_modifier_str_string_cut($_tmp, '30', '1')); ?>
</div>
                <div style="float:right; margin:2px; border:1px solid #8ea4c1; height:18px; width:16px; text-align:center; background-color:#dfe8f6" title="Chức năng mở rộng">
                <a href='javascript: void(0);' onclick="show_list_dl_options(<?php echo $this->_tpl_vars['stt']; ?>
,<?php echo $this->_tpl_vars['total_dl']; ?>
)">
                <img src="<?php echo $this->_tpl_vars['css_path']; ?>
extra_icon.png" width="14" height="14" border="0" class="img_all"></a>
                </div>
                <div id="extra_dl_<?php echo $this->_tpl_vars['stt']; ?>
" style="position:absolute; display:none; height:auto; width:60px; margin:2px 79px; border:1px solid #8ea4c1; border-right:1px solid #8ea4c1; background-color:#dfe8f6">
                    <div style="float:left; width:60px; height:18px; border-right:1px solid #dfe8f6"><b>&nbsp;Thao tác:</b></div>
                    <div style="float:left; width:60px; padding:0 0 0 3px">
                         - <a href="javascript: void(0)" onclick="javascript: show_edit_dl_form(<?php echo $this->_tpl_vars['obj_list_dl'][$this->_sections['dli']['index']]->dl_id; ?>
,<?php echo $this->_tpl_vars['kdl_id']; ?>
,<?php echo $this->_tpl_vars['kdl_type']; ?>
)">Sửa</a>
                    </div>
                    <div style="float:left; width:60px; padding:0 0 0 3px">
                         - <a href="javascript: void(0)" onclick="javascript: delete_dl(<?php echo $this->_tpl_vars['obj_list_dl'][$this->_sections['dli']['index']]->dl_id; ?>
,<?php echo $this->_tpl_vars['kdl_id']; ?>
,<?php echo $this->_tpl_vars['kdl_type']; ?>
)">Xóa</a>
                    </div>
                </div>
            </div>
            <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:192px; white-space:nowrap" title="<?php echo $this->_tpl_vars['obj_list_dl'][$this->_sections['dli']['index']]->dl_note; ?>
">
                &nbsp;<?php echo ((is_array($_tmp=$this->_tpl_vars['obj_list_dl'][$this->_sections['dli']['index']]->dl_note)) ? $this->_run_mod_handler('str_string_cut', true, $_tmp, '50', '1') : smarty_modifier_str_string_cut($_tmp, '50', '1')); ?>

            </div>
            <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:70px">
            	&nbsp;<?php echo ((is_array($_tmp=$this->_tpl_vars['obj_list_dl'][$this->_sections['dli']['index']]->dl_date)) ? $this->_run_mod_handler('date_format', true, $_tmp, '%d/%m/%Y') : smarty_modifier_date_format($_tmp, '%d/%m/%Y')); ?>

            </div>
            <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:50px; text-align:center">
                <?php if ($this->_tpl_vars['obj_list_dl'][$this->_sections['dli']['index']]->dl_file == 2): ?>
                <a href='javascript: void(0);' onclick="show_list_dl_file(<?php echo $this->_tpl_vars['obj_list_dl'][$this->_sections['dli']['index']]->dl_id; ?>
,<?php echo $this->_tpl_vars['kdl_id']; ?>
,<?php echo $this->_tpl_vars['kdl_type']; ?>
)">
                <img src="../images/admin/empty_icon.png" width="14" height="14" border="0"></a>
                <?php else: ?>
                <a href='javascript: void(0);' onclick="show_list_dl_file(<?php echo $this->_tpl_vars['obj_list_dl'][$this->_sections['dli']['index']]->dl_id; ?>
,<?php echo $this->_tpl_vars['kdl_id']; ?>
,<?php echo $this->_tpl_vars['kdl_type']; ?>
)">
                <img src="../images/admin/folder_icon.png" width="14" height="14" border="0"></a>
                <?php endif; ?>
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

	function show_list_kdl_options(count,total){
		for(i=1;i<=total;i++){
			if(i==count){
				if(document.getElementById(\'extra_kdl_\'+i).style.display==\'none\'){
					document.getElementById(\'extra_kdl_\'+i).style.display=\'block\';
					$(\'#extra_icon_kdl_\'+i).css({\'border\':\'1px solid #8ea4c1\'});
				}else{
					document.getElementById(\'extra_kdl_\'+i).style.display=\'none\';
					$(\'#extra_icon_kdl_\'+i).css({\'border\':\'none\'});
				}
			}
			else{
				document.getElementById(\'extra_kdl_\'+i).style.display=\'none\';
				$(\'#extra_icon_kdl_\'+i).css({\'border\':\'none\'});
			}
		}
	}
	
	function delete_kdl(delStr,kdl_type){
		if(!confirm("THÔNG BÁO: \\n\\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
			return false;
		}	
				
		var dataString = "dlStr=" + delStr +"";
			//alert (dataString);
		$.ajax({
			type: "POST",
			url: \'index.php?listKDL_Chung&mod=kdls&del_kdl=1&kdl_id=\'+delStr+\'&kdl_type=\'+kdl_type,
			data: dataString,
			success: function(data) {
				$(\'#kdl_content_main\').fadeOut(\'fast\').load(\'index.php?listKDL_Chung&mod=kdls&kdl_id=\'+delStr+\'&kdl_type=\'+kdl_type).fadeIn("fast");
			}
		});
	}
	
	function show_list_dl_options(count,total){
		for(i=1;i<=total;i++){
			if(i==count){
				if(document.getElementById(\'extra_dl_\'+i).style.display==\'none\')
					document.getElementById(\'extra_dl_\'+i).style.display=\'block\';
				else
					document.getElementById(\'extra_dl_\'+i).style.display=\'none\';
			}
			else
				document.getElementById(\'extra_dl_\'+i).style.display=\'none\';
		}
	}
	
	function delete_dl(delStr,kdl_id,kdl_type){
		if(!confirm("THÔNG BÁO: \\n\\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
			return false;
		}	
				
		var dataString = "dlStr=" + delStr +"";
			//alert (dataString);
		$.ajax({
			type: "POST",
			url: \'index.php?listKDL_Chung&mod=kdls&del_dl=1&kdl_id=\'+kdl_id+\'&kdl_type=\'+kdl_type,
			data: dataString,
			success: function(data) {
				$(\'#kdl_content_main\').fadeOut(\'fast\').load(\'index.php?listKDL_Chung&mod=kdls&kdl_id=\'+kdl_id+\'&kdl_type=\'+kdl_type).fadeIn("fast");
			}
		});
	}
	
	function show_list_dl(kdl_id,kdl_type,vars_arg){
		$(\'#kdl_content_main\').load(\'index.php?listKDL_Chung&mod=kdls\'+vars_arg+\'&kdl_id=\'+kdl_id+\'&kdl_type=\'+kdl_type).fadeIn("fast");
	}
	
	function search_me_Dl(kdl_id,kdl_type){
		var keyword 			= document.getElementById(\'keyword\').value;
		if (keyword == ""){
			return false;
		}
		
		$.post(\'?listKDL_Chung&mod=kdls&kdl_id=\'+kdl_id+\'&kdl_type=\'+kdl_type,
			{keyword:keyword},
			function(data){
				$(\'#kdl_content_main\').html(data);
				$("#kdl_content_main").show();
			}
		);
	}
	
	function loc_dl(kdl_type){
		var kdl_name_fs = document.getElementById(\'kdl_name_fs\').value;		
		$.post(\'?listKDL_Chung&mod=kdls&kdl_type=\'+kdl_type,
			{kdl_name_fs:kdl_name_fs},
			function(data){
				$(\'#kdl_content_main\').html(data);
				$("#kdl_content_main").show();
			}
		);
	}
	
	function show_list_dl_file(dl_id,kdl_id,kdl_type){

		$(\'#dl_file\').css({\'display\':\'block\',\'z-index\':\'2010\'});
		$("#dl_file_cont").load("?listDlFile&mod=kdls&dl_id="+dl_id+"&kdl_id="+kdl_id+"&kdl_type="+kdl_type);
	}
	
	function show_add_form(){
		$(\'#add_edit_kdl\').css({\'display\':\'block\',\'z-index\':\'2010\'});
		$(\'#list_add_edit_kdl_cont\').load(\'index.php?addEditKDL&mod=kdls\').fadeIn("fast");	
	}
	
	function show_edit_form(kdl_id,kdl_type){
		$(\'#add_edit_kdl\').css({\'display\':\'block\',\'z-index\':\'2010\'});
		$(\'#list_add_edit_kdl_cont\').load(\'index.php?addEditKDL&mod=kdls&edit_me=1&kdl_id=\'+kdl_id).fadeIn("fast");	
	}
	
	function show_add_dl_form(kdl_id,kdl_type){
		if(typeof kdl_id == \'undefined\'){ 
			alert(\'Bạn cần chọn danh mục trước khi thêm dữ liệu\'); 
			return false;
		}
		$(\'#add_edit_dl\').css({\'display\':\'block\',\'z-index\':\'2010\'});
		$(\'#list_add_edit_dl_cont\').load(\'index.php?addEditDL&mod=kdls&kdl_id=\'+kdl_id+\'&kdl_type=\'+kdl_type).fadeIn("fast");	
	}
	
	function show_edit_dl_form(dl_id,kdl_id,kdl_type){
		$(\'#add_edit_dl\').css({\'display\':\'block\',\'z-index\':\'2010\'});
		$(\'#list_add_edit_dl_cont\').load(\'index.php?addEditDL&mod=kdls&edit_me=1&dl_id=\'+dl_id+\'&kdl_id=\'+kdl_id+\'&kdl_type=\'+kdl_type).fadeIn("fast");	
	}
		
	$("#a_ref_Kdl_chung").click( function () { 
		var kdl_type = document.getElementById(\'kdl_type\').value;
		$(\'#kdl_content_main\').hide();
		$(\'#kdl_content_main\').fadeOut(\'fast\').load(\'index.php?listKDL_Chung&mod=kdls&kdl_type=\'+kdl_type).fadeIn("fast");
	});
</script>
'; ?>