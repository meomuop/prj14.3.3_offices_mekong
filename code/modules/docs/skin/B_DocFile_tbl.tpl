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
	<form method="post" name="frmList_DocFile" action="?listDocFile{$vars.arg}" id="frmList_DocFile">
    <!------------------------------------------THEM MOI------------------------------------>
    <fieldset style="width:288px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
        <legend class="legend">Thêm/Chỉnh sửa</legend>
        {section name=qi loop=$obj_list_doc}
        {if $obj_list_doc[qi]->doc_id eq $doc_id} 
            {assign var = "so_ky_hieu" value = $obj_list_doc[qi]->doc_code}
            {assign var = "so_den" value = $obj_list_doc[qi]->doc_num}
        {/if}
        {/section}
    	<table width="98%" cellspacing="0" cellpadding="0" border="0" style="margin-left:5px">
            <tr height="20">
                <td colspan="2"> 
                	{if $error or $complete}
                	<span class="msg">Thông báo: <font color="#FF0000">{$error}</font>{$complete}</span>{/if}
            		<span id="lblError_DocFile" class="error">Thông báo: (*) là các mục bắt buộc!</span>
                </td>
            </tr>
            <tr height="20"><td colspan="2">Số ký hiệu văn bản: {$so_ky_hieu} - Số đến: {$so_den}</td></tr>
            <tr>
            	<td align="center" valign="top">
                	<div style="float:left; width:30%; line-height:25px; text-align:left">Tên tệp tin <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left">
                        <input type="text" id="docFile_name" name="docFile_name" class="text_short" value="{if $obj_info.docFile_name neq ''}{$obj_info.docFile_name}{else}{$so_ky_hieu}{/if}" onfocus="hide_message_DocFile();"/>
                    </div>
                    <div style="float:left; width:30%; line-height:25px; text-align:left">Đường dẫn <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left">
                    	<input type="text" class="text_short" name="docFile_path" id="docFile_path" value="{$obj_info.docFile_path}" onfocus="hide_message_DocFile();">&nbsp;<a href="javascript:void(0)" onclick="javascript:window.open('upload1.php?form_file=frmList_DocFile&field_file=docFile_path','new_page','width=410,height=225')" >[ Tải lên ]</a>
                    </div>
                    <div style="float:left; width:100%; line-height:25px; text-align:left">
                    	<input type="button" name="btnSub_DocFile" id="btnSub_DocFile" value="Ghi lại" class="button" tabindex="14"/>
                        <input type="hidden" name="arg_doc" id="arg_doc" value="{$vars.arg_doc}">
                        <input type="hidden" name="docFile_id" id="docFile_id" value="{$obj_info.docFile_id}">
                        <input type="hidden" name="tran_doc" id="tran_doc" value="{$tran_doc}">
                        <input type="hidden" name="user_id" id="user_id" value="{$obj_info.user_id}">
                        <input type="hidden" name="doc_id" id="doc_id" value="{if $doc_id neq ''}{$doc_id}{else}{$obj_info.doc_id}{/if}">
                        <input type="reset" name="Reset" value="Hủy bỏ" class="button" tabindex="15"/>
                        {literal}
                        <script language="javascript">
                            function hide_message_DocFile(){
                                $('#lblMessage_DocFile').hide();
                                $('#lblError_DocFile').hide();
                            }
                            
                            $(function() {
                            $('.error').hide();
                            $('#lblMessage_DocFile').hide();
                             
                            $("#btnSub_DocFile").click(function() {
								
                                $('.error').hide();
                                 
                                var $form 			= $("#frmList_DocFile");
								var docFile_name 	= $form.find('input#docFile_name').val();
								var docFile_path 	= $form.find('input#docFile_path').val();
								var doc_id 			= $form.find('input#doc_id').val();
								var docFile_id 		= $form.find('input#docFile_id').val();
								var arg 			= $form.find('input#arg_doc').val();
								var tran_doc 		= $form.find('input#tran_doc').val();
								
                                //begin validate form
                                if (docFile_name == "" || docFile_path == "" || doc_id == ""){
                                    $('#lblError_DocFile').show();
                                }
                                else{
									$.post('index.php?listDocFile&mod=docs&add_edit=1',
										{
											docFile_name:docFile_name,
											docFile_path:docFile_path,
											doc_id:doc_id,
											docFile_id:docFile_id,
										},
										function(data){
											$('#list_file_cont').html(data);
											$("#list_file_cont").show();
											
											var user_level_txt 	= document.getElementById('user_level_txt').value;
											if (tran_doc == 1){
												$('#doc_content_main').hide();
												$('#doc_content_main').fadeOut('fast').load('index.php?tranDoc'+arg).fadeIn("fast");	
											}else{
												if(user_level_txt==1 || user_level_txt==2 || user_level_txt==9){
													$('#doc_content_main').hide();
													$('#doc_content_main').fadeOut('fast').load('index.php?listDoc'+arg).fadeIn("fast");
												}else if(user_level_txt==4 || user_level_txt==5){
													$('#doc_content_main').hide();
													$('#doc_content_main').fadeOut('fast').load('index.php?replyDoc'+arg).fadeIn("fast");
												}else if(user_level_txt==3 || user_level_txt==6 || user_level_txt==7){
													$('#doc_content_main').hide();
													$('#doc_content_main').fadeOut('fast').load('index.php?processDoc'+arg).fadeIn("fast");
												}
											}
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
        <legend class="legend"><div style="width:130px; float:left">Danh sách: {$total_num_result}</div></legend>
    	<div style="float:left; height:5px; width:100%"></div>
        <div style="float:left; height:25px; width:273px; border-top:1px solid #99bbe8; border-bottom:1px solid #99bbe8 ">
            <div class="tbl_tit" style="width:30px; text-align:center"><b>STT</b></div>	
            <div class="tbl_tit" style="width:150px"><B>&nbsp;Tên tệp tin</B></div>
            <div class="tbl_tit" style="width:90px; text-align:center"><B>Chọn</B></div>
        </div>
        <div style="float:left; width:18px; height:25px">&nbsp;</div>
        <div style="float:left; height:90px; width:291px; overflow-y:scroll">
            {section name=pi loop=$obj_list}
            {if $smarty.section.pi.index is not div by 2} 
            {assign var="class_td" value="tbl_cont"} 
            {else}
            {assign var="class_td" value="tbl_cont2"} 
            {/if}
            {math x=$vars.curpage-1 y=$vars.numresult z=$smarty.section.pi.index t=1 equation="x*y+z+t" assign=stt}
            <div style="float:left">
                <div class="{$class_td}" style="width:30px; text-align:center">{$stt}</div>
                <div class="{$class_td}" style="width:150px; white-space:nowrap" title="{$obj_list[pi]->docFile_name}">
                	{if $obj_list[pi]->user_id eq $access_user_id}
                    &nbsp;<a href='javascript: void(0);' onclick="edit_me_DocFile({$obj_list[pi]->docFile_id})">{$obj_list[pi]->docFile_name|str_string_cut:"25":"1"}</a>
                    {else}{$obj_list[pi]->docFile_name}{/if}
                </div>
                <div class="{$class_td}" style="width:30px; text-align:center">
                    <a href='{$obj_list[pi]->docFile_path}' target="new">
                    <img src="../images/admin/download_icon.png" width="16" height="16" border="0" title="Tải về"></a>
                </div>
                <div class="{$class_td}" style="width:29px; text-align:center">
                	{if $obj_list[pi]->user_id eq $access_user_id}
                    <a href='javascript: void(0);' onclick="edit_me_DocFile({$obj_list[pi]->docFile_id})">
                    <img src="../images/admin/b_edit.png" width="11" height="11" border="0" title="Sửa"></a>
                    {else}-{/if}
                </div>
                <div class="{$class_td}" style="width:29px; text-align:center">
                	{if $obj_list[pi]->user_id eq $access_user_id}
                    <a href='javascript: void(0)' onClick="delItems_DocFile('{$processurl}', {$obj_list[pi]->docFile_id});">
                    <img src="../images/admin/b_drop.png" width="11" height="11" border="0" title="Xóa"></a>
                    {else}-{/if}
                </div>
            </div>
            {/section}
        </div>
        <input type="hidden" id="curpage_DocFile" name="curpage" value="{$vars.curpage}" />
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
    <a href="javascript: void(0)" id="first_page" onclick="gotoPage_DocFile('{$processurl}',parseInt(1));" title="Trang đầu">
    	<img src="{$css_path}icon_first_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="pre_page" onclick="gotoPage_DocFile('{$processurl}',parseInt(document.getElementById('page_DocFile').value)-parseInt(1));" title="Trang trước">
    	<img src="{$css_path}icon_pre_page.png" class="img_all">
    </a>
    {/if}
    </div>
    <div style="float:left; line-height:19px">
        <div style="float:left; width:35px">Trang</div> 
        <div style="float:left; width:35px">
        <input type="text" value="{$vars.curpage}" name="page" id="page_DocFile" onblur=" gotoPage_DocFile('{$processurl}',this.value);" style="width:30px; font-size:12px; height:15px; border:1px solid #99bbe8">
        </div>
        <div style="float:left; width:22px"> / {$num_page}</div>
    </div>
    <div id="file_page_area">
    {if $vars.curpage eq $num_page}
    	<img src="{$css_path}icon_next_page.png" class="img_all">
        <img src="{$css_path}icon_last_page.png" class="img_all">
    {else}
    <a href="javascript: void(0)" id="next_page" onclick="gotoPage_DocFile('{$processurl}',parseInt(document.getElementById('page_DocFile').value)+parseInt(1));" title="Trang tiếp">
    	<img src="{$css_path}icon_next_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="last_page" onclick="gotoPage_DocFile('{$processurl}',parseInt({$num_page}));" title="Trang cuối">
    	<img src="{$css_path}icon_last_page.png" class="img_all">
    </a>
    {/if}
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:left; width:15px">
    <a href="javascript: void(0)" id="a_ref_DocFile" title="Tải lại"><img src="{$css_path}icon_refresh.png" class="img_all"></a>
    </div>    
</div>
{literal}
<script language="javascript">		
	function docheck_DocFile(status,from_){
		var alen=document.frmList_DocFile.elements.length;
		alen=(alen>5)?document.frmList_DocFile.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
			document.frmList_DocFile.chkid[i].checked=status;
		}
		else{
			document.frmList_DocFile.chkid.checked=status;
		}
		if(from_>0) document.frmList_DocFile.chkall.checked=status;
	}
		
	function docheckone_DocFile(){
		var alen=document.frmList_DocFile.elements.length;
		var isChecked=true;
		alen=(alen>4)?document.frmList_DocFile.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_DocFile.chkid[i].checked==false)
					isChecked=false;
		}else{
			if(document.frmList_DocFile.chkid.checked==false)
				isChecked=false;
		}				
		document.frmList_DocFile.chkall.checked=isChecked;
	}
	
	function calculatechon_DocFile(){			
		var strchon="";
		var alen=document.frmList_DocFile.elements.length;				
		alen=(alen>2)?document.frmList_DocFile.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_DocFile.chkid[i].checked==true)
					strchon+=document.frmList_DocFile.chkid[i].value+",";
		}else{
			if(document.frmList_DocFile.chkid.checked==true)
				strchon=document.frmList_DocFile.chkid.value;
		}
		document.frmList_DocFile.chon_DocFile.value=strchon;
	}
	
	function delItems_DocFile(processurl,delStr){
		if (delStr == undefined){
			calculatechon_DocFile();
			delStr = document.getElementById("chon_DocFile").value;
		}
		if (delStr == ""){
			return false;
		}
		if(!confirm("THÔNG BÁO: \n\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
			return false;
		}	
		
		var numresult_DocFile,order_DocFile,curpage_DocFile;
		numresult = $("#numresult_DocFile").val();
		order = $("#order_DocFile").val();
		curpage = $("#curpage_DocFile").val();
		
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
	
	function reloadPage_DocFile(processurl){
		var numresult_DocFile,order_DocFile,cur_pos;
		numresult = $("#numresult_DocFile").val();
		order = $("#order_DocFile").val();
		cur_pos = 0;
		$("#list_file_cont").load(processurl+"&numresult="+numresult+"&order="+order+"&cur_pos="+cur_pos);
	}
	
	function gotoPage_DocFile(processurl,page){
		var numresult_DocFile,order_DocFile,cur_pos;
		numresult = $("#numresult_DocFile").val();
		order = $("#order_DocFile").val();
		//alert(processurl+'-'+page+'-'+numresult+'-'+order);
		$("#list_file_cont").load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+page);
	}
	
	function edit_me_DocFile(id){
		var doc_id = document.frmList_DocFile.doc_id.value;
		$("#list_file_cont").load("?listDocFile&mod=docs&edit_me=1&docFile_id="+id+"&doc_id="+doc_id);
	}
			
	$("#a_ref_DocFile").click( function () { 
			var id = document.frmList_DocFile.doc_id.value;
			$('#list_file_cont').hide();
			$('#list_file_cont').fadeOut('fast').load('index.php?listDocFile&mod=docs&doc_id='+id).fadeIn("fast");
		});
</script>
{/literal}