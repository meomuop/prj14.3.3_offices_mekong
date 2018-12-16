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
                                <td valign="top" height="400" width="19%" style="border-right:1px solid #000">{include file="_leftmenu.tpl"}</td><td>&nbsp;</td>
                                <td valign="top" width="100%" bgColor="#ffffff" height="100%" align="center"><br>				
                                    <!-- *************** START - PHAN NOI DUNG THAY DOI   ************************** -->
                                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td valign="top" align="center">
                                                <table class="adminlist" width="100%" border="0" cellpadding="0" cellspacing="0">
                                                    <form name="frm2" method="post" action=""></form>
                                                    <tbody>
                                                    <tr>
                                                        <td  style="font-family: Arial; color:#930; font-size: 16px; font-weight: bold;" width="31%" nowrap="nowrap"><div align="left"><img src="../images/admin/module.png" align="absmiddle" height="30">&nbsp;Danh sách văn bản</div>
                                                        </td>	
                                                    </tr>
                                                    </tbody>
                                                 </table>
                                                 <br />
                                                 <fieldset style="width: 90%; ">
                                                 <legend >&nbsp;Thông tin văn bản&nbsp;&nbsp;</legend>	
                                                 {if $complete eq 1}
                                                    <div><doc src="images/spacer.gif" height="30px" /></div>
                                                    <div align="center" class="complele_alert">
                                                    <h2>Sửa văn bản thành công</h2><br /><br />
                                                    </div>
                                                 {else}
                                                 <form action="?editDoc{$arg.arg}" method="POST" name="theForm">
                                                 {if $error neq ""}
                                                    <div align="left" style="width: 400px; background-color:#FFFFCC; padding: 10px 20px 10px 50px;">
                                                    <label style=" font-size: 16px; color:#990000; font-weight:bold; padding-bottom:5px;">Thông báo:</label><BR />
                                                    <li style=" padding: 0px; padding-left: 10px; font-size: 14px; color:#C24510">{$error}</li>
                                                    </div>
                                                 {/if}	
                                                 <div><doc src="../images/admin/spacer.gif" style="height:10px;" /></div>
                                                 <div align="center">
                                                 <table width="95%">
                                                    <tr>
                                                        <td align="center" colspan="2">
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                              <tr>
                                                                <td width="15%" align="left" height="20">
                                                                <font class="label_font" color="#425E89">Khu vực:</font></td>		
                                                                <td align="left" width="35%">
                                                                {if $user_level_tnvb eq 1 or $user_level_tnvb eq 2 or  $user_level_tnvb eq 9}
                                                                <select name="docLevel_id" style="width:200px">
                                                                    <option value="0">Chọn cấp ban hành</option>
                                                                    {section name=qi loop=$obj_list_dlevel}
                                                                    <option value="{$obj_list_dlevel[qi]->docLevel_id}" {if $obj_list_dlevel[qi]->docLevel_id eq $vars.docLevel_id}selected="selected"{/if}>-&nbsp;{$obj_list_dlevel[qi]->docLevel_name}</option>
                                                                    {/section}
                                                                </select>
                                                                {else}
                                                                	<input type="hidden" name="docLevel_id" value="{$vars.docLevel_id}">
                                                                	{section name=qi loop=$obj_list_dlevel}
                                                                        {if $obj_list_dlevel[qi]->docLevel_id eq $vars.docLevel_id}
                                                                        {$obj_list_dlevel[qi]->docLevel_name}
                                                                        {/if}
                                                                    {/section}
                                                                {/if}
                                                                </td>
                                                                {literal}
                                                                <script language="javascript">
																	function setText(){
																		document.theForm.unit_name.value = document.theForm.unit_id.value;
																	}
																</script>
                                                                {/literal}
                                                                <td align="left" height="20" width="15%">
                                                                <font class="label_font" color="#425E89">Nơi gửi đến *:</font></td>		
                                                                <td align="left">
                                                                    {if $user_level_tnvb eq 1 or $user_level_tnvb eq 2 or  $user_level_tnvb eq 9}
                                                                    <input type="text" style="width: 200px;" value="{$vars.unit_name}" id="unit_name" name="unit_name" class="ac_input"/>
                                                                    {else}
                                                                        <input type="hidden" name="unit_name" value="{$vars.unit_name}">
                                                                        {$vars.unit_name}
                                                                    {/if}
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
                                                    <tr height="10"><td></td></tr>
                                                    <tr>
                                                        <td align="center" colspan="2">
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                              <tr>
                                                                <td width="15%" align="left" height="20">
                                                                <font class="label_font" color="#425E89">Số ký hiệu *:</font></td>		
                                                                <td align="left" width="35%">
                                                                {if $user_level_tnvb eq 1 or $user_level_tnvb eq 2 or  $user_level_tnvb eq 9}
                                                                <input type="text" id="doc_code" name="doc_code"  style="width:200px" value="{$vars.doc_code}"/>
                                                                {else}
                                                                <input type="hidden" name="doc_code" value="{$vars.doc_code}">
                                                                {$vars.doc_code}
                                                                {/if}
                                                                </td>
                                                                <td width="15%" align="left" height="20">
                                                                <font class="label_font" color="#425E89">Ngày ký *:</font></td>		
                                                                <td align="left" width="35%">
                                                                {if $user_level_tnvb eq 1 or $user_level_tnvb eq 2 or  $user_level_tnvb eq 9}
                                                                <input type="text" name="doc_signed" id="doc_signed" value="{$vars.doc_signed|date_format:'%d-%m-%Y'}" maxlength="250" class="text" style="width:167px"/>
                                                                &nbsp;
                                                                <img src="../images/admin/img.gif"  align="absmiddle" id="icon_date01" style="cursor: pointer; border: 0" title="Chọn ngày trên lịch"/>
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
                                                                {else}
                                                                <input type="hidden" name="doc_signed" value="{$vars.doc_signed}">
                                                                {$vars.doc_signed|date_format:"%d-%m-%Y"}
                                                                {/if}
                                                                </td>
                                                              </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr height="10"><td></td></tr>
                                                    <tr>
                                                        <td align="center" colspan="2">
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                              <tr>
                                                                <td width="15%" align="left" height="20">
                                                                <font class="label_font" color="#425E89">Loại văn bản *:</font></td>		
                                                                <td align="left" width="35%">
                                                                {if $user_level_tnvb eq 1 or $user_level_tnvb eq 2 or  $user_level_tnvb eq 9}
                                                                <input type="text" style="width: 200px;" value="{$vars.docCat_id}" id="docCat_id" name="docCat_id" class="ac_input"/>
                                                                {else}
                                                                	<input type="hidden" name="docCat_id" value="{$vars.docCat_id}">
                                                                	{$vars.docCat_id}
                                                                {/if}
                                                                
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
                                                                <font class="label_font" color="#425E89">Lĩnh vực:</font></td>		
                                                                <td align="left" width="35%">
                                                                {if $user_level_tnvb eq 1 or $user_level_tnvb eq 2 or  $user_level_tnvb eq 9}
                                                                <input type="text" style="width: 200px;" value="{$vars.docField_id}" id="docField_id" name="docField_id" class="ac_input"/>
                                                                {else}
                                                                	<input type="hidden" name="docField_id" value="{$vars.docField_id}">
                                                                	{$vars.docField_id}
                                                                {/if}
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
                                                    <tr height="10"><td></td></tr>
                                                    <tr>
                                                        <td align="center" colspan="2">
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                	<td align="left" height="20">
                                                                    <font class="label_font" color="#425E89">Trích yếu *:</font></td>
                                                                </tr>
                                                                <tr style="height:80px">
                                                                    <td align="left">
                                                                    {if $user_level_tnvb eq 1 or $user_level_tnvb eq 2 or  $user_level_tnvb eq 9}
                                                                    <textarea name="doc_desc" cols="10" rows="10" style="width:635px; height:80px">{$vars.doc_desc}</textarea>
                                                                    {else}
                                                                    <input type="hidden" name="doc_desc" value="{$vars.doc_desc}">
                                                                    {$vars.doc_desc}
                                                                    {/if}
                                                                    </td>
                                                                </tr>
                                                             </table>
                                                        </td>
                                                    </tr>
                                                    <tr height="10"><td></td></tr>
                                                    <tr>
                                                        <td align="center" colspan="2">
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                              <tr>
                                                                <td width="15%" align="left" height="20">
                                                                <font class="label_font" color="#425E89">Người ký *:</font></td>		
                                                                <td align="left" width="35%">
                                                                {if $user_level_tnvb eq 1 or $user_level_tnvb eq 2 or  $user_level_tnvb eq 9}
                                                                <input type="text" style="width: 200px;" value="{$vars.signPer_id}" id="signPer_id" name="signPer_id" class="ac_input"/>
                                                                {else}
                                                                <input type="hidden" name="signPer_id" value="{$vars.signPer_id}">
                                                                {$vars.signPer_id}
                                                                {/if}
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
                                                                <font class="label_font" color="#425E89">Chức vụ *:</font></td>		
                                                                <td align="left" width="35%">
                                                                {if $user_level_tnvb eq 1 or $user_level_tnvb eq 2 or  $user_level_tnvb eq 9}
                                                                <input type="text" style="width: 200px;" value="{$vars.signObj_id}" id="signObj_id" name="signObj_id" class="ac_input"/>
                                                                {else}
                                                                <input type="hidden" name="signObj_id" value="{$vars.signObj_id}">
                                                                {$vars.signObj_id}
                                                                {/if}
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
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr height="10"><td></td></tr>
                                                    <tr>
                                                        <td align="center" colspan="2">
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                              <tr>
                                                                <td width="15%" align="left" height="20">
                                                                <font class="label_font" color="#425E89">Ngày nhận:</font></td>		
                                                                <td align="left" width="35%">
                                                                {if $user_level_tnvb eq 1 or $user_level_tnvb eq 2 or  $user_level_tnvb eq 9}
                                                                <input type="text" name="doc_recevied" id="doc_recevied" value="{$vars.doc_recevied|date_format:'%d-%m-%Y'}" maxlength="250" class="text" style="width:167px"/>
                                                                &nbsp;
                                                                <img src="../images/admin/img.gif"  align="absmiddle" id="icon_date02" style="cursor: pointer; border: 0" title="Chọn ngày trên lịch"/>
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
                                                                {else}
                                                                <input type="hidden" name="doc_recevied" value="{$vars.doc_recevied}">
                                                                {$vars.doc_recevied|date_format:"%d-%m-%Y"}
                                                                {/if}
                                                                </td>
                                                                <td width="15%" align="left" height="20">
                                                                <font class="label_font" color="#425E89">Hạn giải quyết:</font></td>		
                                                                <td align="left" width="35%">
                                                                {if $user_level_tnvb eq 1 or $user_level_tnvb eq 2 or  $user_level_tnvb eq 9}
                                                                <input type="text" name="doc_limit_time" id="doc_limit_time" value="{if $vars.doc_limit_time neq '1970-01-01 00:00:00'}{$vars.doc_limit_time|date_format:'%d-%m-%Y'}{/if}" maxlength="250" class="text" style="width:167px"/>
                                                                &nbsp;
                                                                <img src="../images/admin/img.gif"  align="absmiddle" id="icon_date03" style="cursor: pointer; border: 0" title="Chọn ngày trên lịch"/>
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
                                                                {else}
                                                                <input type="hidden" name="doc_limit_time" value="{$vars.doc_limit_time}">
                                                                {if $vars.doc_limit_time neq '1970-01-01 00:00:00'}{$vars.doc_limit_time|date_format:"%d-%m-%Y"}{/if}
                                                                {/if}
                                                                </td>
                                                              </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr height="10"><td></td></tr>
                                                    <tr>
                                                        <td align="center" colspan="2">
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                              <tr>
                                                              	<td width="15%" align="left" height="20">
                                                                <font class="label_font" style="color:#F00; font-size:15px; font-weight:bold">Số đến:</font></td>		
                                                                <td align="left" width="15%">
                                                                {if $user_level_tnvb eq 1 or $user_level_tnvb eq 2 or  $user_level_tnvb eq 9}
                                                                <input type="text" id="doc_num" name="doc_num" size="10" value="{$vars.doc_num}" style="color:#F00; font-size:15px; font-weight:bold"/>
                                                                {else}
                                                                <input type="hidden" name="doc_num" value="{$vars.doc_num}">
                                                                <font class="label_font" style="color:#F00; font-size:15px; font-weight:bold">{$vars.doc_num}</font>
                                                                {/if}
                                                                </td>
                                                                <td width="15%" align="left" height="20">
                                                                <font class="label_font" color="#425E89">Độ mật:</font></td>		
                                                                <td align="left" width="25%">
                                                                {if $user_level_tnvb eq 1 or $user_level_tnvb eq 2 or  $user_level_tnvb eq 9}
                                                                <select name="secret_id" style="width:100px" onChange="setText()">
                                                                    {section name=qi loop=$obj_list_secret}
                                                                    <option value="{$obj_list_secret[qi]->secret_id}" {if $obj_list_secret[qi]->secret_id eq $vars.secret_id}selected="selected"{/if}>-&nbsp;{$obj_list_secret[qi]->secret_name}</option>
                                                                    {/section}
                                                                </select>
                                                                {else}
                                                                	<input type="hidden" name="secret_id" value="{$vars.secret_id}">
                                                                	{section name=qi loop=$obj_list_secret}
                                                                    {if $obj_list_secret[qi]->secret_id eq $vars.secret_id}
                                                                    -&nbsp;{$obj_list_secret[qi]->secret_name}
                                                                    {/if}
                                                                    {/section}
                                                                {/if}
                                                                </td>
                                                                <td width="15%" align="left" height="20">
                                                                <font class="label_font" color="#425E89">Độ khẩn:</font></td>		
                                                                <td align="left">
                                                                {if $user_level_tnvb eq 1 or $user_level_tnvb eq 2 or  $user_level_tnvb eq 9}
                                                                <select name="important_id" style="width:100px" onChange="setText()">
                                                                    {section name=qi loop=$obj_list_important}
                                                                    <option value="{$obj_list_important[qi]->important_id}" {if $obj_list_important[qi]->important_id eq $vars.important_id}selected="selected"{/if}>-&nbsp;{$obj_list_important[qi]->important_name}</option>
                                                                    {/section}
                                                                </select>
                                                                {else}
                                                                	<input type="hidden" name="important_id" value="{$vars.important_id}">
                                                                	{section name=qi loop=$obj_list_important}
                                                                    {if $obj_list_important[qi]->important_id eq $vars.important_id}
                                                                    -&nbsp;{$obj_list_important[qi]->important_name}{/if}
                                                                    {/section}
                                                                {/if}
                                                                </td>
                                                              </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr height="10"><td></td></tr>
                                                    <tr>
                                                        <td align="center" colspan="2">
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                              <tr>
                                                                <td width="15%" align="left" height="20">
                                                                <font class="label_font" color="#425E89">Người chỉ đạo:</font></td>		
                                                                <td align="left">
                                                                {if $user_level_tnvb neq 3 or $finish eq 1}
                                                                <input type="hidden" name="user_id" value="{$vars.user_id}">
                                                                {section name=qi loop=$obj_list_user}
                                                                    {if $obj_list_user[qi]->user_id eq $vars.user_id}{$obj_list_user[qi]->user_fullname}{/if}
                                                                    {/section}
                                                                {else}
                                                                <select name="user_id" style="width:200px">
                                                                    <option value="0">Chọn người nhận</option>
                                                                    {section name=qi loop=$obj_list_user}
                                                                    <option value="{$obj_list_user[qi]->user_id}" {if $obj_list_user[qi]->user_id eq $vars.user_id}selected="selected"{/if}>-&nbsp;{$obj_list_user[qi]->user_fullname}</option>
                                                                    {/section}
                                                                </select>
                                                                {/if}
                                                                </td>
                                                                <td width="15%" align="left" height="20">
                                                                <font class="label_font" color="#425E89">Ngày phân loại:</font></td>		
                                                                <td align="left" width="35%">
                                                                {if $user_level_tnvb neq 3 or $finish eq 1}
                                                                	<input type="hidden" name="doc_moved" id="doc_moved" value="{if $vars.doc_moved neq '1970-01-01 00:00:00'}{$vars.doc_moved|date_format:'%d-%m-%Y'}{else}{$smarty.now|date_format:'%d-%m-%Y'}{/if}" maxlength="250" class="text" style="width:167px"/>
                                                                	{if $vars.doc_moved neq '1970-01-01 00:00:00'}{$vars.doc_moved|date_format:'%d-%m-%Y'}{else}{$smarty.now|date_format:'%d-%m-%Y'}{/if}
                                                                {else}
                                                                <input type="text" name="doc_moved" id="doc_moved" value="{if $vars.doc_moved neq '1970-01-01 00:00:00'}{$vars.doc_moved|date_format:'%d-%m-%Y'}{else}{$smarty.now|date_format:'%d-%m-%Y'}{/if}" maxlength="250" class="text" style="width:167px"/>
                                                                &nbsp;
                                                                <img src="../images/admin/img.gif"  align="absmiddle" id="icon_date04" style="cursor: pointer; border: 0" title="Chọn ngày trên lịch"/>
                                                               {literal}
                                                                <script type="text/javascript">
                                                                    Calendar.setup({
                                                                        inputField   :   "doc_moved",
                                                                        ifFormat     :   "%d-%m-%Y",
                                                                        button       :   "icon_date04",
                                                                        align        :   "Br",  
                                                                        timeFormat   :   "24",
                                                                        showsTime    :   true,
                                                                        singleClick  :   true
                                                                    });
                                                                </script>
                                                                {/literal}
                                                                {/if}
                                                                </td>
                                                              </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr height="20"><td></td></tr>
                                                    <tr>
                                                        <td align="center">
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                              <tr>
                                                                <td width="15%" align="left" height="20">
                                                                <font class="label_font" color="#425E89">Trình tự giải quyết:</font></td>		
                                                              </tr>
                                                              <tr>
                                                                <td align="left">
                                                                 	<table width = "95%" border = "1" align="center" class="adminlist">
                                                                      <tr bgcolor="#EEEEEE" height="40">
                                                                        <td width="5%" align="center"><b>STT</b></td>	
                                                                        <td width="15%" align="center" ><B>Ngày nhập</B></td>
                                                                        <td width="20%" align="left" ><B>Chuyển từ</B></td>
                                                                        <td align="left"><B>Nội dung</B></td>
                                                                        <td width="20%" align="left" ><B>Chuyển đến</B></td>
                                                                        <td width="15%" align="center" ><B>Hạn xử lý</B></td>
                                                                      </tr>
                                                                      {section name = pi loop = $obj_list_reply}
                                                                      <tr {if $smarty.section.pi.index is not div by 2} bgcolor="#F2FFEC" {/if} height="40">
                                                                            <td align="center">{math z=$smarty.section.pi.index t=1  equation="z+t" assign=stt}{$stt}</td>
                                                                            
                                                                            <td align="center">{$obj_list_reply[pi]->docReply_date|date_format:"%d-%m-%Y"}</td>
                                                                            
                                                                            <td align="left">
                                                                                {section name=qi loop=$obj_list_reply_user}
                                                                                {if $obj_list_reply_user[qi]->user_id eq $obj_list_reply[pi]->user_id}{$obj_list_reply_user[qi]->user_fullname}{/if}
                                                                                {/section}
                                                                            </td>
                                                                                    
                                                                            <td align="left">
                                                                                {if $access_user_id eq $obj_list_reply[pi]->user_id}
                                                                                {$obj_list_reply[pi]->docReply_desc}
                                                                                {else}{$obj_list_reply[pi]->docReply_desc}{/if}
                                                                            </td>
                                                                            
                                                                            <td align="left">
                                                                            {if $obj_list_reply[pi]->department_id neq 0}Phòng ban
                                                                                {section name=qi loop=$obj_list_reply_user}
                                                                                {if $obj_list_reply_user[qi]->user_id eq $obj_list_reply[pi]->recevie_per}({$obj_list_reply_user[qi]->user_fullname}){/if}
                                                                                {if $obj_list_reply_user[qi]->user_id eq $obj_list_reply[pi]->process_per}({$obj_list_reply_user[qi]->user_fullname}){/if}
                                                                                {/section}
                                                                            {else $obj_list_reply[pi]->recevie_id neq 0}
                                                                                {section name=qi loop=$obj_list_reply_user}
                                                                                {if $obj_list_reply_user[qi]->user_id eq $obj_list_reply[pi]->recevie_per}{$obj_list_reply_user[qi]->user_fullname}{/if}
                                                                                {if $obj_list_reply_user[qi]->user_id eq $obj_list_reply[pi]->process_per}{$obj_list_reply_user[qi]->user_fullname}{/if}
                                                                                {/section}
                                                                            {/if}
                                                                            </td>
                                                                            
                                                                            <td align="center">{$obj_list_reply[pi]->docReply_limit_time|date_format:"%d-%m-%Y"}</td>
                                                                                                                    
                                                                        </tr>
                                                                        {/section}
                                                                    </table>
                                                                </td>
                                                              </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr height="20"><td></td></tr>
                                                    <tr>
                                                        <td align="center">
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                              <tr>
                                                                <td width="15%" align="left" height="20">
                                                                <font class="label_font" color="#425E89">Tệp tin đính kèm:</font></td>		
                                                              </tr>
                                                              <tr>
                                                                <td align="left">
                                                                	<table width = "95%" border = "1" align="center" class="adminlist">
                                                                        <tr  bgcolor="#EEEEEE" height="40" >
                                                                            <td width="5%" align="center"><b>STT</b></td>		
                                                                            <td align="center"><B>Tên tệp tin</B></td>
                                                                            <td width="20%" align="center" ><B>Tải về</B></td>
                                                                            <td width="15%" align="center" ><B>Ngày nhập</B></td>
                                                                        </tr>
                                                                        {if $obj_list_docfile}
                                                                        {section name=pi loop=$obj_list_docfile}
                                                                        <tr height="40" {if $smarty.section.pi.index is not div by 2} bgcolor="#F2FFEC" {/if} >
                                                                            <td align="center">{math z=$smarty.section.pi.index t=1  equation="z+t" assign=stt}{$stt}</td>
                                                                            
                                                                            <td>{$obj_list_docfile[pi]->docfile_name}</td>
                                                                            
                                                                            <td align="center"><a href="{$obj_list_docfile[pi]->docfile_path}" >[Tải tài liệu]</a></td>
                                                                            
                                                                            <td align="center">{$obj_list_docfile[pi]->docfile_date|date_format:"%d-%m-%Y"}</td>
                                                                        </tr>
                                                                        {/section}
                                                                        {else}
                                                                        <tr height="40" {if $smarty.section.pi.index is not div by 2} bgcolor="#F2FFEC" {/if} >
                                                                            <td align="center" colspan="4">Chưa có tệp tin nào</td>
                                                                        </tr>
                                                                        {/if}
                                                                    </table>
                                                                </td>
                                                              </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr height="10"><td></td></tr>
                                                    <tr {if $finish neq 1 and $user_level_tnvb neq 4 and $user_level_tnvb neq 5 and $user_level_tnvb neq 6 and $user_level_tnvb neq 7 and $user_level_tnvb neq 8}style="display:none"{/if}>
                                                        <td align="center" colspan="2">
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                              <tr>
                                                                <td width="15%" align="left" height="20">
                                                                <font class="label_font" color="#425E89">Kết quả giải quyết:</font></td>		
                                                              </tr>
                                                              <tr>
                                                                <td align="left">
                                                                 <textarea name="doc_note" cols="10" rows="10" style="width:635px; height:80px">{$vars.doc_note}</textarea>
                                                                </td>
                                                              </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr style="display:none">
                                                        <td align="left" height="20">
                                                        <font class="label_font" color="#425E89">Tình trạng:</font></td>		
                                                        <td align="left">
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                              <tr>
                                                                <td width="20%">
                                                                <input type="radio" id="doc_active" name="doc_active" value="1" {if $vars.doc_active eq 1} checked="checked" {/if}/>&nbsp;Hiển thị</td>
                                                                <td>
                                                                <input type="radio" id="doc_active" name="doc_active" value="2" {if $vars.doc_active eq 2} checked="checked" {/if}/>&nbsp;Không hiển thị</td>
                                                              </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2" align="left" style="padding-top:10px">
                                                        {if $finish eq 1 or $user_level_tnvb eq 4 or $user_level_tnvb eq 5 or $user_level_tnvb eq 6 or $user_level_tnvb eq 7 or $user_level_tnvb eq 8}
                                                        <input type="submit" name="submitDoc" value="Hoàn thành công việc"/>
                                                        {else}
                                                        <input type="submit" name="submitDoc" value="Cập nhật"/>
                                                        {/if}
                                                        <input type="hidden" name="arg" value="{$arg.arg}" />
                                                        <input type="hidden" name="doc_id" value="{$vars.doc_id}">
                                                        <input type="hidden" name="input_per" value="{$vars.access_user_id}">
                                                        <input type="hidden" name="doc_traned" value="{$vars.doc_traned}">
                                                        <input type="hidden" name="doc_replied" value="{$vars.doc_replied}">
                                                        <input type="hidden" name="doc_active" value="{$vars.doc_active}">
                                                        <input type="reset" name="reset" value="Quay lại &gt;&gt;" onClick="history.go(-1)">
                                                        </td>
                                                    </tr>
                                                 </table>
                                                 </div>
                                                 </form>							
                                                 {/if}								
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