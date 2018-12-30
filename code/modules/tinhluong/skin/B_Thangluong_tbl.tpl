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
	<form method="post" name="frmList_Thangluong" action="?listThangluong{$vars.arg}" id="frmList_Thangluong">
    <!------------------------------------------THEM MOI------------------------------------>
    <fieldset style="width:1162px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
    <legend class="legend_list">
        Thêm/Chỉnh sửa&nbsp;|&nbsp;Thông báo:&nbsp;
        <span id="lblError_Thangluong" class="error">Dấu (*) là các mục bắt buộc!</span>
        <span id="lblError_Thangluong_2" class="error">Hệ số và số năm phải là số!</span>
    </legend>
    	<table width="98%" cellspacing="0" cellpadding="0" border="0" style="margin-left:5px">
        	<tr height="10"><td colspan="4"></td></tr>
            <tr height="30">
            	<td align="center">
                	<div style="float:left; width:6%; line-height:25px; text-align:left">Chức vụ <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:18%; line-height:25px; text-align:left">
                    <select name="chucvu_id" id="chucvu_id" class="select_middle" onfocus="hide_message_Thangluong()">
                        <option value="0">Chọn chức vụ</option>
                        {section name=qi loop=$obj_list_object}
                        <option value="{$obj_list_object[qi]->object_id}" {if $obj_list_object[qi]->object_id eq $obj_info.chucvu_id}selected="selected"{/if}>-&nbsp;{$obj_list_object[qi]->object_name}</option>
                        {/section}
                    </select>
                    </div>
                    <div style="float:left; width:6%; line-height:25px; text-align:left">Bậc lương <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:8%; line-height:25px; text-align:left">
                    <input type="text" name="thangluong_bac" id="thangluong_bac" class="text_tiny" value="{$obj_info.thangluong_bac}" onfocus="hide_message_Thangluong()"/>
                    </div>
                    <div style="float:left; width:8%; line-height:25px; text-align:left">Hệ số lương <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:54%; line-height:25px; text-align:left">
                    <input type="text" name="thangluong_heso" id="thangluong_heso" class="text_tiny" value="{$obj_info.thangluong_heso}" onfocus="hide_message_Thangluong()"/>&nbsp;(dùng dấu (.) thay cho dấu (,). Ví dụ: 3,2 viết là 3.2. Lương chính thức = Lương cơ bản x hệ số lương)
                    </div>
                	<div style="float:left; width:6%; line-height:25px; text-align:left">Phân cấp <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:18%; line-height:25px; text-align:left">
                    	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            {if $obj_info.thangluong_hetbac neq ''}
                            <td width="35%">
                            <input type="radio" id="thangluong_hetbac" name="thangluong_hetbac" value="1" {if $obj_info.thangluong_hetbac eq 1} checked="checked" {/if} />&nbsp;Bậc cuối</td>
                            <td>
                            <input type="radio" id="thangluong_hetbac" name="thangluong_hetbac" value="2" {if $obj_info.thangluong_hetbac eq 2} checked="checked" {/if} />&nbsp;Còn bậc tiếp</td>
                            {else}
                            <td width="35%">
                            <input type="radio" id="thangluong_hetbac" name="thangluong_hetbac" value="1"/>&nbsp;Bậc cuối</td>
                            <td>
                            <input type="radio" id="thangluong_hetbac" name="thangluong_hetbac" value="2" checked/>&nbsp;Còn bậc tiếp</td>
                            {/if}
                          </tr>
                        </table>
                    </div>
                    <div style="float:left; width:6%; line-height:25px; text-align:left">Nâng bậc:</div>
                    <div style="float:left; width:30%; line-height:25px; text-align:left">
                    <input type="text" name="thangluong_sonam" id="thangluong_sonam" class="text_tiny" value="{$obj_info.thangluong_sonam}" onfocus="hide_message_Thangluong()"/>&nbsp;Năm (Không nhập nếu là bậc lương cuối)
                    </div>
                	<div style="float:left; width:6%; line-height:25px; text-align:left">Tình trạng :</div>
                    <div style="float:left; width:18%; line-height:25px; text-align:left">
                    	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            {if $obj_info.thangluong_active neq ''}
                            <td width="35%">
                            <input type="radio" id="thangluong_active" name="thangluong_active" value="1" {if $obj_info.thangluong_active eq 1} checked="checked" {/if} />&nbsp;Hiển thị</td>
                            <td>
                            <input type="radio" id="thangluong_active" name="thangluong_active" value="2" {if $obj_info.thangluong_active eq 2} checked="checked" {/if} />&nbsp;Không hiển thị</td>
                            {else}
                            <td width="35%">
                            <input type="radio" id="thangluong_active" name="thangluong_active" value="1" checked/>&nbsp;Hiển thị</td>
                            <td>
                            <input type="radio" id="thangluong_active" name="thangluong_active" value="2" />&nbsp;Không hiển thị</td>
                            {/if}
                          </tr>
                        </table>
                    </div>
                    <div style="float:left; line-height:25px; text-align:left">
                    	<input type="button" name="btnSub_Thangluong" id="btnSub_Thangluong" value="Ghi lại" class="button" />
                        <input type="hidden" name="thangluong_id" id="thangluong_id" value="{$obj_info.thangluong_id}">
                        <input type="reset" name="Reset" value="Hủy bỏ" class="button" />
                        {literal}
                        <script language="javascript">
                            function hide_message_Thangluong(){
                                $('#lblError_Thangluong').hide();
                                $('#lblError_Thangluong_2').hide();
                            }
                            
                            $(function() {
                            $('.error').hide();
                             
                            $("#btnSub_Thangluong").click(function() {
                                $('.error').hide();
                                
                                var $form = $("#frmList_Thangluong");
                                var chucvu_id = $form.find('select#chucvu_id :selected').val();
								var thangluong_bac = $form.find('input#thangluong_bac').val();
                                var thangluong_heso = $form.find('input#thangluong_heso').val();
								var thangluong_hetbac = $form.find('input#thangluong_hetbac:checked').val();
                                var thangluong_sonam = $form.find('input#thangluong_sonam').val();
                                var thangluong_active = $form.find('input#thangluong_active:checked').val();
                                var thangluong_id = $form.find('input#thangluong_id').val();
                                //begin validate form
                                if (chucvu_id == 0 || thangluong_bac == ""){
                                    $('#lblError_Thangluong').show();
                                }else if(isNaN(thangluong_heso) == true || isNaN(thangluong_sonam) == true){
                                    $('#lblError_Thangluong_2').show();
                                }else{
                                    var dataString  = "chucvu_id=" + chucvu_id;
										dataString += "&thangluong_bac=" + thangluong_bac;
                                        dataString += "&thangluong_heso=" + thangluong_heso;
										dataString += "&thangluong_hetbac=" + thangluong_hetbac;
                                        dataString += "&thangluong_sonam=" + thangluong_sonam;
                                        dataString += "&thangluong_active=" + thangluong_active;
                                        dataString += "&thangluong_id=" + thangluong_id +"";
                                        //alert (dataString);return false;
                                    $.ajax({
                                        type: "POST",
                                        url: "index.php?listThangluong&mod=tinhluong&add_edit=1",
                                        data: dataString,
                                        success: function(data) {
                                            $('#tinhluong_content_main').fadeOut('fast').load('index.php?listThangluong&mod=tinhluong').fadeIn("fast");
                                            //$('#lblMessage_Thangluong').show();
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
    <fieldset style="width:1162px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:273px">
    <legend class="legend_list_search">
        <div style="width:130px; float:left">Danh sách: {$total_num_result}</div>
        <div style="width:70px; float:left">&nbsp;|&nbsp;Tìm kiếm&nbsp;</div>
        <div style="width:155px; float:left">
        	<select name="chucvu_id_seek" id="chucvu_id_seek" class="select_seek" onfocus="hide_message_Thangluong()">
                <option value="0">Chọn chức vụ</option>
                {section name=qi loop=$obj_list_object}
                <option value="{$obj_list_object[qi]->object_id}" {if $obj_list_object[qi]->object_id eq $obj_info.chucvu_id}selected="selected"{/if}>-&nbsp;{$obj_list_object[qi]->object_name}</option>
                {/section}
            </select>
        </div>
        <div style="width:50px; float:left">
        	<input type="button" name="btnSeek" id="btnSeek" value="Tìm >>" class="button_seek" onclick="search_me_Thangluong()" /></div>
    </legend>
    	<div style="float:left; height:5px; width:100%"></div>
        <div style="float:left; height:25px; width:1142px; border-top:1px solid #99bbe8; border-bottom:1px solid #99bbe8 ">
            <div class="tbl_tit" style="width:30px; text-align:center"><b>STT</b></div>	
            <div class="tbl_tit" style="width:350px"><B>&nbsp;Chức vụ</B></div>
            <div class="tbl_tit" style="width:70px"><B>&nbsp;Bậc</B></div>
            <div class="tbl_tit" style="width:80px"><B>&nbsp;Phân cấp</B></div>
            <div class="tbl_tit" style="width:75px;text-align:right"><B>&nbsp;Hệ số&nbsp;</B></div>
            <div class="tbl_tit" style="width:150px;text-align:right"><B>&nbsp;Lương&nbsp;</B></div>
            <div class="tbl_tit" style="width:75px;text-align:right"><B>&nbsp;Số năm nâng&nbsp;</B></div>
            <div class="tbl_tit" style="width:80px"><B>&nbsp;Ngày tạo</B></div>
            <div class="tbl_tit" style="width:60px; text-align:center"><B>Sắp xếp</B></div>
            <div class="tbl_tit" style="width:60px; text-align:center"><B>Hiển thị</B></div>
            <div class="tbl_tit" style="width:60px; text-align:center"><B>Chọn</B></div>
            <div class="tbl_tit" style="width:40px; text-align:center">
            <input type="hidden" name="chon" id="chon_Thangluong">
            <input type="checkbox" name="chkall" value="0" onclick="docheck_Thangluong(document.frmList_Thangluong.chkall.checked,0);">
            </div>
        </div>
        <div style="float:left; width:20px; text-align:right">
        <input type="button" name="del_Items" id='del_Items' value="&nbsp;" onClick="delItems_Thangluong('{$processurl}');" style="width:17px; font-size:12px; background:url(../images/admin/b_drop.png); cursor:pointer" title="Xóa lựa chọn">
        </div>
        <div style="float:left; height:219px; width:1162px; overflow-y:scroll">
            {section name=pi loop=$obj_list}
            {if $smarty.section.pi.index is not div by 2} 
            {assign var="class_td" value="tbl_cont"} 
            {else}
            {assign var="class_td" value="tbl_cont2"} 
            {/if}
            {math x=$vars.curpage-1 y=$vars.numresult z=$smarty.section.pi.index t=1 equation="x*y+z+t" assign=stt}
            <div class="{$class_td}" style="width:30px; text-align:center">{$stt}</div>
            <div class="{$class_td}" style="width:350px">
            	&nbsp;
                {section name=qi loop=$obj_list_object}
                {if $obj_list_object[qi]->object_id eq $obj_list[pi]->chucvu_id}{$obj_list_object[qi]->object_name}{/if}
                {/section}
            </div>
            <div class="{$class_td}" style="width:70px">
            	&nbsp;{$obj_list[pi]->thangluong_bac|roman_format}
            </div>
            <div class="{$class_td}" style="width:80px">
                &nbsp;{if $obj_list[pi]->thangluong_hetbac eq 1}Bậc cuối{else}Còn tiếp{/if}
            </div>
            <div class="{$class_td}" style="width:75px; text-align:right">
            	&nbsp;{$obj_list[pi]->thangluong_heso}&nbsp;
            </div>
            <div class="{$class_td}" style="width:150px; text-align:right">
            	{math x=$obj_list[pi]->thangluong_heso y=$obj_owner[0]->site_logo  equation="x*y" assign=luong}
            	&nbsp;{$luong|price_format}&nbsp;
            </div>
            <div class="{$class_td}" style="width:75px; text-align:right">
            	{if $obj_list[pi]->thangluong_hetbac eq 1}&nbsp;Hết bậc&nbsp;{else}
            	&nbsp;{$obj_list[pi]->thangluong_sonam}&nbsp;
                {/if}
            </div>
            <div class="{$class_td}" style="width:80px">
            	&nbsp;{$obj_list[pi]->thangluong_date|date_format:"%d/%m/%Y"}
            </div>
            <div class="{$class_td}" style="width:60px; text-align:center">
                <select name="thangluong_sort[]" class="select_tiny" onchange="sort_me_Thangluong({$obj_list[pi]->thangluong_id},this.value)">
                {section name=i loop=$total_num_result}
                    <option value="{$smarty.section.i.index}" {if $smarty.section.i.index eq $obj_list[pi]->thangluong_sort} selected="selected"{/if}>{$smarty.section.i.index}</option>
                {/section}
                </select>
                <input type="hidden" name="thangluong_id1[]" value="{$obj_list[pi]->thangluong_id}">
            </div>
            <div class="{$class_td}" style="width:60px; text-align:center">
                {if $obj_list[pi]->thangluong_active eq 1}
                    <a href='javascript: void(0);' onclick="uncheck_fns_Thangluong('thangluong_active',2,{$obj_list[pi]->thangluong_id})"><img src="../images/admin/tick.png" width="10" height="10" border="0" title="Ẩn"></a>
                {else}
                    <a href='javascript: void(0);' onclick="uncheck_fns_Thangluong('thangluong_active',1,{$obj_list[pi]->thangluong_id})"><img src="../images/admin/publish_x.png" width="10" height="10" border="0" title="Hiện"></a>
                {/if}
            </div>
            <div class="{$class_td}" style="width:30px; text-align:center">
                <a href='javascript: void(0);' onclick="edit_me_Thangluong({$obj_list[pi]->thangluong_id})">
                <img src="../images/admin/b_edit.png" width="11" height="11" border="0" title="Sửa"></a>
            </div>
            <div class="{$class_td}" style="width:29px; text-align:center">
                <a href='javascript: void(0)' onClick="delItems_Thangluong('{$processurl}', {$obj_list[pi]->thangluong_id});">
                <img src="../images/admin/b_drop.png" width="11" height="11" border="0" title="Xóa"></a>
            </div>
            <div class="{$class_td}" style="width:40px; text-align:center">
            	<input type="checkbox" name="chkid" value="{$obj_list[pi]->thangluong_id}" onclick="docheckone_Thangluong();">
            </div>
            {/section}
        </div>
        <input type="hidden" id="curpage_Thangluong" name="curpage" value="{$vars.curpage}" />
    </fieldset>
    </form>
</div>
<!------------------------------------------------- Tool bar --------------------------------------------->
<div id="user_clear_txt"></div>
<div id="user_tool_bar">

    <div id="user_search_area">
    <select name="order" id = "order_Thangluong" style="width:120px; font-size:12px; border:1px solid #99bbe8" onchange="reloadPage_Thangluong('{$processurl}');">
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
    <a href="javascript: void(0)" id="first_page" onclick="gotoPage_Thangluong('{$processurl}',parseInt(1));" title="Trang đầu">
    	<img src="{$css_path}icon_first_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="pre_page" onclick="gotoPage_Thangluong('{$processurl}',parseInt(document.getElementById('page_Thangluong').value)-parseInt(1));" title="Trang trước">
    	<img src="{$css_path}icon_pre_page.png" class="img_all">
    </a>
    {/if}
    </div>
    <div style="float:left; line-height:19px">
        <div style="float:left; width:35px">Trang</div> 
        <div style="float:left; width:35px">
        <input type="text" value="{$vars.curpage}" name="page" id="page_Thangluong" onblur=" gotoPage_Thangluong('{$processurl}',this.value);" style="width:30px; font-size:12px; height:15px; border:1px solid #99bbe8">
        </div>
        <div style="float:left; width:42px"> / {$num_page}</div>
    </div>
    <div id="user_page_area">
    {if $vars.curpage eq $num_page}
    	<img src="{$css_path}icon_next_page.png" class="img_all">
        <img src="{$css_path}icon_last_page.png" class="img_all">
    {else}
    <a href="javascript: void(0)" id="next_page" onclick="gotoPage_Thangluong('{$processurl}',parseInt(document.getElementById('page_Thangluong').value)+parseInt(1));" title="Trang tiếp">
    	<img src="{$css_path}icon_next_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="last_page" onclick="gotoPage_Thangluong('{$processurl}',parseInt({$num_page}));" title="Trang cuối">
    	<img src="{$css_path}icon_last_page.png" class="img_all">
    </a>
    {/if}
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:left; width:15px">
    <a href="javascript: void(0)" id="a_ref_Thangluong" title="Tải lại"><img src="{$css_path}icon_refresh.png" class="img_all"></a>
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:right; line-height:19px; margin-right:2px">
        <div style="float:left; width:40px">Xem</div>
        <div style="float:left; width:52px">
            <select name="numresult" id="numresult_Thangluong" style="width:50px; font-size:12px; border:1px solid #99bbe8" onchange="reloadPage_Thangluong('{$processurl}');">
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
	function docheck_Thangluong(status,from_){
		var alen=document.frmList_Thangluong.elements.length;
		alen=(alen>5)?document.frmList_Thangluong.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
			document.frmList_Thangluong.chkid[i].checked=status;
		}
		else{
			document.frmList_Thangluong.chkid.checked=status;
		}
		if(from_>0) document.frmList_Thangluong.chkall.checked=status;
	}
		
	function docheckone_Thangluong(){
		var alen=document.frmList_Thangluong.elements.length;
		var isChecked=true;
		alen=(alen>4)?document.frmList_Thangluong.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_Thangluong.chkid[i].checked==false)
					isChecked=false;
		}else{
			if(document.frmList_Thangluong.chkid.checked==false)
				isChecked=false;
		}				
		document.frmList_Thangluong.chkall.checked=isChecked;
	}
	
	function calculatechon_Thangluong(){			
		var strchon="";
		var alen=document.frmList_Thangluong.elements.length;				
		alen=(alen>2)?document.frmList_Thangluong.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_Thangluong.chkid[i].checked==true)
					strchon+=document.frmList_Thangluong.chkid[i].value+",";
		}else{
			if(document.frmList_Thangluong.chkid.checked==true)
				strchon=document.frmList_Thangluong.chkid.value;
		}
		document.frmList_Thangluong.chon_Thangluong.value=strchon;
	}
	
	function delItems_Thangluong(processurl,delStr){
		if (delStr == undefined){
			calculatechon_Thangluong();
			delStr = document.getElementById("chon_Thangluong").value;
		}
		if (delStr == ""){
			return false;
		}
		if(!confirm("THÔNG BÁO: \n\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
			return false;
		}	
		
		var numresult_Thangluong,order_Thangluong,curpage_Thangluong;
		numresult = $("#numresult_Thangluong").val();
		order = $("#order_Thangluong").val();
		curpage = $("#curpage_Thangluong").val();
		
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
	
	function reloadPage_Thangluong(processurl){
		var numresult_Thangluong,order_Thangluong,cur_pos;
		numresult = $("#numresult_Thangluong").val();
		order = $("#order_Thangluong").val();
		cur_pos = 0;
		$("#tinhluong_content_main").load(processurl+"&numresult="+numresult+"&order="+order+"&cur_pos="+cur_pos);
	}
	
	function gotoPage_Thangluong(processurl,page){
		var numresult_Thangluong,order_Thangluong,cur_pos;
		numresult = $("#numresult_Thangluong").val();
		order = $("#order_Thangluong").val();
		//alert(processurl+'-'+page+'-'+numresult+'-'+order);
		$("#tinhluong_content_main").load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+page);
	}
	
	function uncheck_fns_Thangluong(field,val,id){
		$("#tinhluong_content_main").load("?listThangluong&mod=tinhluong&checkUncheck="+val+"&setfield="+field+"&checkUncheckID="+id);
	}
	
	function sort_me_Thangluong(id,val){
		$("#tinhluong_content_main").load("?listThangluong&mod=tinhluong&sort_me=1&thangluong_id="+id+"&val="+val);
	}
	
	function search_me_Thangluong(){
		var chucvu_id_seek = document.getElementById('chucvu_id_seek').value;
		if (chucvu_id_seek == 0){
			return false;
		}
		
		$.post('?listThangluong&mod=tinhluong',
			{chucvu_id_seek:chucvu_id_seek},
			function(data){
				$('#tinhluong_content_main').html(data);
				$("#tinhluong_content_main").show();
			}
		);
	}
	
	function edit_me_Thangluong(id){
		$("#tinhluong_content_main").load("?listThangluong&mod=tinhluong&edit_me=1&thangluong_id="+id);
	}
		
	$("#a_ref_Thangluong").click( function () { 
			$('#tinhluong_content_main').hide();
			$('#tinhluong_content_main').fadeOut('fast').load('index.php?listThangluong&mod=tinhluong').fadeIn("fast");
		});
</script>
{/literal}