{literal}
<script type="text/javascript">
function init ( )
{
  timeDisplay = document.createTextNode ( "" );
  document.getElementById("clock_txt").value ( timeDisplay );
}

function updateClock ( )
{
  var currentTime = new Date();
  var currentHours = currentTime.getHours();
  var currentMinutes = currentTime.getMinutes();
  var currentSeconds = currentTime.getSeconds();

  currentMinutes = ( currentMinutes < 10 ? "0" : "" ) + currentMinutes;
  currentSeconds = ( currentSeconds < 10 ? "0" : "" ) + currentSeconds;

  var timeOfDay = ( currentHours < 12 ) ? "AM" : "PM";

  currentHours = ( currentHours > 12 ) ? currentHours - 12 : currentHours;
  currentHours = ( currentHours == 0 ) ? 12 : currentHours;

  var currentTimeString = currentHours + ":" + currentMinutes + ":" + currentSeconds + " " + timeOfDay;

  document.getElementById("clock_txt").value = currentTimeString;

  if(currentTime.getHours()==23 && currentTime.getMinutes()==59 & currentTime.getSeconds()==59){
	  $('#div_backup_info').load('auto_backup/backup_dbs.php');
  }

}

updateClock(); setInterval('updateClock()', 1000 )
</script>
{/literal}
<div id='loadingTable' style="display:none; text-align:center; font-size: 16px; color:#006699; font-weight:bold;">
<img src="../images/admin/loadingAnimation.gif" /><br />
<label style="padding-top: 10px; ">Đang tải dữ liệu. Xin chờ trong giây lát...</label>
</div>
<div id='listTable'>
	<div style="float:left">
  	<fieldset style="width:292px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
    <legend class="legend">Sao lưu tự động</legend>
    	<div style="float:left; width:272px; height:60px; margin-left:10px; margin-top:10px">
        	<div style="float:left; width:280px; line-height: 20px">- Tự động sao lưu vào 23h:59' hàng ngày</div>
            <div style="float:left; width:280px; line-height: 20px">- Hiện tại: <input class="text_short" type="text" name="clock_txt" id="clock_txt" value="" style="border:none; background-color:transparent; font-size:12px" readonly></div>
            <div style="float:left; width:280px; line-height: 20px" id="div_backup_info"></div>
        </div>
    </fieldset>
    
    <fieldset style="width:292px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
    <legend class="legend" style="width:200px">
        Sao lưu và khôi phục thông thường
    </legend>
    	<div style="float:left; width:282px; height:315px">
        	<iframe id="saoluu" src="{$http_root}admin/saoluu.php" style="border:none; width: 280px; height:335px"></iframe>
        </div>
    </fieldset>
    </div>
    <div style="float:left">
    <fieldset style="width:248px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
    <legend class="legend" style="width:150px">
        Thiết lập hệ thống mới
    </legend>
    	<div style="float:left; width:248px; height:413px">
        	<iframe id="saoluu" src="index.php?sysreset&khoiphuc=2" style="border:none; background-color:transparent; width: 248px; height:413px; padding: 0 0 0 0"></iframe>
        </div>
    </fieldset>
    </div>
</div>