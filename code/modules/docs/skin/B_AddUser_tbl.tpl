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
<div id="phoihop_content_insign">
	<form method="post" name="frmList_AddUser" action="?listAddUser{$vars.arg}" id="frmList_AddUser">
    <!------------------------------------------THEM MOI------------------------------------>
    <fieldset style="width:523px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
        <legend class="legend_list">Chỉ đạo: <font color="#FF0000">Số ký hiệu văn bản: {$doc_code} - Số đến: {$doc_num}</font></legend>
    	<table width="98%" cellspacing="0" cellpadding="0" border="0" style="margin-left:5px">
            <tr height="20">
                <td colspan="2"> 
                	{if $error or $complete}
                	<span class="msg">Thông báo: <font color="#FF0000">{$error}</font>{$complete}</span>{/if}
            		<span id="lblError_listAddUser" class="error">Thông báo: (*) là các mục bắt buộc!</span>
                </td>
            </tr>
            <tr height="30">
            	<td align="center" valign="top">
                	<div style="float:left; width:518px; height:105px">
                        <div style="float:left; width:90px; line-height:25px; text-align:left">Chỉ đạo vắn tắt <font color="#FF0000">*</font>:</div>
                        <div style="float:left; width:420px; line-height:25px; text-align:left">
                            <input type="text" class="text_long" name="addUser_desc" id="addUser_desc" value="{$obj_doc->addUser_desc}" tabindex="71"/>
                        </div>                            
                        <div style="float:left; width:90px; line-height:25px; text-align:left">Người nhận <font color="#FF0000">*</font>:</div>
                        <div style="float:left; width:420px; line-height:25px; height:75px; text-align:left; overflow-y:scroll; border:1px solid #99bbe8">
                            {section name=ui loop=$obj_list_user}
                            <div style="float:left; width:196px; margin:2px">
                            <input type="checkbox" name="user_id" value="{$obj_list_user[ui]->user_id}" {if $obj_list_user[ui]->user_id eq $vars.user_id}checked{/if}>
                            -&nbsp;{$obj_list_user[ui]->user_fullname}
                                {section name=qi loop=$obj_list_object}
                                {if $obj_list_object[qi]->object_id eq $obj_list_user[ui]->object_id}
                                &nbsp;|&nbsp;{$obj_list_object[qi]->object_name}
                                {/if}
                                {/section}
                            </div>
                            {/section}
                        </div>
                    </div>
                    <input type="hidden" name="ph_user_str" id="ph_user_str" value="">
                    <!--------------------------------------------------------------------------------------->
                    
                    <div style="float:left; width:518px;">
                    	<div style="float:left; width:90px; line-height:25px; text-align:left">&nbsp;</div>
                        <div style="float:left; width:290px; line-height:25px; text-align:left">
                        	<input type="button" name="btnSub_AddUser" id="btnSub_AddUser" value="Ghi lại" class="button" tabindex="55"/>
                            <input type="hidden" name="doc_id" id="doc_id" value="{if $doc_id neq ''}{$doc_id}{else}{$obj_doc->doc_id}{/if}">
                            <input type="hidden" name="arg" id="arg" value="{$vars.arg}">
                            <input type="hidden" name="addUser_date" id="addUser_date" value="{if $obj_doc->addUser_date neq '' and $obj_doc->addUser_date neq '1970-01-01'}{$obj_doc->addUser_date|date_format:'%d/%m/%Y'}{else}{$smarty.now|date_format:'%d/%m/%Y'}{/if}" readonly tabindex="52"/>
                            <input type="reset" name="Reset" value="Hủy bỏ" class="button" tabindex="56"/> <i>(Ngày: {if $obj_doc->addUser_date neq '' and $obj_doc->addUser_date neq '1970-01-01'}{$obj_doc->addUser_date|date_format:'%d/%m/%Y'}{else}{$smarty.now|date_format:'%d/%m/%Y'}{/if})</i>
                            {literal}
                            <script language="javascript">
                                function hide_message_AddUser(){
                                    $('#lblMessage_AddUser').hide();
                                    $('#lblError_AddUser').hide();
                                }
                                
                                $(function() {
                                $('.error').hide();
                                $('#lblMessage_AddUser').hide();
                                 
                                $("#btnSub_AddUser").click(function() {
									
                                    $('.error').hide();
									
									// --------tao chuoi id cho p/b phoi hop cua phan chuyen lanh dao
									if (typeof document.frmList_AddUser.user_id !== "undefined") {
										var ph_user_str="";
										var de_arr=document.frmList_AddUser.elements.length;	
										de_arr=(de_arr>2)?document.frmList_AddUser.user_id.length:0;
										if (de_arr>0){
											for(var i=0;i<de_arr;i++)
												if(document.frmList_AddUser.user_id[i].checked==true)
													ph_user_str+=document.frmList_AddUser.user_id[i].value+",";
										}else{
											if(document.frmList_AddUser.user_id.checked==true)
												ph_user_str=document.frmList_AddUser.user_id.value;
										}
										document.frmList_AddUser.ph_user_str.value=ph_user_str;
									}
									
                                    // -----------------lay du lieu tu cac phan tu form
                                    var $form = $("#frmList_AddUser");
                                    var addUser_desc 	= $form.find('input#addUser_desc').val();
									var user_id 		= $form.find('input#ph_user_str').val();
									var doc_id 			= $form.find('input#doc_id').val();
									var arg 			= $form.find('input#arg').val();
									
                                    //begin validate form
                                    if (addUser_desc == "" || user_id == 0){
                                        $('#lblError_AddUser').show();
                                    }
                                    else{
                                        $.post('index.php?listAddUser&mod=docs&add_edit=1',
                                            {
                                                addUser_desc:addUser_desc,
                                                doc_id:doc_id,
												user_id:user_id,
                                            },
                                            function(data){
                                                $('#list_phoihop_cont').html(data);
                                                $("#list_phoihop_cont").show();
												
												$('#doc_content_main').hide();
												$('#doc_content_main').fadeOut('fast').load('index.php?phoihopDoc&arg='+arg).fadeIn("fast");
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
                        <!--------------------------------------------------------------------------------->
                    </div>
                </td>
            </tr>
        </table>
    </fieldset>
    <!------------------------------------DANH SACH---------------------------------------------->
    <fieldset style="width:523px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:107px">
        <legend class="legend">
        	<div style="width:130px; float:left">Danh sách: {$total_num_result}</div>
        </legend>
    	<div style="float:left; height:5px; width:100%"></div>
        <div style="float:left; height:25px; width:505px; border-top:1px solid #99bbe8; border-bottom:1px solid #99bbe8 ">
            <div class="tbl_tit" style="width:30px; text-align:center"><b>STT</b></div>	
            <div class="tbl_tit" style="width:70px"><B>&nbsp;Ngày</B></div>
            <div class="tbl_tit" style="width:371px"><B>&nbsp;Nội dung</B></div>
            <div class="tbl_tit" style="width:30px; text-align:center"><B>Chọn</B></div>
        </div>
        <div style="float:left; width:18px; height:25px">&nbsp;</div>
        <div style="float:left; height:50px; width:523px; overflow-y:scroll">
            {section name=pi loop=$obj_list}
            {if $smarty.section.pi.index is not div by 2} 
            {assign var="class_td" value="tbl_cont"} 
            {else}
            {assign var="class_td" value="tbl_cont2"} 
            {/if}
            {math x=$vars.curpage-1 y=$vars.numresult z=$smarty.section.pi.index t=1 equation="x*y+z+t" assign=stt}
            <div class="{$class_td}" style="width:30px; text-align:center">{$stt}</div>
            <div class="{$class_td}" style="width:70px; white-space:nowrap">
            	{$obj_list[pi]->addUser_date|date_format:"%d-%m-%Y"}
            </div>
            {php}
                $sql = "select user_fullname from tbl_users where user_id in(".$this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->user_id.")";
                $result = mysql_query($sql) or die($mysql_error());
            {/php}
            <div class="{$class_td}" style="width:371px; white-space:nowrap" title="Chuyển phối hợp tới: &#13;{php}if($result): while($row=mysql_fetch_array($result)){echo ' - '.$row['user_fullname'].'&#13;';}endif;{/php}">
            	{$obj_list[pi]->addUser_desc|str_string_cut:"60":"1"}
            </div>
            <div class="{$class_td}" style="width:30px; text-align:center">
            	{if $access_user_id eq $obj_list[pi]->user_sent}
                <a href='javascript: void(0)' onClick="delItems_AddUser('{$processurl}', {$obj_list[pi]->addUser_id});">
                <img src="../images/admin/b_drop.png" width="11" height="11" border="0" title="Xóa"></a>
                {else}-{/if}
            </div>
            {/section}
        </div>
        <input type="hidden" id="curpage_AddUser" name="curpage" value="{$vars.curpage}" />
    </fieldset>
    </form>
</div>
<!------------------------------------------------- Tool bar --------------------------------------------->
<div id="phoihop_clear_txt"></div>
<div id="phoihop_tool_bar">    
    <div id="phoihop_page_area">
    {if $vars.curpage eq 1}
    	<img src="{$css_path}icon_first_page.png" class="img_all">
    	<img src="{$css_path}icon_pre_page.png" class="img_all">
    {else}
    <a href="javascript: void(0)" id="first_page" onclick="gotoPage_AddUser('{$processurl}',parseInt(1));" title="Trang đầu">
    	<img src="{$css_path}icon_first_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="pre_page" onclick="gotoPage_AddUser('{$processurl}',parseInt(document.getElementById('page_AddUser').value)-parseInt(1));" title="Trang trước">
    	<img src="{$css_path}icon_pre_page.png" class="img_all">
    </a>
    {/if}
    </div>
    <div style="float:left; line-height:19px">
        <div style="float:left; width:35px">Trang</div> 
        <div style="float:left; width:35px">
        <input type="text" value="{$vars.curpage}" name="page" id="page_AddUser" onblur=" gotoPage_AddUser('{$processurl}',this.value);" style="width:30px; font-size:12px; height:15px; border:1px solid #99bbe8">
        </div>
        <div style="float:left; width:22px"> / {$num_page}</div>
    </div>
    <div id="phoihop_page_area">
    {if $vars.curpage eq $num_page}
    	<img src="{$css_path}icon_next_page.png" class="img_all">
        <img src="{$css_path}icon_last_page.png" class="img_all">
    {else}
    <a href="javascript: void(0)" id="next_page" onclick="gotoPage_AddUser('{$processurl}',parseInt(document.getElementById('page_AddUser').value)+parseInt(1));" title="Trang tiếp">
    	<img src="{$css_path}icon_next_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="last_page" onclick="gotoPage_AddUser('{$processurl}',parseInt({$num_page}));" title="Trang cuối">
    	<img src="{$css_path}icon_last_page.png" class="img_all">
    </a>
    {/if}
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:left; width:15px">
    <a href="javascript: void(0)" id="a_ref_AddUser" title="Tải lại"><img src="{$css_path}icon_refresh.png" class="img_all"></a>
    </div>    
</div>
{literal}
<script language="javascript">		
	function docheck_AddUser(status,from_){
		var alen=document.frmList_AddUser.elements.length;
		alen=(alen>5)?document.frmList_AddUser.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
			document.frmList_AddUser.chkid[i].checked=status;
		}
		else{
			document.frmList_AddUser.chkid.checked=status;
		}
		if(from_>0) document.frmList_AddUser.chkall.checked=status;
	}
		
	function docheckone_AddUser(){
		var alen=document.frmList_AddUser.elements.length;
		var isChecked=true;
		alen=(alen>4)?document.frmList_AddUser.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_AddUser.chkid[i].checked==false)
					isChecked=false;
		}else{
			if(document.frmList_AddUser.chkid.checked==false)
				isChecked=false;
		}				
		document.frmList_AddUser.chkall.checked=isChecked;
	}
	
	function calculatechon_AddUser(){			
		var strchon="";
		var alen=document.frmList_AddUser.elements.length;				
		alen=(alen>2)?document.frmList_AddUser.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_AddUser.chkid[i].checked==true)
					strchon+=document.frmList_AddUser.chkid[i].value+",";
		}else{
			if(document.frmList_AddUser.chkid.checked==true)
				strchon=document.frmList_AddUser.chkid.value;
		}
		document.frmList_AddUser.chon_AddUser.value=strchon;
	}
	
	function delItems_AddUser(processurl,delStr){
		if (delStr == undefined){
			calculatechon_AddUser();
			delStr = document.getElementById("chon_AddUser").value;
		}
		if (delStr == ""){
			return false;
		}
		if(!confirm("THÔNG BÁO: \n\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
			return false;
		}	
		
		var numresult_AddUser,order_AddUser,curpage_AddUser;
		numresult = $("#numresult_AddUser").val();
		order = $("#order_AddUser").val();
		curpage = $("#curpage_AddUser").val();
		
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
				$('#list_phoihop_cont').fadeOut('fast').load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+curpage).fadeIn("fast");
			}
		});
	}
	
	function reloadPage_AddUser(processurl){
		var numresult_AddUser,order_AddUser,cur_pos;
		numresult = $("#numresult_AddUser").val();
		order = $("#order_AddUser").val();
		cur_pos = 0;
		$("#list_phoihop_cont").load(processurl+"&numresult="+numresult+"&order="+order+"&cur_pos="+cur_pos);
	}
	
	function gotoPage_AddUser(processurl,page){
		var numresult_AddUser,order_AddUser,cur_pos;
		numresult = $("#numresult_AddUser").val();
		order = $("#order_AddUser").val();
		//alert(processurl+'-'+page+'-'+numresult+'-'+order);
		$("#list_phoihop_cont").load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+page);
	}
	
	function edit_me_AddUser(id){
		var doc_id = document.frmList_AddUser.doc_id.value;
		var user_id = document.frmList_AddUser.user_id.value;
		var arg = document.getElementById('arg_reply').value;
		$("#list_phoihop_cont").load("?listAddUser&mod=docs&edit_me=1&docReply_id="+id+arg);
	}
	
	function show_huongdan(id){
		document.getElementById('div_huongdan').style.display='block';
		$("#list_huongdan_cont").load("?listHuongdan&mod=daydocs");
	}
			
	$("#a_ref_AddUser").click( function () { 
			var id = document.frmList_AddUser.doc_id.value;
			var arg = document.getElementById('arg').value;
			$('#list_phoihop_cont').hide();
			$('#list_phoihop_cont').fadeOut('fast').load('index.php?listAddUser&doc_id='+doc_id+'&'+arg).fadeIn("fast");
		});
</script>
{/literal}