<table>
    <?php


    $dbhost = Properties::DATABASE['host'];
    $dbuser = Properties::DATABASE['username'];
    $dbpass = Properties::DATABASE['password'];
    $db = Properties::DATABASE['name'];
    // $db_table = "thuoc_tinh_bai_toan_1";

    $connect = mysqli_connect($dbhost, $dbuser, $dbpass, $db)
    or die("Không thể kết nối đến cơ sở dữ liệu!");
    mysqli_set_charset($connect, "utf8");

    $khoi_nganh_list = "SELECT * FROM khoi_nganh";
    $data = mysqli_query($connect, $khoi_nganh_list);

    while ($row = mysqli_fetch_assoc($data)) {
        # code...
        echo '<tr>';
        echo '<td>';
        echo $row["Ten_Khoi_Nganh"] . ' :';
        echo '</td>';
        echo '<td>';
        echo '<select name="khoi_nganh_' . $row["Khoi_Nganh_ID"] . '">';
        echo '<option value="cuc_ky_thich">-- Cực kỳ thích --</option>';
        echo '<option value="rat_thich">-- Rất thích --</option>';
        echo '<option value="yeu_thich">-- Yêu thích --</option>';
        echo '<option value="binh_thuong">-- Bình thường --</option>';
        echo '<option value="khong_thich">-- Không thích --</option>';
        echo '<option value="rat_khong_thich">-- Rất không thích --</option>';
        echo '</select>';
        echo '</td>';
        echo '</tr>';
    }

    mysqli_close($connect);
    ?>
</table>