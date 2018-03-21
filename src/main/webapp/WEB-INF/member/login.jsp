<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="/springProject/resources/common/css/main.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Login - Vali Admin</title><!-- Essential javascripts for application to work-->
    <script src="/springProject/resources/common/js/jquery-3.2.1.min.js"></script>
    <script src="/springProject/resources/common/js/popper.min.js"></script>
    <script src="/springProject/resources/common/js/bootstrap.min.js"></script>
    <script src="/springProject/resources/common/js/main.js"></script>
    <script type="text/javascript">
    </script>
  </head>
  <body>
    <section class="material-half-bg">
      <div class="cover" style="background-color:black;"></div>
    </section>
    <section class="login-content">
      <div class="logo">
        <h1>Mangus</h1>
      </div>
      <div class="login-box">
        <form class="login-form" action="/springProject/j_spring_security_check" method="post">
          <h3 class="login-head"><i class="fa fa-lg fa-fw fa-user"></i>SIGN IN</h3>
          <div class="form-group">
            <label class="control-label">ID</label>
            <input class="form-control" type="text" id="id" name="id" placeholder="ID" autofocus>
          </div>
          <div class="form-group">
            <label class="control-label">PASSWORD</label>
            <input class="form-control" type="password" id="password" name="password" placeholder="Password">
          </div>
          <div class="form-group">
            <div class="utility">
              <p class="semibold-text mb-2" style="color:black;"><a href="#" data-toggle="flip">Forgot Password ?</a></p>
            </div>
          </div>
          <div class="form-group btn-container">
            <button class="btn btn-primary btn-block"><i class="fa fa-sign-in fa-lg fa-fw"></i>SIGN IN</button>
          </div>
        </form>
      </div>
    </section>
    
  </body>
</html>