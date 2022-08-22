<?php

if (!isset($_SESSION['id'])) {
    header("Location: index.php");
}

$usuario = $_SESSION['usuarios'];
$rol_id = $_SESSION['rol_id'];

?>

<section class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1>Festividades</h1>
            </div>
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a class="text-success" href="index2.php?controlador=paginas&accion=inicio">Inicio</a></li>
                    <li class="breadcrumb-item active">Festividades</li>
                </ol>
            </div>
        </div>
    </div>
</section>

<div class="card">

    <div class="card-header">

        <?php if ($rol_id == 1 or $rol_id == 3 and $usuario == "matias") : ?>

            <a class="btn btn-success" href="?controlador=festivales&accion=crear" role="button">Agregar</a>

        <?php else : ?>
            <a class="btn btn-success disabled" href="#" role="button">Agregar</a>
        <?php endif; ?>

        <a class="btn btn-secondary" href="?controlador=festivales&accion=imprimir" role="button">Imprimir</a>

    </div>

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

        <div class="row" id="acordeon">

            <div class="col-lg-12">

                <table id="tblList" class="table table-bordered table-striped" cellspacing="0" width="100%">
                    <thead>
                        <tr style="background: linear-gradient(to right, #61ba6d, #83c331)">
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
                                <td>
                                    <?php
                                    foreach ($tablaContacto as $contacto) :
                                        if ($festival['id_festivales'] == $contacto['rela_festivales']) :
                                            echo $contacto['descripcion_contacto'] . '   ';
                                            break; // Para que solo muestre un número
                                        endif;
                                    endforeach;
                                    ?>
                                </td>

                                <td class="project-actions text-right">
                                    <div class="btn-group" role="group" aria-label="">

                                        <a id="btn1" title="Más Infomación" href="?controlador=festivales&accion=info&id=<?php echo $festival["id_festivales"]; ?>" class="btn btn-primary btn-sm">
                                            <i class="fas fa-folder"></i>
                                        </a>

                                        <?php if ($rol_id == 1 or $rol_id == 3) : ?>

                                            <a title="Editar" href="?controlador=festivales&accion=editar&id=<?php echo $festival["id_festivales"]; ?>" class="btn btn-success btn-sm">
                                                <i class="fas fa-pencil-alt"></i>
                                            </a>
                                            <a title="Borrar" href="?controlador=festivales&accion=borrar&id=<?php echo $festival["id_festivales"]; ?> &idDireccion=<?php echo $festival["id_direccion"]; ?>" class="btn btn-danger btn-sm" id="fntEliminar">
                                                <i class="fas fa-trash"></i>
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
                            <th>Festival</th>
                            <th>Contacto</th>
                            <th>Acción</th>
                        </tr>
                    </tfoot>
                </table>

            </div>

        </div>

    </div>

    <div class="card-footer"></div>

</div>