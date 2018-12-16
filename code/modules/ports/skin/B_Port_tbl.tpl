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
	<form method="post" name="frmList_Port" action="?listPort{$vars.arg}" id="frmList_Port">
    <!------------------------------------------THEM MOI------------------------------------>
    <fieldset style="width:545px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
        <legend class="legend_list_config">
            Thêm/Chỉnh sửa&nbsp;|&nbsp;Thông báo:&nbsp;
            <span id="lblError_Port" class="error">Mời bạn nhập đủ dữ liệu!</span>
        </legend>
    	<table width="98%" cellspacing="0" cellpadding="0" border="0" style="margin-left:5px">
        	<tr height="10"><td></td></tr>
            <tr height="30">
                <td width="20%" align="left" height="20">Tên cổng <font color="#FF0000">*</font>:</td>		
                <td align="left">
                <input type="text" id="port_name" name="port_name" class="text_short" value="{$obj_info.port_name}" onfocus="hide_message_Port()"/>
                </td>
            </tr>
            <tr height="30">
                <td align="left" height="20">Tình trạng :</td>		
                <td align="left">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                      	{if $obj_info.port_active neq ''}
                        <td width="20%">
                        <input type="radio" id="port_active" name="port_active" value="1" {if $obj_info.port_active eq 1} checked="checked" {/if} />&nbsp;Hiển thị</td>
                        <td>
                        <input type="radio" id="port_active" name="port_active" value="2" {if $obj_info.port_active eq 2} checked="checked" {/if} />&nbsp;Không hiển thị</td>
                        {else}
                        <td width="20%">
                        <input type="radio" id="port_active" name="port_active" value="1" checked/>&nbsp;Hiển thị</td>
                        <td>
                        <input type="radio" id="port_active" name="port_active" value="2" />&nbsp;Không hiển thị</td>
                        {/if}
                      </tr>
                    </table>
                </td>
            </tr>
            <tr height="30">
                <td>&nbsp;</td>
                <td align="left">
                <input type="button" name="btnSub_Port" id="btnSub_Port" value="Ghi lại" class="button" />
                <input type="hidden" name="port_id" id="port_id" value="{$obj_info.port_id}">
                <input type="reset" name="Reset" value="Hủy bỏ" class="button" />
                {literal}
				<script language="javascript">
					function hide_message_Port(){
						$('#lblMessage_Port').hide();
						$('#lblError_Port').hide();
					}
					
					$(function() {
					$('.error').hide();
					$('#lblMessage_Port').hide();
					 
					$("#btnSub_Port").click(function() {
						$('.error').hide();
						 
						var $form = $("#frmList_Port");
						var port_name = $form.find('input#port_name').val();
						var port_active = $form.find('input#port_active:checked').val();
						var port_id = $form.find('input#port_id').val();
						 
						//begin validate form
						if (port_name == ""){
							$('#lblError_Port').show();
						}
						else{
							var dataString  = "port_name=" + port_name;
								dataString += "&port_active=" + port_active;
								dataString += "&port_id=" + port_id +"";
								//alert (dataString);return false;
							$.ajax({
								type: "POST",
								url: "index.php?listPort&mod=ports&add_edit=1",
								data: dataString,
								success: function(data) {
									$('#config_content_main').fadeOut('fast').load('index.php?listPort&mod=ports').fadeIn("fast");
									//$('#lblMessage_Port').show();
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
        	<input type="button" name="btnSeek" id="btnSeek" value="Tìm >>" class="button_seek" onclick="search_me_Port()" /></div>
    </legend>
    	<div style="float:left; height:5px; width:100%"></div>
        <div style="float:left; height:25px; width:520px; border-top:1px solid #99bbe8; border-bottom:1px solid #99bbe8 ">
            <div class="tbl_tit" style="width:30px; text-align:center"><b>STT</b></div>	
            <div class="tbl_tit" style="width:168px"><B>&nbsp;Tên cổng</B></div>
            <div class="tbl_tit" style="width:99px"><B>&nbsp;Ngày nhập</B></div>
            <div class="tbl_tit" style="width:59px; text-align:center"><B>Sắp xếp</B></div>
            <div class="tbl_tit" style="width:59px; text-align:center"><B>Hiển thị</B></div>
            <div class="tbl_tit" style="width:59px; text-align:center"><B>Chọn</B></div>
            <div class="tbl_tit" style="width:39px; text-align:center">
            <input type="hidden" name="chon" id="chon_Port">
            <input type="checkbox" name="chkall" value="0" onclick="docheck_Port(document.frmList_Port.chkall.checked,0);">
            </div>
        </div>
        <div style="float:left; width:20px; text-align:right">
        <input type="button" name="del_Items" id='del_Items' value="&nbsp;" onClick="delItems_Port('{$processurl}');" style="width:17px; font-size:12px; background:url(../images/admin/b_drop.png); cursor:pointer" title="Xóa lựa chọn">
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
            <div class="{$class_td}" style="width:168px">
            	&nbsp;<a href="javascript: void(0);" onclick="edit_me_Port({$obj_list[pi]->port_id})" >{$obj_list[pi]->port_name}</a>
            </div>
            <div class="{$class_td}" style="width:99px">
            	&nbsp;{$obj_list[pi]->port_date|date_format:"%d-%m-%Y"}
            </div>
            <div class="{$class_td}" style="width:59px; text-align:center">
                <select name="port_sort[]" class="select_tiny" onchange="sort_me_Port({$obj_list[pi]->port_id},this.value)">
                {section name=i loop=$total_num_result}
                    <option value="{$smarty.section.i.index}" {if $smarty.section.i.index eq $obj_list[pi]->port_sort} selected="selected"{/if}>{$smarty.section.i.index}</option>
                {/section}
                </select>
                <input type="hidden" name="port_id1[]" value="{$obj_list[pi]->port_id}">
            </div>
            <div class="{$class_td}" style="width:59px; text-align:center">
                {if $obj_list[pi]->port_active eq 1}
                    <a href='javascript: void(0);' onclick="uncheck_fns_Port('port_active',2,{$obj_list[pi]->port_id})"><img src="../images/admin/tick.png" width="10" height="10" border="0" title="Ẩn"></a>
                {else}
                    <a href='javascript: void(0);' onclick="uncheck_fns_Port('port_active',1,{$obj_list[pi]->port_id})"><img src="../images/admin/publish_x.png" width="10" height="10" border="0" title="Hiện"></a>
                {/if}
            </div>
            <div class="{$class_td}" style="width:29px; text-align:center">
                <a href='javascript: void(0);' onclick="edit_me_Port({$obj_list[pi]->port_id})">
                <img src="../images/admin/b_edit.png" width="11" height="11" border="0" title="Sửa"></a>
            </div>
            <div class="{$class_td}" style="width:29px; text-align:center">
                <a href='javascript: void(0'  onClick="delItems_Port('{$processurl}', {$obj_list[pi]->port_id});">
                <img src="../images/admin/b_drop.png" width="11" height="11" border="0" title="Xóa"></a>
            </div>
            <div class="{$class_td}" style="width:39px; text-align:center">
            	<input type="checkbox" name="chkid" value="{$obj_list[pi]->port_id}" onclick="docheckone_Port();">
            </div>
            {/section}
        </div>
        <input type="hidden" id="curpage_Port" name="curpage" value="{$vars.curpage}" />
    </fieldset>
    </form>
</div>
<!------------------------------------------------- Tool bar --------------------------------------------->
<div id="config_clear_txt"></div>
<div id="config_tool_bar">

    <div id="config_search_area">
    <select name="order" id="order_Port" style="width:120px; font-size:12px; border:1px solid #99bbe8" onchange="reloadPage_Port('{$processurl}');">
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
    <a href="javascript: void(0)" id="first_page" onclick="gotoPage_Port('{$processurl}',parseInt(1));" title="Trang đầu">
    	<img src="{$css_path}icon_first_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="pre_page" onclick="gotoPage_Port('{$processurl}',parseInt(document.getElementById('page_Port').value)-parseInt(1));" title="Trang trước">
    	<img src="{$css_path}icon_pre_page.png" class="img_all">
    </a>
    {/if}
    </div>
    <div style="float:left; line-height:19px">
        <div style="float:left; width:35px">Trang</div> 
        <div style="float:left; width:35px">
        <input type="text" value="{$vars.curpage}" name="page" id="page_Port" onblur=" gotoPage_Port('{$processurl}',this.value);" style="width:30px; font-size:12px; height:15px; border:1px solid #99bbe8">
        </div>
        <div style="float:left; width:42px"> / {$num_page}</div>
    </div>
    <div id="config_page_area">
    {if $vars.curpage eq $num_page}
    	<img src="{$css_path}icon_next_page.png" class="img_all">
        <img src="{$css_path}icon_last_page.png" class="img_all">
    {else}
    <a href="javascript: void(0)" id="next_page" onclick="gotoPage_Port('{$processurl}',parseInt(document.getElementById('page_Port').value)+parseInt(1));" title="Trang tiếp">
    	<img src="{$css_path}icon_next_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="last_page" onclick="gotoPage_Port('{$processurl}',parseInt({$num_page}));" title="Trang cuối">
    	<img src="{$css_path}icon_last_page.png" class="img_all">
    </a>
    {/if}
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:left; width:15px">
    <a href="javascript: void(0)" id="a_ref_Port" title="Tải lại"><img src="{$css_path}icon_refresh.png" class="img_all"></a>
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:right; line-height:19px; margin-right:12px">
        <div style="float:left; width:30px">Xem</div>
        <div style="float:left; width:52px">
            <select name="numresult" id="numresult_Port" style="width:50px; font-size:12px; border:1px solid #99bbe8" onchange="reloadPage_Port('{$processurl}');">
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
	function docheck_Port(status,from_){
		var alen=document.frmList_Port.elements.length;
		alen=(alen>5)?document.frmList_Port.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
			document.frmList_Port.chkid[i].checked=status;
		}
		else{
			document.frmList_Port.chkid.checked=status;
		}
		if(from_>0) document.frmList_Port.chkall.checked=status;
	}
		
	function docheckone_Port(){
		var alen=document.frmList_Port.elements.length;

		var isChecked=true;
		alen=(alen>4)?document.frmList_Port.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_Port.chkid[i].checked==false)
					isChecked=false;
		}else{
			if(document.frmList_Port.chkid.checked==false)
				isChecked=false;
		}				
		document.frmList_Port.chkall.checked=isChecked;
	}
	
	function calculatechon_Port(){			
		var strchon="";
		var alen=document.frmList_Port.elements.length;				
		alen=(alen>2)?document.frmList_Port.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_Port.chkid[i].checked==true)
					strchon+=document.frmList_Port.chkid[i].value+",";
		}else{
			if(document.frmList_Port.chkid.checked==true)
				strchon=document.frmList_Port.chkid.value;
		}
		document.frmList_Port.chon_Port.value=strchon;
	}
	
	function delItems_Port(processurl,delStr){
		if (delStr == undefined){
			calculatechon_Port();
			delStr = document.getElementById("chon_Port").value;
		}
		if (delStr == ""){
			return false;
		}
		if(!confirm("THÔNG BÁO: \n\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
			return false;
		}	
		
		var numresult_Port,order_Port,curpage_Port;
		numresult = $("#numresult_Port").val();
		order = $("#order_Port").val();
		curpage = $("#curpage_Port").val();
		
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
	
	function reloadPage_Port(processurl){
		var numresult_Port,order_Port,cur_pos;
		numresult = $("#numresult_Port").val();
		order = $("#order_Port").val();
		cur_pos = 0;
		$("#config_content_main").load(processurl+"&numresult="+numresult+"&order="+order+"&cur_pos="+cur_pos);
	}
	
	function gotoPage_Port(processurl,page){
		var numresult_Port,order_Port,cur_pos;
		numresult = $("#numresult_Port").val();
		order = $("#order_Port").val();
		//alert(processurl+'-'+page+'-'+numresult+'-'+order);
		$("#config_content_main").load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+page);
	}
	
	function uncheck_fns_Port(field,val,id){
		$("#config_content_main").load("?listPort&mod=ports&checkUncheck="+val+"&setfield="+field+"&checkUncheckID="+id);
	}
	
	function sort_me_Port(id,val){
		$("#config_content_main").load("?listPort&mod=ports&sort_me=1&port_id="+id+"&val="+val);
	}
	
	function search_me_Port(){
		var keyword = document.getElementById('keyword').value;
		if (keyword == ""){
			return false;
		}
		
		$.post('?listPort&mod=ports',
			{keyword:keyword},
			function(data){
				$('#config_content_main').html(data);
				$("#config_content_main").show();
			}
		);
	}
	
	function edit_me_Port(id){
		$("#config_content_main").load("?listPort&mod=ports&edit_me=1&port_id="+id);
	}
		
	$("#a_ref_Port").click( function () { 
			$('#config_content_main').hide();
			$('#config_content_main').fadeOut('fast').load('index.php?listPort&mod=ports').fadeIn("fast");
		});
</script>
{/literal}