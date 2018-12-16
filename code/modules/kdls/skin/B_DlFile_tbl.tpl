{literal}
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
{/literal}
<div id="file_content_insign">
	<form method="post" name="frmList_DlFile" action="?DlFile{$vars.arg}" id="frmList_DlFile">
    <!------------------------------------------THEM MOI------------------------------------>
    <fieldset style="width:248px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
        <legend class="legend">Thêm/Chỉnh sửa</legend>
        {section name=qi loop=$obj_list_dl}
        {if $obj_list_dl[qi]->dl_id eq $dl_id} 
            {assign var = "dl_name" value = $obj_list_dl[qi]->dl_name}
        {/if}
        {/section}
    	<table width="98%" cellspacing="0" cellpadding="0" border="0" style="margin-left:5px">
            <tr height="20">
                <td colspan="2"> 
                	{if $error or $complete}
                	<span class="msg">Thông báo: <font color="#FF0000">{$error}</font>{$complete}</span>{/if}
            		<span id="lblError_DlFile" class="error">Thông báo: (*) là các mục bắt buộc!</span>
                </td>
            </tr>
            <tr><td colspan="2">Dữ liệu: <span title="{$dl_name}">{$dl_name|str_string_cut:"45":"1"}</span></td></tr>
            <tr height="30">
            	<td align="center" valign="top">
                	<div style="float:left; width:30%; line-height:25px; text-align:left">Tên tệp tin <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left">
                        <input type="text" id="dlfile_name" name="dlfile_name" class="text_short" value="{$obj_info.dlfile_name}" onfocus="hide_message_DlFile();"/>
                    </div>
                    <div style="float:left; width:30%; line-height:25px; text-align:left">Đường dẫn <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left">
                    	<input type="text" class="text_short" name="dlfile_path" id="dlfile_path" value="{$obj_info.dlfile_path}" onfocus="hide_message_DlFile();">&nbsp;<a href="javascript:void(0)" onclick="javascript:window.open('upload_kdl.php','new_page','width=410,height=225')" >[ Tải lên ]</a>
                    </div>
                    <div style="float:left; width:100%; line-height:25px; text-align:left">
                    	<input type="button" name="btnSub_DlFile" id="btnSub_DlFile" value="Ghi lại" class="button" tabindex="14"/>
                        <input type="hidden" name="dlfile_id" id="dlfile_id" value="{$obj_info.dlfile_id}">
                        <input type="hidden" name="kdl_type" id="kdl_type" value="{$vars.kdl_type}">
                        <input type="hidden" name="kdl_id" id="kdl_id" value="{$vars.kdl_id}">
                        <input type="hidden" name="user_id" id="user_id" value="{$obj_info.user_id}">
                        <input type="hidden" name="dl_id" id="dl_id" value="{$vars.dl_id}">
                        <input type="reset" name="Reset" value="Hủy bỏ" class="button" tabindex="15"/>
                        {literal}
                        <script language="javascript">
                            function hide_message_DlFile(){
                                $('#lblMessage_DlFile').hide();
                                $('#lblError_DlFile').hide();
                            }
                            
                            $(function() {
                            $('.error').hide();
                            $('#lblMessage_DlFile').hide();
                             
                            $("#btnSub_DlFile").click(function() {
								
                                $('.error').hide();
                                 
                                var $form 			= $("#frmList_DlFile");
								var dlfile_name 	= $form.find('input#dlfile_name').val();
								var dlfile_path 	= $form.find('input#dlfile_path').val();
								var dl_id 			= $form.find('input#dl_id').val();
								var dlfile_id 		= $form.find('input#dlfile_id').val();
								
								var kdl_type 		= $form.find('input#kdl_type').val();
								var kdl_id 			= $form.find('input#kdl_id').val();
								
                                //begin validate form
                                if (dlfile_name == "" || dlfile_path == "" || dl_id == ""){
                                    $('#lblError_DlFile').show();
                                }
                                else{
									$.post('index.php?listDlFile&mod=kdls&add_edit=1',
										{
											dlfile_name:dlfile_name,
											dlfile_path:dlfile_path,
											dl_id:dl_id,
											dlfile_id:dlfile_id,
											
											kdl_type:kdl_type,
											kdl_id:kdl_id,
										},
										function(data){
											$('#dl_file_cont').html(data);
											$("#dl_file_cont").show();
											
											$('#kdl_content_main').hide();
											$('#kdl_content_main').fadeOut('fast').load('index.php?listKDL_Chung&mod=kdls&kdl_id='+kdl_id+'&kdl_type='+kdl_type).fadeIn("fast");
										}
									);
                                    return false;
                                }
                                //end form
                            });
                        });
                        </script>
                        {/literal}
                    </div>
                </td>
            </tr>
        </table>
    </fieldset>
    <!------------------------------------DANH SACH---------------------------------------------->
    <fieldset style="width:248px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:147px">
        <legend class="legend"><div style="width:130px; float:left">Danh sách: {$total_num_result}</div></legend>
    	<div style="float:left; height:5px; width:100%"></div>
        <div style="float:left; height:25px; width:233px; border-top:1px solid #99bbe8; border-bottom:1px solid #99bbe8 ">
            <div class="tbl_tit" style="width:30px; text-align:center"><b>STT</b></div>	
            <div class="tbl_tit" style="width:110px"><B>&nbsp;Tên tệp tin</B></div>
            <div class="tbl_tit" style="width:90px; text-align:center"><B>Chọn</B></div>
        </div>
        <div style="float:left; width:18px; height:25px">&nbsp;</div>
        <div style="float:left; height:90px; width:251px; overflow-y:scroll">
            {section name=pi loop=$obj_list}
            {if $smarty.section.pi.index is not div by 2} 
            {assign var="class_td" value="tbl_cont"} 
            {else}
            {assign var="class_td" value="tbl_cont2"} 
            {/if}
            {math x=$vars.curpage-1 y=$vars.numresult z=$smarty.section.pi.index t=1 equation="x*y+z+t" assign=stt}
            <div style="float:left">
                <div class="{$class_td}" style="width:30px; text-align:center">{$stt}</div>
                <div class="{$class_td}" style="width:110px; white-space:nowrap" title="{$obj_list[pi]->dlfile_name}">
                	{if $obj_list[pi]->user_id eq $access_user_id}
                    &nbsp;<a href='javascript: void(0);' onclick="edit_me_DlFile({$obj_list[pi]->dlfile_id},{$kdl_id},{$kdl_type})">{$obj_list[pi]->dlfile_name|str_string_cut:"25":"1"}</a>
                    {else}{$obj_list[pi]->dlfile_name}{/if}
                </div>
                <div class="{$class_td}" style="width:30px; text-align:center">
                    <a href='{$obj_list[pi]->dlfile_path}' target="new">
                    <img src="../images/admin/download_icon.png" width="16" height="16" border="0" title="Tải về"></a>
                </div>
                <div class="{$class_td}" style="width:29px; text-align:center">
                	{if $obj_list[pi]->user_id eq $access_user_id}
                    <a href='javascript: void(0);' onclick="edit_me_DlFile({$obj_list[pi]->dlfile_id},{$kdl_id},{$kdl_type})">
                    <img src="../images/admin/b_edit.png" width="11" height="11" border="0" title="Sửa"></a>
                    {else}-{/if}
                </div>
                <div class="{$class_td}" style="width:29px; text-align:center">
                	{if $obj_list[pi]->user_id eq $access_user_id}
                    <a href='javascript: void(0)' onClick="delItems_DlFile('{$processurl}', {$obj_list[pi]->dlfile_id},{$kdl_id},{$kdl_type});">
                    <img src="../images/admin/b_drop.png" width="11" height="11" border="0" title="Xóa"></a>
                    {else}-{/if}
                </div>
            </div>
            {/section}
        </div>
        <input type="hidden" id="curpage_DlFile" name="curpage" value="{$vars.curpage}" />
    </fieldset>
    </form>
