{literal}
<style type="text/css">
.error { color:#FF0000;font-weight:bold; margin-left:5px; height:20px; line-height:20px}
.msg{ color:#00F; font-weight:bold; margin-left:5px; height:20px; line-height:20px}
.tbl_tit{
float:left; line-height:25px; border-right:1px solid #99bbe8; 	
}
.tbl_cont{
float:left; line-height:25px; border-right:1px solid #99bbe8; border-bottom:1px solid #99bbe8; background:#F2FFEC
}
.tbl_cont2{
float:left; line-height:25px; border-right:1px solid #99bbe8; border-bottom:1px solid #99bbe8; background:#FFF
}
</style>
{/literal}
{if $user_level eq 1 or $user_level eq 2 or $user_level eq 9}
{literal}
<script language="javascript">
	function set_focus(){
		document.frmList_DocOut.docOut_num.focus();
	}
	
	// Select box to box
	function listbox_moveacross(sourceID, destID) {
		var src = document.getElementById(sourceID);
		var dest = document.getElementById(destID);
		for(var count=0; count < src.options.length; count++) {
			if(src.options[count].selected == true) {
				var option = src.options[count];
				var newOption = document.createElement("option");
				newOption.value = option.value;
				newOption.text = option.text;
				newOption.selected = true;
				try {
						 dest.add(newOption, null); //Standard
						 src.remove(count, null);
				 }catch(error) {
						 dest.add(newOption); // IE only
						 src.remove(count);
				 }
				count--;
			}
		}
	}
	window.onload=set_focus();
</script>
{/literal}
{/if}
<div id="doc_content_insign">
	<form method="post" name="frmList_DocOut" action="?listDocOut{$vars.arg}" id="frmList_DocOut">
    {if $user_level eq 1 or $user_level eq 2 or $user_level eq 9}
    <!------------------------------------------THEM MOI------------------------------------>
    <fieldset style="width:1012px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
        <legend class="legend_list_search">
            Thêm/Chỉnh sửa&nbsp;|&nbsp;Thông báo:&nbsp;
            <span class="msg">{$error}{$complete}</span>
            <span id="lblError_DocOut" class="error">(*) là các mục bắt buộc!</span>
        </legend>
    	<table width="98%" cellspacing="0" cellpadding="0" border="0" style="margin-left:5px">
        	<tr height="10"><td colspan="2"></td></tr>
            <tr height="30">
            	<td align="center" width="33%" valign="top">
                	<div style="float:left; width:30%; line-height:25px; text-align:left; color:#F00">Số văn bản <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left">
                    	<input type="text" id="docOut_num" name="docOut_num" value="{if $obj_info.docOut_num neq ''}{$obj_info.docOut_num}{else}{$obj_info.docOut_num_typical}{/if}"  class="text_short" style="color:#F00" tabindex="1"/>
                    </div>
                    <div style="float:left; width:30%; line-height:25px; text-align:left">Ngày văn bản <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left">
                    	<input type="text" name="docOut_date" id="docOut_date" value="{if $vars.docOut_date neq ''}{$obj_info.docOut_date|date_format:"%d/%m/%Y"}{else}{$smarty.now|date_format:"%d/%m/%Y"}{/if}" class="text_time_callender" tabindex="2"/>&nbsp;<img src="../images/admin/img.gif" align="absmiddle" id="date_docOut" style="cursor: pointer; border: 0" title="Chọn ngày trên lịch"/>
                        {literal}
						<script type="text/javascript">
                            Calendar.setup({
                                inputField   :   "docOut_date",
                                ifFormat     :   "%d/%m/%Y",
                                button       :   "date_docOut",
                                align        :   "Br",  
                                timeFormat   :   "24",
                                showsTime    :   true,
                                singleClick  :   true
                            });
                        </script>
                        {/literal}
                    </div>
                    <div style="float:left; width:30%; line-height:25px; text-align:left">Loại văn bản <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left">
                    	<select name="docCat_id" id="docCat_id" class="select_middle" tabindex="3">
                            <option value="0">Chọn loại văn bản</option>
                            {section name=qi loop=$obj_list_dcat}
                            <option value="{$obj_list_dcat[qi]->docCat_id}" {if $obj_list_dcat[qi]->docCat_id eq $obj_info.docCat_id}selected="selected"{/if}>-&nbsp;{$obj_list_dcat[qi]->docCat_name}</option>
                            {/section}
                        </select>
                    </div>
                    <div style="float:left; width:30%; line-height:25px; text-align:left">Nơi dự thảo <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left">
                    	{if $user_level eq 6 or $user_level eq 7 or $user_level eq 8}
                        <select name="department_id" id="department_id" class="select_middle" tabindex="4">
                            <option value="0">Chọn đơn vị dự thảo</option>
                            {section name=qi loop=$obj_list_department}
                            {if $obj_list_department[qi]->department_id eq $access_unit_id}
                            <option value="{$obj_list_department[qi]->department_id}">-&nbsp;{$obj_list_department[qi]->department_name}</option>
                            {/if}
                            {/section}
                        </select>
                        {else}
                    	<select name="department_id" id="department_id" class="select_middle" tabindex="4">
                            <option value="0">Chọn đơn vị dự thảo</option>
                            {section name=qi loop=$obj_list_department}
                            <option value="{$obj_list_department[qi]->department_id}" {if $obj_list_department[qi]->department_id eq $obj_info.department_id}selected="selected"{/if}>-&nbsp;{$obj_list_department[qi]->department_name}</option>
                            {/section}
                        </select>
                        {/if}
                        {literal}
                        <script language="javascript">
                        $("#department_id").change( function () { 
                             var docCat_id  = $("#docCat_id").val();
                             var docOut_num = $("#docOut_num").val();
                             var department_id = $("#department_id").val();
                             $("#j_docOut_code").load("index.php?B_docOut_code&docCat_id="+docCat_id+"&docOut_num="+docOut_num+"&department_id="+department_id); 
                            });
                        </script>
                        {/literal}
                    </div>
                    <div style="float:left; width:30%; line-height:25px; text-align:left">Số ký hiệu <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left" id="j_docOut_code">
                        <input type="text" id="docOut_code" name="docOut_code" class="text_middle" value="{$obj_info.docOut_code}" readonly/>
                    </div>
                    <div style="float:left; width:30%; line-height:25px; text-align:left">Lĩnh vực:</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left">
                    	<input type="text" value="{$obj_info.docField_id}" id="docField_id" name="docField_id" class="text_middle" tabindex="5"/>
                        {literal}
						<script type="text/javascript">
                        $().ready(function() {
                            $("#docField_id").autocomplete("B_docField_auto.php", {
                                width: 160,
                                matchContains: true,
								selectFirst: true
                            });
                        });
                        </script>
                        {/literal}
                    </div>
                    <div style="float:left; width:30%; line-height:25px; text-align:left">Người ký <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left">
                    	<select name="docOut_signed" id="docOut_signed" class="select_middle" tabindex="6">
                            <option value="0">Chọn người ký</option>
                            {section name=qi loop=$obj_list_user_bgd}
                            <option value="{$obj_list_user_bgd[qi]->user_id}" {if $obj_list_user_bgd[qi]->user_id eq $obj_info.docOut_signed}selected="selected"{/if}>-&nbsp;{$obj_list_user_bgd[qi]->user_fullname}</option>
                            {/section}
                        </select>
                        {literal}
						<script type="text/javascript">
                        $("#docOut_signed").change( function () { 
							var docOut_signed = document.getElementById('docOut_signed').value;
							$("#j_user_obj").load("index.php?B_user_obj&docOut_signed="+docOut_signed); 
						});
                        </script>
                        {/literal}
                    </div>
                    <div style="float:left; width:30%; line-height:25px; text-align:left">Chức vụ <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left" id="j_user_obj">
                    	<input type="text" value="{$obj_info.docOut_obj}" id="docOut_obj" name="docOut_obj" class="text_middle" tabindex="7" onfocus="hide_message_DocOut();" readonly="readonly"/>
                    </div>
                </td>
                <td align="center" valign="top">
                	<div style="float:left; width:13%; line-height:25px; text-align:left">Trích yếu <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:87%; line-height:25px; text-align:left; height:75px">
                    	<textarea spellcheck="false" name="docOut_desc" id="docOut_desc" cols="30" rows="5" class="text_area_long" onfocus="hide_message_DocOut()" tabindex="8">{$obj_info.docOut_desc}</textarea>
                    </div>
                    <div style="float:left; width:13%; line-height:25px; text-align:left">Độ mật:</div>
                    <div style="float:left; width:19%; line-height:25px; text-align:left">
                    	<select name="secret_id" id="secret_id" class="select_short" tabindex="9">
                            {section name=qi loop=$obj_list_secret}
                            <option value="{$obj_list_secret[qi]->secret_id}" {if $obj_list_secret[qi]->secret_id eq $obj_info.secret_id}selected="selected"{/if}>-&nbsp;{$obj_list_secret[qi]->secret_name}</option>
                            {/section}
                        </select>
                    </div>
                    <div style="float:left; width:10%; line-height:25px; text-align:left">Độ khẩn:</div>
                    <div style="float:left; width:18%; line-height:25px; text-align:left">
                    	<select name="important_id" id="important_id" class="select_short" tabindex="10">
                            {section name=qi loop=$obj_list_important}
                            <option value="{$obj_list_important[qi]->important_id}" {if $obj_list_important[qi]->important_id eq $obj_info.important_id}selected="selected"{/if}>-&nbsp;{$obj_list_important[qi]->important_name}</option>
                            {/section}
                        </select>
                    </div>
                    <div style="float:left; width:10%; line-height:25px; text-align:left">Số trang <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:10%; line-height:25px; text-align:left">
                    	<input type="text" id="docOut_pagenum" name="docOut_pagenum" value="{$obj_info.docOut_pagenum}" class="text_tiny" tabindex="11"/>
                    </div>
                    <div style="float:left; width:20%; line-height:25px; text-align:left">
                    	&nbsp;<b>(Người nhập: {$access_user_name})</b>
                    </div>


                    <!-------------------------------------------------------------------------->
                    <div style="float:left; width:13%; line-height:25px; text-align:left">Lựa chọn <font color="#FF0000">*</font>:<br>nơi nhận<br>hoặc....</div>
                    {if $obj_info.unit_name neq ''}
                        <div id="noinhan_chon" style="float:left; width:87%; line-height:25px; text-align:left; height:76px">
                            <div style="float:left; width:246px; margin-top:2px">
                                <select id="unit_move" size="6" multiple="multiple" class="select_middle" style="width:246px; height:69px" tabindex="13">
                                    {section name=qi loop=$obj_list_unit_notin}
                                        <option value="{$obj_list_unit_notin[qi]->unit_id}">-&nbsp;{$obj_list_unit_notin[qi]->unit_name}</option>
                                    {/section}
                                </select>
                            </div>
                            <div style="float:left; width:60px">
                                <div style="float:left; padding-left:10px; padding-top:10px">
                                    <input type="button" name="addto" onClick="listbox_moveacross('unit_move', 'unit_name')" value="&gt;&gt;" class="button_small"></div>
                                <div style="float:left; padding-left:10px">
                                    <input type="button" name="addto" onClick="listbox_moveacross('unit_name', 'unit_move')" value="&lt;&lt;" class="button_small"></div>
                            </div>
                            <div style="float:left; width:246px; margin-top:2px">
                                <select name="unit_name" id="unit_name" size="6" multiple="multiple" class="select_middle" style="width:246px; height:69px">
                                    {section name=qi loop=$obj_list_unit_in}
                                        <option value="{$obj_list_unit_in[qi]->unit_id}">-&nbsp;{$obj_list_unit_in[qi]->unit_name}</option>
                                    {/section}
                                </select>
                            </div>
                        </div>
                    {else}
                        <div id="noinhan_chon" style="float:left; width:87%; line-height:25px; text-align:left; height:76px">
                            <div style="float:left; width:246px; margin-top:2px">
                                <select id="unit_move" size="6" multiple="multiple" class="select_middle" style="width:246px; height:69px" tabindex="13">
                                    {section name=qi loop=$obj_list_unit}
                                        <option value="{$obj_list_unit[qi]->unit_id}">-&nbsp;{$obj_list_unit[qi]->unit_name}</option>
                                    {/section}
                                </select>
                            </div>
                            <div style="float:left; width:60px">
                                <div style="float:left; padding-left:10px; padding-top:10px">
                                    <input type="button" name="addto" onClick="listbox_moveacross('unit_move', 'unit_name')" value="&gt;&gt;" class="button_small"></div>
                                <div style="float:left; padding-left:10px">
                                    <input type="button" name="addto" onClick="listbox_moveacross('unit_name', 'unit_move')" value="&lt;&lt;" class="button_small"></div>
                            </div>
                            <div style="float:left; width:246px; margin-top:2px">
                                <select name="unit_name" id="unit_name" size="6" multiple="multiple" class="select_middle" style="width:246px; height:69px"></select>
                            </div>
                        </div>
                    {/if}
                    <!------------------------------------------------------------------------------------->

                    <div style="float: left; width:100%">
                    <div style="float:left; width:13%; line-height:25px; text-align:left">Nhập tay:</div>
                    <div style="float:left; width:55%; line-height:25px; text-align:left">
                    	<input type="text" id="unit_name_02" name="unit_name_02" size="10" value="{$obj_info.unit_name_02}" class="text_long" tabindex="12"/>
                    </div>

                    <div style="float:left; width:4%; line-height:25px; text-align:left">
                    <a href="javascript: void(0);" onClick="add_more()" style="text-decoration:none; color:#F00">
                	<div style="float:left; margin-left:3px">
                    <img src="{$css_path}icon_keo_dai.png" class="img_all"></div></a>
                    </div>
                    <div style="float:left; width:25%; line-height:25px; text-align:right">
                    	<input type="button" name="btnSub_DocOut" id="btnSub_DocOut" value="Ghi lại" class="button" tabindex="13"/>
                        <input type="hidden" name="docOut_id" id="docOut_id" value="{$obj_info.docOut_id}">
                        <input type="hidden" name="docOut_file" id="docOut_file" value="{$obj_info.docOut_file}">
                        <input type="hidden" name="input_per" id="input_per" value="{$obj_info.input_per}">
                        <input type="reset" name="Reset" value="Hủy bỏ" class="button" tabindex="14"/>
                        {literal}
                        <script language="javascript">
                            function hide_message_DocOut(){
                                $('#lblMessage_DocOut').hide();
                                $('#lblError_DocOut').hide();
                            }
                            
                            $(function() {
                            $('.error').hide();
                            $('#lblMessage_DocOut').hide();
                             
                            $("#btnSub_DocOut").click(function() {
                                $('.error').hide();
                                 
                                var $form = $("#frmList_DocOut");
                                var docOut_num = $form.find('input#docOut_num').val();
								var docOut_date = $form.find('input#docOut_date').val();
								var docCat_id = $form.find('select#docCat_id :selected').val();
								var department_id = $form.find('select#department_id :selected').val();
								var docOut_code = $form.find('input#docOut_code').val();
								var docField_id = $form.find('input#docField_id').val();
								var docOut_signed = $form.find('select#docOut_signed :selected').val();
								var docOut_obj = $form.find('input#docOut_obj').val();
								var docOut_desc = $form.find('textarea#docOut_desc').val();docOut_pagenum
								var secret_id = $form.find('select#secret_id :selected').val();
								var important_id = $form.find('select#important_id :selected').val();
								var docOut_pagenum = $form.find('input#docOut_pagenum').val();
								// --- get data from list box
								var items = [];
								$('#unit_name option:selected').each(function(){ items.push($(this).val()); });
								var unit_name = items.join(', ');
								var unit_name_02 = $form.find('input#unit_name_02').val(); // tu nhap
								// --- get data from list box
								var items = [];
								$('#interdisci_name option:selected').each(function(){ items.push($(this).val()); });
								var interdisci_name = items.join(', ');
								var interdisci_name_02 = $form.find('input#interdisci_name_02').val(); // tu nhap
								
								var docOut_id = $form.find('input#docOut_id').val();
								var docOut_file = $form.find('input#docOut_file').val();
								var input_per = $form.find('input#input_per').val();
								
                                //begin validate form
                                if (docOut_num == "" || docOut_date == "" || docCat_id == 0 || department_id == 0 || docOut_code == "" || docOut_signed == "" || docOut_obj == "" || docOut_desc == "" || docOut_pagenum == "" ||( unit_name == "" && unit_name_02 == "")){
                                    $('#lblError_DocOut').show();
                                }
                                else{
									$.post('index.php?listDocOut&mod=docs&add_edit=1',
										{
											docOut_num:docOut_num,
											docOut_date:docOut_date,
											docCat_id:docCat_id,
											department_id:department_id,
											docOut_code:docOut_code,
											docField_id:docField_id,
											docOut_signed:docOut_signed,
											docOut_obj:docOut_obj,
											docOut_desc:docOut_desc,
											secret_id:secret_id,
											important_id:important_id,
											docOut_pagenum:docOut_pagenum,
											unit_name:unit_name,
											unit_name_02:unit_name_02,
											interdisci_name:interdisci_name,
											interdisci_name_02:interdisci_name_02,
											
											docOut_id:docOut_id,
											docOut_file:docOut_file,
											input_per:input_per,
										},
										function(data){
											$('#doc_content_main').html(data);
											$("#doc_content_main").show();
										}
									);
                                    return false;
                                }
                                //end form
                            });
                        });
                        </script>
                        {/literal}
                    </div>
                    </div>
                    <div style="position:absolute; width:655px; margin:201px 0 0 -5px; height:80px; text-align:left; display:none; background-color:#dfe8f6; border:1px solid #99bbe8; border-top:none; z-index:1005" id="div_add_more">
                    <div style="float:left; width:13.3%; line-height:25px; text-align:left; margin-left:4px">Người ký liên ngành:</div>
                    <div style="float:left; width:85%; line-height:25px; text-align:left; height:55px">
                    	{if $obj_info.interdisci_move neq ''}
                        <div style="float:left; width:246px; margin-top:2px">
                        	<select id="interdisci_move" multiple="multiple" class="select_middle" style="width:246px; height:46px">
                                 {section name=qi loop=$obj_list_interdisci_notin}
                                <option value="{$obj_list_interdisci_notin[qi]->interdisci_id}">-&nbsp;{$obj_list_interdisci_notin[qi]->interdisci_name}</option>
                                {/section}
                            </select>
                        </div>
                        <div style="float:left; width:60px">
                            <div style="float:left; padding-left:10px; padding-top:2px">
                            <input type="button" name="addto" onClick="listbox_moveacross('interdisci_move', 'interdisci_name')" value="&gt;&gt;" class="button_small"></div>
                            <div style="float:left; padding-left:10px">
                            <input type="button" name="addto" onClick="listbox_moveacross('interdisci_name', 'interdisci_move')" value="&lt;&lt;" class="button_small"></div>
                        </div>
                        <div style="float:left; width:246px; margin-top:2px">
                            <select name="interdisci_name" id="interdisci_name" size="5" multiple="multiple"  class="select_middle" style="width:246px; height:46px">
                            {section name=qi loop=$obj_list_interdisci_in}
                            <option value="{$obj_list_interdisci_in[qi]->interdisci_id}">-&nbsp;{$obj_list_interdisci_in[qi]->interdisci_name}</option>
                            {/section}
                            </select>
                        </div>
                        {else}
                        <div style="float:left; width:246px; margin-top:2px">
                        	<select id="interdisci_move" multiple="multiple" class="select_middle" style="width:246px; height:46px">
                                {section name=qi loop=$obj_list_interdisci}
                                <option value="{$obj_list_interdisci[qi]->interdisci_id}">-&nbsp;{$obj_list_interdisci[qi]->interdisci_name}</option>
                                {/section}
                            </select>
                        </div>
                        <div style="float:left; width:60px">
                            <div style="float:left; padding-left:10px; padding-top:2px">
                            <input type="button" name="addto" onClick="listbox_moveacross('interdisci_move', 'interdisci_name')" value="&gt;&gt;" class="button_small"></div>
                            <div style="float:left; padding-left:10px">
                            <input type="button" name="addto" onClick="listbox_moveacross('interdisci_name', 'interdisci_move')" value="&lt;&lt;" class="button_small"></div>
                        </div>
                        <div style="float:left; width:246px; margin-top:2px">
                            <select name="interdisci_name" id="interdisci_name" size="5" multiple="multiple"  class="select_middle" style="width:246px; height:46px"></select>
                        </div>
                        {/if}
                    </div>
                    <div style="float:left; width:13.3%; line-height:25px; text-align:left; margin-left:4px">Tự nhập:</div>
                    <div style="float:left; width:85%; line-height:25px; text-align:left">
                    	<input type="text" id="interdisci_name_02" name="interdisci_name_02" size="10" value="{$interdisci_name_02}" class="text_long"/>
                    </div>
                    </div>
                </td>
            </tr>
        </table>
    </fieldset>
    {/if}
    <!------------------------------------DANH SACH---------------------------------------------->
    <fieldset style="width:1012px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; {if $user_level eq 1 or $user_level eq 2 or $user_level eq 9}height:223px{else}height:462px{/if}">
        <legend class="legend_list" style="width:905px">
            <div style="width:130px; float:left">Danh sách: {$total_num_result}</div>
            <div style="width:70px; float:left">&nbsp;|&nbsp;Tìm kiếm:&nbsp;</div>
            <div style="width:380px; float:left; font-weight:normal">
                <div style="float:left">
                    <div style="float:left; width:60px">- Trích yếu: </div>
                    <div style="float:left; width:300px">
                    <input type="text" id="docOut_desc_fs" name="docOut_desc_fs" class="text_seek_long" value="{$vars.docOut_desc_fs}"/>
                    </div>
                    <input type="hidden" id="processurl" value="{$processurl}" />
                </div>
                <a href="javascript: void(0);" onClick="show_hide_seek()" style="text-decoration:none; color:#F00">
                <div style="float:left; margin-left:3px"><img src="{$css_path}icon_keo_dai.png" class="img_all"></div></a>
            </div>
            <div style="width:380px; float:left; font-weight:normal; position:absolute; display:none; margin:20px 0 0 200px; background-color:#ccd8e7; border:1px solid #99bbe8; border-top:none; padding-top: 5px" id="seek_more">
                <div style="float:left; width:60px; margin-bottom:5px">- Ký hiệu: </div>
                <div style="float:left; width:95px; margin-bottom:5px">
                <input type="text" id="docOut_code_fs" name="docOut_code_fs" class="text_seek_tiny" value="{$vars.docOut_code_fs}" />
                </div>
                <div style="float:left; width:79px; margin-bottom:5px">- ĐV dự thảo: </div>
                <div style="float:left; width:145px; margin-bottom:6px">
                <select name="department_id_fs" id="department_id_fs" class="text_seek_middle">
                    <option value="0">Chọn đơn vị dự thảo</option>
                    {section name=qi loop=$obj_list_department}
                    <option value="{$obj_list_department[qi]->department_id}">-&nbsp;{$obj_list_department[qi]->department_name}</option>
                    {/section}
                </select>
                </div>
                <div style="float:left; width:60px; margin-bottom:5px">- Số đi: </div>
                <div style="float:left; width:95px; margin-bottom:5px">
                <input type="text" id="docOut_num_fs" name="docOut_num_fs" class="text_seek_tiny" value="{$vars.docOut_num_fs}" />
                </div>
                <div style="float:left; width:79px; margin-bottom:5px">- Loại VB: </div>
                <div style="float:left; width:145px; margin-bottom:6px">
                <select name="docCat_id_fs" id="docCat_id_fs" class="text_seek_middle">
                    <option value="0">Chọn loại văn bản</option>
                    {section name=qi loop=$obj_list_dcat}
                    <option value="{$obj_list_dcat[qi]->docCat_id}">-&nbsp;{$obj_list_dcat[qi]->docCat_name}</option>
                    {/section}
                </select>
                </div>
                <div style="float:left; width:60px; margin-bottom:5px">- Ngày VB:</div>
                <div style="float:left; width:95px; margin-bottom:5px">
                	<div style="float:left; width:90px; background-color:#FFF">
                    	<input type="text" id="ngay_vb_1" name="ngay_vb_1" class="text_date" value="{$obj_info.ngay_vb|date_format:'%d'}" onfocus="hide_message()" maxlength="2"/>/
                        <input type="text" id="ngay_vb_2" name="ngay_vb_2" class="text_month" value="{$obj_info.ngay_vb|date_format:'%m'}" onfocus="hide_message()" maxlength="2"/>/
                        <input type="text" id="ngay_vb_3" name="ngay_vb_3" class="text_month" value="{$db_year|date_format:"%Y"}" readonly="readonly"/>
                    </div>
                </div>
                <div style="float:left; width:79px; margin-bottom:5px">- Người ký: </div>
                <div style="float:left; width:145px; margin-bottom:5px">
                <select name="user_id_fs" id="user_id_fs" class="text_seek_middle">
                    <option value="0">Chọn người ký</option>
                    {section name=qi loop=$obj_list_user_bgd}
                    <option value="{$obj_list_user_bgd[qi]->user_id}">-&nbsp;{$obj_list_user_bgd[qi]->user_fullname}</option>
                    {/section}
                </select>
                </div>
                
            </div>
            <div style="width:45px; float:left">
                <input type="button" name="btnSeek" id="btnSeek" value="Tìm >>" class="button_seek" onclick="search_me_DocOut()" />
            </div>
            <!-----------------------------------------KET XUAT--------------------------------------->
            <div style="width:100px; float:left">&nbsp;|&nbsp;Kết xuất:&nbsp;</div>
            <a href="javascript: void(0);" onClick="show_hide_filter()" style="text-decoration:none">
            <div style="float:left; margin-left:10px; width:78px">Lọc dữ liệu</div></a>
            <div style="width:92px; float:left; height:20px; margin-top:1px">
                <a href="javascript: void(0);" onClick="export_doc(1)" style="text-decoration:none; color:#F00">
                <div style="float:left; margin-left:5px; width:26px">
                <img src="../images/admin/word_icon.png" class="img_all" height="20" title="Kết xuất MS Word"></div>
                </a>
                <a href="javascript: void(0);" onClick="export_doc(2)" style="text-decoration:none; color:#F00">
                <div style="float:left; margin-left:5px; width:26px">
                <img src="../images/admin/excel_icon.png" class="img_all" height="20" title="Kết xuất MS Excel"></div>
                </a>
                <a href="javascript: void(0);" onClick="export_doc(3)" style="text-decoration:none; color:#F00">
                <div style="float:left; margin-left:5px; width:25px">
                <img src="../images/admin/print_pre_icon.png" class="img_all" height="20" title="Xem trước khi in"></div>
                </a>
            </div>
            <div style="width:300px; float:left; font-weight:normal; position:absolute; display:none; margin:20px 0 0 604px; background-color:#ccd8e7; border:1px solid #99bbe8; border-top:none; padding-top: 5px" id="div_filter">
                <div style="float:left; width:65px; margin-bottom:5px">- Ban hành:</div>
                <div style="float:left; width:20px; margin-bottom:5px">Từ&nbsp;</div>
                <div style="float:left; width:90px; background-color:#FFF; margin-bottom:5px">
                <input type="text" id="tungay_1" name="tungay_1" class="text_date" value="{$smarty.now|date_format:'%d'}" maxlength="2"/>
                /<input type="text" id="tungay_2" name="tungay_2" class="text_month" value="{$smarty.now|date_format:'%m'}" maxlength="2" />
                /<input type="text" id="tungay_3" name="tungay_3" class="text_year" value="{$smarty.now|date_format:'%Y'}" maxlength="4" />
                </div>
                <div style="float:left; width:24px; margin-bottom:5px; margin-left:5px">đến&nbsp;</div>
                <div style="float:left; width:90px; margin-bottom:5px; background-color:#FFF">
                <input type="text" id="denngay_1" name="denngay_1" class="text_date" value="{$smarty.now|date_format:'%d'}" maxlength="2" />
                /<input type="text" id="denngay_2" name="denngay_2" class="text_month" value="{$smarty.now|date_format:'%m'}" maxlength="2" />
                /<input type="text" id="denngay_3" name="denngay_3" class="text_year" value="{$smarty.now|date_format:'%Y'}" maxlength="4" />
                </div>
                
                <div style="float:left; width:65px; margin-bottom:5px">- Số đi:</div>
                <div style="float:left; width:20px; margin-bottom:5px">Từ&nbsp;</div>
                <div style="float:left; width:90px; background-color:#FFF; margin-bottom:5px">
                <input type="text" id="sodi_tu" name="sodi_tu" class="text_seek_tiny" value="{$vars.sodi_tu}" />
                </div>
                <div style="float:left; width:24px; margin-bottom:5px; margin-left:5px">đến&nbsp;</div>
                <div style="float:left; width:90px; margin-bottom:5px; background-color:#FFF">
                <input type="text" id="sodi_den" name="sodi_den" class="text_seek_tiny" value="{$vars.sodi_den}" />
                </div>
                
                <div style="float:left; width:85px; margin-bottom:5px">- Loại văn bản: </div>
                <div style="float:left; width:160px; margin-bottom:5px">
                <select name="docCat_id_fil" id="docCat_id_fil" class="select_seek">
                    <option value="0">Chọn loại văn bản</option>
                    {section name=qi loop=$obj_list_dcat}
                    <option value="{$obj_list_dcat[qi]->docCat_id}">-&nbsp;{$obj_list_dcat[qi]->docCat_name}</option>
                    {/section}
                </select>
                </div>
                
                <div style="float:left; width:85px; margin-bottom:5px">- ĐV dự thảo: </div>
                <div style="float:left; width:160px; margin-bottom:5px">
                <select name="department_fil" id="department_fil" class="select_seek">
                    <option value="">Chọn phòng ban</option>
                    {section name=di loop=$obj_list_department}
                    <option value="{$obj_list_department[di]->department_id}">{$obj_list_department[di]->department_name}</option>
                    {/section}
                </select>
                </div>
                
                <div style="float:left; width:85px; margin-bottom:5px">- Loại sổ: </div>
                <div style="float:left; width:160px; margin-bottom:5px">
                <select name="docOut_typical" id="docOut_typical" class="select_seek">
                    <option value="0" {if $docOut_typical eq 0} selected="selected"{/if}>Sổ thường</option>
                    <option value="1" {if $docOut_typical eq 1} selected="selected"{/if}>Sổ giấy mời</option>
                </select>
                </div>
            </div>
        </legend>
    	<div style="float:left; height:5px; width:100%"></div>
        <div style="float:left; height:25px; width:990px; border-top:1px solid #99bbe8; border-bottom:1px solid #99bbe8 ">
            <div class="tbl_tit" style="width:42px; text-align:center"><b>STT</b></div>
            <div class="tbl_tit" style="width:100px"><B>&nbsp;Loại văn bản</B></div>
            <div class="tbl_tit" style="width:50px; text-align:right"><B>&nbsp;Số đi&nbsp;</B></div>
            <div class="tbl_tit" style="width:100px"><B>&nbsp;Ký hiệu</B></div>
            <div class="tbl_tit" style="width:70px"><B>&nbsp;Ngày tháng</B></div>
            <div class="tbl_tit" style="width:299px"><B>&nbsp;Trích yếu</B></div>
            <div class="tbl_tit" style="width:180px"><B>&nbsp;Nơi nhận</B></div>
            <div class="tbl_tit" style="width:50px; text-align:center"><B>Tệp tin</B></div>
            <div class="tbl_tit" style="width:59px; text-align:center"><B>Chọn</B></div>
            <div class="tbl_tit" style="width:30px; text-align:center">
            <input type="hidden" name="chon" id="chon_DocOut">
            <input type="checkbox" name="chkall" value="0" onclick="docheck_DocOut(document.frmList_DocOut.chkall.checked,0);">
            </div>
        </div>
        <div style="float:left; width:20px; text-align:right">
        {if $user_level eq 2 or $user_level eq 9}
        <input type="button" name="del_Items" id='del_Items' value="&nbsp;" onClick="delItems_DocOut('{$processurl}');" style="width:17px; font-size:12px; background:url(../images/admin/b_drop.png); cursor:pointer" title="Xóa lựa chọn">
        {else}
        <input type="button" name="del_Items" id='del_Items' value="&nbsp;" disabled="disabled" style="width:17px; font-size:12px; background:url(../images/admin/b_drop.png); cursor:pointer" title="Xóa lựa chọn">
        {/if}
        </div>
        <div style="float:left; {if $user_level eq 1 or $user_level eq 2 or $user_level eq 9}height:166px{else}height:405px{/if}; width:1012px; overflow-y:scroll">
            {section name=pi loop=$obj_list}
            {if $smarty.section.pi.index is not div by 2} 
            {assign var="class_td" value="tbl_cont"} 
            {else}
            {assign var="class_td" value="tbl_cont2"} 
            {/if}
            {math x=$vars.curpage-1 y=$vars.numresult z=$smarty.section.pi.index t=1 equation="x*y+z+t" assign=stt}
            <div class="{$class_td}" style="width:42px; text-align:center">{$stt}</div>
            <div class="{$class_td}" style="width:100px" title="{$obj_list[pi]->docCat_id}">&nbsp;
                {section name=qi loop=$obj_list_dcat}
                    {if $obj_list_dcat[qi]->docCat_id eq $obj_list[pi]->docCat_id}
                    {$obj_list_dcat[qi]->docCat_name}
                    {/if}
                {/section}
            </div>
            <div class="{$class_td}" style="width:50px; text-align:right">
            	&nbsp;
                {if $obj_list[pi]->docOut_num neq '' and $obj_list[pi]->docOut_num neq 0}
                {$obj_list[pi]->docOut_num}
                {else}
                {$obj_list[pi]->docOut_num_typical}
                {/if}
                &nbsp;
            </div>
            {php}
            $mystr = $this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->docOut_code;
            $code_str = substr($mystr,strpos($mystr,'/')+1,strlen($mystr) - strpos($mystr,'/')+1);
            {/php}
            <div class="{$class_td}" style="width:100px; white-space:nowrap" title="{php}echo $code_str{/php}">&nbsp;
                {php}echo fnsSubstr($code_str,15,1);{/php}
            </div>
            <div class="{$class_td}" style="width:70px">
            	&nbsp;{$obj_list[pi]->docOut_date|date_format:"%d-%m-%Y"}
            </div>
            {section name=qi loop=$obj_list_user_bgd}
                {if $obj_list_user_bgd[qi]->user_id eq $obj_list[pi]->docOut_signed}
                	{assign var="nguoi_ky" value=$obj_list_user_bgd[qi]->user_fullname}
                {/if}
            {/section}
            <div class="{$class_td}" style="width:299px; white-space:nowrap" title="{$obj_list[pi]->docOut_desc}&nbsp;(Người ký: {$nguoi_ky} - {$obj_list[pi]->docOut_obj})">
            	&nbsp;
                {if $per_edit eq 1}
                <a href="javascript: void(0);" onclick="show_me_DocOut({$obj_list[pi]->docOut_id})" >{$obj_list[pi]->docOut_desc|str_string_cut:"70":"1"}</a>
                {else}{$obj_list[pi]->docOut_desc|str_string_cut:"62":"1"}{/if}
            </div>
            {if $obj_list[pi]->unit_name neq ''}
            {php}
                $sql = "select * from tbl_units where unit_id in(".$this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->unit_name.")";
                $result = mysql_query($sql) or die($sql);
                $unit_name_str = "";
                $i=0;
                while($row = mysql_fetch_array($result)):
                    if($i < mysql_num_rows($result)):
                        $unit_name_str .=  $row['unit_name'].", ";
                    else:
                        $unit_name_str .= $row['unit_name'];
                    endif;
                    $i++;
                endwhile;
                
            {/php}
            <div class="{$class_td}" style="width:180px; white-space:nowrap" title="{php}echo $unit_name_str{/php}">&nbsp;{php}echo fnsSubstr($unit_name_str,35,1);{/php}</div>
            {else}
            <div class="{$class_td}" style="width:180px; white-space:nowrap" title="{php}echo $unit_name_02{/php}">&nbsp;{$obj_list[pi]->unit_name_02|str_string_cut:"35":"1"}</div>
            {/if}
            <div class="{$class_td}" style="width:50px; text-align:center">
                {if $obj_list[pi]->docOut_file eq 0 or $obj_list[pi]->docOut_file eq 2}
                <a href='javascript: void(0);' onclick="javascript: show_list_file({$obj_list[pi]->docOut_id})">
                <img src="../images/admin/empty_icon.png" width="14" height="14" border="0"></a>
                {else}
                <a href='javascript: void(0);' onclick="javascript: show_list_file({$obj_list[pi]->docOut_id})">
                <img src="../images/admin/folder_icon.png" width="14" height="14" border="0"></a>
                {/if}
            </div>
            <div class="{$class_td}" style="width:29px; text-align:center">
            	{if $user_level eq 2 or $user_level eq 9}
                <a href='javascript: void(0);' onclick="edit_me_DocOut({$obj_list[pi]->docOut_id})">
                <img src="../images/admin/b_edit.png" width="11" height="11" border="0" title="Sửa"></a>
                {else}-{/if}
            </div>
            <div class="{$class_td}" style="width:29px; text-align:center">
            	{if $user_level eq 2 or $user_level eq 9}
                <a href='javascript: void(0)' onClick="delItems_DocOut('{$processurl}', {$obj_list[pi]->docOut_id});">
                <img src="../images/admin/b_drop.png" width="11" height="11" border="0" title="Xóa"></a>
                {else}-{/if}
            </div>
            <div class="{$class_td}" style="width:30px; text-align:center">
            	<input type="checkbox" name="chkid" value="{$obj_list[pi]->docOut_id}" onclick="docheckone_DocOut();">
            </div>
            {/section}
        </div>
        <input type="hidden" id="curpage_DocOut" name="curpage" value="{$vars.curpage}" />
    </fieldset>
    </form>
</div>
<!------------------------------------------------- Tool bar --------------------------------------------->
<div id="doc_clear_txt"></div>
<div id="doc_tool_bar">

    <div id="doc_search_area">
    <select name="order" id = "order_DocOut" style="width:120px; font-size:12px; border:1px solid #99bbe8; margin-left:1px" onchange="reloadPage_DocOut('{$processurl}');">
    {section name=sli loop=$order_arr}
        <option value="{$smarty.section.sli.index}" {if $smarty.section.sli.index eq $vars.order}selected{/if} >
        {$order_arr[sli]}
        </option>
    {/section}
    </select>
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div id="doc_page_area">
    {if $vars.curpage eq 1}
    	<img src="{$css_path}icon_first_page.png" class="img_all">
    	<img src="{$css_path}icon_pre_page.png" class="img_all">
    {else}
    <a href="javascript: void(0)" id="first_page" onclick="gotoPage_DocOut('{$processurl}',parseInt(1));" title="Trang đầu">
    	<img src="{$css_path}icon_first_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="pre_page" onclick="gotoPage_DocOut('{$processurl}',parseInt(document.getElementById('page_DocOut').value)-parseInt(1));" title="Trang trước">
    	<img src="{$css_path}icon_pre_page.png" class="img_all">
    </a>
    {/if}
    </div>
    <div style="float:left; line-height:19px">
        <div style="float:left; width:35px">Trang</div> 
        <div style="float:left; width:35px">
        <input type="text" value="{$vars.curpage}" name="page" id="page_DocOut" onblur=" gotoPage_DocOut('{$processurl}',this.value);" style="width:30px; font-size:12px; height:15px; border:1px solid #99bbe8">
        </div>
        <div style="float:left; width:42px"> / {$num_page}</div>
    </div>
    <div id="doc_page_area">
    {if $vars.curpage eq $num_page}
    	<img src="{$css_path}icon_next_page.png" class="img_all">
        <img src="{$css_path}icon_last_page.png" class="img_all">
    {else}
    <a href="javascript: void(0)" id="next_page" onclick="gotoPage_DocOut('{$processurl}',parseInt(document.getElementById('page_DocOut').value)+parseInt(1));" title="Trang tiếp">
    	<img src="{$css_path}icon_next_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="last_page" onclick="gotoPage_DocOut('{$processurl}',parseInt({$num_page}));" title="Trang cuối">
    	<img src="{$css_path}icon_last_page.png" class="img_all">
    </a>
    {/if}
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:left; width:15px">
    <a href="javascript: void(0)" id="a_ref_DocOut" title="Tải lại"><img src="{$css_path}icon_refresh.png" class="img_all"></a>
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:right; line-height:19px; margin-right:2px">
        <div style="float:left; width:40px">Xem</div>
        <div style="float:left; width:52px">
            <select name="numresult" id="numresult_DocOut" style="width:50px; font-size:12px; border:1px solid #99bbe8" onchange="reloadPage_DocOut('{$processurl}');">
                {section name=sli loop=$nrs_arr}
                <option value="{$nrs_arr[sli]}" {if $nrs_arr[sli] eq $vars.numresult}selected{/if}>{$nrs_arr[sli]} </option>
                {/section}
            </select>
        </div>
        <div style="float:left; margin-right:1px">dòng / trang</div>
    </div>
    
</div>
{literal}
<script language="javascript">	
	function add_more(){
		if(document.getElementById('div_add_more').style.display=='none')
			document.getElementById('div_add_more').style.display='';
		else document.getElementById('div_add_more').style.display='none';
	}
	
	function show_hide_seek(){
		if(document.getElementById('seek_more').style.display=='none')
			document.getElementById('seek_more').style.display='';
		else document.getElementById('seek_more').style.display='none';
	}
	
	function show_hide_filter(){
		if(document.getElementById('div_filter').style.display=='none')
			document.getElementById('div_filter').style.display='';
		else document.getElementById('div_filter').style.display='none';
	}
	
	function docheck_DocOut(status,from_){
		var alen=document.frmList_DocOut.elements.length;
		alen=(alen>5)?document.frmList_DocOut.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
			document.frmList_DocOut.chkid[i].checked=status;
		}
		else{
			document.frmList_DocOut.chkid.checked=status;
		}
		if(from_>0) document.frmList_DocOut.chkall.checked=status;
	}
		
	function docheckone_DocOut(){
		var alen=document.frmList_DocOut.elements.length;
		var isChecked=true;
		alen=(alen>4)?document.frmList_DocOut.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_DocOut.chkid[i].checked==false)
					isChecked=false;
		}else{
			if(document.frmList_DocOut.chkid.checked==false)
				isChecked=false;
		}				
		document.frmList_DocOut.chkall.checked=isChecked;
	}
	
	function calculatechon_DocOut(){			
		var strchon="";
		var alen=document.frmList_DocOut.elements.length;				
		alen=(alen>2)?document.frmList_DocOut.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_DocOut.chkid[i].checked==true)
					strchon+=document.frmList_DocOut.chkid[i].value+",";
		}else{
			if(document.frmList_DocOut.chkid.checked==true)
				strchon=document.frmList_DocOut.chkid.value;
		}
		document.frmList_DocOut.chon_DocOut.value=strchon;
	}
	
	function delItems_DocOut(processurl,delStr){
		if (delStr == undefined){
			calculatechon_DocOut();
			delStr = document.getElementById("chon_DocOut").value;
		}
		if (delStr == ""){
			return false;
		}
		if(!confirm("THÔNG BÁO: \n\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
			return false;
		}	
		
		var numresult_DocOut,order_DocOut,curpage_DocOut;
		numresult = $("#numresult_DocOut").val();
		order = $("#order_DocOut").val();
		curpage = $("#curpage_DocOut").val();
		
		var dataString  = "numresult=" + numresult;
			dataString += "&order=" + order;
			dataString += "&curpage=" + curpage;
			dataString += "&dlStr=" + delStr +"";
			//alert (processurl+'--'+dataString);
		$.ajax({
			type: "POST",
			url: processurl,
			data: dataString,
			success: function(data) {
				$('#doc_content_main').fadeOut('fast').load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+curpage).fadeIn("fast");
			}
		});
	}
	
	function reloadPage_DocOut(processurl){
		var numresult_DocOut,order_DocOut,cur_pos;
		numresult = $("#numresult_DocOut").val();
		order = $("#order_DocOut").val();
		cur_pos = 0;
		$("#doc_content_main").load(processurl+"&numresult="+numresult+"&order="+order+"&cur_pos="+cur_pos);
	}
	
	function gotoPage_DocOut(processurl,page){
		var numresult_DocOut,order_DocOut,cur_pos;
		numresult = $("#numresult_DocOut").val();
		order = $("#order_DocOut").val();
		//alert(processurl+'-'+page+'-'+numresult+'-'+order);
		$("#doc_content_main").load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+page);
	}
	
	function show_list_file(docOut_id){
		document.getElementById('list_file').style.display='block';
		$("#list_file_cont").load("?listDocOutFile&mod=docs"+"&docOut_id="+docOut_id);
	}
	
	function uncheck_fns_DocOut(field,val,id){
		$("#doc_content_main").load("?listDocOut&mod=docs&checkUncheck="+val+"&setfield="+field+"&checkUncheckID="+id);
	}
	
	function sort_me_DocOut(id,val){
		$("#doc_content_main").load("?listDocOut&mod=docs&sort_me=1&docOut_id="+id+"&val="+val);
	}
	
	function search_me_DocOut(){
		var docOut_desc_fs 	= document.getElementById('docOut_desc_fs').value;
		var docOut_code_fs 	= document.getElementById('docOut_code_fs').value;
		var docOut_num_fs 		= document.getElementById('docOut_num_fs').value;
		var department_id_fs 	= document.getElementById('department_id_fs').value;
		var docCat_id_fs 	= document.getElementById('docCat_id_fs').value;
		if (docOut_desc_fs == "" && docOut_code_fs == "" && docOut_num_fs == "" && department_id_fs == 0 && docCat_id_fs == 0 && user_id_fs == 0){
			return false;
		}
		$.post('?listDocOut&mod=docs&search_me=1',
			{
				docOut_desc_fs:docOut_desc_fs,
				docOut_code_fs:docOut_code_fs,
				docOut_num_fs:docOut_num_fs,
				department_id_fs:department_id_fs,
				docCat_id_fs:docCat_id_fs
			},
			function(data){
				$('#doc_content_main').html(data);
				$("#doc_content_main").show();
			}
		);
	}
	
	// ----- ket xuat
	function export_doc(exptype){
		
		var tungay_1 	= document.getElementById('tungay_1').value;
		var tungay_2 	= document.getElementById('tungay_2').value;
		var tungay_3 	= document.getElementById('tungay_3').value;
		
		var denngay_1 	= document.getElementById('denngay_1').value;
		var denngay_2 	= document.getElementById('denngay_2').value;
		var denngay_3 	= document.getElementById('denngay_3').value;
		
		var sodi_tu 	= document.getElementById('sodi_tu').value;
		var sodi_den 	= document.getElementById('sodi_den').value;
		
		var docOut_typical 	= document.getElementById('docOut_typical').value;
		var docCat_id_fil 	= document.getElementById('docCat_id_fil').value;
		var department_fil 	= document.getElementById('department_fil').value;
		
		var tungay = tungay_3+'-'+tungay_2+'-'+tungay_1;
		var denngay = denngay_3+'-'+denngay_2+'-'+denngay_1;
				
		if ((tungay == "" && denngay == "") && (sodi_tu == "" && sodi_den == "") ){
			return false;
		}
		if(exptype==3){
			document.getElementById('div_doc_report').style.display='block';
			$.post('?expDocOutReport&mod=docs&exptype='+exptype,
				{
					tungay:tungay,
					denngay:denngay,
					sodi_tu:sodi_tu,
					sodi_den:sodi_den,
					docOut_typical:docOut_typical,
					docCat_id_fil:docCat_id_fil,
					department_fil:department_fil
				},
				function(data){
					$('#doc_report_content_main').html(data);
					$("#doc_report_content_main").show();
				}
			);
			$('#doc_content_main').hide();
			$('#doc_content_main').fadeOut('fast').load('index.php?listDocOut&mod=docs').fadeIn("fast");
		}else{
			window.location="?expDocOutReport&mod=docs&exptype="+exptype+"&tungay="+tungay+"&denngay="+denngay;
		}
	}
	
	function edit_me_DocOut(id){
		$("#doc_content_main").load("?listDocOut&mod=docs&edit_me=1&docOut_id="+id);
	}
	
	function show_me_DocOut(id){
		$('#div_view_docout').css({'display':'block','z-index':'2010'});
		$("#list_view_docout_cont").load("?viewDocOut&mod=docs&docOut_id="+id);
	}
		
	$("#a_ref_DocOut").click( function () { 
			$('#doc_content_main').hide();
			$('#doc_content_main').fadeOut('fast').load('index.php?listDocOut&mod=docs').fadeIn("fast");
		});
</script>
{/literal}