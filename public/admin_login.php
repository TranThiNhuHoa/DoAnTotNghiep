<!DOCTYPE html>
<html>
<head>
	<title>Quản trị viên đăng nhập</title>
	<style type="text/css">
		table {
			border: 1px solid #52D017;
			border-radius: 5px;
			width: 300px;
			height: 150px;
			text-align: center;
		}
	</style>
</head>
<body>
	<form action="check_admin_login.php" method="POST" name="">
		<table align="center" valign="middle">
			<th colspan="2"><br>ADMIN LOGIN</th>
			<tr>
				<td>Amin:</td>
				<td><input type="text" name="admin_name"></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type="password" name="admin_password"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" name="admin_submit" value="Login"></td>
			</tr>
			<br>
		</table>
	</form>
</body>
</html>