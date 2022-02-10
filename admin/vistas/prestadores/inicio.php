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

      <a name="" id="" class="btn btn-success" href="?controlador=prestadores&accion=crear" role="button">Agregar Prestador</a>

    </div>
  <?php } ?>

  <div class="row">
    <div class="col-md-3 col-sm-6 col-12">
      <div class="info-box">
        <span class="info-box-icon bg-info"><i class="fas fa-hotel"></i></span>

        <div class="info-box-content">
          <span class="info-box-text text-center">Prestadores Turísticos</span>
          <?php foreach ($cantidad_prestadores as $estadistica) { ?>
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
          <span class="info-box-text text-center">Guías Turisticos</span>
          <?php foreach ($cantidad_guias as $estadistica) { ?>
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
          <span class="info-box-text text-center">Operador Turístico</span>
          <?php foreach ($cantidad_operadores as $estadistica) { ?>
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
        <span class="info-box-icon bg-success"><i class="far fa-star"></i></span>

        <div class="info-box-content">
          <span class="info-box-text text-center">Total</span>
          <?php foreach ($cantidad_total as $estadistica) { ?>
            <span class="info-box-text">Cantidad Total: <?php echo $estadistica->conteo; ?> </span>
          <?php } ?>
          <!-- /.info-box-content -->
        </div>
        <!-- /.info-box -->
      </div>
      <!-- /.col -->
    </div>
  </div>

  <div class="card-body">

    <div id="acordeon">
      <table id="example1" class="table table-bordered table-striped" cellspacing="0" width="100%">
        <thead>
          <tr>
            <th>Localidad</th>
            <th>Apellido y Nombre</th>
            <th>Institución / Emprendimiento</th>
            <th>Contacto</th>
            <th>Dirección</th>
            <th>Institución</th>
            <th>Acción</th>
          </tr>
        </thead>
        <tbody>


          <?php foreach ($tablaPrestadores as $prestadore) { ?>

            <tr>

              <td><?php echo $prestadore["nombre_localidad"]; ?></td>
              <td><?php echo $prestadore["descripcion_prestador"]; ?></td>
              <td><?php echo $prestadore["institucion_prestador"]; ?></td>
              <td><?php echo $prestadore["descripcion_contacto"]; ?></td>
              <td><?php echo $prestadore["calle_direccion"]; ?></td>
              <td><?php echo $prestadore["descripcion_tipo_estado"]; ?></td>



              <td>
                <div class="btn-group" role="group" aria-label="">

                  <a href="?controlador=prestadores&accion=info&id=<?php echo $prestadore["id_prestador"]; ?>" class="btn btn-warning">Más Info</a>
                  <?php if ($rol_id == 1 or $rol_id == 3) { ?>
                    <a href="?controlador=prestadores&accion=editar&id=<?php echo $prestadore["id_prestador"]; ?>" class="btn btn-info">Editar</a>
                    <a href="?controlador=prestadores&accion=borrar&id=<?php echo $prestadore["id_prestador"]; ?>
                                                                            &idDireccion=<?php echo $prestadore["id_direccion"]; ?>" class="btn btn-danger">Borrar</a>

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