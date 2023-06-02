<div class="card card-success card-outline mt-3">

  <div class="card-header ">
    <h3 class="card-title text-success">
      <i class="fas fa-solid fa-plus-minus  mr-2"></i>
      Agregar Notas
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
                <label for="fecha_ingreso">Fecha de Ingreso:</label>
                <input type="date" id="fecha_ingreso" name="fecha_ingreso" class="form-control" required>
              </div>

              <div class="form-group">
                <label for="organismos">Organismos</label>
                <select id="organismos" name="organismos" class="form-control select2" required>
                  <option value="" selected disabled>Seleccionar el Organismo</option>
                  <?php foreach ($buscarSelectOrganismos as $k) : ?>
                    <option value="<?php echo $k->id_tipo_org_nota; ?>"> <?php echo $k->descripcion_org_nota; ?></option>
                  <?php endforeach; ?>
                </select>
              </div>
              <div class="form-group">
                <label for="tipo_motivo">Tipo de Motivo</label>
                <select id="tipo_motivo" name="tipo_motivo" class="form-control select2" required>
                  <option value="" selected disabled>Seleccionar el motivo</option>
                  <?php foreach ($buscarSelectMotivo as $k) : ?>
                    <option value="<?php echo $k->id_tipo_motivo_notas; ?>"> <?php echo $k->descripcion_tipo_mot_notas; ?></option>
                  <?php endforeach; ?>
                </select>
              </div>
              <div class="form-group">
                <label for="localidad">Localidad</label>
                <select id="localidad" name="localidad" class="form-control select2" required>
                  <option value="" selected disabled>Seleccionar la localidad</option>
                  <?php foreach ($buscarSelectLocalidad as $k) : ?>
                    <option value="<?php echo $k->id_localidad; ?>"> <?php echo $k->nombre_localidad; ?></option>
                  <?php endforeach; ?>
                </select>
              </div>
              <div class="form-group">
                <label for="numero_nota">N° Nota:</label>
                <input type="text" id="numero_nota" name="numero_nota" class="form-control" required>
              </div>
              <div class="form-group">
                <label for="remitente">Remitente:</label>
                <input type="text" id="remitente" name="remitente" class="form-control" required>
              </div>

              <div class="form-group">
                <label for="descripcion_motivo">Descripción del Motivo</label>
                <input type="text" id="descripcion_motivo" name="descripcion_motivo" class="form-control">
              </div>
              <div class="form-group">
                <label for="respuesta_notas">Respuesta</label>
                <input type="text" id="respuesta_notas" name="respuesta_notas" class="form-control">
              </div>

              <div class="form-group">
                <label for="domicilio">Domicilio</label>
                <input type="text" id="domicilio" name="domicilio" class="form-control">
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