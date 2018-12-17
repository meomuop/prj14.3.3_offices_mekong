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
<div id="kdl_content_insign">
	<form method="post" name="frmList_Kdl_chung" action="?listKDL_Chung{$vars.arg}" id="frmList_Kdl_chung">
    <!------------------------------------KHO DU LIEU---------------------------------------------->
    <div style="float:left">
    <fieldset style="width:259px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:482px">
    <legend class="legend_list" style="width:200px">
        <div style="width:90px; float:left">Danh mục: {$total_num_result}</div>
        <div style="width:90px; float:left">
        	Lọc với: <select name="kdl_name_fs" id="kdl_name_fs" class="select_tiny" style="width:35px" onchange="loc_dl({$kdl_type});">
                {section name=sli loop=$char_arr}
                <option value="{$char_arr[sli]}" {if $char_arr[sli] eq $kdl_name_fs}selected{/if}>{$char_arr[sli]} </option>
                {/section}
            </select>
        </div>
        <div style="width:20px; float:left; margin-top:2px; height:14px">
        	<a href="javascript: void(0)" onclick="javascript: show_add_form()">
        	<img src="{$css_path}icon_add.png" class="img_all" title="Thêm mới"></a>
        </div>
    </legend>
    	<div style="float:left; height:5px; width:100%"></div>
        <div style="float:left; height:455px; width:259px; overflow-y:scroll">
            {section name=pi loop=$obj_list}
            {math z=$smarty.section.pi.index t=1 equation="z+t" assign=count}
            <div style="float:left; line-height:30px; border-bottom: 1px dashed #99bbe8">
            	<div style="float:left; width:20px; text-align:center">&diams;</div>
                <div style="float:left; width:221px; white-space:nowrap" title="{$obj_list[pi]->kdl_name}">
                    <div style="float:left; width:199px; white-space:nowrap">
                    <a href="javascript:void(0);" onclick="javascript: show_list_dl({$obj_list[pi]->kdl_id},{$obj_list[pi]->kdl_type},'{$vars.arg}')" {if $kdl_id eq $obj_list[pi]->kdl_id}} style="color:#F00" {/if}>{$obj_list[pi]->kdl_name|str_string_cut:"45":"1"}</a>
                    </div>
                    <div style="float:right; margin:2px; height:18px; width:16px; text-align:center; background-color:#dfe8f6" title="Chức năng mở rộng" id="extra_icon_kdl_{$count}">
                    <a href='javascript: void(0);' onclick="show_list_kdl_options({$count},{$total_num_result})">
                    <img src="{$css_path}extra_icon.png" width="14" height="14" border="0" class="img_all" style="margin:1px"></a>
                    </div>
                    <div id="extra_kdl_{$count}" style="position:absolute; display:none; height:auto; width:60px; margin:2px 131px; border:1px solid #8ea4c1; border-right:1px solid #8ea4c1; background-color:#dfe8f6">
                        <div style="float:left; width:60px; height:18px; border-right:1px solid #dfe8f6"><b>&nbsp;Thao tác:</b></div>
                        <div style="float:left; width:60px; padding:0 0 0 3px">
                             - <a href="javascript: void(0)" onclick="javascript: show_edit_form({$obj_list[pi]->kdl_id},{$obj_list[pi]->kdl_type})">Sửa</a>
                        </div>
                        <div style="float:left; width:60px; padding:0 0 0 3px">
                             - <a href="javascript: void(0)" onclick="javascript: delete_kdl({$obj_list[pi]->kdl_id},{$obj_list[pi]->kdl_type})">Xóa</a>
                        </div>
                    </div>
                </div>
            </div>
            {/section}
        </div>
        <input type="hidden" id="kdl_type" name="kdl_type" value="{$kdl_type}" />
    </fieldset>
    </div>
    <!------------------------------------DU LIEU---------------------------------------------->
    <div style="float:left">
    <fieldset style="width:605px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:482px">
    <legend class="legend_list" style="width:340px">
        <div style="width:100px; float:left">Dữ liệu: {$total_dl}</div>
        <div style="width:70px; float:left">&nbsp;|&nbsp;Tìm kiếm&nbsp;</div>
        <div style="width:100px; float:left">
        	<input type="text" name="keyword" id="keyword" class="text_seek" value="{$vars.keyword}"/>
            <input type="hidden" id="processurl" value="{$processurl}" />
        </div>
        <div style="width:50px; float:left">
        	<input type="button" name="btnSeek" id="btnSeek" value="Tìm >>" class="button_seek" onclick="search_me_Dl({$kdl_id},{$kdl_type})" /></div>
        <div style="width:20px; float:left; margin-top:2px; height:14px">
        	<a href="javascript: void(0)" onclick="javascript: show_add_dl_form({$kdl_id},{$kdl_type})">
        	<img src="{$css_path}icon_add.png" class="img_all" title="Thêm mới"></a>
        </div>
    </legend>
    	<div style="float:left; height:5px; width:100%"></div>
    	<div style="float:left; height:25px; width:587px; border-top:1px solid #99bbe8; border-bottom:1px solid #99bbe8 ">
            <div class="tbl_tit" style="width:30px; text-align:center"><b>STT</b></div>	
            <div class="tbl_tit" style="width:180px"><B>&nbsp;Tên dữ liệu</B></div>
            <div class="tbl_tit" style="width:252px"><B>&nbsp;Mô tả</B></div>
            <div class="tbl_tit" style="width:70px"><B>&nbsp;Ngày tháng</B></div>
            <div class="tbl_tit" style="width:50px"><B>&nbsp;Tệp tin</B></div>
        </div>
        <div style="float:left; height:428px; width:605px; overflow-y:scroll">
        	{if $obj_list_dl}
            {section name=dli loop=$obj_list_dl}
            {if $smarty.section.dli.index is not div by 2} 
            {assign var="class_td" value="tbl_cont"} 
            {else}
            {assign var="class_td" value="tbl_cont2"} 
            {/if}
            {math z=$smarty.section.dli.index t=1 equation="z+t" assign=stt}
            <div class="{$class_td}" style="width:30px; text-align:center">{$stt}</div>
            <div class="{$class_td}" style="width:180px; white-space:nowrap" title="{$obj_list_dl[dli]->dl_name}">
            	<div style="float:left; width:130px; white-space:nowrap">&nbsp;{$obj_list_dl[dli]->dl_name|str_string_cut:"35":"1"}</div>
                <div style="float:right; margin:2px; border:1px solid #8ea4c1; height:18px; width:16px; text-align:center; background-color:#dfe8f6" title="Chức năng mở rộng">
                <a href='javascript: void(0);' onclick="show_list_dl_options({$stt},{$total_dl})">
                <img src="{$css_path}extra_icon.png" width="14" height="14" border="0" class="img_all"></a>
                </div>
                <div id="extra_dl_{$stt}" style="position:absolute; display:none; height:auto; width:60px; margin:2px 99px; border:1px solid #8ea4c1; border-right:1px solid #8ea4c1; background-color:#dfe8f6">
                    <div style="float:left; width:60px; height:18px; border-right:1px solid #dfe8f6"><b>&nbsp;Thao tác:</b></div>
                    <div style="float:left; width:60px; padding:0 0 0 3px">
                         - <a href="javascript: void(0)" onclick="javascript: show_edit_dl_form({$obj_list_dl[dli]->dl_id},{$kdl_id},{$kdl_type})">Sửa</a>
                    </div>
                    <div style="float:left; width:60px; padding:0 0 0 3px">
                         - <a href="javascript: void(0)" onclick="javascript: delete_dl({$obj_list_dl[dli]->dl_id},{$kdl_id},{$kdl_type})">Xóa</a>
                    </div>
                </div>
            </div>
            <div class="{$class_td}" style="width:252px; white-space:nowrap" title="{$obj_list_dl[dli]->dl_note}">
                &nbsp;{$obj_list_dl[dli]->dl_note|str_string_cut:"60":"1"}
            </div>
            <div class="{$class_td}" style="width:70px">
            	&nbsp;{$obj_list_dl[dli]->dl_date|date_format:'%d/%m/%Y'}
            </div>
            <div class="{$class_td}" style="width:50px; text-align:center">
                {if $obj_list_dl[dli]->dl_file eq 2}
                <a href='javascript: void(0);' onclick="show_list_dl_file({$obj_list_dl[dli]->dl_id},{$kdl_id},{$kdl_type})">
                <img src="../images/admin/empty_icon.png" width="14" height="14" border="0"></a>
                {else}
                <a href='javascript: void(0);' onclick="show_list_dl_file({$obj_list_dl[dli]->dl_id},{$kdl_id},{$kdl_type})">
                <img src="../images/admin/folder_icon.png" width="14" height="14" border="0"></a>
                {/if}
            </div>
            {/section}
            {else}<div class="{$class_td}" style="width:587px; text-align:center; margin-top: 10px">Mời chọn danh mục</div>{/if}
        </div>
    </fieldset>
    </div>
    </form>
