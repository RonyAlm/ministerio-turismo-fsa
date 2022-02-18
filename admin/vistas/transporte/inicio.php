<<<<<<< HEAD
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Transportes</title>

    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../recursos/plugins/fontawesome-free/css/all.min.css">
    <!-- Select2 -->
    <link rel="stylesheet" href="../recursos/plugins/select2/css/select2.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../recursos/dist/css/adminlte.min.css">

    <style>
        .select2-container--default .select2-results__option--highlighted[aria-selected],
        .select2-container--default .select2-results__option--highlighted[aria-selected]:hover {
            background-color: #83c331;
            color: #fff;
        }
        
        .select2-container--default .select2-results__option--highlighted[aria-selected] {
            background-color: #83c331;
            color: white;
        }
        
        .select2-container--default .select2-results__option--highlighted {
            background-color: #83c331;
            color: #fff;
        }
        
        .select2-container--default.select2-container--focus .select2-selection--multiple,
        .select2-container--default.select2-container--focus .select2-selection--single {
            border-color: #83c331;
        }
        
        .form-control:focus {
            border: 1px solid #83c331;
        }
        
        .select2-container--default .select2-dropdown .select2-search__field:focus,
        .select2-container--default .select2-search--inline .select2-search__field:focus {
            border: 1px solid #83c331;
        }
        
        .btn-default {
            background: linear-gradient(to right, #61ba6d, #83c331);
            border-color: #83c331;
            color: white;
        }
        /* CSS DE RESULTADOS*/
        
        .list-group-item {
            position: relative;
            display: block;
            padding: 0.5rem;
            padding-top: 1.5rem;
            padding-bottom: 0;
            border: 1px solid rgba(0, 0, 0, .125);
            background: linear-gradient(to right, #61ba6d, #83c331);
            margin-top: 1rem;
        }
        
        .list-group-item:first-child {
            margin-top: 0;
        }
        
        .list-group-item:last-child {
            margin-bottom: 2rem;
        }
        
        .card-info-colectivo-header {
            display: flex;
            justify-content: flex-end;
            margin-top: -1rem;
            margin-bottom: 0.5rem;
        }
        
        .card-info-colectivo-header a {
            margin-left: 0.4rem;
        }
        
        .list-group-item .row {
            display: flex;
            flex-wrap: wrap;
            flex-direction: column;
            background-color: #fff;
        }
        
        .card-info-colectivo-top,
        .card-info-colectivo-button {
            display: flex;
            flex-direction: row;
        }
        
        .card-info-colectivo-top {
            justify-content: space-between;
        }
        
        .card-info-colectivo-button {
            justify-content: stretch;
        }
        
        .card-info-colectivo-item {
            display: flex;
            justify-content: center;
            flex-direction: column;
            border: 2px solid #83c331;
            flex-wrap: wrap;
            width: 25%;
            align-items: center;
            max-height: 190px;
        }
        
        .card-info-colectivo-item h3 {
            padding-left: 1rem;
            padding-right: 1rem;
            text-align: center;
        }
        
        .card-info-colectivo-top .card-info-colectivo-item:last-child p:first-child {
            margin-top: 1rem;
        }
        
        .card-info-colectivo-button .card-info-colectivo-item:first-child {
            width: 75%;
        }
        
        .card-info-colectivo-button .card-info-colectivo-item:last-child {
            width: 25%;
        }
        
        .card-info-colectivo-item h3 {
            color: #83c331;
        }
        
        .card-info-colectivo-item span {
            color: red;
        }
        
        .card-info-colectivo-button .card-info-colectivo-item p {
            margin-top: 0.5rem;
            margin-bottom: 0.5rem;
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
            <a href="../../index3.html" class="brand-link">
                <img src="../../dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
                <span class="brand-text font-weight-light">AdminLTE 3</span>
            </a>

            <!-- Sidebar -->
            <div class="sidebar">
                <!-- Sidebar user (optional) -->
                <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                    <div class="image">
                        <img src="../../dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
                    </div>
                    <div class="info">
                        <a href="#" class="d-block">Alexander Pierce</a>
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
                <nav class="mt-2">
                    <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                        <li class="nav-item">
                            <a href="#" class="nav-link">
                                <i class="nav-icon fas fa-th"></i>
                                <p>Otros</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="nav-link">
                                <i class="nav-icon fas fa-th"></i>
                                <p>
                                    Transporte
                                    <i class="right fas fa-angle-left"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="#" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Colectivos</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="#" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Vuelos</p>
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </nav>
                <!-- /.sidebar-menu -->
            </div>
            <!-- /.sidebar -->
        </aside>

        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <div class="container-fluid">
                    <h2 class="text-center display-4">Transportes</h2>
                </div>
                <!-- /.container-fluid -->
            </section>

            <!-- Main content -->
            <section class="content">
                <div class="container-fluid">
                    <form action="#">
                        <div class="row">
                            <div class="col-md-10 offset-md-1">
                                <div class="row">
                                    <div class="col-6">
                                        <div class="form-group">
                                            <label>Empresa:</label>
                                            <select class="select2" data-placeholder="FechaBus" style="width: 100%;">
                                        <option>Pulqui</option>
                                        <option>Crucero del Norte</option>
                                        <option>Agila Dorada</option>
                                    </select>
                                        </div>
                                    </div>
                                    <div class="col-3">
                                        <div class="form-group">
                                            <label>Origen:</label>
                                            <select class="select2" style="width: 100%;">
                                        <option selected>Formosa</option>
                                        <option>Clorinda</option>
                                    </select>
                                        </div>
                                    </div>
                                    <div class="col-3">
                                        <div class="form-group">
                                            <label>Destino:</label>
                                            <select class="select2" style="width: 100%;">
                                              <option selected>Formosa</option>
                                              <option>Clorinda</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="input-group input-group-lg">
                                        <input type="search" class="form-control form-control-lg" placeholder="Buscar" value="Lorem ipsum">
                                        <div class="input-group-append">
                                            <button type="submit" class="btn btn-lg btn-default">
                                                <i class="fa fa-search"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                    <div class="row mt-3">
                        <div class="col-md-10 offset-md-1">
                            <div class="list-group">
                                <div class="list-group-item">
                                    <div class="card-info-colectivo-header">
                                        <a class="btn btn-danger" href=""><i class="fas fa-trash"></i></a>
                                        <a class="btn btn-info" href=""><i class="fas fa-edit"></i></a>
                                        <a class="btn btn-success" href=""><i class="fas fa-plus"></i></a>
                                    </div>
                                    <div class="row">
                                        <div class="card-info-colectivo-top">
                                            <div class="card-info-colectivo-item">
                                                <h3>EL Pulqui</h3>
                                                <p>Tel: 3704747832</p>
                                            </div>
                                            <div class="card-info-colectivo-item">
                                                <p>Dom 20 Feb 12:05hs. </p>
                                                <p>Dom 20 Feb 12:05hs. </p>
                                            </div>
                                            <div class="card-info-colectivo-item">
                                                <h3>Cama</h3>
                                            </div>
                                            <div class="card-info-colectivo-item">
                                                <p>Duracion: 18:10hs.</p>
                                                <p>Pasajes: 2</p>
                                                <span>¡Ultimos asientos!</span>
                                                <p>Recorrido</p>
                                            </div>

                                        </div>

                                        <div class="card-info-colectivo-button">
                                            <div class="card-info-colectivo-item">
                                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Repellendus asperiores</p>
                                            </div>
                                            <div class="card-info-colectivo-item">
                                                <h3>ARS 9.920,00</h3>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="list-group-item">
                                    <div class="card-info-colectivo-header">
                                        <a class="btn btn-danger" href=""><i class="fas fa-trash"></i></a>
                                        <a class="btn btn-info" href=""><i class="fas fa-edit"></i></a>
                                        <a class="btn btn-success" href=""><i class="fas fa-plus"></i></a>
                                    </div>
                                    <div class="row">
                                        <div class="card-info-colectivo-top">
                                            <div class="card-info-colectivo-item">
                                                <h3>Flecha Bus</h3>
                                                <p>Tel: 3704747832</p>
                                            </div>
                                            <div class="card-info-colectivo-item">
                                                <p>Dom 20 Feb 12:05hs. </p>
                                                <p>Dom 20 Feb 12:05hs. </p>
                                            </div>
                                            <div class="card-info-colectivo-item">
                                                <h3>Semi Cama</h3>
                                            </div>
                                            <div class="card-info-colectivo-item">
                                                <p>Duracion: 18:10hs.</p>
                                                <p>Pasajes: 2</p>
                                                <span>¡Ultimos asientos!</span>
                                                <p>Recorrido</p>
                                            </div>

                                        </div>

                                        <div class="card-info-colectivo-button">
                                            <div class="card-info-colectivo-item">
                                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Repellendus asperiores</p>
                                            </div>
                                            <div class="card-info-colectivo-item">
                                                <h3>ARS 13.920,00</h3>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="list-group-item">
                                    <div class="card-info-colectivo-header">
                                        <a class="btn btn-danger" href=""><i class="fas fa-trash"></i></a>
                                        <a class="btn btn-info" href=""><i class="fas fa-edit"></i></a>
                                        <a class="btn btn-success" href=""><i class="fas fa-plus"></i></a>
                                    </div>
                                    <div class="row">
                                        <div class="card-info-colectivo-top">
                                            <div class="card-info-colectivo-item">
                                                <h3>Aguila Dorada Bis Pro</h3>
                                                <p>Tel: 3704747832</p>
                                            </div>
                                            <div class="card-info-colectivo-item">
                                                <p>Dom 20 Feb 12:05hs. </p>
                                                <p>Dom 20 Feb 12:05hs. </p>
                                            </div>
                                            <div class="card-info-colectivo-item">
                                                <h3>Semi Cama de lujo</h3>
                                            </div>
                                            <div class="card-info-colectivo-item">
                                                <p>Duracion: 18:10hs.</p>
                                                <p>Pasajes: 2</p>
                                                <span>¡Ultimos asientos!</span>
                                                <p>Recorrido</p>
                                            </div>

                                        </div>

                                        <div class="card-info-colectivo-button">
                                            <div class="card-info-colectivo-item">
                                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Repellendus asperiores</p>
                                            </div>
                                            <div class="card-info-colectivo-item">
                                                <h3>ARS 113.920,00</h3>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>

        <footer class="main-footer">
            <div class="float-right d-none d-sm-block">
                <b>Version</b> 3.2.0-rc
            </div>
            <strong>Copyright &copy; 2014-2021 <a href="https://adminlte.io">AdminLTE.io</a>.</strong> All rights reserved.
        </footer>

        <!-- Control Sidebar -->
        <aside class="control-sidebar control-sidebar-dark">
            <!-- Control sidebar content goes here -->
        </aside>
        <!-- /.control-sidebar -->
    </div>
    <!-- ./wrapper -->

    <!-- jQuery -->
    <script src="../recursos/plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="../recursos/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Select2 -->
    <script src="../recursos/plugins/select2/js/select2.full.min.js"></script>
    <!-- AdminLTE App -->
    <script src="../recursos/dist/js/adminlte.min.js"></script>
    <script>
        $(function() {
            $('.select2').select2()
        });
    </script>
</body>

</html>
=======
<?php

if (!isset($_SESSION['id'])) {
    header("Location: index.php");
}

$usuario = $_SESSION['usuarios'];
$rol_id = $_SESSION['rol_id'];

?>

<div class="card">
    <?php if ($rol_id == 1 or $rol_id == 3 and $usuario == "matias") { ?>
        <div class="card-header">

            <a name="" id="" class="btn btn-success" href="?controlador=servigenerales&accion=crear" role="button">Agregar Servicios</a>

        </div>
    <?php } ?>

    <div class="row">
        <div class="col-md-3 col-sm-6 col-12">
            <div class="info-box">
                <span class="info-box-icon bg-info"><i class="fas fa-hotel"></i></span>

                <div class="info-box-content">
                    <span class="info-box-text text-center">Piletas</span>
                    <?php foreach ($cantidadPiletas as $estadistica) { ?>
                        <span class="info-box-text">Cantidad Total: <?php echo $estadistica->conteo; ?> </span>
                    <?php } ?>
                </div>
                <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
        </div>
        <!-- /.col -->
        <div class="col-md-3 col-sm-6 col-12">
            <div class="info-box">
                <span class="info-box-icon bg-info"><i class="fas fa-hotel"></i></span>

                <div class="info-box-content">
                    <span class="info-box-text text-center">Playas</span>
                    <?php foreach ($cantidadPlayas as $estadistica) { ?>
                        <span class="info-box-text">Cantidad Total: <?php echo $estadistica->conteo; ?> </span>
                    <?php } ?>
                </div>
                <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
        </div>
        <!-- /.col -->
        <div class="col-md-3 col-sm-6 col-12">
            <div class="info-box">
                <span class="info-box-icon bg-info"><i class="fas fa-hotel"></i></span>

                <div class="info-box-content">
                    <span class="info-box-text text-center">Parque Acuático</span>
                    <?php foreach ($cantidadParqueAcuaticos as $estadistica) { ?>
                        <span class="info-box-text">Cantidad Total: <?php echo $estadistica->conteo; ?> </span>
                    <?php } ?>
                </div>
                <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
        </div>
        <div class="col-md-3 col-sm-6 col-12">
            <div class="info-box">
                <span class="info-box-icon bg-info"><i class="fas fa-hotel"></i></span>

                <div class="info-box-content">
                    <span class="info-box-text text-center">Camping</span>
                    <?php foreach ($cantidadCamping as $estadistica) { ?>
                        <span class="info-box-text">Cantidad Total: <?php echo $estadistica->conteo; ?> </span>
                    <?php } ?>
                </div>
                <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
        </div>
    </div>


    <div class="card-body">

        <div id="acordeon">
            <table id="example1" class="table table-bordered table-striped" cellspacing="0" width="100%">
                <thead>
                    <tr>
                        <th>Tipo</th>
                        <th>Localidad</th>
                        <th>Nombre</th>
                        <th>Contacto</th>
                        <th>Tipo Servicio</th>
                        <th>Acción</th>
                    </tr>
                </thead>
                <tbody>


                    <?php foreach ($tablaServigeneral as $servigeneral) { ?>

                        <tr>

                            <td><?php echo $servigeneral["descripcion_lugar"]; ?></td>
                            <td><?php echo $servigeneral["nombre_localidad"]; ?></td>
                            <td><?php echo $servigeneral["nombre_servicio_general"]; ?></td>
                            <td><?php echo $servigeneral["descripcion_contacto"]; ?></td>
                            <td><?php echo $servigeneral["descripcion_servicio"]; ?></td>



                            <td>
                                <div class="btn-group" role="group" aria-label="">

                                    <a id="btn1" href="?controlador=servigenerales&accion=info&id=<?php echo $servigeneral["id_servicios_generales"]; ?>" class="btn btn-warning">Más Info</a>
                                    <?php if ($rol_id == 1 or $rol_id == 3 and $usuario == "matias") { ?>
                                        <a href="?controlador=servigenerales&accion=editar&id=<?php echo $servigeneral["id_servicios_generales"]; ?>" class="btn btn-info">Editar</a>
                                        <a href="?controlador=servigenerales&accion=borrar&id=<?php echo $servigeneral["id_servicios_generales"]; ?> &idDireccion=<?php echo $servigeneral["id_direccion"]; ?>" class="btn btn-danger">Borrar</a>

                                    <?php } ?>
                                </div>

                            </td>

                        </tr>


                    <?php } ?>
                </tbody>
            </table>
        </div>



    </div>


</div>
>>>>>>> 4caf7b773ad80892f5a375332a09fd709aeff06c
