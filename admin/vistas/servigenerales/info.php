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

                </div>
                <!-- /.card-header -->
                <div class="card-body">
                    <dl>
                        <dt>Tipo:</dt>
                        <dd><?php echo $informacion->descripcion_lugar ?></dd>
                        <dt>Estación:</dt>
                        <dd><?php echo $informacion->descripcion_estacion ?></dd>
                        <dt>Tipo de Servicio:</dt>
                        <dd><?php echo $informacion->descripcion_servicio ?></dd>
                        <dt>Nombre:</dt>
                        <dd><?php echo $informacion->nombre_servicio_general ?></dd>
                        <dt>Localidad:</dt>
                        <dd><?php echo $informacion->nombre_localidad; ?></dd>
                        <dt>Departamento:</dt>
                        <dd><?php echo $informacion->descripcion_departamentos; ?></dd>
                        <dt>Dirección:</dt>
                        <dd><?php echo $informacion->calle_direccion; ?></dd>
                        <dt>Idóneo:</dt>
                        <dd><?php echo $informacion->idoneo_servicio_general; ?></dd>
                        <dt>Descripción:</dt>
                        <dd><?php echo $informacion->descripcion_servicio_general; ?></dd>
                        <dt>Última actualización:</dt>
                        <dd><?=$informacion->fecha_edit_general; ?></dd>


                    </dl>
                </div>
                <!-- /.card-body -->
            </div>
            <!-- /.card -->
        </div>
        <!-- ./col -->
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

                        <?php foreach ($agenciaTelefonoInfo as $telefonos) { ?>

                            <dt class="col-sm-4"><i class="fas fa-phone -width"></i> Teléfono Celular</dt>
                            <dd class="col-sm-8"><?php echo $telefonos["descripcion_contacto"]; ?></dd>

                        <?php  } ?>

                        <?php foreach ($agenciaTelefonoFijo as $telefonosFijo) { ?>

                            <dt class="col-sm-4"><i class="fas fa-phone -width"></i> Teléfonos Fijo</dt>
                            <dd class="col-sm-8"><?php echo $telefonosFijo["descripcion_contacto"]; ?></dd>

                        <?php  } ?>


                        <?php foreach ($agenciaCorreo as $correos) { ?>

                            <dt class="col-sm-4"><i class="fas fa-at"></i> Correo</dt>
                            <dd class="col-sm-8"><?php echo $correos["descripcion_contacto"]; ?></dd>

                        <?php } ?>

                        <?php foreach ($agenciaFacebook as $facebook) { ?>
                            <dt class="col-sm-4"><i class="fab fa-facebook"></i> Facebook</dt>
                            <dd class="col-sm-8"><?php echo $facebook["descripcion_contacto"]; ?></dd>

                        <?php } ?>

                        <?php foreach ($agenciaInstagram as $instagram) { ?>
                            <dt class="col-sm-4"><i class="fas fa-at -width"></i> Instagram</dt>
                            <dd class="col-sm-8"><?php echo $instagram["descripcion_contacto"]; ?></dd>

                        <?php } ?>

                        <?php foreach ($agenciaTwitter as $twitter) { ?>
                            <dt class="col-sm-4"><i class="fab fa-twitter-square"></i> Twitter</dt>
                            <dd class="col-sm-8"><?php echo $twitter["descripcion_contacto"]; ?></dd>

                        <?php } ?>

                        <?php foreach ($agenciaWeb  as $web) { ?>
                            <dt class="col-sm-4"><i class="fas fa-globe"></i> Sitio Web</dt>
                            <dd class="col-sm-8"><?php echo $web["descripcion_contacto"]; ?></dd>

                        <?php } ?>

                        <?php foreach ($agenciaOtro as $otro) { ?>
                            <dt class="col-sm-4"><i class="fas fa-street-view"></i> Otro</dt>
                            <dd class="col-sm-8"><?php echo $otro["descripcion_contacto"]; ?></dd>

                        <?php } ?>

                    </dl>
                </div>
                <!-- /.card-body -->
            </div>
            <!-- /.card -->
        </div>
        <!-- ./col -->
    </div>
    <!-- /.row -->

</div>