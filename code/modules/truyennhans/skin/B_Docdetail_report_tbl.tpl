<form method="post" name="frmList" action="?reportDoc{$vars.arg}" id="frmList">
<div style="padding-bottom: 3px; ">
<table class="adminlist" width="1500" border="0" cellpadding="0" cellspacing="0">
	<tbody>
	<tr>
		<td style="font-family: Arial; color:#930; font-size: 16px; font-weight: bold;" width="30%">
        	<div align="left"><img src="../images/admin/module.png" align="absmiddle" height="30">&nbsp;Báo cáo chi tiết</div>
        </td>	
        <td>
        	<div style="text-align: left; padding-bottom: 3px;">
                <div style="padding-bottom: 3px; ">
                	<div style="float:left; width:80px; padding-top:4px">Ngày nhập </div>
                    <div style="float:left; width:210px">
                    Từ: <input type="text" name="doc_date1" id="doc_date1" value="{$vars.doc_date1}" class="text" style="width:120px"/>
                    &nbsp;<img src="../images/admin/img.gif"  align="absmiddle" id="icon_date01" style="cursor: pointer; border: 0" title="Chọn ngày trên lịch"/>
                    {literal}
					<script type="text/javascript">
                        Calendar.setup({
                            inputField   :   "doc_date1",
                            ifFormat     :   "%d-%m-%Y",
                            button       :   "icon_date01",
                            align        :   "Br",  
                            timeFormat   :   "24",
                            showsTime    :   true,
                            singleClick  :   true
                        });
                    </script>
                    {/literal}
                    </div>
                    <div style="float:left; width:210px">
                    Đến: <input type="text" name="doc_date2" id="doc_date2" value="{$vars.doc_date2}" class="text" style="width:120px"/>
                    &nbsp;<img src="../images/admin/img.gif"  align="absmiddle" id="icon_date02" style="cursor: pointer; border: 0" title="Chọn ngày trên lịch"/>
                    {literal}
					<script type="text/javascript">
                        Calendar.setup({
                            inputField   :   "doc_date2",
                            ifFormat     :   "%d-%m-%Y",
                            button       :   "icon_date02",
                            align        :   "Br",  
                            timeFormat   :   "24",
                            showsTime    :   true,
                            singleClick  :   true
                        });
                    </script>
                    {/literal}
                    </div>
                    <div style="float:left; width:550px; height:10px"></div>
                    <div style="float:left;">   
                        <input type="submit" name="cmdSearch" value="Tìm kiếm" style="width:70px; border-right:1px solid #003451; border-bottom:1px solid #003451; cursor:pointer"/>
                    </div>
                    <div style="float:left; width:550px; height:10px"></div>
                    <div style="float:left; width:450px; padding-top:4px">
                    <a href="?expDetailReport{$vars.arg}&exptype=1">Kết xuất Microsoft Excel (.xls)</a> | <a href="?expDetailReport{$vars.arg}&exptype=3">Kết xuất Microsoft Word (.doc)</a> | <a href="?detailReport{$vars.arg}">Báo cáo chi tiết</a>
                    </div>
                </div>
            </div>
        </td>		
	</tr>
	</tbody>
