{literal}
<style type="text/css">
.error { color:#FF0000;font-weight:bold; margin-left:5px; height:20px; line-height:20px}
.msg{ color:#00F; font-weight:bold; margin-left:5px; height:20px; line-height:20px}
.tbl_tit{
float:left; line-height:25px; border-right:1px solid #99bbe8; 	
}
.tbl_cont{
float:left; line-height:25px; border-right:1px solid #99bbe8; border-bottom:1px solid #99bbe8; background:#F2FFEC; font-size:12px
}
.tbl_cont2{
float:left; line-height:25px; border-right:1px solid #99bbe8; border-bottom:1px solid #99bbe8; background:#FFF; font-size:12px
}
</style>
{/literal}
<div id="transport_content_insign">
	<form method="post" name="frmList_DocINQLVB" action="?listDocinQLVB{$vars.arg}" id="frmList_DocINQLVB">
    <!------------------------------------DANH SACH---------------------------------------------->
    <fieldset style="width:912px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:462px">
        <legend class="legend_list" style="width:630px">
            <div style="width:130px; float:left">Danh sách: {$total_num_result}</div>
            <div style="width:70px; float:left">&nbsp;|&nbsp;Tìm kiếm:&nbsp;</div>
            <div style="width:380px; float:left; font-weight:normal">
                <div style="float:left">
                    <div style="float:left; width:60px">- Trích yếu: </div>
                    <div style="float:left; width:300px">
                    <input type="text" id="doc_desc_fs" name="doc_desc_fs" class="text_seek_long" value="{$vars.doc_desc_fs}"/>
                    </div>
                    <input type="hidden" id="processurl" value="{$processurl}" />
                </div>
                <a href="javascript: void(0);" onClick="show_hide_seek_docin()" style="text-decoration:none; color:#F00">
                <div style="float:left; margin-left:3px"><img src="{$css_path}icon_keo_dai.png" class="img_all"></div></a>
            </div>
            <div style="width:380px; float:left; font-weight:normal; position:absolute; display:none; margin:20px 0 0 200px; background-color:#ccd8e7; border:1px solid #99bbe8; border-top:none" id="seek_more_docin">
                <div style="float:left; width:60px; margin-bottom:5px">- Ký hiệu: </div>
                <div style="float:left; width:80px; margin-bottom:5px">
                <input type="text" id="doc_code_fs" name="doc_code_fs" class="text_seek_tiny" value="{$vars.doc_code_fs}" />
                </div>
                <div style="float:left; width:79px; margin-bottom:5px">- Nơi gửi đến: </div>
                <div style="float:left; width:155px; margin-bottom:5px">
                <input type="text" value="{$vars.unit_name_fs}" id="unit_name_fs" name="unit_name_fs" class="text_seek_middle" />
                {literal}
                <script type="text/javascript">
                $().ready(function() {
                    $("#unit_name_fs").autocomplete("B_unit_auto.php", {
                        width: 160,
                        matchContains: true,
                        selectFirst: true
                    });
                });
                </script>
                {/literal}
                </div>
                <div style="float:left; width:60px; margin-bottom:5px">- Số đến: </div>
                <div style="float:left; width:80px; margin-bottom:5px">
                <input type="text" id="doc_num_fs" name="doc_num_fs" class="text_seek_tiny" value="{$vars.doc_num_fs}" />
                </div>
                <div style="float:left; width:79px; margin-bottom:5px">- Loại văn bản: </div>
                <div style="float:left; width:155px; margin-bottom:5px">
                <input type="text" value="{$vars.docCat_id_fs}" id="docCat_id_fs" name="docCat_id_fs" class="text_seek_middle" />
                {literal}
                <script type="text/javascript">
                $().ready(function() {
                    $("#docCat_id_fs").autocomplete("B_DocCat_auto.php", {
                        width: 160,
                        matchContains: true,
                        selectFirst: true
                    });
                });
                </script>
                {/literal}
                </div>
                
            </div>
            <div style="width:45px; float:left">
                <input type="button" name="btnSeek" id="btnSeek" value="Tìm >>" class="button_seek" onclick="search_me_Docin()" />
            </div>
        </legend>
    	<div style="float:left; height:5px; width:100%"></div>
        <div style="float:left; height:25px; width:890px; border-top:1px solid #99bbe8; border-bottom:1px solid #99bbe8 ">
            <div class="tbl_tit" style="width:47px; text-align:center"><b>STT</b></div>	
            <div class="tbl_tit" style="width:70px"><B>&nbsp;Ngày nhập</B></div>
            <div class="tbl_tit" style="width:95px"><B>&nbsp;Loại văn bản</B></div>
            <div class="tbl_tit" style="width:50px; text-align:right"><B>&nbsp;Số đến&nbsp;</B></div>
            <div class="tbl_tit" style="width:80px"><B>&nbsp;Ký hiệu</B></div>
            <div class="tbl_tit" style="width:380px"><B>&nbsp;Trích yếu</B></div>
            <div class="tbl_tit" style="width:161px"><B>&nbsp;Nơi gửi</B></div>
        </div>
        <div style="float:left; width:20px; text-align:right">&nbsp;</div>
        <div style="float:left; height:405px; width:912px; overflow-y:scroll">
            {section name=pi loop=$obj_list}
            {if $smarty.section.pi.index is not div by 2} 
            {assign var="class_td" value="tbl_cont"} 
            {else}
            {assign var="class_td" value="tbl_cont2"} 
            {/if}
            {math x=$vars.curpage-1 y=$vars.numresult z=$smarty.section.pi.index t=1 equation="x*y+z+t" assign=stt}
            <div style="float:left">
                <div class="{$class_td}" style="width:47px; text-align:center">{$stt}</div>
                <div class="{$class_td}" style="width:70px">
                    &nbsp;{$obj_list[pi]->doc_date|date_format:"%d/%m/%Y"}
                </div>
                <div class="{$class_td}" style="width:95px; white-space:nowrap" title="{$obj_list[pi]->docCat_id}">
                    &nbsp;{$obj_list[pi]->docCat_id|str_string_cut:"20":"1"}
                </div>
                <div class="{$class_td}" style="width:50px; text-align:right">
                    &nbsp;{$obj_list[pi]->doc_num}&nbsp;
                </div>
                <div class="{$class_td}" style="width:80px; white-space:nowrap" title="{$obj_list[pi]->doc_code}">
                    &nbsp;{$obj_list[pi]->doc_code|str_string_cut:"10":"1"}
                </div>
                <div class="{$class_td}" style="width:380px" title="{$obj_list[pi]->doc_desc}">
                	{math a=$smarty.section.pi.index b=1 equation="a+b" assign=count}
                    <div style="float:left; width:350px; white-space:nowrap">&nbsp;{$obj_list[pi]->doc_desc|str_string_cut:"85":"1"}</div>
                    <div style="float:right; margin:2px; border:1px solid #8ea4c1; height:18px; width:16px; text-align:center; background-color:#dfe8f6" title="Chức năng mở rộng">
                    {if $user_level eq 2 or $user_level eq 1}<a href='javascript: void(0);' onclick="show_tnvb_options({$count},{$total_num_result})">
                    <img src="{$css_path}extra_icon.png" width="14" height="14" border="0" class="img_all"></a>{/if}
                    </div>
                    <div id="extra_tnvb_{$count}" style="position:absolute; display:none; height:auto; width:120px; margin:2px 239px; border:1px solid #8ea4c1; border-right:1px solid #8ea4c1; background-color:#dfe8f6">
                        <div style="float:left; width:120px; height:18px; border-right:1px solid #dfe8f6"><b>&nbsp;Thao tác:</b></div>
                        <div style="float:left; width:120px; padding:0 0 0 3px">
                            - <a href="javascript: void(0)" onclick="javascript: show_list_donvi({$obj_list[pi]->doc_id})">Truyền văn bản</a>
                        </div>
                        <div style="float:left; width:120px; height:3px">
                        	<hr width="100%" size="1" />
                        </div>
                        <div style="float:left; width:120px; padding:0 0 0 3px">
                             - <a href="javascript: void(0)" onclick="javascript: show_thongtin_docin({$obj_list[pi]->doc_id})">Thông tin văn bản</a>
                        </div>
                    </div>
                </div>
                <div class="{$class_td}" style="width:161px; white-space:nowrap" title="{$obj_list[pi]->unit_name}">
                    &nbsp;{$obj_list[pi]->unit_name|str_string_cut:"30":"1"}
                </div>
            </div>
            {/section}
        </div>
        <input type="hidden" id="curpage_Docin" name="curpage" value="{$vars.curpage}" />
        <input type="hidden" name="arg" id="arg" value="{$vars.arg}">
    </fieldset>
    </form>
</div>
<!------------------------------------------------- Tool bar --------------------------------------------->
<div id="transport_clear_txt"></div>
<div id="transport_tool_bar">

    <div id="transport_search_area">
    <select name="order" id = "order_Docin" style="width:120px; font-size:12px; border:1px solid #99bbe8; margin-left:1px" onchange="reloadPage_Docin('{$processurl}');">
    {section name=sli loop=$order_arr}
        <option value="{$smarty.section.sli.index}" {if $smarty.section.sli.index eq $vars.order}selected{/if} >
        {$order_arr[sli]}
        </option>
    {/section}
    </select>
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_transport.png)">&nbsp;</div>
    <div id="transport_page_area">
    {if $vars.curpage eq 1}
    	<img src="{$css_path}icon_first_page.png" class="img_all">
    	<img src="{$css_path}icon_pre_page.png" class="img_all">
    {else}
    <a href="javascript: void(0)" id="first_page" onclick="gotoPage_Docin('{$processurl}',parseInt(1));" title="Trang đầu">
    	<img src="{$css_path}icon_first_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="pre_page" onclick="gotoPage_Docin('{$processurl}',parseInt(document.getElementById('page_Docin').value)-parseInt(1));" title="Trang trước">
    	<img src="{$css_path}icon_pre_page.png" class="img_all">
    </a>
    {/if}
    </div>
    <div style="float:left; line-height:19px">
        <div style="float:left; width:35px">Trang</div> 
        <div style="float:left; width:35px">
        <input type="text" value="{$vars.curpage}" name="page" id="page_Docin" onblur=" gotoPage_Docin('{$processurl}',this.value);" style="width:30px; font-size:12px; height:15px; border:1px solid #99bbe8">
        </div>
        <div style="float:left; width:42px"> / {$num_page}</div>
    </div>
    <div id="transport_page_area">
    {if $vars.curpage eq $num_page}
    	<img src="{$css_path}icon_next_page.png" class="img_all">
        <img src="{$css_path}icon_last_page.png" class="img_all">
    {else}
    <a href="javascript: void(0)" id="next_page" onclick="gotoPage_Docin('{$processurl}',parseInt(document.getElementById('page_Docin').value)+parseInt(1));" title="Trang tiếp">
    	<img src="{$css_path}icon_next_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="last_page" onclick="gotoPage_Docin('{$processurl}',parseInt({$num_page}));" title="Trang cuối">
    	<img src="{$css_path}icon_last_page.png" class="img_all">
    </a>
    {/if}
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_transport.png)">&nbsp;</div>
    <div style="float:left; width:15px">
    <a href="javascript: void(0)" id="a_ref_Docin" title="Tải lại"><img src="{$css_path}icon_refresh.png" class="img_all"></a>
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_transport.png)">&nbsp;</div>
    <div style="float:right; line-height:19px; margin-right:2px">
        <div style="float:left; width:40px">Xem</div>
        <div style="float:left; width:52px">
            <select name="numresult" id="numresult_Docin" style="width:50px; font-size:12px; border:1px solid #99bbe8" onchange="reloadPage_Docin('{$processurl}');">
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
	function show_tnvb_options(count,total){
		for(i=1;i<=total;i++){
			if(i==count){
				if(document.getElementById('extra_tnvb_'+i).style.display=='none')
					document.getElementById('extra_tnvb_'+i).style.display='block';
				else
					document.getElementById('extra_tnvb_'+i).style.display='none';
			}
			else
				document.getElementById('extra_tnvb_'+i).style.display='none';
		}
	}
	
	function show_hide_seek_docin(){
		if(document.getElementById('seek_more_docin').style.display=='none')
			document.getElementById('seek_more_docin').style.display='';
		else document.getElementById('seek_more_docin').style.display='none';
	}
	
	function show_hide_filter(){
		if(document.getElementById('div_filter').style.display=='none')
			document.getElementById('div_filter').style.display='';
		else document.getElementById('div_filter').style.display='none';
	}
		
	function reloadPage_Docin(processurl){
		var numresult_Docin,order_Docin,cur_pos;
		numresult = $("#numresult_Docin").val();
		order = $("#order_Docin").val();
		cur_pos = 0;
		$("#transport_content_main").load(processurl+"&numresult="+numresult+"&order="+order+"&cur_pos="+cur_pos);
	}
		
	function show_list_donvi(doc_id){
		$("#list_truyenvb").css({'display':'block','z-index':'2010'});
		var arg = document.getElementById('arg').value;
		$("#list_truyenvb_cont").load("?addReceive&mod=truyennhans&docin_id="+doc_id);
	}
		
	function show_thongtin_docin(doc_id){
		$("#div_view_transport").css({'display':'block','z-index':'2010'});
		$("#list_view_transport_cont").load("?viewDocinQLVB&mod=truyennhans&doc_id="+doc_id);
	}
		
	function gotoPage_Docin(processurl,page){
		var numresult_Docin,order_Docin,cur_pos;
		numresult = $("#numresult_Docin").val();
		order = $("#order_Docin").val();
		//alert(processurl+'-'+page+'-'+numresult+'-'+order);
		$("#transport_content_main").load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+page);
	}
	
	function uncheck_fns_Docin(field,val,id){
		$("#transport_content_main").load("?listDocinQLVB&mod=truyennhans&checkUncheck="+val+"&setfield="+field+"&checkUncheckID="+id);
	}
	
	function search_me_Docin(){
		var doc_desc_fs 	= document.getElementById('doc_desc_fs').value;
		var doc_code_fs 	= document.getElementById('doc_code_fs').value;
		var doc_num_fs 		= document.getElementById('doc_num_fs').value;
		var unit_name_fs 	= document.getElementById('unit_name_fs').value;
		var docCat_id_fs 	= document.getElementById('docCat_id_fs').value;
		
		if (doc_desc_fs == "" && doc_code_fs == "" && doc_num_fs == "" && unit_name_fs == "" && docCat_id_fs == ""){
			return false;
		}
		
		$.post('?listDocinQLVB&mod=truyennhans&search_me=1',
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
	
	$("#a_ref_Docin").click( function () { 
			$('#transport_content_main').hide();
			$('#transport_content_main').fadeOut('fast').load('index.php?listDocinQLVB&mod=truyennhans').fadeIn("fast");
		});
</script>
{/literal}