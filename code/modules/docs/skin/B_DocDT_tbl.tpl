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
		document.frmList_DocDT.docDT_num.focus();
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
	<form method="post" name="frmList_DocDT" action="?listDocDT{$vars.arg}" id="frmList_DocDT">
    {if $user_level eq 1 or $user_level eq 2 or $user_level eq 9 or $user_level eq 10}
    <!------------------------------------------THEM MOI------------------------------------>
    <fieldset style="width:912px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
        <legend class="legend_list_search">
            Thêm/Chỉnh sửa&nbsp;|&nbsp;Thông báo:&nbsp;
            <span class="msg">{$error}{$complete}</span>
            <span id="lblError_DocDT" class="error">(*) là các mục bắt buộc!</span>
        </legend>
    	<table width="98%" cellspacing="0" cellpadding="0" border="0" style="margin-left:5px">
        	<tr height="10"><td colspan="2"></td></tr>
            <tr height="30">
            	<td align="center" width="30%" valign="top">
                	<div style="float:left; width:30%; line-height:25px; text-align:left; color:#F00">Số dự thảo <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left">
                    	<input type="text" id="docDT_num" name="docDT_num" value="{if $obj_info.docDT_num neq ''}{$obj_info.docDT_num}{else}{$obj_info.docDT_num_typical}{/if}"  class="text_short" style="color:#F00" tabindex="1"/>
                    </div>
                    <div style="float:left; width:30%; line-height:25px; text-align:left">Ngày dự thảo <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left">
                    	<input type="text" name="docDT_date" id="docDT_date" value="{if $vars.docDT_date neq ''}{$obj_info.docDT_date|date_format:"%d/%m/%Y"}{else}{$smarty.now|date_format:"%d/%m/%Y"}{/if}" class="text_time_callender" tabindex="2"/>&nbsp;<img src="../images/admin/img.gif" align="absmiddle" id="date_docDT" style="cursor: pointer; border: 0" title="Chọn ngày trên lịch"/>
                        {literal}
						<script type="text/javascript">
                            Calendar.setup({
                                inputField   :   "docDT_date",
                                ifFormat     :   "%d/%m/%Y",
                                button       :   "date_docDT",
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
                    	{if $user_level eq 2 or $user_level eq 3}
                            <select name="department_id" id="department_id" class="select_middle" tabindex="4">
                                <option value="0">Chọn đơn vị dự thảo</option>
                                {section name=qi loop=$obj_list_department}
                                <option value="{$obj_list_department[qi]->department_id}" {if $obj_list_department[qi]->department_id eq $obj_info.department_id}selected="selected"{/if}>-&nbsp;{$obj_list_department[qi]->department_name}</option>
                                {/section}
                            </select>
                        {elseif $user_level eq 10}
                            <select name="department_id" id="department_id" class="select_middle" tabindex="4">
                                {section name=qi loop=$obj_list_department}
                                    {if $obj_list_department[qi]->department_id eq $access_unit_id}
                                    <option value="{$obj_list_department[qi]->department_id}">-&nbsp;{$obj_list_department[qi]->department_name}</option>
                                    {/if}
                                {/section}
                            </select>
                        {/if}
                    </div>
                </td>
                <td align="center" valign="top">
                	<div style="float:left; width:10%; line-height:25px; text-align:left">Trích yếu <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:90%; line-height:25px; text-align:left; height:75px">
                    	<textarea spellcheck="false" name="docDT_desc" id="docDT_desc" cols="30" rows="5" class="text_area_long" onfocus="hide_message_DocDT()" tabindex="8">{$obj_info.docDT_desc}</textarea>
                    </div>
                    <div style="float:left; width:10%; line-height:25px; text-align:left">Tình trạng <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:20%; line-height:25px; text-align:left">
                        <select name="docDT_status" id="docDT_status" class="select_short" tabindex="4">
                            <option value="0" {if $obj_info.docDT_status eq 0}selected="selected"{/if}>Mới nhập</option>
                            <option value="1" {if $obj_info.docDT_status eq 1}selected="selected"{/if}>Chờ hiệu chỉnh</option>
                            <option value="2" {if $obj_info.docDT_status eq 2}selected="selected"{/if}>Đã trình ký</option>
                            <option value="3" {if $obj_info.docDT_status eq 3}selected="selected"{/if}>Đã ký</option>
                            <option value="4" {if $obj_info.docDT_status eq 4}selected="selected"{/if}>Đã vào sổ đi</option>
                        </select>
                    </div>
                    <div style="float:left; width:20%; line-height:25px; text-align:left">
                    	&nbsp;<b>(Người nhập: {$access_user_name})</b>
                    </div>
                    <div style="float:left; width:26.5%; line-height:25px; text-align:right">
                    	<input type="button" name="btnSub_DocDT" id="btnSub_DocDT" value="Ghi lại" class="button" tabindex="13"/>
                        <input type="hidden" name="docDT_id" id="docDT_id" value="{$obj_info.docDT_id}">
                        <input type="hidden" name="docDT_file" id="docDT_file" value="{$obj_info.docDT_file}">
                        <input type="hidden" name="input_per" id="input_per" value="{$obj_info.input_per}">
                        <input type="reset" name="Reset" value="Hủy bỏ" class="button" tabindex="14"/>
                        {literal}
                        <script language="javascript">
                            function hide_message_DocDT(){
                                $('#lblMessage_DocDT').hide();
                                $('#lblError_DocDT').hide();
                            }
                            
                            $(function() {
                            $('.error').hide();
                            $('#lblMessage_DocDT').hide();
                             
                            $("#btnSub_DocDT").click(function() {
                                $('.error').hide();

                                var $form = $("#frmList_DocDT");
                                var docDT_num = $form.find('input#docDT_num').val();
								var docDT_date = $form.find('input#docDT_date').val();
								var docCat_id = $form.find('select#docCat_id :selected').val();
								var department_id = $form.find('select#department_id :selected').val();
								var docDT_desc = $form.find('textarea#docDT_desc').val();
                                var docDT_status = $form.find('select#docDT_status :selected').val();

								var docDT_id = $form.find('input#docDT_id').val();
								var docDT_file = $form.find('input#docDT_file').val();
								var input_per = $form.find('input#input_per').val();
								
                                //begin validate form
                                if (docDT_num == "" || docDT_date == "" || docCat_id == 0 || department_id == 0  || docDT_desc == ""){
                                    $('#lblError_DocDT').show();
                                }
                                else{
									$.post('index.php?listDocDT&mod=docs&add_edit=1',
										{
											docDT_num:docDT_num,
											docDT_date:docDT_date,
											docCat_id:docCat_id,
											department_id:department_id,
											docDT_desc:docDT_desc,
                                            docDT_status:docDT_status,

											docDT_id:docDT_id,
											docDT_file:docDT_file,
											input_per:input_per
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
                    <div style="position:absolute; width:625px; margin:201px 0 0 -5px; height:80px; text-align:left; display:none; background-color:#dfe8f6; border:1px solid #99bbe8; border-top:none; z-index:1005" id="div_add_more">
                    <div style="float:left; width:10%; line-height:25px; text-align:left; margin-left:4px">Người ký liên ngành:</div>
                    <div style="float:left; width:89%; line-height:25px; text-align:left; height:55px">
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
                    <div style="float:left; width:10%; line-height:25px; text-align:left; margin-left:4px">Tự nhập:</div>
                    <div style="float:left; width:57.5%; line-height:25px; text-align:left">
                    	<input type="text" id="interdisci_name_02" name="interdisci_name_02" size="10" value="{$interdisci_name_02}" class="text_long"/>
                    </div>
                    </div>
                </td>
            </tr>
        </table>
    </fieldset>
    {/if}
    <!------------------------------------DANH SACH---------------------------------------------->
    <fieldset style="width:912px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; {if $user_level eq 1 or $user_level eq 2 or $user_level eq 9 or $user_level eq 10}height:325px{else}height:462px{/if}">
        <legend class="legend_list" style="width:865px">
            <div style="width:130px; float:left">Danh sách: {$total_num_result}</div>
            <div style="width:70px; float:left">&nbsp;|&nbsp;Tìm kiếm:&nbsp;</div>
            <div style="width:380px; float:left; font-weight:normal">
                <div style="float:left">
                    <div style="float:left; width:60px">- Trích yếu: </div>
                    <div style="float:left; width:300px">
                    <input type="text" id="docDT_desc_fs" name="docDT_desc_fs" class="text_seek_long" value="{$vars.docDT_desc_fs}"/>
                    </div>
                    <input type="hidden" id="processurl" value="{$processurl}" />
                </div>
                <a href="javascript: void(0);" onClick="show_hide_seek()" style="text-decoration:none; color:#F00">
                <div style="float:left; margin-left:3px"><img src="{$css_path}icon_keo_dai.png" class="img_all"></div></a>
            </div>
            <div style="width:380px; float:left; font-weight:normal; position:absolute; display:none; margin:20px 0 0 200px; background-color:#ccd8e7; border:1px solid #99bbe8; border-top:none; padding-top: 5px" id="seek_more">
                <div style="float:left; width:60px; margin-bottom:5px">- Số đi: </div>
                <div style="float:left; width:80px; margin-bottom:5px">
                    <input type="text" id="docDT_num_fs" name="docDT_num_fs" class="text_seek_tiny" value="{$vars.docDT_num_fs}" />
                </div>
                <div style="float:left; width:79px; margin-bottom:5px">- ĐV dự thảo: </div>
                <div style="float:left; width:155px; margin-bottom:6px">
                <select name="department_id_fs" id="department_id_fs" class="text_seek_middle">
                    <option value="0">Chọn đơn vị dự thảo</option>
                    {section name=qi loop=$obj_list_department}
                    <option value="{$obj_list_department[qi]->department_id}">-&nbsp;{$obj_list_department[qi]->department_name}</option>
                    {/section}
                </select>
                </div>
                <div style="float:left; width:60px; margin-bottom:5px">- Ngày VB:</div>
                <div style="float:left; width:80px; margin-bottom:5px">
                    <div style="float:left; width:60px; background-color:#FFF">
                        <input type="text" id="ngay_vb_1" name="ngay_vb_1" class="text_date" value="{$obj_info.ngay_vb|date_format:'%d'}" onfocus="hide_message()" maxlength="2"/>/
                        <input type="text" id="ngay_vb_2" name="ngay_vb_2" class="text_month" value="{$obj_info.ngay_vb|date_format:'%m'}" onfocus="hide_message()" maxlength="2"/>/
                        <input type="text" id="ngay_vb_3" name="ngay_vb_3" class="text_month" value="{$db_year|date_format:"%y"}" readonly="readonly"/>
                    </div>
                </div>
                <div style="float:left; width:79px; margin-bottom:5px">- Loại văn bản: </div>
                <div style="float:left; width:155px; margin-bottom:6px">
                <select name="docCat_id_fs" id="docCat_id_fs" class="text_seek_middle">
                    <option value="0">Chọn loại văn bản</option>
                    {section name=qi loop=$obj_list_dcat}
                    <option value="{$obj_list_dcat[qi]->docCat_id}">-&nbsp;{$obj_list_dcat[qi]->docCat_name}</option>
                    {/section}
                </select>
                </div>
            </div>
            <div style="width:45px; float:left">
                <input type="button" name="btnSeek" id="btnSeek" value="Tìm >>" class="button_seek" onclick="search_me_DocDT()" />
            </div>
            <!-----------------------------------------KET XUAT--------------------------------------->
            <div style="width:60px; float:left">&nbsp;|&nbsp;Kết xuất:&nbsp;</div>
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
            <div style="width:260px; float:left; font-weight:normal; position:absolute; display:none; margin:20px 0 0 604px; background-color:#ccd8e7; border:1px solid #99bbe8; border-top:none; padding-top: 5px" id="div_filter">
                <div style="float:left; width:56px; margin-bottom:5px">- Dự thảo:</div>
                <div style="float:left; width:20px; margin-bottom:5px">Từ&nbsp;</div>
                <div style="float:left; width:75px; background-color:#FFF; margin-bottom:5px">
                <input type="text" id="tungay_1" name="tungay_1" class="text_date" value="{$smarty.now|date_format:'%d'}" maxlength="2"/>
                /<input type="text" id="tungay_2" name="tungay_2" class="text_month" value="{$smarty.now|date_format:'%m'}" maxlength="2" />
                /<input type="text" id="tungay_3" name="tungay_3" class="text_year" value="{$smarty.now|date_format:'%Y'}" maxlength="4" />
                </div>
                <div style="float:left; width:24px; margin-bottom:5px; margin-left:5px">đến&nbsp;</div>
                <div style="float:left; width:75px; margin-bottom:5px; background-color:#FFF">
                <input type="text" id="denngay_1" name="denngay_1" class="text_date" value="{$smarty.now|date_format:'%d'}" maxlength="2" />
                /<input type="text" id="denngay_2" name="denngay_2" class="text_month" value="{$smarty.now|date_format:'%m'}" maxlength="2" />
                /<input type="text" id="denngay_3" name="denngay_3" class="text_year" value="{$smarty.now|date_format:'%Y'}" maxlength="4" />
                </div>
                
                <div style="float:left; width:56px; margin-bottom:5px">- Số DT:</div>
                <div style="float:left; width:20px; margin-bottom:5px">Từ&nbsp;</div>
                <div style="float:left; width:75px; background-color:#FFF; margin-bottom:5px">
                <input type="text" id="sodi_tu" name="sodi_tu" class="text_seek_tiny" value="{$vars.sodi_tu}" />
                </div>
                <div style="float:left; width:24px; margin-bottom:5px; margin-left:5px">đến&nbsp;</div>
                <div style="float:left; width:75px; margin-bottom:5px; background-color:#FFF">
                <input type="text" id="sodi_den" name="sodi_den" class="text_seek_tiny" value="{$vars.sodi_den}" />
                </div>
                
                <div style="float:left; width:76px; margin-bottom:5px">- Loại văn bản: </div>
                <div style="float:left; width:150px; margin-bottom:5px">
                <select name="docCat_id_fil" id="docCat_id_fil" class="select_seek">
                    <option value="0">Chọn loại văn bản</option>
                    {section name=qi loop=$obj_list_dcat}
                    <option value="{$obj_list_dcat[qi]->docCat_id}">-&nbsp;{$obj_list_dcat[qi]->docCat_name}</option>
                    {/section}
                </select>
                </div>
                
                <div style="float:left; width:76px; margin-bottom:5px">- ĐV dự thảo: </div>
                <div style="float:left; width:150px; margin-bottom:5px">
                <select name="department_fil" id="department_fil" class="select_seek">
                    <option value="">Chọn phòng ban</option>
                    {section name=di loop=$obj_list_department}
                    <option value="{$obj_list_department[di]->department_id}">{$obj_list_department[di]->department_name}</option>
                    {/section}
                </select>
                </div>

            </div>
        </legend>
    	<div style="float:left; height:5px; width:100%"></div>
        <div style="float:left; height:25px; width:890px; border-top:1px solid #99bbe8; border-bottom:1px solid #99bbe8 ">
            <div class="tbl_tit" style="width:47px; text-align:center"><b>STT</b></div>	
            <div class="tbl_tit" style="width:95px"><B>&nbsp;Loại văn bản</B></div>
            <div class="tbl_tit" style="width:50px; text-align:right"><B>&nbsp;Số DT&nbsp;</B></div>
            <div class="tbl_tit" style="width:70px"><B>&nbsp;Ngày DT</B></div>
            <div class="tbl_tit" style="width:390px"><B>&nbsp;Trích yếu</B></div>
            <div class="tbl_tit" style="width:50px; text-align:center"><B>Tệp tin</B></div>
            <div class="tbl_tit" style="width:90px;"><B>&nbsp;Tình trạng</B></div>
            <div class="tbl_tit" style="width:59px; text-align:center"><B>Chọn</B></div>
            <div class="tbl_tit" style="width:30px; text-align:center">
            <input type="hidden" name="chon" id="chon_DocDT">
            <input type="checkbox" name="chkall" value="0" onclick="docheck_DocDT(document.frmList_DocDT.chkall.checked,0);">
            </div>
        </div>
        <div style="float:left; width:20px; text-align:right">
        {if $user_level eq 2 or $user_level eq 9 or $user_level eq 10}
        <input type="button" name="del_Items" id='del_Items' value="&nbsp;" onClick="delItems_DocDT('{$processurl}');" style="width:17px; font-size:12px; background:url(../images/admin/b_drop.png); cursor:pointer" title="Xóa lựa chọn">
        {else}
        <input type="button" name="del_Items" id='del_Items' value="&nbsp;" disabled="disabled" style="width:17px; font-size:12px; background:url(../images/admin/b_drop.png); cursor:pointer" title="Xóa lựa chọn">
        {/if}
        </div>
        <div style="float:left; {if $user_level eq 1 or $user_level eq 2 or $user_level eq 9 or $user_level eq 10}height:272px{else}height:405px{/if}; width:912px; overflow-y:scroll">
            {section name=pi loop=$obj_list}
            {if $smarty.section.pi.index is not div by 2} 
            {assign var="class_td" value="tbl_cont"} 
            {else}
            {assign var="class_td" value="tbl_cont2"} 
            {/if}
            {math x=$vars.curpage-1 y=$vars.numresult z=$smarty.section.pi.index t=1 equation="x*y+z+t" assign=stt}
            <div class="{$class_td}" style="width:47px; text-align:center">{$stt}</div>
            <div class="{$class_td}" style="width:95px" title="{$obj_list[pi]->docCat_id}">&nbsp;
                {section name=qi loop=$obj_list_dcat}
                    {if $obj_list_dcat[qi]->docCat_id eq $obj_list[pi]->docCat_id}
                    {$obj_list_dcat[qi]->docCat_name}
                    {/if}
                {/section}
            </div>
            <div class="{$class_td}" style="width:50px; text-align:right">
               {$obj_list[pi]->docDT_num}&nbsp;
            </div>
            <div class="{$class_td}" style="width:70px">
            	&nbsp;{$obj_list[pi]->docDT_date|date_format:"%d-%m-%Y"}
            </div>
            <div class="{$class_td}" style="width:390px; white-space:nowrap" title="{$obj_list[pi]->docDT_desc}">
            	&nbsp;
                {if $per_edit eq 1}
                <a href="javascript: void(0);" onclick="show_me_DocDT({$obj_list[pi]->docDT_id})" >{$obj_list[pi]->docDT_desc|str_string_cut:"92":"1"}</a>
                {else}{$obj_list[pi]->docDT_desc|str_string_cut:"92":"1"}{/if}
            </div>

            <div class="{$class_td}" style="width:50px; text-align:center">
                {if $obj_list[pi]->docDT_file eq 0 or $obj_list[pi]->docDT_file eq 2}
                <a href='javascript: void(0);' onclick="javascript: show_list_file_dt({$obj_list[pi]->docDT_id})">
                <img src="../images/admin/empty_icon.png" width="14" height="14" border="0"></a>
                {else}
                <a href='javascript: void(0);' onclick="javascript: show_list_file_dt({$obj_list[pi]->docDT_id})">
                <img src="../images/admin/folder_icon.png" width="14" height="14" border="0"></a>
                {/if}
            </div>
            <div class="{$class_td}" style="width:90px">
                {if $obj_list[pi]->docDT_status eq 0}
                    &nbsp;Mới nhập
                {elseif $obj_list[pi]->docDT_status eq 1}
                    &nbsp;Chờ hiệu chỉnh
                {elseif $obj_list[pi]->docDT_status eq 2}
                    &nbsp;Đã trình ký
                {elseif $obj_list[pi]->docDT_status eq 3}
                    &nbsp;Đã ký
                {else}
                    &nbsp;Đã vào sổ đi
                {/if}
            </div>
            <div class="{$class_td}" style="width:29px; text-align:center">
            	{if $user_level eq 2 or $user_level eq 3 or $user_level eq 10}
                <a href='javascript: void(0);' onclick="edit_me_DocDT({$obj_list[pi]->docDT_id})">
                <img src="../images/admin/b_edit.png" width="11" height="11" border="0" title="Sửa"></a>
                {else}-{/if}
            </div>
            <div class="{$class_td}" style="width:29px; text-align:center">
            	{if $user_level eq 2 or $user_level eq 3 or $user_level eq 10}
                <a href='javascript: void(0)' onClick="delItems_DocDT('{$processurl}', {$obj_list[pi]->docDT_id});">
                <img src="../images/admin/b_drop.png" width="11" height="11" border="0" title="Xóa"></a>
                {else}-{/if}
            </div>
            <div class="{$class_td}" style="width:30px; text-align:center">
            	<input type="checkbox" name="chkid" value="{$obj_list[pi]->docDT_id}" onclick="docheckone_DocDT();">
            </div>
            {/section}
        </div>
        <input type="hidden" id="curpage_DocDT" name="curpage" value="{$vars.curpage}" />
    </fieldset>
    </form>
</div>
<!------------------------------------------------- Tool bar --------------------------------------------->
<div id="doc_clear_txt"></div>
<div id="doc_tool_bar">

    <div id="doc_search_area">
    <select name="order" id = "order_DocDT" style="width:120px; font-size:12px; border:1px solid #99bbe8; margin-left:1px" onchange="reloadPage_DocDT('{$processurl}');">
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
    <a href="javascript: void(0)" id="first_page" onclick="gotoPage_DocDT('{$processurl}',parseInt(1));" title="Trang đầu">
    	<img src="{$css_path}icon_first_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="pre_page" onclick="gotoPage_DocDT('{$processurl}',parseInt(document.getElementById('page_DocDT').value)-parseInt(1));" title="Trang trước">
    	<img src="{$css_path}icon_pre_page.png" class="img_all">
    </a>
    {/if}
    </div>
    <div style="float:left; line-height:19px">
        <div style="float:left; width:35px">Trang</div> 
        <div style="float:left; width:35px">
        <input type="text" value="{$vars.curpage}" name="page" id="page_DocDT" onblur=" gotoPage_DocDT('{$processurl}',this.value);" style="width:30px; font-size:12px; height:15px; border:1px solid #99bbe8">
        </div>
        <div style="float:left; width:42px"> / {$num_page}</div>
    </div>
    <div id="doc_page_area">
    {if $vars.curpage eq $num_page}
    	<img src="{$css_path}icon_next_page.png" class="img_all">
        <img src="{$css_path}icon_last_page.png" class="img_all">
    {else}
    <a href="javascript: void(0)" id="next_page" onclick="gotoPage_DocDT('{$processurl}',parseInt(document.getElementById('page_DocDT').value)+parseInt(1));" title="Trang tiếp">
    	<img src="{$css_path}icon_next_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="last_page" onclick="gotoPage_DocDT('{$processurl}',parseInt({$num_page}));" title="Trang cuối">
    	<img src="{$css_path}icon_last_page.png" class="img_all">
    </a>
    {/if}
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:left; width:15px">
    <a href="javascript: void(0)" id="a_ref_DocDT" title="Tải lại"><img src="{$css_path}icon_refresh.png" class="img_all"></a>
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:right; line-height:19px; margin-right:2px">
        <div style="float:left; width:40px">Xem</div>
        <div style="float:left; width:52px">
            <select name="numresult" id="numresult_DocDT" style="width:50px; font-size:12px; border:1px solid #99bbe8" onchange="reloadPage_DocDT('{$processurl}');">
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
	
	function docheck_DocDT(status,from_){
		var alen=document.frmList_DocDT.elements.length;
		alen=(alen>5)?document.frmList_DocDT.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
			document.frmList_DocDT.chkid[i].checked=status;
		}
		else{
			document.frmList_DocDT.chkid.checked=status;
		}
		if(from_>0) document.frmList_DocDT.chkall.checked=status;
	}
		
	function docheckone_DocDT(){
		var alen=document.frmList_DocDT.elements.length;
		var isChecked=true;
		alen=(alen>4)?document.frmList_DocDT.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_DocDT.chkid[i].checked==false)
					isChecked=false;
		}else{
			if(document.frmList_DocDT.chkid.checked==false)
				isChecked=false;
		}				
		document.frmList_DocDT.chkall.checked=isChecked;
	}
	
	function calculatechon_DocDT(){			
		var strchon="";
		var alen=document.frmList_DocDT.elements.length;				
		alen=(alen>2)?document.frmList_DocDT.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_DocDT.chkid[i].checked==true)
					strchon+=document.frmList_DocDT.chkid[i].value+",";
		}else{
			if(document.frmList_DocDT.chkid.checked==true)
				strchon=document.frmList_DocDT.chkid.value;
		}
		document.frmList_DocDT.chon_DocDT.value=strchon;
	}
	
	function delItems_DocDT(processurl,delStr){
		if (delStr == undefined){
			calculatechon_DocDT();
			delStr = document.getElementById("chon_DocDT").value;
		}
		if (delStr == ""){
			return false;
		}
		if(!confirm("THÔNG BÁO: \n\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
			return false;
		}	
		
		var numresult_DocDT,order_DocDT,curpage_DocDT;
		numresult = $("#numresult_DocDT").val();
		order = $("#order_DocDT").val();
		curpage = $("#curpage_DocDT").val();
		
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
	
	function reloadPage_DocDT(processurl){
		var numresult_DocDT,order_DocDT,cur_pos;
		numresult = $("#numresult_DocDT").val();
		order = $("#order_DocDT").val();
		cur_pos = 0;
		$("#doc_content_main").load(processurl+"&numresult="+numresult+"&order="+order+"&cur_pos="+cur_pos);
	}
	
	function gotoPage_DocDT(processurl,page){
		var numresult_DocDT,order_DocDT,cur_pos;
		numresult = $("#numresult_DocDT").val();
		order = $("#order_DocDT").val();
		//alert(processurl+'-'+page+'-'+numresult+'-'+order);
		$("#doc_content_main").load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+page);
	}
	
	function show_list_file_dt(docDT_id){
		document.getElementById('list_file_dt').style.display='block';
        document.getElementById('div_doc').style.zIndex='2000';
        document.getElementById('list_file_dt').style.zIndex = '2001';
		$("#list_file_dt_cont").load("?listDocDTFile&mod=docs"+"&docDT_id="+docDT_id);
	}
	
	function uncheck_fns_DocDT(field,val,id){
		$("#doc_content_main").load("?listDocDT&mod=docs&checkUncheck="+val+"&setfield="+field+"&checkUncheckID="+id);
	}
	
	function sort_me_DocDT(id,val){
		$("#doc_content_main").load("?listDocDT&mod=docs&sort_me=1&docDT_id="+id+"&val="+val);
	}
	
	function search_me_DocDT(){
		var docDT_desc_fs 	= document.getElementById('docDT_desc_fs').value;
		var docDT_code_fs 	= document.getElementById('docDT_code_fs').value;
		var docDT_num_fs 		= document.getElementById('docDT_num_fs').value;
		var department_id_fs 	= document.getElementById('department_id_fs').value;
		var docCat_id_fs 	= document.getElementById('docCat_id_fs').value;
		if (docDT_desc_fs == "" && docDT_code_fs == "" && docDT_num_fs == "" && department_id_fs == 0 && docCat_id_fs == 0 && user_id_fs == 0){
			return false;
		}
		$.post('?listDocDT&mod=docs&search_me=1',
			{
				docDT_desc_fs:docDT_desc_fs,
				docDT_code_fs:docDT_code_fs,
				docDT_num_fs:docDT_num_fs,
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
		
		var docCat_id_fil 	= document.getElementById('docCat_id_fil').value;
		var department_fil 	= document.getElementById('department_fil').value;
		
		var tungay = tungay_3+'-'+tungay_2+'-'+tungay_1;
		var denngay = denngay_3+'-'+denngay_2+'-'+denngay_1;
				
		if ((tungay == "" && denngay == "") && (sodi_tu == "" && sodi_den == "") ){
			return false;
		}
		if(exptype==3){
			document.getElementById('div_doc_report').style.display='block';
			$.post('?expDocDTReport&mod=docs&exptype='+exptype,
				{
					tungay:tungay,
					denngay:denngay,
					sodi_tu:sodi_tu,
					sodi_den:sodi_den,
					docCat_id_fil:docCat_id_fil,
					department_fil:department_fil
				},
				function(data){
					$('#doc_report_content_main').html(data);
					$("#doc_report_content_main").show();
				}
			);
			$('#doc_content_main').hide();
			$('#doc_content_main').fadeOut('fast').load('index.php?listDocDT&mod=docs').fadeIn("fast");
		}else{
			window.location="?expDocDTReport&mod=docs&exptype="+exptype+"&tungay="+tungay+"&denngay="+denngay;
		}
	}
	
	function edit_me_DocDT(id){
		$("#doc_content_main").load("?listDocDT&mod=docs&edit_me=1&docDT_id="+id);
	}
	
	function show_me_DocDT(id){
		$('#div_view_docout').css({'display':'block','z-index':'2010'});
		$("#list_view_docout_cont").load("?viewDocDT&mod=docs&docDT_id="+id);
	}
		
	$("#a_ref_DocDT").click( function () { 
			$('#doc_content_main').hide();
			$('#doc_content_main').fadeOut('fast').load('index.php?listDocDT&mod=docs').fadeIn("fast");
		});
</script>
{/literal}