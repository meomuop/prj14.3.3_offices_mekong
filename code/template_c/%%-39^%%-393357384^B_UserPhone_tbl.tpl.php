<?php /* Smarty version 2.6.2, created on 2018-12-16 10:43:35
         compiled from E:%5CProjects%5Cwamp64%5Cwww%5Csmarty%5Cprj14.3.3_offices_mekong%5Ccode%5Cmodules%5Cusers/skin/B_UserPhone_tbl.tpl */ ?>
<?php require_once(SMARTY_DIR . 'core' . DIRECTORY_SEPARATOR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'math', 'E:\Projects\wamp64\www\smarty\prj14.3.3_offices_mekong\code\modules\users/skin/B_UserPhone_tbl.tpl', 59, false),)), $this); ?>
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

<div id="danhba_content_insign">
	<form method="post" name="frmList_User" action="?listUserPhone<?php echo $this->_tpl_vars['vars']['arg']; ?>
" id="frmList_User">
    <!------------------------------------PHONG BAN---------------------------------------------->
    <div style="float:left">
    <fieldset style="width:200px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:482px">
    <legend class="legend_list" style="width:120px">
        <div style="width:130px; float:left">Phòng/ban: <?php echo $this->_tpl_vars['total_depart']; ?>
</div>
    </legend>
    	<div style="float:left; height:5px; width:100%"></div>
        <div style="float:left; height:455px; width:200px; overflow-y:scroll">
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
            <div style="float:left; line-height:30px">
            	<div style="float:left; width:20px; text-align:center">&diams;</div>
                <div style="float:left; width:152px">
                <a href="javascript:void(0);" onclick="javascript: show_list_phone(<?php echo $this->_tpl_vars['obj_list_department'][$this->_sections['di']['index']]->department_id; ?>
)" <?php if ($this->_tpl_vars['department_id'] == $this->_tpl_vars['obj_list_department'][$this->_sections['di']['index']]->department_id): ?>} style="color:#F00" <?php endif; ?>><?php echo $this->_tpl_vars['obj_list_department'][$this->_sections['di']['index']]->department_name; ?>
</a>
                </div>
            </div>
            <?php endfor; endif; ?>
        </div>
        <input type="hidden" id="curpage_User" name="curpage" value="<?php echo $this->_tpl_vars['vars']['curpage']; ?>
" />
    </fieldset>
    </div>
    <!------------------------------------DANH BA---------------------------------------------->
    <div style="float:left">
    <fieldset style="width:564px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:482px">
    <legend class="legend_list" style="width:150px">
        <div style="width:130px; float:left">Danh bạ: <?php echo $this->_tpl_vars['total_num_result']; ?>
</div>
    </legend>
    	<div style="float:left; height:5px; width:100%"></div>
    	<div style="float:left; height:25px; width:547px; border-top:1px solid #99bbe8; border-bottom:1px solid #99bbe8 ">
            <div class="tbl_tit" style="width:30px; text-align:center"><b>STT</b></div>	
            <div class="tbl_tit" style="width:139px"><B>&nbsp;Họ tên</B></div>
            <div class="tbl_tit" style="width:134px"><B>&nbsp;Chức vụ</B></div>
            <div class="tbl_tit" style="width:80px"><B>&nbsp;Điện thoại</B></div>
            <div class="tbl_tit" style="width:159px"><B>&nbsp;Email</B></div>
        </div>
        <div style="float:left; height:428px; width:565px; overflow-y:scroll">
            <?php if (isset($this->_sections['ui'])) unset($this->_sections['ui']);
