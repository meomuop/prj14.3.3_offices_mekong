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
<div id="reply_content_insign">
	<form method="post" name="frmList_DocReply" action="?listDocReply{$vars.arg}" id="frmList_DocReply">
    <!------------------------------------------THEM MOI------------------------------------>
    <fieldset style="width:655px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
        <legend class="legend_list" style="width:450px">Thêm/Chỉnh sửa: <font color="#FF0000">Số ký hiệu: {$doc_code} - Số đến: {$doc_num}</font> | <a href="javascript: void(0)" onclick="show_ndtm()">Nội dung tham mưu</a></legend>
    	<table width="98%" cellspacing="0" cellpadding="0" border="0" style="margin-left:5px">
            <tr height="20">
                <td colspan="2"> 
                	{if $error or $complete}
                	<span class="msg">Thông báo: <font color="#FF0000">{$error}</font>{$complete}</span>{/if}
            		<span id="lblError_DocReply" class="error">Thông báo: (*) là các mục bắt buộc!</span>
                </td>
            </tr>
            {literal}
			<script language="javascript">
                function set_txtarea(){
                    var mysel =document.forms['frmList_DocReply'].elements['recevie_per'];
                    seltxt = mysel.options[mysel.selectedIndex].text; 
                    document.frmList_DocReply.docReply_desc.value = "Chuyển đồng chí "+seltxt;
                }
				
                function set_txtarea1(){
                    var mysel =document.forms['frmList_DocReply'].elements['main_department'];
                    seltxt = mysel.options[mysel.selectedIndex].text; 
                    document.frmList_DocReply.docReply_desc.value = "Chuyển "+seltxt;
                }
				
                function show_per(){	
                    document.getElementById('rece_per').style.display='';
                    document.getElementById('rece_depa').style.display='none'; 
                    document.getElementById('rece_main').style.display='none'; 
                    document.getElementById('coor_per').style.display='none'; 
                }	
                function hide_per(){
                    document.getElementById('rece_per').style.display='none';
                    document.getElementById('rece_depa').style.display='';
                    document.getElementById('rece_main').style.display=''; 
                    document.getElementById('coor_per').style.display=''; 
                }
                
                function show_process(){	
                    document.getElementById('level_7').style.display='';
                    document.getElementById('level_8').style.display='none'; 
                }	
                function hide_process(){
                    document.getElementById('level_8').style.display='';
                    document.getElementById('level_7').style.display='none'; 
                }
				
				// -------set text khi chon noi nhan chuyen y kien
                function set_txtarea(){
                    var mysel =document.forms['frmList_DocReply'].elements['recevie_per'];
                    seltxt = mysel.options[mysel.selectedIndex].text;
                    if(document.frmList_DocReply.docReply_desc.value == "") {
                        document.frmList_DocReply.docReply_desc.value = "Chuyển đồng chí " + seltxt;
                    }
                }
                function set_txtarea1(){
                    var mysel =document.forms['frmList_DocReply'].elements['main_department'];
                    seltxt = mysel.options[mysel.selectedIndex].text;
                    if(document.frmList_DocReply.docReply_desc.value == "") {
                        document.frmList_DocReply.docReply_desc.value = "Chuyển " + seltxt;
                    }
                }
            </script>
            {/literal}
            <tr height="30">
            	<td align="center" valign="top">
                	<div style="float:left; width:650px;">
                        <div style="float:left; width:90px; line-height:25px; text-align:left">Nội dung ý kiến <font color="#FF0000">*</font>:</div>
                        <div style="float:left; width:385px; text-align:left">
                            <textarea spellcheck="false" class="text_area_small" name="docReply_desc" id="docReply_desc" spellcheck="false" onfocus="hide_message_DocReply();">{$obj_info.docReply_desc}</textarea>
                        </div>
                        <div style="float:left; width:60px; line-height:25px; text-align:left">Ngày Y/C <font color="#FF0000">*</font>:</div>
                        <div style="float:left; width:110px; line-height:25px; text-align:left">
                            <input type="text" class="text_time_callender" name="docReply_date" id="docReply_date" value="{if $obj_info.docReply_date}{$obj_info.docReply_date|date_format:'%d/%m/%Y'}{else}{$smarty.now|date_format:'%d/%m/%Y'}{/if}" readonly/>
                            <img src="../images/admin/img.gif"  align="absmiddle" id="icon_date02" style="cursor: pointer; border: 0" title="Chọn ngày trên lịch"/>
                            {literal}
                            <script type="text/javascript">
                                Calendar.setup({
                                    inputField   :   "docReply_date",
                                    ifFormat     :   "%d/%m/%Y",
                                    button       :   "icon_date02",
                                    align        :   "Br",  
                                    timeFormat   :   "24",
                                    showsTime    :   true,
                                    singleClick  :   true
                                });
                            </script>
                            {/literal}
                        </div>
                        <div style="float:left; width:60px; line-height:25px; text-align:left">Loại VB <font color="#FF0000">*</font>:</div>
                        <div style="float:left; width:110px; line-height:25px; text-align:left">
                            <select name="doc_theodoi" id="doc_theodoi" class="select_short" onClick="javascript: if(this.value==1)document.getElementById('date_end').style.display='';else document.getElementById('date_end').style.display='none';">
                                <option value="0" {if $doc_theodoi eq 0}selected="selected"{/if}>Thông thường</option>
                                <option value="1" {if $doc_theodoi eq 1}selected="selected"{/if}>Cần theo dõi</option>
                        	</select>
                        </div>
                    </div>
                    
                    <!--------------------phan han xu ly van ban voi cac quyen khac nhau--------------------->
                    {if $user_level eq 6 or $user_level eq 3}
                    <div style="float:left; width:650px">
                    	<div style="float:left; width:90px; line-height:25px; text-align:left">Hạn giải quyết:</div>
                        <div style="float:left; width:120px; line-height:25px; text-align:left">
                            <input type="text" class="text_time_callender" name="docReply_limit_time" id="docReply_limit_time" value="{$obj_info.docReply_limit_time|date_format:'%d/%m/%Y'}" readonly/><img src="../images/admin/img.gif"  align="absmiddle" id="icon_date03" style="cursor: pointer; border: 0" title="Chọn ngày trên lịch"/>
                            {literal}
                            <script type="text/javascript">
                                Calendar.setup({
                                    inputField   :   "docReply_limit_time",
                                    ifFormat     :   "%d/%m/%Y",
                                    button       :   "icon_date03",
                                    align        :   "Br",  
                                    timeFormat   :   "24",
                                    showsTime    :   true,
                                    singleClick  :   true
                                });
                            </script>
                            {/literal}
                        </div>
                    </div>
                    {else}
                    <!-----------------phan han xu ly khi van ban thuoc dang can theo doi-------------------->
                    <div id="date_end" style="float:left; width:650px; {if $doc_theodoi neq 1}display:none{/if}">
                    	<div style="float:left; width:90px; line-height:25px; text-align:left">Hạn giải quyết:</div>
                        <div style="float:left; width:50px; line-height:25px; text-align:left">Tra lịch:</div>
                        <div style="float:left; width:120px; line-height:25px; text-align:left">
                            <input type="text" class="text_time_callender" name="docReply_limit_time" id="docReply_limit_time" value="{$obj_info.docReply_limit_time|date_format:'%d/%m/%Y'}" readonly/><img src="../images/admin/img.gif"  align="absmiddle" id="icon_date03" style="cursor: pointer; border: 0" title="Chọn ngày trên lịch"/>
                            {literal}
                            <script type="text/javascript">
                                Calendar.setup({
                                    inputField   :   "docReply_limit_time",
                                    ifFormat     :   "%d/%m/%Y",
                                    button       :   "icon_date03",
                                    align        :   "Br",  
                                    timeFormat   :   "24",
                                    showsTime    :   true,
                                    singleClick  :   true
                                });
                            </script>
                            {/literal}
                        </div>
                        <div style="float:left; width:50px; line-height:25px; text-align:left">Nhập số:</div>
                        <div style="float:left; width:83px; line-height:25px; text-align:left">
                        	<input type="text" class="text_super_tiny" name="daynum_num" id="daynum_num" value="{$obj_info.docReply_numday}"/>&nbsp;(ngày)
                        </div>
                        <div style="float:left; width:75px; line-height:25px; text-align:left">Nhập phím tắt:</div>
                        <div style="float:left; width:175px; line-height:25px; text-align:left">
                        	<input type="text" class="text_super_tiny" name="daynum_standfor" id="daynum_standfor" value="{$obj_info.daynum_standfor}"/>&nbsp;(<a href="javascript: void(0)" onclick="javascript: show_huongdan()">Bảng chú thích phím tắt >></a>)
                        </div>
                    </div>
                    {/if}
                    <!--------------------------------------------------------------------------------------->
                    
                    <!-----------------phan chon doi tuong de chi dao - chuyen chi dao----------------------->
                    {literal}
					<script language="javascript">	
                          // ----- script cua ban lanh dao
						  function show_per(){	
                              document.getElementById('rece_per').style.display='block';
							  document.getElementById('phong_phoi_hop').style.display='block';
                              document.getElementById('rece_depa').style.display='none'; 
                              document.getElementById('rece_main').style.display='none'; 
                          }	
                          function hide_per(){
                              document.getElementById('rece_per').style.display='none';
							  document.getElementById('phong_phoi_hop').style.display='none';
                              document.getElementById('rece_depa').style.display='block';
                              document.getElementById('rece_main').style.display='block'; 
                          }
                          
						  // ----- script cua trg, pho phog
                          function show_process(){	
                              document.getElementById('level_7').style.display='';
                              document.getElementById('level_8').style.display='none'; 
                          }	
                          function hide_process(){
                              document.getElementById('level_8').style.display='';
                              document.getElementById('level_7').style.display='none'; 
                          }
                    </script>
                    {/literal}
                    
                    {if $user_level eq 4 or $user_level eq 5 or $user_level eq 9 or $user_level eq 1}
                    <div style="float:left; width:650px; height:30px">
                    	<div style="float:left; width:90px; line-height:25px; text-align:left">Chỉ đạo xử lý <font color="#FF0000">*</font>:</div>
                        <div style="float:left; width:247px; line-height:25px; text-align:left">
                        	<select name="change_rece" id="change_rece" class="select_middle_long" onClick="javascript: if(this.value==1)hide_per(); else show_per();">
                                <option value="0" {if $obj_info.docReply_id neq ''}{if $obj_info.recevie_per neq 0} selected {/if}{else}selected{/if}>Chuyển tới Ban lãnh đạo</option>
                                <option value="1" {if $obj_info.docReply_id neq ''}{if $obj_info.main_department neq 0} selected {/if}{/if}>Chuyển tới phòng ban</option>
                        	</select>
                        </div>
                        <!----------------lanh dao nhan van ban---------------->
                        <div id="rece_per" style="float:left; line-height:25px; {if $obj_info.docReply_id neq ''}{if $obj_info.recevie_per eq 0}display:none{/if}{/if}">
                        	<div style="float:left; width:70px; line-height:25px; text-align:left">Người nhận:</div>
                            <div style="float:left; width:240px; line-height:25px; text-align:left">
                            	<select name="recevie_per" id="recevie_per" class="select_middle_long" onChange="set_txtarea()" onfocus="hide_message_DocReply();">
                                    <option value="0">Chọn người nhận chỉ đạo</option>
                                    {section name=ui loop=$obj_list_user}
                                    <option value="{$obj_list_user[ui]->user_id}"  {if $obj_list_user[ui]->user_id eq $obj_info.recevie_per}selected="selected"{/if}>
                                        {$obj_list_user[ui]->user_fullname}
                                        {section name=qi loop=$obj_list_object}
                                        {if $obj_list_object[qi]->object_id eq $obj_list_user[ui]->object_id}
                                        - {$obj_list_object[qi]->object_name}
                                        {/if}
                                        {/section}
                                    </option>
                                    {/section}
                                </select>
                            </div>
                        </div>
                        <!----------------phong ban nhan van ban---------------->
                        <div id="rece_main" style="float:left; line-height:25px; {if $obj_info.docReply_id neq ''}{if $obj_info.main_department eq 0}display:none{/if}{else}display:none{/if}">
                        	<div style="float:left; width:70px; line-height:25px; text-align:left">P/B chủ trì:</div>
                            <div style="float:left; width:230px; line-height:25px; text-align:left">
                            	<select name="main_department" id="main_department" class="select_middle_long" onChange="set_txtarea1()" onfocus="hide_message_DocReply();">
                                    <option value="0">Chọn phòng ban</option>
                                    {section name=qi loop=$obj_list_department}
                                    <option value="{$obj_list_department[qi]->department_id}"  {if $obj_list_department[qi]->department_id eq $obj_info.main_department}selected="selected"{/if}>{$obj_list_department[qi]->department_name}</option>
                                    {/section}
                                </select>
                            </div>
                        </div>
                    </div>
                    {else}
                    <!----------------Truong/pho phong chi dao---------------->
                    <div style="float:left; width:650px; line-height:25px;">
                    	<div style="float:left; width:90px; line-height:25px; text-align:left">Chỉ đạo xử lý:</div>
                        <div style="float:left; width:200px; line-height:25px; text-align:left">
                        	<select name="process_level" id="process_level" class="select_middle" onClick="javascript: if(this.value==7)show_process(); else hide_process();">
                                <option value="7" {if $obj_info.process_level eq 7}selected="selected"{/if}>Phó phòng/ban</option>
                                <option value="8" {if $obj_info.process_level eq 8}selected="selected"{/if}>Chuyên viên</option>
                        	</select>
                        </div>
                        <!----------------pho phong nhan---------------->
                        <div id="level_7" style="float:left; line-height:25px; {if $obj_info.docReply_id neq ''}{if $obj_info.process_level neq 7}display:none{/if}{/if}">
                        	<div style="float:left; width:80px; line-height:25px; text-align:left">Phó phòng/ban:</div>
                            <div style="float:left; width:230px; line-height:25px; text-align:left">
                            	<select name="process_per_01" id="process_per_01" class="select_middle_long" onfocus="hide_message_DocReply();">
                                    <option value="0">Chọn người nhận</option>
                                    {section name=ui loop=$obj_list_user}
                                    {if $obj_list_user[ui]->user_level eq 7}
                                    <option value="{$obj_list_user[ui]->user_id}" {if $obj_list_user[ui]->user_id eq $obj_info.process_per}selected="selected"{/if}>
                                    -&nbsp;{$obj_list_user[ui]->user_fullname}
                                    {section name=qi loop=$obj_list_object}
                                    {if $obj_list_object[qi]->object_id eq $obj_list_user[ui]->object_id}
                                    &nbsp;|&nbsp;Chức vụ: {$obj_list_object[qi]->object_name}
                                    {/if}
                                    {/section}
                                    </option>
                                    {/if}
                                    {/section}
                                </select>
                            </div>
                        </div>
                        <!----------------chuyen vien nhan---------------->
                        <div id="level_8" style="float:left; line-height:25px; {if $obj_info.docReply_id neq ''}{if $obj_info.process_level neq 8}display:none{/if}{else}display:none{/if}">
                        	<div style="float:left; width:80px; line-height:25px; text-align:left">Chuyên viên:</div>
                            <div style="float:left; width:230px; line-height:25px; text-align:left">
                            	<select name="process_per_02" id="process_per_02" class="select_middle_long" onfocus="hide_message_DocReply();">
                                    <option value="0">Chọn người nhận</option>
                                    {section name=ui loop=$obj_list_user}
                                    {if $obj_list_user[ui]->user_level eq 8}
                                    <option value="{$obj_list_user[ui]->user_id}" {if $obj_list_user[ui]->user_id eq $obj_info.process_per}selected="selected"{/if}>
                                    -&nbsp;{$obj_list_user[ui]->user_fullname}
                                    {section name=qi loop=$obj_list_object}
                                    {if $obj_list_object[qi]->object_id eq $obj_list_user[ui]->object_id}
                                    &nbsp;|&nbsp;Chức vụ: {$obj_list_object[qi]->object_name}
                                    {/if}
                                    {/section}
                                    </option>
                                    {/if}
                                    {/section}
                                </select>
                            </div>
                        </div>
                    </div>
                    {/if}
                    <!--------------------------------------------------------------------------------------->
                    
                    <div style="float:left; width:650px; padding-bottom:5px">
                        <div style="float:left; width:90px; line-height:25px; text-align:left">
                        	<input type="button" name="btnSub_DocReply" id="btnSub_DocReply" value="Ghi lại" class="button" tabindex="14"/>
                            {if $obj_info.docReply_id neq ''}
                            <input type="hidden" name="docReply_id" id="docReply_id" value="{$obj_info.docReply_id}">
                            <input type="hidden" name="input_per" id="input_per" value="{$obj_info.input_per}">
                            {/if}
                            <input type="hidden" name="user_id" id="user_id" value="{if $user_id neq ''}{$user_id}{else}{$obj_info.user_id}{/if}">
                            <input type="hidden" name="doc_id" id="doc_id" value="{if $doc_id neq ''}{$doc_id}{else}{$obj_info.doc_id}{/if}">
                            <input type="hidden" name="arg_reply" id="arg_reply" value="{$vars.arg}">
                            <input type="reset" name="Reset" value="Hủy bỏ" class="button" tabindex="15"/>
                        </div>
                        {literal}
                        <script language="javascript">
                            function hide_message_DocReply(){
                                $('#lblMessage_DocReply').hide();
                                $('#lblError_DocReply').hide();
                            }

                            $(function() {
                            $('.error').hide();
                            $('#lblMessage_DocReply').hide();

                            $("#btnSub_DocReply").click(function() {

                                $('.error').hide();

                                // --------tao chuoi id cho p/b phoi hop cua phan chuyen lanh dao
                                if (typeof document.frmList_DocReply.coordinate_depart !== "undefined") {
                                    var pb_phoihop_str="";
                                    var de_arr=document.frmList_DocReply.elements.length;
                                    de_arr=(de_arr>2)?document.frmList_DocReply.coordinate_depart.length:0;
                                    if (de_arr>0){
                                        for(var i=0;i<de_arr;i++)
                                            if(document.frmList_DocReply.coordinate_depart[i].checked==true)
                                                pb_phoihop_str+=document.frmList_DocReply.coordinate_depart[i].value+",";
                                    }else{
                                        if(document.frmList_DocReply.coordinate_depart.checked==true)
                                            pb_phoihop_str=document.frmList_DocReply.coordinate_depart.value;
                                    }
                                    document.frmList_DocReply.pb_phoihop_str.value=pb_phoihop_str;
                                }

                                // --------tao chuoi id cho p/b phoi hop cua phan chuyen phong ban
                                if (typeof document.frmList_DocReply.department_id !== "undefined") {
                                    var depart_str="";
                                    var de_arr=document.frmList_DocReply.elements.length;
                                    de_arr=(de_arr>2)?document.frmList_DocReply.department_id.length:0;
                                    if (de_arr>0){
                                        for(var i=0;i<de_arr;i++)
                                            if(document.frmList_DocReply.department_id[i].checked==true)
                                                depart_str+=document.frmList_DocReply.department_id[i].value+",";
                                    }else{
                                        if(document.frmList_DocReply.department_id.checked==true)
                                            depart_str=document.frmList_DocReply.department_id.value;
                                    }
                                    document.frmList_DocReply.depart_str.value=depart_str;
                                }

                                // --------tao chuoi id cho cv phoi hop cua phan truong phong chuyen cv
                                if (typeof document.frmList_DocReply.cv_ph !== "undefined") {
                                    var cv_ph_str="";
                                    var de_arr=document.frmList_DocReply.elements.length;
                                    de_arr=(de_arr>2)?document.frmList_DocReply.cv_ph.length:0;
                                    if (de_arr>0){
                                        for(var i=0;i<de_arr;i++)
                                            if(document.frmList_DocReply.cv_ph[i].checked==true)
                                                cv_ph_str+=document.frmList_DocReply.cv_ph[i].value+",";
                                    }else{
                                        if(document.frmList_DocReply.cv_ph.checked==true)
                                            cv_ph_str=document.frmList_DocReply.cv_ph.value;
                                    }
                                    document.frmList_DocReply.cv_ph_str.value=cv_ph_str;
                                }

                                // --------tao chuoi id cho lanh dao phoi hop cua phan chuyen phong ban
                                if (typeof document.frmList_DocReply.coordinate_per !== "undefined") {
                                    var pgd_phoihop_str="";
                                    var de_arr=document.frmList_DocReply.elements.length;
                                    de_arr=(de_arr>2)?document.frmList_DocReply.coordinate_per.length:0;
                                    if (de_arr>0){
                                        for(var i=0;i<de_arr;i++)
                                            if(document.frmList_DocReply.coordinate_per[i].checked==true)
                                                pgd_phoihop_str+=document.frmList_DocReply.coordinate_per[i].value+",";
                                    }else{
                                        if(document.frmList_DocReply.coordinate_per.checked==true)
                                            pgd_phoihop_str=document.frmList_DocReply.coordinate_per.value;
                                    }
                                    document.frmList_DocReply.pgd_phoihop_str.value=pgd_phoihop_str;
                                }

                                // -----------------lay du lieu tu cac phan tu form
                                var $form = $("#frmList_DocReply");
                                var docReply_desc 	= $form.find('textarea#docReply_desc').val();
                                var docReply_date 	= $form.find('input#docReply_date').val();
                                var doc_id 			= $form.find('input#doc_id').val();
                                var user_id 		= $form.find('input#user_id').val();
                                var doc_theodoi 	= $form.find('select#doc_theodoi :selected').val();
                                var docReply_limit_time = $form.find('input#docReply_limit_time').val();
                                var daynum_num 		= $form.find('input#daynum_num').val();
                                var daynum_standfor = $form.find('input#daynum_standfor').val();
                                var recevie_per 	= $form.find('select#recevie_per :selected').val();
                                var main_department = $form.find('select#main_department :selected').val();
                                var coordinate_depart 	= $form.find('input#pb_phoihop_str').val();
                                var department_id 	= $form.find('input#depart_str').val();
                                var cv_ph 	        = $form.find('input#cv_ph_str').val();
                                var coordinate_per 	= $form.find('input#pgd_phoihop_str').val();
                                var process_level 	= $form.find('select#process_level :selected').val();
                                var process_per_01 	= $form.find('select#process_per_01 :selected').val();
                                var process_per_02 	= $form.find('select#process_per_02 :selected').val();

                                var docReply_id 	= $form.find('input#docReply_id').val();
                                var arg 			= $form.find('input#arg_reply').val();

                                //begin validate form
                                if (docReply_desc == "" || ((recevie_per == 0 && main_department == 0) || (process_per_01 == 0 && process_per_02 == 0))){
                                    $('#lblError_DocReply').show();
                                }
                                else{

                                    $.post('index.php?listDocReply&mod=docs&add_edit=1',
                                        {
                                            docReply_desc:docReply_desc,
                                            docReply_date:docReply_date,
                                            doc_id:doc_id,
                                            user_id:user_id,
                                            doc_theodoi:doc_theodoi,
                                            docReply_limit_time:docReply_limit_time,
                                            daynum_num:daynum_num,
                                            daynum_standfor:daynum_standfor,
                                            recevie_per:recevie_per,
                                            main_department:main_department,
                                            coordinate_depart:coordinate_depart,
                                            department_id:department_id,
                                            cv_ph:cv_ph,
                                            coordinate_per:coordinate_per,
                                            docReply_id:docReply_id,
                                            process_level:process_level,
                                            process_per_01:process_per_01,
                                            process_per_02:process_per_02
                                        },
                                        function(data){
                                            $('#list_reply_cont').html(data);
                                            $("#list_reply_cont").show();

                                            var user_level_txt 	= document.getElementById('user_level_txt').value;
                                            if(user_level_txt==1 || user_level_txt==2 || user_level_txt==9){
                                                $('#doc_content_main').hide();
                                                $('#doc_content_main').fadeOut('fast').load('index.php?listDoc'+arg).fadeIn("fast");
                                            }else if(user_level_txt==4 || user_level_txt==5){
                                                $('#doc_content_main').hide();
                                                $('#doc_content_main').fadeOut('fast').load('index.php?replyDoc'+arg).fadeIn("fast");
                                            }else if(user_level_txt==3 || user_level_txt==6 || user_level_txt==7){
                                                $('#doc_content_main').hide();
                                                $('#doc_content_main').fadeOut('fast').load('index.php?processDoc'+arg).fadeIn("fast");
                                            }
                                        }
                                    );
                                    return false;
                                }
                                //end form
                            });
                        });
                        </script>
                        {/literal}

                        
                        {if $user_level eq 4 or $user_level eq 5 or $user_level eq 9 or $user_level eq 1}
                        <!---------------------phoi hop doi voi chuyen cho lanh dao----------------------->
                        <div id="phong_phoi_hop" style="float:left; width:550px; {if $obj_info.docReply_id neq ''}{if $obj_info.recevie_per eq 0}display:none{/if}{/if}">
                            <div style="float:left; width:105px; line-height:25px; text-align:left">Phòng/ban phối hợp:</div>
                            <div style="float:left; width:440px; text-align:left; height:87px; overflow-y:scroll; border:1px solid #99bbe8">
                            	{if $obj_info.recevie_per neq 0}
                                    {section name=qi loop=$obj_list_coordinate_depart_selected}
                                    <div style="float:left; width:200px; margin:2px">
                                    <input type="checkbox" name="coordinate_depart" value="{$obj_list_coordinate_depart_selected[qi]->department_id}" checked>&nbsp;{$obj_list_coordinate_depart_selected[qi]->department_name}
                                    </div>
                                    {/section}
                                    {section name=qi loop=$obj_list_coordinate_depart_unse}
                                    <div style="float:left; width:200px; margin:2px">
                                    <input type="checkbox" name="coordinate_depart" value="{$obj_list_coordinate_depart_unse[qi]->department_id}">&nbsp;{$obj_list_coordinate_depart_unse[qi]->department_name}
                                    </div>
                                    {/section}
                                {else}                          
                                    {section name=qi loop=$obj_list_department}
                                    <div style="float:left; width:200px; margin:2px">
                                    <input type="checkbox" name="coordinate_depart" id="coordinate_depart" value="{$obj_list_department[qi]->department_id}" {if $obj_list_department[qi]->department_id eq $obj_info.department_id}checked{/if}>&nbsp;{$obj_list_department[qi]->department_name}
                                    </div>
                                    {/section}
                                {/if}
                                <input type="hidden" name="pb_phoihop_str" id="pb_phoihop_str" value="">
                            </div>
                        </div>
                        
                        <!---------------------phoi hop doi voi chuyen cho phong ban----------------------->
                        <div id="rece_depa" style="float:left; width:550px; {if $obj_info.docReply_id neq ''}{if $obj_info.main_department eq 0}display:none{/if}{else}display:none{/if}">
                            <div style="float:left">
                                <div style="float:left; width:105px; line-height:25px; text-align:left">Phòng/ban phối hợp:</div>
                                <div style="float:left; width:440px; text-align:left; height:87px; overflow-y:scroll; border:1px solid #99bbe8">
                                	{if $obj_info.main_department neq 0}
                                        {section name=qi loop=$obj_list_depa_selected}
                                        <div style="float:left; width:200px; margin:2px">
                                        <input type="checkbox" name="department_id" id="department_id" value="{$obj_list_depa_selected[qi]->department_id}" checked>&nbsp;{$obj_list_depa_selected[qi]->department_name}
                                        </div>
                                        {/section}
                                        {section name=qi loop=$obj_list_depa_unse}
                                        <div style="float:left; width:200px; margin:2px">
                                        <input type="checkbox" name="department_id" id="department_id" value="{$obj_list_depa_unse[qi]->department_id}">&nbsp;{$obj_list_depa_unse[qi]->department_name}
                                        </div>
                                        {/section}
                                    {else}
                                        {section name=qi loop=$obj_list_department}
                                        <div style="float:left; width:200px; margin:2px">
                                        <input type="checkbox" name="department_id" id="department_id" value="{$obj_list_department[qi]->department_id}" {if $obj_list_department[qi]->department_id eq $vars.department_id}checked{/if}>&nbsp;{$obj_list_department[qi]->department_name}
                                        </div>
                                        {/section}
                                    {/if}
                                    <input type="hidden" name="depart_str" id="depart_str" value="">
                                </div>
                            </div>
                            <div style="float:left; position:absolute; width:420px; height:63px; margin-top:93px; border:1px solid #99bbe8; background-color:#dfe8f6; border-top:1px solid #dfe8f6 ">
                                <div style="float:left; width:104px; line-height:25px; margin-top:5px; text-align:left">&nbsp;Lãnh đạo giám sát:</div>
                                <div style="float:left; width:305px; text-align:left; height:52px; margin-top:5px; overflow-y:scroll; border:1px solid #99bbe8">
                                	{if $obj_info.main_department neq 0}
                                        {section name=ui loop=$obj_list_coordinate_per_selected}
                                        <div style="float:left; width:280px; margin:2px">
                                        <input type="checkbox" name="coordinate_per" id="coordinate_per" value="{$obj_list_coordinate_per_selected[ui]->user_id}" checked>&nbsp;{$obj_list_coordinate_per_selected[ui]->user_fullname}
                                        {section name=qi loop=$obj_list_object}
                                        {if $obj_list_object[qi]->object_id eq $obj_list_coordinate_per_selected[ui]->object_id}
                                        - {$obj_list_object[qi]->object_name}
                                        {/if}
                                        {/section}
                                        </div>
                                        {/section}
                                        {section name=ui loop=$obj_list_coordinate_per_unse}
                                        <div style="float:left; width:280px; margin:2px">
                                        <input type="checkbox" name="coordinate_per" id="coordinate_per" value="{$obj_list_coordinate_per_unse[ui]->user_id}">&nbsp;{$obj_list_coordinate_per_unse[ui]->user_fullname}
                                        {section name=qi loop=$obj_list_object}
                                        {if $obj_list_object[qi]->object_id eq $obj_list_coordinate_per_unse[ui]->object_id}
                                        - {$obj_list_object[qi]->object_name}
                                        {/if}
                                        {/section}
                                        </div>
                                        {/section}
                                	{else}
                                        {section name=ui loop=$obj_list_user}
                                        <div style="float:left; width:280px; margin:2px">
                                        <input type="checkbox" name="coordinate_per" id="coordinate_per" value="{$obj_list_user[ui]->user_id}" {if $obj_list_user[ui]->user_id eq $vars.user_id}checked{/if}>&nbsp;{$obj_list_user[ui]->user_fullname}
                                        {section name=qi loop=$obj_list_object}
                                        {if $obj_list_object[qi]->object_id eq $obj_list_user[ui]->object_id}
                                        - {$obj_list_object[qi]->object_name}
                                        {/if}
                                        {/section}
                                        </div>
                                        {/section}
                                    {/if}
                                    <input type="hidden" name="pgd_phoihop_str" id="pgd_phoihop_str" value="">
                                </div>
                            </div>
                        </div>
                        <!--------------------------------------------------------------------------------->
                        {/if}
                        {if $user_level eq 6}
                        <!--------------------------------chuyen vien phoi hop------------------------------------>
                        <div style="float:left; line-height:25px;">
                            <div style="float:left; width:165px; line-height:25px; text-align:left">Chuyên viên phối hợp giải quyết:</div>
                            <div style="float:left; width:380px; line-height:25px; text-align:left">
                                {section name=ui loop=$obj_list_user}
                                    {if $obj_list_user[ui]->user_level eq 8}
                                        <div style="float:left; width:160px; margin:2px">
                                            <input type="checkbox" name="cv_ph" id="cv_ph" value="{$obj_list_user[ui]->user_id}" {if $obj_list_user[ui]->user_id eq $vars.user_id}checked{/if}>&nbsp;{$obj_list_user[ui]->user_fullname}
                                        </div>
                                    {/if}
                                {/section}
                                <input type="hidden" name="cv_ph_str" id="cv_ph_str" value="">
                            </div>
                        </div>
                        {/if}
                    </div>
                </td>
            </tr>
        </table>
    </fieldset>
    <!------------------------------------DANH SACH---------------------------------------------->
    <fieldset style="width:655px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:139px">
        <legend class="legend">
        	<div style="width:130px; float:left">Danh sách: {$total_num_result}</div>
        </legend>
    	<div style="float:left; height:5px; width:100%"></div>
        <div style="float:left; height:25px; width:637px; border-top:1px solid #99bbe8; border-bottom:1px solid #99bbe8 ">
            <div class="tbl_tit" style="width:30px; text-align:center"><b>STT</b></div>	
            <div class="tbl_tit" style="width:70px"><B>&nbsp;Ngày</B></div>
            <div class="tbl_tit" style="width:115px"><B>&nbsp;Chuyển từ</B></div>
            <div class="tbl_tit" style="width:170px"><B>&nbsp;Nội dung</B></div>
            <div class="tbl_tit" style="width:115px"><B>&nbsp;Chuyển đến</B></div>
            <div class="tbl_tit" style="width:70px"><B>&nbsp;Hạn xử lý</B></div>
            <div class="tbl_tit" style="width:60px; text-align:center"><B>Chọn</B></div>
        </div>
        <div style="float:left; width:18px; height:25px">&nbsp;</div>
        <div style="float:left; height:85px; width:655px; overflow-y:scroll">
            {section name=pi loop=$obj_list}
            {if $smarty.section.pi.index is not div by 2} 
            {assign var="class_td" value="tbl_cont"} 
            {else}
            {assign var="class_td" value="tbl_cont2"} 
            {/if}
            {math x=$vars.curpage-1 y=$vars.numresult z=$smarty.section.pi.index t=1 equation="x*y+z+t" assign=stt}
            <div class="{$class_td}" style="width:30px; text-align:center">{$stt}</div>
            <div class="{$class_td}" style="width:70px; white-space:nowrap">&nbsp;{$obj_list[pi]->docReply_date|date_format:"%d/%m/%Y"}
            </div>
            <div class="{$class_td}" style="width:115px; white-space:nowrap">
            	{section name=qi loop=$obj_list_user_all}
                {if $obj_list_user_all[qi]->user_id eq $obj_list[pi]->user_id}&nbsp;{$obj_list_user_all[qi]->user_fullname|str_string_cut:"25":"1"}{/if}
                {/section}
            </div>
            <div class="{$class_td}" style="width:170px; white-space:nowrap" title="{$obj_list[pi]->docReply_desc}">
            	{if $user_id eq $obj_list[pi]->user_id}
                <a href='javascript: void(0);' onclick="edit_me_DocReply({$obj_list[pi]->docReply_id})">&nbsp;{$obj_list[pi]->docReply_desc|str_string_cut:"40":"1"}</a>
                {else}&nbsp;{$obj_list[pi]->docReply_desc|str_string_cut:"40":"1"}{/if}
            </div>
            <div class="{$class_td}" style="width:115px; white-space:nowrap">
            	{if $obj_list[pi]->main_department neq 0}
                    {section name=di loop=$obj_list_department}
                    {if $obj_list_department[di]->department_id eq $obj_list[pi]->main_department}<div style="float:left" title="{$obj_list_department[di]->department_name}">&nbsp;{$obj_list_department[di]->department_name|str_string_cut:"25":"1"}</div>{/if}
                    {/section}
                {elseif $obj_list[pi]->recevie_per neq 0}
                    {section name=di loop=$obj_list_user_all}
                    {if $obj_list_user_all[di]->user_id eq $obj_list[pi]->recevie_per}<div style="float:left" title="{$obj_list_user_all[di]->user_fullname}">&nbsp;{$obj_list_user_all[di]->user_fullname|str_string_cut:"25":"1"}</div>{/if}
                    {/section}
                {else}
                    {section name=di loop=$obj_list_user_all}
                    {if $obj_list_user_all[di]->user_id eq $obj_list[pi]->process_per}<div style="float:left" title="{$obj_list_user_all[di]->user_fullname}">&nbsp;{$obj_list_user_all[di]->user_fullname|str_string_cut:"25":"1"}</div>{/if}
                    {/section}
                {/if}
            </div>
            <div class="{$class_td}" style="width:70px; white-space:nowrap" title="{$obj_list[pi]->docReply_name}">
            	{if $obj_list[pi]->docReply_limit_time eq '2013-01-01' or $obj_list[pi]->docReply_limit_time eq '1970-01-01'}&nbsp;-{else}&nbsp;{$obj_list[pi]->docReply_limit_time|date_format:"%d-%m-%Y"}{/if}
            </div>
            <div class="{$class_td}" style="width:30px; text-align:center">
            	{if $user_id eq $obj_list[pi]->user_id or $access_user_id eq $obj_list[pi]->user_id}
                <a href='javascript: void(0);' onclick="edit_me_DocReply({$obj_list[pi]->docReply_id})">
                <img src="../images/admin/b_edit.png" width="11" height="11" border="0" title="Sửa"></a>
                {else}-{/if}
            </div>
            <div class="{$class_td}" style="width:29px; text-align:center">
            	{if $user_id eq $obj_list[pi]->user_id or $access_user_id eq $obj_list[pi]->user_id}
                <a href='javascript: void(0)' onClick="delItems_DocReply('{$processurl}', {$obj_list[pi]->docReply_id});">
                <img src="../images/admin/b_drop.png" width="11" height="11" border="0" title="Xóa"></a>
                {else}-{/if}
            </div>
            {/section}
        </div>
        <input type="hidden" id="curpage_DocReply" name="curpage" value="{$vars.curpage}" />
    </fieldset>
    </form>
