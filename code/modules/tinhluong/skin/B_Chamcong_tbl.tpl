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
<div id="user_content_insign">
	<form method="post" name="frmList_Chamcong" action="?listChamcong{$vars.arg}" id="frmList_Chamcong">
    <!------------------------------------------THEM MOI------------------------------------>
    <fieldset style="width:837px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
    <legend class="legend_list">
        Thêm/Chỉnh sửa&nbsp;|&nbsp;Thông báo:&nbsp;
        <span id="lblError_Chamcong" class="error">Dấu (*) là các mục bắt buộc!</span>
        <span id="lblError_Chamcong_2" class="error">Hệ số và số năm phải là số!</span>
    </legend>
    	<table width="98%" cellspacing="0" cellpadding="0" border="0" style="margin-left:5px">
        	<tr height="10"><td colspan="4"></td></tr>
            <tr height="30">
            	<td align="center" width="50%">
                	<div style="float:left; width:15%; line-height:25px; text-align:left">Chức vụ <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:35%; line-height:25px; text-align:left">
                    <select name="chucvu_id" id="chucvu_id" class="select_middle" onfocus="hide_message_Chamcong()">
                        <option value="0">Chọn chức vụ</option>
                        {section name=qi loop=$obj_list_object}
                        <option value="{$obj_list_object[qi]->object_id}" {if $obj_list_object[qi]->object_id eq $obj_info.chucvu_id}selected="selected"{/if}>-&nbsp;{$obj_list_object[qi]->object_name}</option>
                        {/section}
                    </select>
                    </div>
                    <div style="float:left; width:15%; line-height:25px; text-align:left">Bậc lương <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:35%; line-height:25px; text-align:left">
                    <input type="text" name="cc_bac" id="cc_bac" class="text_tiny" value="{$obj_info.cc_bac}" onfocus="hide_message_Chamcong()"/>
                    </div>
                    <div style="float:left; width:15%; line-height:25px; text-align:left">Hệ số lương <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:85%; line-height:25px; text-align:left">
                    <input type="text" name="cc_heso" id="cc_heso" class="text_tiny" value="{$obj_info.cc_heso}" onfocus="hide_message_Chamcong()"/>&nbsp;(dùng dấu (.) thay cho dấu (,). Ví dụ: 3,2 viết là 3.2. Lương chính thức = Lương cơ bản x hệ số lương)
                    </div>
                	<div style="float:left; width:15%; line-height:25px; text-align:left">Loại bậc lương <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:35%; line-height:25px; text-align:left">
                    	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            {if $obj_info.cc_hetbac neq ''}
                            <td width="35%">
                            <input type="radio" id="cc_hetbac" name="cc_hetbac" value="1" {if $obj_info.cc_hetbac eq 1} checked="checked" {/if} />&nbsp;Bậc cuối</td>
                            <td>
                            <input type="radio" id="cc_hetbac" name="cc_hetbac" value="2" {if $obj_info.cc_hetbac eq 2} checked="checked" {/if} />&nbsp;Còn bậc tiếp</td>
                            {else}
                            <td width="35%">
                            <input type="radio" id="cc_hetbac" name="cc_hetbac" value="1"/>&nbsp;Bậc cuối</td>
                            <td>
                            <input type="radio" id="cc_hetbac" name="cc_hetbac" value="2" checked/>&nbsp;Còn bậc tiếp</td>
                            {/if}
                          </tr>
                        </table>
                    </div>
                    <div style="float:left; width:15%; line-height:25px; text-align:left">Số năm nâng bậc:</div>
                    <div style="float:left; width:35%; line-height:25px; text-align:left">
                    <input type="text" name="cc_sonam" id="cc_sonam" class="text_tiny" value="{$obj_info.cc_sonam}" onfocus="hide_message_Chamcong()"/>&nbsp;(Không nhập nếu là bậc lương cuối)
                    </div>
                </td>
            </tr>
            <tr height="30">
            	<td align="center">
                	<div style="float:left; width:15%; line-height:25px; text-align:left">Tình trạng :</div>
                    <div style="float:left; width:35%; line-height:25px; text-align:left">
                    	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            {if $obj_info.cc_active neq ''}
                            <td width="35%">
                            <input type="radio" id="cc_active" name="cc_active" value="1" {if $obj_info.cc_active eq 1} checked="checked" {/if} />&nbsp;Hiển thị</td>
                            <td>
                            <input type="radio" id="cc_active" name="cc_active" value="2" {if $obj_info.cc_active eq 2} checked="checked" {/if} />&nbsp;Không hiển thị</td>
                            {else}
                            <td width="35%">
                            <input type="radio" id="cc_active" name="cc_active" value="1" checked/>&nbsp;Hiển thị</td>
                            <td>
                            <input type="radio" id="cc_active" name="cc_active" value="2" />&nbsp;Không hiển thị</td>
                            {/if}
                          </tr>
                        </table>
                    </div>
                    <div style="float:left; width:50%; line-height:25px; text-align:left">
                    	<input type="button" name="btnSub_Chamcong" id="btnSub_Chamcong" value="Ghi lại" class="button" />
                        <input type="hidden" name="cc_id" id="cc_id" value="{$obj_info.cc_id}">
                        <input type="reset" name="Reset" value="Hủy bỏ" class="button" />
                        {literal}
                        <script language="javascript">
                            function hide_message_Chamcong(){
                                $('#lblError_Chamcong').hide();
                                $('#lblError_Chamcong_2').hide();
                            }
                            
                            $(function() {
                            $('.error').hide();
                             
                            $("#btnSub_Chamcong").click(function() {
                                $('.error').hide();
                                
                                var $form = $("#frmList_Chamcong");
                                var chucvu_id = $form.find('select#chucvu_id :selected').val();
								var cc_bac = $form.find('input#cc_bac').val();
                                var cc_heso = $form.find('input#cc_heso').val();
								var cc_hetbac = $form.find('input#cc_hetbac:checked').val();
                                var cc_sonam = $form.find('input#cc_sonam').val();
                                var cc_active = $form.find('input#cc_active:checked').val();
                                var cc_id = $form.find('input#cc_id').val();
                                //begin validate form
                                if (chucvu_id == 0 || cc_bac == ""){
                                    $('#lblError_Chamcong').show();
                                }else if(isNaN(cc_heso) == true || isNaN(cc_sonam) == true){
                                    $('#lblError_Chamcong_2').show();
                                }else{
                                    var dataString  = "chucvu_id=" + chucvu_id;
										dataString += "&cc_bac=" + cc_bac;
                                        dataString += "&cc_heso=" + cc_heso;
										dataString += "&cc_hetbac=" + cc_hetbac;
                                        dataString += "&cc_sonam=" + cc_sonam;
                                        dataString += "&cc_active=" + cc_active;
                                        dataString += "&cc_id=" + cc_id +"";
                                        //alert (dataString);return false;
                                    $.ajax({
                                        type: "POST",
                                        url: "index.php?listChamcong&mod=tinhluong&add_edit=1",
                                        data: dataString,
                                        success: function(data) {
                                            $('#user_content_main').fadeOut('fast').load('index.php?listChamcong&mod=tinhluong').fadeIn("fast");
                                            //$('#lblMessage_Chamcong').show();
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
    <fieldset style="width:837px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:260px">
    <legend class="legend_list_search">
        <div style="width:130px; float:left">Danh sách: {$total_num_result}</div>
        <div style="width:70px; float:left">&nbsp;|&nbsp;Tìm kiếm&nbsp;</div>
        <div style="width:155px; float:left">
        	<select name="chucvu_id_seek" id="chucvu_id_seek" class="select_seek" onfocus="hide_message_Chamcong()">
                <option value="0">Chọn chức vụ</option>
                {section name=qi loop=$obj_list_object}
                <option value="{$obj_list_object[qi]->object_id}" {if $obj_list_object[qi]->object_id eq $obj_info.chucvu_id}selected="selected"{/if}>-&nbsp;{$obj_list_object[qi]->object_name}</option>
                {/section}
            </select>
        </div>
        <div style="width:50px; float:left">
        	<input type="button" name="btnSeek" id="btnSeek" value="Tìm >>" class="button_seek" onclick="search_me_Chamcong()" /></div>
    </legend>
    	<div style="float:left; height:5px; width:100%"></div>
        <div style="float:left; height:25px; width:817px; border-top:1px solid #99bbe8; border-bottom:1px solid #99bbe8 ">
            <div class="tbl_tit" style="width:30px; text-align:center"><b>STT</b></div>	
            <div class="tbl_tit" style="width:220px"><B>&nbsp;Chức vụ</B></div>
            <div class="tbl_tit" style="width:60px"><B>&nbsp;Bậc</B></div>
            <div class="tbl_tit" style="width:60px;text-align:right"><B>&nbsp;Hệ số&nbsp;</B></div>
            <div class="tbl_tit" style="width:80px;text-align:right"><B>&nbsp;Lương&nbsp;</B></div>
            <div class="tbl_tit" style="width:60px;text-align:right"><B>&nbsp;Số năm&nbsp;</B></div>
            <div class="tbl_tit" style="width:80px"><B>&nbsp;Ngày tạo</B></div>
            <div class="tbl_tit" style="width:59px; text-align:center"><B>Sắp xếp</B></div>
            <div class="tbl_tit" style="width:59px; text-align:center"><B>Hiển thị</B></div>
            <div class="tbl_tit" style="width:59px; text-align:center"><B>Chọn</B></div>
            <div class="tbl_tit" style="width:39px; text-align:center">
            <input type="hidden" name="chon" id="chon_Chamcong">
            <input type="checkbox" name="chkall" value="0" onclick="docheck_Chamcong(document.frmList_Chamcong.chkall.checked,0);">
            </div>
        </div>
        <div style="float:left; width:20px; text-align:right">
        <input type="button" name="del_Items" id='del_Items' value="&nbsp;" onClick="delItems_Chamcong('{$processurl}');" style="width:17px; font-size:12px; background:url(../images/admin/b_drop.png); cursor:pointer" title="Xóa lựa chọn">
        </div>
        <div style="float:left; height:205px; width:837px; overflow-y:scroll">
            {section name=pi loop=$obj_list}
            {if $smarty.section.pi.index is not div by 2} 
            {assign var="class_td" value="tbl_cont"} 
            {else}
            {assign var="class_td" value="tbl_cont2"} 
            {/if}
            {math x=$vars.curpage-1 y=$vars.numresult z=$smarty.section.pi.index t=1 equation="x*y+z+t" assign=stt}
            <div class="{$class_td}" style="width:30px; text-align:center">{$stt}</div>
            <div class="{$class_td}" style="width:220px">
            	&nbsp;
                {section name=qi loop=$obj_list_object}
                {if $obj_list_object[qi]->object_id eq $obj_list[pi]->chucvu_id}{$obj_list_object[qi]->object_name}{/if}
                {/section}
            </div>
            <div class="{$class_td}" style="width:60px">
            	&nbsp;{$obj_list[pi]->cc_bac|roman_format}
            </div>
            <div class="{$class_td}" style="width:60px; text-align:right">
            	&nbsp;{$obj_list[pi]->cc_heso}&nbsp;
            </div>
            <div class="{$class_td}" style="width:80px; text-align:right">
            	{math x=$obj_list[pi]->cc_heso y=$obj_owner[0]->site_logo  equation="x*y" assign=luong}
            	&nbsp;{$luong|price_format}&nbsp;
            </div>
            <div class="{$class_td}" style="width:60px; text-align:right">
            	{if $obj_list[pi]->cc_hetbac eq 1}&nbsp;Hết bậc&nbsp;{else}
            	&nbsp;{$obj_list[pi]->cc_sonam}&nbsp;
                {/if}
            </div>
            <div class="{$class_td}" style="width:80px">
            	&nbsp;{$obj_list[pi]->cc_date|date_format:"%d/%m/%Y"}
            </div>
            <div class="{$class_td}" style="width:59px; text-align:center">
                <select name="cc_sort[]" class="select_tiny" onchange="sort_me_Chamcong({$obj_list[pi]->cc_id},this.value)">
                {section name=i loop=$total_num_result}
                    <option value="{$smarty.section.i.index}" {if $smarty.section.i.index eq $obj_list[pi]->cc_sort} selected="selected"{/if}>{$smarty.section.i.index}</option>
                {/section}
                </select>
                <input type="hidden" name="cc_id1[]" value="{$obj_list[pi]->cc_id}">
            </div>
            <div class="{$class_td}" style="width:59px; text-align:center">
                {if $obj_list[pi]->cc_active eq 1}
                    <a href='javascript: void(0);' onclick="uncheck_fns_Chamcong('cc_active',2,{$obj_list[pi]->cc_id})"><img src="../images/admin/tick.png" width="10" height="10" border="0" title="Ẩn"></a>
                {else}
                    <a href='javascript: void(0);' onclick="uncheck_fns_Chamcong('cc_active',1,{$obj_list[pi]->cc_id})"><img src="../images/admin/publish_x.png" width="10" height="10" border="0" title="Hiện"></a>
                {/if}
            </div>
            <div class="{$class_td}" style="width:29px; text-align:center">
                <a href='javascript: void(0);' onclick="edit_me_Chamcong({$obj_list[pi]->cc_id})">
                <img src="../images/admin/b_edit.png" width="11" height="11" border="0" title="Sửa"></a>
            </div>
            <div class="{$class_td}" style="width:29px; text-align:center">
                <a href='javascript: void(0)' onClick="delItems_Chamcong('{$processurl}', {$obj_list[pi]->cc_id});">
                <img src="../images/admin/b_drop.png" width="11" height="11" border="0" title="Xóa"></a>
            </div>
            <div class="{$class_td}" style="width:39px; text-align:center">
            	<input type="checkbox" name="chkid" value="{$obj_list[pi]->cc_id}" onclick="docheckone_Chamcong();">
            </div>
            {/section}
        </div>
        <input type="hidden" id="curpage_Chamcong" name="curpage" value="{$vars.curpage}" />
    </fieldset>
    </form>
</div>
<!------------------------------------------------- Tool bar --------------------------------------------->
<div id="user_clear_txt"></div>
<div id="user_tool_bar">

    <div id="user_search_area">
    <select name="order" id = "order_Chamcong" style="width:120px; font-size:12px; border:1px solid #99bbe8" onchange="reloadPage_Chamcong('{$processurl}');">
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
    <a href="javascript: void(0)" id="first_page" onclick="gotoPage_Chamcong('{$processurl}',parseInt(1));" title="Trang đầu">
    	<img src="{$css_path}icon_first_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="pre_page" onclick="gotoPage_Chamcong('{$processurl}',parseInt(document.getElementById('page_Chamcong').value)-parseInt(1));" title="Trang trước">
    	<img src="{$css_path}icon_pre_page.png" class="img_all">
    </a>
    {/if}
    </div>
    <div style="float:left; line-height:19px">
        <div style="float:left; width:35px">Trang</div> 
        <div style="float:left; width:35px">
        <input type="text" value="{$vars.curpage}" name="page" id="page_Chamcong" onblur=" gotoPage_Chamcong('{$processurl}',this.value);" style="width:30px; font-size:12px; height:15px; border:1px solid #99bbe8">
        </div>
        <div style="float:left; width:42px"> / {$num_page}</div>
    </div>
    <div id="user_page_area">
    {if $vars.curpage eq $num_page}
    	<img src="{$css_path}icon_next_page.png" class="img_all">
        <img src="{$css_path}icon_last_page.png" class="img_all">
    {else}
    <a href="javascript: void(0)" id="next_page" onclick="gotoPage_Chamcong('{$processurl}',parseInt(document.getElementById('page_Chamcong').value)+parseInt(1));" title="Trang tiếp">
    	<img src="{$css_path}icon_next_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="last_page" onclick="gotoPage_Chamcong('{$processurl}',parseInt({$num_page}));" title="Trang cuối">
    	<img src="{$css_path}icon_last_page.png" class="img_all">
    </a>
    {/if}
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:left; width:15px">
    <a href="javascript: void(0)" id="a_ref_Chamcong" title="Tải lại"><img src="{$css_path}icon_refresh.png" class="img_all"></a>
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:right; line-height:19px; margin-right:2px">
        <div style="float:left; width:40px">Xem</div>
        <div style="float:left; width:52px">
            <select name="numresult" id="numresult_Chamcong" style="width:50px; font-size:12px; border:1px solid #99bbe8" onchange="reloadPage_Chamcong('{$processurl}');">
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
	function docheck_Chamcong(status,from_){
		var alen=document.frmList_Chamcong.elements.length;
		alen=(alen>5)?document.frmList_Chamcong.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
			document.frmList_Chamcong.chkid[i].checked=status;
		}
		else{
			document.frmList_Chamcong.chkid.checked=status;
		}
		if(from_>0) document.frmList_Chamcong.chkall.checked=status;
	}
		
	function docheckone_Chamcong(){
		var alen=document.frmList_Chamcong.elements.length;
		var isChecked=true;
		alen=(alen>4)?document.frmList_Chamcong.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_Chamcong.chkid[i].checked==false)
					isChecked=false;
		}else{
			if(document.frmList_Chamcong.chkid.checked==false)
				isChecked=false;
		}				
		document.frmList_Chamcong.chkall.checked=isChecked;
	}
	
	function calculatechon_Chamcong(){			
		var strchon="";
		var alen=document.frmList_Chamcong.elements.length;				
		alen=(alen>2)?document.frmList_Chamcong.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_Chamcong.chkid[i].checked==true)
					strchon+=document.frmList_Chamcong.chkid[i].value+",";
		}else{
			if(document.frmList_Chamcong.chkid.checked==true)
				strchon=document.frmList_Chamcong.chkid.value;
		}
		document.frmList_Chamcong.chon_Chamcong.value=strchon;
	}
	
	function delItems_Chamcong(processurl,delStr){
		if (delStr == undefined){
			calculatechon_Chamcong();
			delStr = document.getElementById("chon_Chamcong").value;
		}
		if (delStr == ""){
			return false;
		}
		if(!confirm("THÔNG BÁO: \n\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
			return false;
		}	
		
		var numresult_Chamcong,order_Chamcong,curpage_Chamcong;
		numresult = $("#numresult_Chamcong").val();
		order = $("#order_Chamcong").val();
		curpage = $("#curpage_Chamcong").val();
		
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
				$('#user_content_main').fadeOut('fast').load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+curpage).fadeIn("fast");
			}
		});
	}
	
	function reloadPage_Chamcong(processurl){
		var numresult_Chamcong,order_Chamcong,cur_pos;
		numresult = $("#numresult_Chamcong").val();
		order = $("#order_Chamcong").val();
		cur_pos = 0;
		$("#user_content_main").load(processurl+"&numresult="+numresult+"&order="+order+"&cur_pos="+cur_pos);
	}
	
	function gotoPage_Chamcong(processurl,page){
		var numresult_Chamcong,order_Chamcong,cur_pos;
		numresult = $("#numresult_Chamcong").val();
		order = $("#order_Chamcong").val();
		//alert(processurl+'-'+page+'-'+numresult+'-'+order);
		$("#user_content_main").load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+page);
	}
	
	function uncheck_fns_Chamcong(field,val,id){
		$("#user_content_main").load("?listChamcong&mod=tinhluong&checkUncheck="+val+"&setfield="+field+"&checkUncheckID="+id);
	}
	
	function sort_me_Chamcong(id,val){
		$("#user_content_main").load("?listChamcong&mod=tinhluong&sort_me=1&cc_id="+id+"&val="+val);
	}
	
	function search_me_Chamcong(){
		var chucvu_id_seek = document.getElementById('chucvu_id_seek').value;
		if (chucvu_id_seek == 0){
			return false;
		}
		
		$.post('?listChamcong&mod=tinhluong',
			{chucvu_id_seek:chucvu_id_seek},
			function(data){
				$('#user_content_main').html(data);
				$("#user_content_main").show();
			}
		);
	}
	
	function edit_me_Chamcong(id){
		$("#user_content_main").load("?listChamcong&mod=tinhluong&edit_me=1&cc_id="+id);
	}
		
	$("#a_ref_Chamcong").click( function () { 
			$('#user_content_main').hide();
			$('#user_content_main').fadeOut('fast').load('index.php?listChamcong&mod=tinhluong').fadeIn("fast");
		});
</script>
{/literal}