$this->_sections['ui']['name'] = 'ui';
$this->_sections['ui']['loop'] = is_array($_loop=$this->_tpl_vars['obj_list']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
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
            <?php if (!(!($this->_sections['ui']['index'] % 2))): ?> 
            <?php $this->assign('class_td', 'tbl_cont'); ?> 
            <?php else: ?>
            <?php $this->assign('class_td', 'tbl_cont2'); ?> 
            <?php endif; ?>
            <?php echo smarty_function_math(array('z' => $this->_sections['ui']['index'],'t' => 1,'equation' => "z+t",'assign' => 'stt'), $this);?>

            <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:30px; text-align:center"><?php echo $this->_tpl_vars['stt']; ?>
</div>
            <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:139px">
            	&nbsp;<?php echo $this->_tpl_vars['obj_list'][$this->_sections['ui']['index']]->user_fullname; ?>

            </div>
            <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:134px">
                <?php if (isset($this->_sections['oi'])) unset($this->_sections['oi']);
$this->_sections['oi']['name'] = 'oi';
$this->_sections['oi']['loop'] = is_array($_loop=$this->_tpl_vars['obj_list_object']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
$this->_sections['oi']['show'] = true;
$this->_sections['oi']['max'] = $this->_sections['oi']['loop'];
$this->_sections['oi']['step'] = 1;
$this->_sections['oi']['start'] = $this->_sections['oi']['step'] > 0 ? 0 : $this->_sections['oi']['loop']-1;
if ($this->_sections['oi']['show']) {
    $this->_sections['oi']['total'] = $this->_sections['oi']['loop'];
    if ($this->_sections['oi']['total'] == 0)
        $this->_sections['oi']['show'] = false;
} else
    $this->_sections['oi']['total'] = 0;
if ($this->_sections['oi']['show']):

            for ($this->_sections['oi']['index'] = $this->_sections['oi']['start'], $this->_sections['oi']['iteration'] = 1;
                 $this->_sections['oi']['iteration'] <= $this->_sections['oi']['total'];
                 $this->_sections['oi']['index'] += $this->_sections['oi']['step'], $this->_sections['oi']['iteration']++):
$this->_sections['oi']['rownum'] = $this->_sections['oi']['iteration'];
$this->_sections['oi']['index_prev'] = $this->_sections['oi']['index'] - $this->_sections['oi']['step'];
$this->_sections['oi']['index_next'] = $this->_sections['oi']['index'] + $this->_sections['oi']['step'];
$this->_sections['oi']['first']      = ($this->_sections['oi']['iteration'] == 1);
$this->_sections['oi']['last']       = ($this->_sections['oi']['iteration'] == $this->_sections['oi']['total']);
?>
                	<?php if ($this->_tpl_vars['obj_list_object'][$this->_sections['oi']['index']]->object_id == $this->_tpl_vars['obj_list'][$this->_sections['ui']['index']]->object_id): ?>
                	&nbsp;<?php echo $this->_tpl_vars['obj_list_object'][$this->_sections['oi']['index']]->object_name; ?>

                	<?php endif; ?>
                <?php endfor; endif; ?>
            </div>
            <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:80px">
            	&nbsp;<?php echo $this->_tpl_vars['obj_list'][$this->_sections['ui']['index']]->user_phone; ?>

            </div>
            <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:159px">
                &nbsp;<?php echo $this->_tpl_vars['obj_list'][$this->_sections['ui']['index']]->user_email; ?>

            </div>
            <?php endfor; endif; ?>
        </div>
    </fieldset>
    </div>
    </form>
</div>
<?php echo '
<script language="javascript">	
	
	function show_list_phone(department_id){
		$(\'#danhba_content_main\').load(\'index.php?listUserPhone&mod=users&department_id=\'+department_id).fadeIn("fast");
	}
	
	
	function search_me_User(){
		var keyword 			= document.getElementById(\'keyword\').value;
		var department_id_fs 	= document.getElementById(\'department_id_fs\').value;
		var object_id_fs 		= document.getElementById(\'object_id_fs\').value;
		if (keyword == "" && department_id_fs == 0 && department_id_fs == 0){
			return false;
		}
		
		$.post(\'?listUserPhone&mod=users\',
			{keyword:keyword,department_id_fs:department_id_fs,object_id_fs:object_id_fs},
			function(data){
				$(\'#danhba_content_main\').html(data);
				$("#danhba_content_main").show();
			}
		);
	}
	
	$("#a_ref_User").click( function () { 
			$(\'#danhba_content_main\').hide();
			$(\'#danhba_content_main\').fadeOut(\'fast\').load(\'index.php?listUserPhone&mod=users\').fadeIn("fast");
		});
</script>
'; ?>