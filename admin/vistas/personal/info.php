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
        <h1>Información de los Personales</h1>
      </div>
      <div class="col-sm-6">
        <ol class="breadcrumb float-sm-right">
          <li class="breadcrumb-item"><a class="text-success" href="index2.php?controlador=personal&accion=inicio">Personales</a></li>
          <li class="breadcrumb-item active">Información de los Personales</li>
        </ol>
      </div>
    </div>
  </div>
</section>

<!-- Main content -->
<section class="content">

  <div class="row">
    <div class="col-md-12">
      <div class="card">
        <div class="card-header">

        </div>
        <!-- /.card-header -->
        <div class="card-body">
          <!-- we are adding the accordion ID so Bootstrap's collapse plugin detects it -->
          <div id="accordion">

            <?php
            $conteo = 0;
            ?>
            <?php foreach ($tablaInfo2 as $tabla) { ?>

              <?php
              // echo $conteo;
              ?>

              <div class="card card-success card-outline">
                <div class="card-header">
                  <h4 class="card-title text-success w-100">
                    <a class="d-block w-100 text-success" data-toggle="collapse" href="#collapse<?php echo $conteo ?>">
                      <?php echo $tabla["descriArea"]; ?>
                    </a>
                  </h4>
                </div>

                <div id="collapse<?php echo $conteo ?>" class="collapse show" data-parent="#accordion">
                  <div class="card-body">
                    <div id="acordeon" class="row">
                      <div class="col-lg-12">

                        <table id="tblList" class="table  table-bordered table-striped" cellspacing="0" width="100%">
                          <thead>
                            <tr class="table-success">
                              <th>ID</th>
                              <th>Nombre</th>
                              <th>Estado</th>
                              <th>Acción</th>
                            </tr>
                          </thead>
                          <tbody>

                            <?php foreach ($tablaInformes as $tabla1) : ?>
                              <?php if ($tabla["rela_area"] == $tabla1["rela_area"]) : ?>

                                <tr>

                                  <td><?php echo $tabla1["id_personal"]; ?></td>
                                  <td><?php echo $tabla1["full_name"]; ?></td>
                                  <td><?php echo $tabla1["tipoestado"]; ?></td>
                                  <td class="project-actions text-right">
                                    <div class="btn-group" role="group" aria-label="">

                                      <a title="Más Infomación" id="btn1" href="?controlador=personal&accion=infopersonal&id=<?= $tabla1["id_personal"]; ?>&idPersona=<?php echo $tabla1["id_persona"]; ?>" class="btn btn-primary btn-sm">
                                        <i class="fas fa-folder"></i>
                                      </a>

                                      <?php if ($rol_id == 1 or $rol_id == 3 and $usuario == "rrhh") { ?>
                                        <a title="Editar" href="?controlador=personal&accion=editar&id=<?php echo $tabla1["id_personal"]; ?>&idPersona=<?php echo $tabla1["id_persona"]; ?>" class="btn btn-success btn-sm">
                                          <i class="fas fa-pencil-alt"></i>
                                        </a>
                                        <a title="Borrar" onclick="AlertDeletePersonal(<?= $tabla1['id_personal']; ?>)" class="btn btn-danger btn-sm">
                                          <i class="fas fa-trash"></i>
                                        </a>

                                      <?php } ?>
                                    </div>
                                  </td>

                                </tr>

                              <?php endif; ?>
                            <?php endforeach; ?>

                            <!-- fin del php -->

                          </tbody>
                          <tfoot>
                            <tr class="table-success">
                              <th>ID</th>
                              <th>Nombre</th>
                              <th>Estado</th>
                              <th>Acción</th>
                            </tr>
                          </tfoot>
                        </table>
                      </div>
                    </div>
                  </div>
                </div>


                <?php
                $conteo++;
                ?>
              </div>
            <?php } ?>


          </div>
        </div>
        <!-- /.card-body -->
      </div>
      <!-- /.card -->
    </div>

    <!-- /.col -->
  </div>

</section>