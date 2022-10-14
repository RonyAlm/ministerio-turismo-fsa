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
        <h1>Asistencia</h1>
      </div>
      <div class="col-sm-6">
        <ol class="breadcrumb float-sm-right">
          <li class="breadcrumb-item"><a class="text-success" href="index2.php?controlador=paginas&accion=inicio">Inicio</a></li>
          <li class="breadcrumb-item active">Asistencia</li>
        </ol>
      </div>
    </div>
  </div>
</section>

<div class="card">
  <div class="card-header">

    <?php if ($rol_id == 1 or $rol_id == 3 and $usuario == "admin") : ?>

      <a name="" id="" class="btn btn-success" href="?controlador=asistencias&accion=crear" role="button">Agregar</a>

    <?php else : ?>
      <a class="btn btn-success disabled" href="#" role="button">Agregar</a>
    <?php endif; ?>

    <a name="" id="" class="btn btn-secondary" href="?controlador=asistencias&accion=imprimir" role="button">Imprimir</a>

  </div>

  <div class="card-body">


    <div id="acordeon" class="row">
      <div class="col-lg-12">
        <table id="tblList" class="table table-bordered table-striped" cellspacing="0" width="100%">
          <thead>
            <tr style="background: linear-gradient(to right, #61ba6d, #83c331)">
              <th>id</th>
              <th>Nombre y Apellido</th>
              <th>Fecha</th>
              <th>Hora</th>
              <th>Acción</th>
            </tr>
          </thead>
          <tbody>

            <?php foreach ($tabla as $asistencia) { ?>

              <tr>
                <td><?php echo $asistencia["id_asistencia2"]; ?></td>
                <td><?php echo $asistencia["nombre_personal"]; ?></td>
                <td><?php echo $asistencia["fecha_asistencia"]; ?></td>
                <td><?php echo $asistencia["hora_asistencia"]; ?></td>

                <td class="project-actions text-right">
                  <div class="btn-group" role="group" aria-label="">

                    <a title="Más Infomación" id="btn1" href="?controlador=asistencias&accion=info&id=<?= $asistencia["id_asistencia2"]; ?>" class="btn btn-primary btn-sm">
                      <i class="fas fa-folder"></i>
                    </a>

                    <?php if ($rol_id == 1 or $rol_id == 3 and $usuario == "matias") : ?>

                      <a title="Editar" href="?controlador=asistencias&accion=editar&id=<?php echo $asistencia["id_asistencia2"]; ?>" class="btn btn-success btn-sm">
                        <i class="fas fa-pencil-alt"></i>
                      </a>
                      <a title="Borrar" href="?controlador=asistencias&accion=borrar&id=<?php echo $asistencia["id_asistencia2"]; ?>" class="btn btn-danger btn-sm">
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
              <th>id</th>
              <th>Nombre y Apellido</th>
              <th>Fecha</th>
              <th>Hora</th>
              <th>Acción</th>
            </tr>
          </tfoot>
        </table>
      </div>
    </div>

  </div>

  <div class="card-footer">

  </div>


</div>