<?php

if (!isset($_SESSION['id'])) {
    header("Location: index.php");
}

$usuario = $_SESSION['usuarios'];
$rol_id = $_SESSION['rol_id'];
// $acceso = $_SESSION['tablas_acceso'];
?>

<section class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1>Comunicación</h1>
            </div>
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a class="text-success" href="index2.php?controlador=comunicacion&accion=inicio">Inicio</a></li>
                    <li class="breadcrumb-item active">Comunicación</li>
                </ol>
            </div>
        </div>
    </div>
</section>
<div class="card">
    <div class="card-header">

        <?php if ($rol_id == 3) : ?>
            <a name="" id="" class="btn btn-success" href="?controlador=comunicacion&accion=crear" role="button">Agregar</a>
            <a class="btn btn-success" href="#" role="button">Agregar Archivos</a>
        <?php else : ?>

        <?php endif; ?>

    </div>

</div>

<!-- MODAL DE AGREGAR USUARIO Y ROLES -->
<div class="modal fade" id="modal-MotivoNotas">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Agregar Motivos y Organismos</h5>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <form id="formularioModalUsuarioRol" name="agregarUsuarioRol" method="POST">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="inputMotivo">Motivo</label>
                        <input type="text" class="form-control" name="inputMotivo" id="inputMotivo" placeholder="Ingrese el motivo">
                    </div>
                    <div class="form-group">
                        <label for="inputOrg">Organismo</label>
                        <input type="text" class="form-control" name="inputOrg" id="inputOrg" placeholder="Ingrese el Organismo">
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    <button type="submit" class="btn btn-primary">Guardar</button>
                </div>
            </form>
        </div>
    </div>
</div>