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
        <h1>Servicios generales</h1>
      </div>
      <div class="col-sm-6">
        <ol class="breadcrumb float-sm-right">
          <li class="breadcrumb-item"><a class="text-success" href="index2.php?controlador=paginas&accion=inicio">Inicio</a></li>
          <li class="breadcrumb-item active">Servicios</li>
        </ol>
      </div>
    </div>
  </div>
</section>

<div class="card">

  <div class="card-header">

    <?php if ($rol_id == 1 or $rol_id == 3 and $usuario == "admin") : ?>

      <a name="" id="" class="btn btn-success" href="?controlador=servigenerales&accion=crear" role="button">Agregar</a>

    <?php else : ?>
      <a class="btn btn-success disabled" href="#" role="button">Agregar</a>
    <?php endif; ?>

    <a name="" id="" class="btn btn-secondary" href="?controlador=servigenerales&accion=imprimir" role="button">Imprimir</a>

  </div>

  <div class="card-body">

    <div class="row">
      <div class="col-md-3 col-sm-6 col-12">
        <div class="info-box">
          <span class="info-box-icon bg-success"><i class="fa-solid fa-water-ladder"></i></i></span>

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
          <span class="info-box-icon bg-success"><i class="fa-solid fa-umbrella-beach"></i></span>

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
          <span class="info-box-icon bg-success"><i class="fa-solid fa-bridge-water"></i></span>

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
          <span class="info-box-icon bg-success"><i class="fa-solid fa-tents"></i></span>

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

    <div class="row" id="acordeon">

      <div class="col-lg-12">

        <table id="tblList" class="table table-bordered table-striped" cellspacing="0" width="100%">
          <thead>
            <tr style="background: linear-gradient(to right, #61ba6d, #83c331)">
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
                <td class="project-actions text-right">
                  <div class="btn-group" role="group">

                    <a title="Más información" id="btn1" href="?controlador=servigenerales&accion=info&id=<?php echo $servigeneral["id_servicios_generales"]; ?>" class="btn btn-primary btn-sm"> <i class="fas fa-folder"></i>
                    </a>

                    <?php if ($rol_id == 1 or $rol_id == 3 and $usuario == "admin") : ?>

                      <a title="Editar" href="?controlador=servigenerales&accion=editar&id=<?php echo $servigeneral["id_servicios_generales"]; ?>" class="btn btn-success btn-sm">
                        <i class="fas fa-pencil-alt"></i>
                      </a>
                      <a title="Borrar" href="?controlador=servigenerales&accion=borrar&id=<?php echo $servigeneral["id_servicios_generales"]; ?> &idDireccion=<?php echo $servigeneral["id_direccion"]; ?>" class="btn btn-danger btn-sm">
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
              <th>Tipo</th>
              <th>Localidad</th>
              <th>Nombre</th>
              <th>Contacto</th>
              <th>Tipo Servicio</th>
              <th>Acción</th>
            </tr>
          </tfoot>
        </table>

      </div>

    </div>

  </div>

  <div class="card-footer"></div>


</div>