<?php 
session_start();
include 'admin/config.php';

$uname=$_POST['username'];
$pass=sha1($_POST['password']);

$query = mysql_query("SELECT * FROM users WHERE user_username='$uname' AND user_password='$pass'")or die(mysql_error());

if(mysql_num_rows($query)==1){
	$_SESSION['username']=$uname;
	header("location:admin/index.php");
} else {
	header("location:login.php?pesan=gagal")or die(mysql_error());
}

?>