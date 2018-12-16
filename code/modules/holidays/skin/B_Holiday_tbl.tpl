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
<div id="config_content_insign">
	<form method="post" name="frmList_Holiday" action="?listHoliday{$vars.arg}" id="frmList_Holiday">
    <!------------------------------------------THEM MOI------------------------------------>
    <fieldset style="width:545px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
    <legend class="legend_list_config">
        Thêm/Chỉnh sửa&nbsp;|&nbsp;Thông báo:&nbsp;
        <span id="lblError_Holiday" class="error">Mời bạn nhập đủ dữ liệu!</span>
    </legend>
    	<table width="98%" cellspacing="0" cellpadding="0" border="0" style="margin-left:5px">
        	<tr height="10"><td colspan="4"></td></tr>
            <tr height="30">
                <td width="20%" align="left" height="20">Ngày nghỉ <font color="#FF0000">*</font>:</td>		
                <td align="left">
                <input type="text" name="holiday_date" id="holiday_date" class="text_short" value="{$obj_info.holiday_date|date_format:'%d/%m/%Y'}" readonly/>
                <img src="../images/admin/img.gif" align="absmiddle" id="icon_date01" style="cursor: pointer; border:0" title="Chọn ngày trên lịch"/>
                {literal}
                <script type="text/javascript">
                    Calendar.setup({
                        inputField   :   "holiday_date",
                        ifFormat     :   "%d/%m/%Y",
                        button       :   "icon_date01",
                        align        :   "Br",  
                        timeFormat   :   "24",
                        showsTime    :   true,
                        singleClick  :   true
                    });
                </script>
                {/literal}
                </td>
                <td align="left">Mô tả <font color="#FF0000">*</font>:</td>
                <td align="left">
                <input type="text" id="holiday_name" name="holiday_name" class="text_short" value="{$obj_info.holiday_name}" onfocus="hide_message_Holiday()"/>
                </td>
            </tr>
            <tr height="30">
                <td align="left" height="20">Tình trạng :</td>		
                <td align="left" colspan="3">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                      	{if $obj_info.holiday_active neq ''}
                        <td width="20%">
                        <input type="radio" id="holiday_active" name="holiday_active" value="1" {if $obj_info.holiday_active eq 1} checked="checked" {/if} />&nbsp;Hiển thị</td>
                        <td>
                        <input type="radio" id="holiday_active" name="holiday_active" value="2" {if $obj_info.holiday_active eq 2} checked="checked" {/if} />&nbsp;Không hiển thị</td>
                        {else}
                        <td width="20%">
                        <input type="radio" id="holiday_active" name="holiday_active" value="1" checked/>&nbsp;Hiển thị</td>
                        <td>
                        <input type="radio" id="holiday_active" name="holiday_active" value="2" />&nbsp;Không hiển thị</td>
                        {/if}
                      </tr>
                    </table>
                </td>
            </tr>
            <tr height="30">
                <td>&nbsp;</td>
                <td align="left" colspan="3">
                <input type="button" name="btnSub_Holiday" id="btnSub_Holiday" value="Ghi lại" class="button" />
                <input type="hidden" name="holiday_id" id="holiday_id" value="{$obj_info.holiday_id}">
                <input type="reset" name="Reset" value="Hủy bỏ" class="button" />
                {literal}
				<script language="javascript">
					function hide_message_Holiday(){
						$('#lblMessage_Holiday').hide();
						$('#lblError_Holiday').hide();
					}
					
					$(function() {
					$('.error').hide();
					$('#lblMessage_Holiday').hide();
					 
					$("#btnSub_Holiday").click(function() {
						$('.error').hide();
						 
						var $form = $("#frmList_Holiday");
						var holiday_date = $form.find('input#holiday_date').val();
						var holiday_name = $form.find('input#holiday_name').val();
						var holiday_active = $form.find('input#holiday_active:checked').val();
						var holiday_id = $form.find('input#holiday_id').val();
						 
						//begin validate form
						if (holiday_name == ""){
							$('#lblError_Holiday').show();
						}
						else{
							var dataString  = "holiday_date=" + holiday_date;
								dataString += "&holiday_name=" + holiday_name;
								dataString += "&holiday_active=" + holiday_active;
								dataString += "&holiday_id=" + holiday_id +"";
								//alert (dataString);return false;
							$.ajax({
								type: "POST",
								url: "index.php?listHoliday&mod=holidays&add_edit=1",
								data: dataString,
								success: function(data) {
									$('#config_content_main').fadeOut('fast').load('index.php?listHoliday&mod=holidays').fadeIn("fast");
									//$('#lblMessage_Holiday').show();
								}
							});
							return false;
						}
						//end form
					});
				});
                </script>
                {/literal}
                </td>
            </tr>
        </table>
    </fieldset>
    
    <!------------------------------------DANH SACH---------------------------------------------->
    <fieldset style="width:545px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:285px">
    <legend class="legend_list_config">
        <div style="width:130px; float:left">Danh sách: {$total_num_result}</div>
        <div style="width:70px; float:left">&nbsp;|&nbsp;Tìm kiếm&nbsp;</div>
        <div style="width:100px; float:left">
        	<input type="text" name="keyword" id="keyword" class="text_seek" value="{$vars.keyword}"/>
            <input type="hidden" id="processurl" value="{$processurl}" />
        </div>
        <div style="width:50px; float:left">
        	<input type="button" name="btnSeek" id="btnSeek" value="Tìm >>" class="button_seek" onclick="search_me_Holiday()" /></div>
    </legend>
    	<div style="float:left; height:5px; width:100%"></div>
        <div style="float:left; height:25px; width:520px; border-top:1px solid #99bbe8; border-bottom:1px solid #99bbe8 ">
            <div class="tbl_tit" style="width:30px; text-align:center"><b>STT</b></div>	
            <div class="tbl_tit" style="width:79px"><B>&nbsp;Ngày nghỉ</B></div>
            <div class="tbl_tit" style="width:188px"><B>&nbsp;Mô tả</B></div>
            <div class="tbl_tit" style="width:59px; text-align:center"><B>Sắp xếp</B></div>
            <div class="tbl_tit" style="width:59px; text-align:center"><B>Hiển thị</B></div>
            <div class="tbl_tit" style="width:59px; text-align:center"><B>Chọn</B></div>
            <div class="tbl_tit" style="width:39px; text-align:center">
            <input type="hidden" name="chon" id="chon_Holiday">
            <input type="checkbox" name="chkall" value="0" onclick="docheck_Holiday(document.frmList_Holiday.chkall.checked,0);">
            </div>
        </div>
        <div style="float:left; width:20px; text-align:right">
        <input type="button" name="del_Items" id='del_Items' value="&nbsp;" onClick="delItems_Holiday('{$processurl}');" style="width:17px; font-size:12px; background:url(../images/admin/b_drop.png); cursor:pointer" title="Xóa lựa chọn">
        </div>
        <div style="float:left; height:230px; width:540px; overflow-y:scroll">
            {section name=pi loop=$obj_list}
            {if $smarty.section.pi.index is not div by 2} 
            {assign var="class_td" value="tbl_cont"} 
            {else}
            {assign var="class_td" value="tbl_cont2"} 
            {/if}
            {math x=$vars.curpage-1 y=$vars.numresult z=$smarty.section.pi.index t=1 equation="x*y+z+t" assign=stt}
            <div class="{$class_td}" style="width:30px; text-align:center">{$stt}</div>
            <div class="{$class_td}" style="width:79px">
            	&nbsp;<a href="javascript: void(0);" onclick="edit_me_Holiday({$obj_list[pi]->holiday_id})" >{$obj_list[pi]->holiday_date|date_format:"%d/%m/%Y"}</a>
            </div>
            <div class="{$class_td}" style="width:188px" title="{$obj_list[pi]->holiday_name}">
            	&nbsp;{$obj_list[pi]->holiday_name|str_string_cut:"35":"1"}
            </div>
            <div class="{$class_td}" style="width:59px; text-align:center">
                <select name="holiday_sort[]" class="select_tiny" onchange="sort_me_Holiday({$obj_list[pi]->holiday_id},this.value)">
                {section name=i loop=$total_num_result}
                    <option value="{$smarty.section.i.index}" {if $smarty.section.i.index eq $obj_list[pi]->holiday_sort} selected="selected"{/if}>{$smarty.section.i.index}</option>
                {/section}
                </select>
                <input type="hidden" name="holiday_id1[]" value="{$obj_list[pi]->holiday_id}">
            </div>
            <div class="{$class_td}" style="width:59px; text-align:center">
                {if $obj_list[pi]->holiday_active eq 1}
                    <a href='javascript: void(0);' onclick="uncheck_fns_Holiday('holiday_active',2,{$obj_list[pi]->holiday_id})"><img src="../images/admin/tick.png" width="10" height="10" border="0" title="Ẩn"></a>
                {else}
                    <a href='javascript: void(0);' onclick="uncheck_fns_Holiday('holiday_active',1,{$obj_list[pi]->holiday_id})"><img src="../images/admin/publish_x.png" width="10" height="10" border="0" title="Hiện"></a>
                {/if}
            </div>
            <div class="{$class_td}" style="width:29px; text-align:center">
                <a href='javascript: void(0);' onclick="edit_me_Holiday({$obj_list[pi]->holiday_id})">
                <img src="../images/admin/b_edit.png" width="11" height="11" border="0" title="Sửa"></a>
            </div>
            <div class="{$class_td}" style="width:29px; text-align:center">
                <a href='javascript: void(0'  onClick="delItems_Holiday('{$processurl}', {$obj_list[pi]->holiday_id});">
                <img src="../images/admin/b_drop.png" width="11" height="11" border="0" title="Xóa"></a>
            </div>
            <div class="{$class_td}" style="width:39px; text-align:center">
            	<input type="checkbox" name="chkid" value="{$obj_list[pi]->holiday_id}" onclick="docheckone_Holiday();">
            </div>
            {/section}
        </div>
        <input type="hidden" id="curpage_Holiday" name="curpage" value="{$vars.curpage}" />
    </fieldset>
    </form>
