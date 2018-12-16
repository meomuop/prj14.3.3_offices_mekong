<div id="doc_report_content_insign">
    <!------------------------------------KET QUA KET XUAT---------------------------------------------->
    <div style="float:left; width:1058px; height:385px; overflow-y:auto; margin:2px; font-size:12px">
    <div style="float:left; width:1036px; height:375px" id="div_cont_print">
    {literal}
	<style type="text/css">
    .tbl_cont{
    float:left; line-height:25px; border-right:1px solid #99bbe8; border-bottom:1px solid #99bbe8; background:#FFF
    }
    .tbl_cont td{
        border-left:1px solid #99bbe8; border-top:1px solid #99bbe8; font-size:12px; padding:2px; line-height:15px
    }
    </style>
    {/literal}
    <table style="width:1040px" border="0" cellpadding="0" cellspacing="0" align="center" class="tbl_cont">
        <tr>
            <td colspan="7">
                <table width="100%" border="0" cellspacing="0" cellpadding="0" style="border:none">
                  <tr height="30">
                    <td align="center" width="30%" style="border:none">
                    <font color=#000000 style="font-size:16px; font-weight:bold">
                    {$obj_owner[0]->owner_name}</font></td>
                  </tr>
                  <tr height="30">
                    <td align="center" style="border:none">
                    <font color=#000000 style="font-size:16px; font-weight:bold">
                    <B>BÁO CÁO VĂN BẢN DỰ THẢO</B></font></td>
                  </tr>
                  <tr>
                    <td align="left" style="line-height:20px; font-weight:bold;border:none">
                    {if $tungay neq ''}- Từ ngày {$tungay|date_format:"%d-%m-%Y"}{/if}
                    {if $denngay neq ''}đến ngày {$denngay|date_format:"%d-%m-%Y"}{/if}
                    
                    {if $sodi_tu neq ''}<br />- Từ số {$sodi_tu}{/if} 
                    {if $sodi_den neq ''}đến số {$sodi_den}{/if}
                    
                    {if $docCat_id_fil neq 0}
                    <br />- Loại văn bản: 
                        {section name=qi loop=$obj_list_dcat}
                        {if $obj_list_dcat[qi]->docCat_id eq $docCat_id_fil}{$obj_list_dcat[qi]->docCat_name}{/if}
                        {/section}
                    {/if}
                    
                    {if $department_fil neq 0}
                    <br />- ĐV dự thảo: 
                        {section name=di loop=$obj_list_department}
                        {if $obj_list_department[di]->department_id eq $department_fil}
                        {$obj_list_department[di]->department_name}{/if}
                        {/section}
                    {/if}
                    </td>
                  </tr>
                </table>
            </td>
        </tr>
        <tr bgcolor="#ccd8e7" height="25">
            <td width="5%" align="left" ><B>Số dự thảo</B></td>
            <td width="8%" align="left" ><B>Ngày DT</B></td>
            <td width="12%" align="left" ><B>Loại văn bản</B></td>
            <td align="left" ><B>Trích yếu</B></td>
            <td width="18%" align="left" ><B>Đơn vị dự thảo</B></td>
            <td width="12%" align="left"><B>Tình trạng</B></td>
            <td width="8%" align="left" ><B>Người nhập</B></td>
        </tr>
        {php}$total_trang = 0;{/php}
        {php}$totalheight = 0;$stt=0;{/php}
        {section name=pi loop=$obj_list}    
        {math a=$obj_list[pi]->docDT_desc|format_ununicode:false|string_len equation="a" assign=strlen}
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
        //echo $addtrheight.'=(715-'.$addheight.'+'.$trheight.')-'.$totalheight.'->'.$this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docDT_num.'<br>';
        $totalheight=$trheight;
        $stt=1;
        endif;
        {/php}
        <tr {if $smarty.section.pi.index is not div by 2} bgcolor="#F2FFEC" {/if} {php}if($addtrheight>0):{/php}style="height:32px; border-top:{php}echo $addtrheight;{/php}px solid #fff"{php}endif;{/php}>
            <td align="left">{$obj_list[pi]->docDT_num}</td>
            <td align="left">{$obj_list[pi]->docDT_date|date_format:"%d-%m-%Y"}</td>
            <td align="left">
            {section name=qi loop=$obj_list_dcat}
                {if $obj_list_dcat[qi]->docCat_id eq $obj_list[pi]->docCat_id}
                {$obj_list_dcat[qi]->docCat_name}
                {/if}
            {/section}
            </td>
            <td align="left">{$obj_list[pi]->docDT_desc}</td>
            <td align="left">
            {section name=qi loop=$obj_list_department}
                {if $obj_list_department[qi]->department_id eq $obj_list[pi]->department_id}
                {$obj_list_department[qi]->department_name}
                {/if}
            {/section}
            </td>
            <td align="left">
                {if $obj_list[pi]->docDT_status eq 0}
                    &nbsp;Mới nhập
                {elseif $obj_list[pi]->docDT_status eq 1}
                    &nbsp;Chờ hiệu chỉnh
                {elseif $obj_list[pi]->docDT_status eq 2}
                    &nbsp;Đã trình ký
                {elseif $obj_list[pi]->docDT_status eq 3}
                    &nbsp;Đã ký
                {else}
                    &nbsp;Đã vào sổ đi
                {/if}
            </td>
            <td align="left">
            {section name=qi loop=$obj_list_user_vt}
                {if $obj_list_user_vt[qi]->user_id eq $obj_list[pi]->input_per}
                {$obj_list_user_vt[qi]->user_fullname}
                {/if}
            {/section}
            </td>
        </tr>    
        {/section}
        <tr>
            <td colspan="7" align="center" style="font-weight:bold">
                Tổng số văn bản: {$total_num_result}
            </td>
        </tr>
        <tr>
            <td colspan="5" align="right">&nbsp;</td>
            <td colspan="2" align="center" height="80">
                Hà Nội, ngày {$smarty.now|date_format:"%d"} tháng {$smarty.now|date_format:"%m"} năm {$smarty.now|date_format:"%Y"}<br />
                Người làm báo cáo<br />
                {$access_object_name}<br /><br /><br /><br /><br />
                {$access_user_fullname}
            </td>
        </tr>
    </table>
    </div>
    </div>
</div>