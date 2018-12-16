<?php
    ini_set('display_errors',0);
	require_once("../includes/ad_requires.php");
	
	if($_GET['bld']==1):
		if($_GET['user_ld']==''): 
			$sql="select * from tbl_plan_details where user_id in(select user_id from tbl_users where user_level = 4)";
		else:
			$sql="select * from tbl_plan_details where user_id = ".$_GET['user_ld'];
		endif;
	else:
		$sql="select * from tbl_plan_details where user_id = ".$_SESSION['user_id'];
	endif;
	$result = mysql_query($sql) or die(mysql_error().' - '.$sql);
	if($result):
		$i=0;
		while($row = mysql_fetch_array($result)){
			?>
            <input type="hidden" name="str_can_<?php echo $i?>" id="str_can_<?php echo $i?>" value="<?php echo fnsSubstr($row['plan_subject'],15,0)?>">
			<?php
		$i++;
		}
	endif;
	
	// --- lua chon nguoi duoc dat lich
	if($_GET['bld']==1):
		if($_GET['user_ld']==''): 
			$sql_user="select user_id from tbl_users where user_level = 4";
		else:
			$sql_user="select user_id from tbl_users where user_id = ".$_GET['user_ld'];
		endif;
		$result_user = mysql_query($sql_user) or die(mysql_error().' - '.$sql_user);
		if($result_user):
			$row_user = mysql_fetch_array($result_user);
			$user_id = $row_user['user_id'];
		endif;
	else:
		$user_id = $_SESSION['user_id'];
	endif;
?>
<input type="hidden" name="http_root" id="http_root" value="<?php echo $http_root ?>">
<input type="hidden" name="bld" id="bld" value="<?php echo $_GET['bld']?>">
<input type="hidden" name="user_ld" id="user_ld" value="<?php echo $user_id?>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel='stylesheet' href='cupertino/theme.css' />
<link href='fullcalendar/fullcalendar.css' rel='stylesheet' />
<link href='fullcalendar/fullcalendar.print.css' rel='stylesheet' media='print' />
<script src='jquery/jquery-1.9.1.min.js'></script>
<script src='jquery/jquery-ui-1.10.2.custom.min.js'></script>
<script src='fullcalendar/fullcalendar.min.js'></script>
<script>
	function show_calender_detail(obj){
		var http_root = document.getElementById('http_root').value;
		var bld = document.getElementById('bld').value;
		var user_ld = document.getElementById('user_ld').value;
		window.parent.$('#show_plan').css({'display':'block','z-index':'2010'});
		window.parent.$('#list_show_plan_cont').load(http_root+'calendar/json_events.php?bld='+bld+'&plan_id='+obj).fadeIn("fast");
		//calendar.fullCalendar('unselect');
	}

	$(document).ready(function() {
	
		var date = new Date();
		var d = date.getDate();
		var m = date.getMonth();
		var y = date.getFullYear();
		
		$('#calendar').fullCalendar({
			theme: true,
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},
			firstDay: 1,
			
			selectable: true,
			selectHelper: true,
			select: function(start, end, allDay) {
				var start_date = start.getDate()+'-'+(start.getMonth()+1)+'-'+start.getFullYear();
				var end_date = end.getDate()+'-'+(end.getMonth()+1)+'-'+end.getFullYear();
				<?php if($_SESSION['user_level']==2 || $_SESSION['user_level']==3 || $_GET['bld']!=1):?>
				window.parent.$('#add_edit_plan').css({'display':'block','z-index':'2010'});
				window.parent.$('#list_add_edit_plan_cont').load('<?php echo $http_root ?>calendar/json_add.php?bld=<?php echo $_GET['bld']?>&user_ld=<?php echo $_GET['user_ld']?>&start_date='+start_date+'&end_date='+end_date).fadeIn("fast");
				calendar.fullCalendar('unselect');
				<?php else:?>
				alert('Bạn không được cấp quyền để thao tác tại đây!');return false;
				<?php endif;?>
			},
			
			editable: true,
			events: [<?php 
				if($_GET['bld']==1):
					$sql="select * from tbl_plan_details where user_id = 0";
				else:
					$sql="select * from tbl_plan_details where user_id = ".$_SESSION['user_id'];
				endif;
				$result = mysql_query($sql) or die(mysql_error().' - '.$sql);
				if($result):
					$i = 0;
					while($row = mysql_fetch_array($result)){
						$str_ds = strtotime($row['plan_start']);
						$str_de = strtotime($row['plan_end']);
						?>
						{
							id: <?php echo $row['plan_id']?>,
							title: 'Có lịch',//document.getElementById('str_can_<?php echo $i?>').value,
							start: new Date(<?php echo date('Y',$str_ds)?>, <?php echo (date('m',$str_ds)-1)?>, <?php echo date('d',$str_ds)?>, <?php echo date('H',$str_ds)?>, <?php echo date('i',$str_ds)?>),
							end: new Date(<?php echo date('Y',$str_de)?>, <?php echo (date('m',$str_de)-1)?>, <?php echo date('d',$str_de)?>, <?php echo date('H',$str_de)?>, <?php echo date('i',$str_de)?>),
							allDay: false,
							url: '<?php echo $row['plan_id']?>'
						},
						<?php
						$i++;
					}
				endif;
			?>]
			,
			eventDrop: function(event, delta) {
				alert(event.title + ' was moved ' + delta + ' days\n' +
					'(should probably update your database)');
			},
			
			loading: function(bool) {
				if (bool) $('#loading').show();
				else $('#loading').hide();
			}
			
		});
		
	});

</script>
<style>
	body {
		text-align: center;
		font-size: 12px;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		}

	#calendar {
		width: 620px;
		}

</style>
<div id='calendar' style="float:left"></div>
<div id='calendar_add' style='display:none; position:absolute; margin:80px 120px; width:400px; height:300px; z-index:2000'></div>
<div id='calendar_edit' style='display:none; position:absolute; margin:80px 120px; width:400px; height:300px; z-index:2000'></div>
