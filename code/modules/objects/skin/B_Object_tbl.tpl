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
	<form method="post" name="frmList_Object" action="?listObject{$vars.arg}" id="frmList_Object">
    <!------------------------------------------THEM MOI------------------------------------>
    <fieldset style="width:837px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
    <legend class="legend_list">
        Thêm/Chỉnh sửa&nbsp;|&nbsp;Thông báo:&nbsp;
        <span id="lblError_Object" class="error">Mời bạn nhập đủ dữ liệu!</span>
    </legend>
    	<table width="98%" cellspacing="0" cellpadding="0" border="0" style="margin-left:5px">
        	<tr height="10"><td colspan="4"></td></tr>
            <tr height="30">
            	<td align="center" width="50%">
                	<div style="float:left; width:30%; line-height:25px; text-align:left">Tên chức vụ <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left">
                    <input type="text" name="object_name" id="object_name" class="text_middle" value="{$obj_info.object_name}" onfocus="hide_message_Object()"/>
                    </div>
                    <div style="float:left; width:30%; line-height:25px; text-align:left">Tên viết tắt <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left">
                    <input type="text" name="object_standfor" id="object_standfor" class="text_short" value="{$obj_info.object_standfor}" onfocus="hide_message_Object()"/>
                    </div>
                    <div style="float:left; width:30%; line-height:25px; text-align:left">&nbsp;</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left">&nbsp;</div>
                </td>
                <td align="center">
                	<div style="float:left; width:20%; line-height:25px; text-align:left">Mô tả:</div>
                    <div style="float:left; width:80%; line-height:25px; text-align:left">
                    <textarea spellcheck="false" name="object_desc" id="object_desc" cols="30" rows="5" class="text_area" onfocus="hide_message_Object()">{$obj_info.object_desc}</textarea>
                    </div>
                </td>
            </tr>
            <tr height="30">
            	<td align="center">
                	<div style="float:left; width:30%; line-height:25px; text-align:left">Tình trạng :</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left">
                    	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            {if $obj_info.object_active neq ''}
                            <td width="30%">
                            <input type="radio" id="object_active" name="object_active" value="1" {if $obj_info.object_active eq 1} checked="checked" {/if} />&nbsp;Hiển thị</td>
                            <td>
                            <input type="radio" id="object_active" name="object_active" value="2" {if $obj_info.object_active eq 2} checked="checked" {/if} />&nbsp;Không hiển thị</td>
                            {else}
                            <td width="30%">
                            <input type="radio" id="object_active" name="object_active" value="1" checked/>&nbsp;Hiển thị</td>
                            <td>
                            <input type="radio" id="object_active" name="object_active" value="2" />&nbsp;Không hiển thị</td>
                            {/if}
                          </tr>
                        </table>
                    </div>
                </td>
                <td align="left">
                <input type="button" name="btnSub_Object" id="btnSub_Object" value="Ghi lại" class="button" />
                <input type="hidden" name="object_id" id="object_id" value="{$obj_info.object_id}">
                <input type="reset" name="Reset" value="Hủy bỏ" class="button" />
                {literal}
				<script language="javascript">
					function hide_message_Object(){
						$('#lblMessage_Object').hide();
						$('#lblError_Object').hide();
					}
					
					$(function() {
					$('.error').hide();
					$('#lblMessage_Object').hide();
					 
					$("#btnSub_Object").click(function() {
						$('.error').hide();
						 
						var $form = $("#frmList_Object");
						var object_name = $form.find('input#object_name').val();
						var object_standfor = $form.find('input#object_standfor').val();
						var object_desc = $form.find('textarea#object_desc').val();
						var object_type = $form.find('select#object_type :selected').val();
						var object_active = $form.find('input#object_active:checked').val();
						var object_id = $form.find('input#object_id').val();
						 
						//begin validate form
						if (object_name == "" || object_standfor == ""){
							$('#lblError_Object').show();
						}
						else{
							var dataString  = "object_name=" + object_name;
								dataString += "&object_standfor=" + object_standfor;
								dataString += "&object_desc=" + object_desc;
								dataString += "&object_type=" + object_type;
								dataString += "&object_active=" + object_active;
								dataString += "&object_id=" + object_id +"";
								//alert (dataString);return false;
							$.ajax({
								type: "POST",
								url: "index.php?listObject&mod=objects&add_edit=1",
								data: dataString,
								success: function(data) {
									$('#user_content_main').fadeOut('fast').load('index.php?listObject&mod=objects').fadeIn("fast");
									//$('#lblMessage_Object').show();
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
    <fieldset style="width:837px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:260px">
    <legend class="legend_list">
        <div style="width:130px; float:left">Danh sách: {$total_num_result}</div>
        <div style="width:70px; float:left">&nbsp;|&nbsp;Tìm kiếm&nbsp;</div>
        <div style="width:100px; float:left">
        	<input type="text" name="keyword" id="keyword" class="text_seek" value="{$vars.keyword}"/>
            <input type="hidden" id="processurl" value="{$processurl}" />
        </div>
        <div style="width:50px; float:left">
        	<input type="button" name="btnSeek" id="btnSeek" value="Tìm >>" class="button_seek" onclick="search_me_Object()" /></div>
    </legend>
    	<div style="float:left; height:5px; width:100%"></div>
        <div style="float:left; height:25px; width:817px; border-top:1px solid #99bbe8; border-bottom:1px solid #99bbe8 ">
            <div class="tbl_tit" style="width:30px; text-align:center"><b>STT</b></div>	
            <div class="tbl_tit" style="width:148px"><B>&nbsp;Tên chức vụ</B></div>
            <div class="tbl_tit" style="width:90px"><B>&nbsp;Viết tắt</B></div>
            <div class="tbl_tit" style="width:244px"><B>&nbsp;Mô tả</B></div>
            <div class="tbl_tit" style="width:80px"><B>&nbsp;Ngày tạo</B></div>
            <div class="tbl_tit" style="width:59px; text-align:center"><B>Sắp xếp</B></div>
            <div class="tbl_tit" style="width:59px; text-align:center"><B>Hiển thị</B></div>
            <div class="tbl_tit" style="width:59px; text-align:center"><B>Chọn</B></div>
            <div class="tbl_tit" style="width:39px; text-align:center">
            <input type="hidden" name="chon" id="chon_Object">
            <input type="checkbox" name="chkall" value="0" onclick="docheck_Object(document.frmList_Object.chkall.checked,0);">
            </div>
        </div>
        <div style="float:left; width:20px; text-align:right">
        <input type="button" name="del_Items" id='del_Items' value="&nbsp;" onClick="delItems_Object('{$processurl}');" style="width:17px; font-size:12px; background:url(../images/admin/b_drop.png); cursor:pointer" title="Xóa lựa chọn">
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
            <div class="{$class_td}" style="width:148px">
            	&nbsp;<a href="javascript: void(0);" onclick="edit_me_Object({$obj_list[pi]->object_id})" >{$obj_list[pi]->object_name}</a>
            </div>
            <div class="{$class_td}" style="width:90px">
            	&nbsp;{$obj_list[pi]->object_standfor}
            </div>
            <div class="{$class_td}" style="width:244px" title="{$obj_list[pi]->object_desc}">
            	&nbsp;{$obj_list[pi]->object_desc|replace:"<p>":""|str_string_cut:"50":"1"}
            </div>
            <div class="{$class_td}" style="width:80px">
            	&nbsp;{$obj_list[pi]->object_date|date_format:"%d/%m/%Y"}
            </div>
            <div class="{$class_td}" style="width:59px; text-align:center">
                <select name="object_sort[]" class="select_tiny" onchange="sort_me_Object({$obj_list[pi]->object_id},this.value)">
                {section name=i loop=$total_num_result}
                    <option value="{$smarty.section.i.index}" {if $smarty.section.i.index eq $obj_list[pi]->object_sort} selected="selected"{/if}>{$smarty.section.i.index}</option>
                {/section}
                </select>
                <input type="hidden" name="object_id1[]" value="{$obj_list[pi]->object_id}">
            </div>
            <div class="{$class_td}" style="width:59px; text-align:center">
                {if $obj_list[pi]->object_active eq 1}
                    <a href='javascript: void(0);' onclick="uncheck_fns_Object('object_active',2,{$obj_list[pi]->object_id})"><img src="../images/admin/tick.png" width="10" height="10" border="0" title="Ẩn"></a>
                {else}
                    <a href='javascript: void(0);' onclick="uncheck_fns_Object('object_active',1,{$obj_list[pi]->object_id})"><img src="../images/admin/publish_x.png" width="10" height="10" border="0" title="Hiện"></a>
                {/if}
            </div>
            <div class="{$class_td}" style="width:29px; text-align:center">
                <a href='javascript: void(0);' onclick="edit_me_Object({$obj_list[pi]->object_id})">
                <img src="../images/admin/b_edit.png" width="11" height="11" border="0" title="Sửa"></a>
            </div>
            <div class="{$class_td}" style="width:29px; text-align:center">
                <a href='javascript: void(0' onClick="delItems_Object('{$processurl}', {$obj_list[pi]->object_id});">
                <img src="../images/admin/b_drop.png" width="11" height="11" border="0" title="Xóa"></a>
            </div>
            <div class="{$class_td}" style="width:39px; text-align:center">
            	<input type="checkbox" name="chkid" value="{$obj_list[pi]->object_id}" onclick="docheckone_Object();">
            </div>
            {/section}
        </div>
        <input type="hidden" id="curpage_Object" name="curpage" value="{$vars.curpage}" />
    </fieldset>
    </form>
</div>
<!------------------------------------------------- Tool bar --------------------------------------------->
<div id="user_clear_txt"></div>
<div id="user_tool_bar">

    <div id="user_search_area">
    <select name="order" id="order_Object" style="width:120px; font-size:12px; border:1px solid #99bbe8" onchange="reloadPage_Object('{$processurl}');">
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
    <a href="javascript: void(0)" id="first_page" onclick="gotoPage_Object('{$processurl}',parseInt(1));" title="Trang đầu">
    	<img src="{$css_path}icon_first_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="pre_page" onclick="gotoPage_Object('{$processurl}',parseInt(document.getElementById('page_Object').value)-parseInt(1));" title="Trang trước">
    	<img src="{$css_path}icon_pre_page.png" class="img_all">
    </a>
    {/if}
    </div>
    <div style="float:left; line-height:19px">
        <div style="float:left; width:35px">Trang</div> 
        <div style="float:left; width:35px">
        <input type="text" value="{$vars.curpage}" name="page" id="page_Object" onblur=" gotoPage_Object('{$processurl}',this.value);" style="width:30px; font-size:12px; height:15px; border:1px solid #99bbe8">
        </div>
        <div style="float:left; width:42px"> / {$num_page}</div>
    </div>
    <div id="user_page_area">
    {if $vars.curpage eq $num_page}
    	<img src="{$css_path}icon_next_page.png" class="img_all">
        <img src="{$css_path}icon_last_page.png" class="img_all">
    {else}
    <a href="javascript: void(0)" id="next_page" onclick="gotoPage_Object('{$processurl}',parseInt(document.getElementById('page_Object').value)+parseInt(1));" title="Trang tiếp">
    	<img src="{$css_path}icon_next_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="last_page" onclick="gotoPage_Object('{$processurl}',parseInt({$num_page}));" title="Trang cuối">
    	<img src="{$css_path}icon_last_page.png" class="img_all">
    </a>
    {/if}
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:left; width:15px">
    <a href="javascript: void(0)" id="a_ref_Object" title="Tải lại"><img src="{$css_path}icon_refresh.png" class="img_all"></a>
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:right; line-height:19px; margin-right:2px">
        <div style="float:left; width:40px">Xem</div>
        <div style="float:left; width:52px">
            <select name="numresult" id="numresult_Object" style="width:50px; font-size:12px; border:1px solid #99bbe8" onchange="reloadPage_Object('{$processurl}');">
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
	function docheck_Object(status,from_){
		var alen=document.frmList_Object.elements.length;
		alen=(alen>5)?document.frmList_Object.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
			document.frmList_Object.chkid[i].checked=status;
		}
		else{
			document.frmList_Object.chkid.checked=status;
		}
		if(from_>0) document.frmList_Object.chkall.checked=status;
	}
		
	function docheckone_Object(){
		var alen=document.frmList_Object.elements.length;
		var isChecked=true;
		alen=(alen>4)?document.frmList_Object.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_Object.chkid[i].checked==false)
					isChecked=false;
		}else{
			if(document.frmList_Object.chkid.checked==false)
				isChecked=false;
		}				
		document.frmList_Object.chkall.checked=isChecked;
	}
	
	function calculatechon_Object(){			
		var strchon="";
		var alen=document.frmList_Object.elements.length;				
		alen=(alen>2)?document.frmList_Object.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_Object.chkid[i].checked==true)
					strchon+=document.frmList_Object.chkid[i].value+",";
		}else{
			if(document.frmList_Object.chkid.checked==true)
				strchon=document.frmList_Object.chkid.value;
		}
		document.frmList_Object.chon_Object.value=strchon;
	}
	
	function delItems_Object(processurl,delStr){
		if (delStr == undefined){
			calculatechon_Object();
			delStr = document.getElementById("chon_Object").value;
		}
		if (delStr == ""){
			return false;
		}
		if(!confirm("THÔNG BÁO: \n\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
			return false;
		}	
		
		var numresult_Object,order_Object,curpage_Object;
		numresult = $("#numresult_Object").val();
		order = $("#order_Object").val();
		curpage = $("#curpage_Object").val();
		
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
	
	function reloadPage_Object(processurl){
		var numresult_Object,order_Object,cur_pos;
		numresult = $("#numresult_Object").val();
		order = $("#order_Object").val();
		cur_pos = 0;
		$("#user_content_main").load(processurl+"&numresult="+numresult+"&order="+order+"&cur_pos="+cur_pos);
	}
	
	function gotoPage_Object(processurl,page){
		var numresult_Object,order_Object,cur_pos;
		numresult = $("#numresult_Object").val();
		order = $("#order_Object").val();
		//alert(processurl+'-'+page+'-'+numresult+'-'+order);
		$("#user_content_main").load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+page);
	}
	
	function uncheck_fns_Object(field,val,id){
		$("#user_content_main").load("?listObject&mod=objects&checkUncheck="+val+"&setfield="+field+"&checkUncheckID="+id);
	}
	
	function sort_me_Object(id,val){
		$("#user_content_main").load("?listObject&mod=objects&sort_me=1&object_id="+id+"&val="+val);
	}
	
	function search_me_Object(){
		var keyword = document.getElementById('keyword').value;
		if (keyword == ""){
			return false;
		}
		
		$.post('?listObject&mod=objects',
			{keyword:keyword},
			function(data){
				$('#user_content_main').html(data);
				$("#user_content_main").show();
			}
		);
	}
	
	function edit_me_Object(id){
		$("#user_content_main").load("?listObject&mod=objects&edit_me=1&object_id="+id);
	}
		
	$("#a_ref_Object").click( function () { 
			$('#user_content_main').hide();
			$('#user_content_main').fadeOut('fast').load('index.php?listObject&mod=objects').fadeIn("fast");
		});
</script>
{/literal}