</div>
<!------------------------------------------------- Tool bar --------------------------------------------->
<div id="config_clear_txt"></div>
<div id="config_tool_bar">

    <div id="config_search_area">
    <select name="order" id="order_Holiday" style="width:120px; font-size:12px; border:1px solid #99bbe8" onchange="reloadPage_Holiday('{$processurl}');">
    {section name=sli loop=$order_arr}
        <option value="{$smarty.section.sli.index}" {if $smarty.section.sli.index eq $vars.order}selected{/if} >
        {$order_arr[sli]}
        </option>
    {/section}
    </select>
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div id="config_page_area">
    {if $vars.curpage eq 1}
    	<img src="{$css_path}icon_first_page.png" class="img_all">
    	<img src="{$css_path}icon_pre_page.png" class="img_all">
    {else}
    <a href="javascript: void(0)" id="first_page" onclick="gotoPage_Holiday('{$processurl}',parseInt(1));" title="Trang đầu">
    	<img src="{$css_path}icon_first_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="pre_page" onclick="gotoPage_Holiday('{$processurl}',parseInt(document.getElementById('page').value)-parseInt(1));" title="Trang trước">
    	<img src="{$css_path}icon_pre_page.png" class="img_all">
    </a>
    {/if}
    </div>
    <div style="float:left; line-height:19px">
        <div style="float:left; width:35px">Trang</div> 
        <div style="float:left; width:35px">
        <input type="text" value="{$vars.curpage}" name="page" id="page" onblur=" gotoPage_Holiday('{$processurl}',this.value);" style="width:30px; font-size:12px; height:15px; border:1px solid #99bbe8">
        </div>
        <div style="float:left; width:42px"> / {$num_page}</div>
    </div>
    <div id="config_page_area">
    {if $vars.curpage eq $num_page}
    	<img src="{$css_path}icon_next_page.png" class="img_all">
        <img src="{$css_path}icon_last_page.png" class="img_all">
    {else}
    <a href="javascript: void(0)" id="next_page" onclick="gotoPage_Holiday('{$processurl}',parseInt(document.getElementById('page').value)+parseInt(1));" title="Trang tiếp">
    	<img src="{$css_path}icon_next_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="last_page" onclick="gotoPage_Holiday('{$processurl}',parseInt({$num_page}));" title="Trang cuối">
    	<img src="{$css_path}icon_last_page.png" class="img_all">
    </a>
    {/if}
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:left; width:15px">
    <a href="javascript: void(0)" id="a_ref_Holiday" title="Tải lại"><img src="{$css_path}icon_refresh.png" class="img_all"></a>
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:right; line-height:19px; margin-right:12px">
        <div style="float:left; width:30px">Xem</div>
        <div style="float:left; width:52px">
            <select name="numresult" id="numresult_Holiday" style="width:50px; font-size:12px; border:1px solid #99bbe8" onchange="reloadPage_Holiday('{$processurl}');">
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
	function docheck_Holiday(status,from_){
		var alen=document.frmList_Holiday.elements.length;
		alen=(alen>5)?document.frmList_Holiday.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
			document.frmList_Holiday.chkid[i].checked=status;
		}
		else{
			document.frmList_Holiday.chkid.checked=status;
		}
		if(from_>0) document.frmList_Holiday.chkall.checked=status;
	}
		
	function docheckone_Holiday(){
		var alen=document.frmList_Holiday.elements.length;

		var isChecked=true;
		alen=(alen>4)?document.frmList_Holiday.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_Holiday.chkid[i].checked==false)
					isChecked=false;
		}else{
			if(document.frmList_Holiday.chkid.checked==false)
				isChecked=false;
		}				
		document.frmList_Holiday.chkall.checked=isChecked;
	}
	
	function calculatechon_Holiday(){			
		var strchon="";
		var alen=document.frmList_Holiday.elements.length;				
		alen=(alen>2)?document.frmList_Holiday.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_Holiday.chkid[i].checked==true)
					strchon+=document.frmList_Holiday.chkid[i].value+",";
		}else{
			if(document.frmList_Holiday.chkid.checked==true)
				strchon=document.frmList_Holiday.chkid.value;
		}
		document.frmList_Holiday.chon_Holiday.value=strchon;
	}
	
	function delItems_Holiday(processurl,delStr){
		if (delStr == undefined){
			calculatechon_Holiday();
			delStr = document.getElementById("chon_Holiday").value;
		}
		if (delStr == ""){
			return false;
		}
		if(!confirm("THÔNG BÁO: \n\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
			return false;
		}	
		
		var numresult_Holiday,order_Holiday,curpage_Holiday;
		numresult = $("#numresult_Holiday").val();
		order = $("#order_Holiday").val();
		curpage = $("#curpage_Holiday").val();
		
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
				$('#config_content_main').fadeOut('fast').load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+curpage).fadeIn("fast");
			}
		});
	}
	
	function reloadPage_Holiday(processurl){
		var numresult_Holiday,order_Holiday,cur_pos;
		numresult = $("#numresult_Holiday").val();
		order = $("#order_Holiday").val();
		cur_pos = 0;
		$("#config_content_main").load(processurl+"&numresult="+numresult+"&order="+order+"&cur_pos="+cur_pos);
	}
	
	function gotoPage_Holiday(processurl,page){
		var numresult_Holiday,order_Holiday,cur_pos;
		numresult = $("#numresult_Holiday").val();
		order = $("#order_Holiday").val();
		//alert(processurl+'-'+page+'-'+numresult+'-'+order);
		$("#config_content_main").load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+page);
	}
	
	function uncheck_fns_Holiday(field,val,id){
		$("#config_content_main").load("?listHoliday&mod=holidays&checkUncheck="+val+"&setfield="+field+"&checkUncheckID="+id);
	}
	
	function sort_me_Holiday(id,val){
		$("#config_content_main").load("?listHoliday&mod=holidays&sort_me=1&holiday_id="+id+"&val="+val);
	}
	
	function search_me_Holiday(){
		var keyword = document.getElementById('keyword').value;
		if (keyword == ""){
			return false;
		}
		
		$.post('?listHoliday&mod=holidays',
			{keyword:keyword},
			function(data){
				$('#config_content_main').html(data);
				$("#config_content_main").show();
			}
		);
	}
	
	function edit_me_Holiday(id){
		$("#config_content_main").load("?listHoliday&mod=holidays&edit_me=1&holiday_id="+id);
	}
		
	$("#a_ref_Holiday").click( function () { 
			$('#config_content_main').hide();
			$('#config_content_main').fadeOut('fast').load('index.php?listHoliday&mod=holidays').fadeIn("fast");
		});
</script>
{/literal}