</div>
<!------------------------------------------------- Tool bar --------------------------------------------->
<div id="file_clear_txt"></div>
<div id="file_tool_bar">    
    <div id="file_page_area">
    {if $vars.curpage eq 1}
    	<img src="{$css_path}icon_first_page.png" class="img_all">
    	<img src="{$css_path}icon_pre_page.png" class="img_all">
    {else}
    <a href="javascript: void(0)" id="first_page" onclick="gotoPage_DocReply('{$processurl}',parseInt(1));" title="Trang đầu">
    	<img src="{$css_path}icon_first_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="pre_page" onclick="gotoPage_DocReply('{$processurl}',parseInt(document.getElementById('page_DocReply').value)-parseInt(1));" title="Trang trước">
    	<img src="{$css_path}icon_pre_page.png" class="img_all">
    </a>
    {/if}
    </div>
    <div style="float:left; line-height:19px">
        <div style="float:left; width:35px">Trang</div> 
        <div style="float:left; width:35px">
        <input type="text" value="{$vars.curpage}" name="page" id="page_DocReply" onblur=" gotoPage_DocReply('{$processurl}',this.value);" style="width:30px; font-size:12px; height:15px; border:1px solid #99bbe8">
        </div>
        <div style="float:left; width:22px"> / {$num_page}</div>
    </div>
    <div id="file_page_area">
    {if $vars.curpage eq $num_page}
    	<img src="{$css_path}icon_next_page.png" class="img_all">
        <img src="{$css_path}icon_last_page.png" class="img_all">
    {else}
    <a href="javascript: void(0)" id="next_page" onclick="gotoPage_DocReply('{$processurl}',parseInt(document.getElementById('page_DocReply').value)+parseInt(1));" title="Trang tiếp">
    	<img src="{$css_path}icon_next_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="last_page" onclick="gotoPage_DocReply('{$processurl}',parseInt({$num_page}));" title="Trang cuối">
    	<img src="{$css_path}icon_last_page.png" class="img_all">
    </a>
    {/if}
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:left; width:15px">
    <a href="javascript: void(0)" id="a_ref_DocReply" title="Tải lại"><img src="{$css_path}icon_refresh.png" class="img_all"></a>
    </div>    
