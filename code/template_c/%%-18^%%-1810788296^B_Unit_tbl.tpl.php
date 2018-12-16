<?php /* Smarty version 2.6.2, created on 2018-12-16 10:27:58
         compiled from E:%5CProjects%5Cwamp64%5Cwww%5Csmarty%5Cprj14.3.3_offices_mekong%5Ccode%5Cmodules%5Cunits/skin/B_Unit_tbl.tpl */ ?>
<?php require_once(SMARTY_DIR . 'core' . DIRECTORY_SEPARATOR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'math', 'E:\Projects\wamp64\www\smarty\prj14.3.3_offices_mekong\code\modules\units/skin/B_Unit_tbl.tpl', 146, false),array('modifier', 'str_string_cut', 'E:\Projects\wamp64\www\smarty\prj14.3.3_offices_mekong\code\modules\units/skin/B_Unit_tbl.tpl', 149, false),array('modifier', 'date_format', 'E:\Projects\wamp64\www\smarty\prj14.3.3_offices_mekong\code\modules\units/skin/B_Unit_tbl.tpl', 152, false),)), $this); ?>
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

<div id="thuoctinh_content_insigns">
	<form method="post" name="frmList_Unit" action="?listUnit<?php echo $this->_tpl_vars['vars']['arg']; ?>
" id="frmList_Unit">
    <!------------------------------------------THEM MOI------------------------------------>
    <fieldset style="width:912px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
    <legend class="legend_list">
        Thêm/Chỉnh sửa&nbsp;|&nbsp;Thông báo:&nbsp;
        <span id="lblError_Unit" class="error">Mời bạn nhập đủ dữ liệu!</span>
    </legend>
    	<table width="98%" cellspacing="0" cellpadding="0" border="0" style="margin-left:5px">
        	<tr height="10"><td colspan="4"></td></tr>
            <tr height="30">
            	<td align="center" width="55%" valign="top">
                	<div style="float:left; width:20%; line-height:25px; text-align:left">Tên gọi <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:80%; line-height:25px; text-align:left">
                    <input type="text" name="unit_name" id="unit_name" class="text_long" value="<?php echo $this->_tpl_vars['obj_info']['unit_name']; ?>
" onfocus="hide_message_Unit()"/>
                    </div>
                    <div style="float:left; width:20%; line-height:25px; text-align:left">Tình trạng :</div>
                    <div style="float:left; width:80%; line-height:25px; text-align:left">
                    	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <?php if ($this->_tpl_vars['obj_info']['unit_active'] != ''): ?>
                            <td width="20%">
                            <input type="radio" id="unit_active" name="unit_active" value="1" <?php if ($this->_tpl_vars['obj_info']['unit_active'] == 1): ?> checked="checked" <?php endif; ?> />&nbsp;Hiển thị</td>
                            <td>
                            <input type="radio" id="unit_active" name="unit_active" value="2" <?php if ($this->_tpl_vars['obj_info']['unit_active'] == 2): ?> checked="checked" <?php endif; ?> />&nbsp;Không hiển thị</td>
                            <?php else: ?>
                            <td width="20%">
                            <input type="radio" id="unit_active" name="unit_active" value="1" checked/>&nbsp;Hiển thị</td>
                            <td>
                            <input type="radio" id="unit_active" name="unit_active" value="2" />&nbsp;Không hiển thị</td>
                            <?php endif; ?>
                          </tr>
                        </table>
                    </div>
                    <div style="float:left; width:20%; line-height:25px; text-align:left">&nbsp;</div>
                    <div style="float:left; width:80%; line-height:25px; text-align:left">
                    	<input type="button" name="btnSub_Unit" id="btnSub_Unit" value="Ghi lại" class="button" />
                        <input type="hidden" name="unit_id" id="unit_id" value="<?php echo $this->_tpl_vars['obj_info']['unit_id']; ?>
