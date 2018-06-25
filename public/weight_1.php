<table>
    <?php
    include "Properties.php";
    $dbhost = Properties::DATABASE['host'];
    $dbuser = Properties::DATABASE['username'];
    $dbpass = Properties::DATABASE['password'];
    $db = Properties::DATABASE['name'];
    // $db_table = "thuoc_tinh_bai_toan_1";

    $connect = mysqli_connect($dbhost, $dbuser, $dbpass, $db)
    or die("Không thể kết nối đến cơ sở dữ liệu!");
    mysqli_set_charset($connect, "utf8");

    $attribute_list = "SELECT * FROM thuoc_tinh_bai_toan_1";
    $data = mysqli_query($connect, $attribute_list);

    while ($row = mysqli_fetch_assoc($data)) {
        # code...
        echo '<tr>';
        echo '<td>';
        echo $row["Ten_Thuoc_Tinh"] . ' :';
        echo '</td>';
        echo '<td>';
        echo '<select name="attribute_' . $row["ID"] . '">';
        echo '<option value="anh_huong_rat_lon">-- Ảnh hưởng rất lớn --</option>';
        echo '<option value="anh_huong_kha_lon">-- Ảnh hưởng khá lớn --</option>';
        echo '<option value="anh_huong_it">-- Ảnh hưởng ít --</option>';
        echo '<option value="khong_anh_huong">-- Không ảnh hưởng --</option>';
        echo '</select>';
        echo '</td>';
        echo '</tr>';
    }

    mysqli_close($connect);
    ?>
</table>