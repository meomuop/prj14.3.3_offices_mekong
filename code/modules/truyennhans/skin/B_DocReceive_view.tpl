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
<div id="truyenvb_content_insign">
	<form method="post" name="frmTruyenvb" action="?addReceive{$vars.arg}" id="frmTruyenvb">
    <input type="hidden" value="{$vars.arg}" id="arg" name="arg"/>
    <!------------------------------------------THONG TIN------------------------------------>
    <fieldset style="width:523px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
        <legend class="legend">Thông tin:</legend>
        <div style="float:left; width:513px" class="text_all">
        	<div style="float:left; width:60px">Loại V.Bản:</div>
            <div style="float:left; width:110px" title="{$vars.docCat_id}">{$doc_info.docCat_id|str_string_cut:"18":"1"};</div>
            <div style="float:left; width:62px">Ngày tháng:</div>
            <div style="float:left; width:80px">{$doc_info.doc_signed|date_format:"%d/%m/%Y"};</div>
            <div style="float:left; width:55px">Số K.Hiệu:</div>
            <div style="float:left; width:105px" title="{$doc_info.doc_code}">{$doc_info.doc_code|str_string_cut:"25":"1"};</div>
        </div>
        <div style="float:left; width:513px" class="text_all">
            <div style="float:left; width:60px">Người gửi:</div>
            <div style="float:left; width:110px">{$user_info.user_fullname}</div>
            <div style="float:left; width:60px">Phát hành:</div>
            <div style="float:left; width:280px">{$doc_info.doc_unit|str_string_cut:"80":"1"}</div>
        </div>
        <div style="float:left; width:513px" class="text_all">
        	<div style="float:left; width:60px">Trích yếu:</div>
            <div style="float:left; width:450px">{$doc_info.doc_desc|str_string_cut:"250":"1"}</div>
        </div>
        <div style="float:left; width:513px" class="text_all">
        	<div style="float:left; width:60px">Độ khẩn:</div>
            <div style="float:left; width:110px">
            	{section name=ii loop=$obj_list_important}
                    {if $obj_list_important[ii]->important_id eq $doc_info.important_id}
                    {$obj_list_important[ii]->important_name};
                    {/if}
                {/section}
            </div>
            <div style="float:left; width:62px">Độ mật:</div>
            <div style="float:left; width:80px">
            	{section name=si loop=$obj_list_secret}
                    {if $obj_list_secret[si]->secret_id eq $doc_info.secret_id}
                    {$obj_list_secret[si]->secret_name};
                    {/if}
                {/section}
            </div>
            <div style="float:left; width:55px">Người ký:</div>
            <div style="float:left; width:100px">{$doc_info.signPer_id}</div>
        </div>
    </fieldset>
    
    <!------------------------------------------TEP ITN DINH KEM------------------------------------>
    <fieldset style="width:523px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
        <legend class="legend">Tệp tin đính kèm:</legend>
        <div style="float:left; height:5px; width:100%"></div>
    	<div style="float:left; height:25px; width:505px; border-top:1px solid #99bbe8; border-bottom:1px solid #99bbe8 ">
            <div class="tbl_tit" style="width:30px; text-align:center"><b>STT</b></div>	
            <div class="tbl_tit" style="width:140px"><B>&nbsp;Tên tệp tin</B></div>
            <div class="tbl_tit" style="width:70px; text-align:right"><B>Dung lượng&nbsp;</B></div>
            <div class="tbl_tit" style="width:60px; text-align:right"><B>Kiểu tệp&nbsp;</B></div>
            <div class="tbl_tit" style="width:70px"><B>&nbsp;Ngày tháng</B></div>
            <div class="tbl_tit" style="width:98px"><B>&nbsp;Người đính</B></div>
            <div class="tbl_tit" style="width:30px; text-align:center"><B>Tải</B></div>
        </div>
        <div style="float:left; width:18px; height:25px">&nbsp;</div>
        <div style="float:left; height:90px; width:523px; overflow-y:scroll">
            {section name=pi loop=$obj_list_docfile}
            {if $smarty.section.pi.index is not div by 2} 
            {assign var="class_td" value="tbl_cont"} 
            {else}
            {assign var="class_td" value="tbl_cont2"} 
            {/if}
            {math z=$smarty.section.pi.index t=1 equation="z+t" assign=stt}
            <div style="float:left">
                <div class="{$class_td}" style="width:30px; text-align:center">{$stt}</div>
                <div class="{$class_td}" style="width:140px; white-space:nowrap" title="{$obj_list_docfile[pi]->docFile_name}">
                    &nbsp;<a href='{$obj_list_docfile[pi]->docFile_path}' target="new">{$obj_list_docfile[pi]->docFile_name|str_string_cut:"35":"1"}</a>
                </div>
                <div class="{$class_td}" style="width:70px; text-align:right">
                    {$obj_list_docfile[pi]->docFile_path|file_size} KB&nbsp;
                </div>
                <div class="{$class_td}" style="width:60px; text-align:right">
                    {$obj_list_docfile[pi]->docFile_path|file_type}&nbsp;
                </div>
                <div class="{$class_td}" style="width:70px; white-space:nowrap">
                    &nbsp;{$obj_list_docfile[pi]->docFile_date|date_format:"%d/%m/%Y"}
                </div>
                <div class="{$class_td}" style="width:98px; white-space:nowrap">
                	{section name=ui loop=$obj_list_user_file}
                    	{if $obj_list_user_file[ui]->user_id eq $obj_list_docfile[pi]->user_id}
                    	&nbsp;{$obj_list_user_file[ui]->user_fullname}
                    	{/if}
                    {/section}
                </div>
                <div class="{$class_td}" style="width:30px; text-align:center">
                    <a href='{$obj_list_docfile[pi]->docFile_path}' target="new">
                    <img src="../images/admin/download_icon.png" width="16" height="16" border="0" title="Tải về"></a>
                </div>
            </div>
            {/section}
        </div>
    </fieldset>
    </form>
</div>