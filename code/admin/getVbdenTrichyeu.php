<?php
/*-------------------------------------------
- PHP Frame work
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/
// ------------------------------
ini_set('display_errors',0);
require_once("../includes/ad_requires.php");

$doc_code = htmlspecialchars($_GET["doc_code"]);
$sql = "select doc_desc from tbl_docs where doc_code = '".$doc_code."'";
//echo $sql;
$query = mysql_query($sql);
if($query){
    $row=mysql_fetch_array($query);
    echo '<textarea spellcheck="false" name="vanban_trichyeu" id="vanban_trichyeu" cols="30" rows="5" class="text_area_small" onfocus="hide_message_Hdmua()" style="width:406px" tabindex="3" readonly="readonly">'.$row['doc_desc'].'</textarea>';
}

