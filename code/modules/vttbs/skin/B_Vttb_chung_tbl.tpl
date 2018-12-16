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
<div id="vttb_content_insign">
	<form method="post" name="frmList_Vttb_chung" action="?listVTTB_Chung{$vars.arg}" id="frmList_Vttb_chung">
    <!------------------------------------DANH MUC---------------------------------------------->
    <div style="float:left">
    <fieldset style="width:250px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:482px">
    <legend class="legend_list" style="width:200px">
        <div style="width:90px; float:left">Danh mục: {$total_num_result}</div>
        <div style="width:90px; float:left">
        	Lọc với: <select name="vttb_cat_name_fs" id="vttb_cat_name_fs" class="select_tiny" style="width:35px" onchange="loc_vttb_cat();">
                {section name=sli loop=$char_arr}
                <option value="{$char_arr[sli]}" {if $char_arr[sli] eq $vttb_cat_name_fs}selected{/if}>{$char_arr[sli]} </option>
                {/section}
            </select>
        </div>
        <div style="width:20px; float:left; margin-top:2px; height:14px">
        	{if $user_level eq 1}
            <a href="javascript: void(0)" onclick="javascript: show_a_e_vttbcat()">
        	<img src="{$css_path}icon_add.png" class="img_all" title="Thêm mới"></a>
            {else}<img src="{$css_path}icon_add.png" class="img_all" title="Thêm mới" onclick="alert_error(1)">{/if}
        </div>
    </legend>
    	<div style="float:left; height:5px; width:100%"></div>
        <div style="float:left; height:455px; width:250px; overflow-y:scroll">
            {section name=pi loop=$obj_list}
            {math z=$smarty.section.pi.index t=1 equation="z+t" assign=count}
            <div style="float:left; line-height:30px">
            	<div style="float:left; width:20px; text-align:center; background-color:#FFF">&diams;</div>
                <div style="float:left; width:212px; white-space:nowrap; background-color:#FFF" title="{$obj_list[pi]->vttb_cat_name}">
                    <div style="float:left; width:190px; white-space:nowrap">
                    {$obj_list[pi]->vttb_cat_name|str_string_cut:"45":"1"}
                    </div>
                    <div style="float:right; margin:2px; height:18px; width:16px; text-align:center; background-color:#FFF" title="Chức năng mở rộng" id="extra_icon_vttbcat_{$count}">
                    {if $user_level eq 1}
                    <a href='javascript: void(0);' onclick="show_list_vttb_cat_options({$count},{$total_num_result})">
                    <img src="{$css_path}extra_icon.png" width="14" height="14" border="0" class="img_all" style="margin:1px"></a>
                    {else}<img src="{$css_path}extra_icon.png" width="14" height="14" border="0" class="img_all" style="margin:1px" onclick="alert_error(1)">{/if}
                    </div>
                    <div id="extra_vttbcat_{$count}" style="position:absolute; display:none; height:auto; width:90px; margin:2px 101px; border:1px solid #8ea4c1; border-right:1px solid #8ea4c1; background-color:#dfe8f6; z-index:2011">
                        <div style="float:left; width:90px; height:18px; border-right:1px solid #dfe8f6"><b>&nbsp;Thao tác:</b></div>
                        <div style="float:left; width:90px; padding:0 0 0 3px">
                             - <a href="javascript: void(0)" onclick="javascript: show_edit_vttbcat({$obj_list[pi]->vttb_cat_id})">Sửa</a>
                        </div>
                        <div style="float:left; width:90px; padding:0 0 0 3px">
                             - <a href="javascript: void(0)" onclick="javascript: delete_vttbcat({$obj_list[pi]->vttb_cat_id})">Xóa</a>
                        </div>
                        <div style="float:left; width:90px; padding:0 0 0 3px">
                             - <a href="javascript: void(0)" onclick="javascript: show_a_e_vttbsub({$obj_list[pi]->vttb_cat_id})">Thêm phụ mục</a>
                        </div>
                    </div>
                </div>
                <div style="float:left; width:192px; white-space:nowrap; margin-left:40px">
                    {php}
                        $sql = "select * from tbl_vttb_subs where vttb_cat_id = ".$this->_tpl_vars['obj_list'][$this->_sections['pi']['index']]->vttb_cat_id;
                        $result = mysql_query($sql);
                        if($result):
                        $i=1;
                        $total = mysql_num_rows($result);
                        while($row=mysql_fetch_array($result)):
                        {/php}
                        <div style="float:left; line-height:30px">
                            <div style="float:left; width:170px; white-space:nowrap {if $vttb_sub_id eq $obj_list[pi]->vttb_sub_id}; color:#F00{/if}">
                                &bull; <a href="javascript:void(0);" onclick="javascript: show_list_vttb({php}echo $row['vttb_sub_id']{/php},'{$vars.arg}')" {php} if($row['vttb_sub_id'] == $this->_tpl_vars['vttb_sub_id']):{/php} style="color:#F00"{php}endif;{/php}>{php}echo fnsSubstr($row['vttb_sub_name'],50,1){/php}</a>
                            </div>
                            <div style="float:right; margin:2px; height:18px; width:16px; text-align:center; background-color:#dfe8f6" title="Chức năng mở rộng" id="extra_icon_vttbsub_{$count}_{php}echo $i;{/php}">
                            {if $user_level eq 1}
                            <a href='javascript: void(0);' onclick="show_list_vttb_sub_options({$count},{$total_num_result},{php}echo $i;{/php},{php}echo $total;{/php})">
                            <img src="{$css_path}extra_icon_sub.png" width="14" height="14" border="0" class="img_all" style="margin:1px"></a>
                            {else}<img src="{$css_path}extra_icon_sub.png" width="14" height="14" border="0" class="img_all" style="margin:1px" onclick="alert_error(1)">{/if}
                            </div>
                            <div id="extra_vttbsub_{$count}_{php}echo $i;{/php}" style="position:absolute; display:none; height:auto; width:60px; margin:2px 111px; border:1px solid #8ea4c1; border-right:1px solid #8ea4c1; background-color:#dfe8f6">
                                <div style="float:left; width:60px; height:18px; border-right:1px solid #dfe8f6"><b>&nbsp;Thao tác:</b></div>
                                <div style="float:left; width:60px; padding:0 0 0 3px">
                                     - <a href="javascript: void(0)" onclick="javascript: show_edit_vttbsub({$obj_list[pi]->vttb_cat_id},{php}echo $row['vttb_sub_id']{/php})">Sửa</a>
                                </div>
                                <div style="float:left; width:60px; padding:0 0 0 3px">
                                     - <a href="javascript: void(0)" onclick="javascript: delete_vttbsub({php}echo $row['vttb_sub_id']{/php})">Xóa</a>
                                </div>
                            </div>
                        </div>
                        {php}
                        $i++;
                        endwhile;
                        endif;
                    {/php}
                </div>
            </div>
            {/section}
        </div>
    </fieldset>
    </div>
    <!------------------------------------DANH SACH VTTB---------------------------------------------->
    <div style="float:left">
    <fieldset style="width:525px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:482px">
    <legend class="legend_list" style="width:340px">
        <div style="width:100px; float:left">Danh sách: {$total_vttb}</div>
        <div style="width:70px; float:left">&nbsp;|&nbsp;Tìm kiếm&nbsp;</div>
        <div style="width:100px; float:left">
        	<input type="text" name="keyword" id="keyword" class="text_seek" value="{$vars.keyword}"/>
            <input type="hidden" id="processurl" value="{$processurl}" />
        </div>
        <div style="width:50px; float:left">
        	<input type="button" name="btnSeek" id="btnSeek" value="Tìm >>" class="button_seek" onclick="search_me_Vttb({$vttb_sub_id})" /></div>
        <div style="width:20px; float:left; margin-top:2px; height:14px">
        	{if $user_level eq 1}
        	<a href="javascript: void(0)" onclick="javascript: show_add_vttb_form({$vttb_sub_id})">
        	<img src="{$css_path}icon_add.png" class="img_all" title="Thêm mới"></a>
            {else}<img src="{$css_path}icon_add.png" class="img_all" title="Thêm mới" onclick="alert_error(1)">{/if}
        </div>
    </legend>
    	<div style="float:left; height:5px; width:100%"></div>
    	<div style="float:left; height:25px; width:507px; border-top:1px solid #99bbe8; border-bottom:1px solid #99bbe8 ">
            <div class="tbl_tit" style="width:30px; text-align:center"><b>STT</b></div>	
            <div class="tbl_tit" style="width:242px"><B>&nbsp;Tên vật tư thiết bị</B></div>
            <div class="tbl_tit" style="width:70px"><B>&nbsp;Sử dụng từ</B></div>
            <div class="tbl_tit" style="width:70px"><B>&nbsp;Dự kiến đến</B></div>
            <div class="tbl_tit" style="width:90px"><B>&nbsp;Tình trạng</B></div>
        </div>
        <div style="float:left; height:428px; width:525px; overflow-y:scroll">
        	{if $obj_list_vttb}
            {section name=vttb_i loop=$obj_list_vttb}
            {if $smarty.section.vttb_i.index is not div by 2} 
            {assign var="class_td" value="tbl_cont"} 
            {else}
            {assign var="class_td" value="tbl_cont2"} 
            {/if}
            {math z=$smarty.section.vttb_i.index t=1 equation="z+t" assign=stt}
            <div class="{$class_td}" style="width:30px; text-align:center">{$stt}</div>
            <div class="{$class_td}" style="width:242px; white-space:nowrap" title="{$obj_list_vttb[vttb_i]->vttb_desc}">
            	<div style="float:left; width:130px; white-space:nowrap">
                    <a href='javascript: void(0);' onclick="show_vttb_info({$obj_list_vttb[vttb_i]->vttb_id},{$obj_list_vttb[vttb_i]->vttb_sub_id})">
                    &nbsp;{$obj_list_vttb[vttb_i]->vttb_name|str_string_cut:"20":"1"}</a>
                    {if $obj_list_vttb[vttb_i]->vttb_useby neq 0}
                    	({section name=ui loop=$obj_list_user}
                            {if $obj_list_user[ui]->user_id eq $obj_list_vttb[vttb_i]->vttb_useby}
                                {$obj_list_user[ui]->user_fullname} - {section name=di loop=$obj_list_department}{if $obj_list_user[ui]->unit_id eq $obj_list_department[di]->department_id}{$obj_list_department[di]->department_standfor}{/if}{/section}
                            {/if}
                        {/section})
                    {/if}
                </div>
                <div style="float:right; margin:2px; border:1px solid #8ea4c1; height:18px; width:16px; text-align:center; background-color:#dfe8f6" title="Chức năng mở rộng">
                <a href='javascript: void(0);' onclick="show_list_vttb_options({$stt},{$total_vttb})">
                <img src="{$css_path}extra_icon.png" width="14" height="14" border="0" class="img_all"></a>
                </div>
                <div id="extra_vttb_{$stt}" style="position:absolute; display:none; height:auto; width:120px; margin:2px 102px; border:1px solid #8ea4c1; border-right:1px solid #8ea4c1; background-color:#dfe8f6">
                    <div style="float:left; width:120px; height:18px; border-right:1px solid #dfe8f6"><b>&nbsp;Thao tác:</b></div>
                    {if $user_level eq 1}
                    <div style="float:left; width:120px; padding:0 0 0 3px">
                         - <a href="javascript: void(0)" onclick="javascript: show_edit_vttb_form({$obj_list_vttb[vttb_i]->vttb_id},{$vttb_sub_id})">Sửa bản ghi</a>
                    </div>
                    <div style="float:left; width:120px; padding:0 0 0 3px">
                         - <a href="javascript: void(0)" onclick="javascript: delete_vttb({$obj_list_vttb[vttb_i]->vttb_id},{$vttb_sub_id})">Xóa bản ghi</a>
                    </div>
                    {/if}
                    {if $obj_sub_info.vttb_sub_type eq 2}
                    {if $user_level eq 1}
                    <div style="float:left; width:120px; padding:0 0 0 3px">
                         - <a href="javascript: void(0)" onclick="javascript: show_list_repare({$obj_list_vttb[vttb_i]->vttb_id},{$vttb_sub_id})">Sửa chữa thiết bị</a>
                    </div>
                    <div style="float:left; width:120px; padding:0 0 0 3px">
                         - <a href="javascript: void(0)" onclick="javascript: show_list_replace({$obj_list_vttb[vttb_i]->vttb_id},{$vttb_sub_id})">Thay thế - nâng cấp</a>
                    </div>
                    {/if}
                    {else}
                    {if $user_level neq 1}
                    <div style="float:left; width:120px; padding:0 0 0 3px">
                         - <a href="javascript: void(0)" onclick="javascript: show_list_repare({$obj_list_vttb[vttb_i]->vttb_id},{$vttb_sub_id})">Sửa chữa thiết bị</a>
                    </div>
                    <div style="float:left; width:120px; padding:0 0 0 3px">
                         - <a href="javascript: void(0)" onclick="javascript: show_list_replace({$obj_list_vttb[vttb_i]->vttb_id},{$vttb_sub_id})">Thay thế - nâng cấp</a>
                    </div>
                    {/if}
                    {/if}
                    {if $obj_sub_info.vttb_sub_type eq 2 and $user_level neq 1}
                    <div style="float:left; width:120px; padding:0 0 0 3px">
                         - <a href="javascript: void(0)" onclick="javascript: show_list_datlich({$obj_list_vttb[vttb_i]->vttb_id},{$vttb_sub_id})">Đặt lịch sử dụng</a>
                    </div>
                    {/if}
                </div>
            </div>
            <div class="{$class_td}" style="width:70px">
            	&nbsp;{$obj_list_vttb[vttb_i]->vttb_commission|date_format:'%d/%m/%Y'}
            </div>
            <div class="{$class_td}" style="width:70px">
            	&nbsp;{$obj_list_vttb[vttb_i]->vttb_limit|date_format:'%d/%m/%Y'}
            </div>
            <div class="{$class_td}" style="width:90px">
            	&nbsp;{if $obj_list_vttb[vttb_i]->vttb_active eq 1}Đang sử dụng{else}Không sử dụng{/if}
            </div>
            {/section}
            {else}<div class="{$class_td}" style="width:507px; text-align:center">Mời chọn danh mục</div>{/if}
        </div>
    </fieldset>
    </div>
    </form>