">
                        <input type="reset" name="Reset" value="Hủy bỏ" class="button" />
                        <?php echo '
                        <script language="javascript">
                            function hide_message_Unit(){
                                $(\'#lblMessage_Unit\').hide();
                                $(\'#lblError_Unit\').hide();
                            }
                            
                            $(function() {
                            $(\'.error\').hide();
                            $(\'#lblMessage_Unit\').hide();
                             
                            $("#btnSub_Unit").click(function() {
                                $(\'.error\').hide();
                                 
                                var $form = $("#frmList_Unit");
                                var unit_name = $form.find(\'input#unit_name\').val();
                                var unit_active = $form.find(\'input#unit_active:checked\').val();
                                var unit_id = $form.find(\'input#unit_id\').val();
                                 
                                //begin validate form
                                if (unit_name == ""){
                                    $(\'#lblError_Unit\').show();
                                }
                                else{
                                    var dataString  = "unit_name=" + unit_name;
                                        dataString += "&unit_active=" + unit_active;
                                        dataString += "&unit_id=" + unit_id +"";
                                        //alert (dataString);return false;
                                    $.ajax({
                                        type: "POST",
                                        url: "index.php?listUnit&mod=units&add_edit=1",
                                        data: dataString,
                                        success: function(data) {
                                            $(\'#thuoctinh_content_main\').fadeOut(\'fast\').load(\'index.php?listUnit&mod=units\').fadeIn("fast");
                                            //$(\'#lblMessage_Unit\').show();
                                        }
                                    });
                                    return false;
                                }
                                //end form
                            });
                        });
                        </script>
                        '; ?>

                    </div>
                </td>
                <td align="center" valign="top">
                	<div style="float:left; width:20%; line-height:25px; text-align:left">Mô tả:</div>
                    <div style="float:left; width:80%; line-height:25px; text-align:left">
                    	<textarea spellcheck="false" name="department_desc" id="department_desc" cols="30" rows="5" class="text_area" onfocus="hide_message_Department()"><?php echo $this->_tpl_vars['obj_info']['department_desc']; ?>
</textarea>
                    </div>
                </td>
            </tr>
        </table>
    </fieldset>
    
    <!------------------------------------DANH SACH---------------------------------------------->
    <fieldset style="width:912px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:347px">
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
        	<input type="button" name="btnSeek" id="btnSeek" value="Tìm >>" class="button_seek" onclick="search_me_Unit()" /></div>
    </legend>
    	<div style="float:left; height:5px; width:100%"></div>
        <div style="float:left; height:25px; width:890px; border-top:1px solid #99bbe8; border-bottom:1px solid #99bbe8 ">
            <div class="tbl_tit" style="width:30px; text-align:center"><b>STT</b></div>	
            <div class="tbl_tit" style="width:557px"><B>&nbsp;Tên nơi gửi/nhận văn bản</B></div>
            <div class="tbl_tit" style="width:80px"><B>&nbsp;Ngày tạo</B></div>
            <div class="tbl_tit" style="width:59px; text-align:center"><B>Sắp xếp</B></div>
            <div class="tbl_tit" style="width:59px; text-align:center"><B>Hiển thị</B></div>
            <div class="tbl_tit" style="width:59px; text-align:center"><B>Chọn</B></div>
            <div class="tbl_tit" style="width:39px; text-align:center">
            <input type="hidden" name="chon" id="chon_Unit">
            <input type="checkbox" name="chkall" value="0" onclick="docheck_Unit(document.frmList_Unit.chkall.checked,0);">
            </div>
        </div>
        <div style="float:left; width:20px; text-align:right">
        <input type="button" name="del_Items" id='del_Items' value="&nbsp;" onClick="delItems_Unit('<?php echo $this->_tpl_vars['processurl']; ?>
');" style="width:17px; font-size:12px; background:url(../images/admin/b_drop.png); cursor:pointer" title="Xóa lựa chọn">
        </div>
        <div style="float:left; height:290px; width:912px; overflow-y:scroll">
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
" style="width:557px" title="<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->unit_name; ?>
">
            	&nbsp;<a href="javascript: void(0);" onclick="edit_me_Unit(<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->unit_id; ?>
)" ><?php echo ((is_array($_tmp=$this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->unit_name)) ? $this->_run_mod_handler('str_string_cut', true, $_tmp, '120', '1') : smarty_modifier_str_string_cut($_tmp, '120', '1')); ?>
</a>
            </div>
            <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:80px">
            	&nbsp;<?php echo ((is_array($_tmp=$this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->unit_date)) ? $this->_run_mod_handler('date_format', true, $_tmp, "%d/%m/%Y") : smarty_modifier_date_format($_tmp, "%d/%m/%Y")); ?>

            </div>
            <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:59px; text-align:center">
                <select name="unit_sort[]" class="select_tiny" onchange="sort_me_Unit(<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->unit_id; ?>
,this.value)">
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
" <?php if ($this->_sections['i']['index'] == $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->unit_sort): ?> selected="selected"<?php endif; ?>><?php echo $this->_sections['i']['index']; ?>
</option>
                <?php endfor; endif; ?>
                </select>
                <input type="hidden" name="unit_id1[]" value="<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->unit_id; ?>
">
            </div>
            <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:59px; text-align:center">
                <?php if ($this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->unit_active == 1): ?>
                    <a href='javascript: void(0);' onclick="uncheck_fns_Unit('unit_active',2,<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->unit_id; ?>
)"><img src="../images/admin/tick.png" width="10" height="10" border="0" title="Ẩn"></a>
                <?php else: ?>
                    <a href='javascript: void(0);' onclick="uncheck_fns_Unit('unit_active',1,<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->unit_id; ?>
)"><img src="../images/admin/publish_x.png" width="10" height="10" border="0" title="Hiện"></a>
                <?php endif; ?>
            </div>
            <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:29px; text-align:center">
                <a href='javascript: void(0);' onclick="edit_me_Unit(<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->unit_id; ?>
)">
                <img src="../images/admin/b_edit.png" width="11" height="11" border="0" title="Sửa"></a>
            </div>
            <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:29px; text-align:center">
                <a href='javascript: void(0)' onClick="delItems_Unit('<?php echo $this->_tpl_vars['processurl']; ?>
', <?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->unit_id; ?>
);">
                <img src="../images/admin/b_drop.png" width="11" height="11" border="0" title="Xóa"></a>
            </div>
            <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:39px; text-align:center">
            	<input type="checkbox" name="chkid" value="<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->unit_id; ?>
" onclick="docheckone_Unit();">
            </div>
            <?php endfor; endif; ?>
        </div>
        <input type="hidden" id="curpage_Unit" name="curpage" value="<?php echo $this->_tpl_vars['vars']['curpage']; ?>
" />
    </fieldset>
    </form>
</div>
<!------------------------------------------------- Tool bar --------------------------------------------->
<div id="doc_clear_txt"></div>
<div id="doc_tool_bar">

    <div id="doc_search_area">
    <select name="order" id = "order_Unit" style="width:120px; font-size:12px; border:1px solid #99bbe8" onchange="reloadPage_Unit('<?php echo $this->_tpl_vars['processurl']; ?>
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
    <a href="javascript: void(0)" id="first_page" onclick="gotoPage_Unit('<?php echo $this->_tpl_vars['processurl']; ?>
',parseInt(1));" title="Trang đầu">
    	<img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_first_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="pre_page" onclick="gotoPage_Unit('<?php echo $this->_tpl_vars['processurl']; ?>
',parseInt(document.getElementById('page').value)-parseInt(1));" title="Trang trước">
    	<img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_pre_page.png" class="img_all">
    </a>
    <?php endif; ?>
    </div>
    <div style="float:left; line-height:19px">
        <div style="float:left; width:35px">Trang</div> 
        <div style="float:left; width:35px">
        <input type="text" value="<?php echo $this->_tpl_vars['vars']['curpage']; ?>
" name="page" id="page" onblur=" gotoPage_Unit('<?php echo $this->_tpl_vars['processurl']; ?>
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
    <a href="javascript: void(0)" id="next_page" onclick="gotoPage_Unit('<?php echo $this->_tpl_vars['processurl']; ?>
',parseInt(document.getElementById('page').value)+parseInt(1));" title="Trang tiếp">
    	<img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_next_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="last_page" onclick="gotoPage_Unit('<?php echo $this->_tpl_vars['processurl']; ?>
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
    <a href="javascript: void(0)" id="a_ref_Unit" title="Tải lại"><img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_refresh.png" class="img_all"></a>
    </div>
    
    <div style="float:left; width:12px; background-image:url(<?php echo $this->_tpl_vars['css_path']; ?>
gach_doc.png)">&nbsp;</div>
    <div style="float:right; line-height:19px; margin-right:2px">
        <div style="float:left; width:40px">Xem</div>
        <div style="float:left; width:52px">
            <select name="numresult" id="numresult_Unit" style="width:50px; font-size:12px; border:1px solid #99bbe8" onchange="reloadPage_Unit('<?php echo $this->_tpl_vars['processurl']; ?>
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
	function docheck_Unit(status,from_){
		var alen=document.frmList_Unit.elements.length;
		alen=(alen>5)?document.frmList_Unit.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
			document.frmList_Unit.chkid[i].checked=status;
		}
		else{
			document.frmList_Unit.chkid.checked=status;
		}
		if(from_>0) document.frmList_Unit.chkall.checked=status;
	}
		
	function docheckone_Unit(){
		var alen=document.frmList_Unit.elements.length;
		var isChecked=true;
		alen=(alen>4)?document.frmList_Unit.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_Unit.chkid[i].checked==false)
					isChecked=false;
		}else{
			if(document.frmList_Unit.chkid.checked==false)
				isChecked=false;
		}				
		document.frmList_Unit.chkall.checked=isChecked;
	}
	
	function calculatechon_Unit(){			
		var strchon="";
		var alen=document.frmList_Unit.elements.length;				
		alen=(alen>2)?document.frmList_Unit.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_Unit.chkid[i].checked==true)
					strchon+=document.frmList_Unit.chkid[i].value+",";
		}else{
			if(document.frmList_Unit.chkid.checked==true)
				strchon=document.frmList_Unit.chkid.value;
		}
		document.frmList_Unit.chon_Unit.value=strchon;
	}
	
	function delItems_Unit(processurl,delStr){
		if (delStr == undefined){
			calculatechon_Unit();
			delStr = document.getElementById("chon_Unit").value;
		}
		if (delStr == ""){
			return false;
		}
		if(!confirm("THÔNG BÁO: \\n\\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
			return false;
		}	
		
		var numresult_Unit,order_Unit,curpage_Unit;
		numresult = $("#numresult_Unit").val();
		order = $("#order_Unit").val();
		curpage = $("#curpage_Unit").val();
		
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
	
	function reloadPage_Unit(processurl){
		var numresult_Unit,order_Unit,cur_pos;
		numresult = $("#numresult_Unit").val();
		order = $("#order_Unit").val();
		cur_pos = 0;
		$("#thuoctinh_content_main").load(processurl+"&numresult="+numresult+"&order="+order+"&cur_pos="+cur_pos);
	}
	
	function gotoPage_Unit(processurl,page){
		var numresult_Unit,order_Unit,cur_pos;
		numresult = $("#numresult_Unit").val();
		order = $("#order_Unit").val();
		//alert(processurl+\'-\'+page+\'-\'+numresult+\'-\'+order);
		$("#thuoctinh_content_main").load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+page);
	}
	
	function uncheck_fns_Unit(field,val,id){
		$("#thuoctinh_content_main").load("?listUnit&mod=units&checkUncheck="+val+"&setfield="+field+"&checkUncheckID="+id);
	}
	
	function sort_me_Unit(id,val){
		$("#thuoctinh_content_main").load("?listUnit&mod=units&sort_me=1&unit_id="+id+"&val="+val);
	}
	
	function search_me_Unit(){
		var keyword = document.getElementById(\'keyword\').value;
		if (keyword == ""){
			return false;
		}
		
		$.post(\'?listUnit&mod=units\',
			{keyword:keyword},
			function(data){
				$(\'#thuoctinh_content_main\').html(data);
				$("#thuoctinh_content_main").show();
			}
		);
	}
	
	function edit_me_Unit(id){
		$("#thuoctinh_content_main").load("?listUnit&mod=units&edit_me=1&unit_id="+id);
	}
		
	$("#a_ref_Unit").click( function () { 
			$(\'#thuoctinh_content_main\').hide();
			$(\'#thuoctinh_content_main\').fadeOut(\'fast\').load(\'index.php?listUnit&mod=units\').fadeIn("fast");
		});
</script>
'; ?>