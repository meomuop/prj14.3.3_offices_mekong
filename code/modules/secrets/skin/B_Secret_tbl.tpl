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
	<form method="post" name="frmList_Secret" action="?listSecret{$vars.arg}" id="frmList_Secret">
    <!------------------------------------------THEM MOI------------------------------------>
    <fieldset style="width:452px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
    <legend class="legend_list">
        Thêm/Chỉnh sửa&nbsp;|&nbsp;Thông báo:&nbsp;
        <span id="lblError_Secret" class="error">Mời bạn nhập đủ dữ liệu!</span>
    </legend>
    	<table width="98%" cellspacing="0" cellpadding="0" border="0" style="margin-left:5px">
        	<tr height="10"><td colspan="4"></td></tr>
            <tr height="30">
                <td width="25%" align="left" height="20">Tên độ mật <font color="#FF0000">*</font>:</td>		
                <td align="left" width="25%">
                <input type="text" name="secret_name" id="secret_name" class="text_long" value="{$obj_info.secret_name}" onfocus="javascript: hide_message_Secret()"/>
                </td>
            </tr>
            <tr height="30">
                <td align="left">Tình trạng :</td>		
                <td align="left">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                      	{if $obj_info.secret_active neq ''}
                        <td width="20%">
                        <input type="radio" id="secret_active" name="secret_active" value="1" {if $obj_info.secret_active eq 1} checked="checked" {/if} />&nbsp;Hiển thị</td>
                        <td>
                        <input type="radio" id="secret_active" name="secret_active" value="2" {if $obj_info.secret_active eq 2} checked="checked" {/if} />&nbsp;Không hiển thị</td>
                        {else}
                        <td width="20%">
                        <input type="radio" id="secret_active" name="secret_active" value="1" checked/>&nbsp;Hiển thị</td>
                        <td>
                        <input type="radio" id="secret_active" name="secret_active" value="2" />&nbsp;Không hiển thị</td>
                        {/if}
                      </tr>
                    </table>
                </td>
            </tr>
            <tr height="30">
                <td align="center" colspan="2">
                	<input type="button" name="btnSub_Secret" id="btnSub_Secret" value="Ghi lại" class="button" />
                    <input type="hidden" name="secret_id" id="secret_id" value="{$obj_info.secret_id}">
                    <input type="reset" name="Reset" value="Hủy bỏ" class="button" />
                    {literal}
                    <script language="javascript">
                        function hide_message_Secret(){
                            $('#lblError_Secret').hide();
                        }
                        
                        $(function() {
                        $('.error').hide();
                        $('#lblMessage_Secret').hide();
                         
                        $("#btnSub_Secret").click(function() {
                            $('.error').hide();
                             
                            var $form = $("#frmList_Secret");
                            var secret_name = $form.find('input#secret_name').val();
							var secret_standfor = $form.find('input#secret_standfor').val();
                            var secret_active = $form.find('input#secret_active:checked').val();
                            var secret_id = $form.find('input#secret_id').val();
                             
                            //begin validate form
                            if (secret_name == "" || secret_standfor == ""){
                                $('#lblError_Secret').show();
                            }
                            else{
                                var dataString  = "secret_name=" + secret_name;
									dataString += "&secret_standfor=" + secret_standfor;
                                    dataString += "&secret_active=" + secret_active;
                                    dataString += "&secret_id=" + secret_id +"";
                                    //alert (dataString);return false;
                                $.ajax({
                                    type: "POST",
                                    url: "index.php?listSecret&mod=secrets&add_edit=1",
                                    data: dataString,
                                    success: function(data) {
                                        $('#thuoctinh_content_main_small_2').fadeOut('fast').load('index.php?listSecret&mod=secrets').fadeIn("fast");
                                        //$('#lblMessage_Secret').show();
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
    <fieldset style="width:452px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:332px">
    <legend class="legend_list">
        <div style="width:130px; float:left">Danh sách: {$total_num_result}</div>
        <div style="width:70px; float:left">&nbsp;|&nbsp;Tìm kiếm&nbsp;</div>
        <div style="width:100px; float:left">
        	<input type="text" name="keyword" id="keyword" class="text_seek" value="{$vars.keyword}"/>
            <input type="hidden" id="processurl" value="{$processurl}" />
        </div>
        <div style="width:50px; float:left">
        	<input type="button" name="btnSeek" id="btnSeek" value="Tìm >>" class="button_seek" onclick="search_me_Secret()" /></div>
    </legend>
    	<div style="float:left; height:5px; width:100%"></div>
        <div style="float:left; height:25px; width:432px; border-top:1px solid #99bbe8; border-bottom:1px solid #99bbe8 ">
            <div class="tbl_tit" style="width:30px; text-align:center"><b>STT</b></div>	
            <div class="tbl_tit" style="width:109px"><B>&nbsp;Tên độ mật</B></div>
            <div class="tbl_tit" style="width:70px"><B>&nbsp;Ngày nhập</B></div>
            <div class="tbl_tit" style="width:59px; text-align:center"><B>Sắp xếp</B></div>
            <div class="tbl_tit" style="width:59px; text-align:center"><B>Hiển thị</B></div>
            <div class="tbl_tit" style="width:59px; text-align:center"><B>Chọn</B></div>
            <div class="tbl_tit" style="width:39px; text-align:center">
            <input type="hidden" name="chon" id="chon_Secret">
            <input type="checkbox" name="chkall" value="0" onclick="docheck_Secret(document.frmList_Secret.chkall.checked,0);">
            </div>
        </div>
        <div style="float:left; width:20px; text-align:right">
        <input type="button" name="del_Items" id='del_Items' value="&nbsp;" onClick="delItems_Secret('{$processurl}');" style="width:17px; font-size:12px; background:url(../images/admin/b_drop.png); cursor:pointer" title="Xóa lựa chọn">
        </div>
        <div style="float:left; height:275px; width:452px; overflow-y:scroll">
            {section name=pi loop=$obj_list}
            {if $smarty.section.pi.index is not div by 2} 
            {assign var="class_td" value="tbl_cont"} 
            {else}
            {assign var="class_td" value="tbl_cont2"} 
            {/if}
            {math x=$vars.curpage-1 y=$vars.numresult z=$smarty.section.pi.index t=1 equation="x*y+z+t" assign=stt}
            <div class="{$class_td}" style="width:30px; text-align:center">{$stt}</div>
            <div class="{$class_td}" style="width:109px">
            	&nbsp;<a href="javascript: void(0);" onclick="edit_me_Secret({$obj_list[pi]->secret_id})" >{$obj_list[pi]->secret_name}</a>
            </div>
            <div class="{$class_td}" style="width:70px">
            	&nbsp;{$obj_list[pi]->secret_date|date_format:"%d/%m%Y"}
            </div>
            <div class="{$class_td}" style="width:59px; text-align:center">
                <select name="secret_sort[]" onchange="sort_me_Secret({$obj_list[pi]->secret_id},this.value)" class="select_tiny">
                {section name=i loop=$total_num_result}
                    <option value="{$smarty.section.i.index}" {if $smarty.section.i.index eq $obj_list[pi]->secret_sort} selected="selected"{/if}>{$smarty.section.i.index}</option>
                {/section}
                </select>
                <input type="hidden" name="secret_id1[]" value="{$obj_list[pi]->secret_id}">
            </div>
            <div class="{$class_td}" style="width:59px; text-align:center">
                {if $obj_list[pi]->secret_active eq 1}
                    <a href='javascript: void(0);' onclick="uncheck_fns_Secret('secret_active',2,{$obj_list[pi]->secret_id})"><img src="../images/admin/tick.png" width="10" height="10" border="0" title="Ẩn"></a>
                {else}
                    <a href='javascript: void(0);' onclick="uncheck_fns_Secret('secret_active',1,{$obj_list[pi]->secret_id})"><img src="../images/admin/publish_x.png" width="10" height="10" border="0" title="Hiện"></a>
                {/if}
            </div>
            <div class="{$class_td}" style="width:29px; text-align:center">
                <a href='javascript: void(0);' onclick="edit_me_Secret({$obj_list[pi]->secret_id})">
                <img src="../images/admin/b_edit.png" width="11" height="11" border="0" title="Sửa"></a>
            </div>
            <div class="{$class_td}" style="width:29px; text-align:center">
                <a href='javascript: void(0'  onClick="delItems_Secret('{$processurl}', {$obj_list[pi]->secret_id});">
                <img src="../images/admin/b_drop.png" width="11" height="11" border="0" title="Xóa"></a>
            </div>
            <div class="{$class_td}" style="width:39px; text-align:center">
            	<input type="checkbox" name="chkid" value="{$obj_list[pi]->secret_id}" onclick="docheckone_Secret();">
            </div>
            {/section}
        </div>
        <input type="hidden" id="curpage_Secret" name="curpage" value="{$vars.curpage}" />
    </fieldset>
    </form>
</div>
<!------------------------------------------------- Tool bar --------------------------------------------->
<div id="doc_clear_txt"></div>
<div id="doc_tool_bar">

    <div id="doc_search_area" style="width:92px">
    <select name="order" id="order_Secret" style="width:90px; font-size:12px; border:1px solid #99bbe8" onchange="reloadPage_Secret('{$processurl}');">
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
    <a href="javascript: void(0)" id="first_page" onclick="gotoPage_Secret('{$processurl}',parseInt(1));" title="Trang đầu">
    	<img src="{$css_path}icon_first_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="pre_page" onclick="gotoPage_Secret('{$processurl}',parseInt(document.getElementById('page_Secret').value)-parseInt(1));" title="Trang trước">
    	<img src="{$css_path}icon_pre_page.png" class="img_all">
    </a>
    {/if}
    </div>
    <div style="float:left; line-height:19px">
        <div style="float:left; width:35px">Trang</div> 
        <div style="float:left; width:25px">
        <input type="text" value="{$vars.curpage}" name="page" id="page_Secret" onblur=" gotoPage_Secret('{$processurl}',this.value);" style="width:20px; font-size:12px; height:15px; border:1px solid #99bbe8">
        </div>
        <div style="float:left; width:20px"> / {$num_page}</div>
    </div>
    <div id="doc_page_area" style="width:37px">
    {if $vars.curpage eq $num_page}
    	<img src="{$css_path}icon_next_page.png" class="img_all">
        <img src="{$css_path}icon_last_page.png" class="img_all">
    {else}
    <a href="javascript: void(0)" id="next_page" onclick="gotoPage_Secret('{$processurl}',parseInt(document.getElementById('page_Secret').value)+parseInt(1));" title="Trang tiếp">
    	<img src="{$css_path}icon_next_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="last_page" onclick="gotoPage_Secret('{$processurl}',parseInt({$num_page}));" title="Trang cuối">
    	<img src="{$css_path}icon_last_page.png" class="img_all">
    </a>
    {/if}
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:left; width:15px">
    <a href="javascript: void(0)" id="a_ref_Secret" title="Tải lại"><img src="{$css_path}icon_refresh.png" class="img_all"></a>
    </div>
    
    <div style="float:left; width:10px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:right; line-height:19px; margin-right:6px">
        <div style="float:left; width:40px">Xem</div>
        <div style="float:left; width:42px">
            <select name="numresult" id="numresult_Secret" style="width:40px; font-size:12px; border:1px solid #99bbe8" onchange="reloadPage_Secret('{$processurl}');">
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
	function docheck_Secret(status,from_){
		var alen=document.frmList_Secret.elements.length;
		alen=(alen>5)?document.frmList_Secret.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
			document.frmList_Secret.chkid[i].checked=status;
		}
		else{
			document.frmList_Secret.chkid.checked=status;
		}
		if(from_>0) document.frmList_Secret.chkall.checked=status;
	}
		
	function docheckone_Secret(){
		var alen=document.frmList_Secret.elements.length;

		var isChecked=true;
		alen=(alen>4)?document.frmList_Secret.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_Secret.chkid[i].checked==false)
					isChecked=false;
		}else{
			if(document.frmList_Secret.chkid.checked==false)
				isChecked=false;
		}				
		document.frmList_Secret.chkall.checked=isChecked;
	}
	
	function calculatechon_Secret(){			
		var strchon="";
		var alen=document.frmList_Secret.elements.length;				
		alen=(alen>2)?document.frmList_Secret.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_Secret.chkid[i].checked==true)
					strchon+=document.frmList_Secret.chkid[i].value+",";
		}else{
			if(document.frmList_Secret.chkid.checked==true)
				strchon=document.frmList_Secret.chkid.value;
		}
		document.frmList_Secret.chon_Secret.value=strchon;
	}
	
	function delItems_Secret(processurl,delStr){
		if (delStr == undefined){
			calculatechon_Secret();
			delStr = document.getElementById("chon_Secret").value;
		}
		if (delStr == ""){
			return false;
		}
		if(!confirm("THÔNG BÁO: \n\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
			return false;
		}	
		
		var numresult_Secret,order_Secret,curpage_Secret;
		numresult = $("#numresult_Secret").val();
		order = $("#order_Secret").val();
		curpage = $("#curpage_Secret").val();
		
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
				$('#thuoctinh_content_main_small_2').fadeOut('fast').load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+curpage).fadeIn("fast");
			}
		});
	}
	
	function reloadPage_Secret(processurl){
		var numresult_Secret,order_Secret,cur_pos;
		numresult = $("#numresult_Secret").val();
		order = $("#order_Secret").val();
		cur_pos = 0;
		$("#thuoctinh_content_main_small_2").load(processurl+"&numresult="+numresult+"&order="+order+"&cur_pos="+cur_pos);
	}
	
	function gotoPage_Secret(processurl,page){
		var numresult_Secret,order_Secret,cur_pos;
		numresult = $("#numresult_Secret").val();
		order = $("#order_Secret").val();
		//alert(processurl+'-'+page+'-'+numresult+'-'+order);
		$("#thuoctinh_content_main_small_2").load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+page);
	}
	
	function uncheck_fns_Secret(field,val,id){
		$("#thuoctinh_content_main_small_2").load("?listSecret&mod=secrets&checkUncheck="+val+"&setfield="+field+"&checkUncheckID="+id);
	}
	
	function sort_me_Secret(id,val){
		$("#thuoctinh_content_main_small_2").load("?listSecret&mod=secrets&sort_me=1&secret_id="+id+"&val="+val);
	}
	
	function search_me_Secret(){
		var keyword = document.frmList_Secret.keyword.value;
		if (keyword == ""){
			return false;
		}
		
		$.post('?listSecret&mod=secrets',
			{keyword:keyword},
			function(data){
				$('#thuoctinh_content_main_small_2').html(data);
				$("#thuoctinh_content_main_small_2").show();
			}
		);
	}
	
	function edit_me_Secret(id){
		$("#thuoctinh_content_main_small_2").load("?listSecret&mod=secrets&edit_me=1&secret_id="+id);
	}
		
	$("#a_ref_Secret").click( function () { 
			$('#thuoctinh_content_main_small_2').hide();
			$('#thuoctinh_content_main_small_2').fadeOut('fast').load('index.php?listSecret&mod=secrets').fadeIn("fast");
		});
</script>
{/literal}