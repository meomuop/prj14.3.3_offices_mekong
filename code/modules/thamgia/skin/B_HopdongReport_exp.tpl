{include file = '_common_header.tpl'}
{if $hopdong_tinhtrang eq 1}
<center>
<table style="width:750px" border="0" cellspacing="0" cellpadding="0">
    <tr height="25"><td align="center" style="font-size:16px"><b>CÔNG TY CP THẨM ĐỊNH GIÁ HÀ NỘI</b></td></tr>
    <tr height="25"><td align="center"><b>BẢNG BÁO CÁO<br />(CÔNG VĂN, GIẤY ĐỀ NGHỊ THẨM ĐỊNH)</b></td></tr>
    <tr height="25"><td align="center"><i>Thời gian: Từ ngày {$tu_ngay|date_format:"%d/%m%Y"} đến ngày {$den_ngay|date_format:"%d/%m%Y"}</i></td></tr>
    {if $user_level eq 6}
    {if $user_id}
    <tr height="20">
        <td align="left">Họ tên: 
            {section name=di loop=$obj_list_user}
            {if $obj_list_user[di]->user_id eq $user_id}{$obj_list_user[di]->user_fullname}{/if}
            {/section}
        </td>
    </tr>
    <tr height="20">
        <td align="left">Chức vụ: 
            {section name=oi loop=$obj_list_object}
            {if $obj_list_object[oi]->object_id eq $user_info.object_id}{$obj_list_object[oi]->object_name}{/if}
            {/section}
        </td>
    </tr>
    <tr height="20">
        <td align="left">Hiện công tác tại: 
            {section name=oi loop=$obj_list_department}
            {if $obj_list_department[oi]->department_id eq $user_info.department_id}{$obj_list_department[oi]->department_name}{/if}
            {/section}
        </td>
    </tr>
    {else}
    <tr height="20">
        <td align="left"><b>Đơn vị tổng hợp: </b>
            {section name=oi loop=$obj_list_department}
            {if $obj_list_department[oi]->department_id eq $access_department_id}{$obj_list_department[oi]->department_name}{/if}
            {/section}
        </td>
    </tr>
    {/if}
    {else}
    <tr height="20">
        <td align="left">Họ tên: 
            {section name=di loop=$obj_list_user}
            {if $obj_list_user[di]->user_id eq $access_user_id}{$obj_list_user[di]->user_fullname}{/if}
            {/section}
        </td>
    </tr>
    <tr height="20">
        <td align="left">Chức vụ: 
            {section name=oi loop=$obj_list_object}
            {if $obj_list_object[oi]->object_id eq $access_object_id}{$obj_list_object[oi]->object_name}{/if}
            {/section}
        </td>
    </tr>
    <tr height="20">
        <td align="left">Hiện công tác tại: 
            {section name=oi loop=$obj_list_department}
            {if $obj_list_department[oi]->department_id eq $access_department_id}{$obj_list_department[oi]->department_name}{/if}
            {/section}
        </td>
    </tr>
    {/if}
    <tr height="20">
        <td align="left" style="border-bottom:1px dotted #CCC">
        	<b>Mục đích báo cáo:</b>
        </td>
    </tr>
    <tr height="20"><td style="border-bottom:1px dotted #CCC"></td></tr>
    <tr height="10"><td></td></tr>
