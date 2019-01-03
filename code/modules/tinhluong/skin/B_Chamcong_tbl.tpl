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
<div id="tinhluong_content_insign">
	<form method="post" name="frmList_Chamcong" action="?listChamcong{$vars.arg}" id="frmList_Chamcong">
    <!------------------------------------DANH SACH---------------------------------------------->
    <fieldset style="width:1162px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:382px">
        <legend class="legend_list_search" style="width: 1050px">
            <div style="float:left; width:5%; text-align:left">Tháng:</div>
            <div style="float:left; width:4%; text-align:left">
                <input type="text" name="cc_thang" id="cc_thang" class="text_month" value="{$smarty.now|date_format:"%m"}" onfocus="hide_message_Chamcong()" readonly="readonly"/>
            </div>
            <div style="float:left; width:4%; text-align:left">Năm:</div>
            <div style="float:left; width:5%; text-align:left">
                <input type="text" name="cc_nam" id="cc_nam" class="text_year" value="{$smarty.now|date_format:"%Y"}" onfocus="hide_message_Chamcong()" readonly="readonly"/>
            </div>
            <div style="float:left; width:12%">
				|&nbsp;&nbsp;&nbsp;
				<input type="button" name="luongNhanvien_btn" id="luongNhanvien_btn" value="Ghi lại" class="button_red" />
            </div>
			<div style="float:left; width:21%">
				|&nbsp;&nbsp;&nbsp;
				Tháng: <select name="in_luongthang" id="in_luongthang" class="select_tiny">
					<option value="0">Chọn</option>
					<option value="1">01</option>
					<option value="2">02</option>
					<option value="3">03</option>
					<option value="4">04</option>
					<option value="5">05</option>
					<option value="6">06</option>
					<option value="7">07</option>
					<option value="8">08</option>
					<option value="9">09</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
				</select>
				<input type="button" name="inBangluong_btn" id="inBangluong_btn" value="In bảng lương" class="button_red" />
			</div>
            <div style="float:left; width:45%; text-align:left">
                |&nbsp;&nbsp;&nbsp;
                Chú thích: 1: Cả ngày; 1/2: Nửa ngày; NCL: Nghỉ có lương; NKL: Nghỉ không lương
            </div>
        </legend>
    	<div style="float:left; height:5px; width:100%"></div>
        <div style="float:left; height:50px; width:1145px; border-top:1px solid #99bbe8; border-bottom:1px solid #99bbe8 ">
            <div class="tbl_tit" style="width:30px; text-align:center;font-size: 11px"><b>STT<br>&nbsp;</b></div>
            <div class="tbl_tit" style="width:152px;font-size: 11px"><B>&nbsp;Họ tên<br>&nbsp;</B></div>
            <div class="tbl_tit" style="width:61px;font-size: 11px"><B>&nbsp;Mã NV<br>&nbsp;</B></div>
            {php}
                $num_of_days=cal_days_in_month(CAL_GREGORIAN,date('m'),date('Y'));
                $dow = array(0 => 'CN',1 => 'T2',2 => 'T3',3 => 'T4',4 => 'T5',5 => 'T6', 6 => 'T7');
                for($i = 1; $i <= $num_of_days; $i++){
                    echo '<div class="tbl_tit" style="width:28px;font-size: 11px; text-align:center">';
                    echo '<B>&nbsp;N '.$i.'</B>';
                    $day = getdate(strtotime(date('Y-m-'.$i)));
                    for($j = 0; $j <= 6; $j ++){
                        if($day['wday'] == $j){
                            echo '<br>'.$dow[$j];
                        }
                    }
                    echo '</div>';
                }
            {/php}
        </div>
        <div style="float:left; height:303px; width:1162px; overflow-y:scroll">
            {section name=pi loop=$obj_list_user}
            {if $smarty.section.pi.index is not div by 2} 
            {assign var="class_td" value="tbl_cont"} 
            {else}
            {assign var="class_td" value="tbl_cont2"} 
            {/if}
            {math x=$vars.curpage-1 y=$vars.numresult z=$smarty.section.pi.index t=1 equation="x*y+z+t" assign=stt}
            <div class="{$class_td}" style="width:30px; text-align:center;font-size: 11px">
				{$stt}
				<input type="hidden" name="user_id[{$stt}]" id="user_id" value="{$obj_list_user[pi]->user_id}">
			</div>
            <div class="{$class_td}" style="width:152px; white-space:nowrap; font-size: 11px">&nbsp;{$obj_list_user[pi]->user_fullname}</div>
            <div class="{$class_td}" style="width:61px; white-space:nowrap; font-size: 11px">&nbsp;{$obj_list_user[pi]->user_name}</div>
            {php}
                for($i = 1; $i <= $num_of_days; $i++):
					$day = getdate(strtotime(date('Y-m-'.$i)));
                    $userID = $this->_tpl_vars['obj_list_user'][$this->_sections['pi']['index']]->user_id;
                    $sql = "select * from tbl_luong_chamcong where user_id = ".$userID." and cc_thang = ".date('m')." and cc_nam = ".date('Y');
                    $result = mysql_query($sql) or die($sql);
                    if($result):
                    $row = mysql_fetch_array($result);
                    //rsprint($row);
			{/php}
                <div class="{$class_td}" style="width:28px;font-size: 11px">
                    <select name="ngaycong[{$stt}][{php}echo $i;{/php}]" id="ngaycong" style="font-size: 11px" class="select_nano">
                        <option value="1" {php}if($row['cc_'.$i] == 1):{/php}selected="selected"{php}endif;{/php}>1</option>
                        <option value="2" {php}if($row['cc_'.$i] == 2):{/php}selected="selected"{php}endif;{/php}>1/2</option>
                        <option value="3" {php}if($row['cc_'.$i] == 3):{/php}selected="selected"{php}endif;{/php}>NCL</option>
                        <option value="4" {php}if($row['cc_'.$i] == 4):{/php}selected="selected"{php}endif;{/php}>NKL</option>
                        <option value="5" {php}if($row['cc_'.$i] == 5):{/php}selected="selected"{php}endif;{/php}>WK</option>
                    </select>
                </div>
            {php}else:{/php}
				<div class="{$class_td}" style="width:28px;font-size: 11px">
					{php} if($day['wday'] == 6):{/php}
					<select name="ngaycong[{$stt}][{php}echo $i;{/php}]" id="ngaycong" style="font-size: 11px" class="select_nano">
						<option value="1" {if $thubay eq 0}selected="selected"{/if}>1</option>
						<option value="2" {if $thubay eq 1}selected="selected"{/if}>1/2</option>
						{if $thubay neq 2}
							<option value="3">NCL</option>
							<option value="4">NKL</option>
						{/if}
						<option value="5" {if $thubay eq 2}selected="selected"{/if}>WK</option>
					</select>
					{php} elseif($day['wday'] == 0):{/php}
					<select name="ngaycong[{$stt}][{php}echo $i;{/php}]" id="ngaycong" style="font-size: 11px" class="select_nano">
						<option value="1" {if $chunhat eq 0}selected="selected"{/if}>1</option>
						<option value="2" {if $chunhat eq 1}selected="selected"{/if}>1/2</option>
						{if $chunhat neq 2}
							<option value="3">NCL</option>
							<option value="4">NKL</option>
						{/if}
						<option value="5" {if $thubay eq 2}selected="selected"{/if}>WK</option>
					</select>
					{php}else:{/php}
					<select name="ngaycong[{$stt}][{php}echo $i;{/php}]" id="ngaycong" style="font-size: 11px" class="select_nano">
						<option value="1">1</option>
						<option value="2">1/2</option>
						<option value="3">NCL</option>
						<option value="4">NKL</option>
                	</select>
					{php}endif;{/php}
				</div>
			{php}
                endif;
				endfor;
			{/php}
            {/section}
        </div>
		{literal}
			<script language="javascript">
				$(function() {
					$("#luongNhanvien_btn").click(function() {
						$('.error').hide();

						var $form = $("#frmList_Chamcong");
						var strData = $("#frmList_Chamcong").serialize();
						$.ajax({
							type: "POST",
							url: "index.php?listChamcong&mod=tinhluong&act=1",
							data: strData,
							success: function(data) {
								$('#div_thanhcong').css({'display':'block','z-index':'2010'})
								tat_thongbao();diemnguoc(2);
							}
						});
						return false;
						//end form
					});

                    $("#inBangluong_btn").click(function() {
                        $('.error').hide();

                        var $form = $("#frmList_Chamcong");
                        var thangluong = $form.find('select#in_luongthang :selected').val();
                        document.getElementById('report_tinhluong').style.display='block';
                        $("#report_tinhluong_cont").load("?InBangluong&mod=tinhluong&thangluong="+thangluong);
                    });
				});
			</script>
		{/literal}
    </fieldset>
    </form>
</div>