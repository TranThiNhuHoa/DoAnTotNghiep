<!DOCTYPE html>
<html>
<head>
	<title>Hỗ Trợ Tuyển Sinh | Gợi ý chọn Khối ngành</title>
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
			<li>Mức độ yêu thích cúa thí sinh đối với từng Khối ngành.</li>
			<li>Năng lực bản thân của thí sinh.</li>
			<li>Số chỉ tiêu đã quy định của từng Khối ngành.</li>
		</ol>
		<br>
		<h2>Bước 1: Gợi ý chọn Khối ngành</h2>
		<p>
			<a href="index.php">HoTroTuyenSinh.com</a> muốn biết: <br><br>
		</p>
		<hr>
		<p>
			<b>Mức độ ảnh hưởng của các tiêu chí đối với việc ra quyết định</b>
		</p>
		
		<form 	name="suggest1_1" 
				action="suggest1_1_result.php" 
				method="POST" 
				>
			<?php
				include("weight_1.php");
			?>
			<br>
			<hr>
			<p>
				<b>Mức độ yêu thích đối với từng Khối ngành</b>
			</p>
			<?php
				include("atribute_1_1_1.php");
			?>
			<br>
			<hr>
			<p>
				<b>Điểm tổng kết các môn học sau:</b>
			</p>
			<?php
				include("atribute_1_1_2.php");
			?>
			<br>
			<input type="submit" name="suggest1_1_submit" value="Xem kết quả gợi ý">
		</form>
		<br>
	</div>

	<div id="footer">
		<?php
			include("footer.php");
		?>
	</div>
</body>
</html>