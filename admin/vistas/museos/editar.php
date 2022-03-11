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
    ordenarSelect('localidadMuseo');
  });
</script>

<div class="card card-success">
  <div class="card-header">Editar Museos</div>

  <div class="mb-1">

  </div>


  <!-- Main content -->

  <form action="" method="post">

    <div class="row">

      <div class="col-md-6">
        <div class="card card-primary">
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
              <label for="nombreMuseo">Nombre del Museo:</label>
              <input type="hidden" id="museosID" name="museosID" value="<?php echo $editar->id_museo; ?>">
              <input type="text" id="nombreMuseo" value="<?php echo $editar->nombre_museo; ?>" name="nombreMuseo" class="form-control" required>
            </div>
            <div class="form-group">
              <label for="localidadMuseo">Localidad</label>
              <input type="hidden" id="museoLocalidadID" name="museoLocalidadID" value="<?php echo $editar->id_direccion; ?>">
              <?php $nombre_localidad_actual = $editar->nombre_localidad; ?>
              <select id="localidadMuseo" name="localidadMuseo" class="form-control custom-select" required>
                <?php foreach ($buscarSelectLocalidad as $k) : ?>
                  <option value="<?= $k->id_localidad; ?>" <?= ($k->nombre_localidad == $nombre_localidad_actual) ? 'selected="selected"' : ''; ?>> <?= $k->nombre_localidad; ?></option>
                <?php endforeach; ?>
              </select>
            </div>
            <div class="form-group">
              <label for="idoneoMuseo">Idóneo/Encargado/a:</label>
              <input type="hidden" id="museosID" name="museosID" value="<?php echo $editar->id_museo; ?>">
              <input type="text" id="idoneoMuseo" value="<?php echo $editar->idoneo_museo; ?>" name="idoneoMuseo" class="form-control"></input>
            </div>
            <div class="form-group">
              <label for="diaHorarioMuseo">Dias y Horarios</label>
              <input type="hidden" id="museosID" name="museosID" value="<?php echo $editar->id_museo; ?>">
              <input type="text" id="diaHorarioMuseo" value="<?php echo $editar->horario_dia_museo; ?>" name="diaHorarioMuseo" class="form-control">
            </div>

            <div class="form-group fg-description">
              <label for="DescripcionMuseo">Descripción</label>
              <input type="hidden" id="museosID" name="museosID" value="<?php echo $editar->id_museo; ?>">
              <textarea value="<?php echo $editar->descripcion_museo; ?>" name="DescripcionMuseo" id="DescripcionMuseo" cols="65" rows="10"><?php echo $editar->descripcion_museo; ?></textarea>
              <!-- <input type="text" id="DescripcionMuseo" value="<?php echo $editar->descripcion_museo; ?>" name="DescripcionMuseo" class="form-control"> -->
            </div>

            <div class="form-group">
              <label for="domicilioMuseo">Domicilio</label>
              <input type="hidden" id="idDireccion" name="idDireccion" value="<?php echo $editar->id_direccion; ?>">
              <input type="text" id="domicilioMuseo" value="<?php echo $editar->calle_direccion; ?>" name="domicilioMuseo" class="form-control">
            </div>

          </div>
          <!-- /.card-body -->
        </div>
        <!-- /.card -->
      </div>
      <div class="col-md-6">
        <div class="card card-secondary">
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
                <input type="hidden" id="agenciatelefonoID" name="agenciatelefonoID[]" value="<?php echo $telefonos['id_contacto']; ?>">
                <input type="number" id="telefonoAgencia" value="<?php echo $telefonos['descripcion_contacto']; ?>" name="telefonoAgencia[]" class="form-control">
              </div>
            <?php  } ?>

            <div class="form-group">
              <label for="telefonoFijoAgencia">Teléfono Fijo</label>
              <input type="hidden" id="telFijoID" name="telFijoID" value="<?php echo $agenciaTelefonoFijo->id_contacto; ?>">
              <input type="number" id="telefonoFijoAgencia" value="<?php echo $agenciaTelefonoFijo->descripcion_contacto; ?>" name="telefonoFijoAgencia" class="form-control">
            </div>
            <div class="form-group">
              <label for="correoAgencia">Correo</label>
              <input type="hidden" id="agenciaCorreoID" name="agenciaCorreoID" value="<?php echo $agenciaCorreo->id_contacto; ?>">
              <input type="email" id="correoAgencia" value="<?php echo $agenciaCorreo->descripcion_contacto; ?>" name="correoAgencia" class="form-control">
            </div>
            <div class="form-group">
              <label for="facebookAgencia">Facebook</label>
              <input type="hidden" id="agenciaFacebookID" name="agenciaFacebookID" value="<?php echo $agenciaFacebook->id_contacto; ?>">
              <input type="text" id="facebookAgencia" value="<?php echo $agenciaFacebook->descripcion_contacto; ?>" name="facebookAgencia" class="form-control">
            </div>
            <div class="form-group">
              <label for="instagramAgencia">Instagram</label>
              <input type="hidden" id="agenciaInstagramID" name="agenciaInstagramID" value="<?php echo $agenciaInstagram->id_contacto; ?>">
              <input type="text" id="instagramAgencia" value="<?php echo $agenciaInstagram->descripcion_contacto; ?>" name="instagramAgencia" class="form-control">
            </div>
            <div class="form-group">
              <label for="twitterAgencia">Twitter</label>
              <input type="hidden" id="agenciaTwitterID" name="agenciaTwitterID" value="<?php echo $agenciaTwitter->id_contacto; ?>">
              <input type="text" id="twitterAgencia" value="<?php echo $agenciaTwitter->descripcion_contacto; ?>" name="twitterAgencia" class="form-control">
            </div>
            <div class="form-group">
              <label for="webAgencia">Sitio Web</label>
              <input type="hidden" id="agenciaWebID" name="agenciaWebID" value="<?php echo $agenciaWeb->id_contacto; ?>">
              <input type="text" id="webAgencia" value="<?php echo $agenciaWeb->descripcion_contacto; ?>" name="webAgencia" class="form-control">
            </div>
            <div class="form-group">
              <label for="otroAgencia">Otro</label>
              <input type="hidden" id="agenciaOtroID" name="agenciaOtroID" value="<?php echo $agenciaOtro->id_contacto; ?>">
              <input type="text" id="otroAgencia" value="<?php echo $agenciaOtro->descripcion_contacto; ?>" name="otroAgencia" class="form-control">
            </div>
          </div>
          <!-- /.card-body -->
        </div>
        <!-- /.card -->
      </div>
    </div>

    <div class="botones-footer-edit card-footer">
      <input name="" id="" class="btn btn-success" type="submit" value="Editar Museo">
      <a href="?controlador=museos&accion=inicio" class="btn btn-primary">Cancelar</a>
    </div>
    
  </form>


</div>