<html>
<title>Upload</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style>
fieldset
{
	background: #EEEEEE;
}

legend
{
	font-weight: bold;
}
.center
{
	text-align: center;
	margin-top: 4px;
}
</style>
</head>


<script language="javascript">
<!--
function GetFileExtension(Filename) {
  var I = Filename.lastIndexOf(".");
  return (I > -1) ? Filename.substring(I + 1, Filename.length).toLowerCase() : "";
}
function checkValid(str)
{
    var Ext = "";
	if (str != "") {
    Ext = GetFileExtension(str);
    if (Ext != "jpg" && Ext != "jpeg" && Ext != "gif" && Ext != "bmp" && Ext != "png")
	 { return false; }
  }
  return true;
}
function BeforeSubmit() {
  var Form = document.MyForm;
  var imgFile = Form.imgFile.value;
  if (imgFile == "")
   { alert("Please choose image to Upload"); return false; }

  if (!checkValid(imgFile)) 
  {  
	 alert("Format of image must be:\njpg, jpeg, gif, bmp, png");
	 return false;
  }
  return true;
}
//-->
</script>
<?php
ini_set('display_errors',0);
$vars = array_merge($_POST,$_GET);
$idImage = $vars["id"];
$idThumbImage = $vars["thumbid"];
if ($idImage=="" || $idThumbImage=="") exit();

if (!is_dir("../images")){
	mkdir("../images", 775);
}

$dirUpload = "";;
if ($_GET['dir']){
	if (!is_dir("../images/".$_GET['dir'])){
		mkdir("../images/".$_GET['dir'], 775);
	}

	if (!is_dir("../images/".$_GET['dir']."/thumb_images")){
		mkdir("../images/".$_GET['dir']."/thumb_images", 775);
	}

	if (!is_dir("../images/".$_GET['dir']."/large_images")){
		mkdir("../images/".$_GET['dir']."/large_images", 775);
	}

	$dirUpload = $_GET['dir']."/large_images/";
	$dirThumb = $_GET['dir']."/thumb_images/";
}

?>
<script>
var msg = "";
var file_name="";
<?php
if ($vars["act"]=="upload")
{
	$imgName = "imgFile";
	$filename = "".$_FILES[$imgName]["name"];
	$temp=$_FILES[$imgName]["tmp_name"];
	
	// max size of file name in windows is 211 character
	if(strlen($filename) > 197){
		$filename = substr($filename, strlen($filename)-197);
	}
	
	$prefilename = time()."_";

  	$fullfilename = $prefilename.$filename;

	$fullfilename = str_replace(" ","_",$fullfilename);

  	$filepath = "../images/".$dirUpload."".$fullfilename;
  	$thumbfilepath = "../images/".$dirThumb."".$fullfilename;
  	$filename2DB = "images/".$dirUpload."".$fullfilename;
  	$fileThumb2DB = "images/".$dirThumb."".$fullfilename;
	$filepath1 = $fullfilename;
  	// copy file from temp directory to img directory
  	if (@copy($temp, $filepath))
	{
		$detail = image_get_info($filepath);
		$width = 200;
		$height = $detail['height']*200/$detail['width'];		
		image_gd_resize($filepath, $thumbfilepath, $width, $height);
?>
	msg = "File <?php echo $filename?> has been uploaded.\n";
	file_name = "<?php echo $filepath1?>";
	file2DB = "<?php echo $filename2DB?>";
	fileThumb2DB = "<?php echo $fileThumb2DB?>";
<?php
}
}
?>

if (msg != ""){
	msg = "UPLOAD SUCCESS!! \n------------------------\n" + msg;
	choice = alert(msg);
	window.opener.document.getElementById("<?php echo $idImage; ?>").value = file2DB;
	//window.opener.document.getElementById("<?php echo $idThumbImage; ?>").value = fileThumb2DB;
	window.close();
}
</script>
<body>
<fieldset><legend><font face="Verdana, Arial, Helvetica, sans-serif">Upload</font></legend>
	<form onSubmit="return BeforeSubmit()" method="post" enctype="multipart/form-data" name="MyForm">
	<div class="center">
	    <input type="file" name="imgFile" size="40" />
		 <input type="hidden" name="act"  value="upload"/>
		 <input type="hidden" name="id"  value="<?=$idImage?>"/>
	    <br><br>
  	    <input type="submit" name="cmdUpload" value="Upload" />
		<input type="button" name="btnClose" value="Close" onClick="javascript:window.close();" /></div>
	</form>
</fieldset>
</body>
</html>