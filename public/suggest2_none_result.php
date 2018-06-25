<!DOCTYPE html>
<html>
<head>
	<title>Hỗ Trợ Tuyển Sinh | Gợi ý chọn trường</title>
	<?php
		include("meta.php");
	?>
	<style>
		.main{
			height: 585px;
		}
	</style>
</head>
<body>
	<div id="header">
		<h3><a href="index.php">HoTroTuyenSinh.com</a></h3>
	</div>

	<div id="navbar">
		<?php
			include("navigation_bar.php");
		?>
	</div>

	<div class="main">
		<?php
			echo "Không có Tên Ngành này trong cơ sở dữ liệu hiện tại của hệ thống...";
		?>
	</div>

	<div id="footer">
		<?php
			include("footer.php");
		?>
	</div>
</body>
</html>