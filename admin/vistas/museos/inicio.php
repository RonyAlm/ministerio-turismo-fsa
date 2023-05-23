<?php

if (!isset($_SESSION['id'])) {
    header("Location: index.php");
}

$usuario = $_SESSION['usuarios'];
$rol_id = $_SESSION['rol_id'];
$acceso = $_SESSION['tablas_acceso'];



?>

<section class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1>Museos</h1>
            </div>
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a class="text-success" href="index2.php?controlador=paginas&accion=inicio">Inicio</a></li>
                    <li class="breadcrumb-item active">Museos</li>
                </ol>
            </div>
        </div>
    </div>
</section>

<div class="card">

    <div class="card-header">

        <?php if ($rol_id == 1 or $rol_id == 3 and $usuario == "admin") : ?>

            <a name="" id="" class="btn btn-success" href="?controlador=museos&accion=crear" role="button">Agregar</a>

        <?php else : ?>
            <a class="btn btn-success disabled" href="#" role="button">Agregar</a>
        <?php endif; ?>

        <a name="" id="" class="btn btn-secondary" href="?controlador=museos&accion=imprimir" role="button">Imprimir</a>

    </div>

    <div class="card-body">

        <div class="row">
            <div class="col-md-3 col-sm-6 col-12">
                <div class="info-box">
                    <span class="info-box-icon bg-success"><i class="fas fa-hotel"></i></span>

                    <div class="info-box-content">
                        <span class="info-box-text text-center">Museos</span>
                        <?php foreach ($cantidad_museos as $estadistica) { ?>
                            <span class="info-box-text">Cantidad Total: <?php echo $estadistica->conteo; ?> </span>
                        <?php } ?>
                    </div>
                    <!-- /.info-box-content -->
                </div>
                <!-- /.info-box -->
            </div>
            <!-- /.col -->

        </div>

        <div class="row" id="acordeon">

            <div class="col-lg-12">

                <table id="tblList" class="table table-bordered table-striped" cellspacing="0" width="100%">
                    <thead>
                        <tr style="background: linear-gradient(to right, #61ba6d, #83c331)">

                            <th>Localidad</th>
                            <th>Nombre del Museo</th>
                            <th>Contacto</th>
                            <th>Dirección</th>
                            <th>Acción</th>

                        </tr>
                    </thead>
                    <tbody>


                        <?php foreach ($tablaMuseo as $museos) { ?>

                            <tr>
                                <td><?php echo $museos["nombre_localidad"]; ?></td>
                                <td><?php echo $museos["nombre_museo"]; ?></td>
                                <td><?php echo $museos["descripcion_contacto"]; ?></td>
                                <td><?php echo $museos["calle_direccion"]; ?></td>
                                <td class="project-actions text-right">
                                    <div class="btn-group" role="group" aria-label="">

                                        <a title="Más Información" id="btn1" href="?controlador=museos&accion=info&id=<?php echo $museos["id_museo"]; ?>" class="btn btn-primary btn-sm"><i class="fas fa-folder"></i>
                                        </a>

                                        <?php if ($rol_id == 1 or $rol_id == 3 and $usuario == "admin") : ?>

                                            <a title="Editar" href="?controlador=museos&accion=editar&id=<?php echo $museos["id_museo"]; ?>" class="btn btn-success btn-sm"><i class="fas fa-pencil-alt"></i>
                                            </a>
                                            <a title="Borrar" href="?controlador=museos&accion=borrar&id=<?php echo $museos["id_museo"]; ?> &idDireccion=<?php echo $museos["id_direccion"]; ?>" class="btn btn-danger btn-sm"><i class="fas fa-trash"></i>
                                            </a>

                                        <?php else : ?>

                                            <a title="Editar" href="#" class="btn btn-success btn-sm disabled">
                                                <i class="fas fa-pencil-alt"></i>
                                            </a>
                                            <a title="Borrar" href="#" class="btn btn-danger btn-sm disabled">
                                                <i class="fas fa-trash"></i>
                                            </a>

                                        <?php endif; ?>


                                    </div>

                                </td>
                            </tr>


                        <?php } ?>
                    </tbody>
                    <tfoot>
                        <tr style="background: linear-gradient(to right, #61ba6d, #83c331)">
                            <th>Localidad</th>
                            <th>Nombre del Museo</th>
                            <th>Contacto</th>
                            <th>Dirección</th>
                            <th>Acción</th>
                        </tr>
                    </tfoot>
                </table>

            </div>

        </div>

    </div>


</div>