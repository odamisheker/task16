<?php 
	$filename = $1;
	$degrees = 180;
	
	header('Content-type: image/jpeg');
	
	$source = imagecreatefromjpeg($filename);

	$rotate = imagerotate($source, $degrees, 0);

	imagejpeg($rotate);
?>
