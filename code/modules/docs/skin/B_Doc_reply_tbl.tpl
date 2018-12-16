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
<div id="doc_content_insign">
	<form method="post" name="frmList_Doc" action="?replyDoc{$vars.arg}" id="frmList_Doc">
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
                <a href="javascript: void(0);" onClick="show_hide_seek()" style="text-decoration:none; color:#F00">
                <div style="float:left; margin-left:3px"><img src="{$css_path}icon_keo_dai.png" class="img_all"></div></a>
            </div>
            <div style="width:380px; float:left; font-weight:normal; position:absolute; display:none; margin:23px 0 0 200px; background-color:#ccd8e7; border:1px solid #99bbe8; border-top:none" id="seek_more">
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
                <a href="javascript: void(0);" onClick="export_doc(1)" style="text-decoration:none; color:#F00">
                <div style="float:left; margin-left:5px; width:26px">
                <img src="../images/admin/word_icon.png" class="img_all" height="20" title="Kết xuất MS Word"></div>
                </a>
                <a href="javascript: void(0);" onClick="export_doc(2)" style="text-decoration:none; color:#F00">
                <div style="float:left; margin-left:5px; width:26px">
                <img src="../images/admin/excel_icon.png" class="img_all" height="20" title="Kết xuất MS Excel"></div>
                </a>
                <a href="javascript: void(0);" onClick="export_doc(3)" style="text-decoration:none; color:#F00">
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
                
                <div style="float:left; width:56px; margin-bottom:5px">- Số đến:</div>
                <div style="float:left; width:20px; margin-bottom:5px">Từ&nbsp;</div>
                <div style="float:left; width:75px; background-color:#FFF; margin-bottom:5px">
                <input type="text" id="soden_tu" name="soden_tu" class="text_seek_tiny" value="{$vars.soden_tu}" />
                </div>
                <div style="float:left; width:24px; margin-bottom:5px; margin-left:5px">đến&nbsp;</div>
                <div style="float:left; width:75px; margin-bottom:5px; background-color:#FFF">
                <input type="text" id="soden_den" name="soden_den" class="text_seek_tiny" value="{$vars.soden_den}" />
                </div>
                
                <div style="float:left; width:76px; margin-bottom:5px">- Nơi gửi đến: </div>
                <div style="float:left; width:150px; margin-bottom:5px">
                <input type="text" value="{$vars.unit_name_fil}" id="unit_name_fil" name="unit_name_fil" class="text_seek_middle" />
                {literal}
                <script type="text/javascript">
                $().ready(function() {
                    $("#unit_name_fil").autocomplete("B_unit_auto.php", {
                        width: 160,
                        matchContains: true,
                        selectFirst: true
                    });
                });
                </script>
                {/literal}
                </div>
                
                <div style="float:left; width:76px; margin-bottom:5px">- Loại văn bản: </div>
                <div style="float:left; width:150px; margin-bottom:5px">
                <input type="text" value="{$vars.docCat_id_fil}" id="docCat_id_fil" name="docCat_id_fil" class="text_seek_middle" />
                {literal}
                <script type="text/javascript">
                $().ready(function() {
                    $("#docCat_id_fil").autocomplete("B_docCat_auto.php", {
                        width: 160,
                        matchContains: true,
                        selectFirst: true
                    });
                });
                </script>
                {/literal}
                </div>
                <div style="float:left; width:76px; margin-bottom:5px">- Phòng/ban: </div>
                <div style="float:left; width:150px; margin-bottom:5px">
                <select name="department_fil" id="department_fil" class="select_seek">
                    <option value="0">Chọn phòng ban</option>
                    {section name=di loop=$obj_list_department}
                    <option value="{$obj_list_department[di]->department_id}">{$obj_list_department[di]->department_name}</option>
                    {/section}
                </select>
                </div>
            </div>
        </legend>
    	<div style="float:left; height:5px; width:100%"></div>
        <div style="float:left; height:25px; width:890px; border-top:1px solid #99bbe8; border-bottom:1px solid #99bbe8 ">
            <div class="tbl_tit" style="width:40px; text-align:center"><b>STT</b></div>
            <div class="tbl_tit" style="width:45px; text-align:right"><B>&nbsp;Số đến&nbsp;</B></div>
            <div class="tbl_tit" style="width:75px"><B>&nbsp;Ký hiệu</B></div>
            <div class="tbl_tit" style="width:369px"><B>&nbsp;Trích yếu</B></div>
            <div class="tbl_tit" style="width:132px"><B>&nbsp;Nơi gửi</B></div>
            <div class="tbl_tit" style="width:60px"><B>&nbsp;Ngày nhập</B></div>
            <div class="tbl_tit" style="width:60px"><B>&nbsp;Hạn xử lý</B></div>
            <div class="tbl_tit" style="width:60px"><B>&nbsp;Quá hạn</B></div>
            <div class="tbl_tit" style="width:40px; text-align:center"><B>File</B></div>
        </div>
        <div style="float:left; width:20px; text-align:right">
        <input type="button" name="del_Items" id='del_Items' value="&nbsp;" onClick="delItems_Doc('{$processurl}');" style="width:17px; font-size:12px; background:url(../images/admin/b_drop.png); cursor:pointer" title="Xóa lựa chọn">
        </div>
        <div style="float:left; height:404px; width:912px; overflow-y:scroll">
            {section name=pi loop=$obj_list}
            {if $smarty.section.pi.index is not div by 2} 
            {assign var="class_td" value="tbl_cont"} 
            {else}
            {assign var="class_td" value="tbl_cont2"} 
            {/if}
            {math x=$vars.curpage-1 y=$vars.numresult z=$smarty.section.pi.index t=1 equation="x*y+z+t" assign=stt}
            <div style="float:left">
                <div class="{$class_td}" style="width:40px; text-align:center">{$stt}</div>
                <div class="{$class_td}" style="width:45px; white-space:nowrap; text-align:right">
                    &nbsp;{$obj_list[pi]->doc_num}&nbsp;
                </div>
                <div class="{$class_td}" style="width:75px; white-space:nowrap" title="{$obj_list[pi]->doc_code}">
                    &nbsp;{$obj_list[pi]->doc_code|str_string_cut:"10":"1"}
                </div>
                <div class="{$class_td}" style="width:369px" title="{$obj_list[pi]->doc_desc} (Nơi gửi: {$obj_list[pi]->unit_name})">
                	{math a=$smarty.section.pi.index b=1 equation="a+b" assign=count}
                    <div style="float:left; width:325px; white-space:nowrap">
                        {$obj_list[pi]->doc_desc|str_string_cut:"88":"1"}
                    </div>
                    <div style="float:left; margin:2px; border:1px solid #8ea4c1; height:18px; width:16px; text-align:center; background-color:#dfe8f6">
                        {if $obj_list[pi]->doc_theodoi eq 1}
                        <img src="{$css_path}warning_danger.png" width="14" height="14" border="0" class="img_all" title="Văn bản có hạn giải quyết">
                        {else}
                        <img src="{$css_path}warning_safe.png" width="14" height="14" border="0" class="img_all" title="Văn bản thông thường">
                        {/if}
                    </div>
                    <div style="float:right; margin:2px; border:1px solid #8ea4c1; height:18px; width:16px; text-align:center; background-color:#dfe8f6" title="Chức năng mở rộng">
                    {if $user_level eq 4 or $user_level eq 5}<a href='javascript: void(0);' onclick="show_list_options({$count},{$total_num_result})">
                    <img src="{$css_path}extra_icon.png" width="14" height="14" border="0" class="img_all"></a>{/if}
                    </div>
                    <div id="extra_{$count}" style="position:absolute; display:none; height:auto; width:140px; margin:2px 208px; border:1px solid #8ea4c1; border-right:8ea4c1; background-color:#dfe8f6; z-index:2010">
                        <div style="float:left; width:140px; height:18px; border-right:1px solid #dfe8f6"><b>&nbsp;Thao tác:</b></div>
                        {if $obj_list[pi]->doc_active eq 1 or $obj_list[pi]->doc_active eq 2 or $obj_list[pi]->doc_active eq 3}
                            <div style="float:left; width:140px; padding:0 0 0 3px">
                                - <a href="javascript: void(0)" onclick="javascript: show_list_reply({$obj_list[pi]->doc_id})">Chỉ đạo</a>
                            </div>
                        {/if}
                        {if  $obj_list[pi]->doc_active eq 2}
                            <div style="float:left; width:140px; padding:0 0 0 3px">
                                - <a href="javascript: void(0)" onclick="javascript: show_giaiquyet({$obj_list[pi]->doc_id})">Giải quyết</a>
                            </div>
                        {/if}
                        {if  $obj_list[pi]->doc_active eq 3}
                            <div style="float:left; width:140px; padding:0 0 0 3px">
                                - <a href="javascript: void(0)" onclick="javascript: xac_nhan_kq({$obj_list[pi]->doc_id})">Xác nhận kết quả</a>
                            </div>
                        {/if}
                        <div style="float:left; width:140px; padding:0 0 0 3px">
                             - <a href="javascript: void(0)" onclick="javascript: show_thongtin_vanban({$obj_list[pi]->doc_id})">Thông tin văn bản</a>
                        </div>
                    </div>
                </div>
                
                <div class="{$class_td}" style="width:132px; white-space:nowrap" title="{$obj_list[pi]->unit_name}">{$obj_list[pi]->unit_name|str_string_cut:"30":"1"}</div>

                <div class="{$class_td}" style="width:60px">
                    &nbsp;{$obj_list[pi]->doc_date|date_format:"%d/%m/%Y"}
                </div>
                <div class="{$class_td}" style="width:60px">
                    {php}
                        $songayqh = 0;
                        $sql = "select * from tbl_docreplys where doc_id = ".$this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->doc_id." order by docReply_id asc limit 1";
                        $result = mysql_query($sql) or die($sql);
                        if(mysql_num_rows($result)>0){
                        $row = mysql_fetch_array($result);
                        if($row['docReply_limit_time'] != "0000-00-00" && $row['docReply_limit_time'] != "1970-01-01"){
                        echo '&nbsp;'.date('d/m/Y',strtotime($row['docReply_limit_time']));
                        $songayqh = (strtotime(date('Y-m-d'))-strtotime($row['docReply_limit_time']))/(24*60*60);
                        }else{
                        echo "&nbsp;";
                        }
                        }else{
                        echo "&nbsp;";
                        }
                    {/php}
                </div>
                <div class="{$class_td}" style="width:60px; text-align:right; color: #FF0000">
                    {php}if($songayqh>0) echo $songayqh.' ngày';{/php}&nbsp;
                </div>
                <div class="{$class_td}" style="width:40px; text-align:center">
                    {if $obj_list[pi]->doc_file eq 2}
                    <a href='javascript: void(0);' onclick="show_list_file({$obj_list[pi]->doc_id})">
                    <img src="../images/admin/empty_icon.png" width="14" height="14" border="0" class="img_all"></a>
                    {else}
                    <a href='javascript: void(0);' onclick="show_list_file({$obj_list[pi]->doc_id})">
                    <img src="../images/admin/folder_icon.png" width="14" height="14" border="0" class="img_all"></a>
                    {/if}
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
<div id="doc_clear_txt"></div>
<div id="doc_tool_bar">

    <div id="doc_search_area">
    <select name="order" id = "order_Doc" style="width:120px; font-size:12px; border:1px solid #99bbe8; margin-left:1px" onchange="reloadPage_Doc('{$processurl}');">
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
    <div id="doc_page_area">
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
	function show_list_options(obj,total){
		for(i=1;i<=total;i++){
			if(i==obj){
				if(document.getElementById('extra_'+i).style.display=='none')
					document.getElementById('extra_'+i).style.display='block';
				else
					document.getElementById('extra_'+i).style.display='none';
			}
			else
				document.getElementById('extra_'+i).style.display='none';
		}
	}
	function show_hide_seek(){
		if(document.getElementById('seek_more').style.display=='none')
			document.getElementById('seek_more').style.display='';
		else document.getElementById('seek_more').style.display='none';
	}
	
	function show_hide_filter(){
		if(document.getElementById('div_filter').style.display=='none')
			document.getElementById('div_filter').style.display='';
		else document.getElementById('div_filter').style.display='none';
	}
	
	function docheck_Doc(status,from_){
		var alen=document.frmList_Doc.elements.length;
		alen=(alen>5)?document.frmList_Doc.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
			document.frmList_Doc.chkid[i].checked=status;
		}
		else{
			document.frmList_Doc.chkid.checked=status;
		}
		if(from_>0) document.frmList_Doc.chkall.checked=status;
	}
		
	function docheckone_Doc(){
		var alen=document.frmList_Doc.elements.length;
		var isChecked=true;
		alen=(alen>4)?document.frmList_Doc.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_Doc.chkid[i].checked==false)
					isChecked=false;
		}else{
			if(document.frmList_Doc.chkid.checked==false)
				isChecked=false;
		}				
		document.frmList_Doc.chkall.checked=isChecked;
	}
	
	function calculatechon_Doc(){			
		var strchon="";
		var alen=document.frmList_Doc.elements.length;				
		alen=(alen>2)?document.frmList_Doc.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_Doc.chkid[i].checked==true)
					strchon+=document.frmList_Doc.chkid[i].value+",";
		}else{
			if(document.frmList_Doc.chkid.checked==true)
				strchon=document.frmList_Doc.chkid.value;
		}
		document.frmList_Doc.chon_Doc.value=strchon;
	}
	
	function delItems_Doc(processurl,delStr){
		if (delStr == undefined){
			calculatechon_Doc();
			delStr = document.getElementById("chon_Doc").value;
		}
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
				$('#doc_content_main').fadeOut('fast').load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+curpage).fadeIn("fast");
			}
		});
	}
	
	function reloadPage_Doc(processurl){
		var numresult_Doc,order_Doc,cur_pos;
		numresult = $("#numresult_Doc").val();
		order = $("#order_Doc").val();
		cur_pos = 0;
		$("#doc_content_main").load(processurl+"&numresult="+numresult+"&order="+order+"&cur_pos="+cur_pos);
	}
	
	function show_list_file(doc_id){
		document.getElementById('list_file').style.display='block';
		$("#list_file_cont").load("?listDocFile&mod=docs"+"&doc_id="+doc_id);
	}
	
	function show_list_reply(doc_id){
		document.getElementById('list_reply').style.display='block';
		document.getElementById('list_reply').style.zIndex='2001';
		var arg = document.getElementById('arg').value;
		$("#list_reply_cont").load("?listDocReply&arg="+arg+"&doc_id="+doc_id);
	}
	
	function show_giaiquyet(doc_id){
		document.getElementById('div_giaiquyet').style.display='block';
		document.getElementById('div_giaiquyet').style.zIndex='2001';
		var arg = document.getElementById('arg').value;
		$("#list_giaiquyet_cont").load("?Giaiquyet&doc_id="+doc_id+arg);
	}

    function xac_nhan_kq(doc_id){
        var arg = document.getElementById('arg').value;
        $("#list_reply_cont").load("?replyDoc&arg="+arg+"&XNdoc_id="+doc_id);
    }
			
	function show_thongtin_vanban(doc_id){
		document.getElementById('div_view_doc').style.display='block';
		$("#list_view_doc_cont").load("?viewDoc&mod=docs&doc_id="+doc_id);
	}
		
	function gotoPage_Doc(processurl,page){
		var numresult_Doc,order_Doc,cur_pos;
		numresult = $("#numresult_Doc").val();
		order = $("#order_Doc").val();
		//alert(processurl+'-'+page+'-'+numresult+'-'+order);
		$("#doc_content_main").load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+page);
	}
	
	function uncheck_fns_Doc(field,val,id){
		$("#doc_content_main").load("?replyDoc&mod=docs&checkUncheck="+val+"&setfield="+field+"&checkUncheckID="+id);
	}
	
	function sort_me_Doc(id,val){
		$("#doc_content_main").load("?replyDoc&mod=docs&sort_me=1&doc_id="+id+"&val="+val);
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
		
		$.post('?replyDoc&mod=docs&search_me=1',
			{
				doc_desc_fs:doc_desc_fs,
				doc_code_fs:doc_code_fs,
				doc_num_fs:doc_num_fs,
				unit_name_fs:unit_name_fs,
				docCat_id_fs:docCat_id_fs
			},
			function(data){
				$('#doc_content_main').html(data);
				$("#doc_content_main").show();
			}
		);
	}
	
	// ----- ket xuat
	function export_doc(exptype){
		var tungay_1 	= document.getElementById('tungay_1').value;
		var tungay_2 	= document.getElementById('tungay_2').value;
		var tungay_3 	= document.getElementById('tungay_3').value;
		
		var denngay_1 	= document.getElementById('denngay_1').value;
		var denngay_2 	= document.getElementById('denngay_2').value;
		var denngay_3 	= document.getElementById('denngay_3').value;
		
		var soden_tu 	= document.getElementById('soden_tu').value;
		var soden_den 	= document.getElementById('soden_den').value;
		
		var unit_name_fil 	= document.getElementById('unit_name_fil').value;
		var docCat_id_fil 	= document.getElementById('docCat_id_fil').value;
		var department_fil 	= document.getElementById('department_fil').value;
		
		var tungay = tungay_3+'-'+tungay_2+'-'+tungay_1;
		var denngay = denngay_3+'-'+denngay_2+'-'+denngay_1;
				
		if ((tungay == "" && denngay == "") && (soden_tu == "" && soden_den == "") ){
			return false;
		}
		
		if(exptype==3){
			document.getElementById('div_doc_report').style.display='block';
			$.post('?expDocReport&mod=docs&exptype='+exptype,
				{
					tungay:tungay,
					denngay:denngay,
					soden_tu:soden_tu,
					soden_den:soden_den,
					unit_name_fil:unit_name_fil,
					docCat_id_fil:docCat_id_fil,
					department_fil:department_fil
				},
				function(data){
					$('#doc_report_content_main').html(data);
					$("#doc_report_content_main").show();
				}
			);
			
			$('#doc_content_main').hide();
			$('#doc_content_main').fadeOut('fast').load('index.php?replyDoc&mod=docs').fadeIn("fast");
			//$('#doc_report_content_main').load("?expDocReport&mod=docs&exptype="+exptype+"&tungay="+tungay+"&denngay="+denngay);
		}else{
			window.location="?expDocReport&mod=docs&exptype="+exptype+"&tungay="+tungay+"&denngay="+denngay;
		}
	}
	
	function edit_me_Doc(id){
		$("#doc_content_main").load("?replyDoc&mod=docs&edit_me=1&doc_id="+id);
	}
		
	$("#a_ref_Doc").click( function () { 
			$('#doc_content_main').hide();
			$('#doc_content_main').fadeOut('fast').load('index.php?replyDoc&mod=docs').fadeIn("fast");
		});
</script>
{/literal}