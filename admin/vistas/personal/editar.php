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
        <h1> Editar Perfil</h1>
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
        <form action="" method="POST">
          <div class="card card-success card-outline">
            <div class="card-header p-2">
              <ul class="nav nav-pills">
                <li class="nav-item"><a class="nav-link active" href="#personal" data-toggle="tab">Personal</a></li>
                <li class="nav-item"><a class="nav-link" href="#ministerio" data-toggle="tab">Ministerio</a></li>
                <li class="nav-item"><a class="nav-link" href="#licencias" data-toggle="tab">Licencias</a></li>
                <li class="nav-item"><a class="nav-link" href="#hola" data-toggle="tab">Articulo 5.9</a></li>
              </ul>
            </div><!-- /.card-header -->
            <div class="card-body">
              <div class="tab-content">

                <div class="active tab-pane" id="personal">
                  <!-- <form class="form-horizontal"> -->
                  <div class="form-group row">
                    <label for="nombre" class="col-sm-2 col-form-label">Nombre</label>
                    <div class="col-sm-10">
                      <input type="hidden" id="id_persona" name="id_persona" value="<?php echo $editar->id_persona; ?>">
                      <input type="" class="form-control" name="nombre" id="nombre" value="<?php echo $editar->nombre_persona; ?>">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="apellido" class="col-sm-2 col-form-label">Apellido</label>
                    <div class="col-sm-10">
                      <input type="hidden" id="" name="" value="<?php echo $editar->id_persona; ?>">
                      <input type="" class="form-control" name="apellido" id="apellido" value="<?php echo $editar->apellido_persona; ?>">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="cuil" class="col-sm-2 col-form-label">Cuil</label>
                    <div class="col-sm-10">
                      <input type="hidden" id="" name="" value="<?php echo $editar->id_persona; ?>">
                      <input type="number" class="form-control" name="cuil" id="cuil" value="<?php echo $editar->cuil_persona; ?>">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="direccion" class="col-sm-2 col-form-label">Dirección</label>
                    <div class="col-sm-10">
                      <input type="hidden" id="DomicilioID" name="DomicilioID" value="<?php echo $editar->id_direccion; ?>">
                      <input type="text" class="form-control" name="direccion" id="direccion" value="<?php echo $editar->calle_direccion; ?>">
                    </div>
                  </div>
                  <div class="form-group row">
                    <input type="hidden" id="LocalidadID" name="LocalidadID" value="<?= $editar->id_direccion ?>">
                    <label for="localidad" class="col-sm-2 col-form-label">Localidad</label>
                    <div class="col-sm-10">
                      <?php $nombre_localidad_actual = $editar->nombre_localidad; ?>
                      <select id="localidad" name="localidad" class="form-control select2" required>
                        <option value="0" selected disabled>Seleccionar la localidad</option>
                        <?php foreach ($buscarSelectLocalidad as $k) : ?>
                          <option value="<?php echo $k->id_localidad; ?>" <?= ($k->nombre_localidad == $nombre_localidad_actual) ? 'selected="selected"' : ''; ?>> <?php echo $k->nombre_localidad; ?></option>
                        <?php endforeach; ?>
                      </select>
                    </div>
                  </div>

                  <div class="form-group row">
                    <label for="fecha" class="col-sm-2 col-form-label">Fecha de Nacimiento</label>
                    <div class="col-sm-10">
                      <input type="hidden" id="" name="" value="<?php echo $editar->id_persona; ?>">
                      <input type="date" class="form-control" name="fecha" id="fecha" value="<?php echo $editar->fecha_nac; ?>">
                    </div>
                  </div>

                  <?php foreach ($agenciaTelefono as $telefonos) { ?>
                    <div class="form-group row">
                      <label for="telefonoCel" class="col-sm-2 col-form-label">Teléfono Celular</label>
                      <div class="col-sm-10">
                        <input type="hidden" id="agenciatelefonoID" name="agenciatelefonoID[]" value="<?php echo $telefonos['id_contacto']; ?>">
                        <input type="number" id="telefonoCel" name="telefonoCel[]" class="form-control" value="<?php echo $telefonos['descripcion_contacto']; ?>">

                      </div>
                    </div>
                  <?php  } ?>

                  <div class="form-group row">
                    <label for="telefonoFijo" class="col-sm-2 col-form-label">Teléfono Fijo</label>
                    <div class="col-sm-10">
                      <input type="hidden" id="telFijoID" name="telFijoID" value="<?php echo $agenciaTelefonoFijo->id_contacto; ?>">
                      <input type="number" id="telefonoFijoAgencia" value="<?php echo $agenciaTelefonoFijo->descripcion_contacto; ?>" name="telefonoFijoAgencia" class="form-control">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="correo" class="col-sm-2 col-form-label">Correo</label>
                    <div class="col-sm-10">
                      <input type="hidden" id="CorreoID" name="CorreoID" value="<?php echo $agenciaCorreo->id_contacto; ?>">
                      <input type="email" id="correo" value="<?php echo $agenciaCorreo->descripcion_contacto; ?>" name="correo" class="form-control">

                    </div>
                  </div>
                  <div class="form-group row">
                    <input type="hidden" id="educacionID" name="educacionID" value="<?= $editar->id_educacion  ?>">
                    <label for="educacion" class="col-sm-2 col-form-label">Educacion</label>
                    <div class="col-sm-10">
                      <?php $nombre_educacion_actual = $editar->descriEducacion; ?>
                      <select id="educacion" name="educacion" class="form-control select2" required>
                        <option value="0" selected disabled>Seleccionar la Educación</option>
                        <?php foreach ($buscarSelectEstudios as $k) : ?>
                          <option value="<?php echo $k->id_educacion; ?>" <?= ($k->descriEducacion == $nombre_educacion_actual) ? 'selected="selected"' : ''; ?>> <?php echo $k->descriEducacion; ?></option>
                        <?php endforeach; ?>
                      </select>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="profesion" class="col-sm-2 col-form-label">Profesión</label>
                    <div class="col-sm-10">
                      <input type="hidden" id="" name="" value="<?php echo $editar->id_persona; ?>">
                      <input type="" class="form-control" name="profesion" id="profesion" value="<?php echo $editar->profesion; ?>">
                    </div>
                  </div>
                  <!-- </form> -->
                </div>
                <!-- /.tab-pane -->
                <div class="tab-pane" id="ministerio">
                  <!-- <form class="form-horizontal"> -->
                  <div class="form-group row">
                    <input type="hidden" id="departamentoID" name="departamentoID" value="<?= $editar->id_deptos_mintur ?>">
                    <label for="departamento" class="col-sm-2 col-form-label">Departamento</label>
                    <div class="col-sm-10">
                      <?php $nombre_departamento_actual = $editar->descriDepartamento; ?>
                      <select id="departamento" name="departamento" class="form-control select2" required>
                        <option value="0" selected disabled>Seleccionar el Departamento</option>
                        <?php foreach ($buscarSelectDepartamento as $k) : ?>
                          <option value="<?php echo $k->id_deptos_mintur; ?>" <?= ($k->descriDepartamento == $nombre_departamento_actual) ? 'selected="selected"' : ''; ?>> <?php echo $k->descriDepartamento; ?></option>
                        <?php endforeach; ?>
                      </select>
                    </div>
                  </div>
                  <div class="form-group row">
                    <input type="hidden" id="areaID" name="areaID" value="<?= $editar->id_areas  ?>">
                    <label for="area" class="col-sm-2 col-form-label">Área</label>
                    <div class="col-sm-10">
                      <?php $nombre_area_actual = $editar->descriArea; ?>
                      <select id="area" name="area" class="form-control select2" required>
                        <option value="0" selected disabled>Seleccionar el Área</option>
                        <?php foreach ($buscarSelectArea as $k) : ?>
                          <option value="<?php echo $k->id_areas; ?>" <?= ($k->descriArea == $nombre_area_actual) ? 'selected="selected"' : ''; ?>> <?php echo $k->descriArea; ?></option>
                        <?php endforeach; ?>
                      </select>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="n_legajo" class="col-sm-2 col-form-label">Nº de Legajo</label>
                    <div class="col-sm-10">
                      <input type="hidden" id="id_Personal" name="id_Personal" value="<?php echo $editar->id_personal; ?>">
                      <input type="text" class="form-control" name="n_legajo" id="n_legajo" value="<?php echo $editar->n_legajo; ?>">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="n_expediente" class="col-sm-2 col-form-label">Nº de Expediente</label>
                    <div class="col-sm-10">
                      <input type="hidden" id="" name="" value="<?php echo $editar->id_personal; ?>">
                      <input type="text" class="form-control" name="n_expediente" id="n_expediente" value="<?php echo $editar->expediente; ?>">
                    </div>
                  </div>
                  <div class="form-group row">
                    <input type="hidden" id="tipoContratoID" name="tipoContratoID" value="<?= $editar->id_tipo_contrato; ?>">
                    <label for="tipo_contrato" class="col-sm-2 col-form-label">Tipo de Contrato</label>
                    <div class="col-sm-10">
                      <?php $nombre_tipocontrato_actual = $editar->descripcion_contrato; ?>
                      <select id="tipo_contrato" name="tipo_contrato" class="form-control select2" required>
                        <option value="0" selected disabled>Seleccionar el tipo de contrato</option>
                        <?php foreach ($buscarSelectContrato as $k) : ?>
                          <option value="<?php echo $k->id_tipo_contrato; ?>" <?= ($k->descripcion_contrato == $nombre_tipocontrato_actual) ? 'selected="selected"' : ''; ?>> <?php echo $k->descripcion_contrato; ?></option>
                        <?php endforeach; ?>
                      </select>
                    </div>
                  </div>
                  <div class="form-group row">
                    <input type="hidden" id="cargoID" name="cargoID" value="<?= $editar->id_tipo_personal; ?>">
                    <label for="cargo" class="col-sm-2 col-form-label">Cargo</label>
                    <div class="col-sm-10">
                      <?php $nombre_cargo_actual = $editar->descri_tipo_personal; ?>
                      <select id="tipoCargo" name="tipoCargo" class="form-control select2" required>
                        <option value="0" selected disabled>Seleccionar el tipo de Cargo</option>
                        <?php foreach ($buscarSelectCargo as $k) : ?>
                          <option value="<?php echo $k->id_tipo_personal; ?>" <?= ($k->descri_tipo_personal == $nombre_cargo_actual) ? 'selected="selected"' : ''; ?>> <?php echo $k->descri_tipo_personal; ?></option>
                        <?php endforeach; ?>
                      </select>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="antiguedad" class="col-sm-2 col-form-label">Años de antigüedad</label>
                    <div class="col-sm-10">
                      <input type="hidden" id="" name="" value="<?php echo $editar->id_personal; ?>">
                      <input type="number" class="form-control" name="antiguedad" id="antiguedad" value="<?php echo $editar->anio_antiguedad; ?>">
                    </div>
                  </div>
                </div>

                <div class="tab-pane" id="licencias">

                  <div class="row">
                    <?php foreach ($consultarLicencias as $licencia) { ?>

                      <!-- MES -->
                      <div class="col-md-6">

                        <div class="card">
                          <div class="card-header">
                            <h3 class="card-title"><?php
                                                    $fi = new DateTime($licencia->fecha_ini);
                                                    $ff = new DateTime($licencia->fecha_fin);

                                                    $meses = array("Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre");
                                                    if ($fi->format('m') == $ff->format('m')) {
                                                      echo $meses[date($fi->format('m')) - 1];
                                                    } else {
                                                      echo $meses[date($fi->format('m')) - 1] . " - " . $meses[date($ff->format('m')) - 1];
                                                    }
                                                    ?></h3>

                            <div class="card-tools">
                              <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Minimizar">
                                <i class="fas fa-minus"></i>
                              </button>
                              <a onclick="AlertDeleteLicencia(<?= $licencia->id_licencias ?>)" class="btn btn-tool" title="Borrar">
                                <i class="fas fa-trash-can"></i>

                              </a>
                            </div>
                          </div>
                          <div class="card-body">
                            <div class="form-group">
                              <label>Fecha inicio:</label>
                              <div class="input-group">
                                <div class="input-group-prepend">
                                  <span class="input-group-text"><i class="far fa-calendar-alt"></i></span>
                                </div>
                                <input type="hidden" id="licenciasID" name="licenciasID[]" value="<?= $licencia->id_licencias ?>">
                                <input type="date" class="form-control" name="fechaini[]" id="fechaini" value="<?= $licencia->fecha_ini ?>">
                              </div>
                            </div>
                            <!-- /.form-group -->
                            <div class="form-group">
                              <label>Fecha fin:</label>
                              <div class="input-group">
                                <div class="input-group-prepend">
                                  <span class="input-group-text"><i class="far fa-calendar-alt"></i></span>
                                </div>
                                <input type="hidden" id="" name="" value="<?php echo $licencia->id_licencias ?>">
                                <input type="date" class="form-control" name="fechafin[]" id="fechafin" value="<?= $licencia->fecha_fin ?>">
                              </div>
                            </div>
                            <!-- /.form-group -->

                          </div>
                          <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                      </div>

                    <?php  } ?>

                  </div>

                  <div class="form-group row">
                    <label for="diasrestante" class="col-sm-2 col-form-label">Días Restantes</label>
                    <div class="col-sm-10">
                      <input type="hidden" id="diasRestID" name="diasRestID" value="<?= $consultarCantidLicenciaEditar->id_licencias ?>">
                      <input type="number" class="form-control" name="diasrestante" id="diasrestante" value="<?= $consultarCantidLicenciaEditar->dias_restante ?>">
                    </div>
                  </div>

                </div>
                <!-- ACA SE ENCUENTRA EL ARTICULO , PUSE ASI POR QUE NO ME TOMA EL ID articulo -->
                <div class="tab-pane" id="hola">

                  <div class="row">
                    <?php foreach ($consultarArticulo as $articulos) { ?>

                      <!-- MES -->
                      <div class="col-md-6">

                        <div class="card">
                          <div class="card-header">
                            <h3 class="card-title"><?php
                                                    $fiArticulo = new DateTime($articulos->fecha_ini_razonparticular);
                                                    echo $meses[date($fiArticulo->format('m')) - 1];
                                                    ?></h3>

                            <div class="card-tools">
                              <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Minimizar">
                                <i class="fas fa-minus"></i>
                              </button>
                              <a onclick="AlertDeleteJuego(<?= $articulos->id_razon_particular ?>)" class="btn btn-tool" title="Borrar">
                                <i class="fas fa-trash-can"></i>
                              </a>
                            </div>
                          </div>
                          <div class="card-body">
                            <div class="form-group">
                              <label>Fecha inicio:</label>
                              <div class="input-group">
                                <div class="input-group-prepend">
                                  <span class="input-group-text"><i class="far fa-calendar-alt"></i></span>
                                </div>
                                <input type="hidden" id="articuloID" name="articuloID[]" value="<?= $articulos->id_razon_particular ?>">
                                <input type="date" class="form-control" name="fechainiArticulo[]" id="fechainiArticulo" value="<?= $articulos->fecha_ini_razonparticular ?>">
                              </div>
                            </div>
                            <!-- /.form-group -->

                          </div>
                          <!-- /.card-body -->

                        </div>
                        <!-- /.card -->
                      </div>

                    <?php  } ?>
                  </div>



                </div>

              </div>
              <!-- /.tab-content -->
            </div><!-- /.card-body -->

            <div class="card-footer">
              <div class="float-right">
                <a href="?controlador=personal&accion=inicio" class="btn btn-secondary">Cancelar</a>
                <input name="" id="" class="btn btn-success" type="submit" value="Editar">
              </div>
            </div>

          </div>
          <!-- /.card -->
        </form>
      </div>

    </div>
  </div>


</section>

<!-- /.content -->