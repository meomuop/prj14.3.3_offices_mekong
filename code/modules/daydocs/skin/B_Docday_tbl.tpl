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
<div id="thuoctinh_content_insign">
	<form method="post" name="frmList_Docday" action="?listDocday{$vars.arg}" id="frmList_Docday">
    <!------------------------------------------THEM MOI------------------------------------>
    <fieldset style="width:912px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
    <legend class="legend_list">
        Thêm/Chỉnh sửa&nbsp;|&nbsp;Thông báo:&nbsp;
        <span id="lblError_Docday" class="error">Mời bạn nhập đủ dữ liệu!</span>
    </legend>
    	<table width="98%" cellspacing="0" cellpadding="0" border="0" style="margin-left:5px">
        	<tr height="10"><td colspan="4"></td></tr>
            <tr height="30">
            	<td align="center" width="55%" valign="top">
                	<div style="float:left; width:25%; line-height:25px; text-align:left">Tên nội dung xử lý <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:75%; line-height:25px; text-align:left">
                    <input type="text" name="docday_name" id="docday_name" class="text_long" value="{$obj_info.docday_name}" onfocus="hide_message_Docday()"/>
                    </div>
                    <div style="float:left; width:25%; line-height:25px; text-align:left">Tên viết tắt <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:75%; line-height:25px; text-align:left">
                    <input type="text" name="docday_standfor" id="docday_standfor" class="text_short" value="{$obj_info.docday_standfor}" onfocus="hide_message_Docday()"/>
                    </div>
                    <div style="float:left; width:25%; line-height:25px; text-align:left">Số ngày <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:75%; line-height:25px; text-align:left">
                    <input type="text" name="docday_num" id="docday_num" class="text_short" value="{$obj_info.docday_num}" onfocus="hide_message_Docday()"/>
                    </div>
                </td>
                <td align="center" valign="top">
                	<div style="float:left; width:20%; line-height:25px; text-align:left">Tình trạng :</div>
                    <div style="float:left; width:80%; line-height:25px; text-align:left">
                    	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            {if $obj_info.docday_active neq ''}
                            <td width="20%">
                            <input type="radio" id="docday_active" name="docday_active" value="1" {if $obj_info.docday_active eq 1} checked="checked" {/if} />&nbsp;Hiển thị</td>
                            <td>
                            <input type="radio" id="docday_active" name="docday_active" value="2" {if $obj_info.docday_active eq 2} checked="checked" {/if} />&nbsp;Không hiển thị</td>
                            {else}
                            <td width="20%">
                            <input type="radio" id="docday_active" name="docday_active" value="1" checked/>&nbsp;Hiển thị</td>
                            <td>
                            <input type="radio" id="docday_active" name="docday_active" value="2" />&nbsp;Không hiển thị</td>
                            {/if}
                          </tr>
                        </table>
                    </div>
                    <div style="float:left; width:100%; line-height:25px; text-align:left">&nbsp;</div>
                    <div style="float:left; width:20%; line-height:25px; text-align:left">&nbsp;</div>
                    <div style="float:left; width:80%; line-height:25px; text-align:left">
                    	<input type="button" name="btnSub_Docday" id="btnSub_Docday" value="Ghi lại" class="button" />
                        <input type="hidden" name="docday_id" id="docday_id" value="{$obj_info.docday_id}">
                        <input type="reset" name="Reset" value="Hủy bỏ" class="button" />
                        {literal}
                        <script language="javascript">
                            function hide_message_Docday(){
                                $('#lblMessage_Docday').hide();
                                $('#lblError_Docday').hide();
                            }
                            
                            $(function() {
                            $('.error').hide();
                            $('#lblMessage_Docday').hide();
                             
                            $("#btnSub_Docday").click(function() {
                                $('.error').hide();
                                 
                                var $form = $("#frmList_Docday");
                                var docday_name = $form.find('input#docday_name').val();
								var docday_standfor = $form.find('input#docday_standfor').val();
								var docday_num = $form.find('input#docday_num').val();
                                var docday_active = $form.find('input#docday_active:checked').val();
                                var docday_id = $form.find('input#docday_id').val();
                                 
                                //begin validate form
                                if (docday_name == ""){
                                    $('#lblError_Docday').show();
                                }
                                else{
                                    var dataString  = "docday_name=" + docday_name;
                                        dataString += "&docday_standfor=" + docday_standfor;
										dataString += "&docday_num=" + docday_num;
										dataString += "&docday_active=" + docday_active;
                                        dataString += "&docday_id=" + docday_id +"";
                                        //alert (dataString);return false;
                                    $.ajax({
                                        type: "POST",
                                        url: "index.php?listDocday&mod=daydocs&add_edit=1",
                                        data: dataString,
                                        success: function(data) {
                                            $('#thuoctinh_content_main').fadeOut('fast').load('index.php?listDocday&mod=daydocs').fadeIn("fast");
                                            //$('#lblMessage_Docday').show();
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
    <fieldset style="width:912px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:347px">
    <legend class="legend_list">
        <div style="width:130px; float:left">Danh sách: {$total_num_result}</div>
        <div style="width:70px; float:left">&nbsp;|&nbsp;Tìm kiếm&nbsp;</div>
        <div style="width:100px; float:left">
        	<input type="text" name="keyword" id="keyword" class="text_seek" value="{$vars.keyword}"/>
            <input type="hidden" id="processurl" value="{$processurl}" />
        </div>
        <div style="width:50px; float:left">
        	<input type="button" name="btnSeek" id="btnSeek" value="Tìm >>" class="button_seek" onclick="search_me_Docday()" /></div>
    </legend>
    	<div style="float:left; height:5px; width:100%"></div>
        <div style="float:left; height:25px; width:890px; border-top:1px solid #99bbe8; border-bottom:1px solid #99bbe8 ">
            <div class="tbl_tit" style="width:30px; text-align:center"><b>STT</b></div>	
            <div class="tbl_tit" style="width:437px"><B>&nbsp;Tên nội dung xử lý</B></div>
            <div class="tbl_tit" style="width:59px"><B>&nbsp;Viết tắt</B></div>
            <div class="tbl_tit" style="width:59px; text-align:right"><B>Số ngày&nbsp;</B></div>
            <div class="tbl_tit" style="width:80px"><B>&nbsp;Ngày tạo</B></div>
            <div class="tbl_tit" style="width:59px; text-align:center"><B>Sắp xếp</B></div>
            <div class="tbl_tit" style="width:59px; text-align:center"><B>Hiển thị</B></div>
            <div class="tbl_tit" style="width:59px; text-align:center"><B>Chọn</B></div>
            <div class="tbl_tit" style="width:39px; text-align:center">
            <input type="hidden" name="chon" id="chon_Docday">
            <input type="checkbox" name="chkall" value="0" onclick="docheck_Docday(document.frmList_Docday.chkall.checked,0);">
            </div>
        </div>
        <div style="float:left; width:20px; text-align:right">
        <input type="button" name="del_Items" id='del_Items' value="&nbsp;" onClick="delItems_Docday('{$processurl}');" style="width:17px; font-size:12px; background:url(../images/admin/b_drop.png); cursor:pointer" title="Xóa lựa chọn">
        </div>
        <div style="float:left; height:290px; width:912px; overflow-y:scroll">
            {section name=pi loop=$obj_list}
            {if $smarty.section.pi.index is not div by 2} 
            {assign var="class_td" value="tbl_cont"} 
            {else}
            {assign var="class_td" value="tbl_cont2"} 
            {/if}
            {math x=$vars.curpage-1 y=$vars.numresult z=$smarty.section.pi.index t=1 equation="x*y+z+t" assign=stt}
            <div class="{$class_td}" style="width:30px; text-align:center">{$stt}</div>
            <div class="{$class_td}" style="width:437px" title="{$obj_list[pi]->docday_name}">
            	&nbsp;<a href="javascript: void(0);" onclick="edit_me_Docday({$obj_list[pi]->docday_id})" >{$obj_list[pi]->docday_name|str_string_cut:"90":"1"}</a>
            </div>
            <div class="{$class_td}" style="width:59px">
            	&nbsp;{$obj_list[pi]->docday_standfor}
            </div>
            <div class="{$class_td}" style="width:59px; text-align:right">
            	&nbsp;{$obj_list[pi]->docday_num}&nbsp;
            </div>
            <div class="{$class_td}" style="width:80px">
            	&nbsp;{$obj_list[pi]->docday_date|date_format:"%d/%m/%Y"}
            </div>
            <div class="{$class_td}" style="width:59px; text-align:center">
                <select name="docday_sort[]" onchange="sort_me_Docday({$obj_list[pi]->docday_id},this.value)" class="select_tiny">
                {section name=i loop=$total_num_result}
                    <option value="{$smarty.section.i.index}" {if $smarty.section.i.index eq $obj_list[pi]->docday_sort} selected="selected"{/if}>{$smarty.section.i.index}</option>
                {/section}
                </select>
                <input type="hidden" name="docday_id1[]" value="{$obj_list[pi]->docday_id}">
            </div>
            <div class="{$class_td}" style="width:59px; text-align:center">
                {if $obj_list[pi]->docday_active eq 1}
                    <a href='javascript: void(0);' onclick="uncheck_fns_Docday('docday_active',2,{$obj_list[pi]->docday_id})"><img src="../images/admin/tick.png" width="10" height="10" border="0" title="Ẩn"></a>
                {else}
                    <a href='javascript: void(0);' onclick="uncheck_fns_Docday('docday_active',1,{$obj_list[pi]->docday_id})"><img src="../images/admin/publish_x.png" width="10" height="10" border="0" title="Hiện"></a>
                {/if}
            </div>
            <div class="{$class_td}" style="width:29px; text-align:center">
                <a href='javascript: void(0);' onclick="edit_me_Docday({$obj_list[pi]->docday_id})">
                <img src="../images/admin/b_edit.png" width="11" height="11" border="0" title="Sửa"></a>
            </div>
            <div class="{$class_td}" style="width:29px; text-align:center">
                <a href='javascript: void(0)' onClick="delItems_Docday('{$processurl}', {$obj_list[pi]->docday_id});">
                <img src="../images/admin/b_drop.png" width="11" height="11" border="0" title="Xóa"></a>
            </div>
            <div class="{$class_td}" style="width:39px; text-align:center">
            	<input type="checkbox" name="chkid" value="{$obj_list[pi]->docday_id}" onclick="docheckone_Docday();">
            </div>
            {/section}
        </div>
        <input type="hidden" id="curpage_Docday" name="curpage" value="{$vars.curpage}" />
    </fieldset>
    </form>
</div>
<!------------------------------------------------- Tool bar --------------------------------------------->
<div id="doc_clear_txt"></div>
<div id="doc_tool_bar">

    <div id="doc_search_area">
    <select name="order" id = "order_Docday" style="width:120px; font-size:12px; border:1px solid #99bbe8" onchange="reloadPage_Docday('{$processurl}');">
    {section name=sli loop=$order_arr}
        <option value="{$smarty.section.sli.index}" {if $smarty.section.sli.index eq $vars.order}selected{/if} >
        {$order_arr[sli]}
        </option>
    {/section}
    </select>
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div id="doc_page_area">
    {if $vars.curpage eq 1}
    	<img src="{$css_path}icon_first_page.png" class="img_all">
    	<img src="{$css_path}icon_pre_page.png" class="img_all">
    {else}
    <a href="javascript: void(0)" id="first_page" onclick="gotoPage_Docday('{$processurl}',parseInt(1));" title="Trang đầu">
    	<img src="{$css_path}icon_first_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="pre_page" onclick="gotoPage_Docday('{$processurl}',parseInt(document.getElementById('page').value)-parseInt(1));" title="Trang trước">
    	<img src="{$css_path}icon_pre_page.png" class="img_all">
    </a>
    {/if}
    </div>
    <div style="float:left; line-height:19px">
        <div style="float:left; width:35px">Trang</div> 
        <div style="float:left; width:35px">
        <input type="text" value="{$vars.curpage}" name="page" id="page" onblur=" gotoPage_Docday('{$processurl}',this.value);" style="width:30px; font-size:12px; height:15px; border:1px solid #99bbe8">
        </div>
        <div style="float:left; width:42px"> / {$num_page}</div>
    </div>
    <div id="doc_page_area">
    {if $vars.curpage eq $num_page}
    	<img src="{$css_path}icon_next_page.png" class="img_all">
        <img src="{$css_path}icon_last_page.png" class="img_all">
    {else}
    <a href="javascript: void(0)" id="next_page" onclick="gotoPage_Docday('{$processurl}',parseInt(document.getElementById('page').value)+parseInt(1));" title="Trang tiếp">
    	<img src="{$css_path}icon_next_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="last_page" onclick="gotoPage_Docday('{$processurl}',parseInt({$num_page}));" title="Trang cuối">
    	<img src="{$css_path}icon_last_page.png" class="img_all">
    </a>
    {/if}
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:left; width:15px">
    <a href="javascript: void(0)" id="a_ref_Docday" title="Tải lại"><img src="{$css_path}icon_refresh.png" class="img_all"></a>
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:right; line-height:19px; margin-right:2px">
        <div style="float:left; width:40px">Xem</div>
        <div style="float:left; width:52px">
            <select name="numresult" id="numresult_Docday" style="width:50px; font-size:12px; border:1px solid #99bbe8" onchange="reloadPage_Docday('{$processurl}');">
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
	function docheck_Docday(status,from_){
		var alen=document.frmList_Docday.elements.length;
		alen=(alen>5)?document.frmList_Docday.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
			document.frmList_Docday.chkid[i].checked=status;
		}
		else{
			document.frmList_Docday.chkid.checked=status;
		}
		if(from_>0) document.frmList_Docday.chkall.checked=status;
	}
		
	function docheckone_Docday(){
		var alen=document.frmList_Docday.elements.length;
		var isChecked=true;
		alen=(alen>4)?document.frmList_Docday.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_Docday.chkid[i].checked==false)
					isChecked=false;
		}else{
			if(document.frmList_Docday.chkid.checked==false)
				isChecked=false;
		}				
		document.frmList_Docday.chkall.checked=isChecked;
	}
	
	function calculatechon_Docday(){			
		var strchon="";
		var alen=document.frmList_Docday.elements.length;				
		alen=(alen>2)?document.frmList_Docday.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_Docday.chkid[i].checked==true)
					strchon+=document.frmList_Docday.chkid[i].value+",";
		}else{
			if(document.frmList_Docday.chkid.checked==true)
				strchon=document.frmList_Docday.chkid.value;
		}
		document.frmList_Docday.chon_Docday.value=strchon;
	}
	
	function delItems_Docday(processurl,delStr){
		if (delStr == undefined){
			calculatechon_Docday();
			delStr = document.getElementById("chon_Docday").value;
		}
		if (delStr == ""){
			return false;
		}
		if(!confirm("THÔNG BÁO: \n\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
			return false;
		}	
		
		var numresult_Docday,order_Docday,curpage_Docday;
		numresult = $("#numresult_Docday").val();
		order = $("#order_Docday").val();
		curpage = $("#curpage_Docday").val();
		
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
				$('#thuoctinh_content_main').fadeOut('fast').load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+curpage).fadeIn("fast");
			}
		});
	}
	
	function reloadPage_Docday(processurl){
		var numresult_Docday,order_Docday,cur_pos;
		numresult = $("#numresult_Docday").val();
		order = $("#order_Docday").val();
		cur_pos = 0;
		$("#thuoctinh_content_main").load(processurl+"&numresult="+numresult+"&order="+order+"&cur_pos="+cur_pos);
	}
	
	function gotoPage_Docday(processurl,page){
		var numresult_Docday,order_Docday,cur_pos;
		numresult = $("#numresult_Docday").val();
		order = $("#order_Docday").val();
		//alert(processurl+'-'+page+'-'+numresult+'-'+order);
		$("#thuoctinh_content_main").load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+page);
	}
	
	function uncheck_fns_Docday(field,val,id){
		$("#thuoctinh_content_main").load("?listDocday&mod=daydocs&checkUncheck="+val+"&setfield="+field+"&checkUncheckID="+id);
	}
	
	function sort_me_Docday(id,val){
		$("#thuoctinh_content_main").load("?listDocday&mod=daydocs&sort_me=1&docday_id="+id+"&val="+val);
	}
	
	function search_me_Docday(){
		var keyword = document.getElementById('keyword').value;
		if (keyword == ""){
			return false;
		}
		
		$.post('?listDocday&mod=daydocs',
			{keyword:keyword},
			function(data){
				$('#thuoctinh_content_main').html(data);
				$("#thuoctinh_content_main").show();
			}
		);
	}
	
	function edit_me_Docday(id){
		$("#thuoctinh_content_main").load("?listDocday&mod=daydocs&edit_me=1&docday_id="+id);
	}
		
	$("#a_ref_Docday").click( function () { 
			$('#thuoctinh_content_main').hide();
			$('#thuoctinh_content_main').fadeOut('fast').load('index.php?listDocday&mod=daydocs').fadeIn("fast");
		});
</script>
{/literal}