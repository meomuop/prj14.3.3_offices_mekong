{literal}
<style type="text/css">
.error { 
color:#FF0000;font-weight:bold; margin-left:5px; height:20px; line-height:20px
}
.msg{ 
color:#00F; font-weight:bold; margin-left:5px; height:20px; line-height:20px
}
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
<div id="div_vttb_info_content_insign">
	<form method="post" name="frmView_Vttb_info" action="?viewVttv{$vars.arg}" id="frmView_Vttb_info">
    <!------------------------------------------THONG TIN------------------------------------>
    <fieldset style="width:513px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
        <legend class="legend">Thông tin:</legend>
    	<table width="98%" cellspacing="0" cellpadding="0" border="0" style="margin-left:5px">
            <tr height="30">
            	<td align="left" valign="top">
                	<div style="float:left; width:503px; height:auto; line-height:20px">
                    	- <b>{$obj_info.vttb_name}</b> <i>({$obj_info.vttb_desc})</i> có chi phí đầu tư <b>{$obj_info.vttb_cost|price_format} vnđ</b>, được đưa vào sử dụng từ ngày <b>{$obj_info.vttb_commission|date_format:'%d/%m/%Y'}</b> và dự kiến hết hạn vào ngày <b>{$obj_info.vttb_limit|date_format:'%d/%m/%Y'}</b>. Đây là VTTB(CSVC) thuộc nhóm {if $obj_sub_info.vttb_sub_type eq 1} sử dụng cho cá nhân và đang được quản lý bởi 
                                <b>{section name=ui loop=$obj_list_user}
                                    {if $obj_list_user[ui]->user_id eq $obj_info.vttb_useby}
                                    	{$obj_list_user[ui]->user_fullname} - {section name=di loop=$obj_list_department}{if $obj_list_user[ui]->unit_id eq $obj_list_department[di]->department_id}{$obj_list_department[di]->department_standfor}{/if}{/section}
                                    {/if}
                                {/section}</b>
                            {else}sử dụng cho tập thể và cần <b>đặt lịch trước</b> để sử dụng{/if}. Hiện VTTB(CSVC) này {if $obj_info.vttb_decommission neq '0000-00-00' and $obj_info.vttb_decommission neq ''} đã bị loại bỏ vào ngày
                        	<b>{$obj_info.vttb_decommission|date_format:'%d/%m/%Y'}</b>
                        {else}<b>vẫn đang phục vụ</b>{/if} với tình trạng {if $obj_info.vttb_active eq 1}<b>được sử dụng</b>{else}<b>bị bỏ không</b>{/if}.<br />
                        - Thông tin này được cập nhật bởi {$user_info.user_fullname} vào ngày {$obj_info.vttb_date|date_format:'%d/%m/%Y'}
                    </div>
                    
                	<!--<div style="float:left; width:445px">
                        <div style="float:left; width:90px; line-height:25px; text-align:left">Tên thiết bị:</div>
                        <div style="float:left; width:190px; line-height:25px; text-align:left">
                        	{$obj_info.vttb_name}
                        </div>
                        <div style="float:left; width:90px; line-height:25px; text-align:left">Ngày sử dụng:</div>
                        <div style="float:left; width:75px; line-height:25px; padding-top:1px; text-align:left">
                            {$obj_info.vttb_commission|date_format:'%d/%m/%Y'}
                        </div>
                    </div>
                    
                    <div style="float:left; width:445px">
                        <div style="float:left; width:90px; line-height:25px; text-align:left">Chi phí:</div>
                        <div style="float:left; width:190px; line-height:25px; text-align:left">
                            
                        </div>
                        <div style="float:left; width:90px; line-height:25px; text-align:left">Dự kiến hết hạn:</div>
                        <div style="float:left; width:75px; line-height:25px; padding-top:1px; text-align:left">
                            {$obj_info.vttb_limit|date_format:'%d/%m/%Y'}
                        </div>
                    </div>
                    
                    <div style="float:left; width:445px">
                        <div style="float:left; width:90px; line-height:25px; text-align:left">Sử dụng bởi:</div>
                        <div style="float:left; width:190px; line-height:25px; text-align:left">
                            
                        </div>
                        <div style="float:left; width:90px; line-height:25px; text-align:left">Ngày loại bỏ:</div>
                        <div style="float:left; width:75px; line-height:25px; padding-top:1px; text-align:left">
                        {if $obj_info.vttb_decommission neq '0000-00-00' and $obj_info.vttb_decommission neq ''}
                        	{$obj_info.vttb_decommission|date_format:'%d/%m/%Y'}
                        {else}Đang khai thác{/if}
                        </div>
                    </div>
                    <div style="float:left; width:445px">
                        <div style="float:left; width:90px; line-height:25px; text-align:left">Mô tả:</div>
                        <div style="float:left; width:350px; line-height:25px; text-align:left">
                            {$obj_info.vttb_desc}
                        </div>
                    </div>
                    <div style="float:left; width:445px">
                        <div style="float:left; width:90px; line-height:25px; text-align:left">Tình trạng:</div>
                        <div style="float:left; width:100px; line-height:25px; text-align:left">
                        	{if $obj_info.vttb_active eq 1}Sử dụng{else}Không sử dụng{/if}
                        </div>
                        <div style="float:left; width:255px; line-height:25px; text-align:left">Thông tin được tạo bởi {$user_info.user_fullname} vào ngày {$obj_info.vttb_date|date_format:'%d/%m/%Y'}</div>
                    </div>-->
                </td>
            </tr>
        </table>
    </fieldset>
    
    <!------------------------------------------THONG TIN LICH DAT------------------------------------>
    <fieldset style="width:513px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
        <legend class="legend" style="width:120px">Trạng thái sử dụng:</legend>
    	<div style="float:left; height:5px; width:100%"></div>
        <div style="float:left; height:25px; width:492px; border-top:1px solid #99bbe8; border-bottom:1px solid #99bbe8 ">
            <div class="tbl_tit" style="width:30px; text-align:center"><b>STT</b></div>	
            <div class="tbl_tit" style="width:238px"><B>&nbsp;Mục đích</B></div>
            <div class="tbl_tit" style="width:110px"><B>&nbsp;Bắt đầu</B></div>
            <div class="tbl_tit" style="width:110px"><B>&nbsp;Kết thúc</B></div>
        </div>
        <div style="float:left; width:18px; height:25px">&nbsp;</div>
        <div style="float:left; height:190px; width:511px; overflow-y:scroll">
            {section name=pi loop=$obj_list}
            {if $smarty.section.pi.index is not div by 2} 
            {assign var="class_td" value="tbl_cont"} 
            {else}
            {assign var="class_td" value="tbl_cont2"} 
            {/if}
            {math x=$vars.curpage-1 y=$vars.numresult z=$smarty.section.pi.index t=1 equation="x*y+z+t" assign=stt}
            <div style="float:left">
                <div class="{$class_td}" style="width:30px; text-align:center">{$stt}</div>
                <div class="{$class_td}" style="width:238px; white-space:nowrap" title="{$obj_list[pi]->vttb_datlich_name}">
                	&nbsp;{if $obj_list[pi]->user_id eq $access_user_id}
                    <a href='javascript: void(0);' onclick="edit_me_Vttb_info({$obj_list[pi]->vttb_datlich_id},{$vttb_sub_id})">{$obj_list[pi]->vttb_datlich_name|str_string_cut:"50":"1"}</a>
                    {else}{$obj_list[pi]->vttb_datlich_name|str_string_cut:"50":"1"}{/if}
                </div>
                <div class="{$class_td}" style="width:110px; text-align:left">
                    &nbsp;{$obj_list[pi]->vttb_datlich_start|date_format:"%d/%m/%Y %H:%M"}
                </div>
                <div class="{$class_td}" style="width:110px; text-align:left">
                    &nbsp;{$obj_list[pi]->vttb_datlich_end|date_format:"%d/%m/%Y %H:%M"}
                </div>
            </div>
            {/section}
        </div>
        <input type="hidden" name="vttb_sub_id" id="vttb_sub_id" value="{$vars.vttb_sub_id}">
        <input type="hidden" name="user_id" id="user_id" value="{$obj_info.user_id}">
        <input type="hidden" name="vttb_id" id="vttb_id" value="{$vars.vttb_id}">
        <input type="hidden" id="curpage_Vttb_info" name="curpage" value="{$vars.curpage}" />
    </fieldset>
    </form>
