<?php

include_once("../../../../conexion.php");


/*----------------------------------*********-----------------------------------*/

$bd = BD::crearInstancia();

$sql = $bd->query("SELECT `id_servicios_generales`, `nombre_servicio_general`, `idoneo_servicio_general`,ts.descripcion_servicio, tl.descripcion_lugar,l.nombre_localidad, d.calle_direccion
FROM `servicios_generales` sg
INNER JOIN direccion d ON d.id_direccion = sg.rela_direccion
INNER JOIN localidad l ON l.id_localidad = d.rela_localidad_direccion
INNER JOIN tipo_lugar tl on tl.id_tipo_lugar = sg.rela_tipo_lugar
INNER JOIN tipo_de_servicio ts on ts.id_tipo_servicio = sg.rela_tipo_servicio
WHERE sg.rela_tipo_lugar = 3");

$sql->execute();

//$cantidadAlojamiento = $sqlestadistica->fetchAll(PDO::FETCH_OBJ);

$sqlContactos = $bd->query("SELECT sg.id_servicios_generales, c.descripcion_contacto, c.rela_tipo_contacto_cont 
FROM servicios_generales sg
INNER JOIN contacto c ON c.rela_servicios_generales = sg.id_servicios_generales
WHERE (c.rela_tipo_contacto_cont = 2 OR c.rela_tipo_contacto_cont = 9)");

$sqlContactos->execute();
/*----------------------------------*********-----------------------------------*/


$listaAlojamientos = [];


while ($filas = $sql->fetch(PDO::FETCH_ASSOC)) {
    $listaAlojamientos[] = $filas;
    //print_r($listaAlojamientos);
}

$listaContacto = [];


while ($filas = $sqlContactos->fetch(PDO::FETCH_ASSOC)) {
    $listaContacto[] = $filas;
    // print_r($listaContacto);
}



?>


<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Ministerio de Turismo | Camping</title>

    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
    <!-- DataTables -->
    <link rel="stylesheet" href="../../plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="../../plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
    <link rel="stylesheet" href="../../plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../../dist/css/adminlte.min.css">

    <style>
        .resaltar {
            background-color: yellow;
            color: black;
        }
    </style>
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
                    <a href="#" class="nav-link">Inicio</a>
                </li>
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



                <li class="nav-item">
                    <a class="nav-link" data-widget="fullscreen" href="#" role="button">
                        <i class="fas fa-expand-arrows-alt"></i>
                    </a>
                </li>
            </ul>
        </nav>
        <!-- /.navbar -->

        <!-- Main Sidebar Container -->
        <aside class="main-sidebar sidebar-dark-primary elevation-4">
            <!-- Brand Logo -->
            <a href="#" class="brand-link">
                <img src="../../dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
                <span class="brand-text font-weight-light">Ministerio</span>
            </a>

            <!-- Sidebar -->
            <div class="sidebar">
                <!-- Sidebar user (optional) -->
                <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                    <div class="image">
                        <img src="../../dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
                    </div>
                    <div class="info">
                        <a href="#" class="d-block">david</a>
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
                <!-- <nav class="mt-2">
                    <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">

                        <li class="nav-item">
                            <a href="#" class="nav-link">
                                <i class="nav-icon fas fa-tachometer-alt"></i>
                                <p>
                                    Inicio
                                    <i class="right fas fa-angle-left"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="../../index.html" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Dashboard v1</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="../../index2.html" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Dashboard v2</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="../../index3.html" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Dashboard v3</p>
                                    </a>
                                </li>
                            </ul>
                        </li>

                    </ul>
                </nav> -->
                <!-- /.sidebar-menu -->
            </div>
            <!-- /.sidebar -->
        </aside>

        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1>Alojamiento</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="#">Inicio</a></li>
                                <li class="breadcrumb-item active">Alojamiento</li>
                            </ol>
                        </div>
                    </div>
                </div>
                <!-- /.container-fluid -->
            </section>

            <!-- Main content -->
            <section class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h3 class="card-title">Todos los Alojamientos</h3>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body">
                                    <table id="example1" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th>Localidad</th>
                                                <th>Nombre</th>
                                                <th>Idoneo</th>
                                                <th>Dirección</th>
                                                <th>Tipo de servicio</th>
                                                <th>Celular</th>
                                                <th>Telefono</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php foreach ($listaAlojamientos as $alojamiento) : ?>
                                                <tr>
                                                    <td><?= $alojamiento['nombre_localidad'] ?></td>
                                                    <td><?= $alojamiento['nombre_servicio_general'] ?></td>
                                                    <td><?= $alojamiento['idoneo_servicio_general'] ?></td>
                                                    <td><?= $alojamiento['calle_direccion'] ?></td>
                                                    <td><?= $alojamiento['descripcion_servicio'] ?></td>

                                                    <!-- <td><?php //($alojamiento['cuit_alojamiento'] == 0 ) ? '' : $alojamiento['cuit_alojamiento']; 
                                                                ?></td> -->
                                                    <td><?php
                                                        foreach ($listaContacto as $contacto) :
                                                            echo ($alojamiento['id_servicios_generales'] == $contacto['id_servicios_generales'] && $contacto['rela_tipo_contacto_cont'] == 2) ? $contacto['descripcion_contacto'] . '   ' : '';
                                                        endforeach;
                                                        ?>
                                                    </td>
                                                    <td><?php
                                                        foreach ($listaContacto as $contacto) :
                                                            echo ($alojamiento['id_servicios_generales'] == $contacto['id_servicios_generales'] && $contacto['rela_tipo_contacto_cont'] == 9) ? $contacto['descripcion_contacto'] . '   ' : '';
                                                        endforeach;
                                                        ?>
                                                    </td>

                                                </tr>
                                            <?php endforeach; ?>
                                        </tbody>
                                        <!-- <tfoot>
                                            <tr>
                                                <th>Rendering engine</th>
                                                <th>Browser</th>
                                                <th>Platform(s)</th>
                                                <th>Engine version</th>
                                                <th>CSS grade</th>
                                            </tr>
                                        </tfoot> -->
                                    </table>
                                </div>
                                <!-- /.card-body -->
                            </div>
                            <!-- /.card -->
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.container-fluid -->
            </section>
            <!-- /.content -->
        </div>
        <!-- /.content-wrapper -->

        <!-- Control Sidebar -->
        <aside class="control-sidebar control-sidebar-dark">
            <!-- Control sidebar content goes here -->
        </aside>
        <!-- /.control-sidebar -->
    </div>
    <!-- ./wrapper -->

    <!-- jQuery -->
    <script src="../../plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- DataTables  & Plugins -->
    <script src="../../plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="../../plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
    <script src="../../plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
    <script src="../../plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
    <script src="../../plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
    <script src="../../plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
    <script src="../../plugins/jszip/jszip.min.js"></script>
    <script src="../../plugins/pdfmake/pdfmake.min.js"></script>
    <script src="../../plugins/pdfmake/vfs_fonts.js"></script>
    <script src="../../plugins/datatables-buttons/js/buttons.html5.min.js"></script>
    <script src="../../plugins/datatables-buttons/js/buttons.print.min.js"></script>
    <script src="../../plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
    <!-- AdminLTE App -->
    <script src="../../dist/js/adminlte.min.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="../../dist/js/demo.js"></script>
    <!-- Page specific script -->
    <script>
        $(function() {
            $("#example1").DataTable({
                "responsive": true,
                "lengthChange": false,
                "autoWidth": false,
                "paging": false,
                "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
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


        // Este codigo se utiliza para eliminar columnas de la tabla


        // $(document).ready(() => {
        //     $("th").hover(
        //         function() {
        //             let indiceColumna = $(this).parent().children().index(this);
        //             $(this).addClass("resaltar");

        //             $(`table td:nth-child(${indiceColumna + 1})`).addClass("resaltar");
        //         },
        //         function() {
        //             $("table tr").children().removeClass("resaltar");
        //         }
        //     );

        //     $("th").click(function() {
        //         $(this).hide();

        //         let indiceColumna = $(this).parent().children().index(this);

        //         $(`table td:nth-child(${indiceColumna + 1})`).hide();
        //     });
        // });
    </script>
</body>

</html>