</div>
{literal}
<script language="javascript">	

	function show_list_vttb_cat_options(count,total){
		for(i=1;i<=total;i++){
			if(i==count){
				if(document.getElementById('extra_vttbcat_'+i).style.display=='none'){
					document.getElementById('extra_vttbcat_'+i).style.display='block';
					$('#extra_icon_vttbcat_'+i).css({'border':'1px solid #8ea4c1'});
				}else{
					document.getElementById('extra_vttbcat_'+i).style.display='none';
					$('#extra_icon_vttbcat_'+i).css({'border':'none'});
				}
			}
			else{
				document.getElementById('extra_vttbcat_'+i).style.display='none';
				$('#extra_icon_vttbcat_'+i).css({'border':'none'});
			}
		}
	}
	
	function show_list_vttb_sub_options(count,total,count2,total2){
		for(i=1;i<=total;i++){
			if(i==count){
				for(j=1;j<=total2;j++){
					if(j==count2){
						if(document.getElementById('extra_vttbsub_'+i+'_'+j).style.display=='none'){
							document.getElementById('extra_vttbsub_'+i+'_'+j).style.display='block';
							$('#extra_icon_vttbsub_'+i+'_'+j).css({'border':'1px solid #8ea4c1'});
						}else{
							document.getElementById('extra_vttbsub_'+i+'_'+j).style.display='none';
							$('#extra_icon_vttbsub_'+i+'_'+j).css({'border':'none'});
						}
					}
					else{
						document.getElementById('extra_vttbsub_'+i+'_'+j).style.display='none';
						$('#extra_icon_vttbsub_'+i+'_'+j).css({'border':'none'});
					}
				}
			}else{
				for(j=1;j<=100;j++){ // can co cach khac de thay so 100 bang so vttb_sub lon nhat
					if (document.getElementById('extra_vttbsub_'+i+'_'+j) != null ) {
						document.getElementById('extra_vttbsub_'+i+'_'+j).style.display='none';
						$('#extra_icon_vttbsub_'+i+'_'+j).css({'border':'none'});
					}
				}
			}
		}
	}
	
	function delete_vttbcat(delStr){
		if(!confirm("THÔNG BÁO: \n\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
			return false;
		}	
				
		var dataString = "dlStr=" + delStr +"";
			//alert (dataString);
		$.ajax({
			type: "POST",
			url: 'index.php?listVTTB_Chung&mod=vttbs&del_vttb_cat=1',
			data: dataString,
			success: function(data) {
				$('#vttb_content_main').fadeOut('fast').load('index.php?listVTTB_Chung&mod=vttbs').fadeIn("fast");
			}
		});
	}
	function delete_vttbsub(delStr){
		if(!confirm("THÔNG BÁO: \n\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
			return false;
		}	
				
		var dataString = "dlStr=" + delStr +"";
			//alert (dataString);
		$.ajax({
			type: "POST",
			url: 'index.php?listVTTB_Chung&mod=vttbs&del_vttb_sub=1',
			data: dataString,
			success: function(data) {
				$('#vttb_content_main').fadeOut('fast').load('index.php?listVTTB_Chung&mod=vttbs').fadeIn("fast");
			}
		});
	}
	
	function show_list_vttb_options(count,total){
		for(i=1;i<=total;i++){
			if(i==count){
				if(document.getElementById('extra_vttb_'+i).style.display=='none')
					document.getElementById('extra_vttb_'+i).style.display='block';
				else
					document.getElementById('extra_vttb_'+i).style.display='none';
			}
			else
				document.getElementById('extra_vttb_'+i).style.display='none';
		}
	}
	
	function delete_vttb(delStr,vttb_sub_id){
		if(!confirm("THÔNG BÁO: \n\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
			return false;
		}	
				
		var dataString = "dlStr=" + delStr +"";
			//alert (dataString);
		$.ajax({
			type: "POST",
			url: 'index.php?listVTTB_Chung&mod=vttbs&del_vttb=1',
			data: dataString,
			success: function(data) {
				$('#vttb_content_main').fadeOut('fast').load('index.php?listVTTB_Chung&mod=vttbs&vttb_sub_id='+vttb_sub_id).fadeIn("fast");
			}
		});
	}
	
	function show_list_vttb(vttb_sub_id,vars_arg){
		$('#vttb_content_main').load('index.php?listVTTB_Chung&mod=vttbs'+vars_arg+'&vttb_sub_id='+vttb_sub_id).fadeIn("fast");
	}
	
	function search_me_Vttb(vttb_sub_id){
		var keyword 			= document.getElementById('keyword').value;
		if (keyword == ""){
			return false;
		}
		
		$.post('?listVTTB_Chung&mod=vttbs&vttb_sub_id='+vttb_sub_id,
			{keyword:keyword},
			function(data){
				$('#vttb_content_main').html(data);
				$("#vttb_content_main").show();
			}
		);
	}
	
	function loc_vttb_cat(){
		var vttb_cat_name_fs = document.getElementById('vttb_cat_name_fs').value;		
		$.post('?listVTTB_Chung&mod=vttbs',
			{vttb_cat_name_fs:vttb_cat_name_fs},
			function(data){
				$('#vttb_content_main').html(data);
				$("#vttb_content_main").show();
			}
		);
	}
	
	function show_vttb_info(vttb_id, vttb_sub_id){
		$('#div_vttb_info').css({'display':'block','z-index':'2010'});
		$('#div_vttb_info_cont').load('index.php?viewVTTB&mod=vttbs&vttb_id='+vttb_id+'&vttb_sub_id='+vttb_sub_id).fadeIn("fast");	
	}
		
	function show_a_e_vttbcat(){
		$('#a_e_vttbcat').css({'display':'block','z-index':'2010'});
		$('#list_a_e_vttbcat_cont').load('index.php?addEditVTTBCat&mod=vttbs').fadeIn("fast");	
	}
	
	function show_a_e_vttbsub(vttb_cat_id){
		$('#a_e_vttbsub').css({'display':'block','z-index':'2010'});
		$('#list_a_e_vttbsub_cont').load('index.php?addEditVTTBSub&mod=vttbs&vttb_cat_id='+vttb_cat_id).fadeIn("fast");	
	}
	
	function show_edit_vttbcat(vttb_cat_id){
		$('#a_e_vttbcat').css({'display':'block','z-index':'2010'});
		$('#list_a_e_vttbcat_cont').load('index.php?addEditVTTBCat&mod=vttbs&edit_me=1&vttb_cat_id='+vttb_cat_id).fadeIn("fast");	
	}
	
	function show_edit_vttbsub(vttb_cat_id,vttb_sub_id){
		$('#a_e_vttbsub').css({'display':'block','z-index':'2010'});
		$('#list_a_e_vttbsub_cont').load('index.php?addEditVTTBSub&mod=vttbs&edit_me=1&vttb_cat_id='+vttb_cat_id+'&vttb_sub_id='+vttb_sub_id).fadeIn("fast");	
	}
	
	function show_add_vttb_form(vttb_sub_id){
		if(typeof vttb_sub_id == 'undefined'){ 
			alert('Bạn cần chọn danh mục trước khi thêm bản ghi'); 
			return false;
		}
		$('#a_e_vttb').css({'display':'block','z-index':'2010'});
		$('#list_a_e_vttb_cont').load('index.php?addEditVTTB&mod=vttbs&vttb_sub_id='+vttb_sub_id).fadeIn("fast");	
	}
	
	function show_edit_vttb_form(vttb_id,vttb_sub_id){
		$('#a_e_vttb').css({'display':'block','z-index':'2010'});
		$('#list_a_e_vttb_cont').load('index.php?addEditVTTB&mod=vttbs&edit_me=1&vttb_id='+vttb_id+'&vttb_sub_id='+vttb_sub_id).fadeIn("fast");	
	}
	
	function show_list_repare(vttb_id,vttb_sub_id){
		$('#list_repare').css({'display':'block','z-index':'2010'});
		$('#list_repare_cont').load('index.php?listRepare&mod=vttbs&vttb_id='+vttb_id+'&vttb_sub_id='+vttb_sub_id).fadeIn("fast");
	}
	
	function show_list_replace(vttb_id,vttb_sub_id){
		$('#list_replace').css({'display':'block','z-index':'2010'});
		$('#list_replace_cont').load('index.php?listReplace&mod=vttbs&vttb_id='+vttb_id+'&vttb_sub_id='+vttb_sub_id).fadeIn("fast");
	}
	
	function show_list_datlich(vttb_id,vttb_sub_id){
		$('#list_datlich').css({'display':'block','z-index':'2010'});
		$('#list_datlich_cont').load('index.php?listDatlich&mod=vttbs&vttb_id='+vttb_id+'&vttb_sub_id='+vttb_sub_id).fadeIn("fast");
	}
		
	$("#a_ref_Vttb_chung").click( function () { 
		$('#vttb_content_main').hide();
		$('#vttb_content_main').fadeOut('fast').load('index.php?listVTTB_Chung&mod=vttbs').fadeIn("fast");
	});
</script>
{/literal}