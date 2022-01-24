<div class="card card-success">

  <div class="card-header">
    Agregar Museos
  </div>

  <div class="mb-1">

  </div>


  <!-- Main content -->

  <form action="" id="agregarMuseos" method="post">

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
              <label for="nombreMuseo">Nombre del Museo:</label>
              <input type="text" id="nombreMuseo" name="nombreMuseo" class="form-control" required>
            </div>
            <div class="form-group">
              <label for="localidadMuseo">Localidad</label>
              <select id="localidadMuseo" name="localidadMuseo" class="form-control custom-select" required>
                <option value="0" selected disabled>Seleccionar la localidad</option>
                <?php foreach ($buscarSelectLocalidad as $k) : ?>
                  <option value="<?php echo $k->id_localidad; ?>"> <?php echo $k->nombre_localidad; ?></option>
                <?php endforeach; ?>
              </select>
            </div>
            <div class="form-group">
              <label for="idoneoMuseo">Idóneo/Encargado/a:</label>
              <input type="text" id="idoneoMuseo" name="idoneoMuseo" class="form-control"></input>
            </div>
            <div class="form-group">
              <label for="diaHorarioMuseo">Dias y Horarios</label>
              <input type="text" id="diaHorarioMuseo" name="diaHorarioMuseo" class="form-control">
            </div>

            <div class="form-group">
              <label for="DescripcionMuseo">Descripción</label>
              <textarea name="DescripcionMuseo" id="DescripcionMuseo" cols="62" rows="10"></textarea>
              <!-- <input type="text" id="DescripcionMuseo" name="DescripcionMuseo" class="form-control"> -->
            </div>

            <div class="form-group">
              <label for="domicilioMuseo">Domicilio</label>
              <input type="text" id="domicilioMuseo" name="domicilioMuseo" class="form-control">
            </div>

          </div>
          <!-- /.card-body -->
        </div>
        <!-- /.card -->
      </div>
      <!-- CONTACTO -->
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

            <div class="form-group" id="celu">
              <label for="telefonoAgencia">Teléfono Celular</label>
              <input type="number" id="telefonoAgencia" name="telefonoAgencia[]" class="form-control">
              <div class="btn-der">
                <button id="adicional" name="adicional" type="button" class="btn btn-warning"> Más + </button>
              </div>
            </div>

            <div class="form-group">
              <label for="telefonoFijoAgencia">Teléfono Fijo</label>
              <input type="number" id="telefonoFijoAgencia" name="telefonoFijoAgencia" class="form-control">
            </div>
            <div class="form-group">
              <label for="correoAgencia">Correo</label>
              <input type="email" id="correoAgencia" name="correoAgencia" class="form-control">
            </div>
            <div class="form-group">
              <label for="facebookAgencia">Facebook</label>
              <input type="text" id="facebookAgencia" name="facebookAgencia" class="form-control">
            </div>
            <div class="form-group">
              <label for="instagramAgencia">Instagram</label>
              <input type="text" id="instagramAgencia" name="instagramAgencia" class="form-control">
            </div>
            <div class="form-group">
              <label for="twitterAgencia">Twitter</label>
              <input type="text" id="twitterAgencia" name="twitterAgencia" class="form-control">
            </div>
            <div class="form-group">
              <label for="webAgencia">Sitio Web</label>
              <input type="text" id="webAgencia" name="webAgencia" class="form-control">
            </div>
            <div class="form-group">
              <label for="otroAgencia">Otro</label>
              <input type="text" id="otroAgencia" name="otroAgencia" class="form-control">
            </div>
          </div>
          <!-- /.card-body -->
        </div>
        <!-- /.card -->
      </div>
    </div>
    <input name="" id="" class="btn btn-success" type="submit" value="Agregar Museo">

    <a href="?controlador=museos&accion=inicio" class="btn btn-primary">Cancelar</a>
  </form>


</div>