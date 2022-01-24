<div class="card card-success">

  <div class="card-header">
    Editar Agencia
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
              <input type="hidden" id="agenciaID" name="agenciaID" value="<?php echo $InsertarID->id_agencias; ?>">
              <input type="text" id="nombreAgencia" name="nombreAgencia" value="<?php echo $editar->descripcion_agencias; ?>" class="form-control" required>
            </div>

            <div class="form-group">
              <label for="localidadAgencia">Localidad</label>
              <input type="hidden" id="agenciaLocalidadID" name="agenciaLocalidadID" value="<?php echo $insertar->id_direccion; ?>">
              <select id="localidadAgencia" name="localidadAgencia" class="form-control custom-select" required>
                <option value="0"><?php echo $editar->nombre_localidad; ?></option>
                <?php foreach ($buscarSelectLocalidad as $k) : ?>
                  <option value="<?php echo $k->id_localidad; ?>"> <?php echo $k->nombre_localidad; ?></option>
                <?php endforeach; ?>
              </select>
            </div>
            <div class="form-group">
              <label for="razonsocialAgencia">Razón Social:</label>
              <input type="hidden" id="agenciaRazonID" name="agenciaRazonID" value="<?php echo $InsertarID->id_razon_social; ?>">
              <input type="text" id="razonsocialAgencia" value="<?php echo $editar->descripcion_razon_social; ?>" name="razonsocialAgencia" class="form-control"></input>
            </div>

            <div class="form-group">
              <label for="idoneoAgencia">Idóneo:</label>
              <input type="hidden" id="" name="" value="<?php echo $InsertarID->id_agencias; ?>">
              <input type="text" id="idoneoAgencia" value="<?php echo $editar->idoneo_agencia; ?>" name="idoneoAgencia" class="form-control"></input>
            </div>

            <div class="form-group">
              <label for="matriculaAgencia">Matrícula</label>
              <input type="hidden" id="" name="" value="<?php echo $InsertarID->id_agencias; ?>">
              <input type="text" id="matriculaAgencia" value="<?php echo $editar->matricula_agencia; ?>" name="matriculaAgencia" class="form-control" required>
            </div>

            <div class="form-group">
              <label for="legajoAgencia">Legajo</label>
              <input type="hidden" id="" name="" value="<?php echo $InsertarID->id_agencias; ?>">
              <input type="text" id="legajoAgencia" value="<?php echo $editar->legajo_agencia; ?>" name="legajoAgencia" class="form-control" required>
            </div>

            <div class="form-group">
              <label for="categoriaAgencia">Categoria</label>
              <input type="hidden" id="" name="" value="<?php echo $InsertarID->id_agencias; ?>">
              <input type="text" id="categoriaAgencia" value="<?php echo $editar->categoria_agencia; ?>" name="categoriaAgencia" class="form-control" required>
            </div>

            <div class="form-group">
              <label for="cuitAgencia">Cuit</label>
              <input type="hidden" id="" name="" value="<?php echo $InsertarID->id_agencias; ?>">
              <input type="text" id="cuitAgencia" value="<?php echo $editar->cuit_agencia; ?>" name="cuitAgencia" class="form-control" required>
            </div>

            <div class="form-group">
              <label for="domicilioAgencia">Domicilio</label>
              <input type="hidden" id="agenciaDomicilioID" name="agenciaDomicilioID" value="<?php echo $InsertarID->id_direccion; ?>">
              <input type="text" id="domicilioAgencia" value="<?php echo $editar->calle_direccion; ?>" name="domicilioAgencia" class="form-control" required>
            </div>


            <div class="form-group">
              <label for="estadoAgencia">Estado</label>
              <input type="hidden" id="agenciaEstadoID" name="agenciaEstadoID" value="<?php echo $InsertarID->id_estado; ?>">
              <select id="estadoAgencia" name="estadoAgencia" class="form-control custom-select" required>
                <option value="0"><?php echo $editar->descripcion_tipo_estado; ?></option>
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
    <input name="" id="" class="btn btn-success" type="submit" value="Editar Agencia">

    <a href="?controlador=agencias&accion=inicio" class="btn btn-primary">Cancelar</a>
  </form>


</div>