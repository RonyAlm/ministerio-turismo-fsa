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
        <h1>Gastronomía</h1>
      </div>
      <div class="col-sm-6">
        <ol class="breadcrumb float-sm-right">
          <li class="breadcrumb-item"><a class="text-success" href="index2.php?controlador=gastronomia&accion=inicio">Inicio</a></li>
          <li class="breadcrumb-item active">Gastronomia</li>
        </ol>
      </div>
    </div>
  </div>
</section>

<div class="card">
  <div class="card-header">

    <?php if ($rol_id == 1 or $rol_id == 3 and $usuario == "matias") { ?>

      <a name="" id="" class="btn btn-success" href="?controlador=gastronomia&accion=crear" role="button">Agregar</a>

    <?php } ?>

    <a name="" id="" class="btn btn-secondary" href="?controlador=gastronomia&accion=imprimir" role="button">Imprimir</a>

  </div>

  <div class="card-body">

    <div class="row">
      <div class="col-md-3 col-sm-6 col-12">
        <div class="info-box">
          <span class="info-box-icon bg-success"><i class="fa-solid fa-building"></i></span>

          <div class="info-box-content">
            <span class="info-box-text text-center">Gastronomicos</span>
            <?php foreach ($cantidad_agencias as $estadistica) { ?>
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
          <span class="info-box-icon bg-success"><i class="fa-solid fa-building-circle-check"></i></span>

          <div class="info-box-content">
            <span class="info-box-text text-center">Activas</span>
            <?php foreach ($cantidadAgenciasHabilitadas as $estadistica) { ?>
              <span class="info-box-text">Cantidad Total: <?php echo $estadistica->conteo; ?> </span>
            <?php } ?>
          </div>
          <!-- /.info-box-content -->
        </div>
        <!-- /.info-box -->
      </div>
      <!-- /.col -->
    </div>

    <div id="acordeon" class="row">
      <div class="col-lg-12">
        <table id="tblList" class="table table-bordered table-striped" cellspacing="0" width="100%">
          <thead>
            <tr style="background: linear-gradient(to right, #61ba6d, #83c331)">
              <th>Localidad</th>
              <th>Designacion</th>
              <th>Contacto</th>
              <th>Dirección</th>
              <th>Acción</th>
            </tr>
          </thead>
          <tbody>

            <?php foreach ($tabla as $gastronomia) { ?>

              <tr>

                <td><?php echo $gastronomia["nombre_localidad"]; ?></td>
                <td><?php echo $gastronomia["denominacion_gastro"]; ?></td>
                <td><?php echo $gastronomia["descripcion_contacto"]; ?></td>
                <td><?php echo $gastronomia["calle_direccion"]; ?></td>
                <td class="project-actions text-right">
                  <div class="btn-group" role="group" aria-label="">

                    <a title="Más Infomación" id="btn1" href="?controlador=agencias&accion=info&id=<?= $gastronomia["id_gastronomia"]; ?>" class="btn btn-primary btn-sm">
                      <i class="fas fa-folder"></i>
                    </a>

                    <?php if ($rol_id == 1 or $rol_id == 3 and $usuario == "matias") { ?>
                      <a title="Editar" href="?controlador=agencias&accion=editar&id=<?php echo $gastronomia["id_gastronomia"]; ?>" class="btn btn-success btn-sm">
                        <i class="fas fa-pencil-alt"></i>
                      </a>
                      <a title="Borrar" href="?controlador=agencias&accion=borrar&id=<?php echo $gastronomia["id_gastronomia"]; ?>
                                                                            &idDireccion=<?php echo $gastronomia["id_direccion"]; ?>" class="btn btn-danger btn-sm">
                        <i class="fas fa-trash"></i>
                      </a>

                    <?php } ?>
                  </div>
                </td>

              </tr>


            <?php } ?>
          </tbody>
          <tfoot>
            <tr style="background: linear-gradient(to right, #61ba6d, #83c331)">
              <th>Localidad</th>
              <th>Designacion</th>
              <th>Contacto</th>
              <th>Dirección</th>
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