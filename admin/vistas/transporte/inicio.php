  <?php

    if (!isset($_SESSION['id'])) {
        header("Location: index.php");
    }

    $usuario = $_SESSION['usuarios'];
    $rol_id = $_SESSION['rol_id'];

    ?>
  <div class="card">
      <?php if ($rol_id == 1 or $rol_id == 3 and $usuario == "matias") { ?>
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
          <div class="container-fluid">
              <form action="enhanced-results.html">
                  <div class="row">
                      <div class="col-md-10 offset-md-1">
                          <div class="row">
                              <div class="col-6">
                                  <div class="form-group">
                                      <label>Result Type:</label>
                                      <select class="select2" multiple="multiple" data-placeholder="Any" style="width: 100%;">
                                          <option>Text only</option>
                                          <option>Images</option>
                                          <option>Video</option>
                                      </select>
                                  </div>
                              </div>
                              <div class="col-3">
                                  <div class="form-group">
                                      <label>Sort Order:</label>
                                      <select class="select2" style="width: 100%;">
                                          <option selected>ASC</option>
                                          <option>DESC</option>
                                      </select>
                                  </div>
                              </div>
                              <div class="col-3">
                                  <div class="form-group">
                                      <label>Order By:</label>
                                      <select class="select2" style="width: 100%;">
                                          <option selected>Title</option>
                                          <option>Date</option>
                                      </select>
                                  </div>
                              </div>
                          </div>
                          <div class="form-group">
                              <div class="input-group input-group-lg">
                                  <input type="search" class="form-control form-control-lg" placeholder="Type your keywords here" value="Lorem ipsum">
                                  <div class="input-group-append">
                                      <button type="submit" class="btn btn-lg btn-default">
                                          <i class="fa fa-search"></i>
                                      </button>
                                  </div>
                              </div>
                          </div>
                      </div>
                  </div>
              </form>
              <div class="row mt-3">
                  <div class="col-md-10 offset-md-1">
                      <div class="list-group">
                          <div class="list-group-item">

                              <div class="card-info-colectivo-header">

                                  <a class="btn btn-danger" href=""><i class="fas fa-trash"></i></a>
                                  <a class="btn btn-info" href=""><i class="fas fa-edit"></i></a>
                              </div>
                              <div class="row">
                                  <div class="card-info-colectivo-top">
                                      <div class="card-info-colectivo-item">
                                          <h3>EL Pulqui</h3>
                                          <p>Tel: 3704747832</p>
                                      </div>
                                      <div class="card-info-colectivo-item">
                                          <p>Dom 20 Feb 12:05hs. </p>
                                          <p>Dom 20 Feb 12:05hs. </p>
                                      </div>
                                      <div class="card-info-colectivo-item">
                                          <h3>Cama</h3>
                                      </div>
                                      <div class="card-info-colectivo-item">
                                          <p>Duracion: 18:10hs.</p>
                                          <p>Pasajes: 2</p>
                                          <span>¡Ultimos asientos!</span>
                                          <p>Recorrido</p>
                                      </div>

                                  </div>

                                  <div class="card-info-colectivo-button">
                                      <div class="card-info-colectivo-item">
                                          <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Repellendus asperiores</p>
                                      </div>
                                      <div class="card-info-colectivo-item">
                                          <h3>ARS 9.920,00</h3>
                                      </div>
                                  </div>

                              </div>
                          </div>
                          <div class="list-group-item">
                              <div class="card-info-colectivo-header">
                                  <a class="btn btn-danger" href=""><i class="fas fa-trash"></i></a>
                                  <a class="btn btn-info" href=""><i class="fas fa-edit"></i></a>
                                  <a class="btn btn-success" href=""><i class="fas fa-plus"></i></a>
                              </div>
                              <div class="row">
                                  <div class="card-info-colectivo-top">
                                      <div class="card-info-colectivo-item">
                                          <h3>Flecha Bus</h3>
                                          <p>Tel: 3704747832</p>
                                      </div>
                                      <div class="card-info-colectivo-item">
                                          <p>Dom 20 Feb 12:05hs. </p>
                                          <p>Dom 20 Feb 12:05hs. </p>
                                      </div>
                                      <div class="card-info-colectivo-item">
                                          <h3>Semi Cama</h3>
                                      </div>
                                      <div class="card-info-colectivo-item">
                                          <p>Duracion: 18:10hs.</p>
                                          <p>Pasajes: 2</p>
                                          <span>¡Ultimos asientos!</span>
                                          <p>Recorrido</p>
                                      </div>

                                  </div>

                                  <div class="card-info-colectivo-button">
                                      <div class="card-info-colectivo-item">
                                          <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Repellendus asperiores</p>
                                      </div>
                                      <div class="card-info-colectivo-item">
                                          <h3>ARS 13.920,00</h3>
                                      </div>
                                  </div>

                              </div>
                          </div>
                          <div class="list-group-item">
                              <div class="card-info-colectivo-header">
                                  <a class="btn btn-danger" href=""><i class="fas fa-trash"></i></a>
                                  <a class="btn btn-info" href=""><i class="fas fa-edit"></i></a>
                                  <a class="btn btn-success" href=""><i class="fas fa-plus"></i></a>
                              </div>
                              <div class="row">
                                  <div class="card-info-colectivo-top">
                                      <div class="card-info-colectivo-item">
                                          <h3>Aguila Dorada Bis Pro</h3>
                                          <p>Tel: 3704747832</p>
                                      </div>
                                      <div class="card-info-colectivo-item">
                                          <p>Dom 20 Feb 12:05hs. </p>
                                          <p>Dom 20 Feb 12:05hs. </p>
                                      </div>
                                      <div class="card-info-colectivo-item">
                                          <h3>Semi Cama de lujo</h3>
                                      </div>
                                      <div class="card-info-colectivo-item">
                                          <p>Duracion: 18:10hs.</p>
                                          <p>Pasajes: 2</p>
                                          <span>¡Ultimos asientos!</span>
                                          <p>Recorrido</p>
                                      </div>

                                  </div>

                                  <div class="card-info-colectivo-button">
                                      <div class="card-info-colectivo-item">
                                          <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Repellendus asperiores</p>
                                      </div>
                                      <div class="card-info-colectivo-item">
                                          <h3>ARS 113.920,00</h3>
                                      </div>
                                  </div>

                              </div>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
      </section>
  </div>