<form method="post" name="frmList" action="?searchDoc{$vars.arg}" id="frmList">
<div style="padding-bottom: 3px; ">
<table class="adminlist" width="100%" border="0" cellpadding="0" cellspacing="0">
	<tbody>
	<tr>
		<td style="font-family: Arial; color:#930; font-size: 16px; font-weight: bold;" width="50%">
        	<div align="left"><img src="../images/admin/module.png" align="absmiddle" height="30">&nbsp;Danh sách văn bản</div>
        </td>	
        <td style="font-family: Arial; color:#000; font-size: 16px; font-weight: bold;">
        	<div style="text-align: left; padding-bottom: 3px;">
                Tìm kiếm văn bản
            </div>
        </td>		
	</tr>
    <tr>
        <td colspan="2">
        	<table class="adminlist" width="95%" style="background-color:#f2eee0">
                <tr>
                    <td align="center">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                           <td width="15%" align="left" height="20">
                            <font class="label_font" color="#425E89">Loại văn bản *:</font></td>		
                            <td align="left">
                            <input type="text" style="width: 200px;" value="{$vars.docCat_id}" id="docCat_id" name="docCat_id" class="ac_input"/>
                            </td>
                            {literal}
                            <script type="text/javascript">
                              function findValue(li) {
                                if( li == null ) return alert("No match!");
                                if( !!li.extra ) var sValue = li.extra[0];
                                else var sValue = li.selectValue;
                              }
                            
                              function selectItem(li) {
                                    findValue(li);
                              }
                            
                              function formatItem(row) {
                                    return row[0];
                              }
                            
                              function lookupAjax(){
                                var oSuggest = $("#docCat_id")[0].autocompleter;
                                oSuggest.findValue();
                                return false;
                              }
                            
                              function lookupLocal(){
                                    var oSuggest = $("#CityLocal")[0].autocompleter;
                            
                                    oSuggest.findValue();
                            
                                    return false;
                              }
                              
                                $("#docCat_id").autocomplete(
                                  "B_docCat_auto.php",
                                  {
                                        delay:10,
                                        minChars:1,
                                        matchSubset:1,
                                        matchContains:1,
                                        cacheLength:10,
                                        onItemSelect:selectItem,
                                        onFindValue:findValue,
                                        formatItem:formatItem,
                                        autoFill:true
                                    }
                                );
                            </script>
                            {/literal}
                            <td width="15%" align="left" height="20">
                            <font class="label_font" color="#425E89">Số ký hiệu *:</font></td>		
                            <td align="left" width="35%">
                            <input type="text" id="doc_code" name="doc_code"  style="width:200px" value="{$vars.doc_code}"/>
                            </td>
                          </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="15%" align="left" height="20">
                            <font class="label_font" color="#425E89">Người ký *:</font></td>		
                            <td align="left">
                            <input type="text" style="width: 200px;" value="{$vars.signPer_id}" id="signPer_id" class="ac_input" name="signPer_id"/>
                            </td>
                            {literal}
                            <script type="text/javascript">
                              function findValue(li) {
                                if( li == null ) return alert("No match!");
                                if( !!li.extra ) var sValue = li.extra[0];
                                else var sValue = li.selectValue;
                              }
                            
                              function selectItem(li) {
                                    findValue(li);
                              }
                            
                              function formatItem(row) {
                                    return row[0];
                              }
                            
                              function lookupAjax(){
                                var oSuggest = $("#signPer_id")[0].autocompleter;
                                oSuggest.findValue();
                                return false;
                              }
                            
                              function lookupLocal(){
                                    var oSuggest = $("#CityLocal")[0].autocompleter;
                            
                                    oSuggest.findValue();
                            
                                    return false;
                              }
                              
                                $("#signPer_id").autocomplete(
                                  "B_signPer_auto.php",
                                  {
                                        delay:10,
                                        minChars:1,
                                        matchSubset:1,
                                        matchContains:1,
                                        cacheLength:10,
                                        onItemSelect:selectItem,
                                        onFindValue:findValue,
                                        formatItem:formatItem,
                                        autoFill:true
                                    }
                                );
                            </script>
                            {/literal}
                            <td width="15%" align="left" height="20">
                            <font class="label_font" color="#425E89">Ngày ký *:</font></td>		
                            <td align="left">
                            <input type="text" name="doc_signed" id="doc_signed" value="{$vars.doc_signed}" maxlength="250" class="text" style="width:167px"/>
                            &nbsp;
                            <img src="../images/admin/img.gif"  align="absmiddle" id="icon_date01" style="cursor: pointer; border: 0" title="Chọn ngày trên lịch"/>
                            </td>
                            {literal}
                            <script type="text/javascript">
                                Calendar.setup({
                                    inputField   :   "doc_signed",
                                    ifFormat     :   "%d-%m-%Y",
                                    button       :   "icon_date01",
                                    align        :   "Br",  
                                    timeFormat   :   "24",
                                    showsTime    :   true,
                                    singleClick  :   true
                                });
                            </script>
                            {/literal}
                          </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td align="left" height="20" width="476px">
                                <font class="label_font" color="#425E89">Trích yêu *:</font></td>
                                <td align="left">
                                	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td align="left" height="20" width="30%">
                                            <font class="label_font" color="#425E89">Ngày nhập *:</font></td>
                                            <td align="left">
                                               <input type="text" name="doc_recevied" id="doc_recevied" value="{$vars.doc_recevied}" maxlength="250" class="text" style="width:167px"/>
                                            &nbsp;
                                            <img src="../images/admin/img.gif"  align="absmiddle" id="icon_date02" style="cursor: pointer; border: 0" title="Chọn ngày trên lịch"/>
                                            </td>
                                            {literal}
                                            <script type="text/javascript">
                                                Calendar.setup({
                                                    inputField   :   "doc_recevied",
                                                    ifFormat     :   "%d-%m-%Y",
                                                    button       :   "icon_date02",
                                                    align        :   "Br",  
                                                    timeFormat   :   "24",
                                                    showsTime    :   true,
                                                    singleClick  :   true
                                                });
                                            </script>
                                            {/literal}
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" colspan="2">
                                <textarea name="doc_desc" cols="10" rows="10" style="width:827px; height:40px">{$vars.doc_desc}</textarea>
                                </td>
                            </tr>
                         </table>
                    </td>
                </tr>
				<tr>
                	<td align="left">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="15%" align="left" height="20">
                            <font class="label_font" color="#425E89">Loại văn bản*:</font></td>		
                            <td align="left" width="15%" >
                            <input type="radio" value="1" name="doc_type" checked /> Văn bản đến 
                            </td>
                            <td align="left">
                            <input type="radio" value="2" name="doc_type" /> Văn bản đi
                            </td>
                          </tr>
                        </table>
					</td>
              	</tr>
              	<tr>
                	<td align="center"><input type="submit" name="cmdSearch" value="Tìm kiếm" style="width:70px; border-right:1px solid #003451; border-bottom:1px solid #003451; cursor:pointer"/></td>
              	</tr>
             </table>
        </td>		
	</tr>
	</tbody>
