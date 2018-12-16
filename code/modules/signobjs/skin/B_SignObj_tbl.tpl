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
	<form method="post" name="frmList_SignObj" action="?listSignObj{$vars.arg}" id="frmList_SignObj">
    <!------------------------------------------THEM MOI------------------------------------>
    <div style="float:left;">
    <fieldset style="width:452px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:181px">
    <legend class="legend_list">
        Thêm/Chỉnh sửa&nbsp;|&nbsp;Thông báo:&nbsp;
        <span id="lblError_SignObj" class="error">Mời bạn nhập đủ dữ liệu!</span>
    </legend>
    	<table width="98%" cellspacing="0" cellpadding="0" border="0" style="margin-left:5px">
        	<tr height="10"><td colspan="4"></td></tr>
            <tr height="30">
            	<td align="left">
                	<div style="float:left; width:30%; line-height:25px; text-align:left">Tên chức vụ <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left">
                    <input type="text" name="signObj_name" id="signObj_name" class="text_middle" value="{$obj_info.signObj_name}" onfocus="hide_message_SignObj()"/>
                    </div>
                </td>
            </tr>
            <tr height="30">
            	<td align="left">
                	<div style="float:left; width:30%; line-height:25px; text-align:left">Tình trạng :</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left">
                    	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            {if $obj_info.signObj_active neq ''}
                            <td width="30%">
                            <input type="radio" id="signObj_active" name="signObj_active" value="1" {if $obj_info.signObj_active eq 1} checked="checked" {/if} />&nbsp;Hiển thị</td>
                            <td>
                            <input type="radio" id="signObj_active" name="signObj_active" value="2" {if $obj_info.signObj_active eq 2} checked="checked" {/if} />&nbsp;Không hiển thị</td>
                            {else}
                            <td width="30%">
                            <input type="radio" id="signObj_active" name="signObj_active" value="1" checked/>&nbsp;Hiển thị</td>
                            <td>
                            <input type="radio" id="signObj_active" name="signObj_active" value="2" />&nbsp;Không hiển thị</td>
                            {/if}
                          </tr>
                        </table>
                    </div>
                </td>
            </tr>
            <tr height="30">
            	<td align="center">
                	<input type="button" name="btnSub_SignObj" id="btnSub_SignObj" value="Ghi lại" class="button"/>
                    <input type="hidden" name="signObj_id" id="signObj_id" value="{$obj_info.signObj_id}">
                    <input type="reset" name="Reset" value="Hủy bỏ" class="button" />
                    {literal}
                    <script language="javascript">
                        function hide_message_SignObj(){
                            $('#lblError_SignObj').hide();
                        }
                        
                        $(function() {
                        $('.error').hide();
                        $('#lblMessage_SignObj').hide();
                         
                        $("#btnSub_SignObj").click(function() {
                            $('.error').hide();
                             
                            var $form = $("#frmList_SignObj");
                            var signObj_name = $form.find('input#signObj_name').val();
                            var signObj_active = $form.find('input#signObj_active:checked').val();
                            var signObj_id = $form.find('input#signObj_id').val();
                             
                            //begin validate form
                            if (signObj_name == ""){
                                $('#lblError_SignObj').show();
                            }
                            else{
                                var dataString  = "signObj_name=" + signObj_name;
                                    dataString += "&signObj_active=" + signObj_active;
                                    dataString += "&signObj_id=" + signObj_id +"";
                                    //alert (dataString);return false;
                                $.ajax({
                                    type: "POST",
                                    url: "index.php?listSignObj&mod=signobjs&add_edit=1",
                                    data: dataString,
                                    success: function(data) {
                                        $('#thuoctinh_content_main_small_3').fadeOut('fast').load('index.php?listSignObj&mod=signobjs').fadeIn("fast");
                                        //$('#lblMessage_SignObj').show();
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
    </div>
    <!------------------------------------DANH SACH---------------------------------------------->
    <div style="float:left;">
    <fieldset style="width:447px; border:1px solid #99bbe8; margin-left:8px; margin-top:4px; height:160px">
    <legend class="legend_list">
        <div style="width:130px; float:left">Danh sách: {$total_num_result}</div>
        <div style="width:70px; float:left">&nbsp;|&nbsp;Tìm kiếm&nbsp;</div>
        <div style="width:100px; float:left">
        	<input type="text" name="keyword" id="keyword" class="text_seek" value="{$vars.keyword}" autocomplete="off"/>
            <input type="hidden" id="processurl" value="{$processurl}" />
        </div>
        <div style="width:50px; float:left">
        	<input type="button" name="btnSeek" id="btnSeek" value="Tìm >>" class="button_seek" onclick="search_me_SignObj()" /></div>
    </legend>
    	<div style="float:left; height:5px; width:100%"></div>
        <div style="float:left; height:25px; width:427px; border-top:1px solid #99bbe8; border-bottom:1px solid #99bbe8 ">
            <div class="tbl_tit" style="width:30px; text-align:center"><b>STT</b></div>
            <div class="tbl_tit" style="width:175px"><B>&nbsp;Tên chức vụ</B></div>
            <div class="tbl_tit" style="width:59px; text-align:center"><B>Sắp xếp</B></div>
            <div class="tbl_tit" style="width:59px; text-align:center"><B>Hiển thị</B></div>
            <div class="tbl_tit" style="width:59px; text-align:center"><B>Chọn</B></div>
            <div class="tbl_tit" style="width:39px; text-align:center">
            <input type="hidden" name="chon" id="chon_SignObj">
            <input type="checkbox" name="chkall" value="0" onclick="docheck_SignObj(document.frmList_SignObj.chkall.checked,0);">
            </div>
        </div>
        <div style="float:left; width:20px; text-align:right">
        <input type="button" name="del_Items" id='del_Items' value="&nbsp;" onClick="delItems_SignObj('{$processurl}');" style="width:17px; font-size:12px; background:url(../images/admin/b_drop.png); cursor:pointer" title="Xóa lựa chọn">
        </div>
        <div style="float:left; height:105px; width:447px; overflow-y:scroll">
            {section name=pi loop=$obj_list}
            {if $smarty.section.pi.index is not div by 2}
            {assign var="class_td" value="tbl_cont"}
            {else}
            {assign var="class_td" value="tbl_cont2"}
            {/if}
            {math x=$vars.curpage-1 y=$vars.numresult z=$smarty.section.pi.index t=1 equation="x*y+z+t" assign=stt}
            <div class="{$class_td}" style="width:30px; text-align:center">{$stt}</div>
            <div class="{$class_td}" style="width:175px">
            	&nbsp;<a href="javascript: void(0);" onclick="edit_me_SignObj({$obj_list[pi]->signObj_id})" >{$obj_list[pi]->signObj_name}</a>
            </div>
            <div class="{$class_td}" style="width:59px; text-align:center">
                <select name="signObj_sort[]" onchange="sort_me_SignObj({$obj_list[pi]->signObj_id},this.value)" class="select_tiny">
                {section name=i loop=$total_num_result}
                    <option value="{$smarty.section.i.index}" {if $smarty.section.i.index eq $obj_list[pi]->signObj_sort} selected="selected"{/if}>{$smarty.section.i.index}</option>
                {/section}
                </select>
                <input type="hidden" name="signObj_id1[]" value="{$obj_list[pi]->signObj_id}">
            </div>
            <div class="{$class_td}" style="width:59px; text-align:center">
                {if $obj_list[pi]->signObj_active eq 1}
                    <a href='javascript: void(0);' onclick="uncheck_fns_SignObj('signObj_active',2,{$obj_list[pi]->signObj_id})"><img src="../images/admin/tick.png" width="10" height="10" border="0" title="Ẩn"></a>
                {else}
                    <a href='javascript: void(0);' onclick="uncheck_fns_SignObj('signObj_active',1,{$obj_list[pi]->signObj_id})"><img src="../images/admin/publish_x.png" width="10" height="10" border="0" title="Hiện"></a>
                {/if}
            </div>
            <div class="{$class_td}" style="width:29px; text-align:center">
                <a href='javascript: void(0);' onclick="edit_me_SignObj({$obj_list[pi]->signObj_id})">
                <img src="../images/admin/b_edit.png" width="11" height="11" border="0" title="Sửa"></a>
            </div>
            <div class="{$class_td}" style="width:29px; text-align:center">
                <a href='javascript: void(0'  onClick="delItems_SignObj('{$processurl}', {$obj_list[pi]->signObj_id});">
                <img src="../images/admin/b_drop.png" width="11" height="11" border="0" title="Xóa"></a>
            </div>
            <div class="{$class_td}" style="width:39px; text-align:center">
            	<input type="checkbox" name="chkid" value="{$obj_list[pi]->signObj_id}" onclick="docheckone_SignObj();">
            </div>
            {/section}
        </div>
        <input type="hidden" id="curpage" name="curpage_SignObj" value="{$vars.curpage}" />
    </fieldset>
    </div>
    <!------------------------------------------------- Tool bar --------------------------------------------->
    <div id="doc_clear_txt" style="float:right; width:49.5%; height:4px"></div>
    <div id="doc_tool_bar" style="float:right; width:49.5%; margin-left:4px">

        <div id="doc_search_area" style="width:92px; padding-left:0">
        <select name="order" id="order_SignObj" style="width:90px; font-size:12px; border:1px solid #99bbe8" onchange="reloadPage_SignObj('{$processurl}');">
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
        <a href="javascript: void(0)" id="first_page" onclick="gotoPage_SignObj('{$processurl}',parseInt(1));" title="Trang đầu">
            <img src="{$css_path}icon_first_page.png" class="img_all">
        </a>
        <a href="javascript: void(0)" id="pre_page" onclick="gotoPage_SignObj('{$processurl}',parseInt(document.getElementById('page_SignObj').value)-parseInt(1));" title="Trang trước">
            <img src="{$css_path}icon_pre_page.png" class="img_all">
        </a>
        {/if}
        </div>
        <div style="float:left; line-height:19px">
            <div style="float:left; width:35px">Trang</div>
            <div style="float:left; width:25px">
            <input type="text" value="{$vars.curpage}" name="page" id="page_SignObj" onblur=" gotoPage_SignObj('{$processurl}',this.value);" style="width:20px; font-size:12px; height:15px; border:1px solid #99bbe8">
            </div>
            <div style="float:left; width:20px"> / {$num_page}</div>
        </div>
        <div id="doc_page_area" style="width:37px">
        {if $vars.curpage eq $num_page}
            <img src="{$css_path}icon_next_page.png" class="img_all">
            <img src="{$css_path}icon_last_page.png" class="img_all">
        {else}
        <a href="javascript: void(0)" id="next_page" onclick="gotoPage_SignObj('{$processurl}',parseInt(document.getElementById('page_SignObj').value)+parseInt(1));" title="Trang tiếp">
            <img src="{$css_path}icon_next_page.png" class="img_all">
        </a>
        <a href="javascript: void(0)" id="last_page" onclick="gotoPage_SignObj('{$processurl}',parseInt({$num_page}));" title="Trang cuối">
            <img src="{$css_path}icon_last_page.png" class="img_all">
        </a>
        {/if}
        </div>

        <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
        <div style="float:left; width:15px">
        <a href="javascript: void(0)" id="a_ref_SignObj" title="Tải lại"><img src="{$css_path}icon_refresh.png" class="img_all"></a>
        </div>

        <div style="float:left; width:10px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
        <div style="float:right; line-height:19px; margin-right:6px">
            <div style="float:left; width:40px">Xem</div>
            <div style="float:left; width:42px">
                <select name="numresult" id="numresult_SignObj" style="width:40px; font-size:12px; border:1px solid #99bbe8" onchange="reloadPage_SignObj('{$processurl}');">
                    {section name=sli loop=$nrs_arr}
                    <option value="{$nrs_arr[sli]}" {if $nrs_arr[sli] eq $vars.numresult}selected{/if}>{$nrs_arr[sli]} </option>
                    {/section}
                </select>
            </div>
            <div style="float:left">dòng / trang</div>
        </div>

    </div>
    </form>
</div>
{literal}
<script language="javascript">
	function docheck_SignObj(status,from_){
		var alen=document.frmList_SignObj.elements.length;
		alen=(alen>5)?document.frmList_SignObj.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
			document.frmList_SignObj.chkid[i].checked=status;
		}
		else{
			document.frmList_SignObj.chkid.checked=status;
		}
		if(from_>0) document.frmList_SignObj.chkall.checked=status;
	}

	function docheckone_SignObj(){
		var alen=document.frmList_SignObj.elements.length;

		var isChecked=true;
		alen=(alen>4)?document.frmList_SignObj.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_SignObj.chkid[i].checked==false)
					isChecked=false;
		}else{
			if(document.frmList_SignObj.chkid.checked==false)
				isChecked=false;
		}
		document.frmList_SignObj.chkall.checked=isChecked;
	}

	function calculatechon_SignObj(){
		var strchon="";
		var alen=document.frmList_SignObj.elements.length;
		alen=(alen>2)?document.frmList_SignObj.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_SignObj.chkid[i].checked==true)
					strchon+=document.frmList_SignObj.chkid[i].value+",";
		}else{
			if(document.frmList_SignObj.chkid.checked==true)
				strchon=document.frmList_SignObj.chkid.value;
		}
		document.frmList_SignObj.chon_SignObj.value=strchon;
	}

	function delItems_SignObj(processurl,delStr){
		if (delStr == undefined){
			calculatechon_SignObj();
			delStr = document.getElementById("chon_SignObj").value;
		}
		if (delStr == ""){
			return false;
		}
		if(!confirm("THÔNG BÁO: \n\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
			return false;
		}

		var numresult_SignObj,order_SignObj,curpage_SignObj;
		numresult = $("#numresult_SignObj").val();
		order = $("#order_SignObj").val();
		curpage = $("#curpage_SignObj").val();

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
				$('#thuoctinh_content_main_small_3').fadeOut('fast').load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+curpage).fadeIn("fast");
			}
		});
	}

	function reloadPage_SignObj(processurl){
		var numresult_SignObj,order_SignObj,cur_pos;
		numresult = $("#numresult_SignObj").val();
		order = $("#order_SignObj").val();
		cur_pos = 0;
		$("#thuoctinh_content_main_small_3").load(processurl+"&numresult="+numresult+"&order="+order+"&cur_pos="+cur_pos);
	}

	function gotoPage_SignObj(processurl,page){
		var numresult_SignObj,order_SignObj,cur_pos;
		numresult = $("#numresult_SignObj").val();
		order = $("#order_SignObj").val();
		//alert(processurl+'-'+page+'-'+numresult+'-'+order);
		$("#thuoctinh_content_main_small_3").load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+page);
	}

	function uncheck_fns_SignObj(field,val,id){
		$("#thuoctinh_content_main_small_3").load("?listSignObj&mod=signobjs&checkUncheck="+val+"&setfield="+field+"&checkUncheckID="+id);
	}

	function sort_me_SignObj(id,val){
		$("#thuoctinh_content_main_small_3").load("?listSignObj&mod=signobjs&sort_me=1&signObj_id="+id+"&val="+val);
	}

	function search_me_SignObj(){
		var keyword = document.getElementById('keyword').value;
		if (keyword == ""){
			return false;
		}

		$.post('?listSignObj&mod=signobjs',
			{keyword:keyword},
			function(data){
				$('#thuoctinh_content_main_small_3').html(data);
				$("#thuoctinh_content_main_small_3").show();
			}
		);
	}

	function edit_me_SignObj(id){
		$("#thuoctinh_content_main_small_3").load("?listSignObj&mod=signobjs&edit_me=1&signObj_id="+id);
	}

	$("#a_ref_SignObj").click( function () {
			$('#thuoctinh_content_main_small_3').hide();
			$('#thuoctinh_content_main_small_3').fadeOut('fast').load('index.php?listSignObj&mod=signobjs').fadeIn("fast");
		});
</script>
{/literal}