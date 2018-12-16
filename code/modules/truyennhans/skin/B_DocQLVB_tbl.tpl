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
<div id="doc_content_insign">
	<form method="post" name="frmList_DocOut" action="?listDocOut{$vars.arg}" id="frmList_DocOut">
    <!------------------------------------DANH SACH---------------------------------------------->
    <fieldset style="width:912px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:462px">
        <legend class="legend_list" style="width:630px">
            <div style="width:130px; float:left">Danh sách: {$total_num_result}</div>
            <div style="width:70px; float:left">&nbsp;|&nbsp;Tìm kiếm:&nbsp;</div>
            <div style="width:380px; float:left; font-weight:normal">
                <div style="float:left">
                    <div style="float:left; width:60px">- Trích yếu: </div>
                    <div style="float:left; width:300px">
                    <input type="text" id="docOut_desc_fs" name="docOut_desc_fs" class="text_seek_long" value="{$vars.docOut_desc_fs}"/>
                    </div>
                    <input type="hidden" id="processurl" value="{$processurl}" />
                </div>
                <a href="javascript: void(0);" onClick="show_hide_seek_docout()" style="text-decoration:none; color:#F00">
                <div style="float:left; margin-left:3px"><img src="{$css_path}icon_keo_dai.png" class="img_all"></div></a>
            </div>
            <div style="width:380px; float:left; font-weight:normal; position:absolute; display:none; margin:23px 0 0 200px; background-color:#ccd8e7; border:1px solid #99bbe8; border-top:none" id="seek_more">
                <div style="float:left; width:60px; margin-bottom:5px">- Ký hiệu: </div>
                <div style="float:left; width:80px; margin-bottom:5px">
                <input type="text" id="docOut_code_fs" name="docOut_code_fs" class="text_seek_tiny" value="{$vars.docOut_code_fs}" />
                </div>
                <div style="float:left; width:79px; margin-bottom:5px">- ĐV dự thảo: </div>
                <div style="float:left; width:155px; margin-bottom:6px">
                <select name="department_id_fs" id="department_id_fs" class="text_seek_middle">
                    <option value="0">Chọn đơn vị dự thảo</option>
                    {section name=qi loop=$obj_list_department}
                    <option value="{$obj_list_department[qi]->department_id}">-&nbsp;{$obj_list_department[qi]->department_name}</option>
                    {/section}
                </select>
                </div>
                <div style="float:left; width:60px; margin-bottom:5px">- Số đi: </div>
                <div style="float:left; width:80px; margin-bottom:5px">
                <input type="text" id="docOut_num_fs" name="docOut_num_fs" class="text_seek_tiny" value="{$vars.docOut_num_fs}" />
                </div>
                <div style="float:left; width:79px; margin-bottom:5px">- Loại văn bản: </div>
                <div style="float:left; width:155px; margin-bottom:6px">
                <select name="docCat_id_fs" id="docCat_id_fs" class="text_seek_middle">
                    <option value="0">Chọn loại văn bản</option>
                    {section name=qi loop=$obj_list_dcat}
                    <option value="{$obj_list_dcat[qi]->docCat_id}">-&nbsp;{$obj_list_dcat[qi]->docCat_name}</option>
                    {/section}
                </select>
                </div>
                <div style="float:left; width:60px; margin-bottom:5px">- Ngày VB:</div>
                <div style="float:left; width:80px; margin-bottom:5px">
                	<div style="float:left; width:60px; background-color:#FFF">
                    	<input type="text" id="ngay_vb_1" name="ngay_vb_1" class="text_date" value="{$obj_info.ngay_vb|date_format:'%d'}" onfocus="hide_message()" maxlength="2"/>/
                        <input type="text" id="ngay_vb_2" name="ngay_vb_2" class="text_month" value="{$obj_info.ngay_vb|date_format:'%m'}" onfocus="hide_message()" maxlength="2"/>/
                        <input type="text" id="ngay_vb_3" name="ngay_vb_3" class="text_month" value="{$db_year|date_format:"%y"}" readonly="readonly"/>
                    </div>
                </div>
                <div style="float:left; width:79px; margin-bottom:5px">- Người ký: </div>
                <div style="float:left; width:155px; margin-bottom:5px">
                <select name="user_id_fs" id="user_id_fs" class="text_seek_middle">
                    <option value="0">Chọn người ký</option>
                    {section name=qi loop=$obj_list_user_bgd}
                    <option value="{$obj_list_user_bgd[qi]->user_id}">-&nbsp;{$obj_list_user_bgd[qi]->user_fullname}</option>
                    {/section}
                </select>
                </div>
                
            </div>
            <div style="width:45px; float:left">
                <input type="button" name="btnSeek" id="btnSeek" value="Tìm >>" class="button_seek" onclick="search_me_DocOut()" />
            </div>
        </legend>
    	<div style="float:left; height:5px; width:100%"></div>
        <div style="float:left; height:25px; width:890px; border-top:1px solid #99bbe8; border-bottom:1px solid #99bbe8 ">
            <div class="tbl_tit" style="width:47px; text-align:center"><b>STT</b></div>	
            <div class="tbl_tit" style="width:95px"><B>&nbsp;Loại văn bản</B></div>
            <div class="tbl_tit" style="width:50px; text-align:right"><B>&nbsp;Số đi&nbsp;</B></div>
            <div class="tbl_tit" style="width:70px"><B>&nbsp;Ký hiệu</B></div>
            <div class="tbl_tit" style="width:70px"><B>&nbsp;Ngày tháng</B></div>
            <div class="tbl_tit" style="width:351px"><B>&nbsp;Trích yếu</B></div>
            <div class="tbl_tit" style="width:200px"><B>&nbsp;Nơi nhận</B></div>
        </div>
        <div style="float:left; width:20px; text-align:right">
        {if $user_level eq 2 or $user_level eq 9}
        <input type="button" name="del_Items" id='del_Items' value="&nbsp;" onClick="delItems_DocOut('{$processurl}');" style="width:17px; font-size:12px; background:url(../images/admin/b_drop.png); cursor:pointer" title="Xóa lựa chọn">
        {else}
        <input type="button" name="del_Items" id='del_Items' value="&nbsp;" disabled="disabled" style="width:17px; font-size:12px; background:url(../images/admin/b_drop.png); cursor:pointer" title="Xóa lựa chọn">
        {/if}
        </div>
        <div style="float:left; height:405px; width:912px; overflow-y:scroll">
            {section name=pi loop=$obj_list}
            {if $smarty.section.pi.index is not div by 2} 
            {assign var="class_td" value="tbl_cont"} 
            {else}
            {assign var="class_td" value="tbl_cont2"} 
            {/if}
            {math x=$vars.curpage-1 y=$vars.numresult z=$smarty.section.pi.index t=1 equation="x*y+z+t" assign=stt}
            <div class="{$class_td}" style="width:47px; text-align:center">{$stt}</div>
            <div class="{$class_td}" style="width:95px">&nbsp;
                {section name=qi loop=$obj_list_dcat}
                    {if $obj_list_dcat[qi]->docCat_id eq $obj_list[pi]->docCat_id}
                    {$obj_list_dcat[qi]->docCat_name}
                    {/if}
                {/section}
            </div>
            <div class="{$class_td}" style="width:50px; text-align:right">
            	&nbsp;
                {if $obj_list[pi]->docOut_num neq '' and $obj_list[pi]->docOut_num neq 0}
                {$obj_list[pi]->docOut_num}
                {else}
                {$obj_list[pi]->docOut_num_typical}
                {/if}
                &nbsp;
            </div>
            {php}
            $mystr = $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docOut_code;
            $code_str = substr($mystr,strpos($mystr,'/')+1,strlen($mystr) - strpos($mystr,'/')+1);
            {/php}
            <div class="{$class_td}" style="width:70px; white-space:nowrap" title="{php}echo $code_str{/php}">&nbsp;
                {php}echo fnsSubstr($code_str,7,1);{/php}
            </div>
            <div class="{$class_td}" style="width:70px">
            	&nbsp;{$obj_list[pi]->docOut_date|date_format:"%d-%m-%Y"}
            </div>
            {section name=qi loop=$obj_list_user_bgd}
                {if $obj_list_user_bgd[qi]->user_id eq $obj_list[pi]->docOut_signed}
                	{assign var="nguoi_ky" value=$obj_list_user_bgd[qi]->user_fullname}
                {/if}
            {/section}
            <div class="{$class_td}" style="width:351px; white-space:nowrap" title="{$obj_list[pi]->docOut_desc}&nbsp;(Người ký: {$nguoi_ky} - {$obj_list[pi]->docOut_obj})">
                {math a=$smarty.section.pi.index b=1 equation="a+b" assign=count}
                <div style="float:left; width:321px; white-space:nowrap">&nbsp;{$obj_list[pi]->docOut_desc|str_string_cut:"85":"1"}</div>
                <div style="float:right; margin:2px; border:1px solid #8ea4c1; height:18px; width:16px; text-align:center; background-color:#dfe8f6" title="Chức năng mở rộng">
                    {if $user_level eq 2 or $user_level eq 1}
                        <a href='javascript: void(0);' onclick="javascript: show_tnvb_vbdi_options({$count},{$total_num_result})">
                        <img src="{$css_path}extra_icon.png" width="14" height="14" border="0" class="img_all"></a>
                    {/if}
                </div>
                <div id="extra_tnvb_vbdi_{$count}" style="position:absolute; display:none; height:auto; width:120px; margin:2px 210px; border:1px solid #8ea4c1; border-right:1px solid #8ea4c1; background-color:#dfe8f6">
                    <div style="float:left; width:110px; height:18px; border-right:1px solid #dfe8f6"><b>&nbsp;Thao tác:</b></div>
                    <div style="float:left; width:110px; padding:0 0 0 3px">
                        - <a href="javascript: void(0)" onclick="javascript: show_list_donvi_out({$obj_list[pi]->docOut_id})">Truyền văn bản</a>
                    </div>
                    <div style="float:left; width:110px; height:3px">
                        <hr width="100%" size="1" />
                    </div>
                    <div style="float:left; width:110px; padding:0 0 0 3px">
                         - <a href="javascript: void(0)" onclick="javascript: show_thongtin_docout({$obj_list[pi]->docOut_id})">Thông tin văn bản</a>
                    </div>
                </div>
            </div>
            {if $obj_list[pi]->unit_name neq ''}
            {php}
                $sql = "select * from tbl_units where unit_id in(".$this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->unit_name.")";
                $result = mysql_query($sql) or die($sql);
                $unit_name_str = "";
                $i=0;
                while($row = mysql_fetch_array($result)):
                    if($i < mysql_num_rows($result)):
                        $unit_name_str .=  $row['unit_name'].", ";
                    else:
                        $unit_name_str .= $row['unit_name'];
                    endif;
                    $i++;
                endwhile;
                
            {/php}
            <div class="{$class_td}" style="width:200px; white-space:nowrap" title="{php}echo $unit_name_str{/php}">&nbsp;{php}echo fnsSubstr($unit_name_str,33,1);{/php}</div>
            {else}
            <div class="{$class_td}" style="width:200px; white-space:nowrap" title="{php}echo $unit_name_02{/php}">&nbsp;{$obj_list[pi]->unit_name_02|str_string_cut:"33":"1"}</div>
            {/if}
            {/section}
        </div>
        <input type="hidden" id="curpage_DocOut" name="curpage" value="{$vars.curpage}" />
    </fieldset>
    </form>
