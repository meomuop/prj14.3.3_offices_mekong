<?php
/*-------------------------------------------
- PHP Frame work
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/
// ------------------------------
ini_set('display_errors',0);
require_once("../includes/ad_requires.php");

$doc_code = htmlspecialchars($_GET["doc_code"]);
$sql = "SELECT docOutFile_path FROM tbl_docoutfiles WHERE docOut_id in
                (select docOut_id from tbl_docouts where docOut_code = '".$doc_code."'
        ) limit 1";
//echo $sql;
$query = mysql_query($sql);
if($query){
    $row=mysql_fetch_array($query);
    echo '<input type="text" class="text_short" name="vanban_file" id="vanban_file" value="'.$row['docOutFile_path'].'" onfocus="hide_message_HdmuaLkvb();" tabindex="4" readonly="readonly" />';
}

