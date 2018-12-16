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
	<form method="post" name="frmList_Msg" action="?listMsgUser{$vars.arg}" id="frmList_Msg">
    <!------------------------------------MENU SMS---------------------------------------------->
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
    <!------------------------------------THONG TIN---------------------------------------------->
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
            {math x=$vars.curpage-1 y=$vars.numresult z=$smarty.section.mi.index t=1 equation="x*y+z+t" assign=stt}
            {math a=$smarty.section.mi.index b=1 equation="a+b" assign=count}
            <div class="{$class_td}" style="width:30px; text-align:center">{$stt}</div>
            <div class="{$class_td}" style="width:259px;">
            	<div style="float:left; width:230px; white-space:nowrap">
                {php}
                	$sql="select * from tbl_msgusers where msg_id = ".$this->_tpl_vars['obj_list'][$this->_sections['mi']['index']]->msg_id;
                    $result = mysql_query($sql);
                    $row = mysql_fetch_array($result);
                    if($row['msgUser_active']!=1):
                    	$color = '#0000FF';
                    else:
                    	$color = '#000000';
                    endif;
                {/php}
                <a href="javascript:void(0)" onclick="show_noidung_msg({$obj_list[mi]->msg_id},'listMsgUser')"><font color="{php}echo $color{/php}">&nbsp;{$obj_list[mi]->msg_cont|str_string_cut:50:1}</font></a>
                </div>
                <div style="float:right; margin:2px; height:18px; width:16px; text-align:center; background-color:#dfe8f6" title="Chức năng mở rộng" id="extra_icon_msg_{$count}">
                <a href='javascript: void(0);' onclick="show_list_msg_options({$count},{$total_num_result})">
                <img src="{$css_path}icon_keo_dai.png" width="14" height="14" border="0" class="img_all" style="margin:1px"></a>
                </div>
                <div id="extra_msg_{$count}" class="{$class_td}" style="position:absolute; display:none; height:auto; width:180px; margin:22px 60px; border-bottom:1px solid #8ea4c1; border-right:1px solid #8ea4c1; border-left:1px solid #8ea4c1">
                	{php}
                        $sql_u="select * from tbl_users where user_id = ".$this->_tpl_vars['obj_list'][$this->_sections['mi']['index']]->user_sent;
                        $result_u = mysql_query($sql_u);
                        $row_u = mysql_fetch_array($result_u);
                    {/php}
                    <div style="float:left; width:180px; padding:1px">
                    	<div style="float:left; width:160px; padding:1px">
                             &bull;Người gửi: {php}echo $row_u['user_fullname'];{/php}
                        </div>
                        <div style="float:left; width:70px; padding:1px">
                             &bull; <a href="javascript: void(0)" onclick="javascript: update_quantrong({$obj_list[mi]->msg_id})">Quan trọng</a>
                        </div>
                        <div style="float:left; width:70px; padding:1px">
                             &bull; <a href="javascript: void(0)" onclick="javascript: update_rac({$obj_list[mi]->msg_id})">Tin rác</a>
                        </div>
                        <div style="float:left; width:30px; padding:1px">
                             &bull; <a href="javascript: void(0)" onclick="javascript: delete_msgUer({$obj_list[mi]->msg_id})">Xóa</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="{$class_td}" style="width:70px">
            	&nbsp;{$obj_list[mi]->msg_date|date_format:'%d/%m/%Y'}
            </div>
            {/section}
            {else}<div class="{$class_td}" style="width:357px; text-align:center; line-height: 20px">Chưa có nội dung</div>{/if}
        </div>
    </fieldset>
    </div>
    </form>
