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
    <fieldset style="width:555px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
        <legend class="legend">Thông tin:</legend>
        <input type="hidden" value="{$access_department_name}" id="doc_unit" name="doc_unit"/>
        <input type="hidden" value="{$doc_info.signPer_id}" id="signPer_id" name="signPer_id"/>
        <input type="hidden" value="{$doc_info.doc_id}" id="doc_id" name="doc_id"/>
        <input type="hidden" value="{$doc_info.doc_signed}" id="doc_signed" name="doc_signed"/>
        <input type="hidden" value="{$doc_info.docField_id}" id="docField_id" name="docField_id"/>
        <input type="hidden" value="{$doc_info.doc_code}" id="doc_code" name="doc_code"/>
        <input type="hidden" value="{$doc_info.important_id}" id="important_id" name="important_id"/>
        <input type="hidden" value="{$doc_info.secret_id}" id="secret_id" name="secret_id"/>
        <input type="hidden" value="{$doc_info.docCat_id}" id="docCat_id" name="docCat_id"/>
        <input type="hidden" value="{$doc_info.doc_desc}" id="doc_desc" name="doc_desc"/>
        <input type="hidden" value="{$doc_info.doc_note}" id="doc_direct" name="doc_direct"/>
    	<div style="float:left; width:545px; height:35px; overflow-x:scroll; white-space:nowrap" class="text_all">
        	Số K.Hiệu: {$doc_info.doc_code}; 
            Các tệp tin:
            <input type="hidden" name="docfile_name" id="docfile_name" value="0_tmp">
            <input type="hidden" name="docfile_path" id="docfile_path" value="0_tmp">
            {section name=pi loop=$obj_list_docfile}
            	[<a href='{$obj_list_docfile[pi]->docFile_path}' target="new">
                {$obj_list_docfile[pi]->docFile_name}</a>], 
                <input type="hidden" name="docfile_name" id="docfile_name" value="{$obj_list_docfile[pi]->docFile_name}">
                <input type="hidden" name="docfile_path" id="docfile_path" value="{$obj_list_docfile[pi]->docFile_path}">
            {/section}
        </div>
        <input type="hidden" name="tnvb_docfile_name_str" id="tnvb_docfile_name_str" value="">
        <input type="hidden" name="tnvb_docfile_path_str" id="tnvb_docfile_path_str" value="">
    </fieldset>
    
    <!------------------------------------------DANH SACH DON VI------------------------------------>
    <fieldset style="width:555px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
         <legend class="legend" style="width:495px;">
         <div style="float:left; width:50px;">Nơi nhận</div>
         <div style="float:left; width:105px;">
         	<select name="depart_cat" id="depart_cat" class="select_short">
                <option value="0">Tất cả</option>
            </select>
         </div>
         <div style="float:left; width:170px; margin-top:2px">
            <input type="button" name="Edit_TNVB" id="Edit_TNVB" value="Sửa lại" class="button"/>
            <input type="button" name="Finish_TNVB" id="Finish_TNVB" value="Kết thúc" class="button"/>
            <input type="hidden" name="com_port" value="{$obj_owner[0]->site_port}">
            <input type="hidden" name="department_array" id="department_array" value="">	
         </div>
         <div style="float:left; width:165px; margin-top:2px">
            &nbsp;
         </div>
         </legend>
         <div style="float:left; height:5px; width:100%"></div>
         <div style="float:left; height:25px; width:537px; border-top:1px solid #99bbe8; border-bottom:1px solid #99bbe8 ">
            <div class="tbl_tit" style="width:30px; text-align:center"><b>-</b></div>	
            <div class="tbl_tit" style="width:165px"><B>&nbsp;Tên phòng ban</B></div>
            <div class="tbl_tit" style="width:132px"><B>&nbsp;Người nhận</B></div>
            <div class="tbl_tit" style="width:30px"><B>&nbsp;SMS</B></div>
            <div class="tbl_tit" style="width:175px"><B>&nbsp;Ghi chú</B></div>
        </div>
        <div style="float:left; width:18px; height:25px">&nbsp;</div>
        <div style="float:left; height:290px; width:555px; overflow-y:scroll">
            {section name=qi loop=$obj_list_department}
            {if $smarty.section.qi.index is not div by 2} 
            {assign var="class_td" value="tbl_cont"} 
            {else}
            {assign var="class_td" value="tbl_cont2"} 
            {/if}
            <div style="float:left">
                <div class="{$class_td}" style="width:30px; text-align:center">-</div>
                <div class="{$class_td}" style="width:165px; white-space:nowrap" title="{$obj_list_department[qi]->department_name}">
                    &nbsp;{$obj_list_department[qi]->department_name|str_string_cut:"35":"1"}
                </div>
                <div class="{$class_td}" style="width:132px; text-align:left">&nbsp;
                     {php}
                        $sql="select * from tbl_users where user_id in(select receive_per from tbl_receives where department_id =".$this->_tpl_vars['obj_list_department'][$this->_sections['qi']['index']]->department_id." and doc_id=".$this->_tpl_vars['doc_id'].")";
                        $result = mysql_query($sql);
                        if(mysql_num_rows($result)>0):
                        $row=mysql_fetch_array($result);
                    		echo $row['user_fullname'];
                        else:
                        	echo 'Cả phòng';
                        endif;
                    {/php}
                </div>
                <div class="{$class_td}" style="width:30px; text-align:center">
                	{php}
                        $sql="select * from tbl_receives where department_id =".$this->_tpl_vars['obj_list_department'][$this->_sections['qi']['index']]->department_id." and doc_id=".$this->_tpl_vars['doc_id'];
                        $result = mysql_query($sql);
                        if(mysql_num_rows($result)>0):
                        $row=mysql_fetch_array($result);
                    		if($row['receive_sms']==1) echo 'C'; else echo 'K';
                        endif;
                    {/php}
                </div>
                {php}
                    $sql="select * from tbl_receives where department_id =".$this->_tpl_vars['obj_list_department'][$this->_sections['qi']['index']]->department_id." and doc_id=".$this->_tpl_vars['doc_id'];
                    $result = mysql_query($sql);
                    if(mysql_num_rows($result)>0):
                    $row=mysql_fetch_array($result);
                {/php}
                <div class="{$class_td}" style="width:175px; text-align:left" title="{php}echo $row['receive_note']{/php}">&nbsp;{php}echo fnsSubstr($row['receive_note'],40,1);{/php}</div>
                {php}endif;{/php}
            </div>
            {/section}
            <input type="hidden" name="tnvb_depart_str" id="tnvb_depart_str" value="">
            <input type="hidden" name="tnvb_rec_per_str" id="tnvb_rec_per_str" value="">
            <input type="hidden" name="tnvb_rec_sms_str" id="tnvb_rec_sms_str" value="">
            <input type="hidden" name="tnvb_rec_note_str" id="tnvb_rec_note_str" value="">
        </div>
    </fieldset>
    </form>
</div>