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
        <h1>Transportes 1</h1>
      </div>
      <div class="col-sm-6">
        <ol class="breadcrumb float-sm-right">
          <li class="breadcrumb-item"><a class="text-success" href="index2.php?controlador=transportes&accion=inicio">Inicio</a></li>
          <li class="breadcrumb-item active">Transportes</li>
        </ol>
      </div>
    </div>
  </div>
</section>

<div class="card">
  <div class="card-header">

    <?php if ($rol_id == 1 or $rol_id == 3 and $usuario == "ceciliag") : ?>

      <a name="" id="" class="btn btn-success" href="?controlador=Transportes&accion=crear" role="button">Agregar</a>

    <?php else : ?>
      <a class="btn btn-success disabled" href="#" role="button">Agregar</a>
    <?php endif; ?>

    <a name="" id="" class="btn btn-secondary" href="?controlador=Transportes&accion=imprimir" role="button">Imprimir</a>

  </div>

  <div class="card-body">

    <div class="row">
      <div class="col-md-3 col-sm-6 col-12">
        <div class="info-box">
          <span class="info-box-icon bg-success"><i class="fa-solid fa-building"></i></span>

          <div class="info-box-content">
            <span class="info-box-text text-center">Transportes</span>
            <?php foreach ($cantidad_Transportes as $estadistica) { ?>
              <span class="info-box-text">Cantidad Total: <?php echo $estadistica->conteo; ?> </span>
            <?php } ?>
          </div>
          <!-- /.info-box-content -->
        </div>
        <!-- /.info-box -->
      </div>
    </div>




    <div id="acordeon" class="row">
      <div class="col-lg-12">
        <table id="tblList" class="table table-bordered table-striped" cellspacing="0" width="100%">
          <thead>
            <tr style="background: linear-gradient(to right, #61ba6d, #83c331)">
              <th>Localidad</th>
              <th>Designacion</th>
              <th>Contacto</th>
              <th>Servicio</th>
              <th>Estado</th>
              <th>Acción</th>
            </tr>
          </thead>
          <tbody>

            <?php foreach ($tabla as $transporte) { ?>

              <tr>

                <td><?php echo $transporte["nombre_localidad"]; ?></td>
                <td><?php echo $transporte["designacion_transporte"]; ?></td>
                <td><?php echo $transporte["descri_contacto_transporte"]; ?></td>
                <td><?php echo $transporte["descripcion_serv_transportes"]; ?></td>
                <td><?php echo $transporte["descripcion_tipo_estado"]; ?></td>
                <td class="project-actions text-right">
                  <div class="btn-group" role="group" aria-label="">

                    <a title="Más Infomación" id="btn1" href="?controlador=Transportes&accion=info&id=<?= $transporte["id_transportes"]; ?>" class="btn btn-primary btn-sm">
                      <i class="fas fa-folder"></i>
                    </a>

                    <?php if ($rol_id == 1 or $rol_id == 3 and $usuario == "ceciliag") : ?>

                      <a title="Editar" href="?controlador=Transportes&accion=editar&id=<?php echo $transporte["id_transportes"]; ?>" class="btn btn-success btn-sm">
                        <i class="fas fa-pencil-alt"></i>
                      </a>

                      <a title="Borrar" onclick="AlertDeleteTransportes(
                      <?= $transporte['id_transportes']; ?>,
                      <?= $transporte['id_direccion']; ?>)" class="btn btn-danger btn-sm">
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
              <th>Designacion</th>
              <th>Contacto</th>
              <th>Servicio</th>
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