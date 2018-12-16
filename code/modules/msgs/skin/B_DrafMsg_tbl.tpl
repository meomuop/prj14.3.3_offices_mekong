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
<div id="msg_content_insign">
	<form method="post" name="frmList_Msg" action="?listDrafMsg{$vars.arg}" id="frmList_Msg">
    <!------------------------------------KHO DU LIEU---------------------------------------------->
    <div style="float:left">
    <fieldset style="width:125px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:272px">
        <legend class="legend" style="width:80px">
            <div style="width:60px; float:left">Thao tác</div>
        </legend>
    	<div style="float:left; height:5px; width:100%"></div>
        <div style="float:left; height:255px; width:125px;">
            <div style="float:left; line-height:30px">
            	<div style="float:left; width:20px; text-align:center">&diams;</div>
                <div style="float:left; width:100px">
                	<a href="javascript:void(0);" onclick="javascript: show_soan_msg()" {if $soan_msg eq 1} style="color:#F00" {/if}>&nbsp;Soạn tin</a>
                </div>
            </div>
            <div style="float:left; line-height:30px">
            	<div style="float:left; width:20px; text-align:center">&diams;</div>
                <div style="float:left; width:100px">
                	<a href="javascript:void(0);" onclick="javascript: show_inbox_msg()" {if $inbox eq 1} style="color:#F00" {/if}>&nbsp;Hộp thư đến</a>
                </div>
            </div>
            <div style="float:left; line-height:30px">
            	<div style="float:left; width:20px; text-align:center">&diams;</div>
                <div style="float:left; width:100px">
                	<a href="javascript:void(0);" onclick="javascript: show_outbox_msg()" {if $outbox eq 1} style="color:#F00" {/if}>&nbsp;Hộp thư đi</a>
                </div>
            </div>
            <div style="float:left; line-height:30px">
            	<div style="float:left; width:20px; text-align:center">&diams;</div>
                <div style="float:left; width:100px">
                	<a href="javascript:void(0);" onclick="javascript: show_drafmsg_msg()" {if $drafmsg eq 1} style="color:#F00" {/if}>&nbsp;Tin nháp</a>
                </div>
            </div>
            <div style="float:left; line-height:30px">
            	<div style="float:left; width:20px; text-align:center">&diams;</div>
                <div style="float:left; width:100px">
                	<a href="javascript:void(0);" onclick="javascript: show_wastemsg_msg()" {if $wastemsg eq 1} style="color:#F00" {/if}>&nbsp;Tin rác</a>
                </div>
            </div>
            <div style="float:left; line-height:30px">
            	<div style="float:left; width:20px; text-align:center">&diams;</div>
                <div style="float:left; width:100px">
                	<a href="javascript:void(0);" onclick="javascript: show_impmsg_msg()" {if $impmsg eq 1} style="color:#F00" {/if}>&nbsp;Tin quan trọng</a>
                </div>
            </div>
        </div>
        <input type="hidden" id="msg_type" name="msg_type" value="{$msg_type}" />
    </fieldset>
    </div>
    <!------------------------------------DU LIEU---------------------------------------------->
    <div style="float:left">
    <fieldset style="width:380px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:272px">
    	<legend class="legend_list" style="width:325px">
            <div style="width:100px; float:left">Thông tin</div>
            <div style="width:70px; float:left">&nbsp;|&nbsp;Tìm kiếm&nbsp;</div>
            <div style="width:100px; float:left">
                <input type="text" name="keyword" id="keyword" class="text_seek" value="{$vars.keyword}"/>
                <input type="hidden" id="processurl" value="{$processurl}" />
            </div>
            <div style="width:50px; float:left">
                <input type="button" name="btnSeek" id="btnSeek" value="Tìm >>" class="button_seek" onclick="search_me_Msg()" /></div>
        </legend>
    	<div style="float:left; height:5px; width:100%"></div>
    	<div style="float:left; height:25px; width:362px; border-top:1px solid #99bbe8; border-bottom:1px solid #99bbe8 ">
            <div class="tbl_tit" style="width:30px; text-align:center"><b>STT</b></div>	
            <div class="tbl_tit" style="width:259px"><B>&nbsp;Nội dung</B></div>
            <div class="tbl_tit" style="width:70px"><B>&nbsp;Ngày tháng</B></div>
        </div>
        <div style="float:left; height:218px; width:380px; overflow-y:scroll">
        	{if $obj_list}
            {section name=mi loop=$obj_list}
            {if $smarty.section.mi.index is not div by 2} 
            {assign var="class_td" value="tbl_cont"} 
            {else}
            {assign var="class_td" value="tbl_cont2"} 
            {/if}
            {math z=$smarty.section.mi.index t=1 equation="z+t" assign=stt}
            <div class="{$class_td}" style="width:30px; text-align:center">{$stt}</div>
            <div class="{$class_td}" style="width:259px;">
            	<div style="float:left; width:200px; white-space:nowrap">&nbsp;{$obj_list[mi]->msg_cont|str_string_cut:50:1}</div>
                <div style="float:right; margin:2px; height:21px; width:25px; text-align:center; background-color:#dfe8f6" title="Xóa">
                <a href="javascript: void(0)" onclick="javascript: delete_draf({$obj_list[mi]->msg_id})">
                <img src="{$css_path}icon_delete.png" width="16" height="16" border="0" class="img_all" style="margin:1px">
                </a>
                </div>
                <div style="float:right; margin:2px; height:21px; width:25px; text-align:center; background-color:#dfe8f6" title="Sửa/Gửi">
                <a href="javascript: void(0)" onclick="javascript: edit_msg({$obj_list[mi]->msg_id})">
                <img src="{$css_path}icon_edit.png" width="16" height="16" border="0" class="img_all" style="margin:1px">
                </a>
                </div>
            </div>
            <div class="{$class_td}" style="width:70px">
            	&nbsp;{$obj_list[mi]->msg_date|date_format:'%d/%m/%Y'}
            </div>
            {/section}
            {else}<div class="{$class_td}" style="width:357px; text-align:center; line-height: 20px">Chưa có nội dung</div>{/if}
        </div>
        <input type="hidden" id="curpage_Msg" name="curpage" value="{$vars.curpage}" />
    </fieldset>
    </div>
    </form>
