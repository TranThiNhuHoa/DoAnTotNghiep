<!DOCTYPE html>
<html>
<head>
	<title>Hỗ Trợ Tuyển Sinh | Gợi ý chọn trường</title>
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
		include("step_bar_2.php");
	?>

	<div class="main1">
		<h2>
			Lưu ý: <a href="index.php">HoTroTuyenSinh.com</a> chỉ đưa ra được gợi ý chọn trường khi thí sinh đã chọn ngành!
		</h2>
		<p style="font-size: 11px;">
			<i>Thí sinh có thể yêu cầu <a href="index.php">HoTroTuyenSinh.com</a> đưa ra gợi ý chọn trường ngay cả khi thí sinh không yêu cầu <a href="index.php">HoTroTuyenSinh.com</a> đưa ra gợi ý chọn ngành.<br>Nhưng khi đó, thí sinh phải chuẩn bị sẵn 1 mã Ngành, Nhóm ngành từ trước.</i>
		</p>
		<br>
		<p>
			Gợi ý chọn trường được đưa ra dựa trên 7 tiêu chí sau:
		</p>
		<ol>
			<li><b>Ranking của trường:</b> là thứ hạng của trường trong bảng xếp hạng các trường.</li>
			<li><b>Số chỉ tiêu:</b> là số chỉ tiêu tuyển sinh nhóm ngành đã được gợi ý tại trường.</li>
			<li><b>Chênh lệch điểm chuẩn:</b> là mức độ chênh lệch điểm mà thí sinh đạt được so với điểm ngưỡng của trường.</li>
			<li><b>Khả năng tìm việc:</b> là khả năng tốt nghiệp xong có việc làm luôn khi theo học tại trường.</li>
			<li><b>Khoảng cách:</b> là khoảng cách về địa lý giữa nơi thường trú của thí sinh đến trường học.</li>
			<li><b>Học phí:</b> là khoản phí trung bình mỗi thí sinh phải bỏ ra nếu theo học tại trường.</li>
			<li><b>Môi trường học tập:</b> là đánh giá của các sinh viên hiện đang theo học tại trường về môi trường học tập của trường đó.</li>
		</ol>
		<br>
		<p>
			Để có thể đưa ra gợi ý chọn trường, <a href="index.php">HoTroTuyenSinh.com</a> muốn biết:
		</p>
		<form 	name="suggest2" 
				action="suggest2_result.php"
				method="POST" 
				>
			<br>
			<hr>
			<h2>
				Bước 1: Đánh giá mức độ quan trọng của các tiêu chí chọn trường.
			</h2>
			<?php
				include("weight_2.php");
			?>
			<br>
			<hr>
			<h2>
				Bước 2: Cung cấp Tên Ngành đã chọn.
			</h2>
			Tên Ngành:
			<input type="text" name="ten_nganh_da_chon" placeholder="Nhập Tên Ngành đã chọn" style="width: 400px;" required><br><br>
			<br>
			<hr>
			<h2>
				Bước 3: Cung cấp kết quả thi.
			</h2>
			Kết quả thi môn 1:
			<input type="number" step="0.01" name="mon_1" min="0" max="10" required><br><br>
			Kết quả thi môn 2:
			<input type="number" step="0.01" id="ToanHoc" name="mon_2" min="0" max="10" required><br><br>
			Kết quả thi môn 3:
			<input type="number" step="0.01" id="ToanHoc" name="mon_3" min="0" max="10" required><br><br>
			Tổng điểm cộng:
			<input type="number" step="0.01" id="ToanHoc" name="mon_4" min="0" max="10" required><br><br>
			<br>
			<hr>
			<h2>
				Bước 4: Cung cấp địa chỉ thường trú.
			</h2>
			Địa chỉ thường trú:
			<input type="text" name="address" placeholder="Nhập địa chỉ thường trú của thí sinh" style="width: 400px;" required><br><br>
			<br>
			<hr>
			<h2>
				Bước 5: Xem kết quả gợi ý chọn trường.
			</h2>
			<input type="submit" name="view_result" value="Xem kết quả gợi ý" onclick="locdau()">
		</form>
	</div>

	<div id="footer">
		<?php
			include("footer.php");
		?>
	</div>
</body>
</html>