</table>
</div>
<div style="clear:both">&nbsp;</div>
<table width = "95%" border = "1" align="center" class="adminlist">
	<tr  bgcolor="#EEEEEE" >
		<td rowspan="2" width="5%" align="center" style="background-color:#ffd7ae; border-right:1px solid #003451; border-bottom:1px solid #003451"><font color=#000000><b>STT</b></font></td>		
		<td rowspan="2" align="center" style="background-color:#ffd7ae; border-right:1px solid #003451; border-bottom:1px solid #003451"><font color=#000000><B>Tên đơn vị</B></font></td>
        <td rowspan="2" width="12%" align="center" style="background-color:#ffd7ae; border-right:1px solid #003451; border-bottom:1px solid #003451"><font color=#000000><B>Tổng số văn bản</B></font></td>
        <td colspan="2" width="24%" align="center" style="background-color:#ffd7ae; border-right:1px solid #003451; border-bottom:1px solid #003451"><font color=#000000><B>Tình trạng văn bản</B></font></td>
	</tr>
    <tr>
        <td width="12%" align="center" style="background-color:#ffd7ae; border-right:1px solid #003451; border-bottom:1px solid #003451"><font color=#000000><B>Số đã xem</B></font></td>
        <td width="12%" align="center" style="background-color:#ffd7ae; border-right:1px solid #003451; border-bottom:1px solid #003451"><font color=#000000><B>Số chưa xem</B></font></td>
    </tr>
	{section name=pi loop=$obj_list}
	<tr bgcolor="#FFFF99">
		<td align="center">{math x=$vars.curpage-1 y=$vars.numresult z=$smarty.section.pi.index t=1  equation="x*y+z+t" assign=stt}{$stt}</td>
		
        <td align="left">{$obj_list[pi]->department_name}</td>
                
        <td align="center">
        	{php}
            	$sql_receive="select count(receive_id) as count_receive from tbl_receives where department_id=".$this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->department_id." or receive_per in(select user_id from tbl_users where department_id=".$this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->department_id.")";
                if($this->_tpl_vars['doc_date1']!='') $sql_receive.=" and (receive_time > '".date('Y-m-d',strtotime($this->_tpl_vars['doc_date1']))."' OR receive_time Like '".date('Y-m-d',strtotime($this->_tpl_vars['doc_date1']))."%')";
                if($this->_tpl_vars['doc_date2']!='') $sql_receive.=" and (receive_time < '".date('Y-m-d',strtotime($this->_tpl_vars['doc_date2']))."' OR receive_time Like '".date('Y-m-d',strtotime($this->_tpl_vars['doc_date2']))."%')";
                $result_receive = mysql_query($sql_receive);
                if(mysql_num_rows($result_receive)>0):
                $row_receive=mysql_fetch_array($result_receive);
                echo $row_receive['count_receive'];
                endif;
            {/php}
        </td>
		        
        <td align="center">
        	{php}
            	$sql_read="select count(receive_id) as count_read from tbl_receives where department_id=".$this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->department_id."";
                if($this->_tpl_vars['doc_date1']!='') $sql_read.=" and (receive_time > '".date('Y-m-d',strtotime($this->_tpl_vars['doc_date1']))."' OR receive_time Like '".date('Y-m-d',strtotime($this->_tpl_vars['doc_date1']))."%')";
                if($this->_tpl_vars['doc_date2']!='') $sql_read.=" and (receive_time < '".date('Y-m-d',strtotime($this->_tpl_vars['doc_date2']))."' OR receive_time Like '".date('Y-m-d',strtotime($this->_tpl_vars['doc_date2']))."%')";
                $sql_read.=" and read_status = 1 ";
                $sql_read.=" or receive_id in(select receive_id from tbl_recusers where read_status=1 and user_id in(select user_id from tbl_users where department_id=".$this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->department_id."))";
                $result_read = mysql_query($sql_read);
                if(mysql_num_rows($result_read)>0):
                $row_read=mysql_fetch_array($result_read);
                echo $row_read['count_read'];
                endif;
            {/php}
        </td>
        
        <td align="center">{php}echo $row_receive['count_receive']-$row_read['count_read'];{/php}</td>
        
	</tr>
    <tr>
    	<td colspan="6" align="left" style="background-color:#ffd7ae; border-right:1px solid #003451; border-bottom:1px solid #003451"><font color=#000000><B>Trích yếu các văn bản chưa xem</B></font></td>
    </tr>
    <tr>
    	<td colspan="6" align="left">
        	{php}
            	$sql_desc="select * from doc_receive where department_id=".$this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->department_id."";
                if($this->_tpl_vars['doc_date1']!='') $sql_desc.=" and (receive_time > '".date('Y-m-d',strtotime($this->_tpl_vars['doc_date1']))."' OR receive_time Like '".date('Y-m-d',strtotime($this->_tpl_vars['doc_date1']))."%')";
                if($this->_tpl_vars['doc_date2']!='') $sql_desc.=" and (receive_time < '".date('Y-m-d',strtotime($this->_tpl_vars['doc_date2']))."' OR receive_time Like '".date('Y-m-d',strtotime($this->_tpl_vars['doc_date2']))."%')";
                $sql_desc.=" and read_status = 0 ";
                $sql_desc.=" or receive_id in(select receive_id from tbl_recusers where read_status=0 and user_id in(select user_id from tbl_users where department_id=".$this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->department_id."))";
                $result_desc = mysql_query($sql_desc);
                if(mysql_num_rows($result_desc)>0):
                while($row_desc=mysql_fetch_array($result_desc)):
                	echo '- '.str_replace("\\","",$row_desc['doc_desc']).'<br /><br />';
                endwhile;
                endif;
            {/php}
        </td>
    </tr>
    <tr>
    	<td colspan="6" align="left">&nbsp;</td>
    </tr>
	{/section}
</table>
<div style="clear:both"><img src='../images/admin/spacer.gif' height="10px" /></div>
</form>