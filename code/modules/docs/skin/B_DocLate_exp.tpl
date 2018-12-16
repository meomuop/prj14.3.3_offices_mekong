{if $exptype eq 2}
<form method="post" name="frmList" action="?reportDoc{$vars.arg}" id="frmList">
<div style="float:left; width:1200px; overflow:auto">
<div style="float:left; width:100px; height:10px"></div>
<div style="float:left; width:1100px;">
<table style="width:1100px" border = "1" align="center" class="adminlist">
	<tr>
    	<td colspan="10">
        	<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="left" width="30%"><font class="label_font" color=#000000 style="font-size:18px; font-weight:bold">{$obj_owner[0]->owner_name}</font></td>
                <td align="left"><font class="label_font" color=#000000 style="font-size:18px; font-weight:bold"><B>Báo cáo văn bản quá hạn</B></font> (
                {if $doc_date1 neq ''}
                Từ ngày {$doc_date1|date_format:"%d-%m-%Y"}{/if} {if $doc_date2 neq ''}đến ngày {$doc_date2|date_format:"%d-%m-%Y"}
                {/if}
               	{if $doc_date1 neq '' and $doc_num1 neq ''}&nbsp;|&nbsp;{/if}
                {if $doc_num1 neq ''}Từ số {$doc_num1}{/if} {if $doc_num2 neq ''}đến số {$doc_num2}
                {/if}
                {if ($doc_num1 neq '' or $doc_date1 neq '') and $obj_depart->department_name neq ''}&nbsp;|&nbsp;{/if}
                {if $obj_depart->department_name neq ''}{$obj_depart->department_name}{/if})</td>
              </tr>
            </table>
        </td>
    </tr>
	<tr  bgcolor="#EEEEEE" >
        <td width="7%" align="center" ><font class="label_font" color="#000000"><B>Ngày nhận</B></font></td>
        <td width="7%" align="center" ><font class="label_font" color="#000000"><B>Số đến</B></font></td>	
        <td width="10%" align="center" ><font class="label_font" color="#000000"><B>Cơ quan ban hành</B></font></td>
        <td width="7%" align="center" ><font class="label_font" color="#000000"><B>Số ký hiệu</B></font></td>
        <td width="7%" align="center" ><font class="label_font" color="#000000"><B>Ngày ký</B></font></td>
        <td align="center"><font class="label_font" color="#000000"><B>Trích yếu</B></font></td>
        <td width="7%" align="center" ><font class="label_font" color="#000000"><B>Ngày chỉ đạo</B></font></td>
        <td width="10%" align="center" ><font class="label_font" color="#000000"><B>ĐV Giải quyết</B></font></td>
		<td width="7%" align="center" ><font class="label_font" color="#000000"><B>Thời hạn (Ngày)</B></font></td>
        <td width="7%" align="center" ><font class="label_font" color="#000000"><B>Ngày quá hạn</B></font></td>
	</tr>
	{php}$totalheight = 0;$stt=0;{/php}
	{section name=pi loop=$obj_list}    
    {math a=$obj_list[pi]->doc_desc|format_ununicode:false|string_len equation="a" assign=strlen}
    {php}

    $trheight	 = (round(($this->_tpl_vars['strlen']/60)*15))+4; //tuyet doi khong sua cac file css chua do cao va k/c dong
	if($trheight<32) $trheight=32;
	$addtrheight=0;
	//echo $totalheight.'+='.$trheight.'<br>';
	$totalheight += $trheight;
	if($stt==0)$addheight=85;
	else $addheight=0;
    if($totalheight>777-$addheight):
    $addtrheight=(777-$addheight+$trheight)-$totalheight;
	//echo $addtrheight.'=(715-'.$addheight.'+'.$trheight.')-'.$totalheight.'->'.$this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->doc_num.'<br>';
    $totalheight=$trheight;
	$stt=1;
    endif;
    {/php}
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
    <tr>
    	<td colspan="10" align="center">
        	Tổng số văn bản: {$total_num_result}
        </td>
    </tr>
    <tr>
    	<td colspan="7" align="right" height="100"></td>
    	<td colspan="3" align="center" height="100">
        	Hà Nội, ngày {$smarty.now|date_format:"%d"} tháng {$smarty.now|date_format:"%m"} năm {$smarty.now|date_format:"%Y"}<br />
            Người làm báo cáo<br />
            {$access_object_name}<br /><br /><br /><br /><br /><br />
            {$access_user_fullname}
        </td>
    </tr>
