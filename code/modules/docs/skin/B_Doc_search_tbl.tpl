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
        	<table class="adminlist" width="95%" style="background-color:#e5e5e5">
                <tr>
                    <td align="center">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                           <td width="15%" align="left" height="20">
                            <font class="label_font" color="#425E89">Loại văn bản <font color="#FF0000">*</font>:</font></td>		
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
                            <td align="left" height="20" width="15%">
                            <font class="label_font" color="#425E89">Nơi gửi đến <font color="#FF0000">*</font>:</font></td>		
                            <td align="left">
                               <input type="text" style="width: 200px;" value="{$vars.unit_name}" id="unit_name" name="unit_name" class="ac_input"/>
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
                                var oSuggest = $("#unit_name")[0].autocompleter;
                                oSuggest.findValue();
                                return false;
                              }
                            
                              function lookupLocal(){
                                    var oSuggest = $("#CityLocal")[0].autocompleter;
                            
                                    oSuggest.findValue();
                            
                                    return false;
                              }
                              
                                $("#unit_name").autocomplete(
                                  "B_unit_auto.php",
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
                          </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="15%" align="left" height="20">
                            <font class="label_font" color="#425E89">Số ký hiệu <font color="#FF0000">*</font>:</font></td>		
                            <td align="left" width="35%">
                            <input type="text" id="doc_code" name="doc_code"  style="width:200px" value="{$vars.doc_code}"/>
                            </td>
                            <td width="15%" align="left" height="20">
                            <font class="label_font" color="#425E89">Ngày ký <font color="#FF0000">*</font>:</font></td>		
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
                                <td align="left" height="20">
                                <font class="label_font" color="#425E89">Trích yêu <font color="#FF0000">*</font>:</font></td>
                            </tr>
                            <tr>
                                <td align="left">
                                <textarea spellcheck="false" name="doc_desc" cols="10" rows="10" style="width:700px; height:40px">{$vars.doc_desc}</textarea>
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
                            <font class="label_font" color="#425E89">Người ký <font color="#FF0000">*</font>:</font></td>		
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
                            <td align="left" height="20" width="15%">
                            <font class="label_font" color="#425E89">Chức vụ <font color="#FF0000">*</font>:</font></td>		
                            <td align="left">
                            <input type="text" style="width: 200px;" value="{$vars.signObj_id}" id="signObj_id" class="ac_input" name="signObj_id"/>
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
                                var oSuggest = $("#signObj_id")[0].autocompleter;
                                oSuggest.findValue();
                                return false;
                              }
                            
                              function lookupLocal(){
                                    var oSuggest = $("#CityLocal")[0].autocompleter;
                            
                                    oSuggest.findValue();
                            
                                    return false;
                              }
                              
                                $("#signObj_id").autocomplete(
                                  "B_signObj_auto.php",
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
                          </tr>
                          <tr>
                          	<td align="left" height="20" width="15%">
                            <font class="label_font" color="#425E89">Số đến <font color="#FF0000">*</font>:</font></td>		
                            <td align="left">
                            <input type="text" style="width: 200px;" value="{$vars.doc_num}" id="doc_num" name="doc_num"/>
                            </td>
                          	<td align="center" colspan="2"><input type="submit" name="cmdSearch" value="Tìm kiếm" /></td>
                          </tr>
                        </table>
                    </td>
                </tr>
             </table>
        </td>		
	</tr>
	</tbody>
</table>
</div>
<div style="clear:both">&nbsp;</div>
<table width = "95%" border = "1" align="center" class="adminlist">
	<tr>
        <td colspan="10">
        <font class="label_font" color="#000000"><b>Văn bản đã nhập</b></font>
        <div style="float:right; padding-top:3px; text-align:right; padding-right: 20px;">Có tất cả {$total_num_result} văn bản</div>
        </td>
    </tr>
	<tr  bgcolor="#EEEEEE" >
		<td width="5%" align="center"><font class="label_font" color="#000000"><b>STT</b></font></td>	
        <td width="8%" align="center" ><font class="label_font" color="#000000"><B>Ngày nhập</B></font></td>
        <td width="8%" align="center" ><font class="label_font" color="#000000"><B>Số đến</B></font></td>	
        <td width="8%" align="center" ><font class="label_font" color="#000000"><B>Số ký hiệu</B></font></td>
        <td align="center"><font class="label_font" color="#000000"><B>Trích yếu</B></font></td>
        <td width="8%" align="center" ><font class="label_font" color="#000000"><B>Ngày ký</B></font></td>
        <td width="8%" align="center" ><font class="label_font" color="#000000"><B>Tệp tin</B></font></td>
		<td width="8%" align="center" ><font class="label_font" color="#000000"><B>Thao tác</B></font></td>		
	</tr>
	{section name=pi loop=$obj_list}
	<tr {if $smarty.section.pi.index is not div by 2} bgcolor="#F2FFEC" {/if} >
		<td align="center">{math x=$vars.curpage-1 y=$vars.numresult z=$smarty.section.pi.index t=1  equation="x*y+z+t" assign=stt}{$stt}</td>
		
        <td align="center">{$obj_list[pi]->doc_date|date_format:"%d-%m-%Y"}</td>
                
        <td align="center">{$obj_list[pi]->doc_num}</td> 
        
        <td align="center">{$obj_list[pi]->doc_code}</td> 
        
        <td align="left">
        	{if $per_edit eq 1}
            <a href="?editDoc&id={$obj_list[pi]->doc_id}{$vars.arg}" >{$obj_list[pi]->doc_desc}</a>
            {else}{$obj_list[pi]->doc_desc}{/if}
        </td>
        
        <td align="center">{$obj_list[pi]->doc_signed|date_format:"%d-%m-%Y"}</td>
        
        <td align="center">
        	{if $obj_list[pi]->doc_file eq 1}
            <a href="?listDocFile&doc_id={$obj_list[pi]->doc_id}&mod=docs" >
            <img src="../images/admin/b_view.png" width="20" height="20" border="0"></a>
            {else}
            <a href="?listDocFile&doc_id={$obj_list[pi]->doc_id}&mod=docs" >
            <img src="../images/admin/empty_icon.jpg" width="16" height="16" border="0"></a>
            {/if}
        </td>
		                        
        <td width="17" valign="middle" align="center">
        	{if $user_level eq 1 or $user_level eq 2 or $user_level eq 3}
            <a href='?editDoc&id={$obj_list[pi]->doc_id}{$vars.arg}'>
            <img src="../images/admin/b_edit.png" width="16" height="16" border="0" title="Sửa"></a>
            {elseif $user_level eq 4 or $user_level eq 5 or $user_level eq 6 or $user_level eq 7}
            <a href="?listDocReply&doc_id={$obj_list[pi]->doc_id}{$vars.arg}" ><img src="../images/admin/b_view.png" width="20" height="20" border="0"></a>
            {else}-{/if}
        </td>
	</tr>
	{/section}
</table>
<div style="float:left; height:50px; width:100%;"></div>
<table width = "95%" border = "1" align="center" class="adminlist">
	<tr>
        <td colspan="11">
        <font class="label_font" color="#000000"><b>Văn bản đã giải quyết</b></font>
        <div style="float:right; padding-top:3px; text-align:right; padding-right: 20px;">Có tất cả {$total_num_result} văn bản</div>
        </td>
    </tr>
	<tr  bgcolor="#EEEEEE" >
		<td width="5%" align="center"><font class="label_font" color="#000000"><b>STT</b></font></td>	
        <td width="8%" align="center" ><font class="label_font" color="#000000"><B>Ngày nhập</B></font></td>
        <td width="8%" align="center" ><font class="label_font" color="#000000"><B>Số đến</B></font></td>	
        <td width="8%" align="center" ><font class="label_font" color="#000000"><B>Số ký hiệu</B></font></td>
        <td align="center"><font class="label_font" color="#000000"><B>Trích yếu</B></font></td>
        <td width="8%" align="center" ><font class="label_font" color="#000000"><B>Ngày ký</B></font></td>
        <td width="12%" align="center" ><font class="label_font" color="#000000"><B>Người ký</B></font></td>
        <td width="12%" align="center" ><font class="label_font" color="#000000"><B>Chức vụ</B></font></td>
        <td width="6%" align="center" ><font class="label_font" color="#000000"><B>Chi tiết</B></font></td>
	</tr>
	{section name=pi loop=$obj_list_done}
	<tr {if $smarty.section.pi.index is not div by 2} bgcolor="#F2FFEC" {/if} >
		<td align="center">{math x=$vars.curpage-1 y=$vars.numresult z=$smarty.section.pi.index t=1  equation="x*y+z+t" assign=stt}{$stt}</td>
		
        <td align="center">{$obj_list_done[pi]->doc_date|date_format:"%d-%m-%Y"}</td>
                
        <td align="center">{$obj_list_done[pi]->doc_num}</td> 
        
        <td align="center">{$obj_list_done[pi]->doc_code}</td> 
        
        <td align="left">{$obj_list_done[pi]->doc_desc}</td>
        
        <td align="center">{$obj_list_done[pi]->doc_signed|date_format:"%d-%m-%Y"}</td>
        
        <td align="center">{$obj_list_done[pi]->signPer_id}</td>
        
        <td align="center">{$obj_list_done[pi]->signObj_id}</td>
        
        <td align="center">
            <a href="?viewfinishDoc&doc_id={$obj_list_done[pi]->doc_id}&mod=docs" ><img src="../images/admin/b_view.png" width="20" height="20" border="0"></a>
        </td>
	</tr>
	{/section}
	<tr>
		<td colspan="10" style="text-align:left">
			<div style="float:left; padding-top: 3px;">{$pager_str}</div>
        </td>
	</tr>
</table>
<div style="clear:both"><doc src='../images/admin/spacer.gif' height="10px" /></div>
<input type="hidden" id="curpage" name="curpage" value="{$vars.curpage}" />
<div style="float:left; text-align:left; padding-left: 20px">
	<font color="#000000">
		Sắp xếp theo
		<select name="order" id = "order" style=" font-size:12px; height:20px;" onchange="reloadPage('{$processurl}');">
		{section name=sli loop=$order_arr}
			<option value="{$smarty.section.sli.index}" {if $smarty.section.sli.index eq $vars.order}selected{/if} >
			{$order_arr[sli]}
			</option>
		{/section}
		</select>
	</font>
</div>					
<div style="float:right; text-align:right; padding-right: 20px">
	<font color="#000000">
		Hiển thị
		<select name="numresult" id = "numresult" style=" font-size:12px; height:20px;" onchange="reloadPage('{$processurl}');">
            {section name=sli loop=$nrs_arr}
             <option value="{$nrs_arr[sli]}" {if $nrs_arr[sli] eq $vars.numresult}selected{/if} > {$nrs_arr[sli]} </option>
            {/section}
		</select>
		dòng / 1 trang
    </font>
</div>
</form>