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
        <h1>Alojamientos</h1>
      </div>
      <div class="col-sm-6">
        <ol class="breadcrumb float-sm-right">
          <li class="breadcrumb-item"><a class="text-success" href="index2.php?controlador=paginas&accion=inicio">Inicio</a></li>
          <li class="breadcrumb-item active">Alojamientos</li>
        </ol>
      </div>
    </div>
  </div>
</section>

<div class="card">

  <?php if ($rol_id == 1 or $rol_id == 3) { ?>
    <div class="card-header">

      <a name="" id="" class="btn btn-success" href="?controlador=Alojamientos&accion=crear" role="button">Agregar</a>

      <a name="" id="" class="btn btn-secondary" href="?controlador=Alojamientos&accion=imprimir" role="button">Imprimir</a>

    </div>

  <?php } ?>

  <div class="card-body">

    <div class="row">
      <div class="col-md-3 col-sm-6 col-12">
        <div class="info-box">
          <span class="info-box-icon bg-success"><i class="fas fa-hotel"></i></span>

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
          <span class="info-box-icon bg-success"><i class=" fa-solid fa-tents"></i></span>

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
          <span class="info-box-icon bg-success"><i class="fas fa-bed"></i></span>

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
          <span class="info-box-icon bg-success"><i class=" fas fa-building"></i></span>

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

    <div class="row">
      <div class="col-lg-12">
        <table id="tblList" class="table table-bordered table-striped" cellspacing="0" width="100%">
          <thead>
            <tr style="background: linear-gradient(to right, #61ba6d, #83c331)">

              <th>Localidad</th>
              <th>Categoría</th>
              <th>Designacion</th>
              <th>Contacto</th>
              <th>Dirección</th>
              <th>Estado</th>
              <th>Acción</th>

            </tr>
          </thead>
          <tbody>

            <?php foreach ($inicioAlojamiento as $alojamiento) : ?>

              <tr>

                <td><?php echo $alojamiento["nombre_localidad"]; ?></td>
                <td><?php echo $alojamiento["descripcion_tipo_alojamiento"]; ?></td>
                <td><?php echo $alojamiento["descripcion_alojamientos"]; ?></td>
                <td><?php echo $alojamiento["descripcion_contacto"]; ?></td>
                <td><?php echo $alojamiento["calle_direccion"]; ?></td>
                <?php if ($alojamiento["descripcion_tipo_estado"] == "Activo") { ?>
                  <td><?php echo $alojamiento["descripcion_tipo_estado"]; ?></td>
                <?php } ?>
                <?php if ($alojamiento["descripcion_tipo_estado"] == "Falta Verificar") { ?>
                  <td><?php echo $alojamiento["descripcion_tipo_estado"]; ?></td>
                <?php } ?>
                <?php if ($alojamiento["descripcion_tipo_estado"] == "Baja") { ?>
                  <td><?php echo $alojamiento["descripcion_tipo_estado"]; ?></td>
                <?php } ?>
                <?php if ($alojamiento["descripcion_tipo_estado"] == "Centro de aislamiento") { ?>
                  <td><?php echo $alojamiento["descripcion_tipo_estado"]; ?></td>
                <?php } ?>
                <?php if ($alojamiento["descripcion_tipo_estado"] == "Cambio de domicilio") { ?>
                  <td><?php echo $alojamiento["descripcion_tipo_estado"]; ?></td>
                <?php } ?>
                <?php if ($alojamiento["descripcion_tipo_estado"] == "Se desconoce situación") { ?>
                  <td><?php echo $alojamiento["descripcion_tipo_estado"]; ?></td>
                <?php } ?>
                <?php if ($alojamiento["descripcion_tipo_estado"] == "Cierre temporario") { ?>
                  <td><?php echo $alojamiento["descripcion_tipo_estado"]; ?></td>
                <?php } ?>
                <?php if ($alojamiento["descripcion_tipo_estado"] == "No Fiscalizadas") { ?>
                  <td><?php echo $alojamiento["descripcion_tipo_estado"]; ?></td>
                <?php } ?>
                <?php if ($alojamiento["descripcion_tipo_estado"] == "Domicilio Virtual") { ?>
                  <td><?php echo $alojamiento["descripcion_tipo_estado"]; ?></td>
                <?php } ?>

                <td class="project-actions text-right">
                  <div class="btn-group" role="group" aria-label="">

                    <a title="Más Infomación" href="?controlador=Alojamientos&accion=info&id=<?php echo $alojamiento["id_alojamientos"]; ?>" class="btn btn-primary btn-sm">
                      <i class="fas fa-folder"></i>
                    </a>

                    <?php if ($rol_id == 1 or $rol_id == 3) : ?>

                      <a title="Editar" href="?controlador=Alojamientos&accion=editar&id=<?php echo $alojamiento["id_alojamientos"]; ?>" class="btn btn-success btn-sm">
                        <i class="fas fa-pencil-alt"></i>
                      </a>
                      <a title="Borrar" href="?controlador=Alojamientos&accion=borrar&id=<?php echo $alojamiento["id_alojamientos"]; ?>  &idDireccion=<?php echo $alojamiento["id_direccion"]; ?>  &idRazonSocial=<?php echo $alojamiento["id_razon_social"]; ?>  &idServicios=<?php echo $alojamiento["rela_aloja_servicios"]; ?>  &idServiciosComple=<?php echo $alojamiento["rela_aloja_serv_adicionales"]; ?>" class="btn btn-danger btn-sm">
                        <i class="fas fa-trash"></i>
                      </a>

                    <?php endif; ?>

                  </div>
                </td>

              </tr>

            <?php endforeach; ?>

          </tbody>
          <tfoot>
            <tr style="background: linear-gradient(to right, #61ba6d, #83c331)">
              <th>Localidad</th>
              <th>Categoría</th>
              <th>Designacion</th>
              <th>Contacto</th>
              <th>Dirección</th>
              <th>Estado</th>
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