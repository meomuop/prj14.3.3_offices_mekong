<?php /* Smarty version 2.6.2, created on 2018-12-16 10:27:32
         compiled from E:%5CProjects%5Cwamp64%5Cwww%5Csmarty%5Cprj14.3.3_offices_mekong%5Ccode%5Cmodules%5Cdocs/skin/B_DocCat_tbl.tpl */ ?>
<?php require_once(SMARTY_DIR . 'core' . DIRECTORY_SEPARATOR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'math', 'E:\Projects\wamp64\www\smarty\prj14.3.3_offices_mekong\code\modules\docs/skin/B_DocCat_tbl.tpl', 189, false),)), $this); ?>
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

<div id="thuoctinh_content_insign">
	<form method="post" name="frmList_DocCat" action="?listDocCat<?php echo $this->_tpl_vars['vars']['arg']; ?>
" id="frmList_DocCat">
    <!------------------------------------------THEM MOI------------------------------------>
    <fieldset style="width:912px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
    <legend class="legend_list">
        Thêm/Chỉnh sửa&nbsp;|&nbsp;Thông báo:&nbsp;
        <span id="lblError_DocCat" class="error">Mời bạn nhập đủ dữ liệu!</span>
    </legend>
    	<table width="98%" cellspacing="0" cellpadding="0" border="0" style="margin-left:5px">
        	<tr height="10"><td colspan="4"></td></tr>
            <tr height="30">
                <td width="12%" align="left" height="20">Tên chủng loại <font color="#FF0000">*</font>:</td>		
                <td align="left" width="22%">
                <input type="text" name="docCat_name" id="docCat_name" class="text_middle" value="<?php echo $this->_tpl_vars['obj_info']['docCat_name']; ?>
"/>
                </td>
                <td align="left" width="15%">Tên viết tắt <font color="#FF0000">*</font>:</td>
                <td align="left" width="22%">
                <input type="text" id="docCat_standfor" name="docCat_standfor" class="text_short" value="<?php echo $this->_tpl_vars['obj_info']['docCat_standfor']; ?>
" onfocus="hide_message_DocCat()"/>
                </td>
                <td align="left" width="15%">Cách chuyển:</td>
                <td align="left">
                <select name="docCat_type" id="docCat_type" class="select_short">
                	<option value="0" <?php if ($this->_tpl_vars['obj_info']['docCat_type'] == 0): ?> selected="selected"<?php endif; ?>>Có phân loại</option>
                    <option value="1" <?php if ($this->_tpl_vars['obj_info']['docCat_type'] == 1): ?> selected="selected"<?php endif; ?>>Chuyển thẳng</option>
                </select>
                </td>
            </tr>
            <tr height="30">
                <td align="left" height="20">Văn bản đi:</td>		
                <td align="left">
                <select name="docCat_out" id="docCat_out" class="select_short">
                	<option value="0" <?php if ($this->_tpl_vars['obj_info']['docCat_out'] == 0): ?> selected="selected"<?php endif; ?>>Không</option>
                    <option value="1" <?php if ($this->_tpl_vars['obj_info']['docCat_out'] == 1): ?> selected="selected"<?php endif; ?>>Có</option>
                </select>
                </td>
                <td align="left">Tên phòng/ban theo SKH:</td>
                <td align="left">
                <select name="docCat_viewdepart" id="docCat_viewdepart" class="select_short">
                	<option value="0" <?php if ($this->_tpl_vars['obj_info']['docCat_viewdepart'] == 0): ?> selected="selected"<?php endif; ?>>Không</option>
                    <option value="1" <?php if ($this->_tpl_vars['obj_info']['docCat_viewdepart'] == 1): ?> selected="selected"<?php endif; ?>>Có</option>
                </select>
                </td>
                <td align="left">Tên chủng loại theo SKH:</td>
                <td align="left">
                <select name="docCat_view" id="docCat_view" class="select_short">
                	<option value="0" <?php if ($this->_tpl_vars['obj_info']['docCat_view'] == 0): ?> selected="selected"<?php endif; ?>>Không</option>
                    <option value="1" <?php if ($this->_tpl_vars['obj_info']['docCat_view'] == 1): ?> selected="selected"<?php endif; ?>>Có</option>
                </select>
                </td>
            </tr>
            <tr height="30">
            	<td align="left" height="20">Số đi riêng:</td>		
                <td align="left">
                <select name="docCat_typical" id="docCat_typical" class="select_short">
                	<option value="0" <?php if ($this->_tpl_vars['obj_info']['docCat_typical'] == 0): ?> selected="selected"<?php endif; ?>>Không</option>
                    <option value="1" <?php if ($this->_tpl_vars['obj_info']['docCat_typical'] == 1): ?> selected="selected"<?php endif; ?>>Có</option>
                </select>
                </td>
                <td align="left">Tình trạng :</td>
                <td align="left">
                	<?php if ($this->_tpl_vars['obj_info']['docCat_active'] != ''): ?>
                    <input type="radio" id="docCat_active" name="docCat_active" value="1" <?php if ($this->_tpl_vars['obj_info']['docCat_active'] == 1): ?> checked="checked" <?php endif; ?> />&nbsp;Hiển thị&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" id="docCat_active" name="docCat_active" value="2" <?php if ($this->_tpl_vars['obj_info']['docCat_active'] == 2): ?> checked="checked" <?php endif; ?> />&nbsp;Không hiển thị
                    <?php else: ?>
                    <input type="radio" id="docCat_active" name="docCat_active" value="1" checked/>&nbsp;Hiển thị&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" id="docCat_active" name="docCat_active" value="2" />&nbsp;Không hiển thị
                    <?php endif; ?>
                </td>
                <td align="left" colspan="2">
                	<input type="button" name="btnSub_DocCat" id="btnSub_DocCat" value="Ghi lại" class="button" />
                    <input type="hidden" name="docCat_id" id="docCat_id" value="<?php echo $this->_tpl_vars['obj_info']['docCat_id']; ?>
