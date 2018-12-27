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
	<form method="post" name="frmList_DocOutFile" action="?listDocOutFile{$vars.arg}" id="frmList_DocOutFile">
    <!------------------------------------------THEM MOI------------------------------------>
    <fieldset style="width:288px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
        <legend class="legend">Thêm/Chỉnh sửa</legend>
        {section name=qi loop=$obj_list_doc}
        {if $obj_list_doc[qi]->docOut_id eq $docOut_id} 
            {assign var = "so_ky_hieu" value = $obj_list_doc[qi]->docOut_code}
            {assign var = "so_di" value = $obj_list_doc[qi]->docOut_num}
            {assign var = "so_di_db" value = $obj_list_doc[qi]->docOut_num_typical}
        {/if}
        {/section}
    	<table width="98%" cellspacing="0" cellpadding="0" border="0" style="margin-left:5px">
            <tr height="20">
                <td colspan="2">Thông báo: 
                	<span class="msg">{$error}{$complete}</span>
            		<span id="lblError_DocOutFile" class="error">(*) là các mục bắt buộc!</span>
                </td>
            </tr>
            <tr height="20">
            <td colspan="2">Số ký hiệu văn bản: {$so_ky_hieu} - Số đi: {if $so_di neq '' or $so_di neq 0}{$so_di}{else}{$so_di_db}{/if}
            </td>
            </tr>
            <tr height="30">
            	<td align="center" valign="top">
                	<div style="float:left; width:30%; line-height:25px; text-align:left">Tên tệp tin <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left">
                        <input type="text" id="docOutFile_name" name="docOutFile_name" class="text_short" value="{if $obj_info.docOutFile_name neq ''}{$obj_info.docOutFile_name}{else}{$so_ky_hieu}{/if}" onfocus="hide_message_DocOutFile();"/>
                    </div>
                    <div style="float:left; width:30%; line-height:25px; text-align:left">Đường dẫn <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left">
                    	<input type="text" class="text_short" name="docOutFile_path" id="docOutFile_path" value="{$obj_info.docOutFile_path}" onfocus="hide_message_DocOutFile();">&nbsp;<a href="javascript:void(0)" onclick="javascript:window.open('upload1.php?form_file=frmList_DocOutFile&field_file=docOutFile_path','new_page','width=410,height=225')" >[ Tải lên ]</a>
                    </div>
                    <div style="float:left; width:100%; line-height:25px; text-align:left">
                    	<input type="button" name="btnSub_DocOutFile" id="btnSub_DocOutFile" value="Ghi lại" class="button" tabindex="14"/>
                        <input type="hidden" name="docOutFile_id" id="docOutFile_id" value="{$obj_info.docOutFile_id}">
                        <input type="hidden" name="docOut_id" id="docOut_id" value="{if $docOut_id neq ''}{$docOut_id}{else}{$obj_info.docOut_id}{/if}">
                        <input type="reset" name="Reset" value="Hủy bỏ" class="button" tabindex="15"/>
                        {literal}
                        <script language="javascript">
                            function hide_message_DocOutFile(){
                                $('#lblMessage_DocOutFile').hide();
                                $('#lblError_DocOutFile').hide();
                            }
                            
                            $(function() {
                            $('.error').hide();
                            $('#lblMessage_DocOutFile').hide();
                             
                            $("#btnSub_DocOutFile").click(function() {
								
                                $('.error').hide();
                                 
                                var $form = $("#frmList_DocOutFile");
								var docOutFile_name = $form.find('input#docOutFile_name').val();
								var docOutFile_path = $form.find('input#docOutFile_path').val();
								var docOut_id = $form.find('input#docOut_id').val();
								var docOutFile_id = $form.find('input#docOutFile_id').val();
								
                                //begin validate form
                                if (docOutFile_name == "" || docOutFile_path == "" || docOut_id == ""){
                                    $('#lblError_DocOutFile').show();
                                }
                                else{
									$.post('index.php?listDocOutFile&mod=docs&add_edit=1',
										{
											docOutFile_name:docOutFile_name,
											docOutFile_path:docOutFile_path,
											docOut_id:docOut_id,
											docOutFile_id:docOutFile_id,
										},
										function(data){
											$('#list_file_cont').html(data);
											$("#list_file_cont").show();
											
											$('#doc_content_main').hide();
											$('#doc_content_main').fadeOut('fast').load('index.php?listDocOut&mod=docs').fadeIn("fast");
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
    <fieldset style="width:288px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:147px">
        <legend class="legend">Danh sách: {$total_num_result}</legend>
    	<div style="float:left; height:5px; width:100%"></div>
        <div style="float:left; height:25px; width:268px; border-top:1px solid #99bbe8; border-bottom:1px solid #99bbe8 ">
            <div class="tbl_tit" style="width:30px; text-align:center"><b>STT</b></div>	
            <div class="tbl_tit" style="width:145px"><B>&nbsp;Tên tệp tin</B></div>
            <div class="tbl_tit" style="width:90px; text-align:center"><B>Chọn</B></div>
        </div>
        <div style="float:left; width:18px; height:25px">&nbsp;</div>
        <div style="float:left; height:90px; width:288px; overflow-y:scroll">
            {section name=pi loop=$obj_list}
            {if $smarty.section.pi.index is not div by 2} 
            {assign var="class_td" value="tbl_cont"} 
            {else}
            {assign var="class_td" value="tbl_cont2"} 
            {/if}
            {math x=$vars.curpage-1 y=$vars.numresult z=$smarty.section.pi.index t=1 equation="x*y+z+t" assign=stt}
            <div class="{$class_td}" style="width:30px; text-align:center">{$stt}</div>
            <div class="{$class_td}" style="width:145px; white-space:nowrap" title="{$obj_list[pi]->docOutFile_name}">
            	&nbsp;<a href='javascript: void(0);' onclick="edit_me_DocOutFile({$obj_list[pi]->docOutFile_id})">{$obj_list[pi]->docOutFile_name|str_string_cut:"25":"1"}</a>
            </div>
            <div class="{$class_td}" style="width:30px; text-align:center">
                <a href='javascript: void(0);' onclick="download_me_DocOutFile({$obj_list[pi]->docOutFile_id})">
                <img src="../images/admin/download_icon.png" width="16" height="16" border="0" title="Tải về"></a>
            </div>
            <div class="{$class_td}" style="width:29px; text-align:center">
                <a href='javascript: void(0);' onclick="edit_me_DocOutFile({$obj_list[pi]->docOutFile_id})">
                <img src="../images/admin/b_edit.png" width="11" height="11" border="0" title="Sửa"></a>
            </div>
            <div class="{$class_td}" style="width:29px; text-align:center">
                <a href='javascript: void(0)' onClick="delItems_DocOutFile('{$processurl}', {$obj_list[pi]->docOutFile_id});">
                <img src="../images/admin/b_drop.png" width="11" height="11" border="0" title="Xóa"></a>
            </div>
            {/section}
        </div>
        <input type="hidden" id="curpage_DocOutFile" name="curpage" value="{$vars.curpage}" />
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
    <a href="javascript: void(0)" id="first_page" onclick="gotoPage_DocOutFile('{$processurl}',parseInt(1));" title="Trang đầu">
    	<img src="{$css_path}icon_first_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="pre_page" onclick="gotoPage_DocOutFile('{$processurl}',parseInt(document.getElementById('page_DocOutFile').value)-parseInt(1));" title="Trang trước">
    	<img src="{$css_path}icon_pre_page.png" class="img_all">
    </a>
    {/if}
    </div>
    <div style="float:left; line-height:19px">
        <div style="float:left; width:35px">Trang</div> 
        <div style="float:left; width:35px">
        <input type="text" value="{$vars.curpage}" name="page" id="page_DocOutFile" onblur=" gotoPage_DocOutFile('{$processurl}',this.value);" style="width:30px; font-size:12px; height:15px; border:1px solid #99bbe8">
        </div>
        <div style="float:left; width:22px"> / {$num_page}</div>
    </div>
    <div id="file_page_area">
    {if $vars.curpage eq $num_page}
    	<img src="{$css_path}icon_next_page.png" class="img_all">
        <img src="{$css_path}icon_last_page.png" class="img_all">
    {else}
    <a href="javascript: void(0)" id="next_page" onclick="gotoPage_DocOutFile('{$processurl}',parseInt(document.getElementById('page_DocOutFile').value)+parseInt(1));" title="Trang tiếp">
    	<img src="{$css_path}icon_next_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="last_page" onclick="gotoPage_DocOutFile('{$processurl}',parseInt({$num_page}));" title="Trang cuối">
    	<img src="{$css_path}icon_last_page.png" class="img_all">
    </a>
    {/if}
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:left; width:15px">
    <a href="javascript: void(0)" id="a_ref_DocOutFile" title="Tải lại"><img src="{$css_path}icon_refresh.png" class="img_all"></a>
    </div>    
</div>
{literal}
<script language="javascript">		
	function docheck_DocOutFile(status,from_){
		var alen=document.frmList_DocOutFile.elements.length;
		alen=(alen>5)?document.frmList_DocOutFile.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
			document.frmList_DocOutFile.chkid[i].checked=status;
		}
		else{
			document.frmList_DocOutFile.chkid.checked=status;
		}
		if(from_>0) document.frmList_DocOutFile.chkall.checked=status;
	}
		
	function docheckone_DocOutFile(){
		var alen=document.frmList_DocOutFile.elements.length;
		var isChecked=true;
		alen=(alen>4)?document.frmList_DocOutFile.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_DocOutFile.chkid[i].checked==false)
					isChecked=false;
		}else{
			if(document.frmList_DocOutFile.chkid.checked==false)
				isChecked=false;
		}				
		document.frmList_DocOutFile.chkall.checked=isChecked;
	}
	
	function calculatechon_DocOutFile(){			
		var strchon="";
		var alen=document.frmList_DocOutFile.elements.length;				
		alen=(alen>2)?document.frmList_DocOutFile.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_DocOutFile.chkid[i].checked==true)
					strchon+=document.frmList_DocOutFile.chkid[i].value+",";
		}else{
			if(document.frmList_DocOutFile.chkid.checked==true)
				strchon=document.frmList_DocOutFile.chkid.value;
		}
		document.frmList_DocOutFile.chon_DocOutFile.value=strchon;
	}
	
	function delItems_DocOutFile(processurl,delStr){
		if (delStr == undefined){
			calculatechon_DocOutFile();
			delStr = document.getElementById("chon_DocOutFile").value;
		}
		if (delStr == ""){
			return false;
		}
		if(!confirm("THÔNG BÁO: \n\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
			return false;
		}	
		
		var numresult_DocOutFile,order_DocOutFile,curpage_DocOutFile;
		numresult = $("#numresult_DocOutFile").val();
		order = $("#order_DocOutFile").val();
		curpage = $("#curpage_DocOutFile").val();
		
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
				$('#list_file_cont').fadeOut('fast').load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+curpage).fadeIn("fast");
			}
		});
	}
	
	function reloadPage_DocOutFile(processurl){
		var numresult_DocOutFile,order_DocOutFile,cur_pos;
		numresult = $("#numresult_DocOutFile").val();
		order = $("#order_DocOutFile").val();
		cur_pos = 0;
		$("#list_file_cont").load(processurl+"&numresult="+numresult+"&order="+order+"&cur_pos="+cur_pos);
	}
	
	function gotoPage_DocOutFile(processurl,page){
		var numresult_DocOutFile,order_DocOutFile,cur_pos;
		numresult = $("#numresult_DocOutFile").val();
		order = $("#order_DocOutFile").val();
		//alert(processurl+'-'+page+'-'+numresult+'-'+order);
		$("#list_file_cont").load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+page);
	}
	
	function edit_me_DocOutFile(id){
		var docOut_id = document.frmList_DocFile.docOut_id.value;
		$("#list_file_cont").load("?listDocOutFile&mod=docs&edit_me=1&docOutFile_id="+id+"&docOut_id="+docOut_id);
	}
		
	$("#a_ref_DocOutFile").click( function () { 
			var id = document.frmList_DocOutFile.docOut_id.value;
			$('#list_file_cont').hide();
			$('#list_file_cont').fadeOut('fast').load('index.php?listDocOutFile&mod=docs&docOut_id='+id).fadeIn("fast");
		});
</script>
{/literal}