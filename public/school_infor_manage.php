<!DOCTYPE html>
<html>
<head>
	<title>Admin | Quản lý thông tin trường học</title>
	<?php
		include("meta.php");
	?>
</head>
<body>
	<div id="header">
		<h3><a href="school_infor_manage.php">Trang quản trị website HoTroTuyenSinh.com</a></h3>
	</div>

	<div id="navbar">
		<?php
			include("admin_navigation_bar.php");
		?>
	</div>
	<div id="school_infor_list">
		<table>
			<th>
				<td>STT</td>
				<td>Logo trường</td>
				<td>Mã trường</td>
				<td>Tên trường</td>
				<td>Website chính thức</td>
				<td>Thông tin tuyển sinh</td>
				<td></td>
			</th>
		</table>
	</div>
	<div id="footer" style="height: 20px;">
		&copy; 2018 manage webpage hotrotuyensinh.com (by HoaTTN)
	</div>
</body>
</html>