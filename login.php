<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Admin - Login</title>

    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="assets/css/custom.css" rel="stylesheet">

  </head>

  <body class="bg-dark">

    <?php 
    if(isset($_GET['pesan'])){
      if($_GET['pesan'] == "gagal"){
        echo "<div style='margin-bottom:-55px' class='alert alert-danger' role='alert'><span class='glyphicon glyphicon-warning-sign'></span>  Login Gagal !! Username dan Password Salah !!</div>";
      }
    }
    ?>

    <div class="container">
      <div class="card card-login mx-auto mt-5">
        <div class="card-header">Login</div>
        <div class="card-body">
          <form action="login_action.php" method="POST">

            <div class="form-group">
              <div class="form-label-group">
                <input type="text" name="username" id="inputUsername" class="form-control" placeholder="username" required="required" autofocus="autofocus">
                <label for="inputUsername">Username</label>
              </div>
            </div>

            <div class="form-group">
              <div class="form-label-group">
                <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password" required="required">
                <label for="inputPassword">Password</label>
              </div>
            </div>
            <button class="btn btn-primary btn-block">Login</button>
            
          </form>
        </div>
      </div>
    </div>

  </body>
</html>
