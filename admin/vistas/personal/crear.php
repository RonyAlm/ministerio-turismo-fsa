<div class="card card-success">

  <div class="card-header">
    Agregar Agencia
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
              <label for="nombreAgencia">Designación Comercial:</label>
              <input type="text" id="nombreAgencia" name="nombreAgencia" class="form-control" required>
            </div>

            <div class="form-group">
              <label for="localidadAgencia">Localidad</label>
              <select id="localidadAgencia" name="localidadAgencia" class="form-control select2" style="width: 100%;" required>
                <option value="0" selected disabled>Seleccionar la localidad</option>
                <?php foreach ($buscarSelectLocalidad as $k) : ?>
                  <option value="<?php echo $k->id_localidad; ?>"> <?php echo $k->nombre_localidad; ?></option>
                <?php endforeach; ?>
              </select>
            </div>
            <div class="form-group">
              <label for="razonsocialAgencia">Razón Social:</label>
              <input type="text" id="razonsocialAgencia" name="razonsocialAgencia" class="form-control"></input>
            </div>

            <div class="form-group">
              <label for="idoneoAgencia">Idóneo:</label>
              <input type="text" id="idoneoAgencia" name="idoneoAgencia" class="form-control"></input>
            </div>

            <div class="form-group">
              <label for="matriculaAgencia">Matrícula</label>
              <input type="text" id="matriculaAgencia" name="matriculaAgencia" class="form-control">
            </div>

            <div class="form-group">
              <label for="legajoAgencia">Legajo</label>
              <input type="text" id="legajoAgencia" name="legajoAgencia" class="form-control">
            </div>

            <div class="form-group">
              <label for="categoriaAgencia">Categoria</label>
              <input type="text" id="categoriaAgencia" name="categoriaAgencia" class="form-control">
            </div>

            <div class="form-group">
              <label for="cuitAgencia">Cuit</label>
              <input type="text" id="cuitAgencia" name="cuitAgencia" class="form-control" required>
            </div>

            <div class="form-group">
              <label for="domicilioAgencia">Domicilio</label>
              <input type="text" id="domicilioAgencia" name="domicilioAgencia" class="form-control">
            </div>

            <div class="form-group">
              <label for="estadoAgencia">Estado</label>
              <select id="estadoAgencia" name="estadoAgencia" class="form-control custom-select" required>
                <option value="0" selected disabled>Seleccionar el Estado de la Agencia</option>
                <?php foreach ($buscarSelectEstado as $k) : ?>
                  <option value="<?php echo $k->id_tipo_estado; ?>"> <?php echo $k->descripcion_tipo_estado; ?></option>
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
    <input name="" id="" class="btn btn-success" type="submit" value="Agregar Agencia">

    <a href="?controlador=agencias&accion=inicio" class="btn btn-primary">Cancelar</a>
  </form>


</div>