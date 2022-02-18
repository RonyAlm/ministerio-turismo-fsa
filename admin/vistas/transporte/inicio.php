  <?php

    if (!isset($_SESSION['id'])) {
        header("Location: index.php");
    }

    $usuario = $_SESSION['usuarios'];
    $rol_id = $_SESSION['rol_id'];

    ?>

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
          <form action="#">
              <div class="row">
                  <div class="col-md-10 offset-md-1">
                      <div class="row">
                          <div class="col-6">
                              <div class="form-group">
                                  <label>Empresa:</label>
                                  <select class="select2" data-placeholder="FechaBus" style="width: 100%;">
                                      <option>Pulqui</option>
                                      <option>Crucero del Norte</option>
                                      <option>Agila Dorada</option>
                                  </select>
                              </div>
                          </div>
                          <div class="col-3">
                              <div class="form-group">
                                  <label>Origen:</label>
                                  <select class="select2" style="width: 100%;">
                                      <option selected>Formosa</option>
                                      <option>Clorinda</option>
                                  </select>
                              </div>
                          </div>
                          <div class="col-3">
                              <div class="form-group">
                                  <label>Destino:</label>
                                  <select class="select2" style="width: 100%;">
                                      <option selected>Formosa</option>
                                      <option>Clorinda</option>
                                  </select>
                              </div>
                          </div>
                      </div>
                      <div class="form-group">
                          <div class="input-group input-group-lg">
                              <input type="search" class="form-control form-control-lg" placeholder="Buscar" value="Lorem ipsum">
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
                              <a class="btn btn-success" href=""><i class="fas fa-plus"></i></a>
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