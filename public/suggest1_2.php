<!DOCTYPE html>
<html>
<head>
	<title>Hỗ Trợ Tuyển Sinh | Gợi ý chọn Lĩnh vực đào tạo</title>
	<?php
		include("meta.php");
	?>
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

	<?php
		include("step_bar_1.php");
	?>

	<div class="main1">
		<p>
			Các gợi ý được đưa ra dựa trên 3 tiêu chí sau:
		</p>
		<ol>
			<li>Mức độ yêu thích cúa thí sinh đối với từng Lĩnh vực đào tạo.</li>
			<li>Năng lực bản thân của thí sinh.</li>
			<li>Số chỉ tiêu đã quy định của từng Lĩnh vực đào tạo.</li>
		</ol>
		<br>
		<h2>Bước 2: Gợi ý chọn Lĩnh vực Đào tạo</h2>
		<p>
			<a href="index.php">HoTroTuyenSinh.com</a> muốn biết:<br><br>
		</p>
		<?php
			include("atribute_1_2_1.php");
			include("view_result.php");
		?>
	</div>

	<div id="footer">
		<?php
			include("footer.php");
		?>
	</div>
</body>
</html>