</table>
</div>
</div>
</form>
{else}
<form method="post" name="frmList" action="?reportDoc{$vars.arg}" id="frmList">
<div style="clear:both">&nbsp;</div>
<div style="float:left; width:1200px; overflow:auto">
<div style="float:left; width:100px; height:10px"></div>
<div style="float:left; width:1100px;">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
    	<td colspan="10">
        	<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="left" width="30%"><font class="label_font" color=#000 style="font-size:20px; font-weight:bold">{$obj_owner[0]->owner_name}</font></td>
                <td align="center"><font class="label_font" color=#000 style="font-size:20px; font-weight:bold"><B>Báo cáo văn bản quá hạn</B> ({if $doc_date1 neq ''}Từ ngày {$doc_date1|date_format:"%d-%m-%Y"}{/if} {if $doc_date2 neq ''}đến ngày {$doc_date2|date_format:"%d-%m-%Y"}{/if} {if $doc_num1 neq ''}Từ số {$doc_num1}{/if} {if $doc_num2 neq ''}đến số {$doc_num2}{/if})</font></td>
              </tr>
            </table>
        </td>
    </tr>
	<tr  bgcolor="#EEEEEE" >
       <td width="6%" align="center" style="border-left:1px solid #000; border-top:1px solid #000" ><font class="label_font" color=#000 style="font-size:12px;"><B>Ngày nhận</B></font></td>
        <td width="4%" align="center" style="border-left:1px solid #000; border-top:1px solid #000"><font class="label_font" color=#000 style="font-size:12px;"><B>Số đến</B></font></td>	
        <td width="10%" align="center" style="border-left:1px solid #000; border-top:1px solid #000"><font class="label_font" color=#000 style="font-size:12px;"><B>Cơ quan ban hành</B></font></td>
        <td width="4%" align="center" style="border-left:1px solid #000; border-top:1px solid #000"><font class="label_font" color=#000 style="font-size:12px;"><B>Số ký hiệu</B></font></td>
        <td width="6%" align="center" style="border-left:1px solid #000; border-top:1px solid #000"><font class="label_font" color=#000 style="font-size:12px;"><B>Ngày ký</B></font></td>
        <td align="center" style="border-left:1px solid #000; border-top:1px solid #000"><font class="label_font" color=#000 style="font-size:12px;"><B>Trích yếu</B></font></td>
        <td width="10%" align="center" style="border-left:1px solid #000; border-top:1px solid #000"><font class="label_font" color=#000 style="font-size:12px;"><B>LĐ chỉ đạo</B></font></td>
        <td width="10%" align="center" style="border-left:1px solid #000; border-top:1px solid #000"><font class="label_font" color=#000 style="font-size:12px;"><B>Ngày chỉ đạo</B></font></td>
        <td width="10%" align="center" style="border-left:1px solid #000; border-top:1px solid #000"><font class="label_font" color=#000 style="font-size:12px;"><B>ĐV Giải quyết</B></font></td>
		<td width="10%" align="center" style="border-left:1px solid #000; border-top:1px solid #000"><font class="label_font" color=#000 style="font-size:12px;"><B>Thời hạn (Ngày)</B></font></td>
        <td width="10%" align="center" style="border-left:1px solid #000; border-top:1px solid #000; border-right:1px solid #000"><font class="label_font" color=#000 style="font-size:12px;"><B>Ngày quá hạn</B></font></td>
	</tr>
	{section name=pi loop=$obj_list}
	<tr {if $smarty.section.pi.index is not div by 2} bgcolor="#F2FFEC" {/if} >
        <td align="center" style="border-left:1px solid #000; border-top:1px solid #000">{$obj_list[pi]->doc_recevied|date_format:"%d-%m-%Y"}</td>
        <td align="center" style="border-left:1px solid #000; border-top:1px solid #000">{$obj_list[pi]->doc_num}</td> 
        <td align="left" style="border-left:1px solid #000; border-top:1px solid #000">{$obj_list[pi]->unit_name}</td>
        <td align="center" style="border-left:1px solid #000; border-top:1px solid #000">{$obj_list[pi]->doc_code}</td>
        <td align="center" style="border-left:1px solid #000; border-top:1px solid #000">{$obj_list[pi]->doc_signed|date_format:"%d-%m-%Y"}</td>
        <td align="left" style="border-left:1px solid #000; border-top:1px solid #000">{$obj_list[pi]->doc_desc}</td>
        <td align="left" style="border-left:1px solid #000; border-top:1px solid #000">
        {if $user_level eq 2}
        {php}
            $sql="SELECT recevie_per FROM tbl_docreplys WHERE doc_id = ".$this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->doc_id." AND recevie_per in(SELECT user_id from tbl_users WHERE user_level in(4,5)) ORDER BY docReply_id DESC LIMIT 1";
            $result = mysql_query($sql);
            if(mysql_num_rows($result)>0):
            	$row=mysql_fetch_array($result);
            	$sql_user="SELECT * FROM tbl_users WHERE user_id = ".$row['recevie_per']."";
                $result_user = mysql_query($sql_user);
                if($result_user):
                $row_user=mysql_fetch_array($result_user);
                echo $row_user['user_fullname'];
                endif;
            else:
                $sql="SELECT * FROM tbl_users WHERE user_id = ".$this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->user_id." ORDER BY user_id DESC LIMIT 1";
                $result = mysql_query($sql);
                if($result):
                $row=mysql_fetch_array($result);
                    echo $row['user_fullname'];
                endif;
            endif;
        {/php}
        {else}
        {php}
            if($this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->recevie_per!=0):
            	$sql_user="SELECT * FROM tbl_users WHERE user_id = ".$this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->recevie_per."";
                $result_user = mysql_query($sql_user);
                if($result_user):
                $row_user=mysql_fetch_array($result_user);
                echo $row_user['user_fullname'];
                endif;
            else:
                $sql="SELECT * FROM tbl_users WHERE user_id = ".$this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->user_id." ORDER BY user_id DESC LIMIT 1";
                $result = mysql_query($sql);
                if($result):
                $row=mysql_fetch_array($result);
                    echo $row['user_fullname'];
                endif;
            endif;
        {/php}
        {/if}
        </td>
        <td align="center" style="border-left:1px solid #000; border-top:1px solid #000; border-right:1px solid #000">{$obj_list[pi]->DR_docReply_date|date_format:"%d-%m-%Y"}</td>
        <td align="left" style="border-left:1px solid #000; border-top:1px solid #000; border-right:1px solid #000">
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
		<td align="center" style="border-left:1px solid #000; border-top:1px solid #000; border-right:1px solid #000">{$obj_list[pi]->docReply_numday}</td>
        <td align="center" style="border-left:1px solid #000; border-top:1px solid #000; border-right:1px solid #000">{$obj_list[pi]->docReply_limit_time|date_format:"%d-%m-%Y"}</td>
	</tr>    
	{/section}
    <tr>
    	<td colspan="10" align="center" style="border-left:1px solid #000; border-top:1px solid #000; border-right:1px solid #000">
        	Tổng số văn bản: {$total_num_result}
        </td>
    </tr>
    <tr>
    	<td colspan="7" align="right" height="100" style="border-left:1px solid #000; border-top:1px solid #000"></td>
    	<td colspan="3" align="center" height="100" style="border-left:1px solid #000; border-top:1px solid #000; border-right:1px solid #000">
        	Hà Nội, ngày {$smarty.now|date_format:"%d"} tháng {$smarty.now|date_format:"%m"} năm {$smarty.now|date_format:"%Y"}<br />
            Người làm báo cáo<br />
            {$access_object_name}<br /><br /><br /><br /><br /><br />
            {$access_user_fullname}
        </td>
    </tr>
</table>
</div>
</div>
</form>
{/if}