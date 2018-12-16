<body topmargin="0" bottommargin="0" leftmargin="0" rightmargin="0">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td valign="top" align="center">
            <table class="adminlist" width="100%" border="0" cellpadding="0" cellspacing="0">
                <form name="frm2" method="post" action=""></form>
            </table>
            <br />
             <fieldset style="width: 90%; ">
             <legend >&nbsp;<font class="label_font" color="#425E89">THÔNG TIN VĂN BẢN TRẢ LỜI:&nbsp;</font></legend>	
             <div><img src="../images/admin/spacer.gif" style="height:10px;" /></div>
             <div align="center">
             <table width="95%" class="adminlist">
                <tr height="28">
                    <td width="15%" align="right" style="background-color:#ffd7ae; border-right:1px solid #003451; border-bottom:1px solid #003451"><font class="label_font" color="#425E89">Ngày nhập:</font></td>
                    <td width="25%" align="left" style="padding-left:2px; background-color:#f2eee0">{$docreply_info.docreply_date|date_format:"%d-%m-%Y"}</td>
                    <td width="15%" align="right" style="background-color:#ffd7ae; border-right:1px solid #003451; border-bottom:1px solid #003451"><font class="label_font" color="#425E89">Người nhập:</font></td>
                    <td align="left" style="padding-left:2px; background-color:#f2eee0">{$user_info.user_fullname}</td>
                </tr>
                <tr height="28">
                    <td width="15%" align="right" style="background-color:#ffd7ae; border-right:1px solid #003451; border-bottom:1px solid #003451"><font class="label_font" color="#425E89">Số ký hiệu:</font></td>
                    <td width="25%" align="left" style="padding-left:2px; background-color:#f2eee0">{$docreply_info.docreply_code}</td>
                    <td width="15%" align="right" style="background-color:#ffd7ae; border-right:1px solid #003451; border-bottom:1px solid #003451"><font class="label_font" color="#425E89">Loại văn bản:</font></td>
                    <td align="left" style="padding-left:2px; background-color:#f2eee0">{$docreply_info.docCat_id}</td>
                </tr>
                <tr height="28">
                    <td align="right" style="background-color:#ffd7ae; border-right:1px solid #003451; border-bottom:1px solid #003451"><font class="label_font" color="#425E89">Người ký:</font></td>
                    <td colspan="3" align="left" style="padding-left:2px; background-color:#f2eee0">{$docreply_info.signPer_id}</td>
                </tr>
                <tr height="28">
                    <td align="right" style="background-color:#ffd7ae; border-right:1px solid #003451; border-bottom:1px solid #003451"><font class="label_font" color="#425E89">Trích yếu:</font></td>
                    <td colspan="3" align="left" style="padding-left:2px; background-color:#f2eee0">{$docreply_info.docreply_desc}</td>
                </tr>
                <tr height="28">
                    <td align="right" style="background-color:#ffd7ae; border-right:1px solid #003451; border-bottom:1px solid #003451"><font class="label_font" color="#425E89">Ý kiến chỉ đạo:</font></td>
                    <td colspan="3" align="left" style="padding-left:2px; background-color:#f2eee0">{$docreply_info.docreply_direct}</td>
                </tr>
                <tr height="28">
                    <td align="right" style="background-color:#ffd7ae; border-right:1px solid #003451; border-bottom:1px solid #003451"><font class="label_font" color="#425E89">Chú thích:</font></td>
                    <td colspan="3" align="left" style="padding-left:2px; background-color:#f2eee0">{$docreply_info.docreply_note}</td>
                </tr>
                <tr height="28">
                    <td width="15%" align="right" style="background-color:#ffd7ae; border-right:1px solid #003451; border-bottom:1px solid #003451"><font class="label_font" color="#425E89">Ngày ký:</font></td>
                    <td width="25%" align="left" style="padding-left:2px; background-color:#f2eee0">{$docreply_info.docreply_signed|date_format:"%d-%m-%Y"}</td>
                    <td width="15%" align="right" style="background-color:#ffd7ae; border-right:1px solid #003451; border-bottom:1px solid #003451"><font class="label_font" color="#425E89">Hạn trả lời:</font></td>
                    <td align="left" style="padding-left:2px; background-color:#f2eee0">{if $docreply_info.docreply_limit_time|date_format:"%d-%m-%Y" neq '01-01-1970'}{$docreply_info.docreply_limit_time|date_format:"%d-%m-%Y"}{/if}</td>
                </tr>
              </table>
             </div>
             </fieldset>
             <fieldset style="width: 90%; ">
             <legend >&nbsp;<font class="label_font" color="#425E89">DANH SÁCH TỆP TIN ĐÍNH KÈM:&nbsp;</font></legend>	
             <form method="post" name="frmList" action="?addReceive{$vars.arg}" id="frmList">
             <div><img src="../images/admin/spacer.gif" style="height:10px;" /></div>
             <div align="center">
             <table width="95%" class="adminlist">
                <tr height="28">
                    <td width="5%" align="center" style="background-color:#ffd7ae; border-right:1px solid #003451; border-bottom:1px solid #003451"><font class="label_font" color="#425E89">STT</font></td>	
                    <td align="center" style="background-color:#ffd7ae; border-right:1px solid #003451; border-bottom:1px solid #003451"><font class="label_font" color="#425E89">Tên tệp tin</font></td>
                    <td width="46%" align="center" style="background-color:#ffd7ae; border-right:1px solid #003451; border-bottom:1px solid #003451"><font class="label_font" color="#425E89">Đường dẫn</font></td>
                    <td width="8%" align="center" style="background-color:#ffd7ae; border-right:1px solid #003451; border-bottom:1px solid #003451"><font class="label_font" color="#425E89">Xóa</font><input type="hidden" name="chon" id="chon"></td>
                </tr>
                {section name=di loop=$obj_list_docreplyfile}
                <tr {if $smarty.section.qi.index is not div by 2} bgcolor="#F2FFEC" {/if}>
                    <td width="5%" align="center">{math x=$smarty.section.di.index y=1 equation="x+y" assign=stt}{$stt}</td>
                    <td align="left">{$obj_list_docreplyfile[di]->docreplyfile_name}</td>
                    <td align="left"><a href="{$obj_list_docreplyfile[di]->docreplyfile_path}">{$obj_list_docreplyfile[di]->docreplyfile_path}</a></td>
                    <td align="center">-</td>
                </tr>
                {/section}
              </table>
             </div>
             </form>
             </fieldset>
        </td>
    </tr>
</table>
</body>
</html>