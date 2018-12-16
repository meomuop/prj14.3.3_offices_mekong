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
<div id="reply_file_content_insign">
	<form method="post" name="frmList_listTNVBFile" action="?listTNVBFile{$vars.arg}" id="frmList_listTNVBFile">
    <!------------------------------------------THEM MOI------------------------------------>
    <fieldset style="width:248px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
        <legend class="legend">Thêm/Chỉnh sửa</legend>
    	<table width="98%" cellspacing="0" cellpadding="0" border="0" style="margin-left:5px">
            <tr height="20">
                <td colspan="2"> 
                	{if $error or $complete}
                	<span class="msg">Thông báo: <font color="#FF0000">{$error}</font>{$complete}</span>{/if}
            		<span id="lblError_listTNVBFile" class="error">Thông báo: (*) là các mục bắt buộc!</span>
                </td>
            </tr>
            <tr><td colspan="2">Số ký hiệu văn bản: {$obj_list_doc[0]->docreply_code}</td></tr>
            <tr height="30">
            	<td align="center" valign="top">
                	<div style="float:left; width:30%; line-height:25px; text-align:left">Tên tệp tin <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left">
                        <input type="text" id="docreplyfile_name" name="docreplyfile_name" class="text_short" value="VB-{$obj_list_doc[0]->docreply_code}" onfocus="hide_message_listTNVBFile();"/>
                    </div>
                    <div style="float:left; width:30%; line-height:25px; text-align:left">Đường dẫn <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left">
                    	<input type="text" class="text_short" name="docreplyfile_path" id="docreplyfile_path" value="{$obj_info.docreplyfile_path}" onfocus="hide_message_listTNVBFile();">&nbsp;<a href="javascript:void(0)" onclick="javascript:window.open('upload3.php?form_file=frmList_listTNVBFile&field_file=docreplyfile_path','new_page','width=410,height=225')" >[ Tải lên ]</a>
                    </div>
                    <div style="float:left; width:100%; line-height:25px; text-align:left">
                    	<input type="button" name="btnSub_listTNVBFile" id="btnSub_listTNVBFile" value="Ghi lại" class="button" tabindex="14"/>
                        <input type="hidden" name="arg_doc" id="arg_doc" value="{$vars.arg_doc}">
                        <input type="hidden" name="docreplyfile_id" id="docreplyfile_id" value="{$obj_info.docreplyfile_id}">
                        <input type="hidden" name="user_id" id="user_id" value="{$obj_info.user_id}">
                        <input type="hidden" name="docreply_id" id="docreply_id" value="{if $docreply_id neq ''}{$docreply_id}{else}{$obj_info.docreply_id}{/if}">
                        <input type="hidden" name="doc_id" id="doc_id" value="{$doc_id}">
                        <input type="reset" name="Reset" value="Hủy bỏ" class="button" tabindex="15"/>
                        {literal}
                        <script language="javascript">
                            function hide_message_listTNVBFile(){
                                $('#lblMessage_listTNVBFile').hide();
                                $('#lblError_listTNVBFile').hide();
                            }
                            
                            $(function() {
                            $('.error').hide();
                            $('#lblMessage_listTNVBFile').hide();
                             
                            $("#btnSub_listTNVBFile").click(function() {
								
                                $('.error').hide();
                                 
                                var $form 				= $("#frmList_listTNVBFile");
								var docreplyfile_name 	= $form.find('input#docreplyfile_name').val();
								var docreplyfile_path 	= $form.find('input#docreplyfile_path').val();
								var docreply_id 		= $form.find('input#docreply_id').val();
								var docreplyfile_id 	= $form.find('input#docreplyfile_id').val();
								var arg 				= $form.find('input#arg_doc').val();
								var doc_id 				= $form.find('input#doc_id').val();
								
                                //begin validate form
                                if (docreplyfile_name == "" || docreplyfile_path == "" || docreply_id == ""){
                                    $('#lblError_listTNVBFile').show();
                                }
                                else{
									$.post('index.php?listTNVBFile&mod=truyennhans&add_edit=1',
										{
											docreplyfile_name:docreplyfile_name,
											docreplyfile_path:docreplyfile_path,
											docreply_id:docreply_id,
											docreplyfile_id:docreplyfile_id,
										},
										function(data){
											$('#reply_file_cont').html(data);
											$("#reply_file_cont").show();
											
											$('#tnvb_lienquan_cont').hide();
											$('#tnvb_lienquan_cont').fadeOut('fast').load("?listTNVBReply&mod=truyennhans&doc_id="+doc_id).fadeIn("fast");	
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
                <div class="{$class_td}" style="width:110px; white-space:nowrap" title="{$obj_list[pi]->docreplyfile_name}">
                	{if $obj_list[pi]->user_id eq $access_user_id}
                    &nbsp;<a href='javascript: void(0);' onclick="edit_me_listTNVBFile({$obj_list[pi]->docreplyfile_id})">{$obj_list[pi]->docreplyfile_name|str_string_cut:"25":"1"}</a>
                    {else}{$obj_list[pi]->docreplyfile_name}{/if}
                </div>
                <div class="{$class_td}" style="width:30px; text-align:center">
                    <a href='{$obj_list[pi]->docreplyfile_path}' target="new">
                    <img src="../images/admin/download_icon.png" width="16" height="16" border="0" title="Tải về"></a>
                </div>
                <div class="{$class_td}" style="width:29px; text-align:center">
                	{if $obj_list[pi]->user_id eq $access_user_id}
                    <a href='javascript: void(0);' onclick="edit_me_listTNVBFile({$obj_list[pi]->docreplyfile_id})">
                    <img src="../images/admin/b_edit.png" width="11" height="11" border="0" title="Sửa"></a>
                    {else}-{/if}
                </div>
                <div class="{$class_td}" style="width:29px; text-align:center">
                	{if $obj_list[pi]->user_id eq $access_user_id}
                    <a href='javascript: void(0)' onClick="delItems_listTNVBFile('{$processurl}', {$obj_list[pi]->docreplyfile_id});">
                    <img src="../images/admin/b_drop.png" width="11" height="11" border="0" title="Xóa"></a>
                    {else}-{/if}
                </div>
            </div>
            {/section}
        </div>
        <input type="hidden" id="curpage_listTNVBFile" name="curpage" value="{$vars.curpage}" />
    </fieldset>
    </form>
</div>
<!------------------------------------------------- Tool bar --------------------------------------------->
<div id="reply_file_clear_txt"></div>
<div id="reply_file_tool_bar">    
    <div id="reply_file_page_area">
    {if $vars.curpage eq 1}
    	<img src="{$css_path}icon_first_page.png" class="img_all">
    	<img src="{$css_path}icon_pre_page.png" class="img_all">
    {else}
    <a href="javascript: void(0)" id="first_page" onclick="gotoPage_listTNVBFile('{$processurl}',parseInt(1));" title="Trang đầu">
    	<img src="{$css_path}icon_first_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="pre_page" onclick="gotoPage_listTNVBFile('{$processurl}',parseInt(document.getElementById('page_listTNVBFile').value)-parseInt(1));" title="Trang trước">
    	<img src="{$css_path}icon_pre_page.png" class="img_all">
    </a>
    {/if}
    </div>
    <div style="float:left; line-height:19px">
        <div style="float:left; width:35px">Trang</div> 
        <div style="float:left; width:35px">
        <input type="text" value="{$vars.curpage}" name="page" id="page_listTNVBFile" onblur=" gotoPage_listTNVBFile('{$processurl}',this.value);" style="width:30px; font-size:12px; height:15px; border:1px solid #99bbe8">
        </div>
        <div style="float:left; width:22px"> / {$num_page}</div>
    </div>
    <div id="reply_file_page_area">
    {if $vars.curpage eq $num_page}
    	<img src="{$css_path}icon_next_page.png" class="img_all">
        <img src="{$css_path}icon_last_page.png" class="img_all">
    {else}
    <a href="javascript: void(0)" id="next_page" onclick="gotoPage_listTNVBFile('{$processurl}',parseInt(document.getElementById('page_listTNVBFile').value)+parseInt(1));" title="Trang tiếp">
    	<img src="{$css_path}icon_next_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="last_page" onclick="gotoPage_listTNVBFile('{$processurl}',parseInt({$num_page}));" title="Trang cuối">
    	<img src="{$css_path}icon_last_page.png" class="img_all">
    </a>
    {/if}
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:left; width:15px">
    <a href="javascript: void(0)" id="a_ref_listTNVBFile" title="Tải lại"><img src="{$css_path}icon_refresh.png" class="img_all"></a>
    </div>    
</div>
{literal}
<script language="javascript">		
	function docheck_listTNVBFile(status,from_){
		var alen=document.frmList_listTNVBFile.elements.length;
		alen=(alen>5)?document.frmList_listTNVBFile.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
			document.frmList_listTNVBFile.chkid[i].checked=status;
		}
		else{
			document.frmList_listTNVBFile.chkid.checked=status;
		}
		if(from_>0) document.frmList_listTNVBFile.chkall.checked=status;
	}
		
	function docheckone_listTNVBFile(){
		var alen=document.frmList_listTNVBFile.elements.length;
		var isChecked=true;
		alen=(alen>4)?document.frmList_listTNVBFile.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_listTNVBFile.chkid[i].checked==false)
					isChecked=false;
		}else{
			if(document.frmList_listTNVBFile.chkid.checked==false)
				isChecked=false;
		}				
		document.frmList_listTNVBFile.chkall.checked=isChecked;
	}
	
	function calculatechon_listTNVBFile(){			
		var strchon="";
		var alen=document.frmList_listTNVBFile.elements.length;				
		alen=(alen>2)?document.frmList_listTNVBFile.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_listTNVBFile.chkid[i].checked==true)
					strchon+=document.frmList_listTNVBFile.chkid[i].value+",";
		}else{
			if(document.frmList_listTNVBFile.chkid.checked==true)
				strchon=document.frmList_listTNVBFile.chkid.value;
		}
		document.frmList_listTNVBFile.chon_listTNVBFile.value=strchon;
	}
	
	function delItems_listTNVBFile(processurl,delStr){
		if (delStr == undefined){
			calculatechon_listTNVBFile();
			delStr = document.getElementById("chon_listTNVBFile").value;
		}
		if (delStr == ""){
			return false;
		}
		if(!confirm("THÔNG BÁO: \n\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
			return false;
		}	
		
		var numresult_listTNVBFile,order_listTNVBFile,curpage_listTNVBFile;
		numresult = $("#numresult_listTNVBFile").val();
		order = $("#order_listTNVBFile").val();
		curpage = $("#curpage_listTNVBFile").val();
		
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
				$('#reply_file_cont').fadeOut('fast').load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+curpage).fadeIn("fast");
			}
		});
	}
	
	function reloadPage_listTNVBFile(processurl){
		var numresult_listTNVBFile,order_listTNVBFile,cur_pos;
		numresult = $("#numresult_listTNVBFile").val();
		order = $("#order_listTNVBFile").val();
		cur_pos = 0;
		$("#reply_file_cont").load(processurl+"&numresult="+numresult+"&order="+order+"&cur_pos="+cur_pos);
	}
	
	function gotoPage_listTNVBFile(processurl,page){
		var numresult_listTNVBFile,order_listTNVBFile,cur_pos;
		numresult = $("#numresult_listTNVBFile").val();
		order = $("#order_listTNVBFile").val();
		//alert(processurl+'-'+page+'-'+numresult+'-'+order);
		$("#reply_file_cont").load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+page);
	}
	
	function edit_me_listTNVBFile(id){
		var docreply_id = document.frmList_listTNVBFile.docreply_id.value;
		$("#reply_file_cont").load("?listTNVBFile&mod=truyennhans&edit_me=1&docreplyfile_id="+id+"&docreply_id="+docreply_id);
	}
			
	$("#a_ref_listTNVBFile").click( function () { 
			var id = document.frmList_listTNVBFile.docreply_id.value;
			$('#reply_file_cont').hide();
			$('#reply_file_cont').fadeOut('fast').load('index.php?listTNVBFile&mod=truyennhans&docreply_id='+id).fadeIn("fast");
		});
</script>
{/literal}