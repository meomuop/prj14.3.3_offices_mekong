{literal}
    <style type="text/css">
    .error { color:#FF0000;font-weight:bold; margin-left:5px; height:20px; line-height:20px}
    .msg{ color:#00F; font-weight:bold; margin-left:5px; height:20px; line-height:20px}
    .tbl_tit{
    float:left; line-height:25px; border-right:1px solid #99bbe8;
    }
    .tbl_cont{
    float:left; line-height:25px; border-right:1px solid #99bbe8; border-bottom:1px solid #99bbe8; background:#F2FFEC; font-size:12px
    }
    .tbl_cont2{
    float:left; line-height:25px; border-right:1px solid #99bbe8; border-bottom:1px solid #99bbe8; background:#FFF; font-size:12px
    }
    </style>

{/literal}
<div id="view_hdmua_content_insign">
	<form method="post" name="frmList_HdmuaView" action="?listHdmuaView{$vars.arg}" id="frmList_HdmuaView">
        <div style="float: left;">
            <!------------------------------------------Thong tim hop dong------------------------------------>
            <fieldset style="width:328px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:378px">
                <legend class="legend_list_search" style="width: 150px">Thông tin hợp đồng</legend>
                <table width="98%" cellspacing="0" cellpadding="0" border="0" style="margin-left:5px">
                    <tr height="30">
                        <td style="line-height: 20px">
                            {$hdmua_info.hdmua_sohd}<br>
                            {$hdmua_info.hdmua_ngayhd}<br>
                            {$hdmua_info.hdmua_hieuluc}<br>
                            {$hdmua_info.hdmua_noidung}<br>
                            {$hdmua_info.hdmua_tgth} {$hdmua_info.hdmua_kieu_tgth}<br>
                            {$hdmua_info.hdmua_giatri_quydoi} (VNĐ)<br>
                            {$hdmua_info.hdmua_gttt_quydoi} (VNĐ)<br>
                            {$hdmua_info.doitac_viettat}<br>
                            {$hdmua_info.phongban}<br>
                            {$hdmua_info.nguoi_theodoi}<br>
                            {$hdmua_info.hdmua_tinhtrang}<br>
                            {$hdmua_info.hdmua_tl_huybo}<br>
                            {$hdmua_info.hdmua_lydo_huybo}<br>
                            {$hdmua_info.hdmua_dieukhoankhac}<br>
                            {$hdmua_info.hdmua_nguoinhap}<br>
                        </td>
                    </tr>
                </table>
            </fieldset>
        </div>
        <div style="float: left;">
            <!------------------------------------Van ban lien quan---------------------------------------------->
            <fieldset style="width:264px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:378px">
                <legend class="legend_list" style="width:150px">Văn bản liên quan</legend>
                <div style="float:left; width:264px; height:356px; overflow-y:scroll">
                    {section name=pi loop=$obj_list}
                        {if $smarty.section.pi.index is not div by 2}
                            {assign var="class_td" value="tbl_cont"}
                        {else}
                            {assign var="class_td" value="tbl_cont2"}
                        {/if}
                        {math  z=$smarty.section.pi.index t=1 equation="z+t" assign=stt}
                        <div style="float:left; width:235px; line-height: 20px; margin: 5px 5px 0 5px; padding-bottom: 5px; text-align: justify; border-bottom: 1px dashed #99bbe8">
                            <b>{$stt}. Văn bản {if $obj_list[pi]->lkvb_type eq 1}đến {else}đi {/if}số: {$obj_list[pi]->vanban_skh}</b><br>
                            <u>Trích yếu</u>: {$obj_list[pi]->vanban_trichyeu}<br>
                            <u>Tệp tin</u>: <a href='{$obj_list[pi]->vanban_file}' target="new">[Xem file]</a>
                        </div>
                    {/section}
                </div>
            </fieldset>
        </div>
        <div style="float: left;">
            <!------------------------------------tien trinh xu ly---------------------------------------------->
            <fieldset style="width:264px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:378px">
                <legend class="legend_list" style="width:150px">Tiến trình thực hiện</legend>
                <div style="float:left; width:264px; height:356px; overflow-y:scroll">
                    {section name=ti loop=$obj_list_tt}
                        {if $smarty.section.ti.index is not div by 2}
                            {assign var="class_td" value="tbl_cont"}
                        {else}
                            {assign var="class_td" value="tbl_cont2"}
                        {/if}
                        {math  z=$smarty.section.ti.index t=1 equation="z+t" assign=stt}
                        <div style="float:left; width:235px; line-height: 20px; margin: 5px 5px 0 5px; padding-bottom: 5px text-align: justify; border-bottom: 1px dashed #99bbe8">
                            <b>Bước {$stt}: </b>{$obj_list_tt[ti]->tientrinh_ghichu}<br>
                            <u>Tệp tin</u>: <a href='{$obj_list_tt[ti]->tientrinh_file}' target="new">[Xem file]</a>
                        </div>
                    {/section}
                </div>
            </fieldset>
        </div>
    </form>
</div>
{literal}
<script type="text/javascript">

</script>
{/literal}
