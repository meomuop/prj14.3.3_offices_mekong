<form method="post" name="frmList" action="?listNgansach{$vars.arg}" id="frmList">
<div style="padding-bottom: 3px; ">
<table class="adminlist" width="100%" border="0" cellpadding="0" cellspacing="0">
	<tbody>
	<tr>
		<td style="font-family: Arial; color:#930; font-size: 16px; font-weight: bold;" width="30%">
        	<div align="left"><img src="../images/admin/module.png" align="absmiddle" height="30">&nbsp;Danh sách nguồn ngân sách</div>
        </td>			
	  	<td>
        	<div style="text-align: right; padding-bottom: 3px;">
                <div style="padding-bottom: 3px; ">
                    <div style="float:left;">
                        <input type="text" name="KeyWord" value='{$vars.KeyWord}' />
                        <input type="submit" name="cmdSearch" value="Lọc" />
                    </div>
                    <div style="float:right; padding-top:3px; text-align:right; padding-right: 20px;">Có tất cả {$total_num_result} nguồn ngân sách</div>
                </div>
            </div>
        </td>
	</tr>
	</tbody>
</table>
</div>
<div style="clear:both">&nbsp;</div>
<table width = "95%" border = "1" align="center" class="adminlist">
	<tr  bgcolor="#EEEEEE" >
		<td width="5%" align="center"><font color=#000000><b>STT</b></font></td>		
		<td align="center"><font color=#000000><B>Tên nguồn ngân sách</B></font></td>
        <td width="25%" align="center" ><font color=#000000><B>Mô tả</B></font></td>
        <td width="10%" align="center" ><font color=#000000><B>Kiểu</B></font></td>
        <td width="8%" align="center" ><font color=#000000><B>Ngày nhập</B></font></td>
        <td width="8%" align="center" ><font color=#000000><B>Sắp xếp</B></font></td>
        <td width="8%" align="center" ><font color=#000000><B>Tình trạng</B></font></td>
		<td width="10%" colspan="2" align="center" ><font color=#000000><B>Chọn</B></font></td>		
		<td width="5%" style="text-align:center">
			<input type="hidden" name="chon" id="chon">
	    	<input type="checkbox" name="chkall" value="0" onclick="docheck(document.frmList.chkall.checked,0);">
        </td>
	</tr>
	{section name=pi loop=$obj_list}
	<tr {if $smarty.section.pi.index is not div by 2} bgcolor="#F2FFEC" {/if} >
		<td align="center">{math x=$vars.curpage-1 y=$vars.numresult z=$smarty.section.pi.index t=1  equation="x*y+z+t" assign=stt}{$stt}</td>
		
        <td align="left">
        	{if $per_edit eq 1}
            <a href="?editNgansach&id={$obj_list[pi]->ngansach_id}{$vars.arg}" >{$obj_list[pi]->ngansach_name}</a>
            {else}{$obj_list[pi]->ngansach_name}{/if}
        </td>
        
        <td align="left">{$obj_list[pi]->ngansach_desc|replace:"<p>":""|str_string_cut:100:1}</td>
        
        <td align="center">
        {if $obj_list[pi]->ngansach_type eq 1}Thẩm định giá
        {elseif $obj_list[pi]->ngansach_type eq 2}TĐG + BĐG
        {else}Bán đấu giá
        {/if}
        </td>
        
        <td align="center">{$obj_list[pi]->ngansach_date|date_format:"%d-%m-%Y"}</td>
		        
        <td width="16" ><div align="center">
        	{if $per_act eq 1}
         	<select name="ngansach_sort[]" style="width:40px">
            {section name=i loop=$total_num_result}
            	<option value="{$smarty.section.i.index}" {if $smarty.section.i.index eq $obj_list[pi]->ngansach_sort} selected="selected"{/if}>{$smarty.section.i.index}</option>
            {/section}
            </select>
            <input type="hidden" name="ngansach_id1[]" value="{$obj_list[pi]->ngansach_id}">
            {else}-{/if}
        </div></td>
        
        <td width="16" ><div align="center">
        	{if $per_act eq 1}
            {if $obj_list[pi]->ngansach_active eq 1}
                <a href='?listNgansach&checkUncheck=2&setfield=ngansach_active&checkUncheckID={$obj_list[pi]->ngansach_id}{$vars.arg}'>
                <img src="../images/admin/tick.png" width="10" height="10" border="0"></a>
            {else}
                <a href='?listNgansach&checkUncheck=1&setfield=ngansach_active&checkUncheckID={$obj_list[pi]->ngansach_id}{$vars.arg}'>
                <img src="../images/admin/publish_x.png" width="10" height="10" border="0"></a>
            {/if}
            {else}-{/if}
        </div></td>
        
        <td width="17" valign="middle" align="center">
        	{if $per_edit eq 1}
            <a href='?editNgansach&id={$obj_list[pi]->ngansach_id}{$vars.arg}'>
            <img src="../images/admin/b_edit.png" width="16" height="16" border="0" title="Sửa"></a>
            {else}-{/if}
        </td>
		<td width="16" valign="middle" align="center">
        	{if $per_del eq 1}
            <a href='#'  onClick="delItems('{$processurl}', {$obj_list[pi]->ngansach_id});">
            <img src="../images/admin/b_drop.png" width="16" height="16" border="0" title="Xóa"></a>
            {else}-{/if}
        </td>	
		<td style="text-align:center">
        	<input type="checkbox" name="chkid" value="{$obj_list[pi]->ngansach_id}" onclick="docheckone();">
        </td>
	</tr>
	{/section}
	<tr>
		<td colspan="9" style="text-align:left">
			<div style="float:left; padding-top: 3px;">{$pager_str}</div>
			<div style="float:right">
           		{if $per_act eq 1}
           		<input type="button" name="Submit3" value="Sắp xếp" onClick="document.frmList.submit();">
               	{else}
                <input type="button" name="Submit3" value="Sắp xếp" onClick="document.frmList.submit();" disabled>
                {/if}
                &nbsp;
                {if $per_add eq 1}
				<input type="button" name="Submit2" value="Thêm mới" onClick="document.location='?addNgansach{$vars.arg}'">
                {else}
                <input type="button" name="Submit2" value="Thêm mới" onClick="document.location='?addNgansach{$vars.arg}'" disabled>
                {/if}
			</div>
        </td>
		<td style="text-align:center">
        	{if $per_del eq 1}
        	<input type="button" name="del_Items" id='del_Items' value="Xóa" onClick="delItems('{$processurl}');" style="width:40px;">
            {else}
             <input type="button" name="del_Items" id='del_Items' value="Xóa" onClick="delItems('{$processurl}');" style="width:40px;" disabled>
            {/if}
        </td>	
	</tr>
</table>
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