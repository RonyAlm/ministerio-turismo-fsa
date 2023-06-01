<div class="card card-success card-outline mt-3">

  <div class="card-header ">
    <h3 class="card-title text-success">
      <i class="fas fa-solid fa-plus-minus  mr-2"></i>
      Agregar Transportes
    </h3>
  </div>

  <div class="mb-1">

  </div>


  <!-- Main content -->
  <div class="card-body">
    <form action="" method="post">

      <div class="row">

        <!-- CREAR GENERAL -->
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
                <label for="designacionTransportes">Designación:</label>
                <input type="text" id="designacionTransportes" name="designacionTransportes" class="form-control" required>
              </div>

              <div class="form-group">
                <label for="localidadAgencia">Localidad</label>
                <select id="localidadAgencia" name="localidadAgencia" class="form-control select2" required>
                  <option value="" selected disabled>Seleccionar la localidad</option>
                  <?php foreach ($buscarSelectLocalidad as $k) : ?>
                    <option value="<?php echo $k->id_localidad; ?>"> <?php echo $k->nombre_localidad; ?></option>
                  <?php endforeach; ?>
                </select>
              </div>

              <div class="form-group">
                <label for="idoneoTransportes">Idóneo:</label>
                <input type="text" id="idoneoTransportes" name="idoneoTransportes" class="form-control"></input>
              </div>

              <div class="form-group">
                <label for="domicilioTransporte">Domicilio</label>
                <input type="text" id="domicilioTransporte" name="domicilioTransporte" class="form-control">
              </div>
              <div class="form-group">
                <label for="ServiciosTransportes">Servicios</label>
                <input type="text" id="ServiciosTransportes" name="ServiciosTransportes" class="form-control">
              </div>

              <div class="form-group">
                <label for="estadoAgencia">Estado</label>
                <select id="estadoAgencia" name="estadoAgencia" class="form-control select2" required>
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
        <!-- CREAR CONTACTO -->
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
              <div class="form-group" id="celu">
                <label for="telefonoAgencia">Teléfono Celular</label>
                <input type="number" id="telefonoAgencia" name="telefonoAgencia[]" class="form-control">
                <div class="btn-der mt-3 mb-3">
                  <!-- <button id="adicional" name="adicional" type="button" class="btn btn-warning"> Más + </button> -->
                  <span id="adicional" name="adicional" class="btn btn-success col fileinput-button dz-clickable">
                    <i class="fas fa-plus"></i>
                    <span>Más teléfono</span>
                  </span>
                </div>
              </div>
              <div class="telefonos">
                <!-- en este contenedor de agregar los demas teléfonos -->
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

  </div>
  <div class="card-footer">
    <div class="float-right">
      <a href="?controlador=agencias&accion=inicio" class="btn btn-secondary">Cancelar</a>
      <input name="" id="" class="btn btn-success" type="submit" value="Agregar">
    </div>
    </form>
  </div>


</div>