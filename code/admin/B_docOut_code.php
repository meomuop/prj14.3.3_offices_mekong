<?php
/*-------------------------------------------
- PHP Frame work
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/
// ------------------------------------------
ini_set('display_errors',0);
require_once("../includes/ad_requires.php");

$sql 		= "SELECT * FROM tbl_doccats WHERE docCat_id = ".$_GET["docCat_id"];
$result 	= mysql_query($sql) or die($sql);
$row		= mysql_fetch_array($result);

$sql1		= "SELECT * FROM tbl_departments WHERE department_id = ".$_GET["department_id"];
$result1 	= mysql_query($sql1) or die($sql1);
$row1		= mysql_fetch_array($result1);

if($row['docCat_viewdepart']==1 && $row['docCat_view']==1):
$docOut_code = $_GET["docOut_num"]."/".$row['docCat_standfor']."/".$obj_owner[0]->owner_url."-".$row1['department_standfor'];
elseif($row['docCat_viewdepart']==1 && ($row['docCat_view']==0 || $row['docCat_view']==2)):
$docOut_code = $_GET["docOut_num"]."/".$obj_owner[0]->owner_url."-".$row1['department_standfor'];
elseif(($row['docCat_viewdepart']==0 || $row['docCat_viewdepart']==2) && $row['docCat_view']==1):
$docOut_code = $_GET["docOut_num"]."/".$row['docCat_standfor']."-".$obj_owner[0]->owner_url."";
endif;
?>
<input type="text" id="docOut_code" name="docOut_code" class="text_middle" value="<?php echo $docOut_code;?>"/>