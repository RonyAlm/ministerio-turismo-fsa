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

      <a name="" id="" class="btn btn-success" href="?controlador=servigenerales&accion=crear" role="button">Agregar Servicios</a>

    </div>
  <?php } ?>

  <div class="row">
    <div class="col-md-3 col-sm-6 col-12">
      <div class="info-box">
        <span class="info-box-icon bg-info"><i class="fas fa-hotel"></i></span>

        <div class="info-box-content">
          <span class="info-box-text text-center">Piletas</span>
          <?php foreach ($cantidadPiletas as $estadistica) { ?>
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
          <span class="info-box-text text-center">Playas</span>
          <?php foreach ($cantidadPlayas as $estadistica) { ?>
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
          <span class="info-box-text text-center">Parque Acuático</span>
          <?php foreach ($cantidadParqueAcuaticos as $estadistica) { ?>
            <span class="info-box-text">Cantidad Total: <?php echo $estadistica->conteo; ?> </span>
          <?php } ?>
        </div>
        <!-- /.info-box-content -->
      </div>
      <!-- /.info-box -->
    </div>
    <div class="col-md-3 col-sm-6 col-12">
      <div class="info-box">
        <span class="info-box-icon bg-info"><i class="fas fa-hotel"></i></span>

        <div class="info-box-content">
          <span class="info-box-text text-center">Camping</span>
          <?php foreach ($cantidadCamping as $estadistica) { ?>
            <span class="info-box-text">Cantidad Total: <?php echo $estadistica->conteo; ?> </span>
          <?php } ?>
        </div>
        <!-- /.info-box-content -->
      </div>
      <!-- /.info-box -->
    </div>
  </div>


  <div class="card-body">

    <div id="acordeon">
      <table id="example1" class="table table-bordered table-striped" cellspacing="0" width="100%">
        <thead>
          <tr style="background: linear-gradient(to right, #61ba6d, #83c331)" align="center">
            <th>Tipo</th>
            <th>Localidad</th>
            <th>Nombre</th>
            <th>Contacto</th>
            <th>Tipo Servicio</th>
            <th>Acción</th>
          </tr>
        </thead>
        <tbody>


          <?php foreach ($tablaServigeneral as $servigeneral) { ?>

            <tr>

              <td><?php echo $servigeneral["descripcion_lugar"]; ?></td>
              <td><?php echo $servigeneral["nombre_localidad"]; ?></td>
              <td><?php echo $servigeneral["nombre_servicio_general"]; ?></td>
              <td><?php echo $servigeneral["descripcion_contacto"]; ?></td>
              <td><?php echo $servigeneral["descripcion_servicio"]; ?></td>



              <td>
                <div class="btn-group" role="group" aria-label="">

                  <a id="btn1" href="?controlador=servigenerales&accion=info&id=<?php echo $servigeneral["id_servicios_generales"]; ?>" class="btn btn-warning">Más Info</a>
                  <?php if ($rol_id == 1 or $rol_id == 3 and $usuario == "matias") { ?>
                    <a href="?controlador=servigenerales&accion=editar&id=<?php echo $servigeneral["id_servicios_generales"]; ?>" class="btn btn-info">Editar</a>
                    <a href="?controlador=servigenerales&accion=borrar&id=<?php echo $servigeneral["id_servicios_generales"]; ?> &idDireccion=<?php echo $servigeneral["id_direccion"]; ?>" class="btn btn-danger">Borrar</a>

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