</div>
<!------------------------------------------------- Tool bar --------------------------------------------->
<div id="msg_clear_txt" style="width:100%"></div>
<div id="msg_tool_bar" style="width:99%">

    <div id="msg_search_area" style="width:92px; padding-left:3px">
    <select name="order" id="order_SignPer" style="width:90px; font-size:12px; border:1px solid #99bbe8" onchange="reloadPage_SignPer('{$processurl}');">
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
    <a href="javascript: void(0)" id="first_page" onclick="gotoPage_SignPer('{$processurl}',parseInt(1));" title="Trang đầu">
    	<img src="{$css_path}icon_first_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="pre_page" onclick="gotoPage_SignPer('{$processurl}',parseInt(document.getElementById('page_signPer').value)-parseInt(1));" title="Trang trước">
    	<img src="{$css_path}icon_pre_page.png" class="img_all">
    </a>
    {/if}
    </div>
    <div style="float:left; line-height:19px">
        <div style="float:left; width:35px">Trang</div> 
        <div style="float:left; width:25px">
        <input type="text" value="{$vars.curpage}" name="page" id="page_signPer" onblur=" gotoPage_SignPer('{$processurl}',this.value);" style="width:20px; font-size:12px; height:15px; border:1px solid #99bbe8">
        </div>
        <div style="float:left; width:20px"> / {$num_page}</div>
    </div>
    <div id="msg_page_area" style="width:37px">
    {if $vars.curpage eq $num_page}
    	<img src="{$css_path}icon_next_page.png" class="img_all">
        <img src="{$css_path}icon_last_page.png" class="img_all">
    {else}
    <a href="javascript: void(0)" id="next_page" onclick="gotoPage_SignPer('{$processurl}',parseInt(document.getElementById('page_signPer').value)+parseInt(1));" title="Trang tiếp">
    	<img src="{$css_path}icon_next_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="last_page" onclick="gotoPage_SignPer('{$processurl}',parseInt({$num_page}));" title="Trang cuối">
    	<img src="{$css_path}icon_last_page.png" class="img_all">
    </a>
    {/if}
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:left; width:15px">
    <a href="javascript: void(0)" id="a_ref_SignPer" title="Tải lại"><img src="{$css_path}icon_refresh.png" class="img_all"></a>
    </div>
    <div style="float:left; width:10px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:right; line-height:19px; margin-right:6px">
        <div style="float:left; width:40px">Xem</div>
        <div style="float:left; width:42px">
            <select name="numresult" id="numresult_SignPer" style="width:40px; font-size:12px; border:1px solid #99bbe8" onchange="reloadPage_SignPer('{$processurl}');">
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

	function show_list_msg_options(count,total){
		for(i=1;i<=total;i++){
			if(i==count){
				if(document.getElementById('extra_msg_'+i).style.display=='none')
					document.getElementById('extra_msg_'+i).style.display='block';
				else
					document.getElementById('extra_msg_'+i).style.display='none';
			}
			else
				document.getElementById('extra_msg_'+i).style.display='none';
		}
	}
	
	function search_me_Msg(){
		
		var keyword = document.getElementById('keyword').value;
		if (keyword == ""){
			return false;
		}
		
		$.post('?listMsgUser&mod=msgs&inbox=1',
			{keyword:keyword},
			function(data){
				$('#msg_content_main').html(data);
				$("#msg_content_main").show();
			}
		);
	}
	
	function delete_msgUer(delStr){
		if(!confirm("THÔNG BÁO: \n\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
			return false;
		}	
				
		var dataString = "dlStr=" + delStr +"";
			//alert (dataString);
		$.ajax({
			type: "POST",
			url: 'index.php?listMsgUser&mod=msgs&inbox=1',
			data: dataString,
			success: function(data) {
				$('#msg_content_main').load('index.php?listMsgUser&mod=msgs&inbox=1').fadeIn("fast");
			}
		});
	}
	
	function update_quantrong(msg_id){
		$('#msg_content_main').load('index.php?listMsgUser&mod=msgs&update_quantrong=1&msg_id='+msg_id).fadeIn("fast");
		$('#msg_content_main').hide();
		$('#msg_content_main').fadeOut('fast').load('index.php?listMsgUser&mod=msgs&inbox=1').fadeIn("fast");	
	}
	
	function update_rac(msg_id){
		$('#msg_content_main').load('index.php?listMsgUser&mod=msgs&update_rac=1&msg_id='+msg_id).fadeIn("fast");
		$('#msg_content_main').hide();
		$('#msg_content_main').fadeOut('fast').load('index.php?listMsgUser&mod=msgs&inbox=1').fadeIn("fast");	
	}		
				
	$("#a_ref_Msg").click( function () { 
		var msg_type = document.getElementById('msg_type').value;
		$('#msg_content_main').hide();
		$('#msg_content_main').fadeOut('fast').load('index.php?listMsgUser&mod=msgs').fadeIn("fast");
	});
</script>
{/literal}