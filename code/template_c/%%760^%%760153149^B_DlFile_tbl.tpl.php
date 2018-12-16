<?php /* Smarty version 2.6.2, created on 2018-12-16 10:44:09
         compiled from E:%5CProjects%5Cwamp64%5Cwww%5Csmarty%5Cprj14.3.3_offices_mekong%5Ccode%5Cmodules%5Ckdls/skin/B_DlFile_tbl.tpl */ ?>
<?php require_once(SMARTY_DIR . 'core' . DIRECTORY_SEPARATOR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'str_string_cut', 'E:\Projects\wamp64\www\smarty\prj14.3.3_offices_mekong\code\modules\kdls/skin/B_DlFile_tbl.tpl', 34, false),array('function', 'math', 'E:\Projects\wamp64\www\smarty\prj14.3.3_offices_mekong\code\modules\kdls/skin/B_DlFile_tbl.tpl', 129, false),)), $this); ?>
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
'; ?>

<div id="file_content_insign">
	<form method="post" name="frmList_DlFile" action="?DlFile<?php echo $this->_tpl_vars['vars']['arg']; ?>
" id="frmList_DlFile">
    <!------------------------------------------THEM MOI------------------------------------>
    <fieldset style="width:248px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
        <legend class="legend">Thêm/Chỉnh sửa</legend>
        <?php if (isset($this->_sections['qi'])) unset($this->_sections['qi']);