</table>
<table style="width:750px" border = "1" align="center" class="adminlist">
	<tr>
        <td colspan="8">
        <font class="label_font" color="#000000"><b>1. Công văn, giấy đề nghị của tổ chức, cá nhân chưa ký hợp đồng</b></font>
        </td>
    </tr>
	<tr bgcolor="#EEEEEE" >
       <td width="20" align="center" rowspan="2">STT</td>
       <td align="center" colspan="6">Công văn, giấy đề nghị thẩm định</td>	
       <td width="90" align="center" rowspan="2">Theo dõi, đôn đốc ký hợp đồng</td>
	</tr>
    <tr height="25" bgcolor="#EEEEEE" >
      <td width="40" align="center">Ngày nhận</td>
      <td width="40" align="center">Ngày VB</td>
      <td width="60" align="center">Số, ký hiệu</td>
      <td align="center">Tổ chức cá nhân đề nghị thẩm định</td>
      <td width="150" align="center">Loại TS để nghị thẩm định</td>
      <td width="80" align="center">Tổng giá đề nghị</td>
    </tr>
	{section name=pi loop=$obj_list}
	<tr {if $smarty.section.pi.index is not div by 2} bgcolor="#F2FFEC" {/if} >
        <td align="center">{math z=$smarty.section.pi.index t=1  equation="z+t" assign=stt}{$stt}</td>
        <td align="center">{$obj_list[pi]->docreply_date|date_format:"%d/%m/%Y"}</td> 
        <td align="left">{$obj_list[pi]->doc_signed|date_format:"%d/%m/%Y"}</td>
        <td align="left">{$obj_list[pi]->doc_code}</td>
        <td align="left">{$obj_list[pi]->hopdong_khachhang}</td>
        <td align="left"><div style="float:left; width:40px">{$obj_list[pi]->taisan_standfor}</div><div style="float:left">- {$obj_list[pi]->loaitaisan_name}</div></td>
        <td align="right">{$obj_list[pi]->hopdong_gtts_dn_td|price_format}</td>
		<td align="right">&nbsp;</td>
    </tr>
	{/section}
    <tr height="30"><td colspan="7" align="right">Tổng số:</td><td align="right">{$total_num}</td></tr>
    <tr height="30"><td colspan="8"></td></tr>
    
    <!--ngancach-->
    
    <tr>
        <td colspan="8">
        <font class="label_font" color="#000000"><b>1. Công văn, giấy đề nghị của tổ chức, cá nhân tạm dừng hoặc không ký hợp đồng</b></font>
        </td>
    </tr>
    <tr bgcolor="#EEEEEE" >
       <td width="20" align="center" rowspan="2">STT</td>
       <td align="center" colspan="6">Công văn, giấy đề nghị thẩm định</td>	
       <td width="90" align="center" rowspan="2">Theo dõi, đôn đốc ký hợp đồng</td>
	</tr>
    <tr height="25" bgcolor="#EEEEEE" >
      <td width="40" align="center">Ngày nhận</td>
      <td width="40" align="center">Ngày VB</td>
      <td width="60" align="center">Số, ký hiệu</td>
      <td align="center">Tổ chức cá nhân đề nghị thẩm định</td>
      <td width="150" align="center">Loại TS để nghị thẩm định</td>
      <td width="80" align="center">Tổng giá đề nghị</td>
    </tr>
    {section name=phi loop=$obj_list_huy}
	<tr {if $smarty.section.pi.index is not div by 2} bgcolor="#F2FFEC" {/if} >
        <td align="center">{math z=$smarty.section.phi.index t=1  equation="z+t" assign=stt}{$stt}</td>
        <td align="center">{$obj_list_huy[phi]->docreply_date|date_format:"%d/%m/%Y"}</td> 
        <td align="left">{$obj_list_huy[phi]->doc_signed|date_format:"%d/%m/%Y"}</td>
        <td align="left">{$obj_list_huy[phi]->doc_code}</td>
        <td align="left">{$obj_list_huy[phi]->hopdong_khachhang}</td>
        <td align="left"><div style="float:left; width:40px">{$obj_list_huy[phi]->taisan_standfor}</div><div style="float:left">- {$obj_list_huy[phi]->loaitaisan_name}</div></td>
        <td align="right">{$obj_list_huy[phi]->hopdong_gtts_dn_td|price_format}</td>
        <td align="left">&nbsp;</td>
    </tr>
	{/section}
    <tr height="30"><td colspan="7" align="right">Tổng số:</td><td align="right">{$total_num_huy}</td></tr>
    <tr height="30"><td colspan="8"></td></tr>
    <tr>
    	<td colspan="5" align="right" height="100"></td>
    	<td colspan="3" align="center" height="100">
        	Hà Nội, ngày {$smarty.now|date_format:"%d"} tháng {$smarty.now|date_format:"%m"} năm {$smarty.now|date_format:"%Y"}<br />
            Người làm báo cáo<br />
            {$access_object_name}<br /><br /><br /><br /><br /><br />
            {$access_user_fullname}
        </td>
    </tr>
