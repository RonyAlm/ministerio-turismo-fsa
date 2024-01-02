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
        <form action="" method="POST">
          <div class="card">
            <div class="card-header p-2">
              <ul class="nav nav-pills">
                <li class="nav-item"><a class="nav-link active" href="#personal" data-toggle="tab">Personal</a></li>
                <li class="nav-item"><a class="nav-link" href="#ministerio" data-toggle="tab">Ministerio</a></li>
                <li class="nav-item"><a class="nav-link" href="#licencias" data-toggle="tab">Licencias</a></li>
                <li class="nav-item"><a class="nav-link" href="#articulos" data-toggle="tab">Artículo 5.9</a></li>
              </ul>
            </div><!-- /.card-header -->
            <div class="card-body">
              <div class="tab-content">

                <div class="active tab-pane" id="personal">
                  <!-- <form class="form-horizontal"> -->
                  <div class="form-group row">
                    <label for="nombre" class="col-sm-2 col-form-label">Nombre</label>
                    <div class="col-sm-10">
                      <input type="" class="form-control" name="nombre" id="nombre" value="<?php echo $Infomacion->nombre_persona ?>">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="apellido" class="col-sm-2 col-form-label">Apellido</label>
                    <div class="col-sm-10">
                      <input type="" class="form-control" name="apellido" id="apellido" value="<?php echo $Infomacion->apellido_persona ?>">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="cuil" class="col-sm-2 col-form-label">Cuil</label>
                    <div class="col-sm-10">
                      <input type="number" class="form-control" name="cuil" id="cuil" value="<?php echo $Infomacion->cuil_persona ?>">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="direccion" class="col-sm-2 col-form-label">Dirección</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" name="direccion" id="direccion" value="<?php echo $Infomacion->calle_direccion ?>">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="direccion" class="col-sm-2 col-form-label">Localidad</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" name="direccion" id="direccion" value="<?php echo $Infomacion->nombre_localidad ?>">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="fecha" class="col-sm-2 col-form-label">Fecha de Nacimiento</label>
                    <div class="col-sm-10">
                      <input type="date" class="form-control" name="fecha" id="fecha" value="<?php echo $Infomacion->fecha_nac ?>">
                    </div>
                  </div>
                  <div class="form-group row">
                    <?php foreach ($agenciaTelefonoInfo as $telefonos) { ?>
                      <label for="direccion" class="col-sm-2 col-form-label">Telefono Celular</label>
                      <div class="col-sm-10">
                        <input type="text" class="form-control" name="direccion" id="direccion" value="<?php echo $telefonos["descripcion_contacto"]; ?>">
                      </div>
                    <?php  } ?>
                  </div>
                  <div class="form-group row">
                    <?php foreach ($agenciaTelefonoFijo as $telefonosFijo) { ?>
                      <label for="telefonoFijo" class="col-sm-2 col-form-label">Teléfono Fijo</label>
                      <div class="col-sm-10">
                        <input type="text" class="form-control" name="telefonoFijo" id="telefonoFijo" value="<?php echo $telefonosFijo["descripcion_contacto"]; ?>">
                      </div>
                    <?php  } ?>
                  </div>
                  <div class="form-group row">
                    <?php foreach ($agenciaCorreo as $correos) { ?>
                      <label for="correo" class="col-sm-2 col-form-label">Correo</label>
                      <div class="col-sm-10">
                        <input type="text" class="form-control" name="correo" id="correo" value="<?php echo $correos["descripcion_contacto"]; ?>">
                      </div>
                    <?php  } ?>
                  </div>
                  <div class="form-group row">
                    <label for="direccion" class="col-sm-2 col-form-label">Educación</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" name="direccion" id="direccion" value="<?php echo $Infomacion->descriEducacion ?>">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="profesion" class="col-sm-2 col-form-label">Profesión</label>
                    <div class="col-sm-10">
                      <input type="" class="form-control" name="profesion" id="profesion" value="<?php echo $Infomacion->profesion ?>">
                    </div>
                  </div>
                  <!-- </form> -->
                </div>
                <!-- /.tab-pane -->
                <div class="tab-pane" id="ministerio">
                  <!-- <form class="form-horizontal"> -->
                  <div class="form-group row">
                    <label for="profesion" class="col-sm-2 col-form-label">Departamento</label>
                    <div class="col-sm-10">
                      <input type="" class="form-control" name="profesion" id="profesion" value="<?php echo $Infomacion->descriDepartamento ?>">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="profesion" class="col-sm-2 col-form-label">Área</label>
                    <div class="col-sm-10">
                      <input type="" class="form-control" name="profesion" id="profesion" value="<?php echo $Infomacion->descriArea ?>">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="n_legajo" class="col-sm-2 col-form-label">Nº de Legajo</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" name="n_legajo" id="n_legajo" value="<?php echo $Infomacion->n_legajo ?>">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="n_expediente" class="col-sm-2 col-form-label">Nº de Expediente</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" name="n_expediente" id="n_expediente" value="<?php echo $Infomacion->expediente ?>">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="n_expediente" class="col-sm-2 col-form-label">Tipo de Contrato</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" name="n_expediente" id="n_expediente" value="<?php echo $Infomacion->descripcion_contrato ?>">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="n_expediente" class="col-sm-2 col-form-label">Cargo</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" name="n_expediente" id="n_expediente" value="<?php echo $Infomacion->descri_tipo_personal ?>">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="antiguedad" class="col-sm-2 col-form-label">Años de antigüedad</label>
                    <div class="col-sm-10">
                      <input type="number" class="form-control" name="antiguedad" id="antiguedad" value="<?php echo $Infomacion->anio_antiguedad ?>">
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
                <div class="tab-pane" id="articulos">
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
          </div>
          <!-- /.card -->
        </form>
      </div>

    </div>
  </div>


</section>

<!-- /.content -->