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
          <?php if ($infoAlojamiento->rela_tipo_estado == 1) { ?>
            <div class="card-tools">
              <long class="badge badge-success">Activo</long>
            </div>
          <?php } ?>

          <?php if ($infoAlojamiento->rela_tipo_estado == 2) { ?>
            <div class="card-tools">
              <long class="badge badge-danger">Baja</long>
            </div>
          <?php } ?>

          <?php if ($infoAlojamiento->rela_tipo_estado == 3) { ?>
            <div class="card-tools">
              <long class="badge badge-orange">Centro de aislamiento</long>
            </div>
          <?php } ?>

          <?php if ($infoAlojamiento->rela_tipo_estado == 4) { ?>
            <div class="card-tools">
              <long class="badge badge-lime">Cambio de Domicilio</long>
            </div>
          <?php } ?>

          <?php if ($infoAlojamiento->rela_tipo_estado == 5) { ?>
            <div class="card-tools">
              <long class="badge badge-gray">Se desconoce su situación</long>
            </div>
          <?php } ?>

          <?php if ($infoAlojamiento->rela_tipo_estado == 6) { ?>
            <div class="card-tools">
              <long class="badge badge-maroon">Cierre Temporario</long>
            </div>
          <?php } ?>
          <?php if ($infoAlojamiento->rela_tipo_estado == 7) { ?>
            <div class="card-tools">
              <long class="badge badge-secondary">No Fiscalizada</long>
            </div>
          <?php } ?>
          <?php if ($infoAlojamiento->rela_tipo_estado == 8) { ?>
            <div class="card-tools">
              <long class="badge badge-info">Domicilio Virtual</long>
            </div>
          <?php } ?>
          <?php if ($infoAlojamiento->rela_tipo_estado == 9) { ?>
            <div class="card-tools">
              <long class="badge badge-warning">Falta Verificar</long>
            </div>
          <?php } ?>


        </div>
        <!-- /.card-header -->
        <div class="card-body">
          <dl>
            <dt>Designación Comercial:</dt>
            <dd><?php echo $infoAlojamiento->descripcion_alojamientos; ?></dd>
            <dt>Localidad:</dt>
            <dd><?php echo $infoAlojamiento->nombre_localidad; ?></dd>
            <!--<dd>Donec id elit non mi porta gravida at eget metus.</dd>-->
            <dt>Dirección:</dt>
            <dd><?php echo $infoAlojamiento->calle_direccion; ?></dd>
            <dt>Departamento:</dt>
            <dd><?php echo $infoAlojamiento->descripcion_departamentos; ?></dd>
            <dt>Razón Social:</dt>
            <dd><?php echo $infoAlojamiento->descripcion_razon_social; ?></dd>
            <dt>Idóneo o Responsable:</dt>
            <dd><?php echo $infoAlojamiento->idoneo_alojamiento; ?></dd>
            <dt>Cuit:</dt>
            <dd><?php echo $infoAlojamiento->cuit_alojamiento; ?></dd>
            <dt>Estrellas:</dt>
            <dd><?php echo $infoAlojamiento->estrella_alojamiento; ?></dd>
            <dt>Categoria:</dt>
            <dd><?php echo $infoAlojamiento->descripcion_tipo_alojamiento; ?></dd>
            <dt>Rubro:</dt>
            <dd><?php echo $infoAlojamiento->descripcion_rubro; ?></dd>
            <dt>Habilitación Municipal:</dt>
            <dd><?php echo $infoAlojamiento->descripcion; ?></dd>
            <dt>Última actualización:</dt>
            <dd><?= $infoAlojamiento->fecha_edit_alojamiento; ?></dd>
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

            <?php foreach ($alojamientosTelefono as $telefonos) { ?>

              <dt class="col-sm-4"><i class="fas fa-phone -width"></i> Teléfono Celular</dt>
              <dd class="col-sm-8"><?php echo $telefonos["descripcion_contacto"]; ?></dd>

            <?php  } ?>

            <?php foreach ($alojamientoTelefonoFijo as $telefonosFijo) { ?>

              <dt class="col-sm-4"><i class="fas fa-phone -width"></i> Teléfonos Fijo</dt>
              <dd class="col-sm-8"><?php echo $telefonosFijo["descripcion_contacto"]; ?></dd>

            <?php  } ?>


            <?php foreach ($alojamientosCorreo as $correos) { ?>

              <dt class="col-sm-4"><i class="fas fa-at"></i> Correo</dt>
              <dd class="col-sm-8"><?php echo $correos["descripcion_contacto"]; ?></dd>

            <?php } ?>

            <?php foreach ($alojamientosFacebook as $facebook) { ?>
              <dt class="col-sm-4"><i class="fab fa-facebook"></i> Facebook</dt>
              <dd class="col-sm-8"><?php echo $facebook["descripcion_contacto"]; ?></dd>

            <?php } ?>

            <?php foreach ($alojamientosInstagram as $instagram) { ?>
              <dt class="col-sm-4"><i class="fas fa-at -width"></i> Instagram</dt>
              <dd class="col-sm-8"><?php echo $instagram["descripcion_contacto"]; ?></dd>

            <?php } ?>

            <?php foreach ($alojamientosTwitter as $twitter) { ?>
              <dt class="col-sm-4"><i class="fab fa-twitter-square"></i> Twitter</dt>
              <dd class="col-sm-8"><?php echo $twitter["descripcion_contacto"]; ?></dd>

            <?php } ?>

            <?php foreach ($alojamientosWeb  as $web) { ?>
              <dt class="col-sm-4"><i class="fas fa-globe"></i> Sitio Web</dt>
              <dd class="col-sm-8"><?php echo $web["descripcion_contacto"]; ?></dd>

            <?php } ?>

            <?php foreach ($alojamientosOtro as $otro) { ?>
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
            <dt>Cantidad total de Plazas:</dt>
            <dd><?php echo $infoAlojamiento->cantidad_plazas; ?></dd>
            <dt>Cantidad total de habitaciones:</dt>
            <dd><?php echo $infoAlojamiento->cantidad_total_hab; ?></dd>
            <dt>Cantidad de habitaciones Single:</dt>
            <dd><?php echo $infoAlojamiento->cantidad_hab_single; ?></dd>
            <dt>Cantidad de habitaciones Doble:</dt>
            <dd><?php echo $infoAlojamiento->cantidad_hab_doble; ?></dd>
            <dt>Cantidad de habitaciones Triple:</dt>
            <dd><?php echo $infoAlojamiento->cantidad_hab_triple; ?></dd>
            <dt>Cantidad de habitaciones Cuadruples:</dt>
            <dd><?php echo $infoAlojamiento->cantidad_hab_cuadruple; ?></dd>
            <dt>Cantidad de habitaciones Matrimoniales:</dt>
            <dd><?php echo $infoAlojamiento->cantidad_hab_matrimoniales; ?></dd>
            <dt>Apartamento:</dt>
            <dd><?php echo $infoAlojamiento->apartamento_alojamiento; ?></dd>
            <dt>Wifi:</dt>
            <dd><?php echo $infoAlojamiento->wifi_alojamiento; ?></dd>
            <dt>Estacionamiento:</dt>
            <dd><?php echo $infoAlojamiento->estacionamiento_alojamiento; ?></dd>
            <dt>Desayuno:</dt>
            <dd><?php echo $infoAlojamiento->desayuno_alojamiento; ?></dd>
            <dt>Piscina:</dt>
            <dd><?php echo $infoAlojamiento->piscina_alojamiento; ?></dd>
            <dt>Otros Servicios:</dt>
            <dd><?php echo $infoAlojamiento->otros_servicios; ?></dd>
          </dl>
        </div>
        <!-- /.card-body -->
      </div>
      <!-- /.card -->
    </div>
    <!-- Servicios Complementarios -->
    <div class="col-md-6">
      <div class="card card-info">
        <div class="card-header">
          <h3 class="card-title">
            <i class="fas fa-text-width"></i>
            Informacion de los Salones
          </h3>
        </div>
        <!-- /.card-header -->
        <div class="card-body">
          <dl>
            <dt>Cantidad de salones:</dt>
            <dd><?php echo $infoAlojamiento->cantidad_salones; ?></dd>
            <dt>Capacidad:</dt>
            <dd><?php echo $infoAlojamiento->capacidad_salones; ?></dd>
            <dt>Wifi:</dt>
            <dd><?php echo $infoAlojamiento->wifi_salones; ?></dd>
            <dt>Estacionamiento:</dt>
            <dd><?php echo $infoAlojamiento->estacionamiento_salones; ?></dd>
            <dt>Otros Servicios:</dt>
            <dd><?php echo $infoAlojamiento->otros_servicio_salones; ?></dd>

          </dl>
        </div>
        <!-- /.card-body -->
      </div>
      <!-- /.card -->
      <div class="row no-print">
        <div class="col-12">
          <a href="?controlador=Alojamientos&accion=imprimirInfo&id=<?php echo $infoAlojamiento->id_alojamientos; ?>" rel="noopener" target="_blank" class="btn btn-default float-right"><i class="fas fa-print"></i> Imprimir</a>
        </div>
      </div>
    </div>

  </div>
  <!-- /.row -->

</div>