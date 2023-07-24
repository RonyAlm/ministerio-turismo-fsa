<?php

session_start();
// include_once "controladores/controlador_login.php";


include_once("conexion.php");


$conexion = BD::crearInstancia();


if (!isset($_SESSION['id'])) {
  header("Location: index.php");
}
$id = $_SESSION['id'];
$usuario = $_SESSION['usuarios'];
$rol_id = $_SESSION['rol_id'];
// $tablas_acceso = $_SESSION['tablas_acceso'];

$nombre = $_SESSION['nombre_persona'];
$apellido = $_SESSION['apellido_persona'];

if ($nombre) {
  $nombre = 1;
  /*---------------SE ACTUALIZA -------------------*/

  $sqlDireccion = $conexion->prepare("UPDATE `personales` SET `rela_tipo_estado`=$nombre
                                                WHERE rela_persona = $id_persona");
  $sqlDireccion->execute();
  // print_r($sqlDireccion);
} else {
  $nombre = 0;
  // echo "mi nombre es otro " . $nombre;
}


?>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="es">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Ministerio de Turismo</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="vistas/recursos/plugins/fontawesome-free/css/all.min.css">
  <!-- Select2 -->
  <link rel="stylesheet" href="vistas/recursos/plugins/select2/css/select2.min.css">
  <link rel="stylesheet" href="vistas/recursos/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="vistas/recursos/dist/css/adminlte.min.css">

  <!-- DataTables -->
  <link rel="stylesheet" href="vistas/recursos/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="vistas/recursos/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
  <link rel="stylesheet" href="vistas/recursos/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
  <!-- SweetAlert2 -->
  <link rel="stylesheet" href="vistas/recursos/plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css">
  <!-- BS Stepper -->
  <link rel="stylesheet" href="vistas/recursos/plugins/bs-stepper/css/bs-stepper.min.css">
  <!-- fullCalendar -->
  <link rel="stylesheet" href="vistas/recursos/plugins/fullcalendar1/lib/main.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
  <!-- style transporte -->
  <link rel="stylesheet" href="vistas/recursos/dist/transporte.css">
  <link rel="stylesheet" href="vistas/recursos/dist/css/styles.css">
  <!-- Favicon -->
  <link rel="icon" href="vistas/recursos/dist/img/favicon.png">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.1/css/all.css">




  <style>
    .resaltar {
      background-color: yellow;
      color: black;
    }
  </style>


  <link rel="stylesheet" href="vistas/recursos/dist/table.css">

  <style type="text/css">
    #tblList_info {
      margin-bottom: 0.7rem;
    }

    #example1_wrapper {
      margin-top: 0.5rem !important;
    }

    #example1_filter {
      margin-top: -2.1rem !important;
    }

    #example1_paginate {
      margin-bottom: 1rem !important;
      margin-top: -2rem !important;
    }



    /* #tblList_filter label input{
      width: 90%;
    }
    #tblList_filter label i{
      margin-right: 10px;
    } */

    div.dataTables_wrapper div.dataTables_filter input {
      margin-left: 0;
      display: inline-block;
      width: auto;
      border-left: 0px solid #ccc;
      border-radius: 1px 4px 4px 1px;
    }

    .badge {
      text-align: center;
      margin-left: 3rem;
      margin-right: 3rem;
      margin-top: 0.3rem;
    }

    .sorting_1 {
      box-shadow: inset 0 0 0 9999px rgba(0, 0, 0, 0.054) !important;
      min-width: 11rem;
    }

    .tblInfo {
      margin-bottom: 0 !important;
    }

    .tblInfo tr td {
      text-align: center;
    }

    .nav-pills .nav-link.active,
    .nav-pills .show>.nav-link {
      color: #fff;
      background-color: var(--success) !important;
    }

    .nav-pills .nav-link:not(.active):hover {
      color: var(--success) !important;
    }
  </style>

</head>

