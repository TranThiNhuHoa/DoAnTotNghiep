<!DOCTYPE html>
<html>
<head>
	<title>Hỗ Trợ Tuyển Sinh | Gợi ý chọn trường</title>
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
		include("step_bar_2.php");
	?>

	<div class="main1">
		<p>Bảng dưới đây xếp hạng mức độ phù hợp của từng Tổ chức Đào tạo đối với thí sinh theo thứ tự giảm dần:</p>
		<br>
		<table>
			<?php
				include "Properties.php";
				$dbhost = Properties::DATABASE['host'];
				$dbuser = Properties::DATABASE['username'];
				$dbpass = Properties::DATABASE['password'];
				$db = Properties::DATABASE['name'];

				$connect = mysqli_connect($dbhost, $dbuser, $dbpass, $db) or die("Không thể kết nối với cơ sở dữ liệu");
				mysqli_set_charset($connect, "utf8");

				$ten_nganh_da_chon = $_POST['ten_nganh_da_chon'];
				$query = "SELECT to_chuc_dao_tao.Ten_To_Chuc_Dao_Tao, to_chuc_dao_tao.Ma_To_Chuc_Dao_Tao FROM tuyen_sinh JOIN to_chuc_dao_tao WHERE Ten_Nganh='$ten_nganh_da_chon' AND to_chuc_dao_tao.Ma_To_Chuc_Dao_Tao = tuyen_sinh.Ma_To_Chuc_Dao_Tao";
				$query_result = mysqli_query($connect, $query);
				$query_result_count = mysqli_num_rows($query_result);
				
				if ($query_result_count == 0) {
    				header("location:suggest2_none_result.php");
				}
				else{
    				$result1 = [];
    				$result2 = [];
    				while ($row = mysqli_fetch_assoc($query_result)) {
    					$result1[] = $row['Ten_To_Chuc_Dao_Tao'];
    					$result2[] = $row['Ma_To_Chuc_Dao_Tao'];
    				}

    				$tap_phuong_an = [];
    				foreach (array_unique($result1) as $key => $value) {
    					$tap_phuong_an[] = $value;
    				}

    				$tap_ma_phuong_an = [];
    				foreach (array_unique($result2) as $key => $value) {
    					$tap_ma_phuong_an[] = $value;
    				}

    				$attribute_id = [];
    				$query = "SELECT ID FROM thuoc_tinh_bai_toan_2;";
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

   					$ranking = [];
   					$kha_nang_tim_viec = [];
   					$hoc_phi = [];
   					$moi_truong_hoc_tap = [];

   					foreach ($tap_phuong_an as $key => $value) {
   						$query = "SELECT * FROM to_chuc_dao_tao WHERE Ten_To_Chuc_Dao_Tao='$value'";
   						$query_result = mysqli_query($GLOBALS['connect'], $query);
   						while ($row = mysqli_fetch_assoc($query_result)) {
   							$ranking[] = (int)$row['Ranking'];
   							$kha_nang_tim_viec[] = (float)$row['Kha_Nang_Tim_Viec'];
   							$hoc_phi[] = (float)$row['Hoc_Phi'];
   							$moi_truong_hoc_tap[] = $row['Moi_Truong_Hoc_Tap'];
   						}
   					}

   					$so_chi_tieu = [];
   					$diem_nguong = [];
   					foreach ($tap_ma_phuong_an as $key => $value) {
   						$so_chi_tieu[$value] = 0;
   						$diem_nguong[$value] = 100;
   						$query = "SELECT So_Chi_Tieu, Diem_Nguong FROM tuyen_sinh WHERE Ma_To_Chuc_Dao_Tao='$value'AND Ten_Nganh='$ten_nganh_da_chon'";
   						$query_result = mysqli_query($GLOBALS['connect'], $query);
   						while ($row = mysqli_fetch_assoc($query_result)) {
   							$so_chi_tieu[$value] += (int)$row['So_Chi_Tieu'];
   							if ((float)$row['Diem_Nguong'] < $diem_nguong[$value])
   								$diem_nguong[$value] = (float)$row['Diem_Nguong'];
   						}
   					}
   					$diem_thi = [];
   					$diem_thi[] = (float)$_POST['mon_1'];
   					$diem_thi[] = (float)$_POST['mon_2'];
   					$diem_thi[] = (float)$_POST['mon_3'];
   					$diem_thi[] = (float)$_POST['mon_4'];

   					$tong_diem = array_sum($diem_thi);
   					$chenh_lech_diem_chuan = [];
   					foreach ($diem_nguong as $key => $value) {
   						$chenh_lech_diem_chuan[$key] = abs($value - $tong_diem);
   					}

   					// -tính khoảng cách
   					function get_infor_from_address($address = null) {
   						$prepAddr = str_replace(' ', '+', stripUnicode($address));
   						$geocode = file_get_contents('http://maps.google.com/maps/api/geocode/json?address='.$prepAddr.'&sensor=false');
   						$output = json_decode($geocode);
   						return $output;
   					}
 
					// Loại bỏ dấu tiếng Việt để cho kết quả chính xác hơn
					function stripUnicode($str){
						if (!$str) return false;
						$unicode = 	array(
										'a'=>'á|à|ả|ã|ạ|ă|ắ|ặ|ằ|ẳ|ẵ|â|ấ|ầ|ẩ|ẫ|ậ|Á|À|Ả|Ã|Ạ|Ă|Ắ|Ặ|Ằ|Ẳ|Ẵ|Â|Ấ|Ầ|Ẩ|Ẫ|Ậ',
										'd'=>'đ|Đ',
										'e'=>'é|è|ẻ|ẽ|ẹ|ê|ế|ề|ể|ễ|ệ|É|È|Ẻ|Ẽ|Ẹ|Ê|Ế|Ề|Ể|Ễ|Ệ',
										'i'=>'í|ì|ỉ|ĩ|ị|Í|Ì|Ỉ|Ĩ|Ị',
										'o'=>'ó|ò|ỏ|õ|ọ|ô|ố|ồ|ổ|ỗ|ộ|ơ|ớ|ờ|ở|ỡ|ợ|Ó|Ò|Ỏ|Õ|Ọ|Ô|Ố|Ồ|Ổ|Ỗ|Ộ|Ơ|Ớ|Ờ|Ở|Ỡ|Ợ',
										'u'=>'ú|ù|ủ|ũ|ụ|ư|ứ|ừ|ử|ữ|ự|Ú|Ù|Ủ|Ũ|Ụ|Ư|Ứ|Ừ|Ử|Ữ|Ự',
										'y'=>'ý|ỳ|ỷ|ỹ|ỵ|Ý|Ỳ|Ỷ|Ỹ|Ỵ'
									);
						foreach($unicode as $nonUnicode=>$uni) $str = preg_replace("/($uni)/i",$nonUnicode,$str);
						return $str;
					}

					$address_1 = $_POST['address'];
					$location_1 = get_infor_from_address($address_1);
					$latitude_1 = $location_1->results[0]->geometry->location->lat;
					$longitude_1 = $location_1->results[0]->geometry->location->lng;

					$address_2 = [];
   					foreach ($tap_ma_phuong_an as $key => $value) {
   						$query = "SELECT Vi_Tri FROM to_chuc_dao_tao WHERE Ma_To_Chuc_Dao_Tao='$value'";
   						$query_result = mysqli_query($GLOBALS['connect'], $query);
   						while ($row = mysqli_fetch_assoc($query_result)) {
   							$address_2[] = $row['Vi_Tri'];
   						}
   					}

   					$location_2 = [];
   					$latitude_2 = [];
   					$longitude_2 = [];
   					foreach ($address_2 as $key => $value) {
   						$location_2[] = get_infor_from_address($value);
   						$latitude_2[] = $location_2[$key]->results[0]->geometry->location->lat;
						  $longitude_2[] = $location_2[$key]->results[0]->geometry->location->lng;
   					}
            
   					function getDistanceBetweenPointsNew($latitude1, $longitude1, $latitude2, $longitude2) {
   						$theta = $longitude1 - $longitude2;
   						$miles = (sin(deg2rad($latitude1)) * sin(deg2rad($latitude2))) + (cos(deg2rad($latitude1)) * cos(deg2rad($latitude2)) * cos(deg2rad($theta)));
   						$miles = acos($miles);
   						$miles = rad2deg($miles);
   						$miles = $miles * 60 * 1.1515;
   						$kilometers = $miles * 1.609344;
   						return $kilometers;
   					}

   					$distance = [];
   					for($i=0; $i<count($address_2); $i++){
   						$distance[] = getDistanceBetweenPointsNew($latitude_1, $longitude_1, $latitude_2[$i], $longitude_2[$i]);
   					}

   					//TOPSIS
   					//Bước 1: Chuẩn hóa:
   					// khử mờ biến ngôn ngữ:
					foreach ($moi_truong_hoc_tap as $key => $value) {
		    			$query = "SELECT * FROM fuzzy_set WHERE Bien_Ngon_Ngu='$value'";
       					$query_result = mysqli_query($GLOBALS['connect'], $query);
       				
	       				while ($row = mysqli_fetch_assoc($query_result)) {
    	       				$fuzzy_set_a1[] = $row["a1"];
        	   				$fuzzy_set_b1[] = $row["b1"];
           					$fuzzy_set_c1[] = $row["c1"];
           					$fuzzy_set_d1[] = $row["d1"];
           					$fuzzy_set_h11[] = $row["h11"];
            				$fuzzy_set_h12[] = $row["h12"];
	            			$fuzzy_set_a2[] = $row["a2"];
    	        			$fuzzy_set_b2[] = $row["b2"];
        	    			$fuzzy_set_c2[] = $row["c2"];
           					$fuzzy_set_d2[] = $row["d2"];
           					$fuzzy_set_h21[] = $row["h21"];
           					$fuzzy_set_h22[] = $row["h22"];
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
					}

					//Chuẩn hóa giá trị các thuộc tính theo CHUẨN HÓA TUYẾN TÍNH
					$attribute_1 = $ranking; //tiêu chí giá
					$attribute_1_chuan_hoa = [];
					foreach ($attribute_1 as $key => $value) {
						$attribute_1_chuan_hoa[] = 1 / $value;
					}

					$attribute_2 = $so_chi_tieu;
					$attribute_2_chuan_hoa = [];
					$attribute_2_max = max($attribute_2);
					foreach ($attribute_2 as $key => $value) {
						$attribute_2_chuan_hoa[] = $value / $attribute_2_max;
					}

					$attribute_3 = $chenh_lech_diem_chuan; //tiêu chí giá
					$attribute_3_chuan_hoa = [];
					foreach ($attribute_3 as $key => $value) {
						$attribute_3_chuan_hoa[] = 1 / $value;
					}

					$attribute_4 = $kha_nang_tim_viec;
					$attribute_4_chuan_hoa = [];
					$attribute_4_max = max($attribute_4);
					foreach ($attribute_4 as $key => $value) {
						$attribute_4_chuan_hoa[] = $value / $attribute_4_max;
					}

					$attribute_5 = $hoc_phi; // tiêu chí giá
					$attribute_5_chuan_hoa = [];
					foreach ($attribute_5 as $key => $value) {
						$attribute_5_chuan_hoa[] = 1 / $value;
					}

					$attribute_6 = $tich_hop_trung_binh;
					$attribute_6_chuan_hoa = [];
					$attribute_6_max = max($attribute_6);
					foreach ($attribute_6 as $key => $value) {
						$attribute_6_chuan_hoa[] = $value / $attribute_6_max;
					}

					$attribute_7 = $distance; // tiêu chí giá
					$attribute_7_chuan_hoa = [];
					foreach ($attribute_7 as $key => $value) {
						$attribute_7_chuan_hoa[] = 1 / $value;
					}					

					//Bước 2: Tính giá trị theo trọng số:
					$trong_so = $weight;
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

    				$attribute_4_trong_so = [];
   					foreach ($attribute_4_chuan_hoa as $key => $value) {
       					$attribute_4_trong_so[] = $value * $trong_so[3];
    				}

    				$attribute_5_trong_so = [];
   					foreach ($attribute_5_chuan_hoa as $key => $value) {
       					$attribute_5_trong_so[] = $value * $trong_so[4];
    				}

    				$attribute_6_trong_so = [];
   					foreach ($attribute_6_chuan_hoa as $key => $value) {
       					$attribute_6_trong_so[] = $value * $trong_so[5];
    				}

    				$attribute_7_trong_so = [];
   					foreach ($attribute_7_chuan_hoa as $key => $value) {
       					$attribute_7_trong_so[] = $value * $trong_so[6];
    				}

    				//Bước 3: Tìm phương án lý tưởng tốt và phương án lý tưởng xấu
    				$phuong_an_ly_tuong_tot = [];
    				$phuong_an_ly_tuong_tot[] = max($attribute_1_trong_so);
    				$phuong_an_ly_tuong_tot[] = max($attribute_2_trong_so);
    				$phuong_an_ly_tuong_tot[] = max($attribute_3_trong_so);
    				$phuong_an_ly_tuong_tot[] = max($attribute_4_trong_so);
    				$phuong_an_ly_tuong_tot[] = max($attribute_5_trong_so);
    				$phuong_an_ly_tuong_tot[] = max($attribute_6_trong_so);
    				$phuong_an_ly_tuong_tot[] = max($attribute_7_trong_so);
    				
    				$phuong_an_ly_tuong_xau = [];
   					$phuong_an_ly_tuong_xau[] = min($attribute_1_trong_so);
   					$phuong_an_ly_tuong_xau[] = min($attribute_2_trong_so);
   					$phuong_an_ly_tuong_xau[] = min($attribute_3_trong_so);
   					$phuong_an_ly_tuong_xau[] = min($attribute_4_trong_so);
   					$phuong_an_ly_tuong_xau[] = min($attribute_5_trong_so);
   					$phuong_an_ly_tuong_xau[] = min($attribute_6_trong_so);
   					$phuong_an_ly_tuong_xau[] = min($attribute_7_trong_so);
   					
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

   					$attribute_4_tru_ly_tuong_tot = [];
   					foreach ($attribute_4_trong_so as $key => $value) {
       					$attribute_4_tru_ly_tuong_tot[] = $phuong_an_ly_tuong_tot[3] - $value;
   					}

   					$attribute_5_tru_ly_tuong_tot = [];
   					foreach ($attribute_5_trong_so as $key => $value) {
       					$attribute_5_tru_ly_tuong_tot[] = $phuong_an_ly_tuong_tot[4] - $value;
   					}

   					$attribute_6_tru_ly_tuong_tot = [];
   					foreach ($attribute_6_trong_so as $key => $value) {
       					$attribute_6_tru_ly_tuong_tot[] = $phuong_an_ly_tuong_tot[5] - $value;
   					}

   					$attribute_7_tru_ly_tuong_tot = [];
   					foreach ($attribute_7_trong_so as $key => $value) {
       					$attribute_7_tru_ly_tuong_tot[] = $phuong_an_ly_tuong_tot[6] - $value;
   					}

   					$khoang_cach_den_phuong_an_ly_tuong_tot = [];
    				for($i=0; $i<count($attribute_1); $i++){
    			    	$khoang_cach_den_phuong_an_ly_tuong_tot[$i] = 	sqrt(
    			    														pow($attribute_1_tru_ly_tuong_tot[$i], 2) + 
    			    														pow($attribute_2_tru_ly_tuong_tot[$i], 2) + 
    			    														pow($attribute_3_tru_ly_tuong_tot[$i], 2) +
    			    														pow($attribute_4_tru_ly_tuong_tot[$i], 2) +
    			    														pow($attribute_5_tru_ly_tuong_tot[$i], 2) +
    			    														pow($attribute_6_tru_ly_tuong_tot[$i], 2) +
    			    														pow($attribute_7_tru_ly_tuong_tot[$i], 2)
    			    													);
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

   					$attribute_4_tru_ly_tuong_xau = [];
   					foreach ($attribute_4_trong_so as $key => $value) {
   				    	$attribute_4_tru_ly_tuong_xau[] = $value - $phuong_an_ly_tuong_xau[3];
   					}

   					$attribute_5_tru_ly_tuong_xau = [];
   					foreach ($attribute_5_trong_so as $key => $value) {
   				    	$attribute_5_tru_ly_tuong_xau[] = $value - $phuong_an_ly_tuong_xau[4];
   					}

   					$attribute_6_tru_ly_tuong_xau = [];
   					foreach ($attribute_6_trong_so as $key => $value) {
   				    	$attribute_6_tru_ly_tuong_xau[] = $value - $phuong_an_ly_tuong_xau[5];
   					}

   					$attribute_7_tru_ly_tuong_xau = [];
   					foreach ($attribute_7_trong_so as $key => $value) {
   				    	$attribute_7_tru_ly_tuong_xau[] = $value - $phuong_an_ly_tuong_xau[6];
   					}

   					$khoang_cach_den_phuong_an_ly_tuong_xau = [];
    				for($i=0; $i<count($attribute_1); $i++){
    			    	$khoang_cach_den_phuong_an_ly_tuong_xau[$i] = 	sqrt(
    			    														pow($attribute_1_tru_ly_tuong_xau[$i], 2) + 
    			    														pow($attribute_2_tru_ly_tuong_xau[$i], 2) + 
    			    														pow($attribute_3_tru_ly_tuong_xau[$i], 2) +
    			    														pow($attribute_4_tru_ly_tuong_xau[$i], 2) +
    			    														pow($attribute_5_tru_ly_tuong_xau[$i], 2) +
    			    														pow($attribute_6_tru_ly_tuong_xau[$i], 2) +
    			    														pow($attribute_7_tru_ly_tuong_xau[$i], 2)
    			    													);
    				}

    				//Bước 5: Tính độ tương tự tới phương án lý tưởng tốt
    				$do_tuong_tu = [];
    				for($i=0; $i<count($attribute_1); $i++){
       					$do_tuong_tu[$i] = $khoang_cach_den_phuong_an_ly_tuong_xau[$i] / ($khoang_cach_den_phuong_an_ly_tuong_xau[$i] + $khoang_cach_den_phuong_an_ly_tuong_tot[$i]);
   					}

   					//Bước 6: Xếp hạng các phương án và đưa ra gợi ý
   					$sap_xep = [];
   					foreach ($do_tuong_tu as $key => $value) {
       					foreach ($tap_phuong_an as $key1 => $value1) {
           					if($key == $key1)
                				$sap_xep[$value1] = $value;
        				}
    				}

    				arsort($sap_xep);

    				echo '<th>';
						echo "Tên Tổ chức Đào tạo";
					echo '</th>';
					// echo '<th>';
					// 	echo "Ranking";
					// echo '</th>';
					// echo '<th>';
					// 	echo "Số chỉ tiêu";
					// echo '</th>';
					// echo '<th>';
					// 	echo "Chênh lệch điểm chuẩn";
					// echo '</th>';
					// echo '<th>';
					// 	echo "Khả năng tìm việc";
					// echo '</th>';
					// echo '<th>';
					// 	echo "Học phí";
					// echo '</th>';
					// echo '<th>';
					// 	echo "Môi trường học tập";
					// echo '</th>';
					// echo '<th>';
					// 	echo "Khoảng cách";
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
			<b><a href="index.php">HoTroTuyenSinh.com</a> gợi ý thí sinh nên chọn Tổ chức Đào tạo có mức độ phù hợp cao nhất.</b>
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