</div>
<!------------------------------------------------- Tool bar --------------------------------------------->
<div id="doc_clear_txt"></div>
<div id="doc_tool_bar">

    <div id="doc_search_area">
    <select name="order" id = "order_DocOut" style="width:120px; font-size:12px; border:1px solid #99bbe8; margin-left:1px" onchange="reloadPage_DocOut('{$processurl}');">
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
    <a href="javascript: void(0)" id="first_page" onclick="gotoPage_DocOut('{$processurl}',parseInt(1));" title="Trang đầu">
    	<img src="{$css_path}icon_first_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="pre_page" onclick="gotoPage_DocOut('{$processurl}',parseInt(document.getElementById('page_DocOut').value)-parseInt(1));" title="Trang trước">
    	<img src="{$css_path}icon_pre_page.png" class="img_all">
    </a>
    {/if}
    </div>
    <div style="float:left; line-height:19px">
        <div style="float:left; width:35px">Trang</div> 
        <div style="float:left; width:35px">
        <input type="text" value="{$vars.curpage}" name="page" id="page_DocOut" onblur=" gotoPage_DocOut('{$processurl}',this.value);" style="width:30px; font-size:12px; height:15px; border:1px solid #99bbe8">
        </div>
        <div style="float:left; width:42px"> / {$num_page}</div>
    </div>
    <div id="doc_page_area">
    {if $vars.curpage eq $num_page}
    	<img src="{$css_path}icon_next_page.png" class="img_all">
        <img src="{$css_path}icon_last_page.png" class="img_all">
    {else}
    <a href="javascript: void(0)" id="next_page" onclick="gotoPage_DocOut('{$processurl}',parseInt(document.getElementById('page_DocOut').value)+parseInt(1));" title="Trang tiếp">
    	<img src="{$css_path}icon_next_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="last_page" onclick="gotoPage_DocOut('{$processurl}',parseInt({$num_page}));" title="Trang cuối">
    	<img src="{$css_path}icon_last_page.png" class="img_all">
    </a>
    {/if}
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:left; width:15px">
    <a href="javascript: void(0)" id="a_ref_DocOut" title="Tải lại"><img src="{$css_path}icon_refresh.png" class="img_all"></a>
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:right; line-height:19px; margin-right:2px">
        <div style="float:left; width:40px">Xem</div>
        <div style="float:left; width:52px">
            <select name="numresult" id="numresult_DocOut" style="width:50px; font-size:12px; border:1px solid #99bbe8" onchange="reloadPage_DocOut('{$processurl}');">
                {section name=sli loop=$nrs_arr}
                <option value="{$nrs_arr[sli]}" {if $nrs_arr[sli] eq $vars.numresult}selected{/if}>{$nrs_arr[sli]} </option>
                {/section}
            </select>
        </div>
        <div style="float:left; margin-right:1px">dòng / trang</div>
    </div>
    
