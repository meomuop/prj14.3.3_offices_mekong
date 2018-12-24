<div id="doc_report_content_insign">
    <!------------------------------------KET QUA KET XUAT---------------------------------------------->
    <div style="float:left; width:858px; height:385px; overflow-y:auto; margin:2px; font-size:12px">
        <div style="float:left; width:836px; height:375px" id="div_cont_print">
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
            <table style="width:825px" border="0" cellpadding="0" cellspacing="0" align="center" class="tbl_cont">
                <tr>
                    <td colspan="6">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" style="border:none">
                            <tr height="30">
                                <td align="center" width="30%" style="border:none">
                                    <font color=#000000 style="font-size:16px; font-weight:bold">
                                        {$obj_owner[0]->owner_name}</font></td>
                            </tr>
                            <tr height="30">
                                <td align="center" style="border:none">
                                    <font color=#000000 style="font-size:16px; font-weight:bold">
                                        <B>BÁO CÁO THỐNG KÊ HỢP ĐỒNG MUA</B></font></td>
                            </tr>
                            <tr>
                                <td align="left" style="line-height:20px; font-weight:bold;border:none">
                                    {if $tungay neq ''}- Từ ngày {$tungay|date_format:"%d-%m-%Y"}{/if}
                                    {if $denngay neq ''}đến ngày {$denngay|date_format:"%d-%m-%Y"}{/if}
                                    {if $denngay neq ''}đến ngày {$denngay|date_format:"%d-%m-%Y"}{/if}
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr bgcolor="#ccd8e7" height="25">
                    <td width="4%" align="center"><B>STT</B></td>
                    <td width="12%" align="left"><B>Số hợp đồng</B></td>
                    <td width="10%" align="center"><B>Ngày ký</B></td>
                    <td width="48%" align="left"><B>Nội dung</B></td>
                    <td width="12%" align="right"><B>Giá trị (VNĐ)</B></td>
                    <td width="14%" align="center"><B>Theo dõi</B></td>
                </tr>
                {section name=pi loop=$obj_list}
                    {math z=$smarty.section.pi.index t=1 equation="z+t" assign=stt}
                    <tr {if $smarty.section.pi.index is not div by 2} bgcolor="#F2FFEC" {/if}>
                        <td align="center">{$stt}</td>
                        <td align="left">{$obj_list[pi]->hdmua_sohd}</td>
                        <td align="center">{$obj_list[pi]->hdmua_ngayhd|date_format:"%d/%m/%Y"}</td>
                        <td align="left">{$obj_list[pi]->hdmua_noidung|str_string_cut:"60":"1"}</td>
                        <td align="right">{$obj_list[pi]->hdmua_giatri_quydoi|price_format}</td>
                        <td align="center">{$obj_list[pi]->nguoi_theodoi}</td>
                    </tr>
                {/section}
                <tr>
                    <td colspan="6" align="center" style="font-weight:bold">
                        Tổng số hóa đơn: {$total_num_result}
                    </td>
                </tr>
                <tr>
                    <td colspan="4" align="right">&nbsp;</td>
                    <td colspan="2" align="right" height="80">
                        <div style="float:right; margin-right: 20px; text-align: center">
                            Hà Nội, ngày {$smarty.now|date_format:"%d"} tháng {$smarty.now|date_format:"%m"} năm {$smarty.now|date_format:"%Y"}<br />
                            Người làm báo cáo<br />
                            {$access_object_name}<br /><br /><br /><br /><br />
                            {$access_user_fullname}
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>