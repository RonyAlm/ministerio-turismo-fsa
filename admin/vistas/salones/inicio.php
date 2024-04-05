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
        <h1>Salones</h1>
      </div>
      <div class="col-sm-6">
        <ol class="breadcrumb float-sm-right">
          <li class="breadcrumb-item"><a class="text-success" href="index2.php?controlador=paginas&accion=inicio">Inicio</a></li>
          <li class="breadcrumb-item active">Salones</li>
        </ol>
      </div>
    </div>
  </div>
</section>

<div class="card">


  <div class="card-header">

    <?php if ($rol_id == 1 or $rol_id == 3 and $usuario == "admin") : ?>

      <a name="" id="" class="btn btn-success" href="?controlador=salones&accion=crear" role="button">Agregar</a>

    <?php else : ?>
      <a class="btn btn-success disabled" href="#" role="button">Agregar</a>
    <?php endif; ?>

    <a name="" id="" class="btn btn-secondary" href="?controlador=salones&accion=imprimir" role="button">Imprimir</a>

  </div>

  <div class="card-body">

    <div class="row">

      <div class="col-12 col-sm-6 col-md-3">
        <div class="info-box">
          <span class="info-box-icon bg-success elevation-1"><i class="fas fa-hotel"></i></span>
          <div class="info-box-content">
            <span class="info-box-text">Salones</span>

            <?php foreach ($cantidad_hotel as $estadistica) { ?>
              <span class="info-box-text">
                Total:
                <strong><?php echo $estadistica->conteo; ?></strong>
              </span>
            <?php } ?>

          </div>

        </div>

      </div>


    </div>

    <div class="row">
      <div class="col-lg-12">
        <table id="tblList" class="table table-bordered table-striped" cellspacing="0" width="100%">
          <thead>
            <tr style="background: linear-gradient(to right, #61ba6d, #83c331)">

              <th>Localidad</th>

              <th>Designacion</th>
              <th>Contacto</th>
              <th>Dirección</th>
              <th>Estado</th>
              <th>Acción</th>

            </tr>
          </thead>
          <tbody>

            <?php foreach ($inicio as $salones) : ?>

              <tr>

                <td><?php echo $salones["nombre_localidad"]; ?></td>
                <td><?php echo $salones["nombre_salones"]; ?></td>
                <td><?php echo $salones["descripcion_contacto"]; ?></td>
                <td><?php echo $salones["calle_direccion"]; ?></td>
                <?php if ($salones["descripcion_tipo_estado"] == "Activo") { ?>
                  <td><?php echo $salones["descripcion_tipo_estado"]; ?></td>
                <?php } ?>
                <?php if ($salones["descripcion_tipo_estado"] == "Falta Verificar") { ?>
                  <td><?php echo $salones["descripcion_tipo_estado"]; ?></td>
                <?php } ?>
                <?php if ($salones["descripcion_tipo_estado"] == "Baja") { ?>
                  <td><?php echo $salones["descripcion_tipo_estado"]; ?></td>
                <?php } ?>
                <?php if ($salones["descripcion_tipo_estado"] == "Centro de aislamiento") { ?>
                  <td><?php echo $salones["descripcion_tipo_estado"]; ?></td>
                <?php } ?>
                <?php if ($salones["descripcion_tipo_estado"] == "Cambio de domicilio") { ?>
                  <td><?php echo $salones["descripcion_tipo_estado"]; ?></td>
                <?php } ?>
                <?php if ($salones["descripcion_tipo_estado"] == "Se desconoce situación") { ?>
                  <td><?php echo $salones["descripcion_tipo_estado"]; ?></td>
                <?php } ?>
                <?php if ($salones["descripcion_tipo_estado"] == "Cierre temporario") { ?>
                  <td><?php echo $salones["descripcion_tipo_estado"]; ?></td>
                <?php } ?>
                <?php if ($salones["descripcion_tipo_estado"] == "No Fiscalizadas") { ?>
                  <td><?php echo $salones["descripcion_tipo_estado"]; ?></td>
                <?php } ?>
                <?php if ($salones["descripcion_tipo_estado"] == "Domicilio Virtual") { ?>
                  <td><?php echo $salones["descripcion_tipo_estado"]; ?></td>
                <?php } ?>

                <td class="project-actions text-right">
                  <div class="btn-group" role="group" aria-label="">

                    <a title="Más Infomación" href="?controlador=salones&accion=info&id=<?php echo $salones["id_salones"]; ?>" class="btn btn-primary btn-sm ">
                      <i class="fas fa-folder"></i>
                    </a>

                    <?php if ($rol_id == 1 or $rol_id == 3 and $usuario == "admin") : ?>

                      <a title="Editar" href="?controlador=salones&accion=editar&id=<?php echo $salones["id_salones"]; ?>" class="btn btn-success btn-sm">
                        <i class="fas fa-pencil-alt"></i>
                      </a>

                      <a title="Borrar" onclick="AlertDeletesalones(
                      <?= $salones['id_salones']; ?>,
                      <?= $salones['id_direccion']; ?>,
                      <?= $salones['id_serv_comple_alojamiento']; ?>)" class="btn btn-danger btn-sm">
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

            <?php endforeach; ?>

          </tbody>
          <tfoot>
            <tr style="background: linear-gradient(to right, #61ba6d, #83c331)">
              <th>Localidad</th>

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