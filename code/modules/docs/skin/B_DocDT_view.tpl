{literal}
<style type="text/css">
.error { color:#FF0000;font-weight:bold; margin-left:5px; height:20px; line-height:20px}
.msg{ color:#00F; font-weight:bold; margin-left:5px; height:20px; line-height:20px}
.tbl_tit_view{
float:left; line-height:20px; border-right:1px solid #99bbe8; 	
}
.text_all{
	font-size:12px; line-height:20px; text-align:left; padding:0 5px 0 5px
}
.tbl_cont_view{
float:left; line-height:20px; border-right:1px solid #99bbe8; border-bottom:1px solid #99bbe8; background:#F2FFEC
}
.tbl_cont_view2{
float:left; line-height:20px; border-right:1px solid #99bbe8; border-bottom:1px solid #99bbe8; background:#FFF
}
</style>
{/literal}
<div id="phanloai_content_insign">
	<form method="post" name="frmDocDT_view" action="?viewDocDT{$vars.arg}" id="frmDocDT_view">
    <!------------------------------------------THONG TIN------------------------------------>
    <fieldset style="width:523px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
        <legend class="legend">Thông tin:</legend>
    	<div style="float:left; width:513px" class="text_all">
        	<div style="float:left; width:60px">Loại V.Bản:</div>
            <div style="float:left; width:78px" title="{$vars.docCat_id}">{section name=qi loop=$obj_list_dcat}{if $obj_list_dcat[qi]->docCat_id eq $vars.docCat_id}{$obj_list_dcat[qi]->docCat_name}{/if}{/section};</div>
            <div style="float:left; width:62px">Ngày tháng:</div>
            <div style="float:left; width:70px">{$vars.docDT_date|date_format:"%d/%m/%Y"};</div>
            <div style="float:left; width:40px">Số đi:</div>
            <div style="float:left; width:40px">{if $vars.docDT_num neq 0} {$vars.docDT_num}{/if}</div>
        </div>
        <div style="float:left; width:513px" class="text_all">
        	<div style="float:left; width:60px">Trích yếu:</div>
            <div style="float:left; width:450px">{$vars.docDT_desc|str_string_cut:"250":"1"}</div>
        </div>
        <div style="float:left; width:513px" class="text_all">
            <div style="float:left; width:60px">Tình trạng:</div>
            <div style="float:left; width:210px">
                {if $vars.docDT_status eq 0}
                    &nbsp;Mới nhập
                {elseif $vars.docDT_status eq 1}
                    &nbsp;Chờ hiệu chỉnh
                {elseif $vars.docDT_status eq 2}
                    &nbsp;Đã trình ký
                {elseif $vars.docDT_status eq 3}
                    &nbsp;Đã ký
                {else}
                    &nbsp;Đã vào sổ đi
                {/if}
            </div>
            <div style="float:left; width:60px">Người nhập:</div>
            <div style="float:left; width:105px">{section name=qi loop=$obj_list_user}{if $obj_list_user[qi]->user_id eq $vars.input_per}{$obj_list_user[qi]->user_fullname}{/if}{/section}</div>
        </div>
    </fieldset>
    </form>
</div>