</table>
</div>
{if $doc_type eq 1}
<table width="95%" border="1" align="center" class="adminlist">
	<tr  bgcolor="#EEEEEE" >
		<td width="5%" align="center" style="background-color:#ffd7ae; border-right:1px solid #003451; border-bottom:1px solid #003451"><font class="label_font" color="#000000"><b>STT</b></font></td>	
        <td width="5%" align="center" style="background-color:#ffd7ae; border-right:1px solid #003451; border-bottom:1px solid #003451"><font class="label_font" color="#000000"><B>Xem</B></font></td>
        <td width="20%" align="center" style="background-color:#ffd7ae; border-right:1px solid #003451; border-bottom:1px solid #003451"><font class="label_font" color="#000000"><B>Loại VB/Số KH/Độ khẩn</B></font></td>
        <td align="center" style="background-color:#ffd7ae; border-right:1px solid #003451; border-bottom:1px solid #003451"><font class="label_font" color="#000000"><B>Trích yếu</B></font></td>
        <td width="10%" align="center" style="background-color:#ffd7ae; border-right:1px solid #003451; border-bottom:1px solid #003451"><font class="label_font" color="#000000"><B>Thời gian</B></font></td>
        <td width="12%" align="center" style="background-color:#ffd7ae; border-right:1px solid #003451; border-bottom:1px solid #003451"><font class="label_font" color="#000000"><B>Nơi gửi</B></font></td>
        <td width="12%" align="center" style="background-color:#ffd7ae; border-right:1px solid #003451; border-bottom:1px solid #003451"><font class="label_font" color="#000000"><B>Lĩnh vực</B></font></td>
        <td width="18%" align="center" style="background-color:#ffd7ae; border-right:1px solid #003451; border-bottom:1px solid #003451"><font class="label_font" color="#000000"><B>Tình trạng</B></font></td>
	</tr>
    {if $obj_list}
	{section name=pi loop=$obj_list}
	<tr {if $smarty.section.pi.index is not div by 2} bgcolor="#F2FDCC" {/if} >
		<td align="center">{math z=$smarty.section.pi.index t=1  equation="z+t" assign=stt}{$stt}</td>
		        
        <td align="center"><a href="?viewDocReceive&doc_id={$obj_list[pi]->doc_id}{$vars.arg}" style="color:#F00; font-weight:bold">Xem</a></td>
                
        <td align="left">
        -&nbsp;{$obj_list[pi]->docCat_id}<br />
        -&nbsp;{$obj_list[pi]->doc_code}<br />
        -&nbsp;	
        {section name=ii loop=$obj_list_important}
        {if $obj_list[pi]->important_id eq $obj_list_important[ii]->important_id}
        		{$obj_list_important[ii]->important_name}
        		{/if}
        {/section}
        </td> 
        
        <td align="left">{$obj_list[pi]->doc_desc}</td>
                
        <td align="center">{$obj_list[pi]->doc_date|date_format:"%d-%m-%Y %H:%M"}</td>
        
        <td align="left">{$obj_list[pi]->doc_unit}</td>
        
        <td align="left">{$obj_list[pi]->docField_id}</td>
        
        <td align="left">
        {if $obj_list[pi]->read_status eq 1}
        	<font color="#0000FF">Đã xem<br />
            {$obj_list[pi]->read_time|date_format:"%d-%m-%Y %H:%M"}</font>
        {else}
        {php}
        	$sql="select * from tbl_recusers where 1=1 and user_id = ".$_SESSION['user_id']." and receive_id in(select receive_id from tbl_receives where doc_id=".$this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->doc_id.")";
            $result = mysql_query($sql);
            if(mysql_num_rows($result)>0):
            $row=mysql_fetch_array($result);
            	if($row['read_status']==1)
            	echo "<font color='#0000FF' style='font-size:12px'>Đã xem <br />".$row['read_time']."</font>";
                else echo "<font color='#000000' style='font-size:12px'><b>chưa xem</b></font>";
            endif;
        {/php}
		<hr size="1" width="100%">
		<span style='font-size:12px'>Những người đã xem:</span><br>
		{php}
        	$sql="select user_id from tbl_recusers where read_status = 1 and user_id in(select user_id from tbl_users where department_id = ".$_SESSION['access_department_id'].") and receive_id in(select receive_id from tbl_receives where doc_id=".$this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->doc_id.")";
			$result = mysql_query($sql);
            if(mysql_num_rows($result)>0):
				$i=1;
				while($row = mysql_fetch_array($result)):
					$sql_us = "select user_fullname from tbl_users where user_id = ".$row['user_id'];
					$result_us = mysql_query($sql_us);
					while($row_us = mysql_fetch_array($result_us)):
						echo "<font color='#0000FF' style='font-size:12px'>".$i.". ".$row_us['user_fullname']."</font><br>";
					endwhile;
					$i++;
				endwhile;
            endif;
        {/php}
        {/if}
        </td>
	</tr>
	{/section}
    {else}
    <tr>
		<td colspan="8" style="text-align:left">Không có văn bản nào</td>
	</tr>
    {/if}
