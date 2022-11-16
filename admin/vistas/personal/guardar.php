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

      <div class="col-md-12">
        <form action="" id="agregarPersonal" method="POST">
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
                      <input type="text" class="form-control" name="nombre" id="nombre" placeholder="Nombre" require>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="apellido" class="col-sm-2 col-form-label">Apellido</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" name="apellido" id="apellido" placeholder="Apellido" require>
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
                      <select id="localidad" name="localidad" class="form-control select2" style="width: 100%;" required>
                        <option value="" selected disabled>Seleccionar la localidad</option>
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
                    <label for="telefonoAgencia" class="col-sm-2 col-form-label">Teléfono Celular</label>
                    <input type="number" id="telefonoAgencia" name="telefonoAgencia[]" class="form-control">
                    <div class="btn-der mt-3 mb-3">
                      <!-- <button id="adicional" name="adicional" type="button" class="btn btn-warning"> Más + </button> -->
                      <span id="adicional" name="adicional" class="btn btn-success col fileinput-button dz-clickable">
                        <i class="fas fa-plus"></i>
                        <span>Más teléfono</span>
                      </span>
                    </div>
                  </div>
                  <div class="telefonos">
                    <!-- en este contenedor de agregar los demas teléfonos -->
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
                      <select id="educacion" name="educacion" class="form-control select2" required>
                        <option value="" selected disabled>Seleccionar educacion</option>
                        <?php foreach ($buscarSelectEstudios as $k) : ?>
                          <option value="<?php echo $k->id_educacion; ?>"> <?php echo $k->descriEducacion; ?></option>
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
                      <select id="departamento" name="departamento" class="form-control select2" required>
                        <option value="" selected disabled>Seleccionar el departamento</option>
                        <?php foreach ($buscarSelectDepartamento as $k) : ?>
                          <option value="<?php echo $k->id_deptos_mintur; ?>"> <?php echo $k->descriDepartamento; ?></option>
                        <?php endforeach; ?>
                      </select>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="area" class="col-sm-2 col-form-label">Área</label>
                    <div class="col-sm-10">
                      <select id="area" name="area" class="form-control select2" required>
                        <option value="" selected disabled>Seleccionar el Área</option>
                        <?php foreach ($buscarSelectArea as $k) : ?>
                          <option value="<?php echo $k->id_areas; ?>"> <?php echo $k->descriArea; ?></option>
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
                      <select id="tipo_contrato" name="tipo_contrato" class="form-control select2" required>
                        <option value="" selected disabled>Seleccionar el tipo de contrato</option>
                        <?php foreach ($buscarSelectContrato as $k) : ?>
                          <option value="<?php echo $k->id_tipo_contrato; ?>"> <?php echo $k->descripcion_contrato; ?></option>
                        <?php endforeach; ?>
                      </select>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="cargo" class="col-sm-2 col-form-label">Cargo</label>
                    <div class="col-sm-10">
                      <select id="cargo" name="cargo" class="form-control select2" required>
                        <option value="" selected disabled>Seleccionar el cargo</option>
                        <?php foreach ($buscarSelectCargo as $k) : ?>
                          <option value="<?php echo $k->id_tipo_personal; ?>"> <?php echo $k->descri_tipo_personal; ?></option>
                        <?php endforeach; ?>
                      </select>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="antiguedad" class="col-sm-2 col-form-label">Años de antigüedad</label>
                    <div class="col-sm-10">
                      <input type="number" class="form-control" name="antiguedad" id="antiguedad" placeholder="Años de antigüedad">
                    </div>
                  </div>
                </div>

                <div class="tab-pane" id="licencias">
                  <div class="form-group row">
                    <label for="fechaini" class="col-sm-2 col-form-label">Fechas inicio</label>
                    <div class="col-sm-10">
                      <input type="date" class="form-control" name="fechaini" id="fechaini" placeholder="Año pendiente de licencia">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="fechafin" class="col-sm-2 col-form-label">Fechas fin</label>
                    <div class="col-sm-10">
                      <input type="date" class="form-control" name="fechafin" id="fechafin" placeholder="Año pendiente de licencia">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="diasrestante" class="col-sm-2 col-form-label">Días Restantes</label>
                    <div class="col-sm-10">
                      <input type="number" class="form-control" name="diasrestante" id="diasrestante" placeholder="Días pendientes de lincencias">
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
            </div>

          </div>
          <!-- /.card -->
        </form>
      </div>

    </div>
  </div>


</section>

<!-- /.content -->