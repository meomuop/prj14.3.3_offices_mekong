<?php
/*-------------------------------------------
- PHP Frame work
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/
// ------------------------------
ini_set('display_errors',0);
require_once("../includes/ad_requires.php");

$doc_code = htmlspecialchars($_GET["doc_code"]);
$sql = "SELECT docFile_path FROM tbl_docfiles WHERE doc_id in
                (select doc_id from tbl_docs where doc_code = '".$doc_code."'
        ) limit 1";
//echo $sql;
$query = mysql_query($sql);
if($query){
    $row=mysql_fetch_array($query);
    echo '<input type="text" class="text_short" name="vanban_file" id="vanban_file" value="'.$row['docFile_path'].'" onfocus="hide_message_HdmuaLkvb();" tabindex="4" readonly="readonly" />';
}