</div>
<!------------------------------------------------- Tool bar --------------------------------------------->
<div id="file_clear_txt"></div>
<div id="file_tool_bar">    
    <div id="file_page_area">
    {if $vars.curpage eq 1}
    	<img src="{$css_path}icon_first_page.png" class="img_all">
    	<img src="{$css_path}icon_pre_page.png" class="img_all">
    {else}
    <a href="javascript: void(0)" id="first_page" onclick="gotoPage_DlFile('{$processurl}',parseInt(1));" title="Trang đầu">
    	<img src="{$css_path}icon_first_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="pre_page" onclick="gotoPage_DlFile('{$processurl}',parseInt(document.getElementById('page_DlFile').value)-parseInt(1));" title="Trang trước">
    	<img src="{$css_path}icon_pre_page.png" class="img_all">
    </a>
    {/if}
    </div>
    <div style="float:left; line-height:19px">
        <div style="float:left; width:35px">Trang</div> 
        <div style="float:left; width:35px">
        <input type="text" value="{$vars.curpage}" name="page" id="page_DlFile" onblur=" gotoPage_DlFile('{$processurl}',this.value);" style="width:30px; font-size:12px; height:15px; border:1px solid #99bbe8">
        </div>
        <div style="float:left; width:22px"> / {$num_page}</div>
    </div>
    <div id="file_page_area">
    {if $vars.curpage eq $num_page}
    	<img src="{$css_path}icon_next_page.png" class="img_all">
        <img src="{$css_path}icon_last_page.png" class="img_all">
    {else}
    <a href="javascript: void(0)" id="next_page" onclick="gotoPage_DlFile('{$processurl}',parseInt(document.getElementById('page_DlFile').value)+parseInt(1));" title="Trang tiếp">
    	<img src="{$css_path}icon_next_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="last_page" onclick="gotoPage_DlFile('{$processurl}',parseInt({$num_page}));" title="Trang cuối">
    	<img src="{$css_path}icon_last_page.png" class="img_all">
    </a>
    {/if}
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_dl.png)">&nbsp;</div>
    <div style="float:left; width:15px">
    <a href="javascript: void(0)" id="a_ref_DlFile" title="Tải lại"><img src="{$css_path}icon_refresh.png" class="img_all"></a>
    </div>    
</div>
{literal}
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
		if(!confirm("THÔNG BÁO: \n\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
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
			//alert (processurl+'--'+dataString);
		$.ajax({
			type: "POST",
			url: processurl,
			data: dataString,
			success: function(data) {
				$('#dl_file_cont').fadeOut('fast').load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+curpage).fadeIn("fast");
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
		//alert(processurl+'-'+page+'-'+numresult+'-'+order);
		$("#dl_file_cont").load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+page);
	}
	
	function edit_me_DlFile(id,kdl_id,kdl_type){
		var dl_id = document.frmList_DlFile.dl_id.value;
		$("#dl_file_cont").load("?listDlFile&mod=kdls&edit_me=1&dlfile_id="+id+"&dl_id="+dl_id+"&kdl_id="+kdl_id+"&kdl_type="+kdl_type);
	}
			
	$("#a_ref_DlFile").click( function () { 
			var id = document.frmList_DlFile.dl_id.value;
			$('#dl_file_cont').hide();
			$('#dl_file_cont').fadeOut('fast').load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+curpage).fadeIn("fast");
		});
</script>
{/literal}