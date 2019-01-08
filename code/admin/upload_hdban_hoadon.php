<?php
/*

How to modify:
When you create a FileUploader Object, specify it which file types are allowed, maximum file size upload and upload directory like this:
	$fileUploader = new FileUploader('jpg, jpeg, gif, png, zip, rar', 3, 'upload/');
File types are and seperated by commas (,), default are 'jpg, jpeg, gif, png, zip, rar'
Maximum file size upload is in MB, default is: 3 MB
Upload directory is ended with trailing slash (/), default is: 'upload/'

If one or more of these arguments is missed, default value is used in stead of. You can leave if blank if you don't know how to change.
*/
class FileUploader {
	private $fileTypesAllowed;
	private $fileSizeMax;
	private $uploadDir;
	private $files;
	
	/*
	Function: Create FileUploader object
	Arguments:
		$fileTypesAllowed: types of files allowed, separated by commas(,)
		$fileSizeMax: max size of file upload in MB
		$uploadDir: path to directory where files go to, ended with trailing slash (/)
			function __construct($fileTypesAllowed = 'jpg, jpeg, gif, png, zip, rar, mpg, avi, flv, wmv',
	*/

 // script để thực hiện quá trình upload	
	function __construct($fileTypesAllowed = 'jpg, jpeg, png, pdf', $fileSizeMax = 15, $uploadDir = '../hopdong_uploads') {
		$this->fileTypesAllowed = strtolower($fileTypesAllowed);
		$this->fileSizeMax = $fileSizeMax;
		$this->uploadDir = $uploadDir.'_'.date('Y').'/hdban_hoadon/';
	}
	/*
	Function: Show form upload
	*/
	function showFormUpload() {
		echo '
		<script type="text/javascript">
			function addFile() {
				var br = document.createElement("br")
				var newInput = document.createElement("input");
				newInput.name = "filesUpload[]";
				newInput.type = "file";
				document.getElementById("list").appendChild(br);
				document.getElementById("list").appendChild(newInput);
			}
			function wait() {
				document.getElementById("wait").innerHTML = "Đang tải dữ liệu...";
			}
		</script>
		<form action="'.htmlentities($_SERVER['PHP_SELF']).'" method="post" enctype="multipart/form-data" onsubmit="wait()">
			<input type="hidden" name="MAX_FILE_SIZE" value="'.($this->fileSizeMax * 1024 * 1024).'">
			<table cellspacing="0" cellpadding="2">
				<tr><td>Dung lượng tối đa:</td><td><b>'.$this->fileSizeMax.' MB</b></td></tr>
				<tr><td>Định dạng cho phép:</td><td><b>'.$this->fileTypesAllowed.'</b></td></tr>
				<tr><td>Chọn tệp:<br><!--<a href="javascript:void(0)" onclick="addFile()">Thêm tệp khác</a>--></td><td id="list"><input name="filesUpload[]" type="file"></td></tr>
			</table>
			<input type="submit" name="submit" value="Tải lên">
		</form>
		<div id="wait"></div>
		
		';
	}
	/*
	Function: Get file upload and set file name and file type
	*/
	function getFilesUpload($files) {
		$j = 0;
		$this->files = array();
		for ($i = 0; $i < count($files['name']); $i++) {
			if (trim($files['name'][$i]) != '') {
				$this->files[$j]['name'] = trim($files['name'][$i]);
				$this->files[$j]['tmp_name'] = $files['tmp_name'][$i];
				$this->files[$j]['error'] = $files['error'][$i];
				$this->files[$j]['type'] = $files['type'][$i];
				$this->files[$j]['ext'] = strtolower(substr($this->files[$j]['name'], strrpos($this->files[$j]['name'], '.') + 1));
				$this->files[$j]['newName'] = $this->uploadDir.md5_file($this->files[$j]['tmp_name']).'.'.$this->files[$j]['ext'];
				$j++;
			}
		}
	}
	/*
	Function: Get total files upload
	*/
	function getTotalFiles() {
		return count($this->files);
	}
	/*
	Function: Check error while uploading
	*/
	function checkUploadProcess($i) {
		switch ($this->files[$i]['error']) {
			case UPLOAD_ERR_INI_SIZE:
			case UPLOAD_ERR_FORM_SIZE:
				echo '<div id="error">Tệp <u>'.$this->files[$i]['name'].'</u> quá nặng, xin chọn lại tệp khác</div>';
				return false;
			case UPLOAD_ERR_PARTIAL:
				echo '<div id="error">Có lỗi trong lúc tải tệp <u>'.$this->files[$i]['name'].'</u> , mời làm lại</div>';
				return false;
		}
		return true;
	}
	/*
	Function: Check file type
	*/
	function checkFileType($i) {
		if (strpos($this->fileTypesAllowed, $this->files[$i]['ext']) === false) {
	//	echo $this->fileTypesAllowed;
			echo '<div id="error">Định dạng tệp <u>'.$this->files[$i]['name'].'</u> không đúng loại, mời chọn lại</div>';
			return false;
		}

		return true;
	}
	/*
	Function: Move file to destination folder
	*/
	function moveFile($i) {
		if (!@file_exists($this->files[$i]['newName'])) {
			if (!@move_uploaded_file($this->files[$i]['tmp_name'], $this->files[$i]['newName'])) {
				echo '<div id="error">Không thể lưu tệp <u>'.$this->files[$i]['name'].'</u> trên máy chủ, mời làm lại</div>';
				return false;
			} else {
				echo '<div id="successful">Tệp <u>'.$this->files[$i]['name'].'</u> đã được tải lên thành công</div>';
			}
		} else {
			echo '<div id="warn">Tệp <u>'.$this->files[$i]['name'].'</u> đã có sẵn</div>';
		}
		return true;
	}
	/*
	Function: Return link to uploaded file
	*/
	function getLink($i) {
		$path = dirname($_SERVER['PHP_SELF']);
		if ($path == '' || $path == '/' || $path == '\\') {
			$path = '';
		}

		$link = 'http://'.$_SERVER['SERVER_NAME'].$path.'/'.$this->files[$i]['newName'];
		$link_bs = $this->files[$i]['newName'];
		$return = "<table><tr><td>Đường dẫn:</td><td><input type=\"text\" onclick=\"this.select()\" value=\"$link\" size=\"50\"></td></tr>";
		if (strpos($this->files[$i]['type'], 'image') !== false) {
			$link = '[img]'.$link.'[/img]';
		} else {
			$link = '[url='.$link.']Tải xuống[/url]';
		}
		$return .= "<tr><td>BBCode:</td><td><input type=\"text\" onclick=\"this.select()\" value=\"$link\" size=\"50\"></td></tr></table>";
		$return .= "<tr><td colspan=\"2\"><A href=\"Javascript: window.opener.document.frmList_HdbanHoadon.hoadon_file.value='$link_bs';window.close();window.history.go(1);\">Hoàn tất thao tác</A></td> </tr></table>";
		return $return;
	}
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>File Uploader</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="description" content="Upload one or multiple files to server, handle for errors, generate direct links and BBCode for forums.">
	<meta name="keywords" content="upload file, file uploader, php uploader, upload, file">
	<meta name="author" content="Rilwis">
	<style type="text/css">
		body {
			font: normal 13px Arial, Heltical, sans-serif;
			margin: 5px;
			text-align: left;
			background-color:#dfe8f6;
			font-size: 12px;
		}
		#page {
			width: 600px;
			margin: 0 auto;
		}
		table {
			font: normal 11px Arial, Heltical, sans-serif;
		}
		h2 {
			font: bold 22px Verdana, Heltical, sans-serif;
			color: #a69;
			margin: 20px;
		}
		#wait, #error, #successful, #warn {
			font-size: 12px;
		}
		#error {
			color: red;
		}
		#successful {
			color: green;
		}
		#warn {
			color: orange;
		}
		#copyright {
			margin-top: 20px;
		}
	</style>
</head>
<body>
	<div id="page">
		<p><b>TRÌNH TRUYỀN TẢI DỮ LIỆU</b></p>
		<?php
        ini_set('display_errors',0);
		$fileUploader = new FileUploader();
		ini_set('post_max_size','100M');
		ini_set('upload_max_filesize','100M');
 		ini_set('max_execution_time','10000');
		ini_set('max_input_time','10000');
		$fileUploader->showFormUpload();
		if (isset($_POST['submit'])) {
			$fileUploader->getFilesUpload($_FILES['filesUpload']);
			if ($fileUploader->getTotalFiles() > 0) {
				for ($i = 0; $i < $fileUploader->getTotalFiles(); $i++) {
					if ($fileUploader->checkUploadProcess($i) && $fileUploader->checkFileType($i) && $fileUploader->moveFile($i)) {
						echo $fileUploader->getLink($i);
					}
				}
			} else {
				echo '<div id="error">Hãy chọn ít nhất 1 tệp tin trước khi tải</div>';
			}
		}
		?>
	</div>
</body>
</html>