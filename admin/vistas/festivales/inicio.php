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

            <a name="" id="" class="btn btn-success" href="?controlador=festivales&accion=crear" role="button">Agregar Festival</a>

        </div>
    <?php } ?>

    <!-- <div class="row">
        <div class="col-md-3 col-sm-6 col-12">
            <div class="info-box">
                <span class="info-box-icon bg-info"><i class="fas fa-hotel"></i></span>

                <div class="info-box-content">
                    <span class="info-box-text text-center">Festival</span>
                    <?php foreach ($cantidadPiletas as $estadistica) { ?>
                        <span class="info-box-text">Cantidad Total: <?php echo $estadistica->conteo; ?> </span>
                    <?php } ?>
                </div>
               
            </div>
           
        </div>

    </div> -->


    <div class="card-body">

        <div id="acordeon">
            <table id="example1" class="table table-bordered table-striped" cellspacing="0" width="100%">
                <thead>
                    <tr style="background: linear-gradient(to right, #61ba6d, #83c331)" align="center">

                        <th>Localidad</th>
                        <th>Festival</th>
                        <th>Contacto</th>
                        <th>Acción</th>
                    </tr>
                </thead>
                <tbody>


                    <?php foreach ($tabla as $festival) { ?>

                        <tr>
                            <td><?php echo $festival["nombre_localidad"]; ?></td>
                            <td><?php echo $festival["nombre_festival"]; ?></td>


                            <?php foreach ($tablaContacto as $contacto) { ?>
                                <td>
                                    <?php
                                    echo ($festival['id_festivales'] == $contacto['rela_festivales']) ? $contacto['descripcion_contacto'] . '   ' : '';
                                    ?>

                                </td>
                            <?php } ?>


                            <td>
                                <div class="btn-group" role="group" aria-label="">

                                    <a id="btn1" href="?controlador=festivales&accion=info&id=<?php echo $festival["id_festivales"]; ?>" class="btn btn-warning">Más Info</a>
                                    <?php if ($rol_id == 1 or $rol_id == 3 and $usuario == "matias") { ?>
                                        <a href="?controlador=festivales&accion=editar&id=<?php echo $festival["id_festivales"]; ?>" class="btn btn-info">Editar</a>
                                        <a href="?controlador=festivales&accion=borrar&id=<?php echo $festival["id_festivales"]; ?> &idDireccion=<?php echo $festival["id_direccion"]; ?>" class="btn btn-danger">Borrar</a>

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