</div>
{literal}
<script language="javascript">	
	function show_tnvb_vbdi_options(count,total){
		for(i=1;i<=total;i++){
			if(i==count){
				if(document.getElementById('extra_tnvb_vbdi_'+i).style.display=='none')
					document.getElementById('extra_tnvb_vbdi_'+i).style.display='block';
				else
					document.getElementById('extra_tnvb_vbdi_'+i).style.display='none';
			}
			else
				document.getElementById('extra_tnvb_vbdi_'+i).style.display='none';
		}
	}
	
	function show_hide_seek_docout(){
		if(document.getElementById('seek_more_docout').style.display=='none')
			document.getElementById('seek_more_docout').style.display='';
		else document.getElementById('seek_more_docout').style.display='none';
	}
	
	function show_hide_filter(){
		if(document.getElementById('div_filter').style.display=='none')
			document.getElementById('div_filter').style.display='';
		else document.getElementById('div_filter').style.display='none';
	}
		
	function reloadPage_Docout(processurl){
		var numresult_Docout,order_Docout,cur_pos;
		numresult = $("#numresult_Docout").val();
		order = $("#order_Docout").val();
		cur_pos = 0;
		$("#transport_content_main").load(processurl+"&numresult="+numresult+"&order="+order+"&cur_pos="+cur_pos);
	}
		
	function show_list_donvi_out(docout_id){
		$('#list_truyenvb').css({'display':'block','z-index':'2010'});
		//var arg = document.getElementById('arg').value;
		$("#list_truyenvb_cont").load("?addReceiveOut&mod=truyennhans&docout_id="+docout_id);
	}
		
	function show_thongtin_docout(docout_id){
		$('#div_view_transport').css({'display':'block','z-index':'2010'});
		$("#list_view_transport_cont").load("?viewDocQLVB&mod=truyennhans&docOut_id="+docout_id);
	}
		
	function gotoPage_Docout(processurl,page){
		var numresult_Docout,order_Docout,cur_pos;
		numresult = $("#numresult_Docout").val();
		order = $("#order_Docout").val();
		//alert(processurl+'-'+page+'-'+numresult+'-'+order);
		$("#transport_content_main").load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+page);
	}
	
	function uncheck_fns_Docout(field,val,id){
		$("#transport_content_main").load("?listDocQLVB&mod=truyennhans&checkUncheck="+val+"&setfield="+field+"&checkUncheckID="+id);
	}
	
	function search_me_Docout(){
		var doc_desc_fs 	= document.getElementById('doc_desc_fs').value;
		var doc_code_fs 	= document.getElementById('doc_code_fs').value;
		var doc_num_fs 		= document.getElementById('doc_num_fs').value;
		var unit_name_fs 	= document.getElementById('unit_name_fs').value;
		var docCat_id_fs 	= document.getElementById('docCat_id_fs').value;
		
		if (doc_desc_fs == "" && doc_code_fs == "" && doc_num_fs == "" && unit_name_fs == "" && docCat_id_fs == ""){
			return false;
		}
		
		$.post('?listDocQLVB&mod=truyennhans&search_me=1',
			{
				doc_desc_fs:doc_desc_fs,
				doc_code_fs:doc_code_fs,
				doc_num_fs:doc_num_fs,
				unit_name_fs:unit_name_fs,
				docCat_id_fs:docCat_id_fs
			},
			function(data){
				$('#transport_content_main').html(data);
				$("#transport_content_main").show();
			}
		);
	}
	
	$("#a_ref_Docout").click( function () { 
			$('#transport_content_main').hide();
			$('#transport_content_main').fadeOut('fast').load('index.php?listDocQLVB&mod=truyennhans').fadeIn("fast");
		});
</script>
{/literal}