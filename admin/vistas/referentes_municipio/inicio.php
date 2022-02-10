<?php

if (!isset($_SESSION['id'])) {
  header("Location: index.php");
}

$usuario = $_SESSION['usuarios'];
$rol_id = $_SESSION['rol_id'];



?>
<div class="card">
  <?php if ($rol_id == 1 or $rol_id == 3) { ?>
    <div class="card-header">

      <a name="" id="" class="btn btn-success" href="?controlador=referentes&accion=crear" role="button">Agregar Referente</a>

    </div>
  <?php } ?>

  <div class="row">
    <div class="col-lg-3 col-6">
      <!-- small box -->
      <div class="small-box bg-info">
        <div class="inner">
          <?php foreach ($estadistica as $esta) { ?>
            <h3>

              <?php echo $esta->conteo; ?>
            </h3>
          <?php } ?>

          <p>Referentes</p>
        </div>
        <div class="icon">
          <i class="ion ion-bag"></i>
        </div>
        <a href="#" class="small-box-footer">Más info <i class="fas fa-arrow-circle-right"></i></a>
      </div>
    </div>
    <!-- ./col -->
    <div class="col-lg-3 col-6">
      <!-- small box -->
      <div class="small-box bg-success">
        <div class="inner">
          <?php foreach ($estadistica2 as $esta) { ?>
            <h3>

              <?php echo $esta->conteo; ?>
            </h3>
          <?php } ?>

          <p>Municipios con sedes de turismo</p>
        </div>
        <div class="icon">
          <i class="ion ion-stats-bars"></i>
        </div>
        <a href="#" class="small-box-footer">Más info <i class="fas fa-arrow-circle-right"></i></a>
      </div>
    </div>
    <!-- ./col -->
    <div class="col-lg-3 col-6">
      <!-- small box -->
      <div class="small-box bg-warning">
        <div class="inner">
          <h3>20</h3>

          <p>Registradas</p>
        </div>
        <div class="icon">
          <i class="ion ion-person-add"></i>
        </div>
        <a href="#" class="small-box-footer">Más info <i class="fas fa-arrow-circle-right"></i></a>
      </div>
    </div>
    <!-- ./col -->
    <div class="col-lg-3 col-6">
      <!-- small box -->
      <div class="small-box bg-danger">
        <div class="inner">
          <h3>3</h3>

          <p>Dados de Baja</p>
        </div>
        <div class="icon">
          <i class="ion ion-pie-graph"></i>
        </div>
        <a href="#" class="small-box-footer">Más info <i class="fas fa-arrow-circle-right"></i></a>
      </div>
    </div>
    <!-- ./col -->
  </div>

  <div class="card-body">

    <div id="acordeon">
      <table id="example1" class="table table-bordered table-striped" cellspacing="0" width="100%">
        <thead>
          <tr>
            <th class="visually-hidden">ID</th>
            <th>Localidad</th>
            <th>Nombre y Apellido</th>
            <th>Contacto</th>
            <th>Encargado</th>
            <th>Acción</th>
          </tr>
        </thead>
        <tbody>


          <?php foreach ($tablaReferente as $referente) { ?>

            <tr>
              <td class="visually-hidden"> <?php echo $referente["id_referentes"]; ?></td>
              <td><?php echo $referente["nombre_localidad"]; ?></td>
              <td><?php echo $referente["idoneo_referente"]; ?></td>
              <td><?php echo $referente["descripcion_contacto"]; ?></td>
              <td><?php echo $referente["descripcion_tipo_encargado"]; ?></td>





              <td>
                <div class="btn-group" role="group" aria-label="">

                  <a href="?controlador=referentes&accion=info&id=<?php echo $referente["id_referentes"]; ?>" class="btn btn-warning">Más Info</a>
                  <?php if ($rol_id == 1 or $rol_id == 3 and $usuario == "matias") { ?>
                    <a href="?controlador=referentes&accion=editar&id=<?php echo $referente["id_referentes"]; ?>" class="btn btn-info">Editar</a>
                    <a href="?controlador=referentes&accion=borrar&id=<?php echo $referente["id_referentes"]; ?>&idDireccion=<?php echo $referente["id_direccion"]; ?>" class="btn btn-danger">Borrar</a>
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