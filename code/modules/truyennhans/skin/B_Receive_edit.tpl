{literal}
<style type="text/css">
.error { color:#FF0000;font-weight:bold; margin-left:5px; height:20px; line-height:20px}
.msg{ color:#00F; font-weight:bold; margin-left:5px; height:20px; line-height:20px}
.tbl_tit_view{
float:left; line-height:20px; border-right:1px solid #99bbe8; 	
}
.text_all{
	font-size:12px; line-height:20px; text-align:left; padding:0 5px 0 5px
}
.tbl_cont_view{
float:left; line-height:20px; border-right:1px solid #99bbe8; border-bottom:1px solid #99bbe8; background:#F2FFEC
}
.tbl_cont_view2{
float:left; line-height:20px; border-right:1px solid #99bbe8; border-bottom:1px solid #99bbe8; background:#FFF
}
</style>
{/literal}
{literal}
<script language="javascript">
	function tnvb_docheck(obj){
		if(document.frmTruyenvb.tnvb_chkall.checked==true){
			tnvb_checkAll(obj);
			tnvb_calculatechon();
		}else{
			untnvb_checkAll(obj);
			tnvb_calculatechon();
		}
	}
	
	function tnvb_checkAll(field){
		for (i = 0; i < field.length; i++)
			field[i].checked = true ;
	}
	
	function untnvb_checkAll(field){
		for (i = 0; i < field.length; i++)
			field[i].checked = false ;
	}
	
	function tnvb_calculatechon(){	
		var tnvb_strchon="", alen;
		alen=document.frmTruyenvb.department_id.length;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmTruyenvb.department_id[i].checked==true){
					tnvb_strchon+=document.frmTruyenvb.department_id[i].value+",";
				}
		}else{
			if(document.frmTruyenvb.department_id.checked==true)
				tnvb_strchon=document.frmTruyenvb.department_id.value;
		}
		document.frmTruyenvb.department_array.value=tnvb_strchon;
	}
	
	function tnvb_docheckone(){
		var alen=document.frmTruyenvb.elements.length;
		var isChecked=true;
		alen=(alen>4)?document.frmTruyenvb.department_id.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmTruyenvb.department_id[i].checked==false) isChecked=false;
		}else{
			if(document.frmTruyenvb.department_id.checked==false) isChecked=false;
		}				
		document.frmTruyenvb.tnvb_chkall.checked=isChecked;
		tnvb_calculatechon();
	}
