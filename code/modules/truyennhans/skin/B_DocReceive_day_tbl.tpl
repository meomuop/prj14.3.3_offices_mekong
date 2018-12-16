<form method="post" name="frmList" action="?listDoc{$vars.arg}" id="frmList">
<div style="padding-bottom: 3px; ">
<table class="adminlist" width="100%" border="0" cellpadding="0" cellspacing="0" style="background-color:#ffd7ae;">
	<tbody>
	<tr>
		<td style="font-family: Arial; color:#930; font-size: 16px; font-weight: bold;" width="50%">
        	<div align="left"><img src="../images/admin/module.png" align="absmiddle" height="30">&nbsp;Danh sách văn bản đến trong ngày</div>
        </td>
        <td style="font-family: Arial; color:#930; font-size: 16px; font-weight: bold;">
        	<div align="left"><a href="?reportDoc&mod=docs">Tổng hợp văn bản đi-đến tại các đơn vị</a></div>
        </td>	
	</tr>
    </tbody>
</table>
</div>
<div style="clear:both">&nbsp;</div>
<div style="clear:both"><img src='../images/admin/spacer.gif' height="10px" /></div>
<input type="hidden" id="curpage" name="curpage" value="{$vars.curpage}" />
<div style="float:left; text-align:left; padding-left: 20px">
	<font color="#000000">
		Các loại văn bản
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
<table width="95%" border="1" align="center" class="adminlist">
	<tr>
		<td colspan="8" style="text-align:left">
			<div style="float:left; padding-top: 3px;">{$pager_str}</div>
        </td>
	</tr>
	<tr  bgcolor="#EEEEEE" >
		<td width="5%" align="center" style="background-color:#ffd7ae; border-right:1px solid #003451; border-bottom:1px solid #003451"><font class="label_font" color="#000000"><b>STT</b></font></td>	
        <td width="5%" align="center" style="background-color:#ffd7ae; border-right:1px solid #003451; border-bottom:1px solid #003451"><font class="label_font" color="#000000"><B>Xem</B></font></td>
        <td width="20%" align="center" style="background-color:#ffd7ae; border-right:1px solid #003451; border-bottom:1px solid #003451"><font class="label_font" color="#000000"><B>Loại VB/Số KH/Độ khẩn</B></font></td>
        <td align="center" style="background-color:#ffd7ae; border-right:1px solid #003451; border-bottom:1px solid #003451"><font class="label_font" color="#000000"><B>Trích yếu</B></font></td>
        <td width="10%" align="center" style="background-color:#ffd7ae; border-right:1px solid #003451; border-bottom:1px solid #003451"><font class="label_font" color="#000000"><B>Thời gian</B></font></td>
        <td width="12%" align="center" style="background-color:#ffd7ae; border-right:1px solid #003451; border-bottom:1px solid #003451"><font class="label_font" color="#000000"><B>Nơi gửi</B></font></td>
        <td width="12%" align="center" style="background-color:#ffd7ae; border-right:1px solid #003451; border-bottom:1px solid #003451"><font class="label_font" color="#000000"><B>Lĩnh vực</B></font></td>
        <td width="10%" align="center" style="background-color:#ffd7ae; border-right:1px solid #003451; border-bottom:1px solid #003451"><font class="label_font" color="#000000"><B>Tình trạng</B></font></td>
	</tr>
    {if $obj_list}
	{section name=pi loop=$obj_list}
	<tr {if $smarty.section.pi.index is not div by 2} bgcolor="#F2FFEC" {/if} >
		<td align="center">{math x=$vars.curpage-1 y=$vars.numresult z=$smarty.section.pi.index t=1  equation="x*y+z+t" assign=stt}{$stt}</td>
		        
        <td align="center"><a href="?viewDocReceive&doc_id={$obj_list[pi]->doc_id}{$vars.arg}" style="color:#F00; font-weight:bold">Xem</a></td>
                
        <td align="left">
        -&nbsp;{$obj_list[pi]->docCat_id}<br />
        -&nbsp;{$obj_list[pi]->doc_code}<br />
        -&nbsp;	
        {section name=ii loop=$obj_list_important}
        {if $obj_list[pi]->important_id eq $obj_list_important[ii]->important_id}
        		{$obj_list_important[ii]->important_name}
        		{/if}
        {/section}
        </td> 
        
        <td align="left">{$obj_list[pi]->doc_desc}</td>
                
        <td align="center">{$obj_list[pi]->doc_date|date_format:"%d-%m-%Y %H:%M"}</td>
        
        <td align="left">{$obj_list[pi]->doc_unit}</td>
        
        <td align="left">{$obj_list[pi]->docField_id}</td>
        
        <td align="left">
        {if $obj_list[pi]->read_status eq 1}
        	Đã xem<br />
            {$obj_list[pi]->read_time|date_format:"%d-%m-%Y %H:%M"} 
        {else}
        {php}
        	$sql="select * from tbl_recusers where 1=1 and user_id = ".$_SESSION['user_id']." and receive_id in(select receive_id from tbl_receives where doc_id=".$this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->doc_id.")";
            $result = mysql_query($sql);
            if(mysql_num_rows($result)>0):
            $row=mysql_fetch_array($result);
            	if($row['read_status']==1)
            	echo "Đã xem <br />".$row['read_time'];
            endif;
        {/php}
        {/if}
        </td>
	</tr>
	{/section}
    {else}
    <tr>
		<td colspan="8" style="text-align:left">Không có văn bản nào</td>
	</tr>
    {/if}
</table>
</form>