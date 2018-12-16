{literal}
<style type="text/css">
#huongdan_content_insign{
	font-size:12px;
}
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
<div id="huongdan_content_insign">
	<form method="post" name="frmList_Huongdan" action="?listHuongdan{$vars.arg}" id="frmList_Huongdan">
    <!------------------------------------DANH SACH---------------------------------------------->
    <fieldset style="width:524px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:347px">
    <legend class="legend_list">
        <div style="width:130px; float:left">Danh sách: {$total_num_result}</div>
        <div style="width:70px; float:left">&nbsp;|&nbsp;Tìm kiếm&nbsp;</div>
        <div style="width:100px; float:left">
        	<input type="text" name="keyword" id="keyword" class="text_seek" value="{$vars.keyword}"/>
            <input type="hidden" id="processurl" value="{$processurl}" />
        </div>
        <div style="width:50px; float:left">
        	<input type="button" name="btnSeek" id="btnSeek" value="Tìm >>" class="button_seek" onclick="search_me_Huongdan()" /></div>
    </legend>
    	<div style="float:left; height:5px; width:100%"></div>
        <div style="float:left; height:25px; width:506px; border-top:1px solid #99bbe8; border-bottom:1px solid #99bbe8 ">
            <div class="tbl_tit" style="width:30px; text-align:center"><b>STT</b></div>	
            <div class="tbl_tit" style="width:354px"><B>&nbsp;Tên nội dung xử lý</B></div>
            <div class="tbl_tit" style="width:59px"><B>&nbsp;Viết tắt</B></div>
            <div class="tbl_tit" style="width:59px; text-align:right"><B>Số ngày&nbsp;</B></div>
        </div>
        <div style="float:left; width:18px; text-align:right">&nbsp;</div>
        <div style="float:left; height:290px; width:524px; overflow-y:scroll">
            {section name=pi loop=$obj_list}
            {if $smarty.section.pi.index is not div by 2} 
            {assign var="class_td" value="tbl_cont"} 
            {else}
            {assign var="class_td" value="tbl_cont2"} 
            {/if}
            {math x=$vars.curpage-1 y=$vars.numresult z=$smarty.section.pi.index t=1 equation="x*y+z+t" assign=stt}
            <div style="float:left">
                <div class="{$class_td}" style="width:30px; text-align:center">{$stt}</div>
                <div class="{$class_td}" style="width:354px" title="{$obj_list[pi]->docday_name}">
                    &nbsp;{$obj_list[pi]->docday_name|str_string_cut:"80":"1"}
                </div>
                <div class="{$class_td}" style="width:59px">
                    &nbsp;{$obj_list[pi]->docday_standfor}
                </div>
                <div class="{$class_td}" style="width:59px; text-align:right">
                    &nbsp;{$obj_list[pi]->docday_num}&nbsp;
                </div>
            </div>
            {/section}
        </div>
        <input type="hidden" id="curpage_Huongdan" name="curpage" value="{$vars.curpage}" />
    </fieldset>
    </form>
