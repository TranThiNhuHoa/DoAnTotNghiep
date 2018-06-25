<!DOCTYPE html>
<html>
<head>
	<title>Hỗ Trợ Tuyển Sinh | Gợi ý chọn Ngành</title>
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
			<li>Mức độ yêu thích cúa thí sinh đối với từng Khối ngành, Lĩnh vực đào tạo, Nhóm ngành, Ngành.</li>
			<li>Năng lực bản thân của thí sinh.</li>
			<li>Số chỉ tiêu đã quy định của từng Khối ngành, Lĩnh vực đào tạo, Nhóm ngành, Ngành. (Số chỉ tiêu này đã bao gồm cả số chỉ tiêu tuyển thằng).</li>
		</ol>
		<br>
		<h2>Bước 4: Gợi ý chọn Ngành</h2>
		<p>
			<a href="index.php">HoTroTuyenSinh.com</a> muốn biết:<br><br>
		</p>
		<?php
			include("atribute_1_4_1.php");
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