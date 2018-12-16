<?php
    ini_set('display_errors',0);
	require_once("../includes/ad_requires.php");

	if($_GET['add_edit']==1){
        $plan_subject 	= validHTML(str_replace('&','',$_POST['plan_subject']));
        $plan_cont 		= validHTML(str_replace('&','',$_POST['plan_cont']));

        $plan_address 	= $_POST['plan_address'];
        $plan_chairman 	= $_POST['plan_chairman'];
        $plan_prepare 	= $_POST['plan_prepare'];

		$plan_id 		= $_POST['plan_id'];
		
		$startDate 		= $_POST['startDate'];
		$startHour 		= $_POST['startHour'];
		$startMin 		= $_POST['startMin'];
		$startMeridiem 	= $_POST['startMeridiem'];
		
		if($startMeridiem=='PM') $startHour+=12;
		$plan_start = date('Y-m-d H:i',strtotime(str_replace('/','-',$startDate).' '.$startHour.':'.$startMin));
		
		$endDate 		= $_POST['endDate'];
		$endHour 		= $_POST['endHour'];
		$endMin 		= $_POST['endMin'];
		$endMeridiem 	= $_POST['endMeridiem'];
		
		if($endMeridiem=='PM') $endHour+=12;
		$plan_end = date('Y-m-d H:i',strtotime(str_replace('/','-',$endDate).' '.$endHour.':'.$endMin));
		
		//$user_id = $_SESSION['user_id'];
		$plan_date = date('Y-m-d');
		
		$sql="update tbl_plan_details set plan_subject = '".$plan_subject."',plan_cont = '".$plan_cont."',plan_address = '".$plan_address."',plan_chairman = '".$plan_chairman."',plan_prepare = '".$plan_prepare."',plan_start = '".$plan_start."',plan_end = '".$plan_end."',plan_date = '".$plan_date."' where plan_id = ".$plan_id."";
		mysql_query($sql) or die(mysql_error().' SQL: '.$sql);
	}
	
	$sql_plan= "select * from tbl_plan_details where plan_id = ".$_GET['plan_id'];
	$result_plan = mysql_query($sql_plan) or die($sql_plan);
	if($result_plan):
		$row_plan = mysql_fetch_array($result_plan);
	endif;
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
		<table style="width:100%; padding:5px;">
			<tr>
            	<td width="100%" align="left" colspan="5">
					<label for="name">Nội dung <font color="#FF0000">*</font>:</label>
                    <textarea name="plan_subject" class="text_area" id="plan_subject" style="width:98%; height:60px" spellcheck="false"><?php echo $row_plan['plan_subject']?></textarea>
				</td>
            </tr>
            <tr>
				<td width="40%" align="left">
					<label>Ngày bắt đầu</label>
					<input type="text" class="text_middle" name="startDate" id="startDate" value="<?php echo date('d/m/Y',strtotime($row_plan['plan_start']))?>" style="margin-bottom:8px; width:60%;" disabled="disabled"/>
                    <img src="../images/admin/img.gif"  align="absmiddle" id="icon_startDate" style="cursor: pointer; border: 0" title="Chọn ngày trên lịch"/>
                    <script type="text/javascript">
                        Calendar.setup({
                            inputField   :   "startDate",
                            ifFormat     :   "%d/%m/%Y",
                            button       :   "icon_startDate",
                            align        :   "Br",  
                            timeFormat   :   "24",
                            showsTime    :   true,
                            singleClick  :   true
                        });
                    </script>			
				</td>
				<td width="10%" align="left">&nbsp;</td>
				<td width="15%" align="left">
					<label>Giờ</label>
					<select name="startHour" class="text_middle" id="startHour" style="margin-bottom:8px; width:95%;">
						<option value="12" <?php if(date('h',strtotime($row_plan['plan_start']))=='12'):?> selected="selected"<?php endif;?>>12</option>
						<option value="1" <?php if(date('h',strtotime($row_plan['plan_start']))=='01'):?> selected="selected"<?php endif;?>>1</option>
						<option value="2" <?php if(date('h',strtotime($row_plan['plan_start']))=='02'):?> selected="selected"<?php endif;?>>2</option>
						<option value="3" <?php if(date('h',strtotime($row_plan['plan_start']))=='03'):?> selected="selected"<?php endif;?>>3</option>
						<option value="4" <?php if(date('h',strtotime($row_plan['plan_start']))=='04'):?> selected="selected"<?php endif;?>>4</option>
						<option value="5" <?php if(date('h',strtotime($row_plan['plan_start']))=='05'):?> selected="selected"<?php endif;?>>5</option>
						<option value="6" <?php if(date('h',strtotime($row_plan['plan_start']))=='06'):?> selected="selected"<?php endif;?>>6</option>
						<option value="7" <?php if(date('h',strtotime($row_plan['plan_start']))=='07'):?> selected="selected"<?php endif;?>>7</option>
						<option value="8" <?php if(date('h',strtotime($row_plan['plan_start']))=='08'):?> selected="selected"<?php endif;?>>8</option>
						<option value="9" <?php if(date('h',strtotime($row_plan['plan_start']))=='09'):?> selected="selected"<?php endif;?>>9</option>
						<option value="10" <?php if(date('h',strtotime($row_plan['plan_start']))=='10'):?> selected="selected"<?php endif;?>>10</option>
						<option value="11" <?php if(date('h',strtotime($row_plan['plan_start']))=='11'):?> selected="selected"<?php endif;?>>11</option>
					</select>				
				</td>
				<td width="15%" align="left">
					<label>Phút</label>
					<select name="startMin" class="text_middle" id="startMin" style="margin-bottom:8px; width:95%;">
						<option value="00" <?php if(date('i',strtotime($row_plan['plan_start']))=='00'):?> selected="selected"<?php endif;?>>00</option>
						<option value="10" <?php if(date('i',strtotime($row_plan['plan_start']))=='10'):?> selected="selected"<?php endif;?>>10</option>
						<option value="20" <?php if(date('i',strtotime($row_plan['plan_start']))=='20'):?> selected="selected"<?php endif;?>>20</option>
						<option value="30" <?php if(date('i',strtotime($row_plan['plan_start']))=='30'):?> selected="selected"<?php endif;?>>30</option>
						<option value="40" <?php if(date('i',strtotime($row_plan['plan_start']))=='40'):?> selected="selected"<?php endif;?>>40</option>
						<option value="50" <?php if(date('i',strtotime($row_plan['plan_start']))=='50'):?> selected="selected"<?php endif;?>>50</option>
					</select>				
				</td>
				<td width="20%" align="left">
					<label>Sáng/chiều</label>
					<select name="startMeridiem" class="text_middle" id="startMeridiem"  style="margin-bottom:8px; width:95%;">
						<option value="AM" <?php if(date('H',strtotime($row_plan['plan_start']))<=12):?> selected="selected"<?php endif;?>>Sáng</option>
						<option value="PM" <?php if(date('H',strtotime($row_plan['plan_start']))>12):?> selected="selected"<?php endif;?>>Chiều</option>
					</select>				
				</td>
			</tr>
			<tr>
				<td align="left">
					<label>Ngày kết thúc</label>
					<input type="text" class="text_middle" name="endDate" id="endDate" value="<?php echo date('d/m/Y',strtotime($row_plan['plan_end']))?>" style="margin-bottom:8px; width:60%;" disabled="disabled"/>
                    <img src="../images/admin/img.gif"  align="absmiddle" id="icon_endDate" style="cursor: pointer; border: 0" title="Chọn ngày trên lịch"/>
                    <script type="text/javascript">
                        Calendar.setup({
                            inputField   :   "endDate",
                            ifFormat     :   "%d/%m/%Y",
                            button       :   "icon_endDate",
                            align        :   "Br",  
                            timeFormat   :   "24",
                            showsTime    :   true,
                            singleClick  :   true
                        });
                    </script>				
				</td align="left">
				<td>&nbsp;</td>
				<td align="left">
					<label>Giờ</label>
					<select name="endHour" class="text_middle" id="endHour" style="margin-bottom:8px; width:95%;">
						<option value="12" <?php if(date('h',strtotime($row_plan['plan_end']))=='12'):?> selected="selected"<?php endif;?>>12</option>
						<option value="1" <?php if(date('h',strtotime($row_plan['plan_end']))=='01'):?> selected="selected"<?php endif;?>>1</option>
						<option value="2" <?php if(date('h',strtotime($row_plan['plan_end']))=='02'):?> selected="selected"<?php endif;?>>2</option>
						<option value="3" <?php if(date('h',strtotime($row_plan['plan_end']))=='03'):?> selected="selected"<?php endif;?>>3</option>
						<option value="4" <?php if(date('h',strtotime($row_plan['plan_end']))=='04'):?> selected="selected"<?php endif;?>>4</option>
						<option value="5" <?php if(date('h',strtotime($row_plan['plan_end']))=='05'):?> selected="selected"<?php endif;?>>5</option>
						<option value="6" <?php if(date('h',strtotime($row_plan['plan_end']))=='06'):?> selected="selected"<?php endif;?>>6</option>
						<option value="7" <?php if(date('h',strtotime($row_plan['plan_end']))=='07'):?> selected="selected"<?php endif;?>>7</option>
						<option value="8" <?php if(date('h',strtotime($row_plan['plan_end']))=='08'):?> selected="selected"<?php endif;?>>8</option>
						<option value="9" <?php if(date('h',strtotime($row_plan['plan_end']))=='09'):?> selected="selected"<?php endif;?>>9</option>
						<option value="10" <?php if(date('h',strtotime($row_plan['plan_end']))=='10'):?> selected="selected"<?php endif;?>>10</option>
						<option value="11" <?php if(date('h',strtotime($row_plan['plan_end']))=='11'):?> selected="selected"<?php endif;?>>11</option>
					</select>				
				</td>
				<td align="left">
					<label>Phút</label>
					<select name="endMin" class="text_middle" id="endMin" style="margin-bottom:8px; width:95%;">
						<option value="00" <?php if(date('i',strtotime($row_plan['plan_end']))=='00'):?> selected="selected"<?php endif;?>>00</option>
						<option value="10" <?php if(date('i',strtotime($row_plan['plan_end']))=='10'):?> selected="selected"<?php endif;?>>10</option>
						<option value="20" <?php if(date('i',strtotime($row_plan['plan_end']))=='20'):?> selected="selected"<?php endif;?>>20</option>
						<option value="30" <?php if(date('i',strtotime($row_plan['plan_end']))=='30'):?> selected="selected"<?php endif;?>>30</option>
						<option value="40" <?php if(date('i',strtotime($row_plan['plan_end']))=='40'):?> selected="selected"<?php endif;?>>40</option>
						<option value="50" <?php if(date('i',strtotime($row_plan['plan_end']))=='50'):?> selected="selected"<?php endif;?>>50</option>
					</select>				
				</td>
				<td align="left">
					<label>Sáng/chiều</label>
					<select name="endMeridiem" class="text_middle" id="endMeridiem" style="margin-bottom:8px; width:95%;">
						<option value="AM"  <?php if(date('H',strtotime($row_plan['plan_end']))<=12):?> selected="selected"<?php endif;?>>Sáng</option>
						<option value="PM"  <?php if(date('H',strtotime($row_plan['plan_end']))>12):?> selected="selected"<?php endif;?>>Chiều</option>
					</select>				
				</td>				
			</tr>
            <tr>
                <td width="100%" align="left" colspan="5">
                    <label for="name">Địa điểm <font color="#FF0000">*</font>:</label>
                    <input type="text" class="text_middle" name="plan_address" id="plan_address" value="<?php echo $row_plan['plan_address']?>" style="margin-bottom:8px; width:98%;"/>
                </td>
            </tr>
            <tr>
                <td width="100%" align="left" colspan="5">
                    <label for="name">Chủ trì:</label>
                    <input type="text" class="text_middle" name="plan_chairman" id="plan_chairman" value="<?php echo $row_plan['plan_chairman']?>" style="margin-bottom:8px; width:98%;"/>
                    <script type="text/javascript">
                        $().ready(function() {
                            $("#plan_chairman").autocomplete("B_Lich_chutri.php", {
                                width: 160,
                                matchContains: true,
                                selectFirst: true
                            });
                        });
                    </script>
                </td>
            </tr>
            <tr>
                <td width="100%" align="left" colspan="5">
                    <label for="name">Chuẩn bị:</label>
                    <input type="text" class="text_middle" name="plan_prepare" id="plan_prepare" value="<?php echo $row_plan['plan_prepare']?>" style="margin-bottom:8px; width:98%;"/>
                    <script type="text/javascript">
                        $().ready(function() {
                            $("#plan_prepare").autocomplete("B_Lich_chutri.php", {
                                width: 160,
                                matchContains: true,
                                selectFirst: true
                            });
                        });
                    </script>
                </td>
            </tr>
            <tr>
            	<td width="100%" align="left" colspan="5">
					<label for="name">Thành phần:</label>
					<textarea name="plan_cont" id="plan_cont" class="text_area" style="width:98%; height:60px" spellcheck="false"><?php echo $row_plan['plan_cont']?></textarea>
				</td>
            </tr>	
            <tr>
            	<td width="100%" align="left" colspan="5">
                	<input type="button" name="btnSub_editPlan" id="btnSub_editPlan" value="Ghi lại" class="button" />
                    <input type="hidden" name="plan_id" id="plan_id" value="<?php echo $row_plan['plan_id']?>" />
                    <input type="reset" name="Reset" value="Hủy bỏ" class="button" onclick="javascript: window.parent.document.getElementById('add_edit_plan').style.display='none';" />
					<script language="javascript">
                        $(function() {
                        	$("#btnSub_editPlan").click(function() {
                             
                            var $form = $("#plan_edit_fr");
                            var plan_subject 	= $form.find('textarea#plan_subject').val();
                            var plan_address 	= $form.find('input#plan_address').val();
                            var plan_chairman 	= $form.find('input#plan_chairman').val();
                            var plan_prepare 	= $form.find('input#plan_prepare').val();
                            var plan_cont 		= $form.find('textarea#plan_cont').val();
                            var user_id 		= $form.find('input#user_id').val();

                            var startDate 		= $form.find('input#startDate').val();
                            var startHour 		= $form.find('select#startHour :selected').val();
                            var startMin 		= $form.find('select#startMin :selected').val();
                            var startMeridiem 	= $form.find('select#startMeridiem :selected').val();

                            var endDate 		= $form.find('input#endDate').val();
                            var endHour 		= $form.find('select#endHour :selected').val();
                            var endMin 			= $form.find('select#endMin :selected').val();
                            var endMeridiem 	= $form.find('select#endMeridiem :selected').val();
							
							var plan_id 		= $form.find('input#plan_id').val();
							
                            //begin validate form
                            if (plan_subject == ""){
                                alert('Bạn cần cho 1 vài thông tin');return false;
                            }
                            else{
                                var dataString  = "plan_subject=" + plan_subject.replace(/&/g,'');
                                    dataString += "&plan_address=" + plan_address;
                                    dataString += "&plan_chairman=" + plan_chairman;
                                    dataString += "&plan_prepare=" + plan_prepare;
                                    dataString += "&plan_cont=" + plan_cont.replace(/&/g,'');
									dataString += "&startDate=" + startDate;
                                    dataString += "&startHour=" + startHour;
									dataString += "&startMin=" + startMin;
                                    dataString += "&startMin=" + startMin;
                                    dataString += "&startMeridiem=" + startMeridiem;
                                    dataString += "&endDate=" + endDate;
									dataString += "&endHour=" + endHour;
                                    dataString += "&endMin=" + endMin;
                                    dataString += "&endMeridiem=" + endMeridiem;
									dataString += "&plan_id=" + plan_id;
									
                                    //alert (dataString);return false;
                                $.ajax({
                                    type: "POST",
                                    url: "<?php echo $http_root?>calendar/json_edit.php?add_edit=1",
                                    data: dataString,
                                    success: function(data) {
                                        $('#add_edit_plan').hide();
                                        $("#plan_content_main").fadeOut('fast').load("index.php?mainPlan&mod=plans&bld=<?php echo $_GET['bld']?>&user_ld=<?php echo $_GET['user_ld']?>").fadeIn('fast');
                                    }
                                });
                                return false;
                            }
                            //end form
                        });
                    });
                    </script>
                </td>
            </tr>		
		</table>
	</form>
</div>	