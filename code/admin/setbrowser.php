<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title>jQuery.fullscreen example</title>
	<link rel="stylesheet" href="styles.css" type="text/css" media="screen">
	<script type="text/javascript" src="../js/release/jquery.js"></script>
	<script type="text/javascript" src="../js/release/jquery.fullscreen-0.3.4.min.js"></script>
</head>
<body id="body_id" style="height:100%; width:100%">
	<div id="main">
		<div class="example">
        	<div id="fullscreen">hehe</div>
			<script type="text/javascript">
				$(function() {
					// check native support
					$('#support').text($.fullscreen.isNativelySupported() ? 'supports' : 'doesn\'t support');

					// open in fullscreen
					$('#body_id').click(function() {
						$('#fullscreen').fullscreen();
						return false;
					});
				});
			</script>
		</div>
		<div>
	</div>
</body>
</html>