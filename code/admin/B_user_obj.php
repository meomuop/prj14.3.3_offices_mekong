<?php
/*-------------------------------------------
- PHP Frame work
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/
// ------------------------------
ini_set('display_errors',0);
require_once("../includes/ad_requires.php");
$query = mysql_query("SELECT object_name, object_id FROM tbl_objects WHERE object_id in(select object_id from tbl_users where user_id = ".$_GET["docOut_signed"]." )");
$row=mysql_fetch_array($query);
?>
<input type="text" value="<?php echo $row['object_name']?>" id="docOut_obj" name="docOut_obj" class="text_middle" tabindex="7" onfocus="hide_message_DocOut();" readonly="readonly"/>