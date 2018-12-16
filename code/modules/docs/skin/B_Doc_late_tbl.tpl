{literal}
<script type="text/javascript" language="javascript">
function ClickHereToPrint(){
	try{
		var oIframe = document.getElementById('ifrmPrint');
		var oContent = document.getElementById('divToPrint').innerHTML;
		var oDoc = (oIframe.contentWindow || oIframe.contentDocument);
		if (oDoc.document) oDoc = oDoc.document;
		oDoc.write("<head><title>Trang in</title>");
		oDoc.write("</head><body onload='this.focus(); this.print();'>");
		oDoc.write(oContent + "</body>");
		oDoc.close();
	}catch(e){
		self.print();
	}
}
</script>
{/literal}
<iframe id="ifrmPrint" src="#" style="width:0px; height:0px;"></iframe>
<div id="divToPrint">
<form method="post" name="frmList" action="?lateDoc{$vars.arg}" id="frmList">
<div style="padding-bottom: 3px; ">
<table class="adminlist" width="1500" border="0" cellpadding="0" cellspacing="0">
	<tbody>
	<tr>
		<td style="font-family: Arial; color:#930; font-size: 16px; font-weight: bold;" width="30%">
        	<div align="left"><img src="../images/admin/module.png" align="absmiddle" height="30">&nbsp;Văn bản cần theo dõi</div>
        </td>	
        <td>
        	<div style="text-align: left; padding-bottom: 3px;">
                <div style="padding-bottom: 3px; ">
                	<div style="float:left; width:80px; padding-top:4px">Ngày nhập </div>
                    <div style="float:left; width:210px">
                    Từ: <input type="text" name="doc_date1" id="doc_date1" value="{$vars.doc_date1}" class="text" style="width:120px"/>
                    &nbsp;<img src="../images/admin/img.gif"  align="absmiddle" id="icon_date01" style="cursor: pointer; border: 0" title="Chọn ngày trên lịch"/>
                    {literal}
					<script type="text/javascript">
                        Calendar.setup({
                            inputField   :   "doc_date1",
                            ifFormat     :   "%d-%m-%Y",
                            button       :   "icon_date01",
                            align        :   "Br",  
                            timeFormat   :   "24",
                            showsTime    :   true,
                            singleClick  :   true
                        });
                    </script>
                    {/literal}
                    </div>
                    <div style="float:left; width:210px">
                    Đến: <input type="text" name="doc_date2" id="doc_date2" value="{$vars.doc_date2}" class="text" style="width:120px"/>
                    &nbsp;<img src="../images/admin/img.gif"  align="absmiddle" id="icon_date02" style="cursor: pointer; border: 0" title="Chọn ngày trên lịch"/>
                    {literal}
					<script type="text/javascript">
                        Calendar.setup({
                            inputField   :   "doc_date2",
                            ifFormat     :   "%d-%m-%Y",
                            button       :   "icon_date02",
                            align        :   "Br",  
                            timeFormat   :   "24",
                            showsTime    :   true,
                            singleClick  :   true
                        });
                    </script>
                    {/literal}
                    </div>
                    <div style="float:left; width:550px; height:10px"></div>
                    <div style="float:left; width:80px; padding-top:4px">Số đến </div>
                    <div style="float:left; width:210px">                        
                        Từ: <input type="text" name="doc_num1" size="10" value="{$doc_num}"/>
                    </div>
                    <div style="float:left; width:210px">   
                    	Đến: <input type="text" name="doc_num2" size="10" value="{$doc_num}"/>                     
                    </div>
                    <div style="float:left; width:550px; height:10px"></div>
                    <div style="float:left; width:350px">   
                    	<b>Tình trạng: </b>
                        <select name="doc_limit_type" style="width:250px; height:20px;font-weight:bold">
                            <option value="3" style="color:#F00; font-weight:bold" {if $doc_limit_type eq 3} selected="selected"{/if}>Quá hạn nhưng chưa giải quyết</option>
                            <option value="1" style="color:#00F; font-weight:bold" {if $doc_limit_type eq 1} selected="selected"{/if}>Chưa giải quyết</option>
                            <option value="2" style="color:#00F; font-weight:bold" {if $doc_limit_type eq 2} selected="selected"{/if}>Đã giải quyết</option>
                            <option value="4" style="color:#F60; font-weight:bold" {if $doc_limit_type eq 4} selected="selected"{/if}>Giải quyết khi đã quá hạn</option>
                        </select>
                    </div>
                    <div style="float:left;">   
                        <input type="submit" name="cmdSearch" value="Lọc" />
                    </div>
                    <div style="float:left; width:550px; height:10px"></div>
                    <div style="float:left; width:450px; padding-top:4px">
                    <a href="?expDocLate{$vars.arg}&exptype=1">Kết xuất Microsoft Excel (.xls)</a> | <a href="?expDocLate{$vars.arg}&exptype=3">Kết xuất Microsoft Word (.doc)</a> | <a href="?expDocLate{$vars.arg}&exptype=2" target="_blank">In sổ lưu trữ</a>
                    </div>
                </div>
            </div>
        </td>		
	</tr>
	</tbody>
