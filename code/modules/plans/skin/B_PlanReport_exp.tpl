<div id="plan_report_content_insign">
    <!------------------------------------KET QUA KET XUAT---------------------------------------------->
    <div style="float:left; width:782px; height:385px; overflow-y:auto; margin:2px; font-size:12px">
    <div style="float:left; width:764px; height:375px" id="div_plan_cont_print">
    {literal}
	<style type="text/css">
    .tbl_cont{
    float:left; line-height:25px; border-right:1px solid #99bbe8; border-bottom:1px solid #99bbe8; background:#FFF;font-family:'Times New Roman', Times, serif
    }
    .tbl_cont td{
        border-left:1px solid #99bbe8; border-top:1px solid #99bbe8; font-size:12px; padding:2px; line-height:15px
    }
    </style>
    {/literal}
    <table style="width:764px" border="0" cellpadding="0" cellspacing="0" align="center" class="tbl_cont">
        <tr>
            <td colspan="10">
                <table width="100%" border="0" cellspacing="0" cellpadding="0" style="border:none">
                  <tr height="50">
                    <td align="center" width="50%" style="border:none; text-transform: uppercase">
                        TCT ĐẦU TƯ VÀ PHÁT TRIỂN NHÀ HÀ NỘI<br>
                        <font color=#000000 style="font-size:13px; font-weight:bold">
                        {$obj_owner[0]->owner_name}</font>
                    </td>
                    <td align="center" style="border:none; font-style: italic">
                        <font color=#000000 style="font-size:13px; font-weight:bold">
                        <B>LỊCH CÔNG TÁC TUẦN</B></font><BR>
                        ({if $tu_ngay neq ''}Từ ngày {$tu_ngay|date_format:"%d/%m/%Y"}{/if}
                        {if $den_ngay neq ''}đến ngày {$den_ngay|date_format:"%d/%m/%Y"}{/if})
                    </td>
                  </tr>
                </table>
            </td>
        </tr>
        <tr bgcolor="#ccd8e7" height="25">
            <td width="10%" align="left" ><B>Ngày</B></td>
            <td width="10%" align="left" ><B>Thời gian</B></td>
            <td width="25%" align="left" ><B>Nội dung</B></td>
            <td width="10%" align="left" ><B>Địa điểm</B></td>
            <td width="10%" align="left" ><B>Chủ trì</B></td>
            <td width="10%" align="left" ><B>Chuẩn bị</B></td>
            <td width="25%" align="left" ><B>Thành phần dự</B></td>
        </tr>
        {section name=pi loop=$obj_list}  
        <tr {if $smarty.section.pi.index is not div by 2} bgcolor="#F2FFEC" {/if}>
            <td align="left">{$obj_list[pi]->plan_start|date_format:"%d/%m"} - {$obj_list[pi]->plan_end|date_format:"%d/%m"}</td>
            <td align="right">{$obj_list[pi]->plan_start|date_format:"%H:%M"} - {$obj_list[pi]->plan_end|date_format:"%H:%M"}</td> 
            <td align="left">{$obj_list[pi]->plan_subject}</td>
            <td align="left">{$obj_list[pi]->plan_address}</td>
            <td align="left">{$obj_list[pi]->plan_chairman}</td>
            <td align="left">{$obj_list[pi]->plan_prepare}</td>
            <td align="left">{$obj_list[pi]->plan_cont}</td>
        </tr>    
        {/section}
        <tr>
            <td colspan="6" align="right">&nbsp;</td>
            <td align="center" height="80">
                TL. GIÁM ĐỐC CÔNG TY<BR>
                <font style="text-transform: uppercase">Ban trợ lý - thư ký</font><br /><br /><br /><br /><br />
                {$access_user_fullname}
            </td>
        </tr>
    </table>
    </div>
    </div>
</div>