<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="left">
		<?php
        $link = mysql_connect('localhost', 'root', '');
        mysql_select_db("quanlyvanban_db");
        mysql_query("SET CHARACTER SET 'utf8'", $link);
        if($_GET['country_id']!=0):
        $query = mysql_query("SELECT user_fullname, user_id FROM tbl_users WHERE unit_id = ".$_GET['country_id']."");
        while($row=mysql_fetch_array($query)) {
            echo "<div style='float:left; width:270px'><input type='checkbox' name='user_recevie[]' value='".$row['user_id']."'>".$row['user_fullname']."</div>";
        }
		endif;
        ?>
	</td>
  </tr>
</table>
