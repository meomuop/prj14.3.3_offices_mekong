<?php
/*-------------------------------------------
- PHP Frame work
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/
	// --- Check url is Error -- Access deny -----
	if (!isset($key)){
	// Error: no category chosen
	redirect("index.php");
	}
	
	// ------------------------------
	include ($CLASSES_PATH.'clsVttbDatlichs.php');
	include ($CLASSES_PATH.'clsVttbs.php');
	$vars = array_merge($_POST, $_GET);
	
	// --- Class is used in this page
	$obj = new vttb_datlich_class();
	
	$num_record = $obj->getCheckTime($vars['vttb_id'],date('Y-m-d h:i',strtotime(str_replace('/','-',$vars['vttb_datlich_start']))),date('Y-m-d h:i',strtotime(str_replace('/','-',$vars['vttb_datlich_end']))));
?>
<input type="hidden" name="check_datlich_txt" id="check_datlich_txt" value="<?php echo $num_record?>">