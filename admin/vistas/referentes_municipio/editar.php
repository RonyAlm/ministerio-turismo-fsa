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
    ordenarSelect('localidadReferente');
  });
</script>

<div class="card card-success">

  <div class="card-header">
    Editar Referentes
  </div>

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
              <label for="nombreReferente">Nombre y Apellido:</label>
              <input type="hidden" id="referenteID" name="referenteID" value="<?php echo $editar->id_referentes; ?>">
              <input type="text" id="nombreReferente" name="nombreReferente" value="<?php echo $editar->idoneo_referente; ?>" class="form-control" required>
            </div>

            <div class="form-group">
              <label for="localidadReferente">Localidad</label>
              <input type="hidden" id="referenteLocalidadID" name="referenteLocalidadID" value="<?php echo $editar->id_direccion; ?>">
              <?php $nombre_localidad_actual = $editar->nombre_localidad; ?>
              <select id="localidadReferente" name="localidadReferente" class="form-control custom-select" required>
                <?php foreach ($buscarSelectLocalidad as $k) : ?>
                  <option value="<?= $k->id_localidad; ?>" <?= ($k->nombre_localidad == $nombre_localidad_actual) ? 'selected="selected"' : ''; ?>> <?= $k->nombre_localidad; ?></option>
                <?php endforeach; ?>
              </select>
            </div>

            <div class="form-group">
              <label for="domicilioReferente">Domicilio</label>
              <input type="hidden" id="referenteDomicilioID" name="referenteDomicilioID" value="<?php echo $editar->id_direccion; ?>">
              <input type="text" id="domicilioReferente" name="domicilioReferente" value="<?php echo $editar->calle_direccion; ?>" class="form-control">
            </div>

            <div class="form-group">
              <label for="referenteEncargado">Tipo de Encargado</label>
              <input type="hidden" id="referenteEncargadoID" name="referenteEncargadoID" value="<?php echo $editar->id_tipo_encargado; ?>">
              <?php $id_tipo_encargado_actual = $editar->id_tipo_encargado; ?>
              <select id="referenteEncargado" name="referenteEncargado" class="form-control custom-select" required>
                <?php foreach ($buscarSelectEncargado as $k) : ?>
                  <option value="<?= $k->id_tipo_encargado; ?>" <?= ($k->id_tipo_encargado == $id_tipo_encargado_actual) ? 'selected="selected"' : ''; ?>> <?= $k->descripcion_tipo_encargado; ?></option>
                <?php endforeach; ?>
              </select>
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
            <div class="form-group">
              <label for="telefonoReferente">Teléfono Celular</label>
              <input type="hidden" id="referentetelefonoID" name="referentetelefonoID" value="<?php echo $referenteTelefono->id_contacto; ?>">
              <input type="number" id="telefonoReferente" value="<?php echo $referenteTelefono->descripcion_contacto; ?>" name="telefonoReferente" class="form-control">
            </div>
            <div class="form-group">
              <label for="telefonoFijoReferente">Teléfono Fijo</label>
              <input type="hidden" id="telFijoID" name="telFijoID" value="<?php echo $referenteTelefonoFijo->id_contacto; ?>">
              <input type="number" id="telefonoFijoReferente" value="<?php echo $referenteTelefonoFijo->descripcion_contacto; ?>" name="telefonoFijoReferente" class="form-control">
            </div>
            <div class="form-group">
              <label for="correoReferente">Correo</label>
              <input type="hidden" id="referenteCorreoID" name="referenteCorreoID" value="<?php echo $referenteCorreo->id_contacto; ?>">
              <input type="email" id="correoReferente" value="<?php echo $referenteCorreo->descripcion_contacto; ?>" name="correoReferente" class="form-control">
            </div>
            <div class="form-group">
              <label for="facebookReferente">Facebook</label>
              <input type="hidden" id="referenteFacebookID" name="referenteFacebookID" value="<?php echo $referenteFacebook->id_contacto; ?>">
              <input type="text" id="facebookReferente" value="<?php echo $referenteFacebook->descripcion_contacto; ?>" name="facebookReferente" class="form-control">
            </div>
            <div class="form-group">
              <label for="instagramReferente">Instagram</label>
              <input type="hidden" id="referenteInstagramID" name="referenteInstagramID" value="<?php echo $referenteInstagram->id_contacto; ?>">
              <input type="text" id="instagramReferente" value="<?php echo $referenteInstagram->descripcion_contacto; ?>" name="instagramReferente" class="form-control">
            </div>
            <div class="form-group">
              <label for="twitterReferente">Twitter</label>
              <input type="hidden" id="referenteTwitterID" name="referenteTwitterID" value="<?php echo $referenteTwitter->id_contacto; ?>">
              <input type="text" id="twitterReferente" value="<?php echo $referenteTwitter->descripcion_contacto; ?>" name="twitterReferente" class="form-control">
            </div>
            <div class="form-group">
              <label for="webReferente">Sitio Web</label>
              <input type="hidden" id="referenteWebID" name="referenteWebID" value="<?php echo $referenteWeb->id_contacto; ?>">
              <input type="text" id="webReferente" value="<?php echo $referenteWeb->descripcion_contacto; ?>" name="webReferente" class="form-control">
            </div>
            <div class="form-group">
              <label for="otroReferente">Otro</label>
              <input type="hidden" id="referenteOtroID" name="referenteOtroID" value="<?php echo $referenteOtro->id_contacto; ?>">
              <input type="text" id="otroReferente" value="<?php echo $referenteOtro->descripcion_contacto; ?>" name="otroReferente" class="form-control">
            </div>
          </div>
          <!-- /.card-body -->
        </div>
        <!-- /.card -->
      </div>
    </div>

    <div class="botones-footer-edit card-footer">
      <input name="" id="" class="btn btn-success" type="submit" value="Editar Referente">
      <a href="?controlador=referentes&accion=inicio" class="btn btn-primary">Cancelar</a>
    </div>
    
  </form>


</div>