$this->_sections['qi']['name'] = 'qi';
$this->_sections['qi']['loop'] = is_array($_loop=$this->_tpl_vars['obj_list_dl']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
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
        <?php if ($this->_tpl_vars['obj_list_dl'][$this->_sections['qi']['index']]->dl_id == $this->_tpl_vars['dl_id']): ?> 
            <?php $this->assign('dl_name', $this->_tpl_vars['obj_list_dl'][$this->_sections['qi']['index']]->dl_name); ?>
        <?php endif; ?>
        <?php endfor; endif; ?>
    	<table width="98%" cellspacing="0" cellpadding="0" border="0" style="margin-left:5px">
            <tr height="20">
                <td colspan="2"> 
                	<?php if ($this->_tpl_vars['error'] || $this->_tpl_vars['complete']): ?>
                	<span class="msg">Thông báo: <font color="#FF0000"><?php echo $this->_tpl_vars['error']; ?>
</font><?php echo $this->_tpl_vars['complete']; ?>
</span><?php endif; ?>
            		<span id="lblError_DlFile" class="error">Thông báo: (*) là các mục bắt buộc!</span>
                </td>
            </tr>
            <tr><td colspan="2">Dữ liệu: <span title="<?php echo $this->_tpl_vars['dl_name']; ?>
"><?php echo ((is_array($_tmp=$this->_tpl_vars['dl_name'])) ? $this->_run_mod_handler('str_string_cut', true, $_tmp, '45', '1') : smarty_modifier_str_string_cut($_tmp, '45', '1')); ?>
</span></td></tr>
            <tr height="30">
            	<td align="center" valign="top">
                	<div style="float:left; width:30%; line-height:25px; text-align:left">Tên tệp tin <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left">
                        <input type="text" id="dlfile_name" name="dlfile_name" class="text_short" value="<?php echo $this->_tpl_vars['obj_info']['dlfile_name']; ?>
" onfocus="hide_message_DlFile();"/>
                    </div>
                    <div style="float:left; width:30%; line-height:25px; text-align:left">Đường dẫn <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left">
                    	<input type="text" class="text_short" name="dlfile_path" id="dlfile_path" value="<?php echo $this->_tpl_vars['obj_info']['dlfile_path']; ?>
" onfocus="hide_message_DlFile();">&nbsp;<a href="javascript:void(0)" onclick="javascript:window.open('upload_kdl.php','new_page','width=410,height=225')" >[ Tải lên ]</a>
                    </div>
                    <div style="float:left; width:100%; line-height:25px; text-align:left">
                    	<input type="button" name="btnSub_DlFile" id="btnSub_DlFile" value="Ghi lại" class="button" tabindex="14"/>
                        <input type="hidden" name="dlfile_id" id="dlfile_id" value="<?php echo $this->_tpl_vars['obj_info']['dlfile_id']; ?>
">
                        <input type="hidden" name="kdl_type" id="kdl_type" value="<?php echo $this->_tpl_vars['vars']['kdl_type']; ?>
">
                        <input type="hidden" name="kdl_id" id="kdl_id" value="<?php echo $this->_tpl_vars['vars']['kdl_id']; ?>
">
                        <input type="hidden" name="user_id" id="user_id" value="<?php echo $this->_tpl_vars['obj_info']['user_id']; ?>
">
                        <input type="hidden" name="dl_id" id="dl_id" value="<?php echo $this->_tpl_vars['vars']['dl_id']; ?>
">
                        <input type="reset" name="Reset" value="Hủy bỏ" class="button" tabindex="15"/>
                        <?php echo '
                        <script language="javascript">
                            function hide_message_DlFile(){
                                $(\'#lblMessage_DlFile\').hide();
                                $(\'#lblError_DlFile\').hide();
                            }
                            
                            $(function() {
                            $(\'.error\').hide();
                            $(\'#lblMessage_DlFile\').hide();
                             
                            $("#btnSub_DlFile").click(function() {
								
                                $(\'.error\').hide();
                                 
                                var $form 			= $("#frmList_DlFile");
								var dlfile_name 	= $form.find(\'input#dlfile_name\').val();
								var dlfile_path 	= $form.find(\'input#dlfile_path\').val();
								var dl_id 			= $form.find(\'input#dl_id\').val();
								var dlfile_id 		= $form.find(\'input#dlfile_id\').val();
								
								var kdl_type 		= $form.find(\'input#kdl_type\').val();
								var kdl_id 			= $form.find(\'input#kdl_id\').val();
								
                                //begin validate form
                                if (dlfile_name == "" || dlfile_path == "" || dl_id == ""){
                                    $(\'#lblError_DlFile\').show();
                                }
                                else{
									$.post(\'index.php?listDlFile&mod=kdls&add_edit=1\',
										{
											dlfile_name:dlfile_name,
											dlfile_path:dlfile_path,
											dl_id:dl_id,
											dlfile_id:dlfile_id,
											
											kdl_type:kdl_type,
											kdl_id:kdl_id,
										},
										function(data){
											$(\'#dl_file_cont\').html(data);
											$("#dl_file_cont").show();
											
											$(\'#kdl_content_main\').hide();
											$(\'#kdl_content_main\').fadeOut(\'fast\').load(\'index.php?listKDL_Chung&mod=kdls&kdl_id=\'+kdl_id+\'&kdl_type=\'+kdl_type).fadeIn("fast");
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
    <fieldset style="width:248px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:147px">
        <legend class="legend"><div style="width:130px; float:left">Danh sách: <?php echo $this->_tpl_vars['total_num_result']; ?>
</div></legend>
    	<div style="float:left; height:5px; width:100%"></div>
        <div style="float:left; height:25px; width:233px; border-top:1px solid #99bbe8; border-bottom:1px solid #99bbe8 ">
            <div class="tbl_tit" style="width:30px; text-align:center"><b>STT</b></div>	
            <div class="tbl_tit" style="width:110px"><B>&nbsp;Tên tệp tin</B></div>
            <div class="tbl_tit" style="width:90px; text-align:center"><B>Chọn</B></div>
        </div>
        <div style="float:left; width:18px; height:25px">&nbsp;</div>
        <div style="float:left; height:90px; width:251px; overflow-y:scroll">
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
" style="width:110px; white-space:nowrap" title="<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->dlfile_name; ?>
">
                	<?php if ($this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->user_id == $this->_tpl_vars['access_user_id']): ?>
                    &nbsp;<a href='javascript: void(0);' onclick="edit_me_DlFile(<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->dlfile_id; ?>
,<?php echo $this->_tpl_vars['kdl_id']; ?>
,<?php echo $this->_tpl_vars['kdl_type']; ?>
)"><?php echo ((is_array($_tmp=$this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->dlfile_name)) ? $this->_run_mod_handler('str_string_cut', true, $_tmp, '25', '1') : smarty_modifier_str_string_cut($_tmp, '25', '1')); ?>
</a>
                    <?php else:  echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->dlfile_name;  endif; ?>
                </div>
                <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:30px; text-align:center">
                    <a href='<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->dlfile_path; ?>
' target="new">
                    <img src="../images/admin/download_icon.png" width="16" height="16" border="0" title="Tải về"></a>
                </div>
                <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:29px; text-align:center">
                	<?php if ($this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->user_id == $this->_tpl_vars['access_user_id']): ?>
                    <a href='javascript: void(0);' onclick="edit_me_DlFile(<?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->dlfile_id; ?>
,<?php echo $this->_tpl_vars['kdl_id']; ?>
,<?php echo $this->_tpl_vars['kdl_type']; ?>
)">
                    <img src="../images/admin/b_edit.png" width="11" height="11" border="0" title="Sửa"></a>
                    <?php else: ?>-<?php endif; ?>
                </div>
                <div class="<?php echo $this->_tpl_vars['class_td']; ?>
" style="width:29px; text-align:center">
                	<?php if ($this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->user_id == $this->_tpl_vars['access_user_id']): ?>
                    <a href='javascript: void(0)' onClick="delItems_DlFile('<?php echo $this->_tpl_vars['processurl']; ?>
', <?php echo $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->dlfile_id; ?>
,<?php echo $this->_tpl_vars['kdl_id']; ?>
,<?php echo $this->_tpl_vars['kdl_type']; ?>
);">
                    <img src="../images/admin/b_drop.png" width="11" height="11" border="0" title="Xóa"></a>
                    <?php else: ?>-<?php endif; ?>
                </div>
            </div>
            <?php endfor; endif; ?>
        </div>
        <input type="hidden" id="curpage_DlFile" name="curpage" value="<?php echo $this->_tpl_vars['vars']['curpage']; ?>
" />
    </fieldset>
    </form>
</div>
<!------------------------------------------------- Tool bar --------------------------------------------->
<div id="file_clear_txt"></div>
<div id="file_tool_bar">    
    <div id="file_page_area">
    <?php if ($this->_tpl_vars['vars']['curpage'] == 1): ?>
    	<img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_first_page.png" class="img_all">
    	<img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_pre_page.png" class="img_all">
    <?php else: ?>
    <a href="javascript: void(0)" id="first_page" onclick="gotoPage_DlFile('<?php echo $this->_tpl_vars['processurl']; ?>
',parseInt(1));" title="Trang đầu">
    	<img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_first_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="pre_page" onclick="gotoPage_DlFile('<?php echo $this->_tpl_vars['processurl']; ?>
',parseInt(document.getElementById('page_DlFile').value)-parseInt(1));" title="Trang trước">
    	<img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_pre_page.png" class="img_all">
    </a>
    <?php endif; ?>
    </div>
    <div style="float:left; line-height:19px">
        <div style="float:left; width:35px">Trang</div> 
        <div style="float:left; width:35px">
        <input type="text" value="<?php echo $this->_tpl_vars['vars']['curpage']; ?>
" name="page" id="page_DlFile" onblur=" gotoPage_DlFile('<?php echo $this->_tpl_vars['processurl']; ?>
',this.value);" style="width:30px; font-size:12px; height:15px; border:1px solid #99bbe8">
        </div>
        <div style="float:left; width:22px"> / <?php echo $this->_tpl_vars['num_page']; ?>
</div>
    </div>
    <div id="file_page_area">
    <?php if ($this->_tpl_vars['vars']['curpage'] == $this->_tpl_vars['num_page']): ?>
    	<img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_next_page.png" class="img_all">
        <img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_last_page.png" class="img_all">
    <?php else: ?>
    <a href="javascript: void(0)" id="next_page" onclick="gotoPage_DlFile('<?php echo $this->_tpl_vars['processurl']; ?>
',parseInt(document.getElementById('page_DlFile').value)+parseInt(1));" title="Trang tiếp">
    	<img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_next_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="last_page" onclick="gotoPage_DlFile('<?php echo $this->_tpl_vars['processurl']; ?>
',parseInt(<?php echo $this->_tpl_vars['num_page']; ?>
));" title="Trang cuối">
    	<img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_last_page.png" class="img_all">
    </a>
    <?php endif; ?>
    </div>
    
    <div style="float:left; width:12px; background-image:url(<?php echo $this->_tpl_vars['css_path']; ?>
gach_dl.png)">&nbsp;</div>
    <div style="float:left; width:15px">
    <a href="javascript: void(0)" id="a_ref_DlFile" title="Tải lại"><img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_refresh.png" class="img_all"></a>
    </div>    
</div>
<?php echo '
<script language="javascript">		
	function docheck_DlFile(status,from_){
		var alen=document.frmList_DlFile.elements.length;
		alen=(alen>5)?document.frmList_DlFile.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
			document.frmList_DlFile.chkid[i].checked=status;
		}
		else{
			document.frmList_DlFile.chkid.checked=status;
		}
		if(from_>0) document.frmList_DlFile.chkall.checked=status;
	}
		
	function docheckone_DlFile(){
		var alen=document.frmList_DlFile.elements.length;
		var isChecked=true;
		alen=(alen>4)?document.frmList_DlFile.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_DlFile.chkid[i].checked==false)
					isChecked=false;
		}else{
			if(document.frmList_DlFile.chkid.checked==false)
				isChecked=false;
		}				
		document.frmList_DlFile.chkall.checked=isChecked;
	}
	
	function calculatechon_DlFile(){			
		var strchon="";
		var alen=document.frmList_DlFile.elements.length;				
		alen=(alen>2)?document.frmList_DlFile.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_DlFile.chkid[i].checked==true)
					strchon+=document.frmList_DlFile.chkid[i].value+",";
		}else{
			if(document.frmList_DlFile.chkid.checked==true)
				strchon=document.frmList_DlFile.chkid.value;
		}
		document.frmList_DlFile.chon_DlFile.value=strchon;
	}
	
	function delItems_DlFile(processurl,delStr){
		if (delStr == undefined){
			calculatechon_DlFile();
			delStr = document.getElementById("chon_DlFile").value;
		}
		if (delStr == ""){
			return false;
		}
		if(!confirm("THÔNG BÁO: \\n\\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
			return false;
		}	
		
		var numresult_DlFile,order_DlFile,curpage_DlFile;
		numresult = $("#numresult_DlFile").val();
		order = $("#order_DlFile").val();
		curpage = $("#curpage_DlFile").val();
		
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
				$(\'#dl_file_cont\').fadeOut(\'fast\').load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+curpage).fadeIn("fast");
			}
		});
	}
	
	function reloadPage_DlFile(processurl){
		var numresult_DlFile,order_DlFile,cur_pos;
		numresult = $("#numresult_DlFile").val();
		order = $("#order_DlFile").val();
		cur_pos = 0;
		$("#dl_file_cont").load(processurl+"&numresult="+numresult+"&order="+order+"&cur_pos="+cur_pos);
	}
	
	function gotoPage_DlFile(processurl,page){
		var numresult_DlFile,order_DlFile,cur_pos;
		numresult = $("#numresult_DlFile").val();
		order = $("#order_DlFile").val();
		//alert(processurl+\'-\'+page+\'-\'+numresult+\'-\'+order);
		$("#dl_file_cont").load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+page);
	}
	
	function edit_me_DlFile(id,kdl_id,kdl_type){
		var dl_id = document.frmList_DlFile.dl_id.value;
		$("#dl_file_cont").load("?listDlFile&mod=kdls&edit_me=1&dlfile_id="+id+"&dl_id="+dl_id+"&kdl_id="+kdl_id+"&kdl_type="+kdl_type);
	}
			
	$("#a_ref_DlFile").click( function () { 
			var id = document.frmList_DlFile.dl_id.value;
			$(\'#dl_file_cont\').hide();
			$(\'#dl_file_cont\').fadeOut(\'fast\').load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+curpage).fadeIn("fast");
		});
</script>
'; ?>