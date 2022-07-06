<?php

if (!isset($_SESSION['id'])) {
  header("Location: index.php");
}

$usuario = $_SESSION['usuarios'];
$rol_id = $_SESSION['rol_id'];



?>

<!-- Main content -->
<section class="content">

  <div class="row">
    <div class="col-md-12">
      <div class="card">
        <div class="card-header">
          <h3 class="card-title">INFORMACIÓN RESUMIDA DEL PERSONAL</h3>
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
              echo $conteo;
              ?>

              <div class="card card-primary">
                <div class="card-header">
                  <h4 class="card-title w-100">
                    <a class="d-block w-100" data-toggle="collapse" href="#collapse<?php echo $conteo ?>">
                      <?php echo $tabla["descripcion"]; ?>
                    </a>
                  </h4>
                </div>

                <?php foreach ($tablaInformes as $tabla1) { ?>

                  <?php if ($tabla["rela_area"] == $tabla1["rela_area"]) { ?>

                    <div id="#collapse<?php echo $conteo ?>" class="collapse show" data-parent="#accordion">
                      <div class="card-body">
                        <div id="acordeon" class="row">
                          <div class="col-lg-12">

                            <table id="tblList" class="table table-bordered table-striped" cellspacing="0" width="100%">
                              <thead>
                                <tr style="background: linear-gradient(to right, #61ba6d, #83c331)">
                                  <th>id</th>
                                  <th>nombre</th>
                                  <th>estado</th>
                                  <th>Acción</th>
                                </tr>
                              </thead>
                              <tbody>



                                <tr>

                                  <td><?php echo $tabla1["id_personal"]; ?></td>
                                  <td><?php echo $tabla1["full_name"]; ?></td>
                                  <td><?php echo $tabla1["tipoestado"]; ?></td>
                                  <td class="project-actions text-right">
                                    <div class="btn-group" role="group" aria-label="">

                                      <a title="Más Infomación" id="btn1" href="?controlador=personal&accion=info&id=<?= $tabla1["id_personal"]; ?>" class="btn btn-primary btn-sm">
                                        <i class="fas fa-folder"></i>
                                      </a>

                                      <?php if ($rol_id == 1 or $rol_id == 3 and $usuario == "matias") { ?>
                                        <a title="Editar" href="?controlador=personal&accion=editar&id=<?php echo $tabla1["id_personal"]; ?>" class="btn btn-success btn-sm">
                                          <i class="fas fa-pencil-alt"></i>
                                        </a>
                                        <a title="Borrar" href="?controlador=personal&accion=borrar&id=<?php echo $tabla1["id_personal"]; ?>" class="btn btn-danger btn-sm">
                                          <i class="fas fa-trash"></i>
                                        </a>

                                      <?php } ?>
                                    </div>
                                  </td>

                                </tr>

                                <!-- fin del php -->

                              </tbody>
                              <tfoot>
                                <tr style="background: linear-gradient(to right, #61ba6d, #83c331)">
                                  <th>id</th>
                                  <th>nombre</th>
                                  <th>estado</th>
                                  <th>Acción</th>
                                </tr>
                              </tfoot>
                            </table>
                          </div>
                        </div>
                      </div>
                    </div>
                  <?php } ?>

                <?php } ?>
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