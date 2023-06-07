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
      Editar Asistentes
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
                <label for="localidadAgencia">Localidad</label>
                <?php $nombre_localidad_actual = $editar->nombre_localidad; ?>
                <select id="localidadAgencia" name="localidadAgencia" class="form-control custom-select" required>
                  <?php foreach ($buscarSelectLocalidad as $k) : ?>
                    <option value="<?php echo $k->id_localidad; ?>" <?php echo ($k->nombre_localidad == $nombre_localidad_actual) ? 'selected' : ''; ?>><?php echo $k->nombre_localidad; ?></option>
                  <?php endforeach; ?>
                </select>
              </div>

              <div class="form-group">
                <label for="nombreyapellido">Nombre y Apellido:</label>
                <input type="hidden" id="cursosID" name="cursosID" value="<?php echo $InsertarID->id_cursos; ?>">
                <input type="text" id="nombreyapellido" name="nombreyapellido" value="<?php echo $InsertarID->nombreapellido; ?>" class="form-control" required>
              </div>


              <div class="form-group">
                <label for="dnicursos">Dni:</label>
                <input type="hidden" id="" name="" value="<?php echo $InsertarID->id_cursos; ?>">
                <input type="text" id="dnicursos" value="<?php echo $InsertarID->dni_cursos; ?>" name="dnicursos" class="form-control"></input>
              </div>

              <div class="form-group">
                <label for="ocupacioncursos">Ocupacion:</label>
                <input type="hidden" id="" name="" value="<?php echo $InsertarID->id_cursos; ?>">
                <input type="text" id="ocupacioncursos" value="<?php echo $InsertarID->ocupacion_cursos; ?>" name="ocupacioncursos" class="form-control"></input>
              </div>

              <div class="form-group">
                <label for="presente_cursos">Presentes</label>
                <input type="hidden" id="" name="" value="<?php echo $InsertarID->id_cursos; ?>">
                <input type="text" id="presente_cursos" value="<?php echo $InsertarID->presente_cursos; ?>" name="presente_cursos" class="form-control" required>
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
                  <input type="hidden" id="agenciatelefonoID" name="agenciatelefonoID[]" value="<?php echo $telefonos['id_contacto_cursos']; ?>">
                  <input type="number" id="telefonoAgencia" value="<?php echo $telefonos['descri_contacto_cursos']; ?>" name="telefonoAgencia[]" class="form-control">
                </div>
              <?php  } ?>

              <div class="form-group">
                <label for="telefonoFijoAgencia">Teléfono Fijo</label>
                <input type="hidden" id="telFijoID" name="telFijoID" value="<?php echo $agenciaTelefonoFijo ? $agenciaTelefonoFijo->id_contacto_cursos : ''; ?>">
                <input type="number" id="telefonoFijoAgencia" value="<?php echo $agenciaTelefonoFijo ? $agenciaTelefonoFijo->descri_contacto_cursos : ''; ?>" name="telefonoFijoAgencia" class="form-control">
              </div>
              <div class="form-group">
                <label for="correoAgencia">Correo</label>
                <input type="hidden" id="agenciaCorreoID" name="agenciaCorreoID" value="<?php echo $agenciaCorreo ? $agenciaCorreo->id_contacto_cursos : ''; ?>">
                <input type="email" id="correoAgencia" value="<?php echo $agenciaCorreo ? $agenciaCorreo->descri_contacto_cursos : ''; ?>" name="correoAgencia" class="form-control">
              </div>
              <div class="form-group">
                <label for="facebookAgencia">Facebook</label>
                <input type="hidden" id="agenciaFacebookID" name="agenciaFacebookID" value="<?php echo $agenciaFacebook ? $agenciaFacebook->id_contacto_cursos : ''; ?>">
                <input type="text" id="facebookAgencia" value="<?php echo $agenciaFacebook ? $agenciaFacebook->descri_contacto_cursos : ''; ?>" name="facebookAgencia" class="form-control">
              </div>
              <div class="form-group">
                <label for="instagramAgencia">Instagram</label>
                <input type="hidden" id="agenciaInstagramID" name="agenciaInstagramID" value="<?php echo $agenciaInstagram ? $agenciaInstagram->id_contacto_cursos : ''; ?>">
                <input type="text" id="instagramAgencia" value="<?php echo $agenciaInstagram ? $agenciaInstagram->descri_contacto_cursos : ''; ?>" name="instagramAgencia" class="form-control">
              </div>
              <div class="form-group">
                <label for="twitterAgencia">Twitter</label>
                <input type="hidden" id="agenciaTwitterID" name="agenciaTwitterID" value="<?php echo $agenciaTwitter ? $agenciaTwitter->id_contacto_cursos : ''; ?>">
                <input type="text" id="twitterAgencia" value="<?php echo $agenciaTwitter ? $agenciaTwitter->descri_contacto_cursos : ''; ?>" name="twitterAgencia" class="form-control">
              </div>
              <div class="form-group">
                <label for="webAgencia">Sitio Web</label>
                <input type="hidden" id="agenciaWebID" name="agenciaWebID" value="<?php echo $agenciaWeb ? $agenciaWeb->id_contacto_cursos : ''; ?>">
                <input type="text" id="webAgencia" value="<?php echo $agenciaWeb ? $agenciaWeb->descri_contacto_cursos : ''; ?>" name="webAgencia" class="form-control">
              </div>
              <div class="form-group">
                <label for="otroAgencia">Otro</label>
                <input type="hidden" id="agenciaOtroID" name="agenciaOtroID" value="<?php echo $agenciaOtro ? $agenciaOtro->id_contacto_cursos : ''; ?>">
                <input type="text" id="otroAgencia" value="<?php echo $agenciaOtro ? $agenciaOtro->descri_contacto_cursos : ''; ?>" name="otroAgencia" class="form-control">
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
      <a href="?controlador=cursos_capacitaciones&accion=inicio" class="btn btn-secondary">Cancelar</a>
      <input name="" id="" class="btn btn-success" type="submit" value="Editar">
    </div>
    </form>
  </div>

</div>