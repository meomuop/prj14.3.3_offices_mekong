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
            <fieldset style="width:360px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:378px">
                <legend class="legend_list_search" style="width: 240px">Thông tin hợp đồng: {$hdmua_info.hdmua_sohd}</legend>
                <table width="98%" cellspacing="0" cellpadding="0" border="0" style="margin-left:5px">
                    <tr height="30">
                        <td style="line-height: 20px">
                            <div style="float: left; width: 100%; height:356px; overflow-y:scroll">
                                <div style="float: left; width: 100%; margin-top: 5px; border-bottom: 1px dashed #99bbe8">
                                    <div style="float: left; width: 20%"><u>Ngày ký:</u></div>
                                    <div style="float: left; width: 80%">{$hdmua_info.hdmua_ngayhd|date_format:"%d/%m/%Y"}</div>
                                </div>
                                <div style="float: left; width: 100%; margin-top: 5px; border-bottom: 1px dashed #99bbe8">
                                    <div style="float: left; width: 20%"><u>Hiệu lực:</u></div>
                                    <div style="float: left; width: 80%">{$hdmua_info.hdmua_hieuluc|date_format:"%d/%m/%Y"}</div>
                                </div>
                                <div style="float: left; width: 100%; margin-top: 5px; border-bottom: 1px dashed #99bbe8">
                                    <div style="float: left; width: 20%"><u>Nội dung:</u></div>
                                    <div style="float: left; width: 80%">{$hdmua_info.hdmua_noidung}</div>
                                </div>
                                <div style="float: left; width: 100%; margin-top: 5px; border-bottom: 1px dashed #99bbe8">
                                    <div style="float: left; width: 20%" title="Thời gian thực hiện"><u>TGTH:</u></div>
                                    <div style="float: left; width: 80%">
                                        {$hdmua_info.hdmua_tgth}
                                        {if $hdmua_info.hdmua_kieu_tgth eq 1}ngày
                                        {elseif $hdmua_info.hdmua_kieu_tgth eq 2}tháng
                                        {else}năm{/if}
                                    </div>
                                </div>
                                <div style="float: left; width: 100%; margin-top: 5px; border-bottom: 1px dashed #99bbe8">
                                    <div style="float: left; width: 20%" title="Giá trị hợp đồng"><u>GTHĐ:</u></div>
                                    <div style="float: left; width: 80%">{$hdmua_info.hdmua_giatri_quydoi|price_format} (VNĐ)</div>
                                <div style="float: left; width: 100%; margin-top: 5px; border-bottom: 1px dashed #99bbe8">
                                    <div style="float: left; width: 20%" title="Giá trị thanh toán"><u>GTTT:</u></div>
                                    <div style="float: left; width: 80%">{$hdmua_info.hdmua_gttt_quydoi|price_format} (VNĐ)</div>
                                </div>
                                <div style="float: left; width: 100%; margin-top: 5px; border-bottom: 1px dashed #99bbe8">
                                    <div style="float: left; width: 20%"><u>Đối tác:</u></div>
                                    <div style="float: left; width: 80%">{$hdmua_info.doitac_viettat}</div>
                                </div>
                                <div style="float: left; width: 100%; margin-top: 5px; border-bottom: 1px dashed #99bbe8">
                                    <div style="float: left; width: 20%"><u>Phụ trách:</u></div>
                                    <div style="float: left; width: 80%">{$hdmua_info.phongban_name}</div>
                                </div>
                                <div style="float: left; width: 100%; margin-top: 5px; border-bottom: 1px dashed #99bbe8">
                                    <div style="float: left; width: 20%"><u>Theo dõi:</u></div>
                                    <div style="float: left; width: 80%">{$hdmua_info.nguoi_theodoi}</div>
                                </div>
                                <div style="float: left; width: 100%; margin-top: 5px; border-bottom: 1px dashed #99bbe8">
                                    <div style="float: left; width: 20%"><u>Tình trạng</u></div>
                                    <div style="float: left; width: 80%">
                                        {if $hdmua_info.hdmua_tinhtrang eq 1}Mới nhập
                                        {elseif $hdmua_info.hdmua_tinhtrang eq 2}Đang thực hiện
                                        {elseif $hdmua_info.hdmua_tinhtrang eq 3}Đã hoàn thành
                                        {else}Đã hủy{/if}
                                    </div>
                                </div>
                                {if $hdmua_info.hdmua_tinhtrang eq 4}
                                    <div style="float: left; width: 100%; margin-top: 5px; border-bottom: 1px dashed #99bbe8">
                                        <div style="float: left; width: 20%">Thanh toán hủy</div>
                                        <div style="float: left; width: 80%">{$hdmua_info.hdmua_tl_huybo|price_format} (VNĐ)</div>
                                    </div>
                                    <div style="float: left; width: 100%; margin-top: 5px; border-bottom: 1px dashed #99bbe8">
                                        <div style="float: left; width: 20%">Lý do hủy</div>
                                        <div style="float: left; width: 80%">{$hdmua_info.hdmua_lydo_huybo}</div>
                                    </div>
                                {/if}
                                <div style="float: left; width: 100%; margin-top: 5px; border-bottom: 1px dashed #99bbe8">
                                    <div style="float: left; width: 20%"><u>Nội dung:</u></div>
                                    <div style="float: left; width: 80%">{$hdmua_info.hdmua_dieukhoankhac}</div>
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </fieldset>
        </div>
        <div style="float: left;">
            <div style="float: left;">
                <!------------------------------------Van ban lien quan---------------------------------------------->
                <fieldset style="width:274px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:228px">
                    <legend class="legend_list" style="width:150px">Chứng từ</legend>
                    <div style="float:left; width:274px; height:206px; overflow-y:scroll">
                        {section name=pi loop=$obj_list_hd}
                            {if $smarty.section.pi.index is not div by 2}
                                {assign var="class_td" value="tbl_cont"}
                            {else}
                                {assign var="class_td" value="tbl_cont2"}
                            {/if}
                            {math  z=$smarty.section.pi.index t=1 equation="z+t" assign=stt}
                            <div style="float:left; width:245px; line-height: 20px; margin: 5px 5px 0 5px; padding-bottom: 5px; text-align: left; border-bottom: 1px dashed #99bbe8">
                                <b>CT {$stt}</b>. Số: {$obj_list_hd[pi]->hoadon_sohd} (Xuất: {$obj_list_hd[pi]->hoadon_ngayhd|date_format:"%d/%m/%Y"})<br>
                                <u>Giá trị</u>: {$obj_list_hd[pi]->hoadon_giatri|price_format} (VNĐ)
                                ({if $obj_list_hd[pi]->hoadon_pttt eq 1}Tiền mặt{else}Chuyển khoản{/if})<br>
                                <u>Nội dung</u>: {$obj_list_hd[pi]->hoadon_noidung}<br>
                                <u>Tệp tin</u>: <a href='{$obj_list_hd[pi]->hoadon_file}' target="new">[Xem file]</a>
                            </div>
                        {/section}
                    </div>
                </fieldset>
            </div>
            <div style="float: left;">
                <!------------------------------------tien trinh xu ly---------------------------------------------->
                <fieldset style="width:274px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:228px">
                    <legend class="legend_list" style="width:150px">Tiến trình thực hiện</legend>
                    <div style="float:left; width:274px; height:206px; overflow-y:scroll">
                        {section name=ti loop=$obj_list_tt}
                            {if $smarty.section.ti.index is not div by 2}
                                {assign var="class_td" value="tbl_cont"}
                            {else}
                                {assign var="class_td" value="tbl_cont2"}
                            {/if}
                            {math  z=$smarty.section.ti.index t=1 equation="z+t" assign=stt}
                            <div style="float:left; width:245px; line-height: 20px; margin: 5px 5px 0 5px; padding-bottom: 5px; text-align: left; border-bottom: 1px dashed #99bbe8">
                                <b>Bước {$stt}: </b>{$obj_list_tt[ti]->tientrinh_ghichu}<br>
                                <u>Tệp tin</u>: <a href='{$obj_list_tt[ti]->tientrinh_file}' target="new">[Xem file]</a>
                            </div>
                        {/section}
                    </div>
                </fieldset>
            </div>
        </div>
        <div style="float: left;">
            <fieldset style="width:554px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:143px">
                <legend class="legend_list" style="width:150px">Văn bản liên quan</legend>
                <div style="float:left; width:554px; height:121px; overflow-y:scroll">
                    {section name=pi loop=$obj_list}
                        {if $smarty.section.pi.index is not div by 2}
                            {assign var="class_td" value="tbl_cont"}
                        {else}
                            {assign var="class_td" value="tbl_cont2"}
                        {/if}
                        {math  z=$smarty.section.pi.index t=1 equation="z+t" assign=stt}
                        <div style="float:left; width:530px; line-height: 20px; margin: 5px 5px 0 5px; padding-bottom: 5px; text-align: justify; border-bottom: 1px dashed #99bbe8">
                            <b>{$stt}. Văn bản {if $obj_list[pi]->lkvb_type eq 1}đến {else}đi {/if}số: <a href='{$obj_list[pi]->vanban_file}' target="new">{$obj_list[pi]->vanban_skh}</a></b>
                            ({$obj_list[pi]->vanban_trichyeu})
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
