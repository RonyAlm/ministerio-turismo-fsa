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

      <a name="" id="" class="btn btn-success" href="?controlador=Alojamientos&accion=crear" role="button">Agregar Alojamiento</a>

      <a name="" id="" class="btn btn-warning" href="?controlador=Alojamientos&accion=imprimir" role="button">IMPRIMIR</a>
    </div>

  <?php } ?>

  <div class="row">
    <div class="col-md-3 col-sm-6 col-12">
      <div class="info-box">
        <span class="info-box-icon bg-info"><i class="fas fa-hotel"></i></span>

        <div class="info-box-content">
          <span class="info-box-text text-center">Hoteles</span>
          <?php foreach ($cantidad_hotel as $estadistica) { ?>
            <span class="info-box-text">Cantidad Total: <?php echo $estadistica->conteo; ?> </span>
          <?php } ?>
          <?php foreach ($cantidad_hotel_plazas as $estadistica) { ?>
            <span class="info-box-text">Cantidad Plazas: <?php echo $estadistica->conteo; ?> </span>
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
          <span class="info-box-text text-center">Cabañas</span>
          <?php foreach ($cantidad_Cabaña as $estadistica) { ?>
            <span class="info-box-text">Cantidad Total: <?php echo $estadistica->conteo; ?> </span>
          <?php } ?>
          <?php foreach ($cantidad_Cabaña_plazas as $estadistica) { ?>
            <span class="info-box-text">Cantidad Plazas: <?php echo $estadistica->conteo; ?> </span>
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
          <span class="info-box-text text-center">Hospedaje</span>
          <?php foreach ($cantidad_Hospedaje as $estadistica) { ?>
            <span class="info-box-text">Cantidad Total: <?php echo $estadistica->conteo; ?> </span>
          <?php } ?>
          <?php foreach ($cantidad_Hospedaje_plazas as $estadistica) { ?>
            <span class="info-box-text">Cantidad Plazas: <?php echo $estadistica->conteo; ?> </span>
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
          <span class="info-box-text text-center">Alojamientos</span>
          <?php foreach ($cantidad_Total_Alojamientos as $estadistica) { ?>
            <span class="info-box-text">Cantidad Total: <?php echo $estadistica->conteo; ?> </span>
          <?php } ?>
          <?php foreach ($cantidad_Total_Alojamientos_Plazas as $estadistica) { ?>
            <span class="info-box-text">Cantidad Plazas: <?php echo $estadistica->conteo; ?> </span>
          <?php } ?>
        </div>
        <!-- /.info-box-content -->
      </div>
      <!-- /.info-box -->
    </div>
    <!-- /.col -->
  </div>

  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <table id="example1" class="table table-bordered table-striped" cellspacing="0" width="100%">
          <thead>
            <tr style="background: linear-gradient(to right, #61ba6d, #83c331)" align="center">

              <th>Localidad</th>
              <th>Categoría</th>
              <th>Designacion Comercial</th>
              <th>Contacto</th>
              <th>Dirección</th>
              <th>Estado</th>
              <th>Acción</th>

            </tr>
          </thead>
          <tbody>


            <?php foreach ($inicioAlojamiento as $alojamiento) { ?>

              <tr>

                <td><?php echo $alojamiento["nombre_localidad"]; ?></td>
                <td><?php echo $alojamiento["descripcion_tipo_alojamiento"]; ?></td>
                <td><?php echo $alojamiento["descripcion_alojamientos"]; ?></td>
                <td><?php echo $alojamiento["descripcion_contacto"]; ?></td>
                <td><?php echo $alojamiento["calle_direccion"]; ?></td>
                <?php if ($alojamiento["descripcion_tipo_estado"] == "Activo") { ?>
                  <td class="badge badge-success"><?php echo $alojamiento["descripcion_tipo_estado"]; ?></td>
                <?php } ?>
                <?php if ($alojamiento["descripcion_tipo_estado"] == "Falta Verificar") { ?>
                  <td class="badge badge-warning"><?php echo $alojamiento["descripcion_tipo_estado"]; ?></td>
                <?php } ?>
                <?php if ($alojamiento["descripcion_tipo_estado"] == "Baja") { ?>
                  <td class="badge badge-danger"><?php echo $alojamiento["descripcion_tipo_estado"]; ?></td>
                <?php } ?>
                <?php if ($alojamiento["descripcion_tipo_estado"] == "Centro de aislamiento") { ?>
                  <td class="badge badge-secondary"><?php echo $alojamiento["descripcion_tipo_estado"]; ?></td>
                <?php } ?>
                <?php if ($alojamiento["descripcion_tipo_estado"] == "Cambio de domicilio") { ?>
                  <td class="badge bg-lime"><?php echo $alojamiento["descripcion_tipo_estado"]; ?></td>
                <?php } ?>
                <?php if ($alojamiento["descripcion_tipo_estado"] == "Se desconoce situación") { ?>
                  <td class="badge bg-orange"><?php echo $alojamiento["descripcion_tipo_estado"]; ?></td>
                <?php } ?>
                <?php if ($alojamiento["descripcion_tipo_estado"] == "Cierre temporario") { ?>
                  <td class="badge bg-purple"><?php echo $alojamiento["descripcion_tipo_estado"]; ?></td>
                <?php } ?>
                <?php if ($alojamiento["descripcion_tipo_estado"] == "No Fiscalizadas") { ?>
                  <td class="badge bg-navy"><?php echo $alojamiento["descripcion_tipo_estado"]; ?></td>
                <?php } ?>
                <?php if ($alojamiento["descripcion_tipo_estado"] == "Domicilio Virtual") { ?>
                  <td class="badge bg-info"><?php echo $alojamiento["descripcion_tipo_estado"]; ?></td>
                <?php } ?>


                <td class="project-actions text-right">
                  <div class="btn-group" role="group" aria-label="">

                    <a href="?controlador=Alojamientos&accion=info&id=<?php echo $alojamiento["id_alojamientos"]; ?>" class="btn btn-primary btn-sm">
                      <i class="fas fa-folder">
                      </i>Más Info
                    </a>
                    <?php if ($rol_id == 1 or $rol_id == 3) { ?>
                      <a href="?controlador=Alojamientos&accion=editar&id=<?php echo $alojamiento["id_alojamientos"]; ?>" <a class="btn btn-info btn-sm">
                        <i class="fas fa-pencil-alt">
                        </i>Editar
                      </a>
                      <a href="?controlador=Alojamientos&accion=borrar&id=<?php echo $alojamiento["id_alojamientos"]; ?>  &idDireccion=<?php echo $alojamiento["id_direccion"]; ?>  &idRazonSocial=<?php echo $alojamiento["id_razon_social"]; ?>  &idServicios=<?php echo $alojamiento["rela_aloja_servicios"]; ?>  &idServiciosComple=<?php echo $alojamiento["rela_aloja_serv_adicionales"]; ?>" class="btn btn-danger btn-sm">
                        <i class="fas fa-trash">
                        </i>Borrar
                      </a>

                  </div>

                </td>
              <?php } ?>
              </tr>


            <?php } ?>
          </tbody>
        </table>
      </div>
    </div>
  </div>


</div>