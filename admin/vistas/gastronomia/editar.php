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
      Editar Gastronomía
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
                <label for="designacion">Designación Comercial:</label>
                <input type="hidden" id="designacionID" name="designacionID" value="<?php echo $InsertarID->id_gastronomia; ?>">
                <input type="text" id="designacion" name="designacion" value="<?php echo $editar->denominacion_gastro; ?>" class="form-control" required>
              </div>

              <div class="form-group">
                <input type="hidden" id="agenciaLocalidadID" name="agenciaLocalidadID" value="<?= $InsertarID->id_direccion ?>">
                <label for="localidadAgencia">Localidad</label>
                <?php $nombre_localidad_actual = $editar->nombre_localidad; ?>
                <select id="localidadAgencia" name="localidadAgencia" class="form-control select2" required>
                  <?php foreach ($buscarSelectLocalidad as $k) : ?>
                    <option value="<?php echo $k->id_localidad; ?>" <?= ($k->nombre_localidad == $nombre_localidad_actual) ? 'selected="selected"' : ''; ?>> <?php echo $k->nombre_localidad; ?></option>
                  <?php endforeach; ?>
                </select>
              </div>


              <div class="form-group">
                <label for="domicilioAgencia">Domicilio</label>
                <input type="hidden" id="agenciaDomicilioID" name="agenciaDomicilioID" value="<?php echo $InsertarID->id_direccion; ?>">
                <input type="text" id="domicilioAgencia" value="<?php echo $editar->calle_direccion; ?>" name="domicilioAgencia" class="form-control" required>
              </div>


              <div class="form-group">
                <label for="diayhora">Días y horarios de atención</label>
                <input type="hidden" id="" name="" value="<?php echo $InsertarID->id_gastronomia; ?>">
                <input type="text" id="diayhora" value="<?php echo $editar->dias_horarios; ?>" name="diayhora" class="form-control" required>
              </div>

              <div class="form-group">
                <label for="caracteristicas_gastro">Caracteristicas (Servicio que ofrecen):</label>
                <input type="hidden" id="" name="" value="<?php echo $InsertarID->id_gastronomia; ?>">
                <input type="text" id="caracteristicas_gastro" value="<?php echo $editar->caracteristicas_gastronomia; ?>" name="caracteristicas_gastro" class="form-control"></input>
              </div>

              <div class="form-group">
                <label for="observacion">Observación:</label>
                <input type="hidden" id="" name="" value="<?php echo $InsertarID->id_gastronomia; ?>">
                <input type="text" id="observacion" value="<?php echo $editar->observacion_gastro; ?>" name="observacion" class="form-control"></input>
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
              <h3 class="card-title">Contactos</h3>

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
                <label for="otroAgencia">Otros</label>
                <input type="hidden" id="agenciaOtroID" name="agenciaOtroID" value="<?php echo $agenciaOtro->id_contacto; ?>">
                <input type="text" id="otroAgencia" value="<?php echo $agenciaOtro->descripcion_contacto; ?>" name="otroAgencia" class="form-control">
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
      <a href="?controlador=gastronomia&accion=inicio" class="btn btn-secondary">Cancelar</a>
      <input name="" id="" class="btn btn-success" type="submit" value="Editar">
    </div>
    </form>
  </div>

</div>