</div>
<!------------------------------------------------- Tool bar --------------------------------------------->
<div id="huongdan_clear_txt"></div>
<div id="huongdan_tool_bar" style=" font-size:12px">

    <div id="huongdan_search_area">
    <select name="order" id = "order_Huongdan" style="width:120px; font-size:12px; border:1px solid #99bbe8" onchange="reloadPage_Huongdan('{$processurl}');">
    {section name=sli loop=$order_arr}
        <option value="{$smarty.section.sli.index}" {if $smarty.section.sli.index eq $vars.order}selected{/if} >
        {$order_arr[sli]}
        </option>
    {/section}
    </select>
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div id="huongdan_page_area">
    {if $vars.curpage eq 1}
    	<img src="{$css_path}icon_first_page.png" class="img_all">
    	<img src="{$css_path}icon_pre_page.png" class="img_all">
    {else}
    <a href="javascript: void(0)" id="first_page" onclick="gotoPage_Huongdan('{$processurl}',parseInt(1));" title="Trang đầu">
    	<img src="{$css_path}icon_first_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="pre_page" onclick="gotoPage_Huongdan('{$processurl}',parseInt(document.getElementById('page').value)-parseInt(1));" title="Trang trước">
    	<img src="{$css_path}icon_pre_page.png" class="img_all">
    </a>
    {/if}
    </div>
    <div style="float:left; line-height:19px">
        <div style="float:left; width:35px">Trang</div> 
        <div style="float:left; width:35px">
        <input type="text" value="{$vars.curpage}" name="page" id="page" onblur=" gotoPage_Huongdan('{$processurl}',this.value);" style="width:30px; font-size:12px; height:15px; border:1px solid #99bbe8">
        </div>
        <div style="float:left; width:32px"> / {$num_page}</div>
    </div>
    <div id="huongdan_page_area">
    {if $vars.curpage eq $num_page}
    	<img src="{$css_path}icon_next_page.png" class="img_all">
        <img src="{$css_path}icon_last_page.png" class="img_all">
    {else}
    <a href="javascript: void(0)" id="next_page" onclick="gotoPage_Huongdan('{$processurl}',parseInt(document.getElementById('page').value)+parseInt(1));" title="Trang tiếp">
    	<img src="{$css_path}icon_next_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="last_page" onclick="gotoPage_Huongdan('{$processurl}',parseInt({$num_page}));" title="Trang cuối">
    	<img src="{$css_path}icon_last_page.png" class="img_all">
    </a>
    {/if}
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:left; width:15px">
    <a href="javascript: void(0)" id="a_ref_Huongdan" title="Tải lại"><img src="{$css_path}icon_refresh.png" class="img_all"></a>
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:right; line-height:19px; margin-right:5px">
        <div style="float:left; width:40px; font-size:12px">Hiển thị</div>
        <div style="float:left; width:52px; font-size:12px">
            <select name="numresult" id="numresult_Huongdan" style="width:50px; font-size:12px; border:1px solid #99bbe8" onchange="reloadPage_Huongdan('{$processurl}');">
                {section name=sli loop=$nrs_arr}
                <option value="{$nrs_arr[sli]}" {if $nrs_arr[sli] eq $vars.numresult}selected{/if}>{$nrs_arr[sli]} </option>
                {/section}
            </select>
        </div>
        <div style="float:left; font-size:12px;">dòng / trang</div>
    </div>
    
</div>
{literal}
<script language="javascript">	
	function reloadPage_Huongdan(processurl){
		var numresult_Huongdan,order_Huongdan,cur_pos;
		numresult = $("#numresult_Huongdan").val();
		order = $("#order_Huongdan").val();
		cur_pos = 0;
		$("#list_huongdan_cont").load(processurl+"&numresult="+numresult+"&order="+order+"&cur_pos="+cur_pos);
	}
	
	function gotoPage_Huongdan(processurl,page){
		var numresult_Huongdan,order_Huongdan,cur_pos;
		numresult = $("#numresult_Huongdan").val();
		order = $("#order_Huongdan").val();
		//alert(processurl+'-'+page+'-'+numresult+'-'+order);
		$("#list_huongdan_cont").load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+page);
	}
	
	function search_me_Huongdan(){
		var keyword = document.getElementById('keyword').value;
		if (keyword == ""){
			return false;
		}
		
		$.post('?listHuongdan&mod=daydocs',
			{keyword:keyword},
			function(data){
				$('#list_huongdan_cont').html(data);
				$("#list_huongdan_cont").show();
			}
		);
	}
	
	$("#a_ref_Huongdan").click( function () { 
			$('#list_huongdan_cont').hide();
			$('#list_huongdan_cont').fadeOut('fast').load('index.php?listHuongdan&mod=daydocs').fadeIn("fast");
		});
</script>
{/literal}