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

      <a name="" id="" class="btn btn-success" href="?controlador=agencias&accion=crear" role="button">Agregar Agencia</a>

    </div>
  <?php } ?>

  <div class="row">
    <div class="col-md-3 col-sm-6 col-12">
      <div class="info-box">
        <span class="info-box-icon bg-info"><i class="fas fa-hotel"></i></span>

        <div class="info-box-content">
          <span class="info-box-text text-center">Agencias</span>
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
        <span class="info-box-icon bg-info"><i class="fas fa-hotel"></i></span>

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


  <div class="card-body">

    <div id="acordeon">
      <table id="example1" class="table table-bordered table-striped" cellspacing="0" width="100%">
        <thead>
          <tr>

            <th>Localidad</th>
            <th>Designacion Comercial</th>
            <th>Contacto</th>
            <th>Dirección</th>
            <th>Estado</th>
            <th>Acción</th>
          </tr>
        </thead>
        <tbody>


          <?php foreach ($tablaAgencia as $agencia) { ?>

            <tr>

              <td><?php echo $agencia["nombre_localidad"]; ?></td>
              <td><?php echo $agencia["descripcion_agencias"]; ?></td>
              <td><?php echo $agencia["descripcion_contacto"]; ?></td>
              <td><?php echo $agencia["calle_direccion"]; ?></td>
              <td><?php echo $agencia["descripcion_tipo_estado"]; ?></td>



              <td>
                <div class="btn-group" role="group" aria-label="">

                  <a id="btn1" href="?controlador=agencias&accion=info&id=<?php echo $agencia["id_agencias"]; ?>" class="btn btn-warning">Más Info</a>
                  <?php if ($rol_id == 1 or $rol_id == 3 and $usuario == "matias") { ?>
                    <a href="?controlador=agencias&accion=editar&id=<?php echo $agencia["id_agencias"]; ?>" class="btn btn-info">Editar</a>
                    <a href="?controlador=agencias&accion=borrar&id=<?php echo $agencia["id_agencias"]; ?>
                                                                            &idDireccion=<?php echo $agencia["id_direccion"]; ?>
                                                                            &idRazonSocial=<?php echo $agencia["id_razon_social"]; ?>" class="btn btn-danger">Borrar</a>

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