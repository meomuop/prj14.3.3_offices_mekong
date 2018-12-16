<div id="doc_report_content_insign">
    <!------------------------------------KET QUA KET XUAT---------------------------------------------->
    <div style="float:left; width:1058px; height:385px; overflow-y:auto; margin:2px; font-size:12px">
    <div style="float:left; width:1036px; height:375px" id="div_cont_print">
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
    <table style="width:1040px" border="0" cellpadding="0" cellspacing="0" align="center" class="tbl_cont">
        <tr>
            <td colspan="11">
                <table width="100%" border="0" cellspacing="0" cellpadding="0" style="border:none">
                  <tr height="30">
                    <td align="center" width="30%" style="border:none">
                    <font color=#000000 style="font-size:16px; font-weight:bold">
                    {$obj_owner[0]->owner_name}</font></td>
                  </tr>
                  <tr height="30">
                    <td align="center" style="border:none">
                    <font color=#000000 style="font-size:16px; font-weight:bold">
                    <B>BÁO CÁO VĂN BẢN ĐẾN CHẬM GIẢI QUYẾT</B></font></td>
                  </tr>
                  <tr>
                    <td align="left" style="line-height:20px; font-weight:bold;border:none">
                    {if $tungay neq ''}- Từ ngày {$tungay|date_format:"%d-%m-%Y"}{/if}
                    {if $denngay neq ''}đến ngày {$denngay|date_format:"%d-%m-%Y"}{/if}
                    
                    {if $soden_tu neq ''}<br />- Từ số {$soden_tu}{/if} 
                    {if $soden_den neq ''}đến số {$soden_den}{/if}
                    
                    {if $docCat_id_fil neq ''}
                    <br />- Loại văn bản: {$docCat_id_fil}{/if}
                    
                    {if $obj_depart->department_name neq ''}
                    <br />- ĐV giải quyết: {$obj_depart->department_name}{/if}
                    
                    {if $unit_name_fil neq ''}
                    <br />- Nơi phát hành: {$unit_name_fil}{/if}
                    </td>
                  </tr>
                </table>
            </td>
        </tr>
        <tr bgcolor="#ccd8e7" height="25">
            <td width="6%" align="left" ><B>Ngày nhận</B></td>
            <td width="5%" align="right" ><B>Số đến</B></td>	
            <td width="12%" align="left" ><B>Cơ quan ban hành</B></td>
            <td width="6%" align="left" ><B>Số ký hiệu</B></td>
            <td width="6%" align="left" ><B>Ngày ký</B></td>
            <td width="7%" align="left" ><B>Loại văn bản</B></td>
            <td align="left"><B>Trích yếu</B></td>
            <td width="10%" align="left" ><B>Người ký</B></td>
            {if $user_level eq 6 or $user_level eq 7 or $user_level eq 8}
            <td width="10%" align="left" ><B>Tình trạng</B></td>
            {else}
            <td width="10%" align="left" ><B>LĐ chỉ đạo</B></td>
            <td width="10%" align="left" ><B>ĐV Giải quyết</B></td>
            <td width="10%" align="left" ><B>Số ngày chậm</B></td>
            {/if}
            {if $user_level eq 6 or $user_level eq 7 or $user_level eq 8}<td width="10%" align="center" ><B>Trực tiếp giải quyết</B></td>{/if}
        </tr>
        {php}$totalheight = 0;$stt=0;{/php}
        {section name=pi loop=$obj_list}    
        {math a=$obj_list[pi]->doc_desc|format_ununicode:false|string_len equation="a" assign=strlen}
        {php}
    
        $trheight	 = (round(($this->_tpl_vars['strlen']/60)*15))+4; //tuyet doi khong sua cac file css chua do cao va k/c dong
        if($trheight<32) $trheight=32;
        $addtrheight=0;
        //echo $totalheight.'+='.$trheight.'<br>';
        $totalheight += $trheight;
        if($stt==0)$addheight=85;
        else $addheight=0;
        if($totalheight>777-$addheight):
        $addtrheight=(777-$addheight+$trheight)-$totalheight;
        //echo $addtrheight.'=(715-'.$addheight.'+'.$trheight.')-'.$totalheight.'->'.$this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->doc_num.'<br>';
        $totalheight=$trheight;
        $stt=1;
        endif;
        {/php}
        <tr {if $smarty.section.pi.index is not div by 2} bgcolor="#F2FFEC" {/if} {php}if($addtrheight>0):{/php}style="height:32px; border-top:{php}echo $addtrheight;{/php}px solid #fff"{php}endif;{/php}>
            <td align="left">{$obj_list[pi]->doc_recevied|date_format:"%d/%m/%Y"}</td>
            <td align="right">{$obj_list[pi]->doc_num}</td> 
            <td align="left">{$obj_list[pi]->unit_name}</td>
            <td align="left">{$obj_list[pi]->doc_code}</td>
            <td align="left">{$obj_list[pi]->doc_signed|date_format:"%d/%m/%Y"}</td>
            <td align="left">{$obj_list[pi]->docCat_id}</td>
            <td align="left">{$obj_list[pi]->doc_desc}</td>
            <td align="left">{$obj_list[pi]->signPer_id}&nbsp;</td>
            {if $user_level eq 6 or $user_level eq 7 or $user_level eq 8}
            <td align="left">{if $obj_list[pi]->doc_active eq 1}Đã giải quyết{else}Đang giải quyết{/if}&nbsp;</td>
            {else}
            <td align="left">
            {if $user_level eq 2}
            {php}
                $sql="SELECT recevie_per FROM tbl_docreplys WHERE doc_id = ".$this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->doc_id." AND recevie_per in(SELECT user_id from tbl_users WHERE user_level in(4,5)) ORDER BY docReply_id DESC LIMIT 1";
                $result = mysql_query($sql);
                if(mysql_num_rows($result)>0):
                    $row=mysql_fetch_array($result);
                    $sql_user="SELECT * FROM tbl_users WHERE user_id = ".$row['recevie_per']."";
                    $result_user = mysql_query($sql_user);
                    if($result_user):
                    $row_user=mysql_fetch_array($result_user);
                    echo $row_user['user_fullname'];
                    endif;
                else:
                    $sql="SELECT * FROM tbl_users WHERE user_id = ".$this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->user_id." ORDER BY user_id DESC LIMIT 1";
                    $result = mysql_query($sql);
                    if($result):
                    $row=mysql_fetch_array($result);
                        echo $row['user_fullname'];
                    endif;
                endif;
            {/php}
            {else}
            {php}
                if($this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->recevie_per!=0):
                    $sql_user="SELECT * FROM tbl_users WHERE user_id = ".$this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->recevie_per."";
                    $result_user = mysql_query($sql_user);
                    if($result_user):
                    $row_user=mysql_fetch_array($result_user);
                    echo $row_user['user_fullname'];
                    endif;
                else:
                    $sql="SELECT * FROM tbl_users WHERE user_id = ".$this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->user_id." ORDER BY user_id DESC LIMIT 1";
                    $result = mysql_query($sql);
                    if($result):
                    $row=mysql_fetch_array($result);
                        echo $row['user_fullname'];
                    endif;
                endif;
            {/php}
            {/if}&nbsp;
            </td>
            <td align="left">
            {php}
                $sql="SELECT main_department FROM tbl_docreplys WHERE doc_id = ".$this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->doc_id." AND process_per=0 ORDER BY docReply_id DESC LIMIT 1 ";
                $result = mysql_query($sql);
                if($result):
                $row=mysql_fetch_array($result);
                    $sql_depa="SELECT * FROM tbl_departments WHERE department_id = ".$row['main_department']."";
                    $result_depa = mysql_query($sql_depa);
                    if($result_depa):
                    $row_depa=mysql_fetch_array($result_depa);
                    echo $row_depa['department_name'];
                    endif;
                endif;
            {/php}&nbsp;
            </td>
            <td align="center">
                {php}
                    $docReply_limit_time = $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docReply_limit_time;
                    $hanxuly = strtotime($docReply_limit_time);
                    $doc_note_date = $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->doc_note_date;
                    $ngayxuly = strtotime(doc_note_date);
                    if($doc_note_date == '0000-00-00'){
                        echo (strtotime(date('Y-m-d'))-$hanxuly)/(24*60*60).' Ngày<br><i>('.(strtotime(date('Y-m-d'))-$hanxuly)/(24*60*60).'%)</i>';
                    }else{
                        echo ($hanxuly-$ngayxuly)/(24*60*60).' Ngày<br><i>('.($hanxuly-$ngayxuly)/(24*60*60).'%)</i>';
                    }
                {/php}
            </td>
            {/if}
            {if $user_level eq 6 or $user_level eq 7 or $user_level eq 8}
            <td align="left">
                {php}
                 $sql="SELECT process_per FROM tbl_docreplys WHERE doc_id = ".$this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->doc_id." ORDER BY docReply_id DESC LIMIT 1 ";
                $result = mysql_query($sql);
                if($result):
                    $row=mysql_fetch_array($result);
                    $sql_u="SELECT user_fullname FROM tbl_users WHERE user_id = ".$row['process_per']."";
                    $result_u = mysql_query($sql_u);
                    if($result_u):
                        $row_u=mysql_fetch_array($result_u);
                        echo $row_u['user_fullname'];
                    endif;
                endif;
                {/php}&nbsp;
            </td>
            {/if}
        </tr>    
        {/section}
        <tr>
            <td colspan="11" align="center" style="font-weight:bold">
                Tổng số văn bản: {$total_num_result}
            </td>
        </tr>
        <tr>
            <td colspan="8" align="right">&nbsp;</td>
            <td colspan="3" align="center" height="80">
                Hà Nội, ngày {$smarty.now|date_format:"%d"} tháng {$smarty.now|date_format:"%m"} năm {$smarty.now|date_format:"%Y"}<br />
                Người làm báo cáo<br />
                {$access_object_name}<br /><br /><br /><br /><br />
                {$access_user_fullname}
            </td>
        </tr>
    </table>
    </div>
    </div>
</div>