</table>
</center>
<!---------------------------------dang thuc hien------------------------------------->
{elseif $hopdong_tinhtrang eq 0}
<center>
<table style="width:750px" border="0" cellspacing="0" cellpadding="0">
    <tr height="25"><td align="center" style="font-size:16px"><b>CÔNG TY CP THẨM ĐỊNH GIÁ HÀ NỘI</b></td></tr>
    <tr height="25">
        <td align="center"><b>BẢNG BÁO CÁO<br />(TÌNH HÌNH HỢP ĐỒNG ĐANG TIẾN HÀNH THẨM ĐỊNH)</b></td>
    </tr>
    <tr height="25">
        <td align="center">
            <i>Thời gian: Từ ngày {$tu_ngay|date_format:"%d/%m%Y"} đến ngày {$den_ngay|date_format:"%d/%m%Y"}</i>
        </td>
    </tr>
    {if $user_level eq 6}
    {if $user_id}
    <tr height="20">
        <td align="left">Họ tên: 
            {section name=di loop=$obj_list_user}
            {if $obj_list_user[di]->user_id eq $user_id}{$obj_list_user[di]->user_fullname}{/if}
            {/section}
        </td>
    </tr>
    <tr height="20">
        <td align="left">Chức vụ: 
            {section name=oi loop=$obj_list_object}
            {if $obj_list_object[oi]->object_id eq $user_info.object_id}{$obj_list_object[oi]->object_name}{/if}
            {/section}
        </td>
    </tr>
    <tr height="20">
        <td align="left">Hiện công tác tại: 
            {section name=oi loop=$obj_list_department}
            {if $obj_list_department[oi]->department_id eq $user_info.department_id}{$obj_list_department[oi]->department_name}{/if}
            {/section}
        </td>
    </tr>
    {else}
    <tr height="20">
        <td align="left"><b>Đơn vị tổng hợp: </b>
            {section name=oi loop=$obj_list_department}
            {if $obj_list_department[oi]->department_id eq $access_department_id}{$obj_list_department[oi]->department_name}{/if}
            {/section}
        </td>
    </tr>
    {/if}
    {else}
    <tr height="20">
        <td align="left">Họ tên: 
            {section name=di loop=$obj_list_user}
            {if $obj_list_user[di]->user_id eq $access_user_id}{$obj_list_user[di]->user_fullname}{/if}
            {/section}
        </td>
    </tr>
    <tr height="20">
        <td align="left">Chức vụ: 
            {section name=oi loop=$obj_list_object}
            {if $obj_list_object[oi]->object_id eq $access_object_id}{$obj_list_object[oi]->object_name}{/if}
            {/section}
        </td>
    </tr>
    <tr height="20">
        <td align="left">Hiện công tác tại: 
            {section name=oi loop=$obj_list_department}
            {if $obj_list_department[oi]->department_id eq $access_department_id}{$obj_list_department[oi]->department_name}{/if}
            {/section}
        </td>
    </tr>
    {/if}
    <tr height="20">
        <td align="left" style="border-bottom:1px dotted #CCC">
        	<b>Mục đích báo cáo:</b>
        </td>
    </tr>
    <tr height="20"><td style="border-bottom:1px dotted #CCC"></td></tr>
    <tr height="10"><td></td></tr>
