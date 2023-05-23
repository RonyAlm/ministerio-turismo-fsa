  <?php

    if (!isset($_SESSION['id'])) {
        header("Location: index.php");
    }

    $usuario = $_SESSION['usuarios'];
    $rol_id = $_SESSION['rol_id'];
    $acceso = $_SESSION['tablas_acceso'];
    ?>
  <div class="card">
      <?php if ($rol_id == 1 or $rol_id == 3 and $usuario == "admin") { ?>
          <div class="card-header">

              <a name="" id="" class="btn btn-success" href="?controlador=transporte&accion=crear" role="button">Agregar Transporte</a>

          </div>
      <?php } ?>
      <!-- Content Header (Page header) -->
      <section class="content-header">
          <div class="container-fluid">
              <h2 class="text-center display-4">Transportes</h2>
          </div>
          <!-- /.container-fluid -->
      </section>

      <!-- Main content -->
      <section class="content">
          <div class="card">


              <div class="card-body">

                  <div id="acordeon" class="row">
                      <div class="col-lg-12">
                          <table id="tblList" class="table table-bordered table-striped" cellspacing="0" width="100%">
                              <thead>
                                  <tr style="background: linear-gradient(to right, #61ba6d, #83c331)">
                                      <th>Empresa</th>
                                      <th>Origen</th>
                                      <th>Destino</th>
                                      <th>Acción</th>
                                  </tr>
                              </thead>
                              <tbody>

                                  <?php foreach ($tabla as $transporte) { ?>

                                      <tr>

                                          <td><?php echo $transporte["nombre_empresa"]; ?></td>
                                          <td><?php echo $transporte["origen"]; ?></td>
                                          <td><?php echo $transporte["destino"]; ?></td>
                                          <td class="project-actions text-right">
                                              <div class="btn-group" role="group" aria-label="">

                                                  <a title="Más Infomación" id="btn1" href="?controlador=transporte&accion=info&id=<?= $transporte["id_origen_destino"]; ?>" class="btn btn-primary btn-sm">
                                                      <i class="fas fa-folder"></i>
                                                  </a>

                                                  <?php if ($rol_id == 1 or $rol_id == 3 and $usuario == "matias") : ?>

                                                      <a title="Editar" href="?controlador=transporte&accion=editar&id=<?php echo $transporte["id_origen_destino"]; ?>" class="btn btn-success btn-sm">
                                                          <i class="fas fa-pencil-alt"></i>
                                                      </a>
                                                      <a title="Borrar" href="?controlador=transporte&accion=borrar&id=<?php echo $transporte["id_origen_destino"]; ?>" class="btn btn-danger btn-sm">
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
                                      <th>Empresa</th>
                                      <th>Origen</th>
                                      <th>Destino</th>
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
      </section>
  </div>