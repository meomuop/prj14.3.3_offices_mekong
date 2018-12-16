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
	<form method="post" name="frmList_CVFile" action="?CVFile{$vars.arg}" id="frmList_CVFile">
    <!------------------------------------------THEM MOI------------------------------------>
    <fieldset style="width:248px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
        <legend class="legend">Thêm/Chỉnh sửa</legend>
        
    	<table width="98%" cellspacing="0" cellpadding="0" border="0" style="margin-left:5px">
            <tr height="20">
                <td colspan="2"> 
                	{if $error or $complete}
                	<span class="msg">Thông báo: <font color="#FF0000">{$error}</font>{$complete}</span>{/if}
            		<span id="lblError_CVFile" class="error">Thông báo: (*) là các mục bắt buộc!</span>
                </td>
            </tr>
            <tr><td colspan="2" style="line-height: 20px">Mục: <span title="{$obj_cvcat_info.cv_cat_name}">{$obj_cvcat_info.cv_cat_name|str_string_cut:"45":"1"}</span></td></tr>
            <tr height="30">
            	<td align="center" valign="top">
                	<div style="float:left; width:30%; line-height:25px; text-align:left">Tên tệp tin <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left">
                        <input type="text" id="cv_file_name" name="cv_file_name" class="text_short" value="{$obj_info.cv_file_name}" onfocus="hide_message_CVFile();"/>
                    </div>
                    <div style="float:left; width:30%; line-height:25px; text-align:left">Đường dẫn <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left">
                    	<input type="text" class="text_short" name="cv_file_path" id="cv_file_path" value="{$obj_info.cv_file_path}" onfocus="hide_message_CVFile();">&nbsp;<a href="javascript:void(0)" onclick="javascript:window.open('upload_cv.php','new_page','width=410,height=225')" >[ Tải lên ]</a>
                    </div>
                    <div style="float:left; width:100%; line-height:25px; text-align:left">
                    	<input type="button" name="btnSub_CVFile" id="btnSub_CVFile" value="Ghi lại" class="button" tabindex="14"/>
                        <input type="hidden" name="cv_file_id" id="cv_file_id" value="{$obj_info.cv_file_id}">
                        <input type="hidden" name="cv_cat_id" id="cv_cat_id" value="{$obj_cvcat_info.cv_cat_id}">
                        <input type="hidden" name="user_id" id="user_id" value="{$obj_info.user_id}">
                        <input type="reset" name="Reset" value="Hủy bỏ" class="button" tabindex="15"/>
                        {literal}
                        <script language="javascript">
                            function hide_message_CVFile(){
                                $('#lblMessage_CVFile').hide();
                                $('#lblError_CVFile').hide();
                            }
                            
                            $(function() {
                            $('.error').hide();
                            $('#lblMessage_CVFile').hide();
                             
                            $("#btnSub_CVFile").click(function() {
								
                                $('.error').hide();
                                 
                                var $form 			= $("#frmList_CVFile");
								var cv_file_name 	= $form.find('input#cv_file_name').val();
								var cv_file_path 	= $form.find('input#cv_file_path').val();
								var cv_file_id 		= $form.find('input#cv_file_id').val();
                                var cv_cat_id 		= $form.find('input#cv_cat_id').val();
								
                                //begin validate form
                                if (cv_file_name == "" || cv_file_path == "" || cv_cat_id == ""){
                                    $('#lblError_CVFile').show();
                                }
                                else{
									$.post('index.php?listCVFile&mod=congviecs&add_edit=1',
										{
											cv_file_name:cv_file_name,
											cv_file_path:cv_file_path,
                                            cv_cat_id:cv_cat_id,
											cv_file_id:cv_file_id
										},
										function(data){
											$('#dl_file_cont').html(data);
											$("#dl_file_cont").show();

                                            $("#cv_cat_content_main").load("?listCvCat&mod=congviecs&show_luong=1&file_status=1&cv_cat_id="+cv_cat_id);
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
                <div class="{$class_td}" style="width:110px; white-space:nowrap" title="{$obj_list[pi]->cv_file_name}">
                	{if $obj_list[pi]->user_id eq $access_user_id}
                    &nbsp;<a href='javascript: void(0);' onclick="edit_me_CVFile({$obj_list[pi]->cv_file_id},{$kdl_id},{$kdl_type})">{$obj_list[pi]->cv_file_name|str_string_cut:"25":"1"}</a>
                    {else}{$obj_list[pi]->cv_file_name}{/if}
                </div>
                <div class="{$class_td}" style="width:30px; text-align:center">
                    <a href='{$obj_list[pi]->cv_file_path}' target="new">
                    <img src="../images/admin/download_icon.png" width="16" height="16" border="0" title="Tải về"></a>
                </div>
                <div class="{$class_td}" style="width:29px; text-align:center">
                	{if $obj_list[pi]->user_id eq $access_user_id}
                    <a href='javascript: void(0);' onclick="edit_me_CVFile({$obj_list[pi]->cv_file_id},{$kdl_id},{$kdl_type})">
                    <img src="../images/admin/b_edit.png" width="11" height="11" border="0" title="Sửa"></a>
                    {else}-{/if}
                </div>
                <div class="{$class_td}" style="width:29px; text-align:center">
                	{if $obj_list[pi]->user_id eq $access_user_id}
                    <a href='javascript: void(0)' onClick="delItems_CVFile('{$processurl}', {$obj_list[pi]->cv_file_id},{$kdl_id},{$kdl_type});">
                    <img src="../images/admin/b_drop.png" width="11" height="11" border="0" title="Xóa"></a>
                    {else}-{/if}
                </div>
            </div>
            {/section}
        </div>
        <input type="hidden" id="curpage_CVFile" name="curpage" value="{$vars.curpage}" />
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
    <a href="javascript: void(0)" id="first_page" onclick="gotoPage_CVFile('{$processurl}',parseInt(1));" title="Trang đầu">
    	<img src="{$css_path}icon_first_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="pre_page" onclick="gotoPage_CVFile('{$processurl}',parseInt(document.getElementById('page_CVFile').value)-parseInt(1));" title="Trang trước">
    	<img src="{$css_path}icon_pre_page.png" class="img_all">
    </a>
    {/if}
    </div>
    <div style="float:left; line-height:19px">
        <div style="float:left; width:35px">Trang</div> 
        <div style="float:left; width:35px">
        <input type="text" value="{$vars.curpage}" name="page" id="page_CVFile" onblur=" gotoPage_CVFile('{$processurl}',this.value);" style="width:30px; font-size:12px; height:15px; border:1px solid #99bbe8">
        </div>
        <div style="float:left; width:22px"> / {$num_page}</div>
    </div>
    <div id="file_page_area">
    {if $vars.curpage eq $num_page}
    	<img src="{$css_path}icon_next_page.png" class="img_all">
        <img src="{$css_path}icon_last_page.png" class="img_all">
    {else}
    <a href="javascript: void(0)" id="next_page" onclick="gotoPage_CVFile('{$processurl}',parseInt(document.getElementById('page_CVFile').value)+parseInt(1));" title="Trang tiếp">
    	<img src="{$css_path}icon_next_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="last_page" onclick="gotoPage_CVFile('{$processurl}',parseInt({$num_page}));" title="Trang cuối">
    	<img src="{$css_path}icon_last_page.png" class="img_all">
    </a>
    {/if}
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_dl.png)">&nbsp;</div>
    <div style="float:left; width:15px">
    <a href="javascript: void(0)" id="a_ref_CVFile" title="Tải lại"><img src="{$css_path}icon_refresh.png" class="img_all"></a>
    </div>    
</div>
{literal}
<script language="javascript">		
	function docheck_CVFile(status,from_){
		var alen=document.frmList_CVFile.elements.length;
		alen=(alen>5)?document.frmList_CVFile.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
			document.frmList_CVFile.chkid[i].checked=status;
		}
		else{
			document.frmList_CVFile.chkid.checked=status;
		}
		if(from_>0) document.frmList_CVFile.chkall.checked=status;
	}
		
	function docheckone_CVFile(){
		var alen=document.frmList_CVFile.elements.length;
		var isChecked=true;
		alen=(alen>4)?document.frmList_CVFile.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_CVFile.chkid[i].checked==false)
					isChecked=false;
		}else{
			if(document.frmList_CVFile.chkid.checked==false)
				isChecked=false;
		}				
		document.frmList_CVFile.chkall.checked=isChecked;
	}
	
	function calculatechon_CVFile(){			
		var strchon="";
		var alen=document.frmList_CVFile.elements.length;				
		alen=(alen>2)?document.frmList_CVFile.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_CVFile.chkid[i].checked==true)
					strchon+=document.frmList_CVFile.chkid[i].value+",";
		}else{
			if(document.frmList_CVFile.chkid.checked==true)
				strchon=document.frmList_CVFile.chkid.value;
		}
		document.frmList_CVFile.chon_CVFile.value=strchon;
	}
	
	function delItems_CVFile(processurl,delStr){
		if (delStr == undefined){
			calculatechon_CVFile();
			delStr = document.getElementById("chon_CVFile").value;
		}
		if (delStr == ""){
			return false;
		}
		if(!confirm("THÔNG BÁO: \n\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
			return false;
		}	
		
		var numresult_CVFile,order_CVFile,curpage_CVFile;
		numresult = $("#numresult_CVFile").val();
		order = $("#order_CVFile").val();
		curpage = $("#curpage_CVFile").val();
		
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
	
	function reloadPage_CVFile(processurl){
		var numresult_CVFile,order_CVFile,cur_pos;
		numresult = $("#numresult_CVFile").val();
		order = $("#order_CVFile").val();
		cur_pos = 0;
		$("#dl_file_cont").load(processurl+"&numresult="+numresult+"&order="+order+"&cur_pos="+cur_pos);
	}
	
	function gotoPage_CVFile(processurl,page){
		var numresult_CVFile,order_CVFile,cur_pos;
		numresult = $("#numresult_CVFile").val();
		order = $("#order_CVFile").val();
		//alert(processurl+'-'+page+'-'+numresult+'-'+order);
		$("#dl_file_cont").load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+page);
	}
	
	function edit_me_CVFile(id,kdl_id,kdl_type){
		var dl_id = document.frmList_CVFile.dl_id.value;
		$("#dl_file_cont").load("?listCVFile&mod=congviecs&edit_me=1&cv_file_id="+id+"&dl_id="+dl_id+"&kdl_id="+kdl_id+"&kdl_type="+kdl_type);
	}
			
	$("#a_ref_CVFile").click( function () { 
			var id = document.frmList_CVFile.dl_id.value;
			$('#dl_file_cont').hide();
			$('#dl_file_cont').fadeOut('fast').load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+curpage).fadeIn("fast");
		});
</script>
{/literal}