</div>
<!------------------------------------------------- Tool bar --------------------------------------------->
<div id="div_vttb_info_clear_txt"></div>
<div id="div_vttb_info_tool_bar">    
    <div id="div_vttb_info_page_area">
    {if $vars.curpage eq 1}
    	<img src="{$css_path}icon_first_page.png" class="img_all">
    	<img src="{$css_path}icon_pre_page.png" class="img_all">
    {else}
    <a href="javascript: void(0)" id="first_page" onclick="gotoPage_Vttb_info('{$processurl}',parseInt(1));" title="Trang đầu">
    	<img src="{$css_path}icon_first_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="pre_page" onclick="gotoPage_Vttb_info('{$processurl}',parseInt(document.getElementById('page_Vttb_info').value)-parseInt(1));" title="Trang trước">
    	<img src="{$css_path}icon_pre_page.png" class="img_all">
    </a>
    {/if}
    </div>
    <div style="float:left; line-height:19px">
        <div style="float:left; width:35px">Trang</div> 
        <div style="float:left; width:35px">
        <input type="text" value="{$vars.curpage}" name="page" id="page_Vttb_info" onblur=" gotoPage_Vttb_info('{$processurl}',this.value);" style="width:30px; font-size:12px; height:15px; border:1px solid #99bbe8">
        </div>
        <div style="float:left; width:22px"> / {$num_page}</div>
    </div>
    <div id="div_vttb_info_page_area">
    {if $vars.curpage eq $num_page}
    	<img src="{$css_path}icon_next_page.png" class="img_all">
        <img src="{$css_path}icon_last_page.png" class="img_all">
    {else}
    <a href="javascript: void(0)" id="next_page" onclick="gotoPage_Vttb_info('{$processurl}',parseInt(document.getElementById('page_Vttb_info').value)+parseInt(1));" title="Trang tiếp">
    	<img src="{$css_path}icon_next_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="last_page" onclick="gotoPage_Vttb_info('{$processurl}',parseInt({$num_page}));" title="Trang cuối">
    	<img src="{$css_path}icon_last_page.png" class="img_all">
    </a>
    {/if}
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_vttb.png)">&nbsp;</div>
    <div style="float:left; width:15px">
    <a href="javascript: void(0)" id="a_ref_Vttb_info" title="Tải lại"><img src="{$css_path}icon_refresh.png" class="img_all"></a>
    </div>    
