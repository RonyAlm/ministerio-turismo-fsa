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

<div class="card card-success card-outline mt-3">

  <div class="card-header ">
    <h3 class="card-title text-success">
      <i class="fas fa-edit mr-2"></i>
      Editar Transportes
    </h3>
  </div>

  <!-- Main content -->
  <div class="card-body mb-1">

    <form action="" method="post">

      <div class="row">

        <!-- EDITAR GENERAL -->
        <div class="col-md-6">
          <div class="card card-success card-outline">
            <div class="card-header">
              <h3 class="card-title">General</h3>

              <div class="card-tools">
                <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                  <i class="fas fa-minus"></i>
                </button>
              </div>
            </div>
            <div class="card-body">
              <div class="form-group">
                <label for="fecha_ingreso">Fecha de Ingreso:</label>
                <input type="hidden" id="notasID" name="notasID" value="<?php echo $InsertarID->id_notas; ?>">
                <input type="date" id="fecha_ingreso" value="<?php echo $editar->fecha_ig_notas; ?>" name="fecha_ingreso" class="form-control"></input>
              </div>

              <div class="form-group">
                <input type="hidden" id="organismoID" name="organismoID" value="<?= $InsertarID->id_tipo_org_nota ?>">
                <label for="organismos">Organismos</label>
                <?php $nombre_localidad_actual = $editar->descripcion_org_nota; ?>
                <select id="organismos" name="organismos" class="form-control custom-select" required>
                  <?php foreach ($buscarSelectOrganismos as $k) : ?>
                    <option value="<?php echo $k->id_tipo_org_nota; ?>" <?= ($k->descripcion_org_nota == $nombre_localidad_actual) ? 'selected="selected"' : ''; ?>> <?php echo $k->descripcion_org_nota; ?></option>
                  <?php endforeach; ?>
                </select>
              </div>
              <div class="form-group">
                <input type="hidden" id="motivoID" name="motivoID" value="<?= $InsertarID->id_tipo_motivo_notas ?>">
                <label for="tipo_motivo">Tipo de Motivo</label>
                <?php $nombre_localidad_actual = $editar->descripcion_tipo_mot_notas; ?>
                <select id="tipo_motivo" name="tipo_motivo" class="form-control custom-select" required>
                  <?php foreach ($buscarSelectMotivo as $k) : ?>
                    <option value="<?php echo $k->id_tipo_motivo_notas; ?>" <?= ($k->descripcion_tipo_mot_notas == $nombre_localidad_actual) ? 'selected="selected"' : ''; ?>> <?php echo $k->descripcion_tipo_mot_notas; ?></option>
                  <?php endforeach; ?>
                </select>
              </div>

              <div class="form-group">
                <input type="hidden" id="agenciaLocalidadID" name="agenciaLocalidadID" value="<?= $InsertarID->id_direccion_notas ?>">
                <label for="localidadAgencia">Localidad</label>
                <?php $nombre_localidad_actual = $editar->nombre_localidad; ?>
                <select id="localidadAgencia" name="localidadAgencia" class="form-control custom-select" required>
                  <?php foreach ($buscarSelectLocalidad as $k) : ?>
                    <option value="<?php echo $k->id_localidad; ?>" <?= ($k->nombre_localidad == $nombre_localidad_actual) ? 'selected="selected"' : ''; ?>> <?php echo $k->nombre_localidad; ?></option>
                  <?php endforeach; ?>
                </select>
              </div>


              <div class="form-group">
                <label for="numero_nota">N° Nota:</label>
                <input type="hidden" id="" name="" value="<?php echo $InsertarID->id_notas; ?>">
                <input type="text" id="numero_nota" value="<?php echo $editar->numero_nota; ?>" name="numero_nota" class="form-control"></input>
              </div>

              <div class="form-group">
                <label for="remitente">Remitente:</label>
                <input type="hidden" id="" name="" value="<?php echo $InsertarID->id_notas; ?>">
                <input type="text" id="remitente" value="<?php echo $editar->remitente_nota; ?>" name="remitente" class="form-control"></input>
              </div>
              <div class="form-group">
                <label for="descripcion_motivo">Descripción del Motivo:</label>
                <input type="hidden" id="" name="" value="<?php echo $InsertarID->id_notas; ?>">
                <input type="text" id="descripcion_motivo" value="<?php echo $editar->descrip_motivo; ?>" name="descripcion_motivo" class="form-control"></input>
              </div>

              <div class="form-group">
                <label for="respuesta_notas">Respuesta:</label>
                <input type="hidden" id="" name="" value="<?php echo $InsertarID->id_notas; ?>">
                <input type="text" id="respuesta_notas" value="<?php echo $editar->respuesta_nota; ?>" name="respuesta_notas" class="form-control"></input>
              </div>

              <div class="form-group">
                <label for="domicilioAgencia">Domicilio</label>
                <input type="hidden" id="agenciaDomicilioID" name="agenciaDomicilioID" value="<?php echo $InsertarID->id_direccion_notas; ?>">
                <input type="text" id="domicilioAgencia" value="<?php echo $editar->calle_direccion_notas; ?>" name="domicilioAgencia" class="form-control" required>
              </div>




            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
        </div>
        <!-- EDITAR CONTACTOS -->
        <div class="col-md-6">
          <div class="card card-success card-outline">
            <div class="card-header">
              <h3 class="card-title">Contacto</h3>

              <div class="card-tools">
                <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                  <i class="fas fa-minus"></i>
                </button>
              </div>
            </div>
            <div class="card-body">

              <?php foreach ($agenciaTelefono as $telefonos) { ?>
                <div class="form-group">
                  <label for="telefonoAgencia">Teléfono Celular</label>
                  <input type="hidden" id="agenciatelefonoID" name="agenciatelefonoID[]" value="<?php echo $telefonos['id_contacto_notas']; ?>">
                  <input type="number" id="telefonoAgencia" value="<?php echo $telefonos['descri_contacto_notas']; ?>" name="telefonoAgencia[]" class="form-control">
                </div>
              <?php  } ?>

              <div class="form-group">
                <label for="telefonoFijoAgencia">Teléfono Fijo</label>
                <input type="hidden" id="telFijoID" name="telFijoID" value="<?php echo $agenciaTelefonoFijo->id_contacto_notas; ?>">
                <input type="number" id="telefonoFijoAgencia" value="<?php echo $agenciaTelefonoFijo->descri_contacto_notas; ?>" name="telefonoFijoAgencia" class="form-control">
              </div>
              <div class="form-group">
                <label for="correoAgencia">Correo</label>
                <input type="hidden" id="agenciaCorreoID" name="agenciaCorreoID" value="<?php echo $agenciaCorreo->id_contacto_notas; ?>">
                <input type="email" id="correoAgencia" value="<?php echo $agenciaCorreo->descri_contacto_notas; ?>" name="correoAgencia" class="form-control">
              </div>
              <div class="form-group">
                <label for="facebookAgencia">Facebook</label>
                <input type="hidden" id="agenciaFacebookID" name="agenciaFacebookID" value="<?php echo $agenciaFacebook->id_contacto_notas; ?>">
                <input type="text" id="facebookAgencia" value="<?php echo $agenciaFacebook->descri_contacto_notas; ?>" name="facebookAgencia" class="form-control">
              </div>
              <div class="form-group">
                <label for="instagramAgencia">Instagram</label>
                <input type="hidden" id="agenciaInstagramID" name="agenciaInstagramID" value="<?php echo $agenciaInstagram->id_contacto_notas; ?>">
                <input type="text" id="instagramAgencia" value="<?php echo $agenciaInstagram->descri_contacto_notas; ?>" name="instagramAgencia" class="form-control">
              </div>
              <div class="form-group">
                <label for="twitterAgencia">Twitter</label>
                <input type="hidden" id="agenciaTwitterID" name="agenciaTwitterID" value="<?php echo $agenciaTwitter->id_contacto_notas; ?>">
                <input type="text" id="twitterAgencia" value="<?php echo $agenciaTwitter->descri_contacto_notas; ?>" name="twitterAgencia" class="form-control">
              </div>
              <div class="form-group">
                <label for="webAgencia">Sitio Web</label>
                <input type="hidden" id="agenciaWebID" name="agenciaWebID" value="<?php echo $agenciaWeb->id_contacto_notas; ?>">
                <input type="text" id="webAgencia" value="<?php echo $agenciaWeb->descri_contacto_notas; ?>" name="webAgencia" class="form-control">
              </div>
              <div class="form-group">
                <label for="otroAgencia">Otro</label>
                <input type="hidden" id="agenciaOtroID" name="agenciaOtroID" value="<?php echo $agenciaOtro->id_contacto_notas; ?>">
                <input type="text" id="otroAgencia" value="<?php echo $agenciaOtro->descri_contacto_notas; ?>" name="otroAgencia" class="form-control">
              </div>
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
        </div>

      </div>

  </div>

  <div class="card-footer">
    <div class="float-right">
      <a href="?controlador=transportes&accion=inicio" class="btn btn-secondary">Cancelar</a>
      <input name="" id="" class="btn btn-success" type="submit" value="Editar">
    </div>
    </form>
  </div>

</div>