</script>
{/literal}
<div id="truyenvb_content_insign">
	<form method="post" name="frmTruyenvb" action="?addReceive{$vars.arg}" id="frmTruyenvb">
    <input type="hidden" value="{$vars.arg}" id="arg" name="arg"/>
    <!------------------------------------------THONG TIN------------------------------------>
    <fieldset style="width:555px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
        <legend class="legend">Thông tin văn bản</legend>
        <input type="hidden" value="{$access_department_name}" id="doc_unit" name="doc_unit"/>
        <input type="hidden" value="{$doc_info.signPer_id}" id="signPer_id" name="signPer_id"/>
        <input type="hidden" value="{$doc_info.doc_id}" id="docout_id" name="docout_id"/>
        <input type="hidden" value="{$doc_info.doc_signed}" id="doc_signed" name="doc_signed"/>
        <input type="hidden" value="{$doc_info.docField_id}" id="docField_id" name="docField_id"/>
        <input type="hidden" value="{$doc_info.doc_code}" id="doc_code" name="doc_code"/>
        <input type="hidden" value="{$doc_info.important_id}" id="important_id" name="important_id"/>
        <input type="hidden" value="{$doc_info.secret_id}" id="secret_id" name="secret_id"/>
        <input type="hidden" value="{$doc_info.docCat_id}" id="docCat_id" name="docCat_id"/>
        <input type="hidden" value="{$doc_info.doc_desc}" id="doc_desc" name="doc_desc"/>
        <input type="hidden" value="{$doc_info.doc_note}" id="doc_direct" name="doc_direct"/>
    	<div style="float:left; width:545px; height:35px; overflow-x:scroll; white-space:nowrap" class="text_all">
        	Số K.Hiệu: {$doc_info.doc_code}; 
            Các tệp tin:
            <input type="hidden" name="docfile_name" id="docfile_name" value="0_tmp">
            <input type="hidden" name="docfile_path" id="docfile_path" value="0_tmp">
            {section name=pi loop=$obj_list_docfile}
            	[<a href='{$obj_list_docfile[pi]->docFile_path}' target="new">
                {$obj_list_docfile[pi]->docFile_name}</a>], 
                <input type="hidden" name="docfile_name" id="docfile_name" value="{$obj_list_docfile[pi]->docFile_name}">
                <input type="hidden" name="docfile_path" id="docfile_path" value="{$obj_list_docfile[pi]->docFile_path}">
            {/section}
        </div>
        <input type="hidden" name="tnvb_docfile_name_str" id="tnvb_docfile_name_str" value="">
        <input type="hidden" name="tnvb_docfile_path_str" id="tnvb_docfile_path_str" value="">
    </fieldset>
    
    <!------------------------------------------DANH SACH DON VI------------------------------------>
    <fieldset style="width:555px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
         <legend class="legend" style="width:495px;">
         <div style="float:left; width:50px;">Nơi nhận</div>
         <div style="float:left; width:105px;">
         	<select name="depart_cat" id="depart_cat" class="select_short">
                <option value="0">Tất cả</option>
            </select>
         </div>
         <div style="float:left; width:80px; margin-top:1px">
            <input type="button" name="submitTNVB" id="submitTNVB" value="Truyền đi >>" class="button"/>
            <input type="hidden" name="com_port" value="{$obj_owner[0]->site_port}">
            <input type="hidden" name="department_array" id="department_array" value="">	
         </div>
         <div style="float:left; width:255px; margin-top:2px">
            <span id="lblError_Transport" class="error">Chú ý: Cần chọn ít nhất 1 đơn vị nhận văn bản!</span>
         </div>
         </legend>
         <div style="float:left; height:5px; width:100%"></div>
         <div style="float:left; height:25px; width:537px; border-top:1px solid #99bbe8; border-bottom:1px solid #99bbe8 ">
            <div class="tbl_tit" style="width:30px; text-align:center"><b>
            <input type="checkbox" name="tnvb_chkall" value="0" onClick="tnvb_docheck(department_id);"></b></div>	
            <div class="tbl_tit" style="width:165px"><B>&nbsp;Tên phòng ban</B></div>
            <div class="tbl_tit" style="width:132px"><B>&nbsp;Người nhận</B></div>
            <div class="tbl_tit" style="width:30px"><B>&nbsp;SMS</B></div>
            <div class="tbl_tit" style="width:175px"><B>&nbsp;Ghi chú</B></div>
        </div>
        <div style="float:left; width:18px; height:25px">&nbsp;</div>
        <div style="float:left; height:290px; width:555px; overflow-y:scroll">
            {section name=qi loop=$obj_list_depa_selected}
            {if $smarty.section.qi.index is not div by 2} 
            {assign var="class_td" value="tbl_cont"} 
            {else}
            {assign var="class_td" value="tbl_cont2"} 
            {/if}
            <div style="float:left">
                <div class="{$class_td}" style="width:30px; text-align:center">
                <input type="checkbox" name="department_id" id="department_id" value="{$obj_list_depa_selected[qi]->department_id}" onClick="tnvb_docheckone();" checked>
                </div>
                <div class="{$class_td}" style="width:165px; white-space:nowrap" title="{$obj_list_depa_selected[qi]->department_name}">
                    &nbsp;{$obj_list_depa_selected[qi]->department_name|str_string_cut:"35":"1"}
                </div>
                <div class="{$class_td}" style="width:132px; text-align:center">
                    <select name="receive_per" id="receive_per" class="select_middle" style="width:122px">
                        <option value="0">Gửi cả phòng</option>
                        {php}
                            $sql="select * from tbl_users where unit_id =".$this->_tpl_vars['obj_list_depa_selected'][$this->_sections['qi']['index']]->department_id."";
                            $result = mysql_query($sql);
                            if(mysql_num_rows($result)>0):
                            while($row=mysql_fetch_array($result)):
                        {/php}
                        <option value="{php}echo $row['user_id']{/php}">{php}echo $row['user_fullname']{/php}</option>
                        {php}
                            endwhile;
                            endif;
                        {/php}
                    </select>
                </div>
                <div class="{$class_td}" style="width:30px; text-align:center">
                	<input type="checkbox" name="receive_sms" id="receive_sms" value="1">
                </div>
                <div class="{$class_td}" style="width:175px; text-align:center">
                    <input type="text" name="receive_note" id="receive_note" class="text_middle">
                </div>
            </div>
            {/section}
            <!----------------------------chua duoc chon------------------------->
            {section name=qi loop=$obj_list_depa_unse}
            {if $smarty.section.qi.index is not div by 2} 
            {assign var="class_td" value="tbl_cont"} 
            {else}
            {assign var="class_td" value="tbl_cont2"} 
            {/if}
            <div style="float:left">
                <div class="{$class_td}" style="width:30px; text-align:center">
                <input type="checkbox" name="department_id" id="department_id" value="{$obj_list_depa_unse[qi]->department_id}" onClick="tnvb_docheckone();">
                </div>
                <div class="{$class_td}" style="width:165px; white-space:nowrap" title="{$obj_list_depa_unse[qi]->department_name}">
                    &nbsp;{$obj_list_depa_unse[qi]->department_name|str_string_cut:"35":"1"}
                </div>
                <div class="{$class_td}" style="width:132px; text-align:center">
                    <select name="receive_per" id="receive_per" class="select_middle" style="width:122px">
                        <option value="0">Gửi cả phòng</option>
                        {php}
                            $sql="select * from tbl_users where unit_id =".$this->_tpl_vars['obj_list_depa_unse'][$this->_sections['qi']['index']]->department_id."";
                            $result = mysql_query($sql);
                            if(mysql_num_rows($result)>0):
                            while($row=mysql_fetch_array($result)):
                        {/php}
                        <option value="{php}echo $row['user_id']{/php}">{php}echo $row['user_fullname']{/php}</option>
                        {php}
                            endwhile;
                            endif;
                        {/php}
                    </select>
                </div>
                <div class="{$class_td}" style="width:30px; text-align:center">
                	<input type="checkbox" name="receive_sms" id="receive_sms" value="1">
                </div>
                <div class="{$class_td}" style="width:175px; text-align:center">
                    <input type="text" name="receive_note" id="receive_note" class="text_middle">
                </div>
            </div>
            {/section}
            <input type="hidden" name="tnvb_depart_str" id="tnvb_depart_str" value="">
            <input type="hidden" name="tnvb_rec_per_str" id="tnvb_rec_per_str" value="">
            <input type="hidden" name="tnvb_rec_sms_str" id="tnvb_rec_sms_str" value="">
            <input type="hidden" name="tnvb_rec_note_str" id="tnvb_rec_note_str" value="">
        </div>
        {literal}
		<script language="javascript">
            function hide_message_DocReply(){
                $('#lblMessage_Transport').hide();
                $('#lblError_Transport').hide();
            }
            
            $(function() {
            $('.error').hide();
            $('#lblMessage_Transport').hide();
             
            $("#submitTNVB").click(function() {
				
                
                $('.error').hide();
                
                // --------tao chuoi id cho p/b nhan van ban
				var tnvb_depart_str="";
				var tnvb_de_arr=document.frmTruyenvb.elements.length;	
				tnvb_de_arr=(tnvb_de_arr>2)?document.frmTruyenvb.department_id.length:0;
				if (tnvb_de_arr>0){
					for(var i=0;i<tnvb_de_arr;i++)
						if(document.frmTruyenvb.department_id[i].checked==true)
							tnvb_depart_str+=document.frmTruyenvb.department_id[i].value+",";
				}else{
					if(document.frmTruyenvb.department_id.checked==true)
						tnvb_depart_str=document.frmTruyenvb.department_id.value;
				}
				document.frmTruyenvb.tnvb_depart_str.value=tnvb_depart_str;
				
				// --------tao chuoi id nguoi nhan
				var tnvb_rec_per_str="";
				var tnvb_rec_per_arr=document.frmTruyenvb.elements.length;	
				tnvb_rec_per_arr=(tnvb_rec_per_arr>2)?document.frmTruyenvb.receive_per.length:0;
				if (tnvb_rec_per_arr>0){
					for(var i=0;i<tnvb_rec_per_arr;i++)
					tnvb_rec_per_str+=document.frmTruyenvb.receive_per[i].value+",";
				}
				document.frmTruyenvb.tnvb_rec_per_str.value=tnvb_rec_per_str;
				
				// --------tao chuoi gia tri sms tuong ung voi moi don vi nhan van ban
				var tnvb_rec_sms_str="";
				var tnvb_rec_sms_arr=document.frmTruyenvb.elements.length;	
				tnvb_rec_sms_arr=(tnvb_rec_sms_arr>2)?document.frmTruyenvb.receive_sms.length:0;
				if (tnvb_rec_sms_arr>0){
					for(var i=0;i<tnvb_rec_sms_arr;i++)
						if(document.frmTruyenvb.receive_sms[i].checked==true)
							tnvb_rec_sms_str+=document.frmTruyenvb.receive_sms[i].value+",";
				}else{
					if(document.frmTruyenvb.receive_sms.checked==true)
						tnvb_rec_sms_str=document.frmTruyenvb.receive_sms.value;
				}
				document.frmTruyenvb.tnvb_rec_sms_str.value=tnvb_rec_sms_str;
				
				// --------tao chuoi ghi chu tuong ung voi moi don vi nhan van ban
				var tnvb_rec_note_str="";
				var tnvb_rec_note_arr=document.frmTruyenvb.elements.length;	
				tnvb_rec_note_arr=(tnvb_rec_note_arr>2)?document.frmTruyenvb.receive_note.length:0;
				if (tnvb_rec_note_arr>0){
					for(var i=0;i<tnvb_rec_note_arr;i++)
					tnvb_rec_note_str+=document.frmTruyenvb.receive_note[i].value+"|";
				}
				document.frmTruyenvb.tnvb_rec_note_str.value=tnvb_rec_note_str;
				
				// --------tao chuoi ten tep dinh kem
				var tnvb_docfile_name_str="";
				var tnvb_docfile_name_arr=document.frmTruyenvb.elements.length;	
				tnvb_docfile_name_arr=(tnvb_docfile_name_arr>2)?document.frmTruyenvb.docfile_name.length:0;
				if (tnvb_docfile_name_arr>0){
					for(var i=0;i<tnvb_docfile_name_arr;i++)
					tnvb_docfile_name_str+=document.frmTruyenvb.docfile_name[i].value+"|";
				}
				document.frmTruyenvb.tnvb_docfile_name_str.value=tnvb_docfile_name_str;
				
				// --------tao chuoi duong dan tep dinh kem
				var tnvb_docfile_path_str="";
				var tnvb_docfile_path_arr=document.frmTruyenvb.elements.length;	
				tnvb_docfile_path_arr=(tnvb_docfile_path_arr>2)?document.frmTruyenvb.docfile_path.length:0;
				if (tnvb_docfile_path_arr>0){
					for(var i=0;i<tnvb_docfile_path_arr;i++)
					tnvb_docfile_path_str+=document.frmTruyenvb.docfile_path[i].value+"|";
				}
				document.frmTruyenvb.tnvb_docfile_path_str.value=tnvb_docfile_path_str;
				
                // -----------------lay du lieu tu cac phan tu form
                var $form = $("#frmTruyenvb");
				var arg 			= $form.find('input#arg').val();
                var doc_unit 		= $form.find('input#doc_unit').val();
				var docout_id 		= $form.find('input#docout_id').val();
				var doc_code 		= $form.find('input#doc_code').val();
                var signPer_id 		= $form.find('input#signPer_id').val();
                var doc_signed 		= $form.find('input#doc_signed').val();
                var docField_id 	= $form.find('input#docField_id').val();
                var important_id 	= $form.find('input#important_id').val();
                var secret_id 		= $form.find('input#secret_id').val();
                var docCat_id 		= $form.find('input#docCat_id').val();
                var doc_desc 		= $form.find('input#doc_desc').val();
                var doc_direct 		= $form.find('input#doc_direct').val();
				
				var department_id 	= $form.find('input#tnvb_depart_str').val();
				var receive_per 	= $form.find('input#tnvb_rec_per_str').val();
				var receive_sms 	= $form.find('input#tnvb_rec_sms_str').val();
				var receive_note 	= $form.find('input#tnvb_rec_note_str').val();
				
				var docfile_name 	= $form.find('input#tnvb_docfile_name_str').val();
				var docfile_path 	= $form.find('input#tnvb_docfile_path_str').val();
                
                //begin validate form
                if (department_id == ""){
                    $('#lblError_Transport').show();
                }
                else{
                    
                    $.post('index.php?editReceive&mod=truyennhans&add_edit=1'+arg,
                        {
                            doc_unit:doc_unit,
                            doc_code:doc_code,
							docout_id:docout_id,
                            signPer_id:signPer_id,
                            doc_signed:doc_signed,
                            docField_id:docField_id,
                            important_id:important_id,
                            secret_id:secret_id,
                            docCat_id:docCat_id,
                            doc_desc:doc_desc,
                            doc_direct:doc_direct,
							
                            department_id:department_id,
                            receive_per:receive_per,
                            receive_sms:receive_sms,
                            receive_note:receive_note,
							
                            docfile_name:docfile_name,
                            docfile_path:docfile_path
                        },
                        function(data){
                            $('#list_truyenvb_cont').hide();
                            $("#list_truyenvb_cont").fadeOut('fast').load('index.php?viewReceive&mod=truyennhans'+arg).fadeIn("fast");
                            
							$('#transport_content_main').hide();
							$('#transport_content_main').fadeOut('fast').load('index.php?listDocinQLVB&mod=truyennhans').fadeIn("fast");
                        }
                    );
                    return false;
                }
                //end form
            });
        });
        </script>
        {/literal}
    </fieldset>
    </form>
</div>
