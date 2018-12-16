<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="left">
		<?php
		$where = "1 = 1 ";
        if($_GET['unit_id']!=0) $where .= " and unit_id = ".$_GET['unit_id'];
		if($_GET['unit_id']!=0):
        $query = mysql_query("SELECT user_fullname, user_id FROM tbl_users WHERE ".$where);
        while($row=mysql_fetch_array($query)) {
            echo "<div style='float:left; width:140px'><input type='checkbox' name='user_recevie' id='user_recevie' value='".$row['user_id']."' checked>&nbsp;".$row['user_fullname']."</div>";
        }
		endif;
        ?>
	</td>
  </tr>
</table>
