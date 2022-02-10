<div class="card card-success">

  <div class="card-header">
    Agregar Referentes
  </div>

  <div class="mb-1">

  </div>


  <!-- Main content -->

  <form action="" method="post">

    <div class="row">
      <!-- GENERAL -->
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
              <input type="text" id="nombreReferente" name="nombreReferente" class="form-control" required>
            </div>

            <div class="form-group">
              <label for="localidadReferente">Localidad</label>
              <select id="localidadReferente" name="localidadReferente" class="form-control custom-select" required>
                <option value="0" selected disabled>Seleccionar la localidad</option>
                <?php foreach ($buscarSelectLocalidad as $k) : ?>
                  <option value="<?php echo $k->id_localidad; ?>"> <?php echo $k->nombre_localidad; ?></option>
                <?php endforeach; ?>
              </select>
            </div>

            <div class="form-group">
              <label for="domicilioReferente">Domicilio</label>
              <input type="text" id="domicilioReferente" name="domicilioReferente" class="form-control">
            </div>

            <div class="form-group">
              <label for="referenteEncargado">Tipo de Encargado</label>
              <select id="referenteEncargado" name="referenteEncargado" class="form-control custom-select" required>
                <option value="0" selected disabled>Seleccionar el Encargado</option>
                <?php foreach ($buscarSelectEncargado as $k) : ?>
                  <option value="<?php echo $k->id_tipo_encargado; ?>"> <?php echo $k->descripcion_tipo_encargado; ?></option>
                <?php endforeach; ?>
              </select>
            </div>

          </div>
          <!-- /.card-body -->
        </div>
        <!-- /.card -->
      </div>
      <!-- CONTACTOS -->
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
              <input type="number" id="telefonoReferente" name="telefonoReferente" class="form-control">
            </div>
            <div class="form-group">
              <label for="telefonoFijoReferente">Teléfono Fijo</label>
              <input type="number" id="telefonoFijoReferente" name="telefonoFijoReferente" class="form-control">
            </div>
            <div class="form-group">
              <label for="correoReferente">Correo</label>
              <input type="email" id="correoReferente" name="correoReferente" class="form-control">
            </div>
            <div class="form-group">
              <label for="facebookReferente">Facebook</label>
              <input type="text" id="facebookReferente" name="facebookReferente" class="form-control">
            </div>
            <div class="form-group">
              <label for="instagramReferente">Instagram</label>
              <input type="text" id="instagramReferente" name="instagramReferente" class="form-control">
            </div>
            <div class="form-group">
              <label for="twitterReferente">Twitter</label>
              <input type="text" id="twitterReferente" name="twitterReferente" class="form-control">
            </div>
            <div class="form-group">
              <label for="webReferente">Sitio Web</label>
              <input type="text" id="webReferente" name="webReferente" class="form-control">
            </div>
            <div class="form-group">
              <label for="otroReferente">Otro</label>
              <input type="text" id="otroReferente" name="otroReferente" class="form-control">
            </div>
          </div>
          <!-- /.card-body -->
        </div>
        <!-- /.card -->
      </div>
    </div>
    <input name="" id="" class="btn btn-success" type="submit" value="Agregar Referente">

    <a href="?controlador=referentes&accion=inicio" class="btn btn-primary">Cancelar</a>
  </form>


</div>