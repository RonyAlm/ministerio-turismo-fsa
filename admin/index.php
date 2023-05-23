<?php

session_start();

include_once "controladores/controlador_login.php";
include_once("conexion.php");

$controlador = new ControladorLogin();

$conexion = BD::crearInstancia();

if (!isset($_REQUEST['c'])) {
  $controlador->index();
} else { // aca esta diciendo que si hay una peticion
  $accion = $_REQUEST['c']; //recuperamos la peticion
  call_user_func(array($Controller, $accion)); //pasamos al controlador la peticion $accion
}

if ($_POST) {
  $usuario = $_POST['usuario'];
  $contraseña = $_POST['contraseña'];

  $sql = "SELECT id_usuario, usuario, contraseña, rela_rol_id,rela_tablas from usuario_contra where usuario='$usuario'";

  $resultado = $conexion->prepare($sql);
  $resultado->execute(array());

  $num = $resultado->rowCount();

  $error = "";
  if ($num > 0) {

    $row = $resultado->fetch(PDO::FETCH_ASSOC);

    $id_usuario_contraseña = $row['id_usuario'];
    // echo "hola";
    // print_r($id_usuario_contraseña);

    // DESDE ESTE PUNTO LO QUE SE VA A HACER ES SACAR SI LA PERSONA ESTA ACTIVA O INACTIVA
    $sqlACTIVO = "SELECT id_persona, nombre_persona, apellido_persona FROM `persona` where rela_usuario_contra =$id_usuario_contraseña";

    $resultadoActivo = $conexion->prepare($sqlACTIVO);
    $resultadoActivo->execute(array());

    $numActivo = $resultadoActivo->rowCount();
    // FIN 
    $rowActivo = $resultadoActivo->fetch(PDO::FETCH_ASSOC); //lo que hago es sacar el usuario

    $contraseña_bd = $row['contraseña'];
    if ($contraseña_bd == $contraseña) {
      $_SESSION['id'] = $row['id_usuario'];
      $_SESSION['usuarios'] = $row['usuario'];
      $_SESSION['contraseña'] = $row['contraseña'];
      $_SESSION['rol_id'] = $row['rela_rol_id'];
      $_SESSION['tablas_acceso'] = $row['rela_tablas'];
      $_SESSION['nombre_persona'] = $rowActivo['nombre_persona'];
      $_SESSION['apellido_persona'] = $rowActivo['apellido_persona'];
      $_SESSION['id_persona'] = $rowActivo['id_persona'];

      header("Location: index2.php");
      print_r($_SESSION['tablas_acceso']);
      echo "entraste wey";
    } else {
      $error = "La contraseña no coincide";
      // echo "La contraseña no coincide";
    }
  } else {
    $error = "no existe el usuario";
  }
}

?>
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
  <link rel="stylesheet" href="../assets/css/styles.css">
  <style media="screen">
    body {
      background: #76b852;
      /* fallback for old browsers */
      background: -webkit-linear-gradient(right, #76b852, #8DC26F);
      background: -moz-linear-gradient(right, #76b852, #8DC26F);
      background: -o-linear-gradient(right, #76b852, #8DC26F);
      background: linear-gradient(to left, #76b852, #8DC26F);
      font-family: "Roboto", sans-serif;
      -webkit-font-smoothing: antialiased;
      -moz-osx-font-smoothing: grayscale;
    }

    input[type="text"],
    input[type="password"] {
      font-family: "Roboto", sans-serif;
      outline: 0;
      background: #f2f2f2;
      width: 100%;
      border: 0;
      margin: 0 0 15px;
      padding: 15px;
      box-sizing: border-box;
      font-size: 14px;
    }

    .input-group-append {
      background: #f2f2f2;
    }

    .input-group-text {
      border: none;
      background: #f2f2f2;
    }

    .col-8 {
      flex: 0 0 100%;
      max-width: 100%;
      margin-bottom: 1.5rem;
    }


    .col-8 .btn:hover,
    .col-8 .btn:focus,
    .col-8 .btn:active {
      border-color: #61ba6d !important;
    }
  </style>

</head>

<body class="hold-transition login-page">
  <div class="login-box">
    <div class="login-logo login-card-body">
      <div class="turismo-logo academy-logo">
        <a href="index.php">
          <img src="../assets/img/M-Turismo-verde.png" alt="">
        </a>
      </div>
      <!-- <b>Ministerio de Turismo</b> -->
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

        <?php if (!empty($error)) : ?>
          <p class="login-box-msg"><?= $error ?></p>
        <?php endif; ?>

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