</table>
<table style="width:750px" border = "1" align="center" class="adminlist">
	<tr bgcolor="#EEEEEE" >
       <td width="20" align="center" rowspan="2">STT</td>
       <td width="120" align="center" rowspan="2">Tên tổ chức/cá nhân đề nghị thẩm định</td>
       <td width="120" align="center" rowspan="2">Loại tài sản đề nghị thẩm định</td>
       <td align="center" colspan="4">Công văn, giấy đề nghị</td>
       <td align="center" colspan="2">Hợp đồng</td>	
       <td width="90" align="center" rowspan="2">Ghi chú</td>
	</tr>
    <tr height="25" bgcolor="#EEEEEE" >
      <td width="40" align="center">Ngày nhận</td>
      <td width="40" align="center">Ngày VB</td>
      <td width="60" align="center">Số, ký hiệu</td>
      <td width="80" align="center">Tổng giá đề nghị</td>
      <td width="40" align="center">Ngày tháng</td>
      <td width="60" align="center">Số hợp đồng</td>
    </tr>
	{section name=pi loop=$obj_list}
	<tr {if $smarty.section.pi.index is not div by 2} bgcolor="#F2FFEC" {/if} >
        <td align="center">{math z=$smarty.section.pi.index t=1  equation="z+t" assign=stt}{$stt}</td>
        <td align="left">{$obj_list[pi]->hopdong_khachhang}</td>
        <td align="left"><div style="float:left; width:40px">{$obj_list[pi]->taisan_standfor}</div><div style="float:left">- {$obj_list[pi]->loaitaisan_name}</div></td>
        <td align="center">{$obj_list[pi]->docreply_date|date_format:"%d/%m/%Y"}</td> 
        <td align="left">{$obj_list[pi]->doc_signed|date_format:"%d/%m/%Y"}</td>
        <td align="left">{$obj_list[pi]->doc_code}</td>
        <td align="right">{$obj_list[pi]->hopdong_gtts_dn_td}</td>
        <td align="left">{$obj_list[pi]->hopdong_ngaycap_sohd|date_format:"%d/%m/%Y"}</td>
        <td align="left">{$obj_list[pi]->hopdong_sohd}</td>
        <td align="right">&nbsp;</td>
    </tr>
	{/section}
    <tr height="30"><td colspan="9" align="right">Tổng số:</td><td align="right">{$total_num}</td></tr>
    <tr height="30"><td colspan="10"></td></tr>
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
</center>
<!---------------------------------hoan thanh------------------------------------->
{else}
<center>
<table style="width:1000px" border="0" cellspacing="0" cellpadding="0">
    <tr height="25"><td align="center" style="font-size:16px"><b>CÔNG TY CP THẨM ĐỊNH GIÁ HÀ NỘI</b></td></tr>
    <tr height="25">
        <td align="center"><b>BẢNG BÁO CÁO<br />(KẾT QUẢ CÔNG VIỆC THẨM ĐỊNH ĐÃ THỰC HIỆN)</b></td>
    </tr>
    <tr height="25">
        <td align="center">
            <i>Thời gian: Từ ngày {$tu_ngay|date_format:"%d/%m%Y"} đến ngày {$den_ngay|date_format:"%d/%m%Y"}</i>
        </td>
    </tr>
    {if $user_level eq 6}
    {if $user_id}
    <tr height="20">
        <td align="left">Họ tên: 
            {section name=di loop=$obj_list_user}
            {if $obj_list_user[di]->user_id eq $user_id}{$obj_list_user[di]->user_fullname}{/if}
            {/section}
        </td>
    </tr>
    <tr height="20">
        <td align="left">Chức vụ: 
            {section name=oi loop=$obj_list_object}
            {if $obj_list_object[oi]->object_id eq $user_info.object_id}{$obj_list_object[oi]->object_name}{/if}
            {/section}
        </td>
    </tr>
    <tr height="20">
        <td align="left">Hiện công tác tại: 
            {section name=oi loop=$obj_list_department}
            {if $obj_list_department[oi]->department_id eq $user_info.department_id}{$obj_list_department[oi]->department_name}{/if}
            {/section}
        </td>
    </tr>
    {else}
    <tr height="20">
        <td align="left"><b>Đơn vị tổng hợp: </b>
            {section name=oi loop=$obj_list_department}
            {if $obj_list_department[oi]->department_id eq $access_department_id}{$obj_list_department[oi]->department_name}{/if}
            {/section}
        </td>
    </tr>
    {/if}
    {else}
    <tr height="20">
        <td align="left">Họ tên: 
            {section name=di loop=$obj_list_user}
            {if $obj_list_user[di]->user_id eq $access_user_id}{$obj_list_user[di]->user_fullname}{/if}
            {/section}
        </td>
    </tr>
    <tr height="20">
        <td align="left">Chức vụ: 
            {section name=oi loop=$obj_list_object}
            {if $obj_list_object[oi]->object_id eq $access_object_id}{$obj_list_object[oi]->object_name}{/if}
            {/section}
        </td>
    </tr>
    <tr height="20">
        <td align="left">Hiện công tác tại: 
            {section name=oi loop=$obj_list_department}
            {if $obj_list_department[oi]->department_id eq $access_department_id}{$obj_list_department[oi]->department_name}{/if}
            {/section}
        </td>
    </tr>
    {/if}
    <tr height="20">
        <td align="left" style="border-bottom:1px dotted #CCC">
        	<b>Mục đích báo cáo:</b>
        </td>
    </tr>
    <tr height="20"><td style="border-bottom:1px dotted #CCC"></td></tr>
    <tr height="10"><td></td></tr>
