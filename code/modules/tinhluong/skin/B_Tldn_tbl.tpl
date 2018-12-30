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
<div id="thangluong_content_insign">
	<form method="post" name="frmList_Tldn" action="?listTldn{$vars.arg}" id="frmList_Tldn">
    <!------------------------------------------THEM MOI------------------------------------>
    <fieldset style="width:1162px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
    <legend class="legend_list">
        Thêm/Chỉnh sửa&nbsp;|&nbsp;Thông báo:&nbsp;
        <span id="lblError_Tldn" class="error">Dấu (*) là các mục bắt buộc!</span>
        <span id="lblError_Tldn_2" class="error">Hệ số và số năm phải là số!</span>
    </legend>
    	<table width="98%" cellspacing="0" cellpadding="0" border="0" style="margin-left:5px">
        	<tr height="10"><td colspan="4"></td></tr>
            <tr height="30">
            	<td align="center">
                    <div style="float:left; width:8%; line-height:25px; text-align:left">Tên bậc lương <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:52%; line-height:25px; text-align:left">
                    <input type="text" name="tldn_ten" id="tldn_ten" class="text_super_long" value="{$obj_info.tldn_ten}" onfocus="hide_message_Tldn()"/>
                    </div>
                    <div style="float:left; width:8%; line-height:25px; text-align:left">Hệ số lương <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:32%; line-height:25px; text-align:left">
                    <input type="text" name="tldn_heso" id="tldn_heso" class="text_tiny" value="{$obj_info.tldn_heso}" onfocus="hide_message_Tldn()"/>&nbsp;(dùng dấu (.) thay cho dấu (,). Ví dụ: 3,2 viết là 3.2)
                    </div>
                    <div style="float:left; width:8%; line-height:25px; text-align:left">Mô tả:</div>
                    <div style="float:left; width:52%; line-height:25px; text-align:left">
                        <textarea spellcheck="false" name="tldn_mota" id="tldn_mota" cols="30" rows="5" class="text_area_long" onfocus="hide_message_Doc()" tabindex="7">{$obj_info.tldn_mota}</textarea>
                    </div>
                	<div style="float:left; width:8%; line-height:25px; text-align:left">Tình trạng :</div>
                    <div style="float:left; width:18%; line-height:25px; text-align:left">
                    	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            {if $obj_info.tldn_active neq ''}
                            <td width="35%">
                            <input type="radio" id="tldn_active" name="tldn_active" value="1" {if $obj_info.tldn_active eq 1} checked="checked" {/if} />&nbsp;Hiển thị</td>
                            <td>
                            <input type="radio" id="tldn_active" name="tldn_active" value="2" {if $obj_info.tldn_active eq 2} checked="checked" {/if} />&nbsp;Không hiển thị</td>
                            {else}
                            <td width="35%">
                            <input type="radio" id="tldn_active" name="tldn_active" value="1" checked/>&nbsp;Hiển thị</td>
                            <td>
                            <input type="radio" id="tldn_active" name="tldn_active" value="2" />&nbsp;Không hiển thị</td>
                            {/if}
                          </tr>
                        </table>
                    </div>
                    <div style="float:left; line-height:25px; text-align:left">
                    	<input type="button" name="btnSub_Tldn" id="btnSub_Tldn" value="Ghi lại" class="button" />
                        <input type="hidden" name="tldn_id" id="tldn_id" value="{$obj_info.tldn_id}">
                        <input type="reset" name="Reset" value="Hủy bỏ" class="button" />
                        {literal}
                        <script language="javascript">
                            function hide_message_Tldn(){
                                $('#lblError_Tldn').hide();
                                $('#lblError_Tldn_2').hide();
                            }
                            
                            $(function() {
                            $('.error').hide();
                             
                            $("#btnSub_Tldn").click(function() {
                                $('.error').hide();
                                
                                var $form = $("#frmList_Tldn");
								var tldn_ten = $form.find('input#tldn_ten').val();
                                var tldn_heso = $form.find('input#tldn_heso').val();
								var tldn_mota = $form.find('textarea#tldn_mota').val();
                                var tldn_active = $form.find('input#tldn_active:checked').val();
                                var tldn_id = $form.find('input#tldn_id').val();
                                //begin validate form
                                if (tldn_heso == 0 || tldn_ten == ""){
                                    $('#lblError_Tldn').show();
                                }else{
                                    var dataString = "&tldn_ten=" + tldn_ten;
                                        dataString += "&tldn_heso=" + tldn_heso;
										dataString += "&tldn_mota=" + tldn_mota;
                                        dataString += "&tldn_active=" + tldn_active;
                                        dataString += "&tldn_id=" + tldn_id +"";
                                        //alert (dataString);return false;
                                    $.ajax({
                                        type: "POST",
                                        url: "index.php?listTldn&mod=tinhluong&add_edit=1",
                                        data: dataString,
                                        success: function(data) {
                                            $('#tinhluong_content_main').fadeOut('fast').load('index.php?listTldn&mod=tinhluong').fadeIn("fast");
                                            //$('#lblMessage_Tldn').show();
                                        }
                                    });
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
    <fieldset style="width:1162px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:223px">
    <legend class="legend_list_search">
        <div style="width:130px; float:left">Danh sách: {$total_num_result}</div>
        <div style="width:70px; float:left">&nbsp;|&nbsp;Tìm kiếm&nbsp;</div>
        <div style="width:155px; float:left">
        	<select name="chucvu_id_seek" id="chucvu_id_seek" class="select_seek" onfocus="hide_message_Tldn()">
                <option value="0">Chọn chức vụ</option>
                {section name=qi loop=$obj_list_object}
                <option value="{$obj_list_object[qi]->object_id}" {if $obj_list_object[qi]->object_id eq $obj_info.chucvu_id}selected="selected"{/if}>-&nbsp;{$obj_list_object[qi]->object_name}</option>
                {/section}
            </select>
        </div>
        <div style="width:50px; float:left">
        	<input type="button" name="btnSeek" id="btnSeek" value="Tìm >>" class="button_seek" onclick="search_me_Tldn()" /></div>
    </legend>
    	<div style="float:left; height:5px; width:100%"></div>
        <div style="float:left; height:25px; width:1142px; border-top:1px solid #99bbe8; border-bottom:1px solid #99bbe8 ">
            <div class="tbl_tit" style="width:30px; text-align:center"><b>STT</b></div>	
            <div class="tbl_tit" style="width:220px"><B>&nbsp;Tên bậc lương</B></div>
            <div class="tbl_tit" style="width:60px; text-align:right"><B>&nbsp;Hệ số&nbsp;</B></div>
            <div class="tbl_tit" style="width:523px"><B>&nbsp;Mô tả</B></div>
            <div class="tbl_tit" style="width:80px"><B>&nbsp;Ngày tạo</B></div>
            <div class="tbl_tit" style="width:60px; text-align:center"><B>Sắp xếp</B></div>
            <div class="tbl_tit" style="width:60px; text-align:center"><B>Hiển thị</B></div>
            <div class="tbl_tit" style="width:60px; text-align:center"><B>Chọn</B></div>
            <div class="tbl_tit" style="width:40px; text-align:center">
            <input type="hidden" name="chon" id="chon_Tldn">
            <input type="checkbox" name="chkall" value="0" onclick="docheck_Tldn(document.frmList_Tldn.chkall.checked,0);">
            </div>
        </div>
        <div style="float:left; width:20px; text-align:right">
        <input type="button" name="del_Items" id='del_Items' value="&nbsp;" onClick="delItems_Tldn('{$processurl}');" style="width:17px; font-size:12px; background:url(../images/admin/b_drop.png); cursor:pointer" title="Xóa lựa chọn">
        </div>
        <div style="float:left; height:169px; width:1162px; overflow-y:scroll">
            {section name=pi loop=$obj_list}
            {if $smarty.section.pi.index is not div by 2} 
            {assign var="class_td" value="tbl_cont"} 
            {else}
            {assign var="class_td" value="tbl_cont2"} 
            {/if}
            {math x=$vars.curpage-1 y=$vars.numresult z=$smarty.section.pi.index t=1 equation="x*y+z+t" assign=stt}
            <div class="{$class_td}" style="width:30px; text-align:center">{$stt}</div>
            <div class="{$class_td}" style="width:220px">
            	&nbsp;{$obj_list[pi]->tldn_ten}
            </div>
            <div class="{$class_td}" style="width:60px; text-align:right">
                &nbsp;{$obj_list[pi]->tldn_heso}&nbsp;
            </div>
            <div class="{$class_td}" style="width:523px">
                &nbsp;{$obj_list[pi]->tldn_mota}
            </div>
            <div class="{$class_td}" style="width:80px">
            	&nbsp;{$obj_list[pi]->tldn_date|date_format:"%d/%m/%Y"}
            </div>
            <div class="{$class_td}" style="width:60px; text-align:center">
                <select name="tldn_sort[]" class="select_tiny" onchange="sort_me_Tldn({$obj_list[pi]->tldn_id},this.value)">
                {section name=i loop=$total_num_result}
                    <option value="{$smarty.section.i.index}" {if $smarty.section.i.index eq $obj_list[pi]->tldn_sort} selected="selected"{/if}>{$smarty.section.i.index}</option>
                {/section}
                </select>
                <input type="hidden" name="tldn_id1[]" value="{$obj_list[pi]->tldn_id}">
            </div>
            <div class="{$class_td}" style="width:60px; text-align:center">
                {if $obj_list[pi]->tldn_active eq 1}
                    <a href='javascript: void(0);' onclick="uncheck_fns_Tldn('tldn_active',2,{$obj_list[pi]->tldn_id})"><img src="../images/admin/tick.png" width="10" height="10" border="0" title="Ẩn"></a>
                {else}
                    <a href='javascript: void(0);' onclick="uncheck_fns_Tldn('tldn_active',1,{$obj_list[pi]->tldn_id})"><img src="../images/admin/publish_x.png" width="10" height="10" border="0" title="Hiện"></a>
                {/if}
            </div>
            <div class="{$class_td}" style="width:30px; text-align:center">
                <a href='javascript: void(0);' onclick="edit_me_Tldn({$obj_list[pi]->tldn_id})">
                <img src="../images/admin/b_edit.png" width="11" height="11" border="0" title="Sửa"></a>
            </div>
            <div class="{$class_td}" style="width:29px; text-align:center">
                <a href='javascript: void(0)' onClick="delItems_Tldn('{$processurl}', {$obj_list[pi]->tldn_id});">
                <img src="../images/admin/b_drop.png" width="11" height="11" border="0" title="Xóa"></a>
            </div>
            <div class="{$class_td}" style="width:40px; text-align:center">
            	<input type="checkbox" name="chkid" value="{$obj_list[pi]->tldn_id}" onclick="docheckone_Tldn();">
            </div>
            {/section}
        </div>
        <input type="hidden" id="curpage_Tldn" name="curpage" value="{$vars.curpage}" />
    </fieldset>
    </form>
</div>
<!------------------------------------------------- Tool bar --------------------------------------------->
<div id="user_clear_txt"></div>
<div id="user_tool_bar">

    <div id="user_search_area">
    <select name="order" id = "order_Tldn" style="width:120px; font-size:12px; border:1px solid #99bbe8" onchange="reloadPage_Tldn('{$processurl}');">
    {section name=sli loop=$order_arr}
        <option value="{$smarty.section.sli.index}" {if $smarty.section.sli.index eq $vars.order}selected{/if} >
        {$order_arr[sli]}
        </option>
    {/section}
    </select>
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div id="user_page_area">
    {if $vars.curpage eq 1}
    	<img src="{$css_path}icon_first_page.png" class="img_all">
    	<img src="{$css_path}icon_pre_page.png" class="img_all">
    {else}
    <a href="javascript: void(0)" id="first_page" onclick="gotoPage_Tldn('{$processurl}',parseInt(1));" title="Trang đầu">
    	<img src="{$css_path}icon_first_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="pre_page" onclick="gotoPage_Tldn('{$processurl}',parseInt(document.getElementById('page_Tldn').value)-parseInt(1));" title="Trang trước">
    	<img src="{$css_path}icon_pre_page.png" class="img_all">
    </a>
    {/if}
    </div>
    <div style="float:left; line-height:19px">
        <div style="float:left; width:35px">Trang</div> 
        <div style="float:left; width:35px">
        <input type="text" value="{$vars.curpage}" name="page" id="page_Tldn" onblur=" gotoPage_Tldn('{$processurl}',this.value);" style="width:30px; font-size:12px; height:15px; border:1px solid #99bbe8">
        </div>
        <div style="float:left; width:42px"> / {$num_page}</div>
    </div>
    <div id="user_page_area">
    {if $vars.curpage eq $num_page}
    	<img src="{$css_path}icon_next_page.png" class="img_all">
        <img src="{$css_path}icon_last_page.png" class="img_all">
    {else}
    <a href="javascript: void(0)" id="next_page" onclick="gotoPage_Tldn('{$processurl}',parseInt(document.getElementById('page_Tldn').value)+parseInt(1));" title="Trang tiếp">
    	<img src="{$css_path}icon_next_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="last_page" onclick="gotoPage_Tldn('{$processurl}',parseInt({$num_page}));" title="Trang cuối">
    	<img src="{$css_path}icon_last_page.png" class="img_all">
    </a>
    {/if}
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:left; width:15px">
    <a href="javascript: void(0)" id="a_ref_Tldn" title="Tải lại"><img src="{$css_path}icon_refresh.png" class="img_all"></a>
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:right; line-height:19px; margin-right:2px">
        <div style="float:left; width:40px">Xem</div>
        <div style="float:left; width:52px">
            <select name="numresult" id="numresult_Tldn" style="width:50px; font-size:12px; border:1px solid #99bbe8" onchange="reloadPage_Tldn('{$processurl}');">
                {section name=sli loop=$nrs_arr}
                <option value="{$nrs_arr[sli]}" {if $nrs_arr[sli] eq $vars.numresult}selected{/if}>{$nrs_arr[sli]} </option>
                {/section}
            </select>
        </div>
        <div style="float:left">dòng / trang</div>
    </div>
    
</div>
{literal}
<script language="javascript">	
	function docheck_Tldn(status,from_){
		var alen=document.frmList_Tldn.elements.length;
		alen=(alen>5)?document.frmList_Tldn.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
			document.frmList_Tldn.chkid[i].checked=status;
		}
		else{
			document.frmList_Tldn.chkid.checked=status;
		}
		if(from_>0) document.frmList_Tldn.chkall.checked=status;
	}
		
	function docheckone_Tldn(){
		var alen=document.frmList_Tldn.elements.length;
		var isChecked=true;
		alen=(alen>4)?document.frmList_Tldn.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_Tldn.chkid[i].checked==false)
					isChecked=false;
		}else{
			if(document.frmList_Tldn.chkid.checked==false)
				isChecked=false;
		}				
		document.frmList_Tldn.chkall.checked=isChecked;
	}
	
	function calculatechon_Tldn(){			
		var strchon="";
		var alen=document.frmList_Tldn.elements.length;				
		alen=(alen>2)?document.frmList_Tldn.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_Tldn.chkid[i].checked==true)
					strchon+=document.frmList_Tldn.chkid[i].value+",";
		}else{
			if(document.frmList_Tldn.chkid.checked==true)
				strchon=document.frmList_Tldn.chkid.value;
		}
		document.frmList_Tldn.chon_Tldn.value=strchon;
	}
	
	function delItems_Tldn(processurl,delStr){
		if (delStr == undefined){
			calculatechon_Tldn();
			delStr = document.getElementById("chon_Tldn").value;
		}
		if (delStr == ""){
			return false;
		}
		if(!confirm("THÔNG BÁO: \n\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
			return false;
		}	
		
		var numresult_Tldn,order_Tldn,curpage_Tldn;
		numresult = $("#numresult_Tldn").val();
		order = $("#order_Tldn").val();
		curpage = $("#curpage_Tldn").val();
		
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
				$('#tinhluong_content_main').fadeOut('fast').load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+curpage).fadeIn("fast");
			}
		});
	}
	
	function reloadPage_Tldn(processurl){
		var numresult_Tldn,order_Tldn,cur_pos;
		numresult = $("#numresult_Tldn").val();
		order = $("#order_Tldn").val();
		cur_pos = 0;
		$("#tinhluong_content_main").load(processurl+"&numresult="+numresult+"&order="+order+"&cur_pos="+cur_pos);
	}
	
	function gotoPage_Tldn(processurl,page){
		var numresult_Tldn,order_Tldn,cur_pos;
		numresult = $("#numresult_Tldn").val();
		order = $("#order_Tldn").val();
		//alert(processurl+'-'+page+'-'+numresult+'-'+order);
		$("#tinhluong_content_main").load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+page);
	}
	
	function uncheck_fns_Tldn(field,val,id){
		$("#tinhluong_content_main").load("?listTldn&mod=tinhluong&checkUncheck="+val+"&setfield="+field+"&checkUncheckID="+id);
	}
	
	function sort_me_Tldn(id,val){
		$("#tinhluong_content_main").load("?listTldn&mod=tinhluong&sort_me=1&tldn_id="+id+"&val="+val);
	}
	
	function search_me_Tldn(){
		var chucvu_id_seek = document.getElementById('chucvu_id_seek').value;
		if (chucvu_id_seek == 0){
			return false;
		}
		
		$.post('?listTldn&mod=tinhluong',
			{chucvu_id_seek:chucvu_id_seek},
			function(data){
				$('#tinhluong_content_main').html(data);
				$("#tinhluong_content_main").show();
			}
		);
	}
	
	function edit_me_Tldn(id){
		$("#tinhluong_content_main").load("?listTldn&mod=tinhluong&edit_me=1&tldn_id="+id);
	}
		
	$("#a_ref_Tldn").click( function () { 
			$('#tinhluong_content_main').hide();
			$('#tinhluong_content_main').fadeOut('fast').load('index.php?listTldn&mod=tinhluong').fadeIn("fast");
		});
</script>
{/literal}