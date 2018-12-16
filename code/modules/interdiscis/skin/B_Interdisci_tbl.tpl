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
<div id="thuoctinh_content_insign" style="height:279px">
	<form method="post" name="frmList_Interdisci" action="?listInterdisci{$vars.arg}" id="frmList_Interdisci">
    <!------------------------------------------THEM MOI------------------------------------>
    <fieldset style="width:452px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
    <legend class="legend_list">
        Thêm/Chỉnh sửa&nbsp;|&nbsp;Thông báo:&nbsp;
        <span id="lblError_Interdisci" class="error">Mời bạn nhập đủ dữ liệu!</span>
    </legend>
    	<table width="98%" cellspacing="0" cellpadding="0" border="0" style="margin-left:5px">
        	<tr height="10"><td colspan="3"></td></tr>
            <tr height="30">
                <td width="23%" align="left" height="20">Tên người ký LN <font color="#FF0000">*</font>:</td>
                <td align="left" colspan="2">
                <input type="text" name="interdisci_name" id="interdisci_name" class="text_middle" value="{$obj_info.interdisci_name}" onfocus="javascript: hide_message_Interdisci()"/>
                </td>
            </tr>
            <tr height="30">
                <td align="left">Tình trạng :</td>		
                <td align="left">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                      	{if $obj_info.interdisci_active neq ''}
                        <td width="40%">
                        <input type="radio" id="interdisci_active" name="interdisci_active" value="1" {if $obj_info.interdisci_active eq 1} checked="checked" {/if} />&nbsp;Hiển thị</td>
                        <td>
                        <input type="radio" id="interdisci_active" name="interdisci_active" value="2" {if $obj_info.interdisci_active eq 2} checked="checked" {/if} />&nbsp;Không hiển thị</td>
                        {else}
                        <td width="40%">
                        <input type="radio" id="interdisci_active" name="interdisci_active" value="1" checked/>&nbsp;Hiển thị</td>
                        <td>
                        <input type="radio" id="interdisci_active" name="interdisci_active" value="2" />&nbsp;Không hiển thị</td>
                        {/if}
                      </tr>
                    </table>
                </td>
                <td align="center" colspan="2">
                	<input type="button" name="btnSub_Interdisci" id="btnSub_Interdisci" value="Ghi lại" class="button" />
                    <input type="hidden" name="interdisci_id" id="interdisci_id" value="{$obj_info.interdisci_id}">
                    <input type="reset" name="Reset" value="Hủy bỏ" class="button" />
                    {literal}
                    <script language="javascript">
                        function hide_message_Interdisci(){
                            $('#lblError_Interdisci').hide();
                        }
                        
                        $(function() {
                        $('.error').hide();
                        $('#lblMessage_Interdisci').hide();
                         
                        $("#btnSub_Interdisci").click(function() {
                            $('.error').hide();
                            
                            var $form = $("#frmList_Interdisci");
                            var interdisci_name = $form.find('input#interdisci_name').val();
                            var interdisci_active = $form.find('input#interdisci_active:checked').val();
                            var interdisci_id = $form.find('input#interdisci_id').val();
                             
                            //begin validate form
                            if (interdisci_name == ""){
                                $('#lblError_Interdisci').show();
                            }
                            else{
                                var dataString  = "interdisci_name=" + interdisci_name;
                                    dataString += "&interdisci_active=" + interdisci_active;
                                    dataString += "&interdisci_id=" + interdisci_id +"";
                                    //alert (dataString);return false;
                                $.ajax({
                                    type: "POST",
                                    url: "index.php?listInterdisci&mod=interdiscis&add_edit=1",
                                    data: dataString,
                                    success: function(data) {
                                        $('#thuoctinh_content_main_small_5').fadeOut('fast').load('index.php?listInterdisci&mod=interdiscis').fadeIn("fast");
                                        //$('#lblMessage_Interdisci').show();
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
    <fieldset style="width:452px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:170px">
    <legend class="legend_list">
        <div style="width:130px; float:left">Danh sách: {$total_num_result}</div>
        <div style="width:70px; float:left">&nbsp;|&nbsp;Tìm kiếm&nbsp;</div>
        <div style="width:100px; float:left">
        	<input type="text" name="keyword" id="keyword" class="text_seek" value="{$vars.keyword}"/>
            <input type="hidden" id="processurl" value="{$processurl}" />
        </div>
        <div style="width:50px; float:left">
        	<input type="button" name="btnSeek" id="btnSeek" value="Tìm >>" class="button_seek" onclick="search_me_Interdisci()" /></div>
    </legend>
    	<div style="float:left; height:5px; width:100%"></div>
        <div style="float:left; height:25px; width:432px; border-top:1px solid #99bbe8; border-bottom:1px solid #99bbe8 ">
            <div class="tbl_tit" style="width:30px; text-align:center"><b>STT</b></div>	
            <div class="tbl_tit" style="width:180px"><B>&nbsp;Tên người ký liên ngành</B></div>
            <div class="tbl_tit" style="width:59px; text-align:center"><B>Sắp xếp</B></div>
            <div class="tbl_tit" style="width:59px; text-align:center"><B>Hiển thị</B></div>
            <div class="tbl_tit" style="width:59px; text-align:center"><B>Chọn</B></div>
            <div class="tbl_tit" style="width:39px; text-align:center">
            <input type="hidden" name="chon" id="chon_Interdisci">
            <input type="checkbox" name="chkall" value="0" onclick="docheck_Interdisci(document.frmList_Interdisci.chkall.checked,0);">
            </div>
        </div>
        <div style="float:left; width:20px; text-align:right">
        <input type="button" name="del_Items" id='del_Items' value="&nbsp;" onClick="delItems_Interdisci('{$processurl}');" style="width:17px; font-size:12px; background:url(../images/admin/b_drop.png); cursor:pointer" title="Xóa lựa chọn">
        </div>
        <div style="float:left; height:113px; width:452px; overflow-y:scroll">
            {section name=pi loop=$obj_list}
            {if $smarty.section.pi.index is not div by 2} 
            {assign var="class_td" value="tbl_cont"} 
            {else}
            {assign var="class_td" value="tbl_cont2"} 
            {/if}
            {math x=$vars.curpage-1 y=$vars.numresult z=$smarty.section.pi.index t=1 equation="x*y+z+t" assign=stt}
            <div class="{$class_td}" style="width:30px; text-align:center">{$stt}</div>
            <div class="{$class_td}" style="width:180px">
            	&nbsp;<a href="javascript: void(0);" onclick="edit_me_Interdisci({$obj_list[pi]->interdisci_id})" >{$obj_list[pi]->interdisci_name}</a>
            </div>
            <div class="{$class_td}" style="width:59px; text-align:center">
                <select name="interdisci_sort[]" onchange="sort_me_Interdisci({$obj_list[pi]->interdisci_id},this.value)" class="select_tiny">
                {section name=i loop=$total_num_result}
                    <option value="{$smarty.section.i.index}" {if $smarty.section.i.index eq $obj_list[pi]->interdisci_sort} selected="selected"{/if}>{$smarty.section.i.index}</option>
                {/section}
                </select>
                <input type="hidden" name="interdisci_id1[]" value="{$obj_list[pi]->interdisci_id}">
            </div>
            <div class="{$class_td}" style="width:59px; text-align:center">
                {if $obj_list[pi]->interdisci_active eq 1}
                    <a href='javascript: void(0);' onclick="uncheck_fns_Interdisci('interdisci_active',2,{$obj_list[pi]->interdisci_id})"><img src="../images/admin/tick.png" width="10" height="10" border="0" title="Ẩn"></a>
                {else}
                    <a href='javascript: void(0);' onclick="uncheck_fns_Interdisci('interdisci_active',1,{$obj_list[pi]->interdisci_id})"><img src="../images/admin/publish_x.png" width="10" height="10" border="0" title="Hiện"></a>
                {/if}
            </div>
            <div class="{$class_td}" style="width:29px; text-align:center">
                <a href='javascript: void(0);' onclick="edit_me_Interdisci({$obj_list[pi]->interdisci_id})">
                <img src="../images/admin/b_edit.png" width="11" height="11" border="0" title="Sửa"></a>
            </div>
            <div class="{$class_td}" style="width:29px; text-align:center">
                <a href='javascript: void(0'  onClick="delItems_Interdisci('{$processurl}', {$obj_list[pi]->interdisci_id});">
                <img src="../images/admin/b_drop.png" width="11" height="11" border="0" title="Xóa"></a>
            </div>
            <div class="{$class_td}" style="width:39px; text-align:center">
            	<input type="checkbox" name="chkid" value="{$obj_list[pi]->interdisci_id}" onclick="docheckone_Interdisci();">
            </div>
            {/section}
        </div>
        <input type="hidden" id="curpage_Interdisci" name="curpage" value="{$vars.curpage}" />
    </fieldset>
    </form>
</div>
<!------------------------------------------------- Tool bar --------------------------------------------->
<div id="doc_clear_txt"></div>
<div id="doc_tool_bar">

    <div id="doc_search_area" style="width:92px; padding-left:3px">
    <select name="order" id="order_Interdisci" style="width:90px; font-size:12px; border:1px solid #99bbe8" onchange="reloadPage_Interdisci('{$processurl}');">
    {section name=sli loop=$order_arr}
        <option value="{$smarty.section.sli.index}" {if $smarty.section.sli.index eq $vars.order}selected{/if} >
        {$order_arr[sli]}
        </option>
    {/section}
    </select>
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div id="doc_page_area" style="width:38px">
    {if $vars.curpage eq 1}
    	<img src="{$css_path}icon_first_page.png" class="img_all">
    	<img src="{$css_path}icon_pre_page.png" class="img_all">
    {else}
    <a href="javascript: void(0)" id="first_page" onclick="gotoPage_Interdisci('{$processurl}',parseInt(1));" title="Trang đầu">
    	<img src="{$css_path}icon_first_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="pre_page" onclick="gotoPage_Interdisci('{$processurl}',parseInt(document.getElementById('page').value)-parseInt(1));" title="Trang trước">
    	<img src="{$css_path}icon_pre_page.png" class="img_all">
    </a>
    {/if}
    </div>
    <div style="float:left; line-height:19px">
        <div style="float:left; width:35px">Trang</div> 
        <div style="float:left; width:25px">
        <input type="text" value="{$vars.curpage}" name="page" id="page" onblur=" gotoPage_Interdisci('{$processurl}',this.value);" style="width:20px; font-size:12px; height:15px; border:1px solid #99bbe8">
        </div>
        <div style="float:left; width:20px"> / {$num_page}</div>
    </div>
    <div id="doc_page_area" style="width:37px">
    {if $vars.curpage eq $num_page}
    	<img src="{$css_path}icon_next_page.png" class="img_all">
        <img src="{$css_path}icon_last_page.png" class="img_all">
    {else}
    <a href="javascript: void(0)" id="next_page" onclick="gotoPage_Interdisci('{$processurl}',parseInt(document.getElementById('page').value)+parseInt(1));" title="Trang tiếp">
    	<img src="{$css_path}icon_next_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="last_page" onclick="gotoPage_Interdisci('{$processurl}',parseInt({$num_page}));" title="Trang cuối">
    	<img src="{$css_path}icon_last_page.png" class="img_all">
    </a>
    {/if}
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:left; width:15px">
    <a href="javascript: void(0)" id="a_ref_Interdisci" title="Tải lại"><img src="{$css_path}icon_refresh.png" class="img_all"></a>
    </div>
    
    <div style="float:left; width:10px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:right; line-height:19px; margin-right:6px">
        <div style="float:left; width:40px">Xem</div>
        <div style="float:left; width:42px">
            <select name="numresult" id="numresult_Interdisci" style="width:40px; font-size:12px; border:1px solid #99bbe8" onchange="reloadPage_Interdisci('{$processurl}');">
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
	function docheck_Interdisci(status,from_){
		var alen=document.frmList_Interdisci.elements.length;
		alen=(alen>5)?document.frmList_Interdisci.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
			document.frmList_Interdisci.chkid[i].checked=status;
		}
		else{
			document.frmList_Interdisci.chkid.checked=status;
		}
		if(from_>0) document.frmList_Interdisci.chkall.checked=status;
	}
		
	function docheckone_Interdisci(){
		var alen=document.frmList_Interdisci.elements.length;

		var isChecked=true;
		alen=(alen>4)?document.frmList_Interdisci.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_Interdisci.chkid[i].checked==false)
					isChecked=false;
		}else{
			if(document.frmList_Interdisci.chkid.checked==false)
				isChecked=false;
		}				
		document.frmList_Interdisci.chkall.checked=isChecked;
	}
	
	function calculatechon_Interdisci(){			
		var strchon="";
		var alen=document.frmList_Interdisci.elements.length;				
		alen=(alen>2)?document.frmList_Interdisci.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_Interdisci.chkid[i].checked==true)
					strchon+=document.frmList_Interdisci.chkid[i].value+",";
		}else{
			if(document.frmList_Interdisci.chkid.checked==true)
				strchon=document.frmList_Interdisci.chkid.value;
		}
		document.frmList_Interdisci.chon_Interdisci.value=strchon;
	}
	
	function delItems_Interdisci(processurl,delStr){
		if (delStr == undefined){
			calculatechon_Interdisci();
			delStr = document.getElementById("chon_Interdisci").value;
		}
		if (delStr == ""){
			return false;
		}
		if(!confirm("THÔNG BÁO: \n\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
			return false;
		}	
		
		var numresult_Interdisci,order_Interdisci,curpage_Interdisci;
		numresult = $("#numresult_Interdisci").val();
		order = $("#order_Interdisci").val();
		curpage = $("#curpage_Interdisci").val();
		
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
				$('#thuoctinh_content_main_small_5').fadeOut('fast').load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+curpage).fadeIn("fast");
			}
		});
	}
	
	function reloadPage_Interdisci(processurl){
		var numresult_Interdisci,order_Interdisci,cur_pos;
		numresult = $("#numresult_Interdisci").val();
		order = $("#order_Interdisci").val();
		cur_pos = 0;
		$("#thuoctinh_content_main_small_5").load(processurl+"&numresult="+numresult+"&order="+order+"&cur_pos="+cur_pos);
	}
	
	function gotoPage_Interdisci(processurl,page){
		var numresult_Interdisci,order_Interdisci,cur_pos;
		numresult = $("#numresult_Interdisci").val();
		order = $("#order_Interdisci").val();
		//alert(processurl+'-'+page+'-'+numresult+'-'+order);
		$("#thuoctinh_content_main_small_5").load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+page);
	}
	
	function uncheck_fns_Interdisci(field,val,id){
		$("#thuoctinh_content_main_small_5").load("?listInterdisci&mod=interdiscis&checkUncheck="+val+"&setfield="+field+"&checkUncheckID="+id);
	}
	
	function sort_me_Interdisci(id,val){
		$("#thuoctinh_content_main_small_5").load("?listInterdisci&mod=interdiscis&sort_me=1&interdisci_id="+id+"&val="+val);
	}
	
	function search_me_Interdisci(){
		var keyword = document.frmList_Interdisci.keyword.value;
		if (keyword == ""){
			return false;
		}
		
		$.post('?listInterdisci&mod=interdiscis',
			{keyword:keyword},
			function(data){
				$('#thuoctinh_content_main_small_5').html(data);
				$("#thuoctinh_content_main_small_5").show();
			}
		);
	}
	
	function edit_me_Interdisci(id){
		$("#thuoctinh_content_main_small_5").load("?listInterdisci&mod=interdiscis&edit_me=1&interdisci_id="+id);
	}
		
	$("#a_ref_Interdisci").click( function () { 
			$('#thuoctinh_content_main_small_5').hide();
			$('#thuoctinh_content_main_small_5').fadeOut('fast').load('index.php?listInterdisci&mod=interdiscis').fadeIn("fast");
		});
</script>
{/literal}
