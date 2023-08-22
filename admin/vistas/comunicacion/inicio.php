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
        <h1>Comunicación</h1>
      </div>
      <div class="col-sm-6">
        <ol class="breadcrumb float-sm-right">
          <li class="breadcrumb-item"><a class="text-success" href="index2.php?controlador=comunicacion&accion=inicio">Inicio</a></li>
          <li class="breadcrumb-item active">Comunicación</li>
        </ol>
      </div>
    </div>
  </div>
</section>

<div class="card">
  <div class="card-header">

    <?php if ($rol_id == 1 or $acceso == 15) : ?>

      <a name="" id="" class="btn btn-success" href="?controlador=comunicacion&accion=crear" role="button">Agregar</a>

    <?php else : ?>
      <a class="btn btn-success disabled" href="#" role="button">Agregar</a>
    <?php endif; ?>


  </div>

  <div class="card-body">

    <div class="row">
      <div class="col-md-3 col-sm-6 col-12">
        <div class="info-box">
          <span class="info-box-icon bg-success"><i class="fa-solid fa-building"></i></span>

          <div class="info-box-content">
            <span class="info-box-text text-center">Notas Recibidas</span>

            <?php foreach ($cantidad_notasIngreso as $estadistica) { ?>
              <span class="info-box-text">Cantidad Total: <?php echo $estadistica->conteoIngreso; ?> </span>
            <?php } ?>
          </div>
          <!-- /.info-box-content -->
        </div>
        <!-- /.info-box -->
      </div>
      <div class="col-md-3 col-sm-6 col-12">
        <div class="info-box">
          <span class="info-box-icon bg-success"><i class="fa-solid fa-building"></i></span>

          <div class="info-box-content">
            <span class="info-box-text text-center">Salida de Notas</span>

            <?php foreach ($cantidad_notasSalida as $estadistica) { ?>
              <span class="info-box-text">Cantidad Total: <?php echo $estadistica->conteoSalida; ?> </span>
            <?php } ?>
          </div>
          <!-- /.info-box-content -->
        </div>
        <!-- /.info-box -->
      </div>
      <div class="col-md-3 col-sm-6 col-12">
        <div class="info-box">
          <span class="info-box-icon bg-success"><i class="fa-solid fa-building"></i></span>

          <div class="info-box-content">
            <span class="info-box-text text-center">Total de Notas</span>

            <?php foreach ($cantidad_notas as $estadistica) { ?>
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
              <th>Ingreso de Notas</th>
              <th>Remitente</th>
              <th>Organismo</th>
              <th>Motivo</th>
              <th>Salida de notas</th>
              <th>Acción</th>
            </tr>
          </thead>
          <tbody>

            <?php foreach ($tabla as $notas) { ?>

              <tr>

                <td><?php echo $notas["fecha_ig_notas"]; ?></td>
                <td><?php echo $notas["remitente_nota"]; ?></td>
                <td><?php echo $notas["descripcion_org_nota"]; ?></td>
                <td><?php echo $notas["descripcion_tipo_mot_notas"]; ?></td>
                <td><?php echo $notas["fecha_sl_nota"]; ?></td>
                <td class="project-actions text-right">
                  <div class="btn-group" role="group" aria-label="">

                    <a title="Más Infomación" id="btn1" href="?controlador=comunicacion&accion=info&id=<?= $notas["id_notas"]; ?>" class="btn btn-primary btn-sm">
                      <i class="fas fa-folder"></i>
                    </a>

                    <?php if ($rol_id == 1 or $acceso == 16) : ?>

                      <a title="Editar" href="?controlador=comunicacion&accion=editar&id=<?php echo $notas["id_notas"]; ?>" class="btn btn-success btn-sm">
                        <i class="fas fa-pencil-alt"></i>
                      </a>

                      <a title="Borrar" onclick="AlertDeletenotas(
                      <?= $notas['id_notas']; ?>,
                      <?= $notas['id_direccion_notas']; ?>)" class="btn btn-danger btn-sm">
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
              <th>Ingreso de Notas</th>
              <th>Remitente</th>
              <th>Organismo</th>
              <th>Motivo</th>
              <th>Salida de notas</th>
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

<!-- MODAL DE AGREGAR USUARIO Y ROLES -->
<div class="modal fade" id="modal-MotivoNotas">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Agregar Motivos y Organismos</h5>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <form id="formularioModalUsuarioRol" name="agregarUsuarioRol" method="POST">
        <div class="modal-body">
          <div class="form-group">
            <label for="inputMotivo">Motivo</label>
            <input type="text" class="form-control" name="inputMotivo" id="inputMotivo" placeholder="Ingrese el motivo">
          </div>
          <div class="form-group">
            <label for="inputOrg">Organismo</label>
            <input type="text" class="form-control" name="inputOrg" id="inputOrg" placeholder="Ingrese el Organismo">
          </div>

        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
          <button type="submit" class="btn btn-primary">Guardar</button>
        </div>
      </form>
    </div>
  </div>
</div>