</div>
<!------------------------------------------------- Tool bar --------------------------------------------->
<div id="msg_clear_txt" style="width:100%"></div>
<div id="msg_tool_bar" style="width:99%">

    <div id="msg_search_area" style="width:92px; padding-left:3px">
    <select name="order" id="order_Msg" style="width:90px; font-size:12px; border:1px solid #99bbe8" onchange="reloadPage_Msg('{$processurl}');">
    {section name=sli loop=$order_arr}
        <option value="{$smarty.section.sli.index}" {if $smarty.section.sli.index eq $vars.order}selected{/if} >
        {$order_arr[sli]}
        </option>
    {/section}
    </select>
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div id="msg_page_area" style="width:38px">
    {if $vars.curpage eq 1}
    	<img src="{$css_path}icon_first_page.png" class="img_all">
    	<img src="{$css_path}icon_pre_page.png" class="img_all">
    {else}
    <a href="javascript: void(0)" id="first_page" onclick="gotoPage_Msg('{$processurl}',parseInt(1));" title="Trang đầu">
    	<img src="{$css_path}icon_first_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="pre_page" onclick="gotoPage_Msg('{$processurl}',parseInt(document.getElementById('page_signPer').value)-parseInt(1));" title="Trang trước">
    	<img src="{$css_path}icon_pre_page.png" class="img_all">
    </a>
    {/if}
    </div>
    <div style="float:left; line-height:19px">
        <div style="float:left; width:35px">Trang</div> 
        <div style="float:left; width:25px">
        <input type="text" value="{$vars.curpage}" name="page" id="page_signPer" onblur=" gotoPage_Msg('{$processurl}',this.value);" style="width:20px; font-size:12px; height:15px; border:1px solid #99bbe8">
        </div>
        <div style="float:left; width:20px"> / {$num_page}</div>
    </div>
    <div id="msg_page_area" style="width:37px">
    {if $vars.curpage eq $num_page}
    	<img src="{$css_path}icon_next_page.png" class="img_all">
        <img src="{$css_path}icon_last_page.png" class="img_all">
    {else}
    <a href="javascript: void(0)" id="next_page" onclick="gotoPage_Msg('{$processurl}',parseInt(document.getElementById('page_signPer').value)+parseInt(1));" title="Trang tiếp">
    	<img src="{$css_path}icon_next_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="last_page" onclick="gotoPage_Msg('{$processurl}',parseInt({$num_page}));" title="Trang cuối">
    	<img src="{$css_path}icon_last_page.png" class="img_all">
    </a>
    {/if}
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:left; width:15px">
    <a href="javascript: void(0)" id="a_ref_Msg" title="Tải lại"><img src="{$css_path}icon_refresh.png" class="img_all"></a>
    </div>
    <div style="float:left; width:10px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:right; line-height:19px; margin-right:6px">
        <div style="float:left; width:40px">Xem</div>
        <div style="float:left; width:42px">
            <select name="numresult" id="numresult_Msg" style="width:40px; font-size:12px; border:1px solid #99bbe8" onchange="reloadPage_Msg('{$processurl}');">
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
	
	function search_me_Msg(){
		var keyword = document.getElementById('keyword').value;
		if (keyword == ""){
			return false;
		}
		
		$.post('?listDrafMsg&mod=msgs&drafmsg=1',
			{keyword:keyword},
			function(data){
				$('#msg_content_main').html(data);
				$("#msg_content_main").show();
			}
		);
	}
	
	function edit_msg(msg_id){
		$('#msg_content_main').load('index.php?addMsg&mod=msgs&soan_msg=1&edit_me=1&msg_id='+msg_id).fadeIn("fast");	
	}
	
	function delete_draf(delStr){
		if(!confirm("THÔNG BÁO: \n\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
			return false;
		}	
				
		var dataString = "dlStr=" + delStr +"";
			//alert (dataString);
		$.ajax({
			type: "POST",
			url: 'index.php?listDrafMsg&mod=msgs&drafmsg=1',
			data: dataString,
			success: function(data) {
				$('#msg_content_main').load('index.php?listDrafMsg&mod=msgs&drafmsg=1').fadeIn("fast");
			}
		});
	}
		
	function reloadPage_Msg(processurl){
		var numresult_Msg,order_Msg,cur_pos;
		numresult = $("#numresult_Msg").val();
		order = $("#order_Msg").val();
		cur_pos = 0;
		$("#msg_content_main").load(processurl+"&numresult="+numresult+"&order="+order+"&cur_pos="+cur_pos);
	}
	
	function gotoPage_Msg(processurl,page){
		var numresult_Msg,order_Msg,cur_pos;
		numresult = $("#numresult_Msg").val();
		order = $("#order_Msg").val();
		//alert(processurl+'-'+page+'-'+numresult+'-'+order);
		$("#msg_content_main").load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+page);
	}
				
	$("#a_ref_Msg").click( function () { 
			$('#msg_content_main').hide();
			$('#msg_content_main').fadeOut('fast').load('?listDrafMsg&mod=msgs&drafmsg=1').fadeIn("fast");
	});
	
</script>
{/literal}