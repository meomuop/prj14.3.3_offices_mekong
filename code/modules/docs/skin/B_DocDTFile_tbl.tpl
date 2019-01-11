{literal}
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
{/literal}
<div id="file_content_insign">
	<form method="post" name="frmList_DocDTFile" action="?listDocDTFile{$vars.arg}" id="frmList_DocDTFile">
    <!------------------------------------------THEM MOI------------------------------------>
    <fieldset style="width:488px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
        {section name=qi loop=$obj_list_doc}
            {if $obj_list_doc[qi]->docDT_id eq $docDT_id}
                {assign var = "so_dt" value = $obj_list_doc[qi]->docDT_num}
            {/if}
        {/section}
        <legend class="legend_middle">Thêm/Chỉnh sửa | Số DT: {$so_dt}</legend>
    	<table width="98%" cellspacing="0" cellpadding="0" border="0" style="margin-left:5px">
            <tr height="20">
                <td colspan="2">Thông báo: 
                	<span class="msg">{$error}{$complete}</span>
            		<span id="lblError_DocDTFile" class="error">(*) là các mục bắt buộc!</span>
                </td>
            </tr>
            <tr height="30">
            	<td align="center" valign="top">
                	<div style="float:left; width:16%; line-height:25px; text-align:left">Tên tệp tin <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:29%; line-height:25px; text-align:left">
                        <input type="text" id="docDTFile_name" name="docDTFile_name" class="text_short" value="{if $obj_info.docDTFile_name neq ''}{$obj_info.docDTFile_name}{else}DT-{$so_dt}{/if}" onfocus="hide_message_DocDTFile();"/>
                    </div>
                    <div style="float:left; width:17%; line-height:25px; text-align:left">Đường dẫn <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:37%; line-height:25px; text-align:left">
                    	<input type="text" class="text_short" name="docDTFile_path" id="docDTFile_path" value="{$obj_info.docDTFile_path}" onfocus="hide_message_DocDTFile();">&nbsp;<a href="javascript:void(0)" onclick="javascript:window.open('upload1.php?form_file=frmList_DocDTFile&field_file=docDTFile_path','new_page','width=410,height=225')" >[ Tải lên ]</a>
                    </div>
                    <div style="float:left; width:16%; line-height:25px; text-align:left">Ghi chú:</div>
                    <div style="float:left; width:84%; line-height:25px; text-align:left">
                        <textarea spellcheck="false" name="docDTFile_ghichu" id="docDTFile_ghichu" cols="30" rows="5" class="text_area_small" tabindex="8">{$obj_info.docDTFile_ghichu}</textarea>
                    </div>
                    <div style="float:left; width:15%; line-height:25px; text-align:left">Trạng thái:</div>
                    <div style="float:left; width:33%; line-height:25px; text-align:left">
                        <select name="docDT_status" id="docDT_status" class="select_short" tabindex="4">
                            <option value="0" {if $obj_info.docDT_status eq 0}selected="selected"{/if}>Mới nhập</option>
                            <option value="1" {if $obj_info.docDT_status eq 1}selected="selected"{/if}>Chờ hiệu chỉnh</option>
                            <option value="2" {if $obj_info.docDT_status eq 2}selected="selected"{/if}>Đã trình ký</option>
                            <option value="3" {if $obj_info.docDT_status eq 3}selected="selected"{/if}>Đã ký</option>
                        </select>
                    </div>
                    <div style="float:left; width:52%; line-height:25px; text-align:left">
                    	<input type="button" name="btnSub_DocDTFile" id="btnSub_DocDTFile" value="Ghi lại" class="button" tabindex="14"/>
                        <input type="hidden" name="docDTFile_id" id="docDTFile_id" value="{$obj_info.docDTFile_id}">
                        <input type="hidden" name="docDT_id" id="docDT_id" value="{if $docDT_id neq ''}{$docDT_id}{else}{$obj_info.docDT_id}{/if}">
                        <input type="reset" name="Reset" value="Hủy bỏ" class="button" tabindex="15"/>
                        {literal}
                        <script language="javascript">
                            function hide_message_DocDTFile(){
                                $('#lblMessage_DocDTFile').hide();
                                $('#lblError_DocDTFile').hide();
                            }
                            
                            $(function() {
                            $('.error').hide();
                            $('#lblMessage_DocDTFile').hide();
                             
                            $("#btnSub_DocDTFile").click(function() {
								
                                $('.error').hide();
                                 
                                var $form = $("#frmList_DocDTFile");
								var docDTFile_name = $form.find('input#docDTFile_name').val();
								var docDTFile_path = $form.find('input#docDTFile_path').val();
								var docDT_id = $form.find('input#docDT_id').val();
								var docDTFile_id = $form.find('input#docDTFile_id').val();
                                var docDTFile_ghichu = $form.find('textarea#docDTFile_ghichu').val();
                                var docDT_status = $form.find('select#docDT_status :selected').val();

                                //begin validate form
                                if (docDTFile_name == "" || docDTFile_path == "" || docDT_id == ""){
                                    $('#lblError_DocDTFile').show();
                                }
                                else{
									$.post('index.php?listDocDTFile&mod=docs&add_edit=1',
										{
											docDTFile_name:docDTFile_name,
											docDTFile_path:docDTFile_path,
											docDT_id:docDT_id,
                                            docDT_status:docDT_status,
											docDTFile_id:docDTFile_id,
                                            docDTFile_ghichu:docDTFile_ghichu
										},
										function(data){
											$('#list_file_dt_cont').html(data);
											$("#list_file_dt_cont").show();
											
											$('#doc_content_main').hide();
											$('#doc_content_main').fadeOut('fast').load('index.php?listDocDT&mod=docs').fadeIn("fast");
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
    <fieldset style="width:488px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:137px">
        <legend class="legend">Danh sách: {$total_num_result}</legend>
    	<div style="float:left; height:5px; width:100%"></div>
        <div style="float:left; height:25px; width:468px; border-top:1px solid #99bbe8; border-bottom:1px solid #99bbe8 ">
            <div class="tbl_tit" style="width:30px; text-align:center"><b>STT</b></div>	
            <div class="tbl_tit" style="width:105px"><B>&nbsp;Tên tệp tin</B></div>
            <div class="tbl_tit" style="width:239px"><B>&nbsp;Ghi chú</B></div>
            <div class="tbl_tit" style="width:90px; text-align:center"><B>Chọn</B></div>
        </div>
        <div style="float:left; width:18px; height:25px">&nbsp;</div>
        <div style="float:left; height:80px; width:488px; overflow-y:scroll">
            {section name=pi loop=$obj_list}
            {if $smarty.section.pi.index is not div by 2} 
            {assign var="class_td" value="tbl_cont"} 
            {else}
            {assign var="class_td" value="tbl_cont2"} 
            {/if}
            {math x=$vars.curpage-1 y=$vars.numresult z=$smarty.section.pi.index t=1 equation="x*y+z+t" assign=stt}
            <div class="{$class_td}" style="width:30px; text-align:center">{$stt}</div>
            <div class="{$class_td}" style="width:105px; white-space:nowrap" title="{$obj_list[pi]->docDTFile_name}">
            	&nbsp;<a href='javascript: void(0);' onclick="edit_me_DocDTFile({$obj_list[pi]->docDTFile_id})">{$obj_list[pi]->docDTFile_name|str_string_cut:"25":"1"}</a>
            </div>
            <div class="{$class_td}" style="width:239px;" title="{$obj_list[pi]->docDTFile_ghichu}">
                &nbsp;{$obj_list[pi]->docDTFile_ghichu}
            </div>
            <div class="{$class_td}" style="width:30px; text-align:center">
                <a href='{$obj_list[pi]->docDTFile_path}' target="new">
                <img src="../images/admin/download_icon.png" width="16" height="16" border="0" title="Tải về"></a>
            </div>
            <div class="{$class_td}" style="width:29px; text-align:center">
            <a href='javascript: void(0);' onclick="edit_me_DocDTFile({$obj_list[pi]->docDTFile_id})">
            <img src="../images/admin/b_edit.png" width="11" height="11" border="0" title="Sửa"></a>
            </div>
            <div class="{$class_td}" style="width:29px; text-align:center">
                <a href='javascript: void(0)' onClick="delItems_DocDTFile('{$processurl}', {$obj_list[pi]->docDTFile_id});">
                <img src="../images/admin/b_drop.png" width="11" height="11" border="0" title="Xóa"></a>
            </div>
            {/section}
        </div>
        <input type="hidden" id="curpage_DocDTFile" name="curpage" value="{$vars.curpage}" />
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
    <a href="javascript: void(0)" id="first_page" onclick="gotoPage_DocDTFile('{$processurl}',parseInt(1));" title="Trang đầu">
    	<img src="{$css_path}icon_first_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="pre_page" onclick="gotoPage_DocDTFile('{$processurl}',parseInt(document.getElementById('page_DocDTFile').value)-parseInt(1));" title="Trang trước">
    	<img src="{$css_path}icon_pre_page.png" class="img_all">
    </a>
    {/if}
    </div>
    <div style="float:left; line-height:19px">
        <div style="float:left; width:35px">Trang</div> 
        <div style="float:left; width:35px">
        <input type="text" value="{$vars.curpage}" name="page" id="page_DocDTFile" onblur=" gotoPage_DocDTFile('{$processurl}',this.value);" style="width:30px; font-size:12px; height:15px; border:1px solid #99bbe8">
        </div>
        <div style="float:left; width:22px"> / {$num_page}</div>
    </div>
    <div id="file_page_area">
    {if $vars.curpage eq $num_page}
    	<img src="{$css_path}icon_next_page.png" class="img_all">
        <img src="{$css_path}icon_last_page.png" class="img_all">
    {else}
    <a href="javascript: void(0)" id="next_page" onclick="gotoPage_DocDTFile('{$processurl}',parseInt(document.getElementById('page_DocDTFile').value)+parseInt(1));" title="Trang tiếp">
    	<img src="{$css_path}icon_next_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="last_page" onclick="gotoPage_DocDTFile('{$processurl}',parseInt({$num_page}));" title="Trang cuối">
    	<img src="{$css_path}icon_last_page.png" class="img_all">
    </a>
    {/if}
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:left; width:15px">
    <a href="javascript: void(0)" id="a_ref_DocDTFile" title="Tải lại"><img src="{$css_path}icon_refresh.png" class="img_all"></a>
    </div>    
</div>
{literal}
<script language="javascript">		
	function docheck_DocDTFile(status,from_){
		var alen=document.frmList_DocDTFile.elements.length;
		alen=(alen>5)?document.frmList_DocDTFile.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
			document.frmList_DocDTFile.chkid[i].checked=status;
		}
		else{
			document.frmList_DocDTFile.chkid.checked=status;
		}
		if(from_>0) document.frmList_DocDTFile.chkall.checked=status;
	}
		
	function docheckone_DocDTFile(){
		var alen=document.frmList_DocDTFile.elements.length;
		var isChecked=true;
		alen=(alen>4)?document.frmList_DocDTFile.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_DocDTFile.chkid[i].checked==false)
					isChecked=false;
		}else{
			if(document.frmList_DocDTFile.chkid.checked==false)
				isChecked=false;
		}				
		document.frmList_DocDTFile.chkall.checked=isChecked;
	}
	
	function calculatechon_DocDTFile(){			
		var strchon="";
		var alen=document.frmList_DocDTFile.elements.length;				
		alen=(alen>2)?document.frmList_DocDTFile.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_DocDTFile.chkid[i].checked==true)
					strchon+=document.frmList_DocDTFile.chkid[i].value+",";
		}else{
			if(document.frmList_DocDTFile.chkid.checked==true)
				strchon=document.frmList_DocDTFile.chkid.value;
		}
		document.frmList_DocDTFile.chon_DocDTFile.value=strchon;
	}
	
	function delItems_DocDTFile(processurl,delStr){
		if (delStr == undefined){
			calculatechon_DocDTFile();
			delStr = document.getElementById("chon_DocDTFile").value;
		}
		if (delStr == ""){
			return false;
		}
		if(!confirm("THÔNG BÁO: \n\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
			return false;
		}	
		
		var numresult_DocDTFile,order_DocDTFile,curpage_DocDTFile;
		numresult = $("#numresult_DocDTFile").val();
		order = $("#order_DocDTFile").val();
		curpage = $("#curpage_DocDTFile").val();
		
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
				$('#list_file_dt_cont').fadeOut('fast').load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+curpage).fadeIn("fast");
			}
		});
	}
	
	function reloadPage_DocDTFile(processurl){
		var numresult_DocDTFile,order_DocDTFile,cur_pos;
		numresult = $("#numresult_DocDTFile").val();
		order = $("#order_DocDTFile").val();
		cur_pos = 0;
		$("#list_file_dt_cont").load(processurl+"&numresult="+numresult+"&order="+order+"&cur_pos="+cur_pos);
	}
	
	function gotoPage_DocDTFile(processurl,page){
		var numresult_DocDTFile,order_DocDTFile,cur_pos;
		numresult = $("#numresult_DocDTFile").val();
		order = $("#order_DocDTFile").val();
		//alert(processurl+'-'+page+'-'+numresult+'-'+order);
		$("#list_file_dt_cont").load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+page);
	}
	
	function edit_me_DocDTFile(id){
		var docDT_id = document.frmList_DocDTFile.docDT_id.value;
		$("#list_file_dt_cont").load("?listDocDTFile&mod=docs&edit_me=1&docDTFile_id="+id+"&docDT_id="+docDT_id);
	}
		
	$("#a_ref_DocDTFile").click( function () { 
			var id = document.frmList_DocDTFile.docDT_id.value;
			$('#list_file_dt_cont').hide();
			$('#list_file_dt_cont').fadeOut('fast').load('index.php?listDocDTFile&mod=docs&docDT_id='+id).fadeIn("fast");
		});
</script>
{/literal}