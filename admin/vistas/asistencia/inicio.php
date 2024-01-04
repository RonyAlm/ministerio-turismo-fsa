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

    <?php if ($rol_id == 1 or $acceso == 1) : ?>

      <a name="" id="" class="btn btn-success" href="?controlador=asistencias&accion=crear" role="button">Agregar</a>

    <?php else : ?>
      <a class="btn btn-success disabled" href="#" role="button">Agregar</a>
    <?php endif; ?>

    <a name="" id="" class="btn btn-secondary" href="?controlador=asistencias&accion=imprimir" role="button">Imprimir</a>

    <a name="" id="" class="btn btn-secondary" href="?controlador=asistencias&accion=imprimirpdf" role="button">imprimir pdf</a>

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
              <th>Turno</th>
            </tr>
          </thead>
          <tbody>
            <?php foreach ($tabla as $asistencia) { ?>
              <tr>
                <td><?php echo $asistencia["id_asistencia3"]; ?></td>
                <td><?php echo $asistencia["nombre_personal"]; ?></td>
                <td><?php echo $asistencia["fecha_asistencia"]; ?></td>
                <td><?php echo $asistencia["hora_asistencia"]; ?></td>
                <td>
                  <?php
                  $hora_asistencia = strtotime($asistencia["hora_asistencia"]);
                  $hora_mañana_inicio = strtotime('05:00:00');
                  $hora_mañana_fin = strtotime('14:00:00');
                  $hora_tarde_inicio = strtotime('15:00:00');
                  $hora_tarde_fin = strtotime('23:59:59');

                  if ($hora_asistencia >= $hora_mañana_inicio && $hora_asistencia <= $hora_mañana_fin) {
                    echo "Turno mañana";
                  } elseif ($hora_asistencia >= $hora_tarde_inicio && $hora_asistencia <= $hora_tarde_fin) {
                    echo "Turno tarde";
                  } else {
                    echo "Fuera de turno";
                  }
                  ?>
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
              <th>Turno</th>
            </tr>
          </tfoot>
        </table>
      </div>
    </div>

  </div>

  <div class="card-footer">

  </div>


</div>