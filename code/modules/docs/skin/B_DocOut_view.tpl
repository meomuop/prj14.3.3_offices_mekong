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
	<form method="post" name="frmDocOut_view" action="?viewDocOut{$vars.arg}" id="frmDocOut_view">
    <!------------------------------------------THONG TIN------------------------------------>
    <fieldset style="width:523px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
        <legend class="legend">Thông tin:</legend>
    	<div style="float:left; width:513px" class="text_all">
        	<div style="float:left; width:60px">Loại V.Bản:</div>
            <div style="float:left; width:78px" title="{$vars.docCat_id}">{section name=qi loop=$obj_list_dcat}{if $obj_list_dcat[qi]->docCat_id eq $vars.docCat_id}{$obj_list_dcat[qi]->docCat_name}{/if}{/section};</div>
            <div style="float:left; width:62px">Ngày tháng:</div>
            <div style="float:left; width:70px">{$vars.docOut_date|date_format:"%d/%m/%Y"};</div>
            <div style="float:left; width:55px">Số K.Hiệu:</div>
            <div style="float:left; width:105px" title="{$vars.docOut_code}">{$vars.docOut_code};</div>
            <div style="float:left; width:40px">Số đi:</div>
            <div style="float:left; width:40px">{if $vars.docOut_num neq 0} {$vars.docOut_num}{else}{$vars.docOut_num_typical}{/if}</div>
        </div>
        <div style="float:left; width:513px" class="text_all">
        	<div style="float:left; width:60px">Nơi nhận:</div>
            <div style="float:left; width:450px">
            	{if $vars.unit_name neq ''}
                    {php}
                        $sql = "select * from tbl_units where unit_id in(".$this->_tpl_vars['vars']['unit_name'].")";
                        $result = mysql_query($sql) or die($sql);
                        $unit_name_str = "";
                        $i=0;
                        while($row = mysql_fetch_array($result)):
                            if($i < mysql_num_rows($result)):
                                $unit_name_str .=  $row['unit_name'].", ";
                            else:
                                $unit_name_str .= $row['unit_name'];
                            endif;
                            $i++;
                        endwhile;
                        echo fnsSubstr($unit_name_str,250,1);
                    {/php}
                {else}
               		{$vars.unit_name_02|str_string_cut:"250":"1"}
                {/if}
            </div>
        </div>
        <div style="float:left; width:513px" class="text_all">
        	<div style="float:left; width:60px">Trích yếu:</div>
            <div style="float:left; width:450px">{$vars.docOut_desc|str_string_cut:"250":"1"}</div>
        </div>
        <div style="float:left; width:513px" class="text_all">
        	<div style="float:left; width:60px">Chú thích:</div>
            <div style="float:left; width:450px">{$vars.docOut_note|str_string_cut:"250":"1"}</div>
        </div>
        <div style="float:left; width:513px" class="text_all">
        	<div style="float:left; width:60px">Người ký:</div>
            <div style="float:left; width:105px">{section name=qi loop=$obj_list_user_bgd}{if $obj_list_user_bgd[qi]->user_id eq $vars.docOut_signed}{$obj_list_user_bgd[qi]->user_fullname}{/if}{/section};</div>
            <div style="float:left; width:60px">Người nhập:</div>
            <div style="float:left; width:105px">{section name=qi loop=$obj_list_user}{if $obj_list_user[qi]->user_id eq $vars.input_per}{$obj_list_user[qi]->user_fullname}{/if}{/section}</div>
        </div>
    </fieldset>
    </form>
</div>