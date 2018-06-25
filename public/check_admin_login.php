<?php
include "Properties.php";

$dbhost = Properties::DATABASE['host'];
$dbuser = Properties::DATABASE['username'];
$dbpass = Properties::DATABASE['password'];
$db = Properties::DATABASE['name'];
$admin_table = "admin";

$admin_connect = mysqli_connect($dbhost, $dbuser, $dbpass, $db) or die("Không thể kết nối với cơ sở dữ liệu");

$admin_name = $_POST['admin_name'];
$admin_password = $_POST['admin_password'];

$sql = "SELECT * FROM admin WHERE admin_name='$admin_name' and admin_password='$admin_password'";
$result = mysqli_query($admin_connect, $sql);
$count = mysqli_num_rows($result);

if ($count == 1) {
    header("location:school_infor_manage.php");
} else {
    echo "Sai tên đăng nhập hoặc mật khẩu";
}

mysqli_close($admin_connect);
?>