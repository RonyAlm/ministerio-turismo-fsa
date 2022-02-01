<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Ministerio de Turismo</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="vistas/recursos/https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="vistas/recursos/plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="vistas/recursos/dist/css/adminlte.min.css">

  <!--<link rel="stylesheet" href="vistas/modulos/estilos.css">-->
  <style media="screen">
    body {
      margin: 0;
      padding: 0;
      background: linear-gradient(to right, #61ba6d, #83c331);
      font-family: sans-serif;
    }
  </style>
</head>

<body class="hold-transition login-page">
  <div class="login-box">
    <div class="login-logo login-card-body">
      <b>Ministerio de</b>
    </div>
    <!-- /.login-logo -->
    <div class="card">
      <div class="card-body login-card-body">
        <p class="login-box-msg">Ingresar Usuario y Contraseña</p>

        <form action="?controlador_login.php" method="POST">
          <div class="input-group mb-3">
            <input type="text" class="form-control" placeholder="Usuario" name="usuario">
            <div class="input-group-append">
              <div class="input-group-text">
                <span class="fas fa-user"></span>
              </div>
            </div>
          </div>
          <div class="input-group mb-3">
            <input type="password" class="form-control" placeholder="Contraseña" name="contraseña">
            <div class="input-group-append">
              <div class="input-group-text">
                <span class="fas fa-lock"></span>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-4">
            </div>
            <!-- /.col -->
            <div class="col-8">
              <button type="submit" value="login" name="btnLogin" class="btn btn-primary btn-block">Iniciar Sesión</button>
            </div>
            <!-- /.col -->
          </div>
        </form>

      </div>
      <!-- /.login-card-body -->
    </div>
  </div>
  <!-- /.login-box -->

  <script src="vistas/recursos/plugins/jquery/jquery.min.js"></script>
  <!-- Bootstrap 4 -->
  <script src="vistas/recursos/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- AdminLTE App -->
  <script src="vistas/recursos/dist/js/adminlte.min.js"></script>
</body>

</html>