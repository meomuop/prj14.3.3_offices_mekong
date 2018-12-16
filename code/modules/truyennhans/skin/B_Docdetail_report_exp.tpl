<div id="tnvb_report_content_insign">
    <!------------------------------------KET QUA KET XUAT---------------------------------------------->
    <div style="float:left; width:658px; height:415px; overflow-y:auto; margin:2px; font-size:12px">
    <div style="float:left; width:636px; height:405px; font-family:'Times New Roman', Times, serif" id="div_cont_print">
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
    <table style="width:640px" border="0" cellpadding="0" cellspacing="0" align="center" class="tbl_cont">
        <tr>
            <td align="center">
                <table width="100%" border="0" cellspacing="0" cellpadding="0" style="border:none">
                  <tr height="30">
                    <td align="center" width="30%" style="border:none">
                    <font color=#000000 style="font-size:13px; font-weight:bold">
                    {$obj_owner[0]->owner_name}</font></td>
                  </tr>
                  <tr height="30">
                    <td align="center" style="border:none">
                    <font color=#000000 style="font-size:13px; font-weight:bold">
                    <B>BÁO CÁO KẾT QUẢ CHUYỂN NHẬN VĂN BẢN CHI TIẾT</B></font></td>
                  </tr>
                  <tr>
                    <td align="left" style="line-height:20px; font-weight:bold;border:none">
                    {if $tungay neq ''} |&nbsp;Từ ngày {$tungay|date_format:"%d-%m-%Y"}{/if}
            		{if $denngay neq ''} -&nbsp;Đến ngày {$denngay|date_format:"%d-%m-%Y"}{/if}
                    </td>
                  </tr>
                </table>
            </td>
        </tr>
        <tr>
        	<td align="center">
            	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                  	<tr bgcolor="#ccd8e7">
                        <td rowspan="2" width="5%" align="center"><font color=#000000><b>STT</b></font></td>		
                        <td rowspan="2" align="center"><font color=#000000><B>Tên đơn vị</B></font></td>
                        <td rowspan="2" width="12%" align="center"><font color=#000000><B>Tổng số văn bản</B></font></td>
                        <td colspan="2" width="24%" align="center"><font color=#000000><B>Tình trạng văn bản</B></font></td>
                    </tr>
                    <tr bgcolor="#ccd8e7">
                        <td width="12%" align="center"><font color=#000000><B>Số đã xem</B></font></td>
                        <td width="12%" align="center"><font color=#000000><B>Số chưa xem</B></font></td>
                    </tr>
                    {section name=pi loop=$obj_list}
                    <tr bgcolor="#FFFF99">
                        <td align="center">{math x=$vars.curpage-1 y=$vars.numresult z=$smarty.section.pi.index t=1  equation="x*y+z+t" assign=stt}{$stt}</td>
                        
                        <td align="left">{$obj_list[pi]->department_name}</td>
                        
                        <td align="center">
                            {php}
                                $sql_receive="select COUNT(DISTINCT doc_id) as count_receive from tbl_receives where department_id=".$this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->department_id." or receive_per in(select user_id from tbl_users where department_id=".$this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->department_id.")";
                                if($this->_tpl_vars['doc_date1']!='') $sql_receive.=" and receive_time >= '".date('Y-m-d',strtotime($this->_tpl_vars['doc_date1']))."'";
                                if($this->_tpl_vars['doc_date2']!='') $sql_receive.=" and receive_time <= '".date('Y-m-d',strtotime($this->_tpl_vars['doc_date2']))."'";
                                $result_receive = mysql_query($sql_receive);
                                if(mysql_num_rows($result_receive)>0):
                                $row_receive=mysql_fetch_array($result_receive);
                                echo $row_receive['count_receive'];
                                endif;
                            {/php}
                        </td>
                                
                        <td align="center">
                            {php}
                                $sql_read="select COUNT(DISTINCT doc_id) as count_read from tbl_receives where department_id=".$this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->department_id."";
                                if($this->_tpl_vars['doc_date1']!='') $sql_read.=" and receive_time >= '".date('Y-m-d',strtotime($this->_tpl_vars['doc_date1']))."'";
                                if($this->_tpl_vars['doc_date2']!='') $sql_read.=" and receive_time <= '".date('Y-m-d',strtotime($this->_tpl_vars['doc_date2']))."'";
                                $sql_read.=" and read_status = 1 ";
                                $sql_read.=" or receive_id in(select receive_id from tbl_recusers where read_status=1 and user_id in(select user_id from tbl_users where department_id=".$this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->department_id."))";
                                //echo $sql_read;
                                $result_read = mysql_query($sql_read);
                                if(mysql_num_rows($result_read)>0):
                                $row_read=mysql_fetch_array($result_read);
                                echo $row_read['count_read'];
                                endif;
                            {/php}
                        </td>
                        
                        <td align="center">{php}echo $row_receive['count_receive']-$row_read['count_read'];{/php}</td>
                        
                    </tr>
                    <tr bgcolor="#ccd8e7">
                        <td colspan="6" align="left"><font color=#000000><B>Trích yếu các văn bản chưa xem</B></font></td>
                    </tr>
                    <tr>
                        <td colspan="6" align="left">
                            {php}
                                $sql_desc="select * from doc_receive where R_department_id=".$this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->department_id."";
                                if($this->_tpl_vars['doc_date1']!='') $sql_desc.=" and receive_time >= '".date('Y-m-d',strtotime($this->_tpl_vars['doc_date1']))."'";
                                if($this->_tpl_vars['doc_date2']!='') $sql_desc.=" and receive_time <= '".date('Y-m-d',strtotime($this->_tpl_vars['doc_date2']))."'";
                                $sql_desc.=" and read_status = 0 ";
                                $sql_desc.=" and receive_id in(select receive_id from tbl_recusers where read_status=0 and user_id in(select user_id from tbl_users where department_id=".$this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->department_id."))";
                                $sql_desc.=" GROUP BY doc_id";
                                //echo $sql_desc;
                                $result_desc = mysql_query($sql_desc);
                                if(mysql_num_rows($result_desc)>0):
                                while($row_desc=mysql_fetch_array($result_desc)):
                                    echo '- '.str_replace("\\","",$row_desc['doc_desc']).'<br /><br />';
                                endwhile;
                                endif;
                            {/php}
                        </td>
                    </tr>
                    {/section}
                </table>
            </td>
        </tr>
        <tr>
            <td align="center">
            	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="60%">&nbsp;</td>
                    <td align="center" height="80">
                    	Hà Nội, ngày {$smarty.now|date_format:"%d"} tháng {$smarty.now|date_format:"%m"} năm {$smarty.now|date_format:"%Y"}<br />
                        Người làm báo cáo<br />
                        {$access_object_name}<br /><br /><br /><br /><br />
                        {$access_user_fullname}
                    </td>
                  </tr>
                </table>
            </td>
        </tr>
    </table>
    </div>
    </div>
</div>