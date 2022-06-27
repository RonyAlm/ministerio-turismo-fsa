<!-- Para ordenar alfabeticamente los select -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
<script>
  function ordenarSelect(id_componente) {
    var selectToSort = jQuery('#' + id_componente);
    var optionActual = selectToSort.val();
    selectToSort.html(selectToSort.children('option').sort(function(a, b) {
      return a.text === b.text ? 0 : a.text < b.text ? -1 : 1;
    })).val(optionActual);
  }
  $(document).ready(function() {
    ordenarSelect('localidadAgencia');
    ordenarSelect('estadoAgencia');
  });
</script>

<!-- Content Header (Page header) -->
<section class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1>Perfil</h1>
      </div>

    </div>
  </div><!-- /.container-fluid -->
</section>

<!-- Main content -->
<!-- <form action="" method="post" enctype="multipart/form-data"> -->
<section class="content">

  <div class="container-fluid">
    <div class="row">

      <div class="col-md-3">
        <!-- Profile Image -->
        <div class="card card-primary card-outline">
          <div class="card-body box-profile">
            <div class="text-center">
              <img class="profile-user-img img-fluid img-circle" src="vistas/recursos/dist/img/user1-128x128.jpg" alt="User profile picture">
            </div>

            <h3 class="profile-username text-center">Marcela Saguier Dr.</h3>

            <p class="text-muted text-center">Abogada Penalista</p>

          </div>
          <!-- /.card-body -->
        </div>
      </div>
      <!-- /.col -->

      <div class="col-md-9">
        <form action="" method="POST">
          <div class="card">
            <div class="card-header p-2">
              <ul class="nav nav-pills">
                <li class="nav-item"><a class="nav-link active" href="#personal" data-toggle="tab">Personal</a></li>
                <li class="nav-item"><a class="nav-link" href="#ministerio" data-toggle="tab">Ministerio</a></li>
                <li class="nav-item"><a class="nav-link" href="#licencias" data-toggle="tab">Licencias</a></li>
              </ul>
            </div><!-- /.card-header -->
            <div class="card-body">
              <div class="tab-content">

                <div class="active tab-pane" id="personal">
                  <!-- <form class="form-horizontal"> -->
                  <div class="form-group row">
                    <label for="nombre" class="col-sm-2 col-form-label">Nombre</label>
                    <div class="col-sm-10">
                      <input type="" class="form-control" name="nombre" id="nombre" placeholder="Nombre">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="apellido" class="col-sm-2 col-form-label">Apellido</label>
                    <div class="col-sm-10">
                      <input type="" class="form-control" name="apellido" id="apellido" placeholder="Apellido">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="cuil" class="col-sm-2 col-form-label">Cuil</label>
                    <div class="col-sm-10">
                      <input type="number" class="form-control" name="cuil" id="cuil" placeholder="99-99.999.99-99">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="direccion" class="col-sm-2 col-form-label">Dirección</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" name="direccion" id="direccion" placeholder="Dirección">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="localidad" class="col-sm-2 col-form-label">Localidad</label>
                    <div class="col-sm-10">
                      <select id="localidad" name="localidad" class="form-control custom-select" required>
                        <option value="0" selected disabled>Seleccionar la localidad</option>
                        <?php foreach ($buscarSelectLocalidad as $k) : ?>
                          <option value="<?php echo $k->id_localidad; ?>"> <?php echo $k->nombre_localidad; ?></option>
                        <?php endforeach; ?>
                      </select>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="fecha" class="col-sm-2 col-form-label">Fecha de Nacimiento</label>
                    <div class="col-sm-10">
                      <input type="date" class="form-control" name="fecha" id="fecha" placeholder="Fecha de Nacimiento">
                    </div>
                  </div>
                  <div class="form-group row" id="celu">
                    <label for="telefonoCel" class="col-sm-2 col-form-label">Teléfono Celular</label>
                    <div class="col-sm-10">
                      <input type="number" id="telefonoCel" name="telefonoCel[]" class="form-control">
                      <div class="btn-der">
                        <button id="adicional" name="adicional" type="button" class="btn btn-warning"> Más + </button>
                      </div>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="telefonoFijo" class="col-sm-2 col-form-label">Teléfono Fijo</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" name="telefonoFijo" id="telefonoFijo" placeholder="Teléfono Fijo">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="correo" class="col-sm-2 col-form-label">Correo</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" name="correo" id="correo" placeholder="Correo">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="educacion" class="col-sm-2 col-form-label">Educacion</label>
                    <div class="col-sm-10">
                      <select id="educacion" name="educacion" class="form-control custom-select" required>
                        <option value="0" selected disabled>Seleccionar educacion</option>
                        <?php foreach ($buscarSelectEstudios as $k) : ?>
                          <option value="<?php echo $k->id_educacion; ?>"> <?php echo $k->descripcion; ?></option>
                        <?php endforeach; ?>
                      </select>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="profesion" class="col-sm-2 col-form-label">Profesión</label>
                    <div class="col-sm-10">
                      <input type="" class="form-control" name="profesion" id="profesion" placeholder="Profesión">
                    </div>
                  </div>
                  <!-- </form> -->
                </div>
                <!-- /.tab-pane -->
                <div class="tab-pane" id="ministerio">
                  <!-- <form class="form-horizontal"> -->
                  <div class="form-group row">
                    <label for="departamento" class="col-sm-2 col-form-label">Departamento</label>
                    <div class="col-sm-10">
                      <select id="departamento" name="departamento" class="form-control custom-select" required>
                        <option value="0" selected disabled>Seleccionar el departamento</option>
                        <?php foreach ($buscarSelectDepartamento as $k) : ?>
                          <option value="<?php echo $k->id_deptos_mintur; ?>"> <?php echo $k->descripcion; ?></option>
                        <?php endforeach; ?>
                      </select>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="area" class="col-sm-2 col-form-label">Área</label>
                    <div class="col-sm-10">
                      <select id="area" name="area" class="form-control custom-select" required>
                        <option value="0" selected disabled>Seleccionar el Área</option>
                        <?php foreach ($buscarSelectArea as $k) : ?>
                          <option value="<?php echo $k->id_areas; ?>"> <?php echo $k->descripcion; ?></option>
                        <?php endforeach; ?>
                      </select>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="n_legajo" class="col-sm-2 col-form-label">Nº de Legajo</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" name="n_legajo" id="n_legajo" placeholder="Nº de Legajo">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="n_expediente" class="col-sm-2 col-form-label">Nº de Expediente</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" name="n_expediente" id="n_expediente" placeholder="Nº de Expediente">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="tipo_contrato" class="col-sm-2 col-form-label">Tipo de Contrato</label>
                    <div class="col-sm-10">
                      <select id="tipo_contrato" name="tipo_contrato" class="form-control custom-select" required>
                        <option value="0" selected disabled>Seleccionar el tipo de contrato</option>
                        <?php foreach ($buscarSelectContrato as $k) : ?>
                          <option value="<?php echo $k->id_tipo_contrato; ?>"> <?php echo $k->descripcion_contrato; ?></option>
                        <?php endforeach; ?>
                      </select>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="cargo" class="col-sm-2 col-form-label">Cargo</label>
                    <div class="col-sm-10">
                      <select id="cargo" name="cargo" class="form-control custom-select" required>
                        <option value="0" selected disabled>Seleccionar el cargo</option>
                        <?php foreach ($buscarSelectCargo as $k) : ?>
                          <option value="<?php echo $k->id_tipo_personal; ?>"> <?php echo $k->descripcion; ?></option>
                        <?php endforeach; ?>
                      </select>
                    </div>
                  </div>
                  <!-- <div class="form-group row">
                    <label for="rol" class="col-sm-2 col-form-label">Rol</label>
                    <div class="col-sm-10">
                      <select id="rol" name="rol" class="form-control custom-select" required>
                        <option value="0" selected disabled>Seleccionar el rol</option>
                        <? //php // foreach ($buscarSelectRol as $k) : 
                        ?>
                          <?php //if ($k->id_roles == 1) : 
                          ?>
                            <option value="<?php //echo $k->id_roles; 
                                            ?>" disabled> <?php //echo $k->roles; 
                                                          ?></option>
                            } <? // php // endif; 
                              ?>
                          <? //php // if ($k->id_roles > 1) : 
                          ?>
                            <option value="<? // php // echo $k->id_roles; 
                                            ?>"> <? //php echo $k->roles; 
                                                  ?></option>
                            } <?php //endif; 
                              ?>

                        <?php //endforeach; 
                        ?>
                      </select>
                    </div>
                  </div> -->
                  <div class="form-group row">
                    <div class="offset-sm-2 col-sm-10">
                      <input name="" id="" class="btn btn-success" type="submit" value="Agregar">

                      <a href="?controlador=personal&accion=inicio" class="btn btn-primary">Cancelar</a>
                    </div>
                  </div>
                  <!-- </form> -->
                </div>

                <div class="tab-pane" id="licencias">

                  <div class="form-group row">
                    <label for="antiguedad" class="col-sm-2 col-form-label">Años de antigüedad</label>
                    <div class="col-sm-10">
                      <input type="number" class="form-control" name="antiguedad" id="antiguedad" placeholder="Años de antigüedad">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="n_expediente" class="col-sm-2 col-form-label">Fechas de licencias pendientes</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" name="n_expediente" id="n_expediente" placeholder="Año pendiente de licencia">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="n_expediente" class="col-sm-2 col-form-label">Días pendientes</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" name="n_expediente" id="n_expediente" placeholder="Días pendientes a la fecha">
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="offset-sm-2 col-sm-10">
                      <input name="" id="" class="btn btn-success" type="submit" value="Agregar">

                      <a href="?controlador=personal&accion=inicio" class="btn btn-primary">Cancelar</a>
                    </div>
                  </div>
                  <!-- </form> -->
                </div>

              </div>
              <!-- /.tab-content -->
            </div><!-- /.card-body -->
          </div>
          <!-- /.card -->
        </form>
      </div>


    </div>
  </div>


</section>

<!-- /.content -->