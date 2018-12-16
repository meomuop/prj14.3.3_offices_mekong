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
<div id="tnvb_lienquan_content_insign">
	<form method="post" name="frmTNVBReply_list" action="?listTNVBReply{$vars.arg}" id="frmTNVBReply_list">
    <!------------------------------------------THEM MOI------------------------------------>
    <fieldset style="width:555px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
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
            		<span id="lblError_TNVBReply" class="error">Thông báo: (*) là các mục bắt buộc!</span>
                </td>
            </tr>
            <tr height="30">
            	<td align="center" valign="top">
                	<div style="float:left; width:75px; line-height:25px; text-align:left">Văn bản gốc:</div>
                    <div style="float:left; width:465px; line-height:25px; text-align:left" title="{$doc_info.doc_desc}">
                        Ký hiệu:&nbsp;{$doc_info.doc_code};&nbsp;&nbsp;&nbsp;&nbsp;Trích yếu:&nbsp;<i>{$doc_info.doc_desc|str_string_cut:"70":"1"}</i>
                    </div>
                    <div style="float:left; width:100%; height:8px; text-align:left"><hr size="1" width="100%" style="color:#CCC" /></div>
                    <div style="float:left; width:75px; line-height:25px; text-align:left">Người ký <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:195px; line-height:25px; text-align:left">
                    	<input type="text" onfocus="hide_message_TNVBReply()" value="{$docreply_info.signPer_id}" id="signPer_id" name="signPer_id" class="text_middle" tabindex="1" onfocus="hide_message_Doc();"/>
                        {literal}
						<script type="text/javascript">
                        $().ready(function() {
							$("#signPer_id").autocomplete("B_User_auto.php", {
								width: 160,
								matchContains: true,
								selectFirst: true
							});
						});
                        </script>
                        {/literal}
                    </div>
                    <div style="float:left; width:75px; line-height:25px; text-align:left">Ngày ký <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:195px; line-height:25px; text-align:left">
                    	<input type="text" onfocus="hide_message_TNVBReply()" value="{$smarty.now|date_format:'%d/%m/%Y'}" id="docreply_signed" name="docreply_signed" class="text_time_callender" tabindex="2"/>&nbsp;<img src="../images/admin/img.gif"  align="absmiddle" id="img_docreply_signed" style="cursor: pointer; border: 0" title="Chọn ngày trên lịch"/>
                        {literal}
						<script type="text/javascript">
                            Calendar.setup({
                                inputField   :   "docreply_signed",
                                ifFormat     :   "%d/%m/%Y",
                                button       :   "img_docreply_signed",
                                align        :   "Br",  
                                timeFormat   :   "24",
                                showsTime    :   true,
                                singleClick  :   true
                            });
                        </script>
                        {/literal}
                    </div>
                    <div style="float:left; width:75px; line-height:25px; text-align:left">Loại văn bản <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:195px; line-height:25px; text-align:left">
                    	<input type="text" onfocus="hide_message_TNVBReply()" value="{$docreply_info.docCat_id}" id="docCat_id" name="docCat_id" class="text_middle" tabindex="3" onfocus="hide_message_Doc();"/>
                        {literal}
						<script type="text/javascript">
                        $().ready(function() {
                            $("#docCat_id").autocomplete("B_docCat_auto.php", {
                                width: 160,
                                matchContains: true,
								selectFirst: true
                            });
                        });
                        </script>
                        {/literal}
                    </div>
                    <div style="float:left; width:75px; line-height:25px; text-align:left">Lĩnh vực <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:195px; line-height:25px; text-align:left">
                    	<input type="text" onfocus="hide_message_TNVBReply()" value="{$docreply_info.docField_id}" id="docField_id" name="docField_id" class="text_middle" tabindex="4"/>
                        {literal}
						<script type="text/javascript">
                        $().ready(function() {
                            $("#docField_id").autocomplete("B_docField_auto.php", {
                                width: 160,
                                matchContains: true,
								selectFirst: true
                            });
                        });
                        </script>
                        {/literal}
                    </div>
                    <div style="float:left; width:75px; line-height:25px; text-align:left">Phát hành:</div>
                    <div style="float:left; width:195px; line-height:25px; text-align:left">
                    {$access_department_name}
                    <input type="hidden" value="{$access_department_name}" id="docreply_unit" name="docreply_unit"/>
                    </div>
                    <div style="float:left; width:75px; line-height:25px; text-align:left">Số ký hiệu:</div>
                    <div style="float:left; width:195px; line-height:25px; text-align:left">
                    <input type="text" onfocus="hide_message_TNVBReply()" value="{if $vars.docreply_code eq ''}Không có{else}{$docreply_info.docreply_code}{/if}" id="docreply_code" name="docreply_code" class="text_short" tabindex="5"/>
                    </div>
                    <div style="float:left; width:75px; line-height:25px; text-align:left">Trích yếu <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:465px; line-height:25px; text-align:left">
                         <textarea spellcheck="false" name="docreply_desc" id="docreply_desc" cols="30" rows="5" class="text_area_small" style="width:430px" onfocus="hide_message_TNVBReply()" tabindex="6">{$docreply_info.docreply_desc}</textarea>
                    </div>
                    <div style="float:left; width:100%; line-height:25px; text-align:left">
                    	<input type="button" name="btnSub_TNVBReply" id="btnSub_TNVBReply" value="Ghi lại" class="button" tabindex="7"/>
                        <input type="hidden" name="docreply_id" id="docreply_id" value="{$docreply_info.docreply_id}">
                        <input type="hidden" name="doc_id" id="doc_id" value="{if $doc_id neq ''}{$doc_id}{else}{$docreply_info.doc_id}{/if}">
                        <input type="reset" name="Reset" value="Hủy bỏ" class="button" tabindex="8"/>
                        &nbsp;<i>(Người gửi:&nbsp;{$access_object_name}&nbsp;{$access_user_fullname})</i>
                        {literal}
                        <script language="javascript">
                            function hide_message_TNVBReply(){
                                $('#lblMessage_TNVBReply').hide();
                                $('#lblError_TNVBReply').hide();
                            }
                            
                            $(function() {
                            $('.error').hide();
                            $('#lblMessage_TNVBReply').hide();
                             
                            $("#btnSub_TNVBReply").click(function() {
								
                                $('.error').hide();
                                 
                                var $form 			= $("#frmTNVBReply_list");
								var signPer_id 		= $form.find('input#signPer_id').val();
								var docreply_signed = $form.find('input#docreply_signed').val();
								var docCat_id 		= $form.find('input#docCat_id').val();
								var docField_id 	= $form.find('input#docField_id').val();
								var docreply_unit 	= $form.find('input#docreply_unit').val();
								var docreply_code 	= $form.find('input#docreply_code').val();
								var docreply_desc 	= $form.find('textarea#docreply_desc').val();
								var doc_id 			= $form.find('input#doc_id').val();
								var docreply_id 	= $form.find('input#docreply_id').val();
								
                                //begin validate form
                                if (signPer_id == "" || docreply_signed == "" || docCat_id == "" || docCat_id == "" || docreply_desc == ""){
                                    $('#lblError_TNVBReply').show();
                                }
                                else{
									$.post('index.php?listTNVBReply&mod=truyennhans&add_edit=1',
										{
											signPer_id:signPer_id,
											docreply_signed:docreply_signed,
											docCat_id:docCat_id,
											docField_id:docField_id,
											docreply_unit:docreply_unit,
											docreply_code:docreply_code,
											docreply_desc:docreply_desc,
											doc_id:doc_id,
											docreply_id:docreply_id,
										},
										function(data){
											$('#tnvb_lienquan_cont').html(data);
											$("#tnvb_lienquan_cont").show();
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
    <fieldset style="width:555px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:154px">
        <legend class="legend">Danh sách:</legend>
        <div style="float:left; height:5px; width:100%"></div>
    	<div style="float:left; height:25px; width:537px; border-top:1px solid #99bbe8; border-bottom:1px solid #99bbe8 ">
            <div class="tbl_tit" style="width:30px; text-align:center"><b>STT</b></div>	
            <div class="tbl_tit" style="width:70px"><B>&nbsp;Ngày tháng</B></div>
            <div class="tbl_tit" style="width:80px; text-align:left"><B>&nbsp;Số ký hiệu</B></div>
            <div class="tbl_tit" style="width:241px; text-align:left"><B>&nbsp;Trích yếu</B></div>
            <div class="tbl_tit" style="width:50px; text-align:center"><B>Tệp tin</B></div>
            <div class="tbl_tit" style="width:60px; text-align:center"><B>Chọn</B></div>
        </div>
        <div style="float:left; width:18px; height:25px">&nbsp;</div>
        <div style="float:left; height:100px; width:555px; overflow-y:scroll">
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
                	&nbsp;{$obj_list[pi]->docreply_date|date_format:"%d/%m/%Y"}
                </div>
                <div class="{$class_td}" style="width:80px; text-align:left">
                    &nbsp;{$obj_list[pi]->docreply_code|str_string_cut:"10":"1"}
                </div>
                <div class="{$class_td}" style="width:241px; text-align:left; white-space:nowrap">
                    &nbsp;{$obj_list[pi]->docreply_desc|str_string_cut:"60":"1"}
                </div>
                <div class="{$class_td}" style="width:50px; text-align:center">
                    {if $obj_list[pi]->docreply_file eq 2}
                    <a href='javascript: void(0);' onclick="show_list_tnvb_file({$obj_list[pi]->docreply_id},{$doc_info.doc_id})">
                    <img src="../images/admin/empty_icon.png" width="14" height="14" border="0"></a>
                    {else}
                    <a href='javascript: void(0);' onclick="show_list_tnvb_file({$obj_list[pi]->docreply_id},{$doc_info.doc_id})">
                    <img src="../images/admin/folder_icon.png" width="14" height="14" border="0"></a>
                    {/if}
                </div>
                <div class="{$class_td}" style="width:29px; text-align:center">
                	{if $obj_list[pi]->user_id eq $access_user_id}
                    <a href='javascript: void(0);' onclick="edit_me_TNVB_view({$obj_list[pi]->docreply_id})">
                    <img src="../images/admin/b_edit.png" width="11" height="11" border="0" title="Sửa"></a>
                    {else}-{/if}
                </div>
                <div class="{$class_td}" style="width:29px; text-align:center">
                	{if $obj_list[pi]->user_id eq $access_user_id}
                    <a href='javascript: void(0)' onClick="delItems_TNVB_view('{$processurl}', {$obj_list[pi]->docreply_id});">
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
<div id="tnvb_lienquan_clear_txt"></div>
<div id="tnvb_lienquan_tool_bar">    
    <div id="tnvb_lienquan_page_area">
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
    <div id="tnvb_lienquan_page_area">
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
		var alen=document.frmTNVBReply_list.elements.length;
		alen=(alen>5)?document.frmTNVBReply_list.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
			document.frmTNVBReply_list.chkid[i].checked=status;
		}
		else{
			document.frmTNVBReply_list.chkid.checked=status;
		}
		if(from_>0) document.frmTNVBReply_list.chkall.checked=status;
	}
		
	function docheckone_TNVB_view(){
		var alen=document.frmTNVBReply_list.elements.length;
		var isChecked=true;
		alen=(alen>4)?document.frmTNVBReply_list.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmTNVBReply_list.chkid[i].checked==false)
					isChecked=false;
		}else{
			if(document.frmTNVBReply_list.chkid.checked==false)
				isChecked=false;
		}				
		document.frmTNVBReply_list.chkall.checked=isChecked;
	}
	
	function calculatechon_TNVB_view(){			
		var strchon="";
		var alen=document.frmTNVBReply_list.elements.length;				
		alen=(alen>2)?document.frmTNVBReply_list.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmTNVBReply_list.chkid[i].checked==true)
					strchon+=document.frmTNVBReply_list.chkid[i].value+",";
		}else{
			if(document.frmTNVBReply_list.chkid.checked==true)
				strchon=document.frmTNVBReply_list.chkid.value;
		}
		document.frmTNVBReply_list.chon_TNVB_view.value=strchon;
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
				$('#tnvb_lienquan_cont').fadeOut('fast').load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+curpage).fadeIn("fast");
			}
		});
	}
	
	function show_list_tnvb_file(docreply_id,doc_id){
		$("#reply_file").css({'display':'block','z-index':'2010','border':'1px solid #F00'});
		$("#reply_file_cont").load("?listTNVBFile&mod=truyennhans&docreply_id="+docreply_id+'&doc_id='+doc_id);
		//document.getElementById("tnvb_lienquan").onclick = true;
	}
	
	function reloadPage_TNVB_view(processurl){
		var numresult_TNVB_view,order_TNVB_view,cur_pos;
		numresult = $("#numresult_TNVB_view").val();
		order = $("#order_TNVB_view").val();
		cur_pos = 0;
		$("#tnvb_lienquan_cont").load(processurl+"&numresult="+numresult+"&order="+order+"&cur_pos="+cur_pos);
	}
	
	function gotoPage_TNVB_view(processurl,page){
		var numresult_TNVB_view,order_TNVB_view,cur_pos;
		numresult = $("#numresult_TNVB_view").val();
		order = $("#order_TNVB_view").val();
		//alert(processurl+'-'+page+'-'+numresult+'-'+order);
		$("#tnvb_lienquan_cont").load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+page);
	}
	
	function edit_me_TNVB_view(id){
		var doc_id = document.frmTNVBReply_list.doc_id.value;
		$("#tnvb_lienquan_cont").load("?listTNVBReply&mod=truyennhans&edit_me=1&docreply_id="+id+"&doc_id="+doc_id);
	}
			
	$("#a_ref_TNVB_view").click( function () { 
			var id = document.frmTNVBReply_list.doc_id.value;
			$('#tnvb_lienquan_cont').hide();
			$('#tnvb_lienquan_cont').fadeOut('fast').load('index.php?listTNVBReply&mod=truyennhans&doc_id='+id).fadeIn("fast");
		});
</script>
{/literal}