</div>
{literal}
<script language="javascript">		
	function reloadPage_Vttb_info(processurl){
		var numresult_Vttb_info,order_Vttb_info,cur_pos;
		numresult = $("#numresult_Vttb_info").val();
		order = $("#order_Vttb_info").val();
		cur_pos = 0;
		$("#div_vttb_info_cont").load(processurl+"&numresult="+numresult+"&order="+order+"&cur_pos="+cur_pos);
	}
	
	function gotoPage_Vttb_info(processurl,page){
		var numresult_Vttb_info,order_Vttb_info,cur_pos;
		numresult = $("#numresult_Vttb_info").val();
		order = $("#order_Vttb_info").val();
		//alert(processurl+'-'+page+'-'+numresult+'-'+order);
		$("#div_vttb_info_cont").load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+page);
	}
	
	function edit_me_Vttb_info(id,vttb_sub_id){
		var vttb_id = document.frmView_Vttb_info.vttb_id.value;
		$("#div_vttb_info_cont").load("?viewVttv&mod=vttbs&edit_me=1&vttb_datlich_id="+id+"&vttb_id="+vttb_id+"&vttb_sub_id="+vttb_sub_id);
	}
			
	$("#a_ref_Vttb_info").click( function () { 
		var vttb_id = document.frmView_Vttb_info.vttb_id.value;
		var vttb_sub_id = document.frmView_Vttb_info.vttb_sub_id.value;
		$('#div_vttb_info_cont').hide();
		$('#div_vttb_info_cont').fadeOut('fast').load("?viewVTTB&mod=vttbs&vttb_id="+vttb_id+"&vttb_sub_id="+vttb_sub_id).fadeIn("fast");
	});
</script>
{/literal}