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
	<form method="post" name="frmList_Doc" action="?listDoc{$vars.arg}" id="frmList_Doc">
    <!------------------------------------DANH SACH---------------------------------------------->
    <fieldset style="width:912px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:462px">
        <legend class="legend_list" style="width:865px">
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
                <a href="javascript: void(0);" onClick="show_hide_seek_tnvb()" style="text-decoration:none; color:#F00">
                <div style="float:left; margin-left:3px"><img src="{$css_path}icon_keo_dai.png" class="img_all"></div></a>
            </div>
            <div style="width:380px; float:left; font-weight:normal; position:absolute; display:none; margin:20px 0 0 200px; background-color:#ccd8e7; border:1px solid #99bbe8; border-top:none" id="seek_more_tnvb">
                <div style="float:left; width:60px; margin-bottom:5px">- Ký hiệu: </div>
                <div style="float:left; width:80px; margin-bottom:5px">
                <input type="text" id="doc_code_fs" name="doc_code_fs" class="text_seek_tiny" value="{$vars.doc_code_fs}" />
                </div>
                <div style="float:left; width:79px; margin-bottom:5px">- Loại văn bản: </div>
                <div style="float:left; width:155px; margin-bottom:5px">
                <input type="text" value="{$vars.docCat_id_fs}" id="docCat_id_fs" name="docCat_id_fs" class="text_seek_middle" />
                {literal}
                <script type="text/javascript">
                $().ready(function() {
                    $("#docCat_id_fs").autocomplete("B_docCat_auto.php", {
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
                <input type="button" name="btnSeek" id="btnSeek" value="Tìm >>" class="button_seek" onclick="search_me_Doc()" />
            </div>
            <!-----------------------------------------KET XUAT--------------------------------------->
            <div style="width:60px; float:left">&nbsp;|&nbsp;Kết xuất:&nbsp;</div>
            <a href="javascript: void(0);" onClick="show_hide_filter()" style="text-decoration:none">
            <div style="float:left; margin-left:10px; width:78px">Lọc dữ liệu</div></a>
            <div style="width:92px; float:left; height:20px; margin-top:1px">
                <a href="javascript: void(0);" onClick="export_tnvb(1)" style="text-decoration:none; color:#F00">
                <div style="float:left; margin-left:5px; width:26px">
                <img src="../images/admin/word_icon.png" class="img_all" height="20" title="Kết xuất MS Word"></div>
                </a>
                <a href="javascript: void(0);" onClick="export_tnvb(2)" style="text-decoration:none; color:#F00">
                <div style="float:left; margin-left:5px; width:26px">
                <img src="../images/admin/excel_icon.png" class="img_all" height="20" title="Kết xuất MS Excel"></div>
                </a>
                <a href="javascript: void(0);" onClick="export_tnvb(3)" style="text-decoration:none; color:#F00">
                <div style="float:left; margin-left:5px; width:25px">
                <img src="../images/admin/print_pre_icon.png" class="img_all" height="20" title="Xem trước khi in"></div>
                </a>
            </div>
            <div style="width:260px; float:left; font-weight:normal; position:absolute; display:none; margin:23px 0 0 604px; background-color:#ccd8e7; border:1px solid #99bbe8; border-top:none" id="div_filter">
                <div style="float:left; width:56px; margin-bottom:5px">- Nhận:</div>
                <div style="float:left; width:20px; margin-bottom:5px">Từ&nbsp;</div>
                <div style="float:left; width:75px; background-color:#FFF; margin-bottom:5px">
                <input type="text" id="tungay_1" name="tungay_1" class="text_date" value="{$smarty.now|date_format:'%d'}" maxlength="2"/>
                /<input type="text" id="tungay_2" name="tungay_2" class="text_month" value="{$smarty.now|date_format:'%m'}" maxlength="2" />
                /<input type="text" id="tungay_3" name="tungay_3" class="text_year" value="{$smarty.now|date_format:'%Y'}" maxlength="4" />
                </div>
                <div style="float:left; width:24px; margin-bottom:5px; margin-left:5px">đến&nbsp;</div>
                <div style="float:left; width:75px; margin-bottom:5px; background-color:#FFF">
                <input type="text" id="denngay_1" name="denngay_1" class="text_date" value="{$smarty.now|date_format:'%d'}" maxlength="2" />
                /<input type="text" id="denngay_2" name="denngay_2" class="text_month" value="{$smarty.now|date_format:'%m'}" maxlength="2" />
                /<input type="text" id="denngay_3" name="denngay_3" class="text_year" value="{$smarty.now|date_format:'%Y'}" maxlength="4" />
                </div>
            </div>
        </legend>
    	<div style="float:left; height:5px; width:100%"></div>
        <div style="float:left; height:25px; width:890px; border-top:1px solid #99bbe8; border-bottom:1px solid #99bbe8 ">        
            <div class="tbl_tit" style="width:47px; text-align:center"><b>STT</b></div>	
            <div class="tbl_tit" style="width:70px"><B>&nbsp;Thời gian</B></div>
            <div class="tbl_tit" style="width:95px"><B>&nbsp;Loại văn bản</B></div>
            <div class="tbl_tit" style="width:70px"><B>&nbsp;Ký hiệu</B></div>
            <div class="tbl_tit" style="width:301px"><B>&nbsp;Trích yếu</B></div>
            <div class="tbl_tit" style="width:150px"><B>&nbsp;Khối phát hành</B></div>
            <div class="tbl_tit" style="width:150px"><B>&nbsp;Y kiến chỉ đạo</B></div>
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
                <div class="{$class_td}" style="width:70px; white-space:nowrap" title="{$obj_list[pi]->doc_code}">
                    &nbsp;{$obj_list[pi]->doc_code|str_string_cut:"10":"1"}
                </div>
                <div class="{$class_td}" style="width:301px" title="{$obj_list[pi]->doc_desc}">
                	{math a=$smarty.section.pi.index b=1 equation="a+b" assign=count}
                    <div style="float:left; width:271px; white-space:nowrap">&nbsp;<a href="javascript: void(0);" onclick="edit_me_Doc({$obj_list[pi]->doc_id})" >{$obj_list[pi]->doc_desc|str_string_cut:"73":"1"}</a></div>
                    <div style="float:right; margin:2px; border:1px solid #8ea4c1; height:18px; width:16px; text-align:center; background-color:#dfe8f6" title="Chức năng mở rộng">
                    {if $user_level eq 9 or $user_level eq 1}<a href='javascript: void(0);' onclick="show_list_tnvb_options({$count},{$total_num_result})">
                    <img src="{$css_path}extra_icon.png" width="14" height="14" border="0" class="img_all"></a>{/if}
                    </div>
                    <div id="extra_tnvb_{$count}" style="position:absolute; display:none; height:auto; width:120px; margin:2px 160px; border:1px solid #8ea4c1; border-right:8ea4c1; background-color:#dfe8f6">
                        
                        <div style="float:left; width:120px; height:18px; border-right:1px solid #dfe8f6"><b>&nbsp;Thao tác:</b></div>
                        <div style="float:left; width:110px; padding:0 0 0 3px; border-right:1px solid #dfe8f6">
                             - <a href="javascript: void(0)" onclick="javascript: show_tnvb_lienquan({$obj_list[pi]->doc_id})">Văn bản liên quan</a>
                        </div>
                        <div style="float:left; width:110px; padding:0 0 0 3px">
                             - <a href="javascript: void(0)" onclick="javascript: show_tnvb_ykien({$obj_list[pi]->doc_id})">Ý kiến thảo luận</a>
                        </div>
                        <div style="float:left; width:110px; padding:0 0 0 3px">
                             - <a href="javascript: void(0)" onclick="javascript: show_chitiet_tnvb({$obj_list[pi]->doc_id})">Chi tiết truyền nhận</a>
                        </div>
                        <div style="float:left; width:110px; height:3px">
                        	<hr width="100%" size="1" />
                        </div>
                        <div style="float:left; width:110px; padding:0 0 0 3px">
                             - <a href="javascript: void(0)" onclick="javascript: show_thongtin_docin({$obj_list[pi]->docin_id})">Thông tin văn bản</a>
                        </div>
                        <div style="float:left; width:110px; padding:0 0 0 3px">
                             - <a href="javascript: void(0)" onClick="javascript: delItems_TNVB('{$processurl}',{$obj_list[pi]->doc_id});">Xóa truyền</a>
                        </div>
                    </div>
                </div>
                <div class="{$class_td}" style="width:150px" title="{$obj_list[pi]->doc_unit}">
                    &nbsp;{$obj_list[pi]->doc_unit|str_string_cut:"35":"1"}
                </div>
                <div class="{$class_td}" style="width:150px" title="{$obj_list[pi]->doc_direct}">
                    &nbsp;{$obj_list[pi]->doc_direct|str_string_cut:"35":"1"}
                </div>
            </div>
            {/section}
        </div>
        <input type="hidden" id="curpage_Doc" name="curpage" value="{$vars.curpage}" />
        <input type="hidden" name="arg" id="arg" value="{$vars.arg}">
    </fieldset>
    </form>
</div>
<!------------------------------------------------- Tool bar --------------------------------------------->
<div id="transport_clear_txt"></div>
<div id="transport_tool_bar">

    <div id="transport_search_area">
    <select name="order" id = "order_Doc" style="width:120px; font-size:12px; border:1px solid #99bbe8; margin-left:1px" onchange="reloadPage_Doc('{$processurl}');">
    {section name=sli loop=$order_arr}
        <option value="{$smarty.section.sli.index}" {if $smarty.section.sli.index eq $vars.order}selected{/if} >
        {$order_arr[sli]}
        </option>
    {/section}
    </select>
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div id="transport_page_area">
    {if $vars.curpage eq 1}
    	<img src="{$css_path}icon_first_page.png" class="img_all">
    	<img src="{$css_path}icon_pre_page.png" class="img_all">
    {else}
    <a href="javascript: void(0)" id="first_page" onclick="gotoPage_Doc('{$processurl}',parseInt(1));" title="Trang đầu">
    	<img src="{$css_path}icon_first_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="pre_page" onclick="gotoPage_Doc('{$processurl}',parseInt(document.getElementById('page_Doc').value)-parseInt(1));" title="Trang trước">
    	<img src="{$css_path}icon_pre_page.png" class="img_all">
    </a>
    {/if}
    </div>
    <div style="float:left; line-height:19px">
        <div style="float:left; width:35px">Trang</div> 
        <div style="float:left; width:35px">
        <input type="text" value="{$vars.curpage}" name="page" id="page_Doc" onblur=" gotoPage_Doc('{$processurl}',this.value);" style="width:30px; font-size:12px; height:15px; border:1px solid #99bbe8">
        </div>
        <div style="float:left; width:42px"> / {$num_page}</div>
    </div>
    <div id="transport_page_area">
    {if $vars.curpage eq $num_page}
    	<img src="{$css_path}icon_next_page.png" class="img_all">
        <img src="{$css_path}icon_last_page.png" class="img_all">
    {else}
    <a href="javascript: void(0)" id="next_page" onclick="gotoPage_Doc('{$processurl}',parseInt(document.getElementById('page_Doc').value)+parseInt(1));" title="Trang tiếp">
    	<img src="{$css_path}icon_next_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="last_page" onclick="gotoPage_Doc('{$processurl}',parseInt({$num_page}));" title="Trang cuối">
    	<img src="{$css_path}icon_last_page.png" class="img_all">
    </a>
    {/if}
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:left; width:15px">
    <a href="javascript: void(0)" id="a_ref_Doc" title="Tải lại"><img src="{$css_path}icon_refresh.png" class="img_all"></a>
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:right; line-height:19px; margin-right:2px">
        <div style="float:left; width:40px">Xem</div>
        <div style="float:left; width:52px">
            <select name="numresult" id="numresult_Doc" style="width:50px; font-size:12px; border:1px solid #99bbe8" onchange="reloadPage_Doc('{$processurl}');">
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
	function show_list_tnvb_options(count,total){
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
	
	function show_hide_seek_tnvb(){
		if(document.getElementById('seek_more_tnvb').style.display=='none')
			document.getElementById('seek_more_tnvb').style.display='';
		else document.getElementById('seek_more_tnvb').style.display='none';
	}
	
	function delItems_TNVB(processurl,delStr){
		if (delStr == ""){
			return false;
		}
		if(!confirm("THÔNG BÁO: \n\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
			return false;
		}	
		
		var numresult_Doc,order_Doc,curpage_Doc;
		numresult = $("#numresult_Doc").val();
		order = $("#order_Doc").val();
		curpage = $("#curpage_Doc").val();
		
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
				$('#transport_content_main').fadeOut('fast').load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+curpage).fadeIn("fast");
			}
		});
	}
	
	function reloadPage_Doc(processurl){
		var numresult_Doc,order_Doc,cur_pos;
		numresult = $("#numresult_Doc").val();
		order = $("#order_Doc").val();
		cur_pos = 0;
		$("#transport_content_main").load(processurl+"&numresult="+numresult+"&order="+order+"&cur_pos="+cur_pos);
	}
	
	function show_tnvb_ykien(doc_id){
		$("#tnvb_ykien").css({'display':'block','z-index':'2010','border':'1px solid #F00'});
		$("#tnvb_ykien_cont").load("?listYkien&mod=truyennhans&doc_id="+doc_id);
	}
	
	function show_tnvb_lienquan(doc_id){
		$("#tnvb_lienquan").css({'display':'block','z-index':'2010','border':'1px solid #F00'});
		$("#tnvb_lienquan_cont").load("?listTNVBReply&mod=truyennhans&doc_id="+doc_id);
	}
	
	function show_chitiet_tnvb(doc_id){
		$("#list_truyenvb").css({'display':'block','z-index':'2010','border':'1px solid #F00'});
		$("#list_truyenvb_cont").load("?viewDoc&mod=truyennhans&doc_id="+doc_id);
	}
	
	function show_thongtin_docin(docin_id){
		document.getElementById('div_view_transport').style.display='block';
		$("#list_view_transport_cont").load("?viewDocinQLVB&mod=truyennhans&doc_id="+docin_id);
	}
		
	function gotoPage_Doc(processurl,page){
		var numresult_Doc,order_Doc,cur_pos;
		numresult = $("#numresult_Doc").val();
		order = $("#order_Doc").val();
		//alert(processurl+'-'+page+'-'+numresult+'-'+order);
		$("#transport_content_main").load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+page);
	}
		
	function search_me_Doc(){
		var doc_desc_fs 	= document.getElementById('doc_desc_fs').value;
		var doc_code_fs 	= document.getElementById('doc_code_fs').value;
		var doc_num_fs 		= document.getElementById('doc_num_fs').value;
		var unit_name_fs 	= document.getElementById('unit_name_fs').value;
		var docCat_id_fs 	= document.getElementById('docCat_id_fs').value;
		
		if (doc_desc_fs == "" && doc_code_fs == "" && doc_num_fs == "" && unit_name_fs == "" && docCat_id_fs == ""){
			return false;
		}
		
		$.post('?VT_Truyennhan&mod=truyennhans&search_me=1',
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
	
	// ----- ket xuat
	function export_tnvb(exptype){
		var tungay_1 	= document.getElementById('tungay_1').value;
		var tungay_2 	= document.getElementById('tungay_2').value;
		var tungay_3 	= document.getElementById('tungay_3').value;
		
		var denngay_1 	= document.getElementById('denngay_1').value;
		var denngay_2 	= document.getElementById('denngay_2').value;
		var denngay_3 	= document.getElementById('denngay_3').value;
				
		var tungay = tungay_3+'-'+tungay_2+'-'+tungay_1;
		var denngay = denngay_3+'-'+denngay_2+'-'+denngay_1;
				
		if (tungay == "" && denngay == ""){
			return false;
		}
		
		if(exptype==3){
			$('#div_tnvb_report').css({'display':'block','z-index':'2001'});
			$.post('?expDocReport&mod=truyennhans&exptype='+exptype,
				{
					tungay:tungay,
					denngay:denngay
				},
				function(data){
					$('#tnvb_report_content_main').html(data);
					$("#tnvb_report_content_main").show();
				}
			);
			
			$('#transport_content_main').hide();
			$('#transport_content_main').fadeOut('fast').load('index.php?VT_Truyennhan&mod=truyennhans').fadeIn("fast");
		}else{
			window.location="?expDocReport&mod=docs&exptype="+exptype+"&tungay="+tungay+"&denngay="+denngay;
		}
	}
	
	function edit_me_Doc(id){
		$("#transport_content_main").load("?VT_Truyennhan&mod=truyennhans&edit_me=1&doc_id="+id);
	}
		
	$("#a_ref_Doc").click( function () { 
			$('#transport_content_main').hide();
			$('#transport_content_main').fadeOut('fast').load('index.php?VT_Truyennhan&mod=truyennhans').fadeIn("fast");
		});
</script>
{/literal}