">
                    <input type="reset" name="Reset" value="Hủy bỏ" class="button" />
                    <?php echo '
                    <script language="javascript">
                        function hide_message_DocCat(){
                            $(\'#lblMessage_DocCat\').hide();
                            $(\'#lblError_DocCat\').hide();
                        }
                        
                        $(function() {
                        $(\'.error\').hide();
                        $(\'#lblMessage_DocCat\').hide();
                         
                        $("#btnSub_DocCat").click(function() {
                            $(\'.error\').hide();
                             
                            var $form = $("#frmList_DocCat");
                            var docCat_name = $form.find(\'input#docCat_name\').val();
							var docCat_standfor = $form.find(\'input#docCat_standfor\').val();
							var docCat_type = $form.find(\'select#docCat_type :selected\').val();
							var docCat_out = $form.find(\'select#docCat_out :selected\').val();
							var docCat_viewdepart = $form.find(\'select#docCat_viewdepart :selected\').val();
							var docCat_view = $form.find(\'select#docCat_view :selected\').val();
							var docCat_typical = $form.find(\'select#docCat_typical :selected\').val();
                            var docCat_active = $form.find(\'input#docCat_active:checked\').val();
                            var docCat_id = $form.find(\'input#docCat_id\').val();
                             
                            //begin validate form
                            if (docCat_name == ""){
                                $(\'#lblError_DocCat\').show();
                            }
                            else{
                                var dataString  = "docCat_name=" + docCat_name;
									dataString += "&docCat_standfor=" + docCat_standfor;
									dataString += "&docCat_type=" + docCat_type;
									dataString += "&docCat_out=" + docCat_out;
									dataString += "&docCat_viewdepart=" + docCat_viewdepart;
									dataString += "&docCat_view=" + docCat_view;
									dataString += "&docCat_typical=" + docCat_typical;
                                    dataString += "&docCat_active=" + docCat_active;
                                    dataString += "&docCat_id=" + docCat_id +"";
                                    //alert (dataString);return false;
                                $.ajax({
                                    type: "POST",
                                    url: "index.php?listDocCat&mod=docs&add_edit=1",
                                    data: dataString,
                                    success: function(data) {
                                        $(\'#thuoctinh_content_main\').fadeOut(\'fast\').load(\'index.php?listDocCat&mod=docs\').fadeIn("fast");
                                        //$(\'#lblMessage_DocCat\').show();
                                    }
                                });
                                return false;
                            }
                            //end form
                        });
                    });
                    </script>
                    '; ?>

                </td>
            </tr>
        </table>
    </fieldset>
    
    <!------------------------------------DANH SACH---------------------------------------------->
    <fieldset style="width:912px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:332px">
    <legend class="legend_list">
        <div style="width:130px; float:left">Danh sách: <?php echo $this->_tpl_vars['total_num_result']; ?>
</div>
        <div style="width:70px; float:left">&nbsp;|&nbsp;Tìm kiếm&nbsp;</div>
        <div style="width:100px; float:left">
        	<input type="text" name="keyword" id="keyword" class="text_seek" value="<?php echo $this->_tpl_vars['vars']['keyword']; ?>
"/>
            <input type="hidden" id="processurl" value="<?php echo $this->_tpl_vars['processurl']; ?>
" />
        </div>
        <div style="width:50px; float:left">
        	<input type="button" name="btnSeek" id="btnSeek" value="Tìm >>" class="button_seek" onclick="search_me_DocCat()" /></div>
    </legend>
    	<div style="float:left; height:5px; width:100%"></div>
        <div style="float:left; height:25px; width:890px; border-top:1px solid #99bbe8; border-bottom:1px solid #99bbe8 ">
            <div class="tbl_tit" style="width:30px; text-align:center"><b>STT</b></div>	
            <div class="tbl_tit" style="width:153px"><B>&nbsp;Tên loại</B></div>
            <div class="tbl_tit" style="width:60px"><B>&nbsp;Viết tắt</B></div>
            <div class="tbl_tit" style="width:100px"><B>&nbsp;Cách chuyển</B></div>
            <div class="tbl_tit" style="width:80px; text-align:center"><B>Văn bản đi</B></div>
            <div class="tbl_tit" style="width:80px; text-align:center"><B>PB theo SKH</B></div>
            <div class="tbl_tit" style="width:80px; text-align:center"><B>LVB theo SKH</B></div>
            <div class="tbl_tit" style="width:80px; text-align:center"><B>Số đi riêng</B></div>
            <div class="tbl_tit" style="width:59px; text-align:center"><B>Sắp xếp</B></div>
            <div class="tbl_tit" style="width:59px; text-align:center"><B>Hiển thị</B></div>
            <div class="tbl_tit" style="width:59px; text-align:center"><B>Chọn</B></div>
            <div class="tbl_tit" style="width:39px; text-align:center">
            <input type="hidden" name="chon" id="chon_DocCat">
            <input type="checkbox" name="chkall" value="0" onclick="docheck_DocCat(document.frmList_DocCat.chkall.checked,0);">
            </div>
        </div>
        <div style="float:left; width:20px; text-align:right">
        <input type="button" name="del_Items" id='del_Items' value="&nbsp;" onClick="delItems_DocCat('<?php echo $this->_tpl_vars['processurl']; ?>
');" style="width:17px; font-size:12px; background:url(../images/admin/b_drop.png); cursor:pointer" title="Xóa lựa chọn">
        </div>
        <div style="float:left; height:275px; width:910px; overflow-y:scroll">
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
" style="width:30px; text-align:center"><?php echo $this->_tpl_vars['stt']; ?>
</div>
            <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:153px">
            	&nbsp;<a href="javascript: void(0);" onclick="edit_me_DocCat(<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docCat_id; ?>
)" ><?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docCat_name; ?>
</a>
            </div>
            <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:60px">
            	&nbsp;<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docCat_standfor; ?>

            </div>
            <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:100px">
            	&nbsp;<?php if ($this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docCat_type == 1): ?>Chuyển thẳng<?php else: ?>Có phân loại<?php endif; ?>
            </div>
            <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:80px; text-align:center">
                <?php if ($this->_tpl_vars['per_act'] == 1): ?>
                <?php if ($this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docCat_out == 1): ?>
                    <a href='javascript: void(0);' onclick="uncheck_fns_DocCat('docCat_out',2,<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docCat_id; ?>
)"><img src="../images/admin/tick.png" width="10" height="10" border="0" title="Ẩn"></a>
                <?php else: ?>
                    <a href='javascript: void(0);' onclick="uncheck_fns_DocCat('docCat_out',1,<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docCat_id; ?>
)"><img src="../images/admin/publish_x.png" width="10" height="10" border="0" title="Hiện"></a>
                <?php endif; ?>
                <?php else: ?>-<?php endif; ?>
            </div>
            <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:80px; text-align:center">
                <?php if ($this->_tpl_vars['per_act'] == 1): ?>
                <?php if ($this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docCat_viewdepart == 1): ?>
                    <a href='javascript: void(0);' onclick="uncheck_fns_DocCat('docCat_viewdepart',2,<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docCat_id; ?>
)"><img src="../images/admin/tick.png" width="10" height="10" border="0" title="Ẩn"></a>
                <?php else: ?>
                    <a href='javascript: void(0);' onclick="uncheck_fns_DocCat('docCat_viewdepart',1,<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docCat_id; ?>
)"><img src="../images/admin/publish_x.png" width="10" height="10" border="0" title="Hiện"></a>
                <?php endif; ?>
                <?php else: ?>-<?php endif; ?>
            </div>
            <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:80px; text-align:center">
                <?php if ($this->_tpl_vars['per_act'] == 1): ?>
                <?php if ($this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docCat_view == 1): ?>
                    <a href='javascript: void(0);' onclick="uncheck_fns_DocCat('docCat_view',2,<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docCat_id; ?>
)"><img src="../images/admin/tick.png" width="10" height="10" border="0" title="Ẩn"></a>
                <?php else: ?>
                    <a href='javascript: void(0);' onclick="uncheck_fns_DocCat('docCat_view',1,<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docCat_id; ?>
)"><img src="../images/admin/publish_x.png" width="10" height="10" border="0" title="Hiện"></a>
                <?php endif; ?>
                <?php else: ?>-<?php endif; ?>
            </div>
            <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:80px; text-align:center">
            	&nbsp;<?php if ($this->_tpl_vars['per_act'] == 1): ?>
                <?php if ($this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docCat_typical == 1): ?>
                    <a href='javascript: void(0);' onclick="uncheck_fns_DocCat('docCat_typical',2,<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docCat_id; ?>
)"><img src="../images/admin/tick.png" width="10" height="10" border="0" title="Ẩn"></a>
                <?php else: ?>
                    <a href='javascript: void(0);' onclick="uncheck_fns_DocCat('docCat_typical',1,<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docCat_id; ?>
)"><img src="../images/admin/publish_x.png" width="10" height="10" border="0" title="Hiện"></a>
                <?php endif; ?>
                <?php else: ?>-<?php endif; ?>
            </div>
            <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:59px; text-align:center">
                <select name="docCat_sort[]" onchange="sort_me_DocCat(<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docCat_id; ?>
,this.value)" class="select_tiny">
                <?php if (isset($this->_sections['i'])) unset($this->_sections['i']);
$this->_sections['i']['name'] = 'i';
$this->_sections['i']['loop'] = is_array($_loop=$this->_tpl_vars['total_num_result']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
$this->_sections['i']['show'] = true;
$this->_sections['i']['max'] = $this->_sections['i']['loop'];
$this->_sections['i']['step'] = 1;
$this->_sections['i']['start'] = $this->_sections['i']['step'] > 0 ? 0 : $this->_sections['i']['loop']-1;
if ($this->_sections['i']['show']) {
    $this->_sections['i']['total'] = $this->_sections['i']['loop'];
    if ($this->_sections['i']['total'] == 0)
        $this->_sections['i']['show'] = false;
} else
    $this->_sections['i']['total'] = 0;
if ($this->_sections['i']['show']):

            for ($this->_sections['i']['index'] = $this->_sections['i']['start'], $this->_sections['i']['iteration'] = 1;
                 $this->_sections['i']['iteration'] <= $this->_sections['i']['total'];
                 $this->_sections['i']['index'] += $this->_sections['i']['step'], $this->_sections['i']['iteration']++):
$this->_sections['i']['rownum'] = $this->_sections['i']['iteration'];
$this->_sections['i']['index_prev'] = $this->_sections['i']['index'] - $this->_sections['i']['step'];
$this->_sections['i']['index_next'] = $this->_sections['i']['index'] + $this->_sections['i']['step'];
$this->_sections['i']['first']      = ($this->_sections['i']['iteration'] == 1);
$this->_sections['i']['last']       = ($this->_sections['i']['iteration'] == $this->_sections['i']['total']);
?>
                    <option value="<?php echo $this->_sections['i']['index']; ?>
" <?php if ($this->_sections['i']['index'] == $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docCat_sort): ?> selected="selected"<?php endif; ?>><?php echo $this->_sections['i']['index']; ?>
</option>
                <?php endfor; endif; ?>
                </select>
                <input type="hidden" name="docCat_id1[]" value="<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docCat_id; ?>
">
            </div>
            <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:59px; text-align:center">
                <?php if ($this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docCat_active == 1): ?>
                    <a href='javascript: void(0);' onclick="uncheck_fns_DocCat('docCat_active',2,<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docCat_id; ?>
)"><img src="../images/admin/tick.png" width="10" height="10" border="0" title="Ẩn"></a>
                <?php else: ?>
                    <a href='javascript: void(0);' onclick="uncheck_fns_DocCat('docCat_active',1,<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docCat_id; ?>
)"><img src="../images/admin/publish_x.png" width="10" height="10" border="0" title="Hiện"></a>
                <?php endif; ?>
            </div>
            <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:29px; text-align:center">
                <a href='javascript: void(0);' onclick="edit_me_DocCat(<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docCat_id; ?>
)">
                <img src="../images/admin/b_edit.png" width="11" height="11" border="0" title="Sửa"></a>
            </div>
            <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:29px; text-align:center">
                <a href='javascript: void(0'  onClick="delItems_DocCat('<?php echo $this->_tpl_vars['processurl']; ?>
', <?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docCat_id; ?>
);">
                <img src="../images/admin/b_drop.png" width="11" height="11" border="0" title="Xóa"></a>
            </div>
            <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:39px; text-align:center">
            	<input type="checkbox" name="chkid" value="<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docCat_id; ?>
" onclick="docheckone_DocCat();">
            </div>
            <?php endfor; endif; ?>
        </div>
        <input type="hidden" id="curpage_DocCat" name="curpage" value="<?php echo $this->_tpl_vars['vars']['curpage']; ?>
" />
    </fieldset>
    </form>
</div>
<!------------------------------------------------- Tool bar --------------------------------------------->
<div id="doc_clear_txt"></div>
<div id="doc_tool_bar">

    <div id="doc_search_area">
    <select name="order" id="order_DocCat" style="width:120px; font-size:12px; border:1px solid #99bbe8" onchange="reloadPage_DocCat('<?php echo $this->_tpl_vars['processurl']; ?>
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
    <a href="javascript: void(0)" id="first_page" onclick="gotoPage_DocCat('<?php echo $this->_tpl_vars['processurl']; ?>
',parseInt(1));" title="Trang đầu">
    	<img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_first_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="pre_page" onclick="gotoPage_DocCat('<?php echo $this->_tpl_vars['processurl']; ?>
',parseInt(document.getElementById('page_DocCat').value)-parseInt(1));" title="Trang trước">
    	<img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_pre_page.png" class="img_all">
    </a>
    <?php endif; ?>
    </div>
    <div style="float:left; line-height:19px">
        <div style="float:left; width:35px">Trang</div> 
        <div style="float:left; width:35px">
        <input type="text" value="<?php echo $this->_tpl_vars['vars']['curpage']; ?>
" name="page" id="page_DocCat" onblur=" gotoPage_DocCat('<?php echo $this->_tpl_vars['processurl']; ?>
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
    <a href="javascript: void(0)" id="next_page" onclick="gotoPage_DocCat('<?php echo $this->_tpl_vars['processurl']; ?>
',parseInt(document.getElementById('page_DocCat').value)+parseInt(1));" title="Trang tiếp">
    	<img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_next_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="last_page" onclick="gotoPage_DocCat('<?php echo $this->_tpl_vars['processurl']; ?>
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
    <a href="javascript: void(0)" id="a_ref_DocCat" title="Tải lại"><img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_refresh.png" class="img_all"></a>
    </div>
    
    <div style="float:left; width:12px; background-image:url(<?php echo $this->_tpl_vars['css_path']; ?>
gach_doc.png)">&nbsp;</div>
    <div style="float:right; line-height:19px; margin-right:2px">
        <div style="float:left; width:40px">Xem</div>
        <div style="float:left; width:52px">
            <select name="numresult" id="numresult_DocCat" style="width:50px; font-size:12px; border:1px solid #99bbe8" onchange="reloadPage_DocCat('<?php echo $this->_tpl_vars['processurl']; ?>
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
        <div style="float:left">dòng / trang</div>
    </div>
    
</div>
<?php echo '
<script language="javascript">	
	function docheck_DocCat(status,from_){
		var alen=document.frmList_DocCat.elements.length;
		alen=(alen>5)?document.frmList_DocCat.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
			document.frmList_DocCat.chkid[i].checked=status;
		}
		else{
			document.frmList_DocCat.chkid.checked=status;
		}
		if(from_>0) document.frmList_DocCat.chkall.checked=status;
	}
		
	function docheckone_DocCat(){
		var alen=document.frmList_DocCat.elements.length;

		var isChecked=true;
		alen=(alen>4)?document.frmList_DocCat.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_DocCat.chkid[i].checked==false)
					isChecked=false;
		}else{
			if(document.frmList_DocCat.chkid.checked==false)
				isChecked=false;
		}				
		document.frmList_DocCat.chkall.checked=isChecked;
	}
	
	function calculatechon_DocCat(){			
		var strchon="";
		var alen=document.frmList_DocCat.elements.length;				
		alen=(alen>2)?document.frmList_DocCat.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_DocCat.chkid[i].checked==true)
					strchon+=document.frmList_DocCat.chkid[i].value+",";
		}else{
			if(document.frmList_DocCat.chkid.checked==true)
				strchon=document.frmList_DocCat.chkid.value;
		}
		document.frmList_DocCat.chon_DocCat.value=strchon;
	}
	
	function delItems_DocCat(processurl,delStr){
		if (delStr == undefined){
			calculatechon_DocCat();
			delStr = document.getElementById("chon_DocCat").value;
		}
		if (delStr == ""){
			return false;
		}
		if(!confirm("THÔNG BÁO: \\n\\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
			return false;
		}	
		
		var numresult_DocCat,order_DocCat,curpage_DocCat;
		numresult = $("#numresult_DocCat").val();
		order = $("#order_DocCat").val();
		curpage = $("#curpage_DocCat").val();
		
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
				$(\'#thuoctinh_content_main\').fadeOut(\'fast\').load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+curpage).fadeIn("fast");
			}
		});
	}
	
	function reloadPage_DocCat(processurl){
		var numresult_DocCat,order_DocCat,cur_pos;
		numresult = $("#numresult_DocCat").val();
		order = $("#order_DocCat").val();
		cur_pos = 0;
		$("#thuoctinh_content_main").load(processurl+"&numresult="+numresult+"&order="+order+"&cur_pos="+cur_pos);
	}
	
	function gotoPage_DocCat(processurl,page){
		var numresult_DocCat,order_DocCat,cur_pos;
		numresult = $("#numresult_DocCat").val();
		order = $("#order_DocCat").val();
		//alert(processurl+\'-\'+page+\'-\'+numresult+\'-\'+order);
		$("#thuoctinh_content_main").load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+page);
	}
	
	function uncheck_fns_DocCat(field,val,id){
		$("#thuoctinh_content_main").load("?listDocCat&mod=docs&checkUncheck="+val+"&setfield="+field+"&checkUncheckID="+id);
	}
	
	function sort_me_DocCat(id,val){
		$("#thuoctinh_content_main").load("?listDocCat&mod=docs&sort_me=1&docCat_id="+id+"&val="+val);
	}
	
	function search_me_DocCat(){
		var keyword = document.getElementById(\'keyword\').value;
		if (keyword == ""){
			return false;
		}
		
		$.post(\'?listDocCat&mod=docs\',
			{keyword:keyword},
			function(data){
				$(\'#thuoctinh_content_main\').html(data);
				$("#thuoctinh_content_main").show();
			}
		);
	}
	
	function edit_me_DocCat(id){
		$("#thuoctinh_content_main").load("?listDocCat&mod=docs&edit_me=1&docCat_id="+id);
	}
		
	$("#a_ref_DocCat").click( function () { 
			$(\'#thuoctinh_content_main\').hide();
			$(\'#thuoctinh_content_main\').fadeOut(\'fast\').load(\'index.php?listDocCat&mod=docs\').fadeIn("fast");
		});
</script>
'; ?>