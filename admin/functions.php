<?php
$con=mysqli_connect("localhost","root","root","tugasweb2");


//mengambil table di ibaratkan lemari pakaian
function query($query) 
{
	global $con;

	$result=mysqli_query($con,$query);
	$rows=[];
	while($row=mysqli_fetch_assoc($result))
	{

		$rows[]=$row;
	}
	return $rows;
}

function login() {
	global $con;	
	session_start();

	$uname=$_POST['username'];
	$pass=sha1($_POST['password']);

	$query = mysqli_query("SELECT * FROM users WHERE user_username='$uname' AND user_password='$pass'")or die(mysqli_error());

	if(mysqli_num_rows($query)==1){
		$_SESSION['username']=$uname;
		header("location:admin/index.php");
	}else{
		header("location:index.php?pesan=gagal")or die(mysql_error());
	// mysql_error();
	}

}


//mengambil isi table / ibarat pakaiannnya
// mysqli_fetch_row
// mysqli_fetch_assoc
// mysqli_fetch_array
// mysqli_fetch_object
?>