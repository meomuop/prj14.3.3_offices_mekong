<form method="post" name="frmList" action="?listHopdong{$vars.arg}" id="frmList">
{literal}
<script language="javascript">
	function show_hide(){
		if(document.getElementById('seek_div').style.display=='none')
			document.getElementById('seek_div').style.display='';
		else
			document.getElementById('seek_div').style.display='none';
	}
</script>
{/literal}
<div style="padding-bottom: 3px; ">
<table class="adminlist" width="100%" border="0" cellpadding="0" cellspacing="0">
	<tbody>
	<tr>
		<td style="font-family: Arial; color:#930; font-size: 16px; font-weight: bold;" width="50%">
        	<div align="left"><img src="../images/admin/module.png" align="absmiddle" height="30">&nbsp;Danh sách hợp động</div>
        </td>	
        <td style="font-family: Arial; color:#000; font-size: 16px; font-weight: bold;">
        	<div style="text-align: left; padding-bottom: 3px;">
                <a href="javascript: void(0);" onclick="show_hide()">Tìm kiếm hợp đồng</a>
            </div>
        </td>		
	</tr>
    <tr id="seek_div" style="display:none">
        <td colspan="2">
        	<table class="adminlist" width="95%" style="background-color:#e5e5e5">
                <tr>
                    <td align="center">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                          	<td width="15%" align="left" height="20">
                            <font class="label_font" color="#425E89">Số hợp đồng:</font></td>		
                            <td align="left" width="35%">
                            <input type="text" id="hopdong_code" name="hopdong_code"  style="width:200px" value="{$vars.hopdong_code}"/>
                            </td>
                            <td align="center" colspan="4"><input type="submit" name="cmdSearch" value="Tìm kiếm" /></td>
                          </tr>
                        </table>
                    </td>
                </tr>
             </table>
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
		Các loại hợp động
		<select name="order" id = "order" style=" font-size:12px; height:20px;" onchange="reloadPage('{$processurl}');">
		{section name=sli loop=$order_arr}
			<option value="{$smarty.section.sli.index}" {if $smarty.section.sli.index eq $vars.order}selected{/if} >
			{$order_arr[sli]}
			</option>
		{/section}
		</select>
	</font>
</div>					
<table width = "95%" border = "1" align="center" class="adminlist">
	<tr>
		<td colspan="11" style="text-align:left">
			<div style="float:left; padding-top: 3px;">{$pager_str}</div>
        </td>
	</tr>
	<tr  bgcolor="#EEEEEE" >
		<td width="5%" align="center"><font class="label_font" color="#000000"><b>STT</b></font></td>	
        <td width="8%" align="center" ><font class="label_font" color="#000000"><B>Ngày tạo</B></font></td>
        <td width="8%" align="center" ><font class="label_font" color="#000000"><B>Loại</B></font></td>
        <td align="center" ><font class="label_font" color="#000000"><B>Tình trạng</B></font></td>
        <td width="18%" align="center" ><font class="label_font" color="#000000"><B>Số hợp đồng</B></font></td>	
        <td width="18%" align="center" ><font class="label_font" color="#000000"><B>Số chứng thư</B></font></td>
        <td width="8%" align="center" ><font class="label_font" color="#000000"><B>Số ngày báo cáo</B></font></td>
        <td width="8%" align="center" ><font class="label_font" color="#000000"><B>Số ngày hợp đồng</B></font></td>
		<td width="10%" colspan="2" align="center" ><font class="label_font" color="#000000"><B>Chọn</B></font></td>		
		<td width="5%" style="text-align:center">
			<input type="hidden" name="chon" id="chon">
	    	<input type="checkbox" name="chkall" value="0" onclick="docheck(document.frmList.chkall.checked,0);">
        </td>
	</tr>
	{section name=pi loop=$obj_list}
	<tr {if $smarty.section.pi.index is not div by 2} bgcolor="#F2FFEC" {/if} >
		<td align="center">{math x=$vars.curpage-1 y=$vars.numresult z=$smarty.section.pi.index t=1  equation="x*y+z+t" assign=stt}{$stt}</td>
		
        <td align="center">{$obj_list[pi]->hopdong_ngaytao|date_format:"%d-%m-%Y"}</td>
        
        <td align="left">
        {if $obj_list[pi]->hopdong_type eq 1}Hợp đồng
        {elseif $obj_list[pi]->hopdong_type eq 2}Phụ lục
        {else}Tái thẩm
        {/if}
        </td>
        
        <td align="left">
        {if $obj_list[pi]->hopdong_tinhtrang eq 0}Đang thực hiện
        {elseif $obj_list[pi]->hopdong_tinhtrang eq 1}Đã hủy
        {else}Đã hoàn thành
        {/if}
        </td>
        
        <td align="left">{$obj_list[pi]->hopdong_sohd}</td>
        <td align="left">{$obj_list[pi]->hopdong_soct}</td> 
        
        <td align="center">{$obj_list[pi]->hopdong_ngaybaocao} (ngày)</td> 
        <td align="center">{$obj_list[pi]->hopdong_ngaydukien} (ngày)</td> 
        
        <td width="17" valign="middle" align="center">
        	{if $order_id eq 0 or $user_level eq 6 or $user_level eq 7 or $user_level eq 8}
            <a href='?editHopdong&id={$obj_list[pi]->hopdong_id}{$vars.arg}'>
            <img src="../images/admin/b_edit.png" width="16" height="16" border="0" title="Sửa"></a>
            {else}
            <a href='?viewHopdong&id={$obj_list[pi]->hopdong_id}{$vars.arg}'>
            <img src="../images/admin/b_view.png" width="16" height="16" border="0" title="Xem"></a>
            {/if}
        </td>
		<td width="16" valign="middle" align="center">
            <a href='#'  onClick="delItems('{$processurl}', {$obj_list[pi]->hopdong_id});">
            <img src="../images/admin/b_drop.png" width="16" height="16" border="0" title="Xóa"></a>
        </td>	
		<td style="text-align:center; width:40px">
        	<input type="checkbox" name="chkid" value="{$obj_list[pi]->hopdong_id}" onclick="docheckone();">
        </td>
	</tr>
	{/section}
	<tr>
		<td colspan="10" style="text-align:left">
			<div style="float:left; padding-top: 3px;">{$pager_str}</div>
			<div style="float:right">
           		{if $per_act eq 1}
           		<input type="button" name="Submit3" value="Sắp xếp" onClick="document.frmList.submit();">
               	{else}
                <input type="button" name="Submit3" value="Sắp xếp" onClick="document.frmList.submit();" disabled>
                {/if}
                &nbsp;
                {if $per_add eq 1}
				<input type="button" name="Submit2" value="Thêm mới" onClick="document.location='?addHopdong{$vars.arg}'">
                {else}
                <input type="button" name="Submit2" value="Thêm mới" onClick="document.location='?addHopdong{$vars.arg}'" disabled>
                {/if}
			</div>
        </td>
		<td style="text-align:center">
        	{if $per_del eq 1}
        	<input type="button" name="del_Items" id='del_Items' value="Xóa" onClick="delItems('{$processurl}');" style="width:40px;" disabled="disabled">
            {else}
             <input type="button" name="del_Items" id='del_Items' value="Xóa" onClick="delItems('{$processurl}');" style="width:40px;" disabled>
            {/if}
        </td>	
	</tr>
</table>
</form>