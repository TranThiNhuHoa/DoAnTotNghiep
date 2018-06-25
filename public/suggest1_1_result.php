<!DOCTYPE html>
<html>
<head>
	<title>Hỗ Trợ Tuyển Sinh | Gợi ý chọn Khối ngành</title>
	<?php
		include("meta.php");
	?>
	<style type="text/css">
		table {
    		border-collapse: collapse;
		}

		table, th, td {
 			border: 1px solid #52D017;
 			width: 50%;
		}

		th {
		    height: 50px;
		}

		td {
			height: 30px;
			text-align: center;
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

	<?php
		include("step_bar_1.php");
	?>
	<div class="main1">
		<p>Bảng dưới đây xếp hạng mức độ phù hợp của từng Khối Ngành đối với thí sinh theo thứ tự giảm dần:</p>
		<br>
		<table>
			<?php
      $sap_xep = [];
				include "Properties.php";
				$dbhost = Properties::DATABASE['host'];
				$dbuser = Properties::DATABASE['username'];
				$dbpass = Properties::DATABASE['password'];
				$db = Properties::DATABASE['name'];

				$connect = mysqli_connect($dbhost, $dbuser, $dbpass, $db) or die("Không thể kết nối với cơ sở dữ liệu");
				mysqli_set_charset($connect, "utf8");

				// function tinh_trong_so(){
    			$attribute_id = [];
    			$query = "SELECT ID FROM thuoc_tinh_bai_toan_1;";
    			$query_result = mysqli_query($GLOBALS['connect'], $query);
    			while ($row = mysqli_fetch_assoc($query_result)) {
       				$attribute_id[] = "attribute_" . $row['ID'];
   				}
    
    			$weight_id = [];
    			foreach ($attribute_id as $key => $value) {
        			$weight_language_value = $_POST[$value];
       				$query = "SELECT ID FROM trong_so WHERE Trong_So_Bien_Ngon_Ngu='$weight_language_value'";
	        		$query_result = mysqli_query($GLOBALS['connect'], $query);
       				while ($row = mysqli_fetch_assoc($query_result)) {
           				$weight_id[] = (int)$row['ID'];
       				}
   				}

    			$base_sum = array_sum($weight_id);
    			$weight_base = 1 / $base_sum;
    			$weight = [];
    			foreach ($weight_id as $key => $value) {
     				$weight[] = $value * $weight_base;
   				}

				// function tinh_muc_do_yeu_thich_khoi_nganh(){
				  $khoi_nganh_ID = "SELECT Khoi_Nganh_ID FROM khoi_nganh";
    			$khoi_nganh_ID_result = mysqli_query($GLOBALS['connect'], $khoi_nganh_ID);

			    while ($khoi_nganh_ID_row = mysqli_fetch_assoc($khoi_nganh_ID_result)) {
       				$select_khoi_nganh_name[] = "khoi_nganh_" . $khoi_nganh_ID_row["Khoi_Nganh_ID"];
    			}

    			foreach ($select_khoi_nganh_name as $select_khoi_nganh_name_key => $select_khoi_nganh_name_value) {
        			$attribute_khoi_nganh = $_POST["" . $select_khoi_nganh_name_value];
        			$attribute_khoi_nganh_sql = "SELECT * FROM fuzzy_set WHERE Bien_Ngon_Ngu='$attribute_khoi_nganh'";
       				$attribute_khoi_nganh_sql_result = mysqli_query($GLOBALS['connect'], $attribute_khoi_nganh_sql);
       				
       				while ($fuzzy_set_khoi_nganh_row = mysqli_fetch_assoc($attribute_khoi_nganh_sql_result)) {
           				$fuzzy_set_a1[] = $fuzzy_set_khoi_nganh_row["a1"];
           				$fuzzy_set_b1[] = $fuzzy_set_khoi_nganh_row["b1"];
           				$fuzzy_set_c1[] = $fuzzy_set_khoi_nganh_row["c1"];
           				$fuzzy_set_d1[] = $fuzzy_set_khoi_nganh_row["d1"];
           				$fuzzy_set_h11[] = $fuzzy_set_khoi_nganh_row["h11"];
            			$fuzzy_set_h12[] = $fuzzy_set_khoi_nganh_row["h12"];
            			$fuzzy_set_a2[] = $fuzzy_set_khoi_nganh_row["a2"];
            			$fuzzy_set_b2[] = $fuzzy_set_khoi_nganh_row["b2"];
            			$fuzzy_set_c2[] = $fuzzy_set_khoi_nganh_row["c2"];
           				$fuzzy_set_d2[] = $fuzzy_set_khoi_nganh_row["d2"];
           				$fuzzy_set_h21[] = $fuzzy_set_khoi_nganh_row["h21"];
           				$fuzzy_set_h22[] = $fuzzy_set_khoi_nganh_row["h22"];
       				}
    			}

    			$fuzzy_set_mount = count($fuzzy_set_a1);
    			$n = 2;
    			$he_so_lech = $n / (2 * $n + 1);
    			for ($i = 0; $i < $fuzzy_set_mount; $i++) {
        			$tich_hop_trung_binh_can_duoi[$i] = 	($fuzzy_set_a1[$i] + $fuzzy_set_d1[$i]) / 2 + 
        													$he_so_lech * ($fuzzy_set_b1[$i] - $fuzzy_set_a1[$i] - $fuzzy_set_d1[$i] + $fuzzy_set_c1[$i]);

        			$tich_hop_trung_binh_can_tren[$i] = 	($fuzzy_set_a2[$i] + $fuzzy_set_d2[$i]) / 2 + 
        													$he_so_lech * ($fuzzy_set_b2[$i] - $fuzzy_set_a2[$i] - $fuzzy_set_d2[$i] + $fuzzy_set_c2[$i]);

        			$tich_hop_trung_binh[$i] = ($tich_hop_trung_binh_can_tren[$i] + $tich_hop_trung_binh_can_duoi[$i]) / 2;
				}
				    
				// function tinh_nang_luc_ban_than_theo_khoi_nganh(){
    			$diem_tong_ket = array(
    									"Toán Học" => (int)$_POST['toan_hoc'],
       									"Ngữ Văn" => (int)$_POST['ngu_van'],
       									"Sinh Học" => (int)$_POST['sinh_hoc'],
       									"Vật Lí" => (int)$_POST['vat_li'],
       									"Hóa Học" => (int)$_POST['hoa_hoc'],
       									"Lịch Sử" => (int)$_POST['lich_su'],
       									"Địa Lý" => (int)$_POST['dia_ly'],
       									"Ngoại Ngữ" => (int)$_POST['ngoai_ngu'],
       									"Giáo Dục Công Dân" => (int)$_POST['giao_duc_cong_dan'],
        								"Giáo Dục Quốc Phòng" => (int)$_POST['giao_duc_quoc_phong'],
        								"Thể Dục" => (int)$_POST['the_duc'],
        								"Công Nghệ" => (int)$_POST['cong_nghe'],
        								"Tin Học" => (int)$_POST['tin_hoc'],
        								"Môn Tự Chọn" => (int)$_POST['mon_tu_chon'],
        								"Điểm Ưu Tiên" => (int)$_POST['diem_uu_tien'],
									    );

    			mysqli_set_charset($GLOBALS['connect'], "utf8");

    			$ten_nganh = [];
    			$ten_nganh_sql = "SELECT Ten_Nganh, Ma_Khoi_Thi FROM tuyen_sinh";
   				$ten_nganh_sql_result = mysqli_query($GLOBALS['connect'], $ten_nganh_sql);
    			while ($ten_nganh[] = mysqli_fetch_assoc($ten_nganh_sql_result)) {
    			}

    			$result = [];
    			foreach ($ten_nganh as $key => $value) {
       				if (array_key_exists($value['Ten_Nganh'], $result)) {
           				if (in_array($value['Ma_Khoi_Thi'], $result[$value['Ten_Nganh']])) {
               				continue;
           				}
        			}
        			$result[$value['Ten_Nganh']][] = $value['Ma_Khoi_Thi'];
    			}

    			$nhom_nganh = [];
    			$query = "SELECT Ten_Nganh, Nhom_Nganh_ID FROM nganh";
    			$query_result = mysqli_query($GLOBALS['connect'], $query);
    			while ($nhom_nganh[] = mysqli_fetch_assoc($query_result)) {
   				}

    			$result2 = [];
    			foreach ($nhom_nganh as $value) {
        			if (array_key_exists($value['Ten_Nganh'], $result))
           				$result2[$value['Nhom_Nganh_ID']] = array_merge($result[$value['Ten_Nganh']], $result2[$value['Nhom_Nganh_ID']] ?? []);
    			}

    			foreach ($result2 as $key => $value) {
        			$temp = array_unique($value);
        			$result2[$key] = $temp;
    			}

    			$khoi_nganh = [];
    			$query = 	"SELECT khoi_nganh.Khoi_Nganh_ID, khoi_nganh.Ten_Khoi_Nganh, nhom_nganh.Nhom_Nganh_ID, nhom_nganh.Ten_Nhom_Nganh 
    						FROM nhom_nganh JOIN khoi_nganh JOIN linh_vuc_dao_tao 
    						WHERE 	khoi_nganh.Khoi_Nganh_ID = linh_vuc_dao_tao.Khoi_Nganh_ID AND 
    								nhom_nganh.Linh_Vuc_Dao_Tao_ID = linh_vuc_dao_tao.Linh_Vuc_Dao_Tao_ID";
    			$query_result = mysqli_query($GLOBALS['connect'], $query);
    			while ($khoi_nganh[] = mysqli_fetch_assoc($query_result)) {
    			}

    			$result3 = [];
    			foreach ($khoi_nganh as $value) {
        			if (array_key_exists($value['Nhom_Nganh_ID'], $result2) && $value['Ten_Khoi_Nganh'] != "")
           				$result3[$value['Ten_Khoi_Nganh']] = array_merge($result2[$value['Nhom_Nganh_ID']], $result3[$value['Ten_Khoi_Nganh']] ?? []);
    			}

   				foreach ($result3 as $key => $value) {
        			$temp = array_unique($value);
        			$result3[$key] = $temp;
    			}

	    		$diem_khoi_thi = [];
    			$query = "SELECT Ma_Khoi_Thi_BGD, Mon_Thi_1, Mon_Thi_2, Mon_Thi_3 FROM khoi_thi";
   				$query_result = mysqli_query($GLOBALS['connect'], $query);
   				while ($diem_khoi_thi[] = mysqli_fetch_assoc($query_result)) {
   				}

	    		$tong_diem = [];
    			foreach ($diem_khoi_thi as $value) {
        			$temp = 	($diem_tong_ket[$value['Mon_Thi_1']] ?? $diem_tong_ket["Môn Tự Chọn"])
       							+ ($diem_tong_ket[$value['Mon_Thi_2']] ?? $diem_tong_ket["Môn Tự Chọn"])
           						+ ($diem_tong_ket[$value['Mon_Thi_3']] ?? $diem_tong_ket["Môn Tự Chọn"])
           						+ $diem_tong_ket["Điểm Ưu Tiên"];
       				$tong_diem[$value['Ma_Khoi_Thi_BGD']] = $temp;
   				}

    			$result4 = [];
    			foreach ($result3 as $key => $value){
        			$temp = [];
        			foreach ($value as $sVal ){
           				$temp[$sVal] = $tong_diem[$sVal];
       				}
       				$max = max($temp);
       				$result4[$key] = $max;
   				}

    			$result5 = [];
    			$query = "SELECT Ten_Khoi_Nganh FROM khoi_nganh";
    			$query_result = mysqli_query($GLOBALS['connect'], $query);
    			while ($row = mysqli_fetch_assoc($query_result)) {
       				$result5[$row['Ten_Khoi_Nganh']] = 0;
    			}

    			$result6 = [];
    			$result6 = array_merge($result5, $result4);

				// function so_chi_tieu_theo_khoi_nganh(){
			    $result1 = [];
				$query =    "SELECT khoi_nganh.Ten_Khoi_Nganh, tuyen_sinh.So_Chi_Tieu 
               				FROM khoi_nganh JOIN linh_vuc_dao_tao JOIN nhom_nganh JOIN nganh JOIN tuyen_sinh 
               				WHERE 
                   				khoi_nganh.Khoi_Nganh_ID = linh_vuc_dao_tao.Khoi_Nganh_ID AND 
		                    	linh_vuc_dao_tao.Linh_Vuc_Dao_Tao_ID = nhom_nganh.Linh_Vuc_Dao_Tao_ID AND
                   				nhom_nganh.Nhom_Nganh_ID = nganh.Nhom_Nganh_ID AND
		                    	nganh.Ten_Nganh = tuyen_sinh.Ten_Nganh";
    			$query_result = mysqli_query($GLOBALS['connect'], $query);
    			while ($row = mysqli_fetch_assoc($query_result)) {
        			$result1[$row['Ten_Khoi_Nganh']] = (int)$row['So_Chi_Tieu'] + ($result1[$row['Ten_Khoi_Nganh']]??0); 
    			}

   				$result2 = [];
   				$query = "SELECT Ten_Khoi_Nganh FROM khoi_nganh";
   				$query_result = mysqli_query($GLOBALS['connect'], $query);
   				while ($row = mysqli_fetch_assoc($query_result)) {
        			$result2[$row['Ten_Khoi_Nganh']] = 0;
    			}

	    		$result3 = [];
    			$result3 = array_merge($result2, $result1);

				// function goi_y_chon_khoi_nganh(){
			    $trong_so = [];
   				foreach ($weight as $key => $value) {
       				$trong_so[] = $value;
   				}
    
   				$attribute_1 = [];
    			foreach ($tich_hop_trung_binh as $key => $value) {
        			$attribute_1[$key] = $value;
    			}
    
    			$attribute_2 = [];
   				foreach ($result6 as $key => $value) {
       				$attribute_2[] = $value;
   				}
    
   				$attribute_3 = [];
    			foreach ($result3 as $key => $value) {
        			$attribute_3[] = $value;
    			}
   
    			//TOPSIS
    			//Bước 1: Chuẩn hóa giá trị các thuộc tính theo CHUẨN HÓA TUYẾN TÍNH
    			$attribute_1_chuan_hoa = [];
    			$attribute_1_max = max($attribute_1);
   				foreach ($attribute_1 as $key => $value) {
       				$attribute_1_chuan_hoa[] = $value / $attribute_1_max;
   				}
    
    			$attribute_2_chuan_hoa = [];
    			$attribute_2_max = max($attribute_2);
    			foreach ($attribute_2 as $key => $value) {
       				$attribute_2_chuan_hoa[] = $value / $attribute_2_max;
    			}
    
    			$attribute_3_chuan_hoa = [];
    			$attribute_3_max = max($attribute_3);
    			foreach ($attribute_3 as $key => $value) {
       				$attribute_3_chuan_hoa[] = $value / $attribute_3_max;
    			}

   				//Bước 2: Tính giá trị theo trọng số
   				$attribute_1_trong_so = [];
   				foreach ($attribute_1_chuan_hoa as $key => $value) {
       				$attribute_1_trong_so[] = $value * $trong_so[0];
    			}
    
    			$attribute_2_trong_so = [];
    			foreach ($attribute_2_chuan_hoa as $key => $value) {
       				$attribute_2_trong_so[] = $value * $trong_so[1];
    			}
    
   				$attribute_3_trong_so = [];
   				foreach ($attribute_3_chuan_hoa as $key => $value) {
       				$attribute_3_trong_so[] = $value * $trong_so[2];
   				}

    			//Bước 3: Tìm phương án lý tưởng tốt và phương án lý tưởng xấu
    			$phuong_an_ly_tuong_tot = [];
    			$phuong_an_ly_tuong_tot[] = max($attribute_1_trong_so);
    			$phuong_an_ly_tuong_tot[] = max($attribute_2_trong_so);
   				$phuong_an_ly_tuong_tot[] = max($attribute_3_trong_so);
   
   				$phuong_an_ly_tuong_xau = [];
   				$phuong_an_ly_tuong_xau[] = min($attribute_1_trong_so);
    			$phuong_an_ly_tuong_xau[] = min($attribute_2_trong_so);
    			$phuong_an_ly_tuong_xau[] = min($attribute_3_trong_so);
    
    			//Bước 4: Tính khoảng cách của từng phương án đến 2 phương án lý tưởng tốt và lý tưởng xấu
    			$attribute_1_tru_ly_tuong_tot = [];
   				foreach ($attribute_1_trong_so as $key => $value) {
       				$attribute_1_tru_ly_tuong_tot[] = $phuong_an_ly_tuong_tot[0] - $value;
   				}
    
   				$attribute_2_tru_ly_tuong_tot = [];
    			foreach ($attribute_2_trong_so as $key => $value) {
        			$attribute_2_tru_ly_tuong_tot[] = $phuong_an_ly_tuong_tot[1] - $value;
    			}
    
    			$attribute_3_tru_ly_tuong_tot = [];
   				foreach ($attribute_3_trong_so as $key => $value) {
       				$attribute_3_tru_ly_tuong_tot[] = $phuong_an_ly_tuong_tot[2] - $value;
   				}
    
   				$khoang_cach_den_phuong_an_ly_tuong_tot = [];
    			for($i=0; $i<count($attribute_1); $i++){
    			    $khoang_cach_den_phuong_an_ly_tuong_tot[$i] = sqrt(pow($attribute_1_tru_ly_tuong_tot[$i], 2) + pow($attribute_2_tru_ly_tuong_tot[$i], 2) + pow($attribute_3_tru_ly_tuong_tot[$i], 2));
    			}
    
    			$attribute_1_tru_ly_tuong_xau = [];
   				foreach ($attribute_1_trong_so as $key => $value) {
   				    $attribute_1_tru_ly_tuong_xau[] = $value - $phuong_an_ly_tuong_xau[0];
   				}
    
   				$attribute_2_tru_ly_tuong_xau = [];
    			foreach ($attribute_2_trong_so as $key => $value) {
        			$attribute_2_tru_ly_tuong_xau[] = $value - $phuong_an_ly_tuong_xau[1];
    			}
    
   				$attribute_3_tru_ly_tuong_xau = [];
   				foreach ($attribute_3_trong_so as $key => $value) {
       				$attribute_3_tru_ly_tuong_xau[] = $value - $phuong_an_ly_tuong_xau[2];
   				}
    
    			$khoang_cach_den_phuong_an_ly_tuong_xau = [];
    			for($i=0; $i<count($attribute_1); $i++){
    			    $khoang_cach_den_phuong_an_ly_tuong_xau[$i] = sqrt(pow($attribute_1_tru_ly_tuong_xau[$i], 2) + pow($attribute_2_tru_ly_tuong_xau[$i], 2) + pow($attribute_3_tru_ly_tuong_xau[$i], 2));
    			}

    			//Bước 5: Tính độ tương tự tới phương án lý tưởng tốt
    			$do_tuong_tu = [];
    			for($i=0; $i<count($attribute_1); $i++){
       				$do_tuong_tu[$i] = $khoang_cach_den_phuong_an_ly_tuong_xau[$i] / ($khoang_cach_den_phuong_an_ly_tuong_xau[$i] + $khoang_cach_den_phuong_an_ly_tuong_tot[$i]);
   				}

   				//Bước 6: Xếp hạng các phương án và đưa ra gợi ý
   				$khoi_nganh_infor = [];
    			$query = "SELECT Ten_Khoi_Nganh FROM khoi_nganh";
    			$query_result = mysqli_query($GLOBALS['connect'], $query);
    			while ($row = mysqli_fetch_assoc($query_result)) {
       				$khoi_nganh_infor[] = $row['Ten_Khoi_Nganh'];
    			}

   				// $sap_xep = [];
   				foreach ($do_tuong_tu as $key => $value) {
       				foreach ($khoi_nganh_infor as $key1 => $value1) {
           				if($key == $key1)
                			$sap_xep[$value1] = $value;
        			}
    			}
    			arsort($sap_xep);

				echo '<th>';
					echo "Khối ngành";
				echo '</th>';
				// echo '<th>';
				// 	echo "Khối thi";
				// echo '</th>';
        echo '<th>';
          echo "Xếp hạng";
        echo '</th>';
				$rank = 1;
				foreach ($sap_xep as $key => $value) {
					echo '<tr>';
						echo '<td>';
							echo $key;
						echo '</td>';
						echo '<td>';
							echo $rank;
						echo '</td>';
					echo '</tr>';
					$rank++;
				}
				mysqli_close($connect);
			?>
		</table>
		<br>
		<p>
			<b><a href="index.php">HoTroTuyenSinh.com</a> gợi ý thí sinh nên chọn các ngành thuộc khối ngành có mức độ phù hợp cao nhất, <br>và chọn một trong các khối thi:</b>
      <?php
      foreach ($sap_xep as $key => $value) {
        $khoi_nganh_goi_y[] = $key;
      }
        // include "Properties.php";
        $dbhost = 'localhost';
        $dbuser = 'homestead';
        $dbpass = 'secret';
        $db = 'recommendation';

        $connect = mysqli_connect($dbhost, $dbuser, $dbpass, $db) or die("Không thể kết nối với cơ sở dữ liệu");
        mysqli_set_charset($connect, "utf8");
        $query = "SELECT tuyen_sinh.Ma_Khoi_Thi FROM khoi_nganh JOIN linh_vuc_dao_tao JOIN nhom_nganh JOIN nganh JOIN tuyen_sinh WHERE khoi_nganh.Ten_Khoi_Nganh = '$khoi_nganh_goi_y[0]' AND khoi_nganh.Khoi_Nganh_ID = linh_vuc_dao_tao.Khoi_Nganh_ID AND linh_vuc_dao_tao.Linh_Vuc_Dao_Tao_ID = nhom_nganh.Linh_Vuc_Dao_Tao_ID AND nhom_nganh.Nhom_Nganh_ID = nganh.Nhom_Nganh_ID AND nganh.Ten_Nganh = tuyen_sinh.Ten_Nganh";
        $query_result = mysqli_query($GLOBALS['connect'], $query);
        while ($row = mysqli_fetch_assoc($query_result)) {
          $khoi_thi_result[] = $row['Ma_Khoi_Thi'];
        }
        $khoi_thi_unique = array_unique($khoi_thi_result);
        foreach ($khoi_thi_unique as $key => $value) {
          echo $value ." ";
        }
        mysqli_close($connect);
      ?>
		</p>
		<br>
		<a href="suggest1_2.php">Xem gợi ý chọn Lĩnh vực Đào tạo</a>
		<p style="font-size: 11px;">
			<i>Lưu ý: <a href="index.php">HoTroTuyenSinh.com</a> chỉ gợi ý thí sinh lựa chọn Lĩnh vực Đào tạo trong Khối Ngành có độ phù hợp cao nhất.</i>
		</p>
		<br>
	</div>

	<div id="footer">
		<?php
			include("footer.php");
		?>
	</div>
</body>
</html>