{include file = '_common_header.tpl'}
{literal}
<script language="javascript">
	function set_focus(){
		document.theForm.docLevel_id.focus();
	}
</script>
{/literal}
<body topmargin="0" bottommargin="0" leftmargin="0" rightmargin="0" onLoad="set_focus()">
<table cellspacing="0" cellpadding="0" width="800" align="center" border="0">
    <tr align="center"><td><div align="left">{include file="_header.tpl"}</div></td></tr>
    <!-- Top Menu -->
    <tr>
        <td align="center">
            <div id="main" style="border:1px solid #CCC">
            <table width="99%" border="0" cellpadding="0" cellspacing="0" height="400">
                <tr>
                    <td valign="top" height="400" >
                        <table height="100%" cellSpacing="0" cellPadding="0" width="100%" border="0">
                            <tr>
                                <td valign="top" width="100%" bgColor="#ffffff" height="100%" align="center"><br>				
                                    <!-- *************** START - PHAN NOI DUNG THAY DOI   ************************** -->
                                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td valign="top" align="center">
                                                <table class="adminlist" width="100%" border="0" cellpadding="0" cellspacing="0">
                                                 <form name="frm2" method="post" action=""></form>
                                                 </table>
                                                 <br />
                                                 <fieldset style="width: 90%; ">
                                                 <legend >&nbsp;<font class="label_font" color="#425E89">SOẠN THẢO VĂN BẢN GỬI ĐI&nbsp;&nbsp;<em>(Ngày tháng có dạng dd-mm-YYYY hoặc dd/mm/YYYY)</em></font></legend>	
                                                 <form action="?addDoc{$vars.arg}" method="POST" name="theForm">
                                                 {if $error neq ""}
                                                    <div align="left" style="width: 400px; background-color:#FFFFCC; padding: 10px 20px 10px 50px;">
                                                    <label style=" font-size: 16px; color:#990000; font-weight:bold; padding-bottom:5px;">Thông báo:</label><BR />
                                                    <li style=" padding: 0px; padding-left: 10px; font-size: 14px; color:#C24510">{$error}</li>
                                                    </div>
                                                 {/if}	
                                                 <div><img src="../images/admin/spacer.gif" style="height:10px;" /></div>
                                                 <div align="center">
                                                 <table width="95%">
                                                    <tr>
                                                        <td align="center">
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                              <tr>
                                                                <td width="20%" align="right" height="25" style="background-color:#ffd7ae; border-right:1px solid #003451; border-bottom:1px solid #003451">
                                                                <font class="label_font" color="#425E89">Ngày tạo văn bản:</font></td>		
                                                                <td align="left" style="padding-left:2px; background-color:#f2eee0">
                                                                {$smarty.now|date_format:'%d-%m-%Y %H:%M'}</td>
                                                              </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center">
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                              <tr>
                                                                <td width="20%" align="right" height="25" style="background-color:#ffd7ae; border-right:1px solid #003451; border-bottom:1px solid #003451">
                                                                <font class="label_font" color="#425E89">Khối phát hành:</font></td>		
                                                                <td align="left" style="padding-left:2px; background-color:#f2eee0">{$access_department_name}<input type="hidden" value="{$access_department_name}" id="doc_unit" name="doc_unit"/></td>
                                                              </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center">
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                              <tr>
                                                                <td width="20%" align="right" height="25" style="background-color:#ffd7ae; border-right:1px solid #003451; border-bottom:1px solid #003451">
                                                                <font class="label_font" color="#425E89">Người gửi văn bản:</font></td>		
                                                                <td align="left" style="padding-left:2px; background-color:#f2eee0">{$access_object_name}&nbsp;<b>{$access_user_fullname}</b></td>
                                                              </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center">
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                              <tr>
                                                                <td width="20%" align="right" height="25" style="background-color:#ffd7ae; border-right:1px solid #003451; border-bottom:1px solid #003451">
                                                                <font class="label_font" color="#425E89">Người ký:</font></td>		
                                                                <td align="left" width="30%" style="padding-left:2px; background-color:#f2eee0">
                                                                <input type="text" style="width: 160px; border:1px solid #03F" value="{$vars.signPer_id}" id="signPer_id" class="ac_input" name="signPer_id"/>
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
                                                                <td width="15%" align="right" style="background-color:#ffd7ae; border-right:1px solid #003451; border-bottom:1px solid #003451">
                                                                <font class="label_font" color="#425E89">Ngày ký:</font></td>		
                                                                <td align="left" style="padding-left:2px; background-color:#f2eee0">
                                                                <input type="text" name="doc_signed" id="doc_signed" value="{$vars.doc_signed}" maxlength="250" class="text" style="width:160px; border:1px solid #03F"/>
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
                                                                <td width="20%" align="right" height="25" style="background-color:#ffd7ae; border-right:1px solid #003451; border-bottom:1px solid #003451">
                                                                <font class="label_font" color="#425E89">Lĩnh vực:</font></td>		
                                                                <td align="left" style="padding-left:2px; background-color:#f2eee0">
                                                                <input type="text" style="width: 160px; border:1px solid #03F" value="{$vars.docField_id}" id="docField_id" name="docField_id" class="ac_input"/>
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
																	var oSuggest = $("#docField_id")[0].autocompleter;
																	oSuggest.findValue();
																	return false;
																  }
																
																  function lookupLocal(){
																		var oSuggest = $("#CityLocal")[0].autocompleter;
																
																		oSuggest.findValue();
																
																		return false;
																  }
																  
																	$("#docField_id").autocomplete(
																	  "B_docField_auto.php",
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
                                                              	<td width="20%" align="right" height="25" style="background-color:#ffd7ae; border-right:1px solid #003451; border-bottom:1px solid #003451">
                                                                <font class="label_font" color="#425E89">Số ký hiệu *:</font></td>		
                                                                <td align="left" width="30%" style="padding-left:2px; background-color:#f2eee0">
                                                                <input type="text" id="doc_code" name="doc_code"  style="width:160px; border:1px solid #03F" value="{if $vars.doc_code eq ''}Không có{else}{$docreply_info.doc_code}{/if}"/>
                                                                </td>
                                                                <td width="15%" align="right" style="background-color:#ffd7ae; border-right:1px solid #003451; border-bottom:1px solid #003451">
                                                                <font class="label_font" color="#425E89">Độ khẩn:</font></td>		
                                                                <td align="left" style="padding-left:2px; background-color:#f2eee0">
                                                                <select name="important_id" style="width:100px; border:1px solid #03F" onChange="setText()">
                                                                    {section name=qi loop=$obj_list_important}
                                                                    <option value="{$obj_list_important[qi]->important_id}" {if $obj_list_important[qi]->important_id eq $vars.important_id}selected="selected"{/if}>-&nbsp;{$obj_list_important[qi]->important_name}</option>
                                                                    {/section}
                                                                </select>
                                                                </td>
                                                              </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center">
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                              <tr>
                                                                <td width="20%" align="right" height="25" style="background-color:#ffd7ae; border-right:1px solid #003451; border-bottom:1px solid #003451">
                                                                <font class="label_font" color="#425E89">Loại văn bản *:</font></td>		
                                                                <td align="left" width="30%" style="padding-left:2px; background-color:#f2eee0">
                                                                <input type="text" style="width: 160px; border:1px solid #03F" value="{$vars.docCat_id}" id="docCat_id" name="docCat_id" class="ac_input"/>
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
                                                                <td width="15%" align="right" style="background-color:#ffd7ae; border-right:1px solid #003451; border-bottom:1px solid #003451">
                                                                <font class="label_font" color="#425E89">Hạn giải quyết:</font></td>		
                                                                <td align="left" style="padding-left:2px; background-color:#f2eee0">
                                                                <input type="text" name="doc_limit_time" id="doc_limit_time" value="{$vars.doc_limit_time}" maxlength="250" class="text" style="width:160px; border:1px solid #03F"/>
                                                                &nbsp;
                                                                <img src="../images/admin/img.gif"  align="absmiddle" id="icon_date03" style="cursor: pointer; border: 0" title="Chọn ngày trên lịch"/>
                                                                </td>
                                                                {literal}
                                                                <script type="text/javascript">
                                                                    Calendar.setup({
                                                                        inputField   :   "doc_limit_time",
                                                                        ifFormat     :   "%d-%m-%Y",
                                                                        button       :   "icon_date03",
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
                                                                	<td align="right" height="40" width="20%" style="background-color:#ffd7ae; border-right:1px solid #003451; border-bottom:1px solid #003451">
                                                                    <font class="label_font" color="#425E89">Trích yếu *:</font></td>
                                                                    <td align="left" style="padding-left:2px; background-color:#f2eee0">
                                                                    <textarea name="doc_desc" cols="10" rows="10" style="width:565px; height:40px; border:1px solid #03F">{$vars.doc_desc}</textarea>
                                                                    </td>
                                                                </tr>
                                                             </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center">
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                	<td align="right" height="40" width="20%" style="background-color:#ffd7ae; border-right:1px solid #003451; border-bottom:1px solid #003451">
                                                                    <font class="label_font" color="#425E89">Ý kiến chỉ đạo:</font></td>
                                                                    <td align="left" style="padding-left:2px; background-color:#f2eee0">
                                                                    <textarea name="doc_direct" cols="10" rows="10" style="width:565px; height:40px; border:1px solid #03F">{$vars.doc_direct}</textarea>
                                                                    </td>
                                                                </tr>
                                                             </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center">
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                	<td align="right" height="25" width="20%" style="background-color:#ffd7ae; border-right:1px solid #003451; border-bottom:1px solid #003451">
                                                                    <font class="label_font" color="#425E89">Ghi chú:</font></td>
                                                                    <td align="left" style="padding-left:2px; background-color:#f2eee0">
                                                                    <textarea name="doc_note" cols="10" rows="10" style="width:565px; height:17px; border:1px solid #03F">{$vars.doc_note}</textarea>
                                                                    </td>
                                                                </tr>
                                                             </table>
                                                        </td>
                                                    </tr>
                                                    <tr height="25">
                                                        <td align="center" style="background-color:#ffd7ae; border-right:1px solid #003451; border-bottom:1px solid #003451">
                                                        <input type="submit" name="submitDoc" value="Thêm mới" style="width:70px; border-right:1px solid #003451; border-bottom:1px solid #003451; cursor:pointer"/>
                                                        <input type="hidden" name="arg" value="{$vars.arg}" />	
                                                        <input type="hidden" name="input_per" value="{$access_user_id}">	
                                                        <input type="reset" name="reset" value="Bỏ qua" onClick="history.go(-1)" style="width:70px; border-right:1px solid #003451; border-bottom:1px solid #003451; cursor:pointer">
                                                        </td>
                                                    </tr>
                                                 </table>
                                                 </div>
                                                 </form>							
                                                 </fieldset>
                                            </td>
                                        </tr>
                                    </table>
                                    <!-- *************** END - PHAN NOI DUNG THAY DOI   ************************** -->
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            </div>
        </td>
    </tr>
    <tr><td>{include file="_footer.tpl"}</td></tr>
</table>
<!--  END ./winuser/view.html  -->
</body>
</html>