</table>
</div>
<div style="clear:both">&nbsp;</div>
<div style="float:left; width:910px; overflow-x:scroll">
<table style="width:1300px" border = "1" align="center" class="adminlist">
	<tr>
		<td colspan="10" style="text-align:left">
			<div style="float:left; padding-top: 3px; width:200px"><font class="label_font" color="#000000"><b>Danh sách văn bản</b></font></div>
			<div style="float:left; padding-top: 3px; width:200px">Có tất cả {$total_num_result} văn bản</div>
        </td>
    </tr>
	<tr>
		<td colspan="10" style="text-align:left">{$pager_str}</td>
    </tr>
	<tr  bgcolor="#EEEEEE" >
       <td width="6%" align="center" ><font class="label_font" color="#000000"><B>Ngày nhận</B></font></td>
        <td width="6%" align="center" ><font class="label_font" color="#000000"><B>Số đến</B></font></td>	
        <td width="10%" align="center" ><font class="label_font" color="#000000"><B>Cơ quan ban hành</B></font></td>
        <td width="6%" align="center" ><font class="label_font" color="#000000"><B>Số ký hiệu</B></font></td>
        <td width="6%" align="center" ><font class="label_font" color="#000000"><B>Ngày ký</B></font></td>
        <td align="center"><font class="label_font" color="#000000"><B>Trích yếu</B></font></td>
        <td width="6%" align="center" ><font class="label_font" color="#000000"><B>Ngày chỉ đạo</B></font></td>
        <td width="10%" align="center" ><font class="label_font" color="#000000"><B>ĐV Giải quyết</B></font></td>
		<td width="6%" align="center" ><font class="label_font" color="#000000"><B>Thời hạn (Ngày)</B></font></td>
        <td width="6%" align="center" ><font class="label_font" color="#000000"><B>Ngày quá hạn</B></font></td>
	</tr>
	{section name=pi loop=$obj_list}
	<tr {if $smarty.section.pi.index is not div by 2} bgcolor="#F2FFEC" {/if} >
        <td align="center">{$obj_list[pi]->doc_recevied|date_format:"%d-%m-%Y"}</td>
        <td align="center">{$obj_list[pi]->doc_num}</td> 
        <td align="left">{$obj_list[pi]->unit_name}</td>
        <td align="center">{$obj_list[pi]->doc_code}</td>
        <td align="center">{$obj_list[pi]->doc_signed|date_format:"%d-%m-%Y"}</td>
        <td align="left">{$obj_list[pi]->doc_desc}</td>
        <td align="center">{$obj_list[pi]->DR_docReply_date|date_format:"%d-%m-%Y"}</td>
        <td align="left">
        {php}
            $sql="SELECT main_department FROM tbl_docreplys WHERE doc_id = ".$this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->doc_id." AND process_per=0 ORDER BY docReply_id DESC LIMIT 1 ";
            $result = mysql_query($sql);
            if($result):
            $row=mysql_fetch_array($result);
            	$sql_depa="SELECT * FROM tbl_departments WHERE department_id = ".$row['main_department']."";
                $result_depa = mysql_query($sql_depa);
                if($result_depa):
                $row_depa=mysql_fetch_array($result_depa);
                echo $row_depa['department_name'];
                endif;
            endif;
        {/php}
        </td>
		<td align="center">{$obj_list[pi]->docReply_numday}</td>
        <td align="center">{$obj_list[pi]->docReply_limit_time|date_format:"%d-%m-%Y"}</td>
	</tr>
	{/section}
</table>
</div>
<div style="clear:both"><img src='../images/admin/spacer.gif' height="10px" /></div>
<input type="hidden" id="curpage" name="curpage" value="{$vars.curpage}" />
<div style="float:left; text-align:left; padding-left: 20px">
	<font color="#000000">
		Sắp xếp theo
		<select name="order" id = "order" style=" font-size:12px; height:20px;" onchange="reloadPage('{$processurl}');">
		{section name=sli loop=$order_arr}
			<option value="{$smarty.section.sli.index}" {if $smarty.section.sli.index eq $vars.order}selected{/if} >
			{$order_arr[sli]}
			</option>
		{/section}
		</select>
	</font>
</div>					
<div style="float:right; text-align:right; padding-right: 20px">
	<font color="#000000">
		Hiển thị
		<select name="numresult" id = "numresult" style=" font-size:12px; height:20px;" onchange="reloadPage('{$processurl}');">
            {section name=sli loop=$nrs_arr}
             <option value="{$nrs_arr[sli]}" {if $nrs_arr[sli] eq $vars.numresult}selected{/if} > {$nrs_arr[sli]} </option>
            {/section}
		</select>
		dòng / 1 trang
    </font>
</div>
</form>
</div>