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
        <h1>Prestadores</h1>
      </div>
      <div class="col-sm-6">
        <ol class="breadcrumb float-sm-right">
          <li class="breadcrumb-item"><a class="text-success" href="index2.php?controlador=paginas&accion=inicio">Inicio</a></li>
          <li class="breadcrumb-item active">Prestadores</li>
        </ol>
      </div>
    </div>
  </div>
</section>

<div class="card">

  <div class="card-header">

    <?php if ($rol_id == 1 or $acceso == 11) : ?>

      <a name="" id="" class="btn btn-success" href="?controlador=prestadores&accion=crear" role="button">Agregar</a>

    <?php else : ?>
      <a class="btn btn-success disabled" href="#" role="button">Agregar</a>
    <?php endif; ?>

    <a name="" id="" class="btn btn-secondary" href="?controlador=prestadores&accion=imprimir" role="button">Imprimir</a>

  </div>


  <div class="card-body">

    <div class="row">
      <div class="col-md-3 col-sm-6 col-12">
        <div class="info-box">
          <span class="info-box-icon bg-success"><i class="fas fa-hotel"></i></span>

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
          <span class="info-box-icon bg-success"><i class="fa-solid fa-arrows-down-to-people"></i></span>

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
          <span class="info-box-icon bg-success"><i class="fa-solid fa-person-chalkboard"></i></span>

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
          <span class="info-box-icon bg-success"><i class="fa-solid fa-tent-arrow-turn-left"></i></span>

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

    <div class="row" id="acordeon">

      <div class="col-lg-12">

        <table id="tblList" class="table table-bordered table-striped" cellspacing="0" width="100%">

          <thead>
            <tr style="background: linear-gradient(to right, #61ba6d, #83c331)">
              <th>Localidad</th>
              <th>Apellido y Nombre</th>
              <th>Institución / Emprendimiento</th>
              <th>Contacto</th>
              <th>Dirección</th>
              <th>Servicio</th>
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
                <td><?php echo $prestadore["descrip_tipo_serv_prestadores"]; ?></td>
                <td class="project-actions text-right">
                  <div class="btn-group" role="group" aria-label="">

                    <a title="Más Infomación" href="?controlador=prestadores&accion=info&id=<?php echo $prestadore["id_prestador"]; ?>" class="btn btn-primary btn-sm">
                      <i class="fas fa-folder"></i>
                    </a>

                    <?php if ($rol_id == 1 or $acceso == 11) : ?>

                      <a title="Editar" href="?controlador=prestadores&accion=editar&id=<?php echo $prestadore["id_prestador"]; ?>" class="btn btn-success btn-sm">
                        <i class="fas fa-pencil-alt"></i>
                      </a>
                      <a title="Borrar" href="?controlador=prestadores&accion=borrar&id=<?php echo $prestadore["id_prestador"]; ?>
                         &idDireccion=<?php echo $prestadore["id_direccion"]; ?>" class="btn btn-danger btn-sm">
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
              <th>Localidad</th>
              <th>Apellido y Nombre</th>
              <th>Institución / Emprendimiento</th>
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

  <div class="card-footer"></div>

</div>