{literal}
    <style type="text/css">
    .error { color:#FF0000;font-weight:bold; margin-left:5px; height:20px; line-height:20px}
    .msg{ color:#00F; font-weight:bold; margin-left:5px; height:20px; line-height:20px}
    .tbl_tit{
    float:left; line-height:25px; border-right:1px solid #99bbe8;
    }
    .tbl_cont{
    float:left; line-height:25px; border-right:1px solid #99bbe8; border-bottom:1px solid #99bbe8; background:#F2FFEC; font-size:12px
    }
    .tbl_cont2{
    float:left; line-height:25px; border-right:1px solid #99bbe8; border-bottom:1px solid #99bbe8; background:#FFF; font-size:12px
    }
    </style>

{/literal}
<div id="thuchien_hdban_content_insign">
	<form method="post" name="frmList_HdbanTientrinh" action="?listHdbanTientrinh{$vars.arg}" id="frmList_HdbanTientrinh">
    <!------------------------------------------THEM MOI------------------------------------>
    <fieldset style="width:520px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
        <legend class="legend_list_search" style="width: 350px">
            Thêm/Chỉnh sửa&nbsp;|&nbsp;Thông báo:&nbsp;
            <span id="mess_doc" class="msg">{$error}{$complete}</span>
            <span id="lblError_HdbanTientrinh" class="error">(*) là các mục bắt buộc!</span>
        </legend>
    	<table width="98%" cellspacing="0" cellpadding="0" border="0" style="margin-left:5px">
        	<tr height="10"><td colspan="2"></td></tr>
            <tr height="30">
            	<td align="center" width="24%" valign="top">
                    <div style="float:left; width:16%; line-height:25px; text-align:left">Nội dung <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:84%; line-height:25px; text-align:left; height:50px">
                        <textarea spellcheck="false" name="tientrinh_ghichu" id="tientrinh_ghichu" cols="30" rows="5" class="text_area_small" onfocus="hide_message_Hdban()" tabindex="8">{$obj_info.tientrinh_ghichu}</textarea>
                    </div>
                    <div style="float:left; width:16%; line-height:25px; text-align:left">Tệp tin:</div>
                    <div style="float:left; width:84%; line-height:25px; text-align:left">
                        <input type="text" class="text_short" name="tientrinh_file" id="tientrinh_file" value="{$obj_info.tientrinh_file}" onfocus="hide_message_HdbanTientrinh();">&nbsp;<a href="javascript:void(0)" onclick="javascript:window.open('upload_hdban_tientrinh.php','new_page','width=420,height=245')" >[ Tải lên ]</a>
                    </div>
                    <div style="float:left; width:16%; line-height:25px; text-align:left">Hợp đồng:</div>
                    <div style="float:left; width:84%; line-height:25px; text-align:left">{$hdban_info.hdban_sohd} (Ngày ký: {$hdban_info.hdban_ngayhd|date_format:"%d/%m/%Y"})</div>
                    <div style="float:left; width:16%; line-height:25px; text-align:left">&nbsp;</div>
                    <div style="float:left; width:44%; line-height:25px; text-align:left">
                        <input type="button" name="btnSub_HdbanTientrinh" id="btnSub_HdbanTientrinh" value="Ghi lại" class="button" tabindex="18"/>
                        <input type="hidden" name="tientrinh_id" id="tientrinh_id" value="{$obj_info.tientrinh_id}">
                        <input type="hidden" name="hdban_id" id="hdban_id" value="{$hdban_id}">
                        <input type="hidden" name="hdban_sohd" id="hdban_sohd" value="{$hdban_info.hdban_sohd}">
                        <input type="reset" name="Reset" value="Hủy bỏ" class="button" tabindex="19"/>
                    </div>
                    <div style="float:left; width:40%; line-height:25px; text-align:left">
                        &nbsp;<b>(Người nhập: {$access_user_name})</b>
                    </div>
                </td>
                {literal}
                    <script language="javascript">
                        function hide_message_HdbanTientrinh(){
                            $('#lblMessage_HdbanTientrinh').hide();
                            $('#lblError_HdbanTientrinh').hide();
                            $('#mess_doc').hide();
                        }

                        $(function() {
                            $('.error').hide();
                            $('#lblMessage_HdbanTientrinh').hide();

                            $("#btnSub_HdbanTientrinh").click(function() {

                                $('.error').hide();

                                var $form = $("#frmList_HdbanTientrinh");

                                var tientrinh_ghichu = $form.find('textarea#tientrinh_ghichu').val();
                                var tientrinh_id = $form.find('input#tientrinh_id').val();
                                var tientrinh_file = $form.find('input#tientrinh_file').val();
                                var hdban_id = $form.find('input#hdban_id').val();
                                var hdban_sohd = $form.find('input#hdban_sohd').val();

                                //begin validate form
                                if (tientrinh_ghichu == "" || hdban_id == "" || hdban_sohd == "" ){
                                    $('#lblError_HdbanTientrinh').show();
                                }
                                else{
                                    $.post('index.php?listHdbanTientrinh&mod=hdban&add_edit=1',
                                        {
                                            tientrinh_ghichu:tientrinh_ghichu,
                                            tientrinh_id:tientrinh_id,
                                            tientrinh_file:tientrinh_file,
                                            hdban_id:hdban_id,
                                            hdban_sohd:hdban_sohd
                                        },
                                        function(data){
                                            $('#list_thuchien_hdban_cont').html(data);
                                            $("#list_thuchien_hdban_cont").show();
                                        }
                                    );
                                    return false;
                                }
                                //end form
                            });
                        });
                    </script>
                {/literal}
            </tr>
        </table>
    </fieldset>
    <!------------------------------------DANH SACH---------------------------------------------->
    <fieldset style="width:520px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:175px">
        <legend class="legend_list" style="width:410px">
            <div style="width:100px; float:left">Danh sách: {$total_num_result}</div>
            <div style="width:70px; float:left">&nbsp;|&nbsp;Tìm kiếm:&nbsp;</div>
            <div style="width:180px; float:left; font-weight:normal">
                <div style="float:left">
                    <div style="float:left; width:60px">- Nội dung: </div>
                    <div style="float:left; width:100px">
                    <input type="text" id="tientrinh_ghichu_fs" name="tientrinh_ghichu_fs" class="text_seek_middle" value="{$vars.tientrinh_ghichu_fs}"/>
                    </div>
                    <input type="hidden" id="processurl" value="{$processurl}" />
                </div>
            </div>

            <div style="width:45px; float:left">
                <input type="button" name="btnSeek" id="btnSeek" value="Tìm >>" class="button_seek" onclick="search_me_HdbanTientrinh()" />
            </div>
        </legend>
    	<div style="float:left; height:5px; width:100%"></div>
        <div style="float:left; height:25px; width:500px; border-top:1px solid #99bbe8; border-bottom:1px solid #99bbe8 ">
            <div class="tbl_tit" style="width:40px; text-align:center"><b>STT</b></div>
            <div class="tbl_tit" style="width:255px"><B>&nbsp;Nội dung</B></div>
            <div class="tbl_tit" style="width:70px"><B>&nbsp;Ngày nhập</B></div>
            <div class="tbl_tit" style="width:40px; text-align:center"><B>File</B></div>
            <div class="tbl_tit" style="width:59px; text-align:center"><B>Chọn</B></div>
            <div class="tbl_tit" style="width:30px; text-align:center">
            <input type="hidden" name="chon" id="chon_HdbanTientrinh">
            <input type="checkbox" name="chkall" value="0" onclick="docheck_HdbanTientrinh(document.frmList_HdbanTientrinh.chkall.checked,0);">
            </div>
        </div>
        <div style="float:left; width:20px; text-align:right">
        <input type="button" name="del_Items" id='del_Items' value="&nbsp;" onClick="delItems_HdbanTientrinh('{$processurl}');" style="width:17px; font-size:12px; background:url(../images/admin/b_drop.png); cursor:pointer" title="Xóa lựa chọn">
        </div>
        <div style="float:left; height:122px; width:520px; overflow-y:scroll">
            {section name=pi loop=$obj_list}
            {if $smarty.section.pi.index is not div by 2} 
            {assign var="class_td" value="tbl_cont"} 
            {else}
            {assign var="class_td" value="tbl_cont2"} 
            {/if}
            {math x=$vars.curpage-1 y=$vars.numresult z=$smarty.section.pi.index t=1 equation="x*y+z+t" assign=stt}
            <div style="float:left">
                <div class="{$class_td}" style="width:40px; text-align:center">{$stt}</div>
                <div class="{$class_td}" style="width:255px; white-space:nowrap; text-align:left" title="{$obj_list[pi]->tientrinh_ghichu}">
                    &nbsp;{$obj_list[pi]->tientrinh_ghichu|str_string_cut:"55":"1"}
                </div>
                <div class="{$class_td}" style="width:70px">
                    &nbsp;{$obj_list[pi]->tientrinh_date|date_format:"%d/%m/%Y"}
                </div>
                <div class="{$class_td}" style="width:40px; text-align:center">
                    <a href='{$obj_list[pi]->tientrinh_file}' target="new">
                        <img src="../images/admin/download_icon.png" width="16" height="16" border="0" title="Tải về"></a>
                </div>
                <div class="{$class_td}" style="width:29px; text-align:center">
                    <a href='javascript: void(0);' onclick="edit_me_HdbanTientrinh({$obj_list[pi]->tientrinh_id},{$obj_list[pi]->hdban_id})">
                    <img src="../images/admin/b_edit.png" width="11" height="11" border="0" title="Sửa"></a>
                </div>
                <div class="{$class_td}" style="width:29px; text-align:center">
                    <a href='javascript: void(0)' onClick="delItems_HdbanTientrinh('{$processurl}', {$obj_list[pi]->tientrinh_id});">
                    <img src="../images/admin/b_drop.png" width="11" height="11" border="0" title="Xóa"></a>
                </div>
                <div class="{$class_td}" style="width:30px; text-align:center">
                    <input type="checkbox" name="chkid" value="{$obj_list[pi]->tientrinh_id}" onclick="docheckone_HdbanTientrinh();">
                </div>
            </div>
            {/section}
        </div>
        <input type="hidden" id="curpage_HdbanTientrinh" name="curpage" value="{$vars.curpage}" />
        <input type="hidden" name="arg" id="arg" value="{$vars.arg}">
        <input type="hidden" name="hdban_HdbanTientrinh" id="hdban_HdbanTientrinh" value="{$hdban_id}">
    </fieldset>
    </form>
</div>
<!------------------------------------------------- Tool bar --------------------------------------------->
<div id="hdban_clear_txt"></div>
<div id="hdban_tool_bar">

    <div id="hdban_search_area">
    <select name="order" id = "order_HdbanTientrinh" style="width:120px; font-size:12px; border:1px solid #99bbe8; margin-left:1px" onchange="reloadPage_HdbanTientrinh('{$processurl}');">
    {section name=sli loop=$order_arr}
        <option value="{$smarty.section.sli.index}" {if $smarty.section.sli.index eq $vars.order}selected{/if} >
        {$order_arr[sli]}
        </option>
    {/section}
    </select>
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div id="hdban_page_area">
    {if $vars.curpage eq 1}
    	<img src="{$css_path}icon_first_page.png" class="img_all">
    	<img src="{$css_path}icon_pre_page.png" class="img_all">
    {else}
    <a href="javascript: void(0)" id="first_page" onclick="gotoPage_HdbanTientrinh('{$processurl}',parseInt(1));" title="Trang đầu">
    	<img src="{$css_path}icon_first_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="pre_page" onclick="gotoPage_HdbanTientrinh('{$processurl}',parseInt(document.getElementById('page_HdbanTientrinh').value)-parseInt(1));" title="Trang trước">
    	<img src="{$css_path}icon_pre_page.png" class="img_all">
    </a>
    {/if}
    </div>
    <div style="float:left; line-height:19px">
        <div style="float:left; width:35px">Trang</div> 
        <div style="float:left; width:35px">
        <input type="text" value="{$vars.curpage}" name="page" id="page_HdbanTientrinh" onblur=" gotoPage_HdbanTientrinh('{$processurl}',this.value);" style="width:30px; font-size:12px; height:15px; border:1px solid #99bbe8">
        </div>
        <div style="float:left; width:32px"> / {$num_page}</div>
    </div>
    <div id="hdban_page_area">
    {if $vars.curpage eq $num_page}
    	<img src="{$css_path}icon_next_page.png" class="img_all">
        <img src="{$css_path}icon_last_page.png" class="img_all">
    {else}
    <a href="javascript: void(0)" id="next_page" onclick="gotoPage_HdbanTientrinh('{$processurl}',parseInt(document.getElementById('page_HdbanTientrinh').value)+parseInt(1));" title="Trang tiếp">
    	<img src="{$css_path}icon_next_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="last_page" onclick="gotoPage_HdbanTientrinh('{$processurl}',parseInt({$num_page}));" title="Trang cuối">
    	<img src="{$css_path}icon_last_page.png" class="img_all">
    </a>
    {/if}
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:left; width:15px">
    <a href="javascript: void(0)" id="a_ref_HdbanTientrinh" title="Tải lại"><img src="{$css_path}icon_refresh.png" class="img_all"></a>
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:right; line-height:19px; margin-right:2px">
        <div style="float:left; width:40px">Xem</div>
        <div style="float:left; width:52px">
            <select name="numresult" id="numresult_HdbanTientrinh" style="width:50px; font-size:12px; border:1px solid #99bbe8" onchange="reloadPage_HdbanTientrinh('{$processurl}');">
                {section name=sli loop=$nrs_arr}
                <option value="{$nrs_arr[sli]}" {if $nrs_arr[sli] eq $vars.numresult}selected{/if}>{$nrs_arr[sli]} </option>
                {/section}
            </select>
        </div>
        <div style="float:left; margin-right:1px">dòng / trang</div>
    </div>
    
</div>
{literal}
<script language="javascript">	
	function show_list_options(count,total){
		for(i=1;i<=total;i++){
			if(i==count){
				if(document.getElementById('extra_'+i).style.display=='none')
					document.getElementById('extra_'+i).style.display='block';
				else
					document.getElementById('extra_'+i).style.display='none';
			}
			else
				document.getElementById('extra_'+i).style.display='none';
		}
	}
	function show_hide_seek(){
		if(document.getElementById('seek_more').style.display=='none')
			document.getElementById('seek_more').style.display='';
		else document.getElementById('seek_more').style.display='none';
	}
	
	function show_hide_filter(){
		if(document.getElementById('div_filter').style.display=='none')
			document.getElementById('div_filter').style.display='';
		else document.getElementById('div_filter').style.display='none';
	}
	
	function docheck_HdbanTientrinh(status,from_){
		var alen=document.frmList_HdbanTientrinh.elements.length;
		alen=(alen>5)?document.frmList_HdbanTientrinh.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
			document.frmList_HdbanTientrinh.chkid[i].checked=status;
		}
		else{
			document.frmList_HdbanTientrinh.chkid.checked=status;
		}
		if(from_>0) document.frmList_HdbanTientrinh.chkall.checked=status;
	}
		
	function docheckone_HdbanTientrinh(){
		var alen=document.frmList_HdbanTientrinh.elements.length;
		var isChecked=true;
		alen=(alen>4)?document.frmList_HdbanTientrinh.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_HdbanTientrinh.chkid[i].checked==false)
					isChecked=false;
		}else{
			if(document.frmList_HdbanTientrinh.chkid.checked==false)
				isChecked=false;
		}				
		document.frmList_HdbanTientrinh.chkall.checked=isChecked;
	}
	
	function calculatechon_HdbanTientrinh(){			
		var strchon="";
		var alen=document.frmList_HdbanTientrinh.elements.length;				
		alen=(alen>2)?document.frmList_HdbanTientrinh.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_HdbanTientrinh.chkid[i].checked==true)
					strchon+=document.frmList_HdbanTientrinh.chkid[i].value+",";
		}else{
			if(document.frmList_HdbanTientrinh.chkid.checked==true)
				strchon=document.frmList_HdbanTientrinh.chkid.value;
		}
		document.frmList_HdbanTientrinh.chon_HdbanTientrinh.value=strchon;
	}
	
	function delItems_HdbanTientrinh(processurl,delStr){
		if (delStr == undefined){
			calculatechon_HdbanTientrinh();
			delStr = document.getElementById("chon_HdbanTientrinh").value;
		}
		if (delStr == ""){
			return false;
		}
		if(!confirm("THÔNG BÁO: \n\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
			return false;
		}	
		
		var numresult_HdbanTientrinh,order_HdbanTientrinh,curpage_HdbanTientrinh;
		numresult = $("#numresult_HdbanTientrinh").val();
		order = $("#order_HdbanTientrinh").val();
		curpage = $("#curpage_HdbanTientrinh").val();
		
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
				$('#list_thuchien_hdban_cont').fadeOut('fast').load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+curpage).fadeIn("fast");
			}
		});
	}
	
	function reloadPage_HdbanTientrinh(processurl){
		var numresult_HdbanTientrinh,order_HdbanTientrinh,cur_pos;
		numresult = $("#numresult_HdbanTientrinh").val();
		order = $("#order_HdbanTientrinh").val();
		cur_pos = 0;
		alert(processurl);
		$("#list_thuchien_hdban_cont").load(processurl+"&numresult="+numresult+"&order="+order+"&cur_pos="+cur_pos);
	}
		
	function gotoPage_HdbanTientrinh(processurl,page){
		var numresult_HdbanTientrinh,order_HdbanTientrinh,cur_pos;
		numresult = $("#numresult_HdbanTientrinh").val();
		order = $("#order_HdbanTientrinh").val();
		//alert(processurl+'-'+page+'-'+numresult+'-'+order);
		$("#list_thuchien_hdban_cont").load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+page);
	}

	function search_me_HdbanTientrinh(){
		var tientrinh_ghichu_fs 	= document.getElementById('tientrinh_ghichu_fs').value;
		var tientrinh_sohd_fs 	= document.getElementById('tientrinh_sohd_fs').value;
		var ngayxuat_1 		= document.getElementById('ngayxuat_1').value;
		var ngayxuat_2 	= document.getElementById('ngayxuat_2').value;
		var ngayxuat_3 	= document.getElementById('ngayxuat_3').value;
		
		if (tientrinh_ghichu_fs == "" && tientrinh_sohd_fs == "" && ngayxuat_1 == "" && ngayxuat_2 == "" && ngayxuat_3 == ""){
			return false;
		}
		
		$.post('?listHdbanTientrinh&mod=hdban&search_me=1',
			{
				tientrinh_ghichu_fs:tientrinh_ghichu_fs,
                tientrinh_sohd_fs:tientrinh_sohd_fs,
                ngayxuat_1:ngayxuat_1,
                ngayxuat_2:ngayxuat_2,
                ngayxuat_3:ngayxuat_3
			},
			function(data){
				$('#list_thuchien_hdban_cont').html(data);
				$("#list_thuchien_hdban_cont").show();
			}
		);
	}
	
	function edit_me_HdbanTientrinh(id,hdban_id){
	    //alert("?listHdbanTientrinh&mod=hdban&edit_me=1&hdban_id="+hdban_id);
		$("#list_thuchien_hdban_cont").load("?listHdbanTientrinh&mod=hdban&edit_me=1&tientrinh_id="+id+"&hdban_id="+hdban_id);
	}
		
	$("#a_ref_HdbanTientrinh").click( function () {
			$('#list_thuchien_hdban_cont').hide();
			$('#list_thuchien_hdban_cont').fadeOut('fast').load('index.php?listHdbanTientrinh'+$("#arg").val()+"&hdban_id="+$("#hdban_HdbanTientrinh").val()).fadeIn("fast");
		});
</script>
{/literal}