</div>

<div id="div_note" onclick="javascript: change_bgcl_doc('div_note')" style="width:456px; float:left; font-weight:normal; position:absolute; display:none; margin:90px 0 0 237px; background-color:#ffffff; border:1px solid #99bbe8; z-index:1010; padding: 0px 1px 1px 1px">
    <div id="div_note_main_cont">
        <div id="div_note_tab_bar_tit">Nội dung tham mưu</div>
        <div id="div_note_tab_bar_icon">
            <a href="javascript: void(0);" onClick="javascript: document.getElementById('div_note').style.display='none'" style="text-decoration:none">
                <img src="{$css_path}icon_dong.png" class="img_all" title="Đóng lại"></a>
        </div>
        <div id="div_note_content_outsign">
            <div id="list_div_note_cont">
                <div style="float:left; line-height: 25px;">
                {if $doc_info.doc_traned eq 1}
                    Ngày tháng: {$doc_info.doc_moved|date_format:"%d/%m/%Y"}<br>
                    Nội dung:<br>
                    {$doc_info.doc_note|replace:"\n":"<br>"|str_string_cut:"250":"1"}
                {else}
                    Chưa có ý kiến tham mưu.
                {/if}
                </div>
            </div>
        </div>
    </div>
</div>

{literal}
<script language="javascript">		
	function docheck_DocReply(status,from_){
		var alen=document.frmList_DocReply.elements.length;
		alen=(alen>5)?document.frmList_DocReply.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
			document.frmList_DocReply.chkid[i].checked=status;
		}
		else{
			document.frmList_DocReply.chkid.checked=status;
		}
		if(from_>0) document.frmList_DocReply.chkall.checked=status;
	}
		
	function docheckone_DocReply(){
		var alen=document.frmList_DocReply.elements.length;
		var isChecked=true;
		alen=(alen>4)?document.frmList_DocReply.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_DocReply.chkid[i].checked==false)
					isChecked=false;
		}else{
			if(document.frmList_DocReply.chkid.checked==false)
				isChecked=false;
		}				
		document.frmList_DocReply.chkall.checked=isChecked;
	}
	
	function calculatechon_DocReply(){			
		var strchon="";
		var alen=document.frmList_DocReply.elements.length;				
		alen=(alen>2)?document.frmList_DocReply.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_DocReply.chkid[i].checked==true)
					strchon+=document.frmList_DocReply.chkid[i].value+",";
		}else{
			if(document.frmList_DocReply.chkid.checked==true)
				strchon=document.frmList_DocReply.chkid.value;
		}
		document.frmList_DocReply.chon_DocReply.value=strchon;
	}
	
	function delItems_DocReply(processurl,delStr){
		if (delStr == undefined){
			calculatechon_DocReply();
			delStr = document.getElementById("chon_DocReply").value;
		}
		if (delStr == ""){
			return false;
		}
		if(!confirm("THÔNG BÁO: \n\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
			return false;
		}	
		
		var numresult_DocReply,order_DocReply,curpage_DocReply;
		numresult = $("#numresult_DocReply").val();
		order = $("#order_DocReply").val();
		curpage = $("#curpage_DocReply").val();
		
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
				$('#list_reply_cont').fadeOut('fast').load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+curpage).fadeIn("fast");
			}
		});
	}

    function show_ndtm(){
        $("#div_note").css({'display':'block','z-index':'2001'});
    }
	
	function reloadPage_DocReply(processurl){
		var numresult_DocReply,order_DocReply,cur_pos;
		numresult = $("#numresult_DocReply").val();
		order = $("#order_DocReply").val();
		cur_pos = 0;
		$("#list_reply_cont").load(processurl+"&numresult="+numresult+"&order="+order+"&cur_pos="+cur_pos);
	}
	
	function gotoPage_DocReply(processurl,page){
		var numresult_DocReply,order_DocReply,cur_pos;
		numresult = $("#numresult_DocReply").val();
		order = $("#order_DocReply").val();
		//alert(processurl+'-'+page+'-'+numresult+'-'+order);
		$("#list_reply_cont").load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+page);
	}
	
	function edit_me_DocReply(id){
		var doc_id = document.frmList_DocReply.doc_id.value;
		var user_id = document.frmList_DocReply.user_id.value;
		var arg = document.getElementById('arg_reply').value;
		$("#list_reply_cont").load("?listDocReply&mod=docs&edit_me=1&docReply_id="+id+arg);
	}
	
	function show_huongdan(id){
		$('#div_huongdan').css({'display':'block','z-index':'2001'});
		$("#list_huongdan_cont").load("?listHuongdan&mod=daydocs");
	}
			
	$("#a_ref_DocReply").click( function () { 
			var id = document.frmList_DocReply.doc_id.value;
			var arg = document.getElementById('arg').value;
			$('#list_reply_cont').hide();
			$('#list_reply_cont').fadeOut('fast').load('index.php?listDocReply&doc_id='+doc_id+'&'+arg).fadeIn("fast");
		});
</script>
{/literal}