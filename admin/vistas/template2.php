<?php
session_start();


if (!isset($_SESSION['id'])) {
  header("Location: index.php");
}

$usuario = $_SESSION['usuarios'];
$rol_id = $_SESSION['rol_id'];



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
  <!-- Theme style -->
  <link rel="stylesheet" href="vistas/recursos/dist/css/adminlte.min.css">
  <!-- Select2 -->
  <link rel="stylesheet" href="vistas/recursos/plugins/select2/css/select2.min.css">
  <link rel="stylesheet" href="vistas/recursos/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="vistas/recursos/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="vistas/recursos/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
  <link rel="stylesheet" href="vistas/recursos/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
  <!-- SweetAlert2 -->
  <link rel="stylesheet" href="vistas/recursos/plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css">
  <!-- fullCalendar -->
  <link rel="stylesheet" href="vistas/recursos/plugins/fullcalendar1/lib/main.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">



</head>

<body class="hold-transition sidebar-mini">
  <div class="wrapper">

    <!-- Navbar -->
    <nav class="main-header navbar navbar-expand navbar-white navbar-light">
      <!-- Left navbar links -->
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
        </li>
        <li class="nav-item d-none d-sm-inline-block">
          <a href="?controlador=paginas&accion=inicio" class="nav-link">Inicio</a>
        </li>
        <li class="nav-item d-none d-sm-inline-block">
          <a href="#" class="nav-link">Contacto</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link" data-toggle="dropdown" href="#">
            <i class="fa fa-cog" aria-hidden="true"></i>

          </a>
          <div class="dropdown-menu dropdown-menu-lg dropdown-right">
            <a class="dropdown-item dropdown-header" href="vistas/logout.php">Cerrar Sesión</a>
            <div class="dropdown-divider"></div>


          </div>
        </li>
      </ul>


    </nav>
    <!-- /.navbar -->

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">

      <!-- Main content -->
      <div class="content">
        <div class="container-fluid">
          <div class="row">
            <div class="col-12">
              <?php include_once("ruteador.php"); ?>
            </div>

          </div>
          <!-- /.row -->
        </div><!-- /.container-fluid -->
      </div>
      <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <aside class="main-sidebar sidebar-dark-primary elevation-4">
      <!-- Brand Logo -->
      <a href="#" class="brand-link">
        <img src="vistas/recursos/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
        <span class="brand-text font-weight-light">Ministerio de Turismo</span>
      </a>

      <!-- Sidebar -->
      <div class="sidebar">
        <!-- Sidebar user panel (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
          <div class="image">
            <!-- <img src="vistas/recursos/dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">-->
          </div>
          <div class="info">
            <a href="#" class="d-block"><?php echo "$usuario" ?></a>
          </div>
        </div>

        <!-- SidebarSearch Form -->
        <div class="form-inline">
          <div class="input-group" data-widget="sidebar-search">
            <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
            <div class="input-group-append">
              <button class="btn btn-sidebar">
                <i class="fas fa-search fa-fw"></i>
              </button>
            </div>
          </div>
        </div>

        <!-- Sidebar Menu -->
        <nav class="mt-2">
          <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
            <?php if ($rol_id == 1 or $rol_id == 2 or $rol_id == 3) { ?>

              <li class="nav-item menu-open">
                <a href="#" class="nav-link false">
                  <i class="nav-icon fas fa-tachometer-alt"></i>
                  <p>
                    Registro
                    <i class="right fas fa-angle-left"></i>
                  </p>
                </a>
                <ul class="nav nav-treeview">
                <?php }
              if ($rol_id == 1 or $rol_id == 3 or $rol_id == 2) { ?>
                  <li class="nav-item">
                    <a href="?controlador=Alojamientos&accion=inicio" class="nav-link">
                      <i class="far fa-circle nav-icon"></i>
                      <p>Alojamientos</p>
                    </a>
                  </li>
                <?php }
              if ($rol_id == 1 or $rol_id == 2 or $rol_id == 3 and $usuario == "matias") { ?>
                  <li class="nav-item">
                    <a href="?controlador=agencias&accion=inicio" class="nav-link">
                      <i class="far fa-circle nav-icon"></i>
                      <p>Agencias</p>
                    </a>
                  </li>
                <?php }
              if ($rol_id == 1 or $rol_id == 2 or $rol_id == 3 and $usuario == "matias") { ?>
                  <li class="nav-item">
                    <a href="?controlador=prestadores&accion=inicio" class="nav-link">
                      <i class="far fa-circle nav-icon"></i>
                      <p>Prestadores</p>
                    </a>
                  </li>
                <?php }
              if ($rol_id == 1 or $rol_id == 2 or $rol_id == 3 and $usuario == "matias") { ?>
                  <li class="nav-item">
                    <a href="?controlador=referentes&accion=inicio" class="nav-link">
                      <i class="far fa-circle nav-icon"></i>
                      <p>Referentes municipales</p>
                    </a>
                  </li>
                <?php }
              if ($rol_id == 1 or $rol_id == 2 or $rol_id == 3 and $usuario == "matias") { ?>
                  <li class="nav-item">
                    <a href="?controlador=servigenerales&accion=inicio" class="nav-link">
                      <i class="far fa-circle nav-icon"></i>
                      <p>Servicios Generales</p>
                    </a>
                  </li>

                </ul>
              </li>
              <!-- CALENDARIO -->
            <?php }
              if ($rol_id == 1 or $rol_id == 2 or $rol_id == 3 and $usuario == "matias") { ?>
              <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="nav-icon far fa-calendar-alt"></i>
                  <p>
                    Calendario
                    <i class="fas fa-angle-left right"></i>
                  </p>
                </a>
                <ul class="nav nav-treeview">
                  <li class="nav-item">
                    <a href="?controlador=calendario&accion=inicio" class="nav-link">
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

              <!-- CIRCUITOS TURISTICOS -->
            <?php }
              if ($rol_id == 1 or $rol_id == 2 or $rol_id == 3 and $usuario == "liz") { ?>
              <li class="nav-item">
                <a href="pages/calendar.html" class="nav-link">
                  <i class="nav-icon far fa-calendar-alt"></i>
                  <p>
                    Circuitos Turisticos
                    <i class="fas fa-angle-left right"></i>
                  </p>
                </a>
                <ul class="nav nav-treeview">
                  <li class="nav-item">
                    <a href="pages/tables/simple.html" class="nav-link">
                      <i class="far fa-circle nav-icon"></i>
                      <p>Circuito Oeste</p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="pages/tables/data.html" class="nav-link">
                      <i class="far fa-circle nav-icon"></i>
                      <p>Circuito Norte</p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="pages/tables/jsgrid.html" class="nav-link">
                      <i class="far fa-circle nav-icon"></i>
                      <p>Circuito Sur</p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="pages/tables/simple.html" class="nav-link">
                      <i class="far fa-circle nav-icon"></i>
                      <p>Circuito Formosa/Herradura</p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="pages/tables/simple.html" class="nav-link">
                      <i class="far fa-circle nav-icon"></i>
                      <p>Bañado la Estrella</p>
                    </a>
                  </li>
                </ul>
              </li>
            <?php }
              if ($rol_id == 1 or $rol_id == 2 or $rol_id == 3 and $usuario == "matias") { ?>
              <!-- TURISMO RELIGIOSO -->
            <?php }
              if ($rol_id == 1 or $rol_id == 2 or $rol_id == 3 and $usuario == "matias") { ?>
              <li class="nav-item menu-close">
                <a href="#" class="nav-link false">
                  <i class="nav-icon fas fa-tachometer-alt"></i>
                  <p>
                    Religión
                    <i class="right fas fa-angle-left"></i>
                  </p>
                </a>
                <ul class="nav nav-treeview">
                  <li class="nav-item">
                    <a href="?controlador=museos&accion=inicio" class="nav-link">
                      <i class="far fa-circle nav-icon"></i>
                      <p>Museos</p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="?controlador=agencias&accion=inicio" class="nav-link">
                      <i class="far fa-circle nav-icon"></i>
                      <p>Festividades</p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="?controlador=prestadores&accion=inicio" class="nav-link">
                      <i class="far fa-circle nav-icon"></i>
                      <p>Iglesías</p>
                    </a>
                  </li>

                </ul>
              </li>
              <!-- FESTIVALES -->
            <?php }
              if ($rol_id == 1 or $rol_id == 2 or $rol_id == 3 and $usuario == "liz") { ?>
              <li class="nav-item menu-close">
                <a href="#" class="nav-link false">
                  <i class="nav-icon fas fa-tachometer-alt"></i>
                  <p>
                    Festivales
                    <i class="right fas fa-angle-left"></i>
                  </p>
                </a>
                <ul class="nav nav-treeview">
                  <li class="nav-item">
                    <a href="?controlador=Alojamientos&accion=inicio" class="nav-link">
                      <i class="far fa-circle nav-icon"></i>
                      <p>Provincial</p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="?controlador=agencias&accion=inicio" class="nav-link">
                      <i class="far fa-circle nav-icon"></i>
                      <p>Municipal</p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="?controlador=prestadores&accion=inicio" class="nav-link">
                      <i class="far fa-circle nav-icon"></i>
                      <p>Barrial</p>
                    </a>
                  </li>

                </ul>
              </li>
              <!-- TRANSPORTE -->
            <?php }
              if ($rol_id == 1 or $rol_id == 2 or $rol_id == 3 and $usuario == "monica") { ?>
              <li class="nav-item menu-close">
                <a href="#" class="nav-link false">
                  <i class="nav-icon fas fa-tachometer-alt"></i>
                  <p>
                    Transporte
                    <i class="right fas fa-angle-left"></i>
                  </p>
                </a>
                <ul class="nav nav-treeview">
                  <li class="nav-item">
                    <a href="?controlador=Alojamientos&accion=inicio" class="nav-link">
                      <i class="far fa-circle nav-icon"></i>
                      <p>Colectivos</p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="?controlador=agencias&accion=inicio" class="nav-link">
                      <i class="far fa-circle nav-icon"></i>
                      <p>Aviones</p>
                    </a>
                  </li>

                </ul>
              </li>
            <?php } ?>
          </ul>
        </nav>


        <!--  -->
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
  <script src="vistas/recursos/plugins/datatables/jquery.dataTables.min.js"></script>
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
  <!-- SweetAlert2 -->
  <script src="vistas/recursos/plugins/sweetalert2/sweetalert2.min.js"></script>
  <!-- fullCalendar 5.10.1 -->
  <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.js"></script>
  <script src="vistas/recursos/script/calendario.js"></script>
  <!-- <script src="/vistas/recursos/plugins/fullcalendar1/lib/locales-all.js"></script> -->

  <!-- jquery-validation -->
  <script src="vistas/recursos/plugins/jquery-validation/jquery.validate.min.js"></script>
  <script src="vistas/recursos/plugins/jquery-validation/additional-methods.min.js"></script>
  <script src="vistas/recursos/script/validaciones_hoteles.js"></script>
  <script src="vistas/recursos/script/validacion_museo.js"></script>
  <script src="vistas/recursos/script/validacion_prestador.js"></script>
  <script src="vistas/recursos/script/filas_contacto.js"></script>





  <script>
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
      $("#example1").DataTable({
        "responsive": true,
        "lengthChange": true,
        "autoWidth": true,
        "language": {
          "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"
        },
        dom: 'Bfrtip',
        buttons: ['copy', 'csv', 'excel', 'pdf', 'print', 'colvis', ]

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
  </script>
  <!-- MODAL DEL EVENTO -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header bg-info">
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
              <label for="descripcion" class="form-label">Descripcion</label>
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

  <script src="vistas/recursos/script/modal.js"></script>
</body>

</html>