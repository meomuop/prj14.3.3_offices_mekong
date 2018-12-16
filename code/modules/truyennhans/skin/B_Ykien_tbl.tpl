{literal}
<style type="text/css">
.error { color:#FF0000;font-weight:bold; margin-left:5px; height:20px; line-height:20px}
.msg{ color:#00F; font-weight:bold; margin-left:5px; height:20px; line-height:20px}
.tbl_tit_view{
float:left; line-height:20px; border-right:1px solid #99bbe8; 	
}
.text_all{
	font-size:12px; line-height:20px; text-align:left; padding:0 5px 0 5px
}
.tbl_cont_view{
float:left; line-height:20px; border-right:1px solid #99bbe8; border-bottom:1px solid #99bbe8; background:#F2FFEC
}
.tbl_cont_view2{
float:left; line-height:20px; border-right:1px solid #99bbe8; border-bottom:1px solid #99bbe8; background:#FFF
}
</style>
{/literal}
<div id="tnvb_ykien_content_insign">
	<form method="post" name="frmYkien_list" action="?listYkien{$vars.arg}" id="frmYkien_list">
    <!------------------------------------------THEM MOI------------------------------------>
    <fieldset style="width:523px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
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
            		<span id="lblError_Ykien" class="error">Thông báo: (*) là các mục bắt buộc!</span>
                </td>
            </tr>
            <tr height="30">
            	<td align="center" valign="top">
                	<div style="float:left; width:75px; line-height:25px; text-align:left">Văn bản gốc:</div>
                    <div style="float:left; width:425px; line-height:25px; text-align:left" title="{$doc_info.doc_desc}">
                        Ký hiệu:&nbsp;{$doc_info.doc_code};&nbsp;&nbsp;&nbsp;&nbsp;Trích yếu:&nbsp;<i>{$doc_info.doc_desc|str_string_cut:"60":"1"}</i>
                    </div>
                    <div style="float:left; width:100%; height:8px; text-align:left"><hr size="1" width="100%" style="color:#CCC" /></div>
                    <div style="float:left; width:75px; line-height:25px; text-align:left">Ý kiến <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:425px; line-height:25px; text-align:left">
                         <textarea spellcheck="false" name="feedback_cont" id="feedback_cont" cols="30" rows="5" class="text_area_small" style="width:430px" onfocus="hide_message_Ykien()" tabindex="6">{$feedback_info.feedback_cont}</textarea>
                    </div>
                    <div style="float:left; width:100%; line-height:25px; text-align:left">
                    	<input type="button" name="btnSub_Ykien" id="btnSub_Ykien" value="Ghi lại" class="button" tabindex="7"/>
                        <input type="hidden" name="feedback_id" id="feedback_id" value="{$feedback_info.feedback_id}">
                        <input type="hidden" name="doc_id" id="doc_id" value="{if $doc_id neq ''}{$doc_id}{else}{$feedback_info.doc_id}{/if}">
                        <input type="reset" name="Reset" value="Hủy bỏ" class="button" tabindex="8"/>
                        &nbsp;<i>(Người gửi:&nbsp;{$access_object_name}&nbsp;{$access_user_fullname})</i>
                        {literal}
                        <script language="javascript">
                            function hide_message_Ykien(){
                                $('#lblMessage_Ykien').hide();
                                $('#lblError_Ykien').hide();
                            }
                            
                            $(function() {
                            $('.error').hide();
                            $('#lblMessage_Ykien').hide();
                             
                            $("#btnSub_Ykien").click(function() {
								
                                $('.error').hide();
                                 
                                var $form 			= $("#frmYkien_list");
								var feedback_cont 	= $form.find('textarea#feedback_cont').val();
								var doc_id 			= $form.find('input#doc_id').val();
								var feedback_id 	= $form.find('input#feedback_id').val();
								
                                //begin validate form
                                if (feedback_cont == ""){
                                    $('#lblError_Ykien').show();
                                }
                                else{
									$.post('index.php?listYkien&mod=truyennhans&add_edit=1',
										{
											feedback_cont:feedback_cont,
											doc_id:doc_id,
											feedback_id:feedback_id,
										},
										function(data){
											$('#tnvb_ykien_cont').html(data);
											$("#tnvb_ykien_cont").show();
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
    <!------------------------------------------DANH SACH------------------------------------>
    <fieldset style="width:523px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:154px">
        <legend class="legend">Danh sách:</legend>
        <div style="float:left; height:5px; width:100%"></div>
    	<div style="float:left; height:25px; width:505px; border-top:1px solid #99bbe8; border-bottom:1px solid #99bbe8 ">
            <div class="tbl_tit" style="width:30px; text-align:center"><b>STT</b></div>	
            <div class="tbl_tit" style="width:70px"><B>&nbsp;Ngày tháng</B></div>
            <div class="tbl_tit" style="width:339px; text-align:left"><B>&nbsp;Nội dung</B></div>
            <div class="tbl_tit" style="width:60px; text-align:center"><B>Chọn</B></div>
        </div>
        <div style="float:left; width:18px; height:25px">&nbsp;</div>
        <div style="float:left; height:100px; width:523px; overflow-y:scroll">
            {section name=pi loop=$obj_list}
            {if $smarty.section.pi.index is not div by 2} 
            {assign var="class_td" value="tbl_cont"} 
            {else}
            {assign var="class_td" value="tbl_cont2"} 
            {/if}
            {math x=$vars.curpage-1 y=$vars.numresult z=$smarty.section.pi.index t=1 equation="x*y+z+t" assign=stt}
            <div style="float:left">
                <div class="{$class_td}" style="width:30px; text-align:center">{$stt}</div>
                <div class="{$class_td}" style="width:70px; white-space:nowrap">
                	&nbsp;{$obj_list[pi]->feedback_date|date_format:"%d/%m/%Y"}
                </div>
                <div class="{$class_td}" style="width:339px; text-align:left">
                    &nbsp;{$obj_list[pi]->feedback_cont|str_string_cut:"100":"1"}
                </div>
                <div class="{$class_td}" style="width:29px; text-align:center">
                	{if $obj_list[pi]->user_id eq $access_user_id}
                    <a href='javascript: void(0);' onclick="edit_me_TNVB_view({$obj_list[pi]->feedback_id})">
                    <img src="../images/admin/b_edit.png" width="11" height="11" border="0" title="Sửa"></a>
                    {else}-{/if}
                </div>
                <div class="{$class_td}" style="width:29px; text-align:center">
                	{if $obj_list[pi]->user_id eq $access_user_id}
                    <a href='javascript: void(0)' onClick="delItems_TNVB_view('{$processurl}', {$obj_list[pi]->feedback_id});">
                    <img src="../images/admin/b_drop.png" width="11" height="11" border="0" title="Xóa"></a>
                    {else}-{/if}
                </div>
            </div>
            {/section}
        </div>
    </fieldset>
    </form>
</div>
<!------------------------------------------------- Tool bar --------------------------------------------->
<div id="tnvb_ykien_clear_txt"></div>
<div id="tnvb_ykien_tool_bar">    
    <div id="tnvb_ykien_page_area">
    {if $vars.curpage eq 1}
    	<img src="{$css_path}icon_first_page.png" class="img_all">
    	<img src="{$css_path}icon_pre_page.png" class="img_all">
    {else}
    <a href="javascript: void(0)" id="first_page" onclick="gotoPage_TNVB_view('{$processurl}',parseInt(1));" title="Trang đầu">
    	<img src="{$css_path}icon_first_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="pre_page" onclick="gotoPage_TNVB_view('{$processurl}',parseInt(document.getElementById('page_TNVB_view').value)-parseInt(1));" title="Trang trước">
    	<img src="{$css_path}icon_pre_page.png" class="img_all">
    </a>
    {/if}
    </div>
    <div style="float:left; line-height:19px">
        <div style="float:left; width:35px">Trang</div> 
        <div style="float:left; width:35px">
        <input type="text" value="{$vars.curpage}" name="page" id="page_TNVB_view" onblur=" gotoPage_TNVB_view('{$processurl}',this.value);" style="width:30px; font-size:12px; height:15px; border:1px solid #99bbe8">
        </div>
        <div style="float:left; width:22px"> / {$num_page}</div>
    </div>
    <div id="tnvb_ykien_page_area">
    {if $vars.curpage eq $num_page}
    	<img src="{$css_path}icon_next_page.png" class="img_all">
        <img src="{$css_path}icon_last_page.png" class="img_all">
    {else}
    <a href="javascript: void(0)" id="next_page" onclick="gotoPage_TNVB_view('{$processurl}',parseInt(document.getElementById('page_TNVB_view').value)+parseInt(1));" title="Trang tiếp">
    	<img src="{$css_path}icon_next_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="last_page" onclick="gotoPage_TNVB_view('{$processurl}',parseInt({$num_page}));" title="Trang cuối">
    	<img src="{$css_path}icon_last_page.png" class="img_all">
    </a>
    {/if}
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:left; width:15px">
    <a href="javascript: void(0)" id="a_ref_TNVB_view" title="Tải lại"><img src="{$css_path}icon_refresh.png" class="img_all"></a>
    </div>    
</div>
{literal}
<script language="javascript">		
	function docheck_TNVB_view(status,from_){
		var alen=document.frmYkien_list.elements.length;
		alen=(alen>5)?document.frmYkien_list.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
			document.frmYkien_list.chkid[i].checked=status;
		}
		else{
			document.frmYkien_list.chkid.checked=status;
		}
		if(from_>0) document.frmYkien_list.chkall.checked=status;
	}
		
	function docheckone_TNVB_view(){
		var alen=document.frmYkien_list.elements.length;
		var isChecked=true;
		alen=(alen>4)?document.frmYkien_list.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmYkien_list.chkid[i].checked==false)
					isChecked=false;
		}else{
			if(document.frmYkien_list.chkid.checked==false)
				isChecked=false;
		}				
		document.frmYkien_list.chkall.checked=isChecked;
	}
	
	function calculatechon_TNVB_view(){			
		var strchon="";
		var alen=document.frmYkien_list.elements.length;				
		alen=(alen>2)?document.frmYkien_list.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmYkien_list.chkid[i].checked==true)
					strchon+=document.frmYkien_list.chkid[i].value+",";
		}else{
			if(document.frmYkien_list.chkid.checked==true)
				strchon=document.frmYkien_list.chkid.value;
		}
		document.frmYkien_list.chon_TNVB_view.value=strchon;
	}
	
	function delItems_TNVB_view(processurl,delStr){
		if (delStr == undefined){
			calculatechon_TNVB_view();
			delStr = document.getElementById("chon_TNVB_view").value;
		}
		if (delStr == ""){
			return false;
		}
		if(!confirm("THÔNG BÁO: \n\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
			return false;
		}	
		
		var numresult_TNVB_view,order_TNVB_view,curpage_TNVB_view;
		numresult = $("#numresult_TNVB_view").val();
		order = $("#order_TNVB_view").val();
		curpage = $("#curpage_TNVB_view").val();
		
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
				$('#tnvb_ykien_cont').fadeOut('fast').load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+curpage).fadeIn("fast");
			}
		});
	}
	
	function show_list_tnvb_file(feedback_id,doc_id){
		$("#reply_file").css({'display':'block','z-index':'2010'});
		$("#reply_file_cont").load("?listTNVBFile&mod=truyennhans&feedback_id="+feedback_id+'&doc_id='+doc_id);
	}
	
	function reloadPage_TNVB_view(processurl){
		var numresult_TNVB_view,order_TNVB_view,cur_pos;
		numresult = $("#numresult_TNVB_view").val();
		order = $("#order_TNVB_view").val();
		cur_pos = 0;
		$("#tnvb_ykien_cont").load(processurl+"&numresult="+numresult+"&order="+order+"&cur_pos="+cur_pos);
	}
	
	function gotoPage_TNVB_view(processurl,page){
		var numresult_TNVB_view,order_TNVB_view,cur_pos;
		numresult = $("#numresult_TNVB_view").val();
		order = $("#order_TNVB_view").val();
		//alert(processurl+'-'+page+'-'+numresult+'-'+order);
		$("#tnvb_ykien_cont").load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+page);
	}
	
	function edit_me_TNVB_view(id){
		var doc_id = document.frmYkien_list.doc_id.value;
		$("#tnvb_ykien_cont").load("?listYkien&mod=truyennhans&edit_me=1&feedback_id="+id+"&doc_id="+doc_id);
	}
			
	$("#a_ref_TNVB_view").click( function () { 
			var id = document.frmYkien_list.doc_id.value;
			$('#tnvb_ykien_cont').hide();
			$('#tnvb_ykien_cont').fadeOut('fast').load('index.php?listYkien&mod=truyennhans&doc_id='+id).fadeIn("fast");
		});
</script>
{/literal}