<body class="hold-transition sidebar-mini layout-fixed">
  <div class="wrapper">

    <!-- Navbar -->
    <nav class="main-header navbar navbar-expand navbar-dark navbar-success">
      <!-- Left navbar links -->
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
        </li>
        <!-- <li class="nav-item d-none d-sm-inline-block">
              <a href="?controlador=paginas&accion=inicio" class="nav-link">Inicio</a>
          </li> -->
      </ul>
      <!-- Right navbar links -->
      <ul class="navbar-nav ml-auto">
        <!-- Navbar Search -->
        <li class="nav-item">
          <a class="nav-link" data-widget="navbar-search" href="#" role="button">
            <i class="fas fa-search"></i>
          </a>
          <div class="navbar-search-block">
            <form class="form-inline">
              <div class="input-group input-group-sm">
                <input class="form-control form-control-navbar" type="search" placeholder="Buscar" aria-label="Search">
                <div class="input-group-append">
                  <button class="btn btn-navbar" type="submit">
                    <i class="fas fa-search"></i>
                  </button>
                  <button class="btn btn-navbar" type="button" data-widget="navbar-search">
                    <i class="fas fa-times"></i>
                  </button>
                </div>
              </div>
            </form>
          </div>
        </li>

        <!-- Notifications Dropdown Menu -->
        <li class="nav-item dropdown">
          <a class="nav-link" data-toggle="dropdown" href="#">
            <i class="fa fa-cog"></i>
          </a>
          <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
            <div class="dropdown-divider"></div>
            <a href="#" class="dropdown-item">
              <i class="fas fa-user mr-2"></i>Mi Perfil<?php
                                                        // echo "mi nombre es " . $tablas_acceso;
                                                        ?>
            </a>
            <div class="dropdown-divider"></div>
            <a href="vistas/logout.php" class="dropdown-item">
              <i class="fas fa-sign-out-alt mr-2"></i> Cerrar Sesión
            </a>
          </div>
        </li>
        <li class="nav-item">
          <a class="nav-link" data-widget="fullscreen" href="#" role="button">
            <i class="fas fa-expand-arrows-alt"></i>
          </a>
        </li>
      </ul>

    </nav>
    <!-- /.navbar -->


    <div class="content-wrapper">

      <!-- RUTEADOR -->
      <section class="content">
        <div class="container-fluid">
          <div class="row">
            <div class="col-12">
              <!-- Salto de linea -->
              <!-- <br> -->
              <?php include_once("ruteador.php"); ?>
            </div>

          </div>
          <!-- /.row -->
        </div><!-- /.container-fluid -->
      </section>
      <!-- FIN RUTEADOR -->
    </div>


    <aside class="main-sidebar sidebar-dark-success elevation-4">
      <!-- Brand Logo -->
      <a href="?controlador=paginas&accion=inicio" class="brand-link">
        <i class="far fa-circle nav-icon" style="margin-left: 1rem; color: transparent;"></i>
        <img class="brand-text" src="vistas/recursos/dist/img/M-Turismo-verde.png" alt="" style="width: 60%;">
      </a>

      <!-- Sidebar -->
      <div class="sidebar">
        <!-- Sidebar user panel (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
          <div class="image">
            <img src="vistas/recursos/dist/img/user-2.png" class="img-circle elevation-2" alt="Sin imagen">
            <!-- <i class="nav-icon fas fa-user mr-2"></i> -->
          </div>
          <div class="info">
            <a href="#" class="d-block"><?php echo "$usuario" ?></a>
            <!-- <h5 style="color: #ccc;">Template 3</h5> -->
          </div>
        </div>

        <!-- SidebarSearch Form -->
        <div class="form-inline">
          <div class="input-group" data-widget="sidebar-search">
            <input class="form-control form-control-sidebar" type="search" placeholder="Buscar" aria-label="Search">
            <div class="input-group-append">
              <button class="btn btn-sidebar">
                <i class="fas fa-search fa-fw"></i>
              </button>
            </div>
          </div>
        </div>

        <!-- Sidebar Menu -->
        <nav class="mt-2 mb-3">
          <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">

            <li class="nav-item">
              <a href="?controlador=paginas&accion=inicio" class="nav-link 
                  <?= (!isset($_GET['controlador']) || $_GET['controlador'] == 'paginas' && $_GET['accion'] == 'inicio') ? 'active' : '' ?>">
                <i class="nav-icon fas fa-home"></i>
                <p>
                  Inicio
                </p>
              </a>
            </li>

            <!-- REGISTRO ADMIN -->
            <?php if ($rol_id == 1 or $rol_id == 3) : ?>

              <li class="nav-item 
                <?= (isset($_GET['controlador']) && ($_GET['controlador'] == 'alojamientos' || $_GET['controlador'] == 'agencias' ||
                  $_GET['controlador'] == 'prestadores' || $_GET['controlador'] == 'referentes' || $_GET['controlador'] == 'servigenerales' || $_GET['controlador'] == 'gastronomia')) ? 'menu-open' : '' ?>">
                <a href="#" class="nav-link <?= (isset($_GET['controlador']) && ($_GET['controlador'] == 'alojamientos' ||  $_GET['controlador'] == 'agencias' ||
                                              $_GET['controlador'] == 'prestadores' || $_GET['controlador'] == 'referentes' || $_GET['controlador'] == 'servigenerales' || $_GET['controlador'] == 'gastronomia' || $_GET['controlador'] == 'salones' || $_GET['controlador'] == 'transportes')) ? 'active' : '' ?>">
                  <i class="nav-icon fas fa-edit"></i>
                  <p>
                    Registro
                    <i class="right fas fa-angle-left"></i>
                  </p>
                </a>
                <ul class="nav nav-treeview">

                  <li class="nav-item">
                    <a href="?controlador=alojamientos&accion=inicio" class="nav-link 
                    <?= (isset($_GET['controlador']) && $_GET['controlador'] == 'alojamientos') ? 'active' : '' ?>">
                      <i class="far fa-circle nav-icon"></i>
                      <p>Alojamientos</p>
                    </a>
                  </li>

                  <li class="nav-item">
                    <a href="?controlador=agencias&accion=inicio" class="nav-link 
                    <?= (isset($_GET['controlador']) && $_GET['controlador'] == 'agencias') ? 'active' : '' ?>">
                      <i class="far fa-circle nav-icon"></i>
                      <p>Agencias</p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="?controlador=prestadores&accion=inicio" class="nav-link 
                    <?= (isset($_GET['controlador']) && $_GET['controlador'] == 'prestadores') ? 'active' : '' ?>">
                      <i class="far fa-circle nav-icon"></i>
                      <p>Prestadores</p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="?controlador=referentes&accion=inicio" class="nav-link 
                    <?= (isset($_GET['controlador']) && $_GET['controlador'] == 'referentes') ? 'active' : '' ?>">
                      <i class="far fa-circle nav-icon"></i>
                      <p>Referentes municipales</p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="?controlador=servigenerales&accion=inicio" class="nav-link 
                    <?= (isset($_GET['controlador']) && $_GET['controlador'] == 'servigenerales') ? 'active' : '' ?>">
                      <i class="far fa-circle nav-icon"></i>
                      <p>Servicios Generales</p>
                    </a>
                  </li>

                  <li class="nav-item">
                    <a href="?controlador=gastronomia&accion=inicio" class="nav-link 
                    <?= (isset($_GET['controlador']) && $_GET['controlador'] == 'gastronomia') ? 'active' : '' ?>">
                      <i class="far fa-circle nav-icon"></i>
                      <p>Gastronomías</p>
                    </a>
                  </li>

                  <li class="nav-item">
                    <a href="?controlador=salones&accion=inicio" class="nav-link 
                    <?= (isset($_GET['controlador']) && $_GET['controlador'] == 'salones') ? 'active' : '' ?>">
                      <i class="far fa-circle nav-icon"></i>
                      <p>Salones</p>
                    </a>
                  </li>

                  <li class="nav-item">
                    <a href="?controlador=transportes&accion=inicio" class="nav-link 
                    <?= (isset($_GET['controlador']) && $_GET['controlador'] == 'transportes') ? 'active' : '' ?>">
                      <i class="far fa-circle nav-icon"></i>
                      <p>Transportes</p>
                    </a>
                  </li>

                  <li class="nav-item">
                    <a href="?controlador=museos&accion=inicio" class="nav-link 
                    <?= (isset($_GET['controlador']) && $_GET['controlador'] == 'museos') ? 'active' : '' ?>">
                      <i class="far fa-circle nav-icon"></i>
                      <p>Museos</p>
                    </a>
                  </li>
                </ul>
              </li>
              <!-- REGISTRO PERSONAL SOLO ADMIN POR EL MOMENTO -->
              <?php if ($usuario == "admin" and $usuario == "karla") { ?>
                <li class="nav-item <?= (isset($_GET['controlador']) && ($_GET['controlador'] == 'personal')) ? 'menu-open' : '' ?>">
                  <a href="#" class="nav-link <?= (isset($_GET['controlador']) && ($_GET['controlador'] == 'personal')) ? 'active' : '' ?>">
                    <i class="nav-icon fas fa-table"></i>
                    <p>
                      Personal
                      <i class="right fas fa-angle-left"></i>
                    </p>
                  </a>
                  <ul class="nav nav-treeview">
                    <li class="nav-item">
                      <a href="?controlador=personal&accion=inicio" class="nav-link 
                      <?= (isset($_GET['controlador']) && ($_GET['controlador'] == 'personal')) ? 'active' : '' ?>">
                        <i class="far fa-circle nav-icon"></i>
                        <p>Registro</p>
                      </a>
                    </li>

                    <li class="nav-item">
                      <a href="#" class="nav-link">
                        <i class="far fa-circle nav-icon"></i>
                        <p>
                          Asistencias
                          <i class="right fas fa-angle-left"></i>
                        </p>
                      </a>
                      <ul class="nav nav-treeview" style="display: none;">
                        <li class="nav-item">
                          <a href="#" class="nav-link">
                            <i class="far fa-dot-circle nav-icon"></i>
                            <p>Administración</p>
                          </a>
                        </li>
                        <li class="nav-item">
                          <a href="?controlador=asistencias&accion=inicio" class="nav-link 
                          <?= (isset($_GET['controlador']) && ($_GET['controlador'] == 'asistencias')) ? '' : '' ?>">
                            <i class="far fa-dot-circle nav-icon"></i>
                            <p>Central</p>
                          </a>
                        </li>
                        <li class="nav-item">
                          <a href="#" class="nav-link">
                            <i class="far fa-dot-circle nav-icon"></i>
                            <p>Logística</p>
                          </a>
                        </li>
                        <li class="nav-item">
                          <a href="#" class="nav-link">
                            <i class="far fa-dot-circle nav-icon"></i>
                            <p>Terminal</p>
                          </a>
                        </li>
                      </ul>
                    </li>

                  </ul>

                </li>
              <?php } ?>

              <li class="nav-item">
                <a href="?controlador=notas&accion=inicio" class="nav-link 
                    <?= (isset($_GET['controlador']) && $_GET['controlador'] == 'notas') ? 'active' : '' ?>">
                  <i class="far fa-file-alt nav-icon"></i>
                  <p>Notas</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="?controlador=cursos_capacitaciones&accion=inicio" class="nav-link 
                    <?= (isset($_GET['controlador']) && $_GET['controlador'] == 'cursos_capacitaciones') ? 'active' : '' ?>">
                  <i class="far fa-file-alt nav-icon"></i>
                  <p>Cursos y capacitaciones</p>
                </a>
              </li>

            <?php endif; ?>

            <!-- VISUALIZACION -->
            <?php if ($rol_id == 2) : ?>

              <li class="nav-item">
                <a href="?controlador=alojamientos&accion=inicio" class="nav-link <?= (isset($_GET['controlador']) && $_GET['controlador'] == 'alojamientos') ? 'active' : '' ?>">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Alojamientos</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="?controlador=agencias&accion=inicio" class="nav-link <?= (isset($_GET['controlador']) && $_GET['controlador'] == 'agencias') ? 'active' : '' ?>">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Agencias</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="?controlador=prestadores&accion=inicio" class="nav-link <?= (isset($_GET['controlador']) && $_GET['controlador'] == 'prestadores') ? 'active' : '' ?>">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Prestadores</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="?controlador=referentes&accion=inicio" class="nav-link <?= (isset($_GET['controlador']) && $_GET['controlador'] == 'referentes') ? 'active' : '' ?>">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Referentes municipales</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="?controlador=servigenerales&accion=inicio" class="nav-link <?= (isset($_GET['controlador']) && $_GET['controlador'] == 'servigenerales') ? 'active' : '' ?>">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Servicios Generales</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="?controlador=gastronomia&accion=inicio" class="nav-link <?= (isset($_GET['controlador']) && $_GET['controlador'] == 'gastronomia') ? 'active' : '' ?>">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Gastronomía</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="?controlador=salones&accion=inicio" class="nav-link <?= (isset($_GET['controlador']) && $_GET['controlador'] == 'salones') ? 'active' : '' ?>">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Salones</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="?controlador=transportes&accion=inicio" class="nav-link <?= (isset($_GET['controlador']) && $_GET['controlador'] == 'transportes') ? 'active' : '' ?>">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Transportes</p>
                </a>
              </li>

              <li class="nav-item">
                <a href="?controlador=museos&accion=inicio" class="nav-link <?= (isset($_GET['controlador']) && $_GET['controlador'] == 'museos') ? 'active' : '' ?>">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Museos</p>
                </a>
              </li>

            <?php endif; ?>

            <!-- CALENDARIO -->
            <?php if ($rol_id == 1 or $rol_id == 2 or $rol_id == 3) { ?>
              <li class="nav-item <?= (isset($_GET['controlador']) && ($_GET['controlador'] == 'calendario')) ? 'menu-open' : '' ?>">
                <a href="#" class="nav-link <?= (isset($_GET['controlador']) && ($_GET['controlador'] == 'calendario')) ? 'active' : '' ?>">
                  <i class="nav-icon far fa-calendar-alt"></i>
                  <p>
                    Calendario
                    <i class="fas fa-angle-left right"></i>
                  </p>
                </a>
                <ul class="nav nav-treeview">
                  <li class="nav-item">
                    <a href="?controlador=calendario&accion=inicio" class="nav-link 
                    <?= (isset($_GET['controlador']) && $_GET['controlador'] == 'calendario') ? 'active' : '' ?>">
                      <i class="far fa-circle nav-icon"></i>
                      <p>Calendario de Eventos</p>
                    </a>
                  </li>
                  <!-- <li class="nav-item">
                    <a href="pages/tables/data.html" class="nav-link">
                      <i class="far fa-circle nav-icon"></i>
                      <p>Calendario Deportivo</p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="pages/tables/jsgrid.html" class="nav-link">
                      <i class="far fa-circle nav-icon"></i>
                      <p>Calendario Cultural y Religioso</p>
                    </a>
                  </li> -->
                </ul>
              </li>
            <?php } ?>

            <!-- FESTIVALES -->
            <?php if ($rol_id == 1 or $rol_id == 3 and $usuario == "admin") { ?>
              <li class="nav-item <?= (isset($_GET['controlador']) && ($_GET['controlador'] == 'festivales')) ? 'menu-open' : '' ?>">
                <a href="#" class="nav-link <?= (isset($_GET['controlador']) && ($_GET['controlador'] == 'festivales')) ? 'active' : '' ?>">
                  <i class="nav-icon fas fa-columns"></i>
                  <p>
                    Festivales y eventos
                    <i class="right fas fa-angle-left"></i>
                  </p>
                </a>
                <ul class="nav nav-treeview">
                  <li class="nav-item">
                    <a href="?controlador=festivales&accion=inicio" class="nav-link 
                    <?= (isset($_GET['controlador']) && ($_GET['controlador'] == 'festivales')) ? 'active' : '' ?>">
                      <i class="far fa-circle nav-icon"></i>
                      <p>Registro</p>
                    </a>
                  </li>
                </ul>
              </li>
            <?php } ?>

            <!-- TRANSPORTE -->
            <?php if ($rol_id == 1 or $rol_id == 3 and $usuario == "admin") { ?>
              <li class="nav-item <?= (isset($_GET['controlador']) && ($_GET['controlador'] == 'transporte')) ? 'menu-open' : '' ?>">
                <a href="#" class="nav-link <?= (isset($_GET['controlador']) && ($_GET['controlador'] == 'transporte')) ? 'active' : '' ?>">
                  <i class="nav-icon fas fa-table"></i>
                  <p>
                    Transporte
                    <i class="right fas fa-angle-left"></i>
                  </p>
                </a>
                <ul class="nav nav-treeview">
                  <li class="nav-item">
                    <a href="?controlador=transporte&accion=inicio" class="nav-link 
                    <?= (isset($_GET['controlador']) && ($_GET['controlador'] == 'transporte')) ? 'active' : '' ?>">
                      <i class="far fa-circle nav-icon"></i>
                      <p>Colectivos</p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="?controlador=vuelos&accion=inicio" class="nav-link">
                      <i class="far fa-circle nav-icon"></i>
                      <p>Aviones</p>
                    </a>
                  </li>

                </ul>
              </li>
            <?php } ?>

            <!-- Organismos -->
            <?php if ($rol_id == 1 or $rol_id == 3 and $usuario == "admin") { ?>
              <li class="nav-item <?= (isset($_GET['controlador']) && ($_GET['controlador'] == 'organismos')) ? 'menu-open' : '' ?>">
                <a href="#" class="nav-link <?= (isset($_GET['controlador']) && ($_GET['controlador'] == 'organismos')) ? 'active' : '' ?>">
                  <i class="nav-icon fas fa-table"></i>
                  <p>
                    Organismos
                    <i class="right fas fa-angle-left"></i>
                  </p>
                </a>
                <ul class="nav nav-treeview">
                  <li class="nav-item">
                    <a href="?controlador=organismos&accion=inicio" class="nav-link 
                    <?= (isset($_GET['controlador']) && ($_GET['controlador'] == 'organismos')) ? 'active' : '' ?>">
                      <i class="far fa-circle nav-icon"></i>
                      <p>Colegios - Asociaciones</p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="?controlador=institucion&accion=inicio" class="nav-link 
                    <?= (isset($_GET['controlador']) && ($_GET['controlador'] == 'institucion')) ? '' : '' ?>">
                      <i class="far fa-circle nav-icon"></i>
                      <p>Organismos - Instituciones</p>
                    </a>
                  </li>

                </ul>
              </li>
            <?php } ?>

          </ul>
        </nav>

      </div>
      <!-- /.sidebar -->
    </aside>

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
      <!-- Control sidebar content goes here -->
      <div class="p-3">
        <h5>Title</h5>
        <p>Sidebar content</p>
      </div>
    </aside>
    <!-- /.control-sidebar -->


  </div>
  <!-- ./wrapper -->

  <footer class="main-footer">
    <strong> &copy; </strong>
    <i id="fechaFooter"></i>
    <script>
      const currentTime = () => {

        const fechaF = document.getElementById("fechaFooter");
        let date = new Date();
        let hh = date.getHours();
        let mm = date.getMinutes();
        let ss = date.getSeconds();
        let dd = date.getDate();
        let mes = date.getMonth() + 1;

        hh = hh < 10 ? `0${hh}` : hh;
        mm = mm < 10 ? `0${mm}` : mm;
        ss = ss < 10 ? `0${ss}` : ss;
        dd = dd < 10 ? `0${dd}` : dd;
        mes = mes < 10 ? `0${mes}` : mes;

        let fecha = dd + '-' + mes + '-' + date.getFullYear();
        let time = `${fecha}  ${hh}:${mm}:${ss}`;
        fechaF.innerText = time;



      };
      currentTime();

      setInterval(currentTime, 1000);
    </script>
    <div class="float-right d-none d-sm-inline-block">
      Ministerio de Turismo Formosa
    </div>
  </footer>

  <!-- MODAL DEL EVENTO CALENDARIO -->

  <div class="modal fade" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header bg-success">
          <h4 class="modal-title" id="titulo"></h4>
          <button type="button" class="btn btn-close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <form id="formularioModal">
          <div class="modal-body">
            <div class="form-floating mb-3">
              <input type="hidden" id="id" name="id">
              <label for="title" class="form-label">Evento</label>
              <input type="text" class="form-control" name="title" id="title">
            </div>

            <div class="form-floating mb-3">
              <label for="start" class="form-label">Fecha Inicio</label>
              <input type="date" class="form-control" name="start" id="start">
            </div>

            <div class="form-floating mb-3">
              <label for="fecha_fin" class="form-label">Fecha fin</label>
              <input type="date" class="form-control" name="fecha_fin" id="fecha_fin">
            </div>

            <div class="form-floating mb-3">
              <label for="descripcion" class="form-label">Descripción</label>
              <!-- <textarea name="descripcion" id="descripcion" cols="62" rows="5"></textarea> -->
              <input type="text" class="form-control" name="descripcion" id="descripcion">
            </div>

            <div class="form-floating mb-3">
              <label for="color" class="form-label">Color</label>
              <input type="color" class="form-control" name="color" id="color">
            </div>

          </div>

          <div class="modal-footer">

            <button type="submit" class="btn btn-success" id="btnAccion">Agregar</button>

            <button type="button" id="btnEliminar" class="btn btn-danger">Borrar</button>

            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>

          </div>
        </form>

      </div>
      <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
  </div>
  <!-- /.modal -->

  <!-- REQUIRED SCRIPTS -->

  <!-- jQuery -->
  <script src="vistas/recursos/plugins/jquery/jquery.min.js"></script>
  <!-- Bootstrap 4 -->
  <script src="vistas/recursos/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- AdminLTE App -->
  <script src="vistas/recursos/dist/js/adminlte.min.js"></script>
  <!-- Select2 -->
  <script src="vistas/recursos/plugins/select2/js/select2.full.min.js"></script>
  <!-- DataTables  & Plugins -->
  <script src="vistas/recursos/plugins/datatables/jquery.dataTables.js"></script>
  <script src="vistas/recursos/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
  <script src="vistas/recursos/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
  <script src="vistas/recursos/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
  <script src="vistas/recursos/plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
  <script src="vistas/recursos/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
  <script src="vistas/recursos/plugins/jszip/jszip.min.js"></script>
  <script src="vistas/recursos/plugins/pdfmake/pdfmake.min.js"></script>
  <script src="vistas/recursos/plugins/pdfmake/vfs_fonts.js"></script>
  <script src="vistas/recursos/plugins/datatables-buttons/js/buttons.html5.min.js"></script>
  <script src="vistas/recursos/plugins/datatables-buttons/js/buttons.print.min.js"></script>
  <script src="vistas/recursos/plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
  <!-- BS-Stepper -->
  <script src="vistas/recursos/plugins/bs-stepper/js/bs-stepper.min.js"></script>
  <!-- SweetAlert2 -->
  <script src="vistas/recursos/plugins/sweetalert2/sweetalert2.min.js"></script>

  <!-- <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> -->

  <!-- fullCalendar 5.10.1 -->
  <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.js"></script>
  <script src="vistas/recursos/script/calendario.js"></script>
  <!-- Ekko Lightbox -->
  <script src="vistas/recursos/plugins/ekko-lightbox/ekko-lightbox.min.js"></script>
  <!-- Filterizr-->
  <script src="vistas/recursos/plugins/filterizr/jquery.filterizr.min.js"></script>

  <!-- jquery-validation -->
  <script src="vistas/recursos/plugins/jquery-validation/jquery.validate.min.js"></script>
  <script src="vistas/recursos/plugins/jquery-validation/additional-methods.min.js"></script>
  <script src="vistas/recursos/script/validaciones_hoteles.js"></script>
  <script src="vistas/recursos/script/validacion_museo.js"></script>
  <script src="vistas/recursos/script/validacion_prestador.js"></script>
  <script src="vistas/recursos/script/validacion_personal.js"></script>
  <script src="vistas/recursos/script/validacionesRequire.js"></script>
  <script src="vistas/recursos/script/filas_contacto.js"></script>
  <script src="vistas/recursos/script/filas_transporte.js"></script>
  <script src="vistas/recursos/script/filas_licencias.js"></script>
  <script src="vistas/recursos/script/gallery.js"></script>

  <script src="vistas/recursos/script/selectDinamicoLiAr.js"></script>

  <script src="vistas/recursos/script/traerLocalidades.js"></script>

  <script src="vistas/recursos/script/formularios.js"></script>

  <script src="vistas/recursos/script/sweetalertEliminar.js"></script>
  <script src="vistas/recursos/script/personalSiguiente.js"></script>
  <script src="vistas/recursos/script/agregarbtntarea.js"></script>
  <script src="vistas/recursos/script/checkboxInicio.js"></script>
  <script src="vistas/recursos/script/contraseñaTablas.js"></script>
  <script src="vistas/recursos/script/cursosbotonpresente.js"></script>
  <script src="/admin/vistas/recursos/script/modal.js"></script>


  <script>
    $(function() {
      $("#articulo").hide();
      $("#customCheckbox5").change(function() {
        if (!$(this).prop("checked")) {
          $("#elemento").hide();
        } else {
          $("#elemento").show();
        }
      });
      $("#customCheckbox6").change(function() {
        if (!$(this).prop("checked")) {
          $("#articulo").hide();
        } else {
          $("#articulo").show();
        }
      });
    });


    $(function() {

      // Clona la fila oculta que tiene los campos base, y la agrega al final de la tabla
      $("#adicional").on('click', function() {
        $("#tabla tbody tr:eq(0)").clone().removeClass('fila-fija').appendTo("#tabla");
      });

      // Evento que selecciona la fila y la elimina 
      $(document).on("click", ".eliminar", function() {
        var parent = $(this).parents().get(0);
        $(parent).remove();
      });
    });
    $(function() {
      //Initialize Select2 Elements
      $('.select2').select2()

      //Initialize Select2 Elements
      $('.select2bs4').select2({
        theme: 'bootstrap4'
      });
    });

    $(function() {

      $("#tblList").DataTable({
        "responsive": true,
        "lengthChange": true,
        "autoWidth": true,
        "language": {
          "url": "vistas/recursos/plugins/datatables/Spanish.json"
        }
      });

      $("#tblAlojamiento").DataTable({
        "responsive": true,
        "lengthChange": true,
        "autoWidth": true,
        "language": {
          "url": "vistas/recursos/plugins/datatables/Spanish.json"
        },

        dom: 'Bfrtip',
        buttons: ['excel', 'pdf', 'print', 'colvis']

      }).buttons().container().appendTo('#tblAlojamiento_wrapper .col-md-6:eq(0)');

    });

    $(function() {
      $("#example1").DataTable({
        "responsive": true,
        "lengthChange": true,
        "autoWidth": true,
        "language": {
          "url": "vistas/recursos/plugins/datatables/Spanish.json"
        },
        dom: 'Bfrtip',
        buttons: ['excel', 'pdf', 'print', 'colvis'],



      }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
      $('#example2').DataTable({
        "paging": true,
        "lengthChange": false,
        "searching": false,
        "ordering": true,
        "info": true,
        "autoWidth": false,
        "responsive": true,

      });



    });

    $(function() {
      var table = $("#example123").DataTable({
        responsive: true,
        lengthChange: true,
        autoWidth: false,
        language: {
          url: "vistas/recursos/plugins/datatables/Spanish.json"
        },
        dom: 'Bfrtip',
        buttons: [{
            extend: 'excel',
            exportOptions: {
              columns: ':visible' // Exporta solo las columnas visibles
            }
          },
          {
            extend: 'pdf',
            exportOptions: {
              columns: ':visible' // Exporta solo las columnas visibles
            }
          },
          {
            extend: 'print',
            exportOptions: {
              columns: ':visible' // Exporta solo las columnas visibles
            }
          },
          {
            extend: 'colvis',
            collectionLayout: 'fixed two-column',
            postfixButtons: ['colvisRestore'],
            text: 'Columnas',
            columns: ':gt(0)', // Excluye la primera columna (índice 0) del selector de columnas
            columnText: function(dt, idx, title) {
              return (idx + 1) + ': ' + title;
            }
          }
        ]
      }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
    });
  </script>

  <!-- MODALES -->
  <!-- <?php include_once("modales/modal_ag_li_pe.php"); ?> -->
  <!-- <?php include_once("festivales/inicio.php"); ?> -->





</body>

</html>