<?php
    ini_set('display_errors',0);
	require_once("../includes/ad_requires.php");

	$sql_plan= "select * from tbl_plan_details where plan_id = ".$_GET['plan_id'];
	$result_plan = mysql_query($sql_plan) or die($sql_plan);
	if($result_plan):
		$row_plan = mysql_fetch_array($result_plan);
	endif;
	
	if($_GET['bld']!="")$bld = $_GET['bld'];else $bld = 0;
	if($_GET['user_ld']!="")$user_ld = $_GET['user_ld'];else $user_ld = 0;
?>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css">
	//label, input.text, select { display:block; }
	fieldset { padding:0; border:1px solid #99bbe8; margin-top:1px; }
	legend { border:1px solid #99bbe8; line-height:20p; margin-left:20px; }
	.ui-dialog .ui-state-error { padding: .3em; }
	.validateTips { border: 1px solid transparent; padding: 0.3em; }
</style>
<div id="add-event-form" title="Tạo lịch" style="background-color:#dfe8f6">
	<form name="plan_edit_fr" id="plan_edit_fr" action="" method="post">
		<table style="width:100%; padding:5px;; line-height:20px">
            <tr>
                <td align="left" colspan="5">
                    - Nội dung:
                </td>
            </tr>
            <tr>
                <td align="left" colspan="5" valign="top">
                    <div style="float:left; width: 390px; height: 70px; overflow-y:scroll ">
                    <b><?php echo $row_plan['plan_subject']?></b>
                    </div>
                </td>
            </tr>
            <tr>
				<td align="left" colspan="5">
					- Bắt đầu ngày&nbsp;<?php echo date('d/m/Y',strtotime($row_plan['plan_start']))?>;
                    vào lúc: <?php echo date('h',strtotime($row_plan['plan_start']))?>h
                    <?php echo date('i',strtotime($row_plan['plan_start']))?>' 
                    <?php if(date('H',strtotime($row_plan['plan_start']))<=12):?> Sáng<?php endif;?>
					<?php if(date('H',strtotime($row_plan['plan_start']))>12):?> Chiều<?php endif;?>
				</td>
			</tr>
			<tr>
				<td align="left" colspan="5">
					- Kết thúc ngày&nbsp;<?php echo date('d/m/Y',strtotime($row_plan['plan_end']))?>;
                    vào lúc <?php echo date('h',strtotime($row_plan['plan_end']))?>h
                    <?php echo date('i',strtotime($row_plan['plan_end']))?>'
                    <?php if(date('H',strtotime($row_plan['plan_end']))<=12):?> Sáng<?php endif;?>
                    <?php if(date('H',strtotime($row_plan['plan_end']))>12):?> Chiều<?php endif;?>
				</td>
			</tr>
            <tr>
                <td align="left" colspan="5">
                    - Địa điểm:&nbsp;<?php echo $row_plan['plan_address']?>
                </td>
            </tr>
            <tr>
                <td align="left" colspan="5">
                    - Chủ trì:&nbsp;<?php echo $row_plan['plan_chairman']?>
                </td>
            </tr>
            <tr>
                <td align="left" colspan="5">
                    - Chuẩn bị:&nbsp;<?php echo $row_plan['plan_prepare']?>
                </td>
            </tr>
            <tr>
            	<td align="left" colspan="5">
					- Thành phần:
				</td>
            </tr>
            <tr>
            	<td align="left" colspan="5" valign="top">
                    <div style="float:left; width: 390px; height: 70px; overflow-y:scroll "><?php echo $row_plan['plan_cont']?></div>
				</td>
            </tr>	
            <tr>
            	<td align="left" colspan="5">
                	<input type="button" name="Plan_sua" id="Plan_sua" value="Sửa" class="button_small" onclick="javascript: show_calender_edit(<?php echo $row_plan['plan_id']?>,<?php echo $bld?>,<?php echo $user_ld?>);"/>
                    <input type="button" name="Plan_xoa" id="Plan_xoa" value="Xóa" class="button_small" onclick="javascript: delete_plan(<?php echo $row_plan['plan_id']?>,<?php echo $bld?>,<?php echo $user_ld?>);"/>
                    <input type="hidden" name="plan_id" id="plan_id" value="<?php echo $row_plan['plan_id']?>" />
                    <input type="button" name="Plan_dong" value="Đóng" class="button_small" onclick="javascript: window.parent.document.getElementById('show_plan').style.display='none';" />
                </td>
            </tr>		
		</table>
	</form>
</div>	