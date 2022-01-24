<div class="col-md-12">
  <div class="mb-1">

  </div>
  <div class="row">
    <div class="col-md-6">
      <div class="card card-info">
        <div class="card-header">
          <h3 class="card-title">
            <i class="fas fa-text-width"></i>
            Informacion General
          </h3>
          <?php if ($infoPrestador->rela_tipo_estado == 1) { ?>
            <div class="card-tools">
              <long class="badge badge-success">Activo</long>
            </div>
          <?php } ?>

          <?php if ($infoPrestador->rela_tipo_estado == 2) { ?>
            <div class="card-tools">
              <long class="badge badge-danger">Baja</long>
            </div>
          <?php } ?>

          <?php if ($infoPrestador->rela_tipo_estado == 3) { ?>
            <div class="card-tools">
              <long class="badge badge-orange">Cambio de Domicilio</long>
            </div>
          <?php } ?>

          <?php if ($infoPrestador->rela_tipo_estado == 4) { ?>
            <div class="card-tools">
              <long class="badge badge-orange">Cambio de Domicilio</long>
            </div>
          <?php } ?>

          <?php if ($infoPrestador->rela_tipo_estado == 5) { ?>
            <div class="card-tools">
              <long class="badge badge-warning">Se desconoce su situación</long>
            </div>
          <?php } ?>

          <?php if ($infoPrestador->rela_tipo_estado == 6) { ?>
            <div class="card-tools">
              <long class="badge badge-info">Cierre Temporario</long>
            </div>
          <?php } ?>
          <?php if ($infoPrestador->rela_tipo_estado == 7) { ?>
            <div class="card-tools">
              <long class="badge badge-info">No Fiscalizada</long>
            </div>
          <?php } ?>
          <?php if ($infoPrestador->rela_tipo_estado == 8) { ?>
            <div class="card-tools">
              <long class="badge badge-info">Domicilio Virtual</long>
            </div>
          <?php } ?>

        </div>
        <!-- /.card-header -->
        <div class="card-body">
          <dl>
            <dt>Categoría:</dt>
            <dd><?php echo $infoPrestador->descripcion_tipo_prestador; ?></dd>
            <dt>Apellido y Nombre:</dt>
            <dd><?php echo $infoPrestador->descripcion_prestador; ?></dd>
            <dt>Localidad:</dt>
            <dd><?php echo $infoPrestador->nombre_localidad; ?></dd>
            <dt>Dirección:</dt>
            <dd><?php echo $infoPrestador->calle_direccion; ?></dd>
            <dt>Departamento:</dt>
            <dd><?php echo $infoPrestador->descripcion_departamentos; ?></dd>
            <dt>DNI:</dt>
            <dd><?php echo $infoPrestador->dni_prestador; ?></dd>
            <dt>Institución / Emprendimiento:</dt>
            <dd><?php echo $infoPrestador->institucion_prestador; ?></dd>
            <dt>CUIT / CUIL:</dt>
            <dd><?php echo $infoPrestador->cuit_prestador; ?></dd>

          </dl>
        </div>
        <!-- /.card-body -->
      </div>
      <!-- /.card -->
    </div>
    <!-- Contacto -->
    <div class="col-md-6">
      <div class="card card-teal">
        <div class="card-header">
          <h3 class="card-title">
            <i class="fas fa-text-width"></i>
            Contacto
          </h3>
        </div>
        <!-- /.card-header -->
        <div class="card-body">
          <dl class="row">

            <?php foreach ($prestadorTelefono as $telefonos) { ?>

              <dt class="col-sm-4"><i class="fas fa-phone -width"></i> Teléfono Celular</dt>
              <dd class="col-sm-8"><?php echo $telefonos["descripcion_contacto"]; ?></dd>

            <?php  } ?>

            <?php foreach ($prestadorTelefonoFijo as $telefonosFijo) { ?>

              <dt class="col-sm-4"><i class="fas fa-phone -width"></i> Teléfonos Fijo</dt>
              <dd class="col-sm-8"><?php echo $telefonosFijo["descripcion_contacto"]; ?></dd>

            <?php  } ?>


            <?php foreach ($prestadorCorreo as $correos) { ?>

              <dt class="col-sm-4"><i class="fas fa-at"></i> Correo</dt>
              <dd class="col-sm-8"><?php echo $correos["descripcion_contacto"]; ?></dd>

            <?php } ?>

            <?php foreach ($prestadorFacebook as $facebook) { ?>
              <dt class="col-sm-4"><i class="fab fa-facebook"></i> Facebook</dt>
              <dd class="col-sm-8"><?php echo $facebook["descripcion_contacto"]; ?></dd>

            <?php } ?>

            <?php foreach ($prestadorInstagram as $instagram) { ?>
              <dt class="col-sm-4"><i class="fas fa-at -width"></i> Instagram</dt>
              <dd class="col-sm-8"><?php echo $instagram["descripcion_contacto"]; ?></dd>

            <?php } ?>

            <?php foreach ($prestadorTwitter as $twitter) { ?>
              <dt class="col-sm-4"><i class="fab fa-twitter-square"></i> Twitter</dt>
              <dd class="col-sm-8"><?php echo $twitter["descripcion_contacto"]; ?></dd>

            <?php } ?>

            <?php foreach ($prestadorWeb  as $web) { ?>
              <dt class="col-sm-4"><i class="fas fa-globe"></i> Sitio Web</dt>
              <dd class="col-sm-8"><?php echo $web["descripcion_contacto"]; ?></dd>

            <?php } ?>

            <?php foreach ($prestadorOtro as $otro) { ?>
              <dt class="col-sm-4"><i class="fas fa-street-view"></i> Otro</dt>
              <dd class="col-sm-8"><?php echo $otro["descripcion_contacto"]; ?></dd>

            <?php } ?>

          </dl>
        </div>
        <!-- /.card-body -->
      </div>
      <!-- /.card -->
    </div>
    <!-- Servicios -->
    <div class="col-md-6">
      <div class="card card-info">
        <div class="card-header">
          <h3 class="card-title">
            <i class="fas fa-text-width"></i>
            Informacion de los Servicios
          </h3>
        </div>
        <!-- /.card-header -->
        <div class="card-body">
          <dl>
            <dt>Servicios:</dt>
            <?php foreach ($serviciosPrestador as $prestadore) { ?>
              <dd><?php echo $prestadore["descrip_tipo_serv_prestadores"] ?></dd>
            <?php } ?>
            <dt>Otros Servicios:</dt>
            <dd><?php echo $infoPrestador->otros_servicios_prestadores; ?></dd>


          </dl>
        </div>
        <!-- /.card-body -->
      </div>
      <!-- /.card -->
    </div>

  </div>
  <!-- /.row -->

</div>