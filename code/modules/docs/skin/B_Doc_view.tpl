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
	<form method="post" name="frmDoc_view" action="?docView{$vars.arg}" id="frmDoc_view">
    <!------------------------------------------THONG TIN------------------------------------>
    <fieldset style="width:523px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
        <legend class="legend">Thông tin:</legend>
    	<div style="float:left; width:513px" class="text_all">
        	<div style="float:left; width:60px">Loại V.Bản:</div>
            <div style="float:left; width:78px" title="{$vars.docCat_id}">{$vars.docCat_id|str_string_cut:"20":"1"};</div>
            <div style="float:left; width:62px">Ngày tháng:</div>
            <div style="float:left; width:70px">{$vars.doc_signed|date_format:"%d/%m/%Y"};</div>
            <div style="float:left; width:55px">Số K.Hiệu:</div>
            <div style="float:left; width:105px" title="{$vars.doc_code}">{$vars.doc_code|str_string_cut:"25":"1"};</div>
            <div style="float:left; width:40px">Số đến:</div>
            <div style="float:left; width:40px">{$vars.doc_num}</div>
        </div>
        <div style="float:left; width:513px" class="text_all">
        	<div style="float:left; width:60px">Phát hành:</div>
            <div style="float:left; width:450px">{$vars.unit_name|str_string_cut:"120":"1"}</div>
        </div>
        <div style="float:left; width:513px" class="text_all">
        	<div style="float:left; width:60px">Trích yếu:</div>
            <div style="float:left; width:450px">{$vars.doc_desc|str_string_cut:"250":"1"}</div>
        </div>
    </fieldset>
    
    <!------------------------------------------Y KIEN THAM MUU------------------------------------>
    <fieldset style="width:523px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
        <legend class="legend">Tham mưu:</legend>
    	<div style="float:left; width:513px; height:87px" class="text_all">
        	{if $vars.doc_traned eq 1}
            <div style="float:left; width:62px">Ngày tháng:</div>
            <div style="float:left; width:70px">{$vars.doc_moved|date_format:"%d/%m/%Y"};</div>
            <div style="float:left; width:55px">Nội dung:</div>
            <div style="float:left; width:323px; overflow-y:scroll; height:80px; border:1px solid #99bbe8">
            	<div style="float:left; width:290px; padding:2px">{$vars.doc_note|replace:"\n":"<br>"|str_string_cut:"250":"1"};</div>
            </div>
            {else}
            Chưa có ý kiến tham mưu.
            {/if}
        </div>
    </fieldset>
    
    <!------------------------------------------CHI DAO GIAI QUYET------------------------------------>
    <fieldset style="width:523px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
        <legend class="legend_middle">Chỉ đạo - giải quyết - kết quả:</legend>
        <div style="float:left; height:5px; width:100%"></div>
    	<div class="text_all" style="float:left; width:520px; height:130px; padding:0 0 0 0">
        	{if $total_num_reply gt 0}
            	<div style="float:left; height:20px; width:500px; border-top:1px solid #99bbe8; border-bottom:1px solid #99bbe8 ">
                    <div class="tbl_tit_view" style="width:65px"><B>&nbsp;Ngày</B></div>
                    <div class="tbl_tit_view" style="width:100px"><B>&nbsp;Chuyển từ</B></div>
                    <div class="tbl_tit_view" style="width:165px"><B>&nbsp;Nội dung</B></div>
                    <div class="tbl_tit_view" style="width:100px"><B>&nbsp;Chuyển đến</B></div>
                    <div class="tbl_tit_view" style="width:65px"><B>&nbsp;Hạn xử lý</B></div>
                </div>
                <div style="float:left; width:18px; height:20px">&nbsp;</div>
                <div style="float:left; height:80px; width:517px; overflow-y:scroll">
            	{section name=pi loop=$obj_list_reply}
                    {if $smarty.section.pi.index is not div by 2} 
                    {assign var="class_td" value="tbl_cont_view"} 
                    {else}
                    {assign var="class_td" value="tbl_cont_view2"} 
                    {/if}
                    <div class="{$class_td}" style="width:65px; white-space:nowrap">&nbsp;{$obj_list_reply[pi]->docReply_date|date_format:"%d/%m/%Y"}
                    </div>
                    <div class="{$class_td}" style="width:100px; white-space:nowrap">
                        {section name=qi loop=$obj_list_reply_user}
                        {if $obj_list_reply_user[qi]->user_id eq $obj_list_reply[pi]->user_id}&nbsp;{$obj_list_reply_user[qi]->user_fullname|str_string_cut:"25":"1"}{/if}
                        {/section}
                    </div>
                    <div class="{$class_td}" style="width:165px; white-space:nowrap" title="{$obj_list_reply[pi]->docReply_desc}">
                        &nbsp;{$obj_list_reply[pi]->docReply_desc|str_string_cut:"40":"1"}
                    </div>
                    <div class="{$class_td}" style="width:100px; white-space:nowrap">
                        {if $obj_list_reply[pi]->main_department neq 0}
                            {section name=di loop=$obj_list_department}
                            {if $obj_list_department[di]->department_id eq $obj_list_reply[pi]->main_department}<div style="float:left" title="{$obj_list_department[di]->department_name}">&nbsp;{$obj_list_department[di]->department_name|str_string_cut:"25":"1"}</div>{/if}
                            {/section}
                        {elseif $obj_list_reply[pi]->recevie_per neq 0}
                            {section name=di loop=$obj_list_reply_user}
                            {if $obj_list_reply_user[di]->user_id eq $obj_list_reply[pi]->recevie_per}<div style="float:left" title="{$obj_list_reply_user[di]->user_fullname}">&nbsp;{$obj_list_reply_user[di]->user_fullname|str_string_cut:"25":"1"}</div>{/if}
                            {/section}
                        {else}
                            {section name=di loop=$obj_list_reply_user}
                            {if $obj_list_reply_user[di]->user_id eq $obj_list_reply[pi]->process_per}<div style="float:left" title="{$obj_list_reply_user[di]->user_fullname}">&nbsp;{$obj_list_reply_user[di]->user_fullname|str_string_cut:"25":"1"}</div>{/if}
                            {/section}
                        {/if}
                    </div>
                    <div class="{$class_td}" style="width:65px; white-space:nowrap" title="{$obj_list_reply[pi]->docReply_name}">
                        {if $obj_list_reply[pi]->docReply_limit_time eq '2013-01-01' or $obj_list_reply[pi]->docReply_limit_time eq '1970-01-01'}&nbsp;-{else}&nbsp;{$obj_list_reply[pi]->docReply_limit_time|date_format:"%d-%m-%Y"}{/if}
                    </div>
                {/section}
                </div>
                <div style="float:left; height:5px; width:100%"></div>
                <div style="float:left; height:25px; width:523px; border-top:1px solid #99bbe8">
                	<div style="float:left; width:60px; padding-left:5px">Kết quả:</div>
            		<div style="float:left; width:452px">
                    	{if $vars.doc_active eq 1}
                        	Đã giải quyết | Ngày: {$vars.doc_note_date|date_format:"%d/%m%Y"} {if $vars.doc_theodoi eq 1}(VB trả lời: {$vars.doc_note_code}; ngày {$vars.doc_note_sign_date|date_format:"%d/%m%Y"}){/if}
                        {else}
                        	Chưa giải quyết
                        {/if}
                    </div>
                </div>
            {else}
            Chưa có ý kiến chỉ đạo.
            {/if}
        </div>
    </fieldset>
    </form>
</div>
