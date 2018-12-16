<?php
/*-------------------------------------------
- PHP Frame work
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/
// ------------------------------
ini_set('display_errors',0);
require_once("../includes/ad_requires.php");
$query = mysql_query("SELECT doc_num FROM tbl_docs WHERE docLevel_id = '".(int)$_POST["docLevel_id"]."%' order by doc_num desc limit 1");
if($query){
    $row=mysql_fetch_array($query);
}
?>
<input type="text" id="doc_num" name="doc_num" class="text_tiny" value="<?php echo (int)($row['doc_num']+1)?>" tabindex="11"/>
