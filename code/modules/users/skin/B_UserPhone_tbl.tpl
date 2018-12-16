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
<div id="danhba_content_insign">
	<form method="post" name="frmList_User" action="?listUserPhone{$vars.arg}" id="frmList_User">
    <!------------------------------------PHONG BAN---------------------------------------------->
    <div style="float:left">
    <fieldset style="width:200px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:482px">
    <legend class="legend_list" style="width:120px">
        <div style="width:130px; float:left">Phòng/ban: {$total_depart}</div>
    </legend>
    	<div style="float:left; height:5px; width:100%"></div>
        <div style="float:left; height:455px; width:200px; overflow-y:scroll">
            {section name=di loop=$obj_list_department}
            <div style="float:left; line-height:30px">
            	<div style="float:left; width:20px; text-align:center">&diams;</div>
                <div style="float:left; width:152px">
                <a href="javascript:void(0);" onclick="javascript: show_list_phone({$obj_list_department[di]->department_id})" {if $department_id eq $obj_list_department[di]->department_id}} style="color:#F00" {/if}>{$obj_list_department[di]->department_name}</a>
                </div>
            </div>
            {/section}
        </div>
        <input type="hidden" id="curpage_User" name="curpage" value="{$vars.curpage}" />
    </fieldset>
    </div>
    <!------------------------------------DANH BA---------------------------------------------->
    <div style="float:left">
    <fieldset style="width:564px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:482px">
    <legend class="legend_list" style="width:150px">
        <div style="width:130px; float:left">Danh bạ: {$total_num_result}</div>
    </legend>
    	<div style="float:left; height:5px; width:100%"></div>
    	<div style="float:left; height:25px; width:547px; border-top:1px solid #99bbe8; border-bottom:1px solid #99bbe8 ">
            <div class="tbl_tit" style="width:30px; text-align:center"><b>STT</b></div>	
            <div class="tbl_tit" style="width:139px"><B>&nbsp;Họ tên</B></div>
            <div class="tbl_tit" style="width:134px"><B>&nbsp;Chức vụ</B></div>
            <div class="tbl_tit" style="width:80px"><B>&nbsp;Điện thoại</B></div>
            <div class="tbl_tit" style="width:159px"><B>&nbsp;Email</B></div>
        </div>
        <div style="float:left; height:428px; width:565px; overflow-y:scroll">
            {section name=ui loop=$obj_list}
            {if $smarty.section.ui.index is not div by 2} 
            {assign var="class_td" value="tbl_cont"} 
            {else}
            {assign var="class_td" value="tbl_cont2"} 
            {/if}
            {math z=$smarty.section.ui.index t=1 equation="z+t" assign=stt}
            <div class="{$class_td}" style="width:30px; text-align:center">{$stt}</div>
            <div class="{$class_td}" style="width:139px">
            	&nbsp;{$obj_list[ui]->user_fullname}
            </div>
            <div class="{$class_td}" style="width:134px">
                {section name=oi loop=$obj_list_object}
                	{if $obj_list_object[oi]->object_id eq $obj_list[ui]->object_id}
                	&nbsp;{$obj_list_object[oi]->object_name}
                	{/if}
                {/section}
            </div>
            <div class="{$class_td}" style="width:80px">
            	&nbsp;{$obj_list[ui]->user_phone}
            </div>
            <div class="{$class_td}" style="width:159px">
                &nbsp;{$obj_list[ui]->user_email}
            </div>
            {/section}
        </div>
    </fieldset>
    </div>
    </form>
</div>
{literal}
<script language="javascript">	
	
	function show_list_phone(department_id){
		$('#danhba_content_main').load('index.php?listUserPhone&mod=users&department_id='+department_id).fadeIn("fast");
	}
	
	
	function search_me_User(){
		var keyword 			= document.getElementById('keyword').value;
		var department_id_fs 	= document.getElementById('department_id_fs').value;
		var object_id_fs 		= document.getElementById('object_id_fs').value;
		if (keyword == "" && department_id_fs == 0 && department_id_fs == 0){
			return false;
		}
		
		$.post('?listUserPhone&mod=users',
			{keyword:keyword,department_id_fs:department_id_fs,object_id_fs:object_id_fs},
			function(data){
				$('#danhba_content_main').html(data);
				$("#danhba_content_main").show();
			}
		);
	}
	
	$("#a_ref_User").click( function () { 
			$('#danhba_content_main').hide();
			$('#danhba_content_main').fadeOut('fast').load('index.php?listUserPhone&mod=users').fadeIn("fast");
		});
</script>
{/literal}