<?php
    ini_set('display_errors',0);
	require_once("../includes/ad_requires.php");

	if($_GET['add_edit']==1){
		$plan_subject 	= validHTML(str_replace('&','',$_POST['plan_subject']));
		$plan_cont 		= validHTML(str_replace('&','',$_POST['plan_cont']));
		$user_id 		= $_POST['user_id'];

        $plan_address 	= $_POST['plan_address'];
        $plan_chairman 	= $_POST['plan_chairman'];
        $plan_prepare 	= $_POST['plan_prepare'];
		
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
		
		$user_id = $user_id;
		$plan_date = date('Y-m-d');
		
		$sql="insert into tbl_plan_details(plan_subject,plan_cont,plan_address,plan_chairman,plan_prepare,plan_start,plan_end,plan_date,user_id) ";
		$sql.="values('".$plan_subject."','".$plan_cont."','".$plan_address."','".$plan_chairman."','".$plan_prepare."','".$plan_start."','".$plan_end."','".$plan_date."',".$user_id.")";
		mysql_query($sql) or die(mysql_error().' SQL: '.$sql);
	}
	
	// --- lua chon nguoi duoc dat lich
	if($_GET['bld']==1):
        $user_id = 0;
	else:
		$user_id = $_SESSION['user_id'];
	endif;
?>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css">
	//label, input.text, select { display:block; }
	fieldset { padding:0; border:1px solid #99bbe8; margin-top:1px; }
	legend { border:1px solid #99bbe8; line-height:20px; margin-left:20px; }
	.ui-dialog .ui-state-error { padding: .3em; }
	.validateTips { border: 1px solid transparent; padding: 0.3em; }
</style>
<div id="add-event-form" title="Tạo lịch" style="background-color:#dfe8f6">
	<form name="plan_fr" id="plan_fr" action="" method="post">
		<table style="width:100%; padding:5px;">
			<tr>
            	<td width="100%" align="left" colspan="5">
					<label for="name">Nội dung <font color="#FF0000">*</font>:</label>
                    <textarea name="plan_subject" class="text_area" id="plan_subject" style="width:98%; height:60px" spellcheck="false"></textarea>
				</td>
            </tr>
            <tr>
				<td width="40%" align="left">
					<label>Ngày bắt đầu</label>
					<input type="text" name="startDate" id="startDate" value="<?php echo date('d/m/Y',strtotime($_GET['start_date']))?>" class="text_middle" style="margin-bottom:8px; width:60%;" disabled="disabled"/>
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
					<select name="startHour" id="startHour" class="select_tiny" style="margin-bottom:8px; width:95%;">
						<option value="12" SELECTED>12</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
					</select>				
				</td>
				<td width="15%" align="left">
					<label>Phút</label>
					<select name="startMin" id="startMin" class="select_tiny" style="margin-bottom:8px; width:95%;">
						<option value="00" SELECTED>00</option>
						<option value="10">10</option>
						<option value="20">20</option>
						<option value="30">30</option>
						<option value="40">40</option>
						<option value="50">50</option>
					</select>				
				</td>
				<td width="20%" align="left">
					<label>Sáng/chiều</label>
					<select name="startMeridiem" id="startMeridiem" class="select_tiny" style="margin-bottom:8px; width:95%;">
						<option value="AM" SELECTED>Sáng</option>
						<option value="PM">Chiều</option>
					</select>				
				</td>
			</tr>
			<tr>
				<td align="left">
					<label>Ngày kết thúc</label>
					<input type="text" name="endDate" id="endDate" class="text_middle" value="<?php echo date('d/m/Y',strtotime($_GET['end_date']))?>" style="margin-bottom:8px; width:60%;" disabled="disabled"/>
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
					<select name="endHour" id="endHour" class="select_tiny" style="margin-bottom:8px; width:95%;">
						<option value="12" SELECTED>12</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
					</select>				
				</td>
				<td align="left">
					<label>Phút</label>
					<select name="endMin" id="endMin" class="select_tiny" style="margin-bottom:8px; width:95%;">
						<option value="00" SELECTED>00</option>
						<option value="10">10</option>
						<option value="20">20</option>
						<option value="30">30</option>
						<option value="40">40</option>
						<option value="50">50</option>
					</select>				
				</td>
				<td align="left">
					<label>Sáng/chiều</label>
					<select name="endMeridiem" id="endMeridiem" class="select_tiny" style="margin-bottom:8px; width:95%;">
						<option value="AM" SELECTED>Sáng</option>
						<option value="PM">Chiều</option>
					</select>				
				</td>				
			</tr>
            <tr>
                <td width="100%" align="left" colspan="5">
                    <label for="name">Địa điểm <font color="#FF0000">*</font>:</label>
                    <input type="text" class="text_middle" name="plan_address" id="plan_address" style="margin-bottom:8px; width:98%;"/>
                </td>
            </tr>
            <tr>
                <td width="100%" align="left" colspan="5">
                    <label for="name">Chủ trì:</label>
                    <input type="text" class="text_middle" name="plan_chairman" id="plan_chairman" style="margin-bottom:8px; width:98%;"/>
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
                    <input type="text" class="text_middle" name="plan_prepare" id="plan_prepare" style="margin-bottom:8px; width:98%;"/>
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
					<textarea name="plan_cont" class="text_area" id="plan_cont" style="width:98%; height:60px" spellcheck="false"></textarea>
				</td>
            </tr>	
            <tr>
            	<td width="100%" align="left" colspan="5">
                	<input type="button" name="btnSub_Plan" id="btnSub_Plan" value="Ghi lại" class="button" />
                    <input type="hidden" name="user_id" id="user_id" value="<?php echo $user_id;?>" />
                    <input type="reset" name="Reset" value="Hủy bỏ" class="button" onclick="javascript: window.parent.document.getElementById('add_edit_plan').style.display='none';" />
					<script language="javascript">
                        $(function() {
                        	$("#btnSub_Plan").click(function() {
                            var $form = $("#plan_fr");
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
                            
							//begin validate form
                            if (plan_subject == "" || plan_address == ""){
                                alert('(*) là các mục bắt buộc!');return false;
                            }
                            else{
                                var dataString  = "plan_subject=" + plan_subject.replace(/&/g,'');
                                    dataString += "&plan_address=" + plan_address;
                                    dataString += "&plan_chairman=" + plan_chairman;
                                    dataString += "&plan_prepare=" + plan_prepare;
                                    dataString += "&plan_cont=" + plan_cont.replace(/&/g,'');
									dataString += "&startDate=" + startDate;
                                    dataString += "&startHour=" + startHour;
									dataString += "&startMin=" + startMin ;
                                    dataString += "&startMin=" + startMin ;
                                    dataString += "&startMeridiem=" + startMeridiem ;
                                    dataString += "&endDate=" + endDate;
									dataString += "&endHour=" + endHour ;
                                    dataString += "&endMin=" + endMin ;
                                    dataString += "&endMeridiem=" + endMeridiem ;
									dataString += "&user_id=" + user_id ;
									
                                    //alert (dataString);return false;
                                $.ajax({
                                    type: "POST",
                                    url: "<?php echo $http_root?>calendar/json_add.php?add_edit=1",
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