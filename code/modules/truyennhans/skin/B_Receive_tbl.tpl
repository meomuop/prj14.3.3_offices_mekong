<form method="post" name="frmList" action="?listDocReply{$vars.arg}" id="frmList">
<div style="padding-bottom: 3px; ">
<table class="adminlist" width="100%" border="0" cellpadding="0" cellspacing="0">
	<tbody>
	<tr>
		<td style="font-family: Arial; color:#930; font-size: 16px; font-weight: bold;" width="30%">
        	<div align="left"><img src="../images/admin/module.png" align="absmiddle" height="30">&nbsp;Danh sách ý kiến</div>
        </td>	
        <td>
        	<div style="float:right; padding-top:3px; text-align:right; padding-right: 20px;">Có tất cả {$total_num_result} ý kiến</div>
        </td>		
	</tr>
	</tbody>
</table>
</div>
<div style="clear:both">&nbsp;</div>
<table width = "95%" border = "1" align="center" class="adminlist">
	<tr  bgcolor="#EEEEEE" >
		<td width="5%" align="center"><font class="label_font" color="#000000"><b>STT</b></font></td>	
        <td width="10%" align="center" ><font class="label_font" color="#000000"><B>Ngày nhập</B></font></td>
        <td width="15%" align="center" ><font class="label_font" color="#000000"><B>Chuyển từ</B></font></td>
        <td align="center"><font class="label_font" color="#000000"><B>Nội dung</B></font></td>
        <td width="15%" align="center" ><font class="label_font" color="#000000"><B>Chuyển đến</B></font></td>
        <td width="10%" align="center" ><font class="label_font" color="#000000"><B>Hạn xử lý</B></font></td>
		<td width="10%" colspan="2" align="center" ><font class="label_font" color="#000000"><B>Chọn</B></font></td>		
		<td width="5%" style="text-align:center">
			<input type="hidden" name="chon" id="chon">
	    	<input type="checkbox" name="chkall" value="0" onclick="docheck(document.frmList.chkall.checked,0);">
        </td>
	</tr>
	{section name=pi loop=$obj_list}
	<tr {if $smarty.section.pi.index is not div by 2} bgcolor="#F2FFEC" {/if} >
		<td align="center">{math x=$vars.curpage-1 y=$vars.numresult z=$smarty.section.pi.index t=1  equation="x*y+z+t" assign=stt}{$stt}</td>
		
        <td align="center">{$obj_list[pi]->docReply_date|date_format:"%d-%m-%Y"}</td>
        
        <td align="left">
        	{section name=qi loop=$obj_list_user}
            {if $obj_list_user[qi]->user_id eq $obj_list[pi]->user_id}{$obj_list_user[qi]->user_fullname}{/if}
            {/section}
        </td>
                
        <td align="left">
        	{if $access_user_id eq $obj_list[pi]->user_id}
            <a href="?editDocReply&id={$obj_list[pi]->docReply_id}{$vars.arg}" >{$obj_list[pi]->docReply_desc}</a>
            {else}{$obj_list[pi]->docReply_desc}{/if}
        </td>
        
        <td align="left">
        {if $obj_list[pi]->main_department neq 0}
            {section name=di loop=$obj_list_department}
            {if $obj_list_department[di]->department_id eq $obj_list[pi]->main_department}{$obj_list_department[di]->department_name}{/if}
            {/section}
        {elseif $obj_list[pi]->recevie_per neq 0}
        	{section name=di loop=$obj_list_user}
            {if $obj_list_user[di]->user_id eq $obj_list[pi]->recevie_per}{$obj_list_user[di]->user_fullname}{/if}
            {/section}
        {else}
        	{section name=di loop=$obj_list_user}
            {if $obj_list_user[di]->user_id eq $obj_list[pi]->process_per}{$obj_list_user[di]->user_fullname}{/if}
            {/section}
        {/if}
        </td>
        
        <td align="center">{$obj_list[pi]->docReply_limit_time|date_format:"%d-%m-%Y"}</td>
                		                        
        <td width="17" valign="middle" align="center">
        	{if $access_user_id eq $obj_list[pi]->user_id}
            <a href='?editDocReply&id={$obj_list[pi]->docReply_id}{$vars.arg}'>
            <img src="../images/admin/b_edit.png" width="16" height="16" border="0" title="Sửa"></a>
            {else}-{/if}
        </td>
		<td width="16" valign="middle" align="center">
        	{if $access_user_id eq $obj_list[pi]->user_id}
            <a href='#'  onClick="delItems('{$processurl}', {$obj_list[pi]->docReply_id});">
            <img src="../images/admin/b_drop.png" width="16" height="16" border="0" title="Xóa"></a>
            {else}-{/if}
        </td>	
		<td style="text-align:center; width:40px">
        	<input type="checkbox" name="chkid" value="{$obj_list[pi]->docReply_id}" onclick="docheckone();">
        </td>
	</tr>
	{/section}
	<tr>
		<td colspan="8" style="text-align:left">
			<div style="float:left; padding-top: 3px;">{$pager_str}</div>
            <div style="float:right">
            	{if $view eq 1}
                <input type="button" name="Submit2" value="Thêm mới" onClick="document.location='?addDocReply{$vars.arg}'" disabled>
                {else}
                    {if $per_add eq 1}
                    <input type="button" name="Submit2" value="Thêm mới" onClick="document.location='?addDocReply{$vars.arg}'">
                    {else}
                    <input type="button" name="Submit2" value="Thêm mới" onClick="document.location='?addDocReply{$vars.arg}'" disabled>
                    {/if}
                {/if}
			</div>
        </td>
		<td style="text-align:center">
        	{if $view eq 1}
            <input type="button" name="del_Items" id='del_Items' value="Xóa" onClick="delItems('{$processurl}');" style="width:40px;" disabled>
            {else}
                {if $access_user_id eq $obj_list[pi]->user_id}
                <input type="button" name="del_Items" id='del_Items' value="Xóa" onClick="delItems('{$processurl}');" style="width:40px;">
                {else}
                 <input type="button" name="del_Items" id='del_Items' value="Xóa" onClick="delItems('{$processurl}');" style="width:40px;" disabled>
                {/if}
            {/if}
        </td>	
	</tr>
</table>
<div style="clear:both"><doc src='../images/admin/spacer.gif' height="10px" /></div>
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