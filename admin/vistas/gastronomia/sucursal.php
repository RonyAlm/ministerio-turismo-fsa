<div class="card">
              <div class="card-header">
                <h3 class="card-title">
                  <i class="fas fa-hotel -width"></i>
                  <?php echo $agenciasInfomacion->descripcion_agencias ?>
                </h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <dl class="row">
                  <dt class="col-sm-4"> Designación Comercial</dt>
                  <dd class="col-sm-8"><?php echo $agenciasInfomacion->descripcion_agencias ?></dd>
                  <dt class="col-sm-4"><i class="fas fa-street-view"></i> Localidad</dt>
                  <dd class="col-sm-8"><?php echo $agenciasInfomacion->nombre_localidad; ?></dd>
                  <dt class="col-sm-4"><i class="fas fa-street-view"></i> Dirección</dt>
                  <dd class="col-sm-8"><?php echo $agenciasInfomacion->calle_direccion; ?></dd>
                  
                  
                  
                  <?php foreach ($agenciaTelefonoInfo as $telefonos) { ?>
                    
                    <dt class="col-sm-4"><i class="fas fa-phone -width"></i> Teléfono Celular</dt>
                    <dd class="col-sm-6"><?php echo $telefonos["descripcion_contacto"]; ?></dd>

                  <?php  } ?>

                  <?php foreach ($agenciaTelefonoFijo as $telefonosFijo) { ?>
                    
                    <dt class="col-sm-4"><i class="fas fa-phone -width"></i> Teléfonos Fijo</dt>
                    <dd class="col-sm-6"><?php echo $telefonosFijo["descripcion_contacto"]; ?></dd>

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