</div>
{literal}
<script language="javascript">	

	function show_list_kdl_options(count,total){
		for(i=1;i<=total;i++){
			if(i==count){
				if(document.getElementById('extra_kdl_'+i).style.display=='none'){
					document.getElementById('extra_kdl_'+i).style.display='block';
					$('#extra_icon_kdl_'+i).css({'border':'1px solid #8ea4c1'});
				}else{
					document.getElementById('extra_kdl_'+i).style.display='none';
					$('#extra_icon_kdl_'+i).css({'border':'none'});
				}
			}
			else{
				document.getElementById('extra_kdl_'+i).style.display='none';
				$('#extra_icon_kdl_'+i).css({'border':'none'});
			}
		}
	}
	
	function delete_kdl(delStr,kdl_type){
		if(!confirm("THÔNG BÁO: \n\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
			return false;
		}	
				
		var dataString = "dlStr=" + delStr +"";
			//alert (dataString);
		$.ajax({
			type: "POST",
			url: 'index.php?listKDL_Chung&mod=kdls&del_kdl=1&kdl_id='+delStr+'&kdl_type='+kdl_type,
			data: dataString,
			success: function(data) {
				$('#kdl_content_main').fadeOut('fast').load('index.php?listKDL_Chung&mod=kdls&kdl_id='+delStr+'&kdl_type='+kdl_type).fadeIn("fast");
			}
		});
	}
	
	function show_list_dl_options(count,total){
		for(i=1;i<=total;i++){
			if(i==count){
				if(document.getElementById('extra_dl_'+i).style.display=='none')
					document.getElementById('extra_dl_'+i).style.display='block';
				else
					document.getElementById('extra_dl_'+i).style.display='none';
			}
			else
				document.getElementById('extra_dl_'+i).style.display='none';
		}
	}
	
	function delete_dl(delStr,kdl_id,kdl_type){
		if(!confirm("THÔNG BÁO: \n\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
			return false;
		}	
				
		var dataString = "dlStr=" + delStr +"";
			//alert (dataString);
		$.ajax({
			type: "POST",
			url: 'index.php?listKDL_Chung&mod=kdls&del_dl=1&kdl_id='+kdl_id+'&kdl_type='+kdl_type,
			data: dataString,
			success: function(data) {
				$('#kdl_content_main').fadeOut('fast').load('index.php?listKDL_Chung&mod=kdls&kdl_id='+kdl_id+'&kdl_type='+kdl_type).fadeIn("fast");
			}
		});
	}
	
	function show_list_dl(kdl_id,kdl_type,vars_arg){
		$('#kdl_content_main').load('index.php?listKDL_Chung&mod=kdls'+vars_arg+'&kdl_id='+kdl_id+'&kdl_type='+kdl_type).fadeIn("fast");
	}
	
	function search_me_Dl(kdl_id,kdl_type){
		var keyword 			= document.getElementById('keyword').value;
		if (keyword == ""){
			return false;
		}
		
		$.post('?listKDL_Chung&mod=kdls&kdl_id='+kdl_id+'&kdl_type='+kdl_type,
			{keyword:keyword},
			function(data){
				$('#kdl_content_main').html(data);
				$("#kdl_content_main").show();
			}
		);
	}
	
	function loc_dl(kdl_type){
		var kdl_name_fs = document.getElementById('kdl_name_fs').value;		
		$.post('?listKDL_Chung&mod=kdls&kdl_type='+kdl_type,
			{kdl_name_fs:kdl_name_fs},
			function(data){
				$('#kdl_content_main').html(data);
				$("#kdl_content_main").show();
			}
		);
	}
	
	function show_list_dl_file(dl_id,kdl_id,kdl_type){

		$('#dl_file').css({'display':'block','z-index':'2010'});
		$("#dl_file_cont").load("?listDlFile&mod=kdls&dl_id="+dl_id+"&kdl_id="+kdl_id+"&kdl_type="+kdl_type);
	}
	
	function show_add_form(){
		$('#add_edit_kdl').css({'display':'block','z-index':'2010'});
		$('#list_add_edit_kdl_cont').load('index.php?addEditKDL&mod=kdls').fadeIn("fast");	
	}
	
	function show_edit_form(kdl_id,kdl_type){
		$('#add_edit_kdl').css({'display':'block','z-index':'2010'});
		$('#list_add_edit_kdl_cont').load('index.php?addEditKDL&mod=kdls&edit_me=1&kdl_id='+kdl_id).fadeIn("fast");	
	}
	
	function show_add_dl_form(kdl_id,kdl_type){
		if(typeof kdl_id == 'undefined'){ 
			alert('Bạn cần chọn danh mục trước khi thêm dữ liệu'); 
			return false;
		}
		$('#add_edit_dl').css({'display':'block','z-index':'2010'});
		$('#list_add_edit_dl_cont').load('index.php?addEditDL&mod=kdls&kdl_id='+kdl_id+'&kdl_type='+kdl_type).fadeIn("fast");	
	}
	
	function show_edit_dl_form(dl_id,kdl_id,kdl_type){
		$('#add_edit_dl').css({'display':'block','z-index':'2010'});
		$('#list_add_edit_dl_cont').load('index.php?addEditDL&mod=kdls&edit_me=1&dl_id='+dl_id+'&kdl_id='+kdl_id+'&kdl_type='+kdl_type).fadeIn("fast");	
	}
		
	$("#a_ref_Kdl_chung").click( function () { 
		var kdl_type = document.getElementById('kdl_type').value;
		$('#kdl_content_main').hide();
		$('#kdl_content_main').fadeOut('fast').load('index.php?listKDL_Chung&mod=kdls&kdl_type='+kdl_type).fadeIn("fast");
	});
</script>
{/literal}