</table>
<table style="width:1000px" border = "1" align="center" class="adminlist">
	<tr bgcolor="#EEEEEE" >
       <td width="20" align="center" rowspan="2">STT</td>
       <td width="120" align="center" rowspan="2">Tên tổ chức/cá nhân đề nghị thẩm định</td>
       <td width="120" align="center" rowspan="2">Loại tài sản đề nghị thẩm định</td>
       <td align="center" colspan="4">Công văn, giấy đề nghị</td>
       <td align="center" colspan="2">Hợp đồng</td>
       <td align="center" colspan="3">Kết quả thẩm định</td>
       <td width="80" align="center" rowspan="2">Chênh lệch</td>
       <td width="90" align="center" rowspan="2">Ghi chú</td>
	</tr>
    <tr height="25" bgcolor="#EEEEEE" >
      <td width="40" align="center">Ngày nhận</td>
      <td width="40" align="center">Ngày VB</td>
      <td width="60" align="center">Số, ký hiệu</td>
      <td width="80" align="center">Tổng giá đề nghị thẩm định</td>
      <td width="40" align="center">Ngày tháng</td>
      <td width="60" align="center">Số hợp đồng</td>
      <td width="40" align="center">Ngày tháng</td>
      <td width="60" align="center">Số chứng thư</td>
      <td width="80" align="center">Tổng giá thẩm định thực tế</td>
    </tr>
	{section name=pi loop=$obj_list}
	<tr {if $smarty.section.pi.index is not div by 2} bgcolor="#F2FFEC" {/if} >
        <td align="center">{math z=$smarty.section.pi.index t=1  equation="z+t" assign=stt}{$stt}</td>
        <td align="left">{$obj_list[pi]->hopdong_khachhang}</td>
        <td align="left"><div style="float:left; width:40px">{$obj_list[pi]->taisan_standfor}</div><div style="float:left">- {$obj_list[pi]->loaitaisan_name}</div></td>
        <td align="center">{$obj_list[pi]->docreply_date|date_format:"%d/%m/%Y"}</td> 
        <td align="left">{$obj_list[pi]->doc_signed|date_format:"%d/%m/%Y"}</td>
        <td align="left">{$obj_list[pi]->doc_code}</td>
        <td align="right">{$obj_list[pi]->hopdong_gtts_dn_td}</td>
        <td align="left">{$obj_list[pi]->hopdong_ngaycap_sohd|date_format:"%d/%m/%Y"}</td>
        <td align="left">{$obj_list[pi]->hopdong_sohd}</td>
        <td align="left">{$obj_list[pi]->hopdong_ngaycap_soct|date_format:"%d/%m/%Y"}</td>
        <td align="left">{$obj_list[pi]->hopdong_soct}</td>
        <td align="right">{$obj_list[pi]->gt_ts_tham_dinh_thuc}</td>
        <td align="right">
        {if $obj_list[pi]->hopdong_gtts_dn_td neq '' and $obj_list[pi]->gt_ts_tham_dinh_thuc neq ''}
        {math a=$obj_list[pi]->hopdong_gtts_dn_td b=$obj_list[pi]->gt_ts_tham_dinh_thuc equation="a-b" assign=gt_td}
        {$gt_td}
        {/if}
        </td>
        <td align="right">&nbsp;</td>
    </tr>
	{/section}
    <tr height="30"><td colspan="13" align="right">Tổng số:</td><td align="right">{$total_num}</td></tr>
    <tr height="30"><td colspan="14"></td></tr>
    <tr>
    	<td colspan="11" align="right" height="100"></td>
    	<td colspan="3" align="center" height="100">
        	Hà Nội, ngày {$smarty.now|date_format:"%d"} tháng {$smarty.now|date_format:"%m"} năm {$smarty.now|date_format:"%Y"}<br />
            Người làm báo cáo<br />
            {$access_object_name}<br /><br /><br /><br /><br /><br />
            {$access_user_fullname}
        </td>
    </tr>
</table>
</center>
{/if}