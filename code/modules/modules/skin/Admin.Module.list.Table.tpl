<form method="post" name="frmList" action="?listModule{$vars.arg}" id="frmList">
<div style="padding-bottom: 3px; ">
<table class="adminlist" width="100%" border="0" cellpadding="0" cellspacing="0">
	<tbody>
	<tr>
		<td style="font-family: Arial; color:#930; font-size: 16px; font-weight: bold;" width="31%" nowrap="nowrap">
        	<div align="left"><img src="../images/admin/module.png" align="absmiddle" height="30">&nbsp;Danh sách modules</div>
        </td>			
	  	<td width="69%">
            <div style="text-align: right; padding-right: 20px; padding-bottom: 3px;">
                <div style="padding-bottom: 3px; ">
                    <div style="float:left; padding-bottom: 5px; padding-left: 200px;">
                        <input type="text" name="KeyWord" value='{$vars.KeyWord}' />
                        <input type="submit" name="cmdSearch" value="Lọc" />
                    </div>
                    <div style="float:right; text-align:right; padding-right: 20px;">Có tất cả {$total_num_result} modules </div>
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
        <td align="center"><font color=#000000><B>Tên module</B></font></td>	
		<td width="30%" align="center"><font color=#000000><B>Chú thích</B></font></td>
        <td width="30%" align="center"><font color=#000000><B>Ngày tạo</B></font></td>
        <td width="8%" align="center" ><font color=#000000><B>Sắp xếp</B></font></td>
        <td width="10%" align="center" ><font color=#000000><B>Tình trạng</B></font></td>
		
	</tr>
	{section name=pi loop=$obj_list}
	<tr {if $smarty.section.pi.index is not div by 2} bgcolor="#F2FFEC" {/if} >
		<td align="center">{math x=$vars.curpage-1 y=$vars.numresult z=$smarty.section.pi.index t=1  equation="x*y+z+t" assign=stt}{$stt}</td>
		
        <td align="left">
            {if $per_edit eq 1}
            <a href="?editModule&id={$obj_list[pi]->mod_id}{$vars.arg}" >{$obj_list[pi]->mod_name}</a>
            {else}{$obj_list[pi]->mod_name}{/if}
        </td>
        <td align="left">{$obj_list[pi]->mod_desc}</td>
        <td align="center">{$obj_list[pi]->mod_date|date_format:"%d-%m-%Y"}</td> 
        
        <td width="16" ><div align="center">
        	{if $per_act eq 1}
         	<select name="mod_sort[]" style="width:40px">
            {section name=i loop=$total_num_result}
            	<option value="{$smarty.section.i.index}" {if $smarty.section.i.index eq $obj_list[pi]->mod_sort} selected="selected"{/if}>{$smarty.section.i.index}</option>
            {/section}
            </select>
            <input type="hidden" name="mod_id1[]" value="{$obj_list[pi]->mod_id}">
            {else}-{/if}
        </div></td>
        		        
        <td width="16" ><div align="center">
        	{if $per_act eq 1}
                {if $obj_list[pi]->mod_name eq users or $obj_list[pi]->mod_name eq modules}
                -
                {else}
                    {if $obj_list[pi]->mod_active eq 1}
                        <a href='?listModule&checkUncheck=0&setfield=mod_active&checkUncheckID={$obj_list[pi]->mod_id}{$vars.arg}'>
                        <img src="../images/admin/tick.png" width="10" height="10" border="0"></a>
                        <input type="hidden" name="checkUncheck2" value="0" />
                        <input type="hidden" name="checkUncheckID" value="{$obj_list[pi]->mod_id}" />
                    {else}
                        <a href='?listModule&checkUncheck=1&setfield=mod_active&checkUncheckID={$obj_list[pi]->mod_id}{$vars.arg}'>
                        <img src="../images/admin/publish_x.png" width="10" height="10" border="0"></a>
                        <input type="hidden" name="checkUncheck" value="1" />
                        <input type="hidden" name="checkUncheckID" value="{$obj_list[pi]->mod_id}" />
                    {/if}
                {/if}
            {else}-{/if}
        </div></td>
        
	</tr>
	{/section}
	<tr>
		<td colspan="6" style="text-align:left">
			<div style="float:left; padding-top: 3px;">{$pager_str}</div>
			<div style="float:right">
           		{if $per_act eq 1}
           		<input type="button" name="Submit3" value="Sắp xếp" onClick="document.frmList.submit();">
               	{else}
                <input type="button" name="Submit3" value="Sắp xếp" onClick="document.frmList.submit();" disabled>
                {/if}
			</div>
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