</table>
{/if}
{if $doc_type eq 2}
<div style="clear:both">&nbsp;</div>
<table width = "95%" border = "1" align="center" class="adminlist">
	<tr  bgcolor="#EEEEEE" >
		<td width="5%" align="center" style="background-color:#ffd7ae; border-right:1px solid #003451; border-bottom:1px solid #003451"><font class="label_font" color="#000000"><b>STT</b></font></td>	
        <td width="8%" align="center" style="background-color:#ffd7ae; border-right:1px solid #003451; border-bottom:1px solid #003451"><font class="label_font" color="#000000"><B>VB liên quan</B></font></td>
        <td width="8%" align="center" style="background-color:#ffd7ae; border-right:1px solid #003451; border-bottom:1px solid #003451"><font class="label_font" color="#000000"><B>Chi tiết</B></font></td>
        <td width="15%" align="center" style="background-color:#ffd7ae; border-right:1px solid #003451; border-bottom:1px solid #003451"><font class="label_font" color="#000000"><B>Loại VB/Số KH</B></font></td>
        <td align="center" style="background-color:#ffd7ae; border-right:1px solid #003451; border-bottom:1px solid #003451"><font class="label_font" color="#000000"><B>Trích yếu</B></font></td>
        <td width="10%" align="center" style="background-color:#ffd7ae; border-right:1px solid #003451; border-bottom:1px solid #003451"><font class="label_font" color="#000000"><B>Thời gian</B></font></td>
        <td width="20%" align="center" style="background-color:#ffd7ae; border-right:1px solid #003451; border-bottom:1px solid #003451"><font class="label_font" color="#000000"><B>Ý kiến</B></font></td>
	</tr>
	{section name=pi loop=$obj_list}
	<tr {if $smarty.section.pi.index is not div by 2} bgcolor="#F2FFEC" {/if} >
		<td align="center">{math z=$smarty.section.pi.index t=1  equation="z+t" assign=stt}{$stt}</td>
		
        <td align="center"><a href="?listDocReply&doc_id={$obj_list[pi]->doc_id}{$vars.arg}" ><img src="{$http_root}images/admin/doc_icon.png" width="16" /></a></td>
        
        <td align="center"><a href="?viewDoc&doc_id={$obj_list[pi]->doc_id}{$vars.arg}" style="color:#F00; font-weight:bold">Xem</a></td>
                
        <td align="left">-&nbsp;{$obj_list[pi]->docCat_id}<br />-&nbsp;{$obj_list[pi]->doc_code}</td> 
        
        <td align="left">{$obj_list[pi]->doc_desc}</td>
                
        <td align="center">{$obj_list[pi]->doc_date|date_format:"%d-%m-%Y %H:%M"}</td>
        
        <td align="left">{$obj_list[pi]->doc_direct}</td>
		                        
	</tr>
	{/section}
</table>
{/if}