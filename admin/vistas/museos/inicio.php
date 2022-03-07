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

            <a name="" id="" class="btn btn-success" href="?controlador=museos&accion=crear" role="button">Agregar Museos</a>

        </div>
    <?php } ?>

    <div class="row">
        <div class="col-md-3 col-sm-6 col-12">
            <div class="info-box">
                <span class="info-box-icon bg-info"><i class="fas fa-hotel"></i></span>

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

    <div class="card-body">

        <div id="acordeon">
            <table id="example1" class="table table-bordered table-striped">
                <thead>
                    <tr style="background: linear-gradient(to right, #61ba6d, #83c331)" align="center">

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



                            <td>
                                <div class="btn-group" role="group" aria-label="">

                                    <a id="btn1" href="?controlador=museos&accion=info&id=<?php echo $museos["id_museo"]; ?>" class="btn btn-warning">Más Info</a>
                                    <?php if ($rol_id == 1 or $rol_id == 3 and $usuario == "matias") { ?>
                                        <a href="?controlador=museos&accion=editar&id=<?php echo $museos["id_museo"]; ?>" class="btn btn-info">Editar</a>
                                        <a href="?controlador=museos&accion=borrar&id=<?php echo $museos["id_museo"]; ?> &idDireccion=<?php echo $museos["id_direccion"]; ?>" class="btn btn-danger">Borrar</a>

                                </div>

                            </td>
                        <?php } ?>
                        </tr>


                    <?php } ?>
                </tbody>
            </table>
        </div>



    </div>


</div>