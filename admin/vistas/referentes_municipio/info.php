<div class="col-md-12">
    <div class="mb-1">
      
    </div>
    <div class="row">
          <div class="col-md-6">
            <div class="card card-info">
            <div class="card-header">
                <h3 class="card-title">
                  <i class="fas fa-text-width"></i>
                  Información General
                </h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                  
                <dl>
                  <dt>Nombre y Apellido:</dt>
                  <dd><?php echo $referenteInfo->idoneo_referente ?></dd>
                  <dt>Localidad:</dt>
                  <dd><?php echo $referenteInfo->nombre_localidad; ?></dd>
                  <!--<dd>Donec id elit non mi porta gravida at eget metus.</dd>-->
                  <dt>Dirección:</dt>
                  <dd><?php echo $referenteInfo->calle_direccion; ?></dd>
                  <dt>Departamento:</dt>
                  <dd><?php echo $referenteInfo->descripcion_departamentos; ?></dd>
                  <dt>Última actualización:</dt>
                  <dd><?php echo $referenteInfo->fecha_edit_referente; ?></dd>
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
                  
                  <?php foreach ($referenteTelefono as $telefonos) { ?>
                    
                    <dt class="col-sm-4"><i class="fas fa-phone -width"></i> Teléfono Celular</dt>
                    <dd class="col-sm-8"><?php echo $telefonos["descripcion_contacto"]; ?></dd>

                  <?php  } ?>

                  <?php foreach ($referenteTelefonoFijo as $telefonosFijo) { ?>
                    
                    <dt class="col-sm-4"><i class="fas fa-phone -width"></i> Teléfonos Fijo</dt>
                    <dd class="col-sm-8"><?php echo $telefonosFijo["descripcion_contacto"]; ?></dd>

                  <?php  } ?>

                    
                  <?php foreach ($referenteCorreo as $correos) { ?>
                    
                    <dt class="col-sm-4"><i class="fas fa-at"></i> Correo</dt>
                    <dd class="col-sm-8"><?php echo $correos["descripcion_contacto"]; ?></dd>
                  
                  <?php } ?>

                  <?php foreach ($referenteFacebook as $facebook) { ?>
                    <dt class="col-sm-4"><i class="fab fa-facebook"></i> Facebook</dt>
                    <dd class="col-sm-8"><?php echo $facebook["descripcion_contacto"]; ?></dd>
                  
                  <?php } ?>

                  <?php foreach ($referenteInstagram as $instagram) { ?>
                    <dt class="col-sm-4"><i class="fas fa-at -width"></i> Instagram</dt>
                    <dd class="col-sm-8"><?php echo $instagram["descripcion_contacto"]; ?></dd>
                  
                  <?php } ?>

                  <?php foreach ($referenteTwitter as $twitter) { ?>
                    <dt class="col-sm-4"><i class="fab fa-twitter-square"></i> Twitter</dt>
                    <dd class="col-sm-8"><?php echo $twitter["descripcion_contacto"]; ?></dd>
                  
                  <?php } ?>

                  <?php foreach ($referenteWeb  as $web) { ?>
                    <dt class="col-sm-4"><i class="fas fa-globe"></i> Sitio Web</dt>
                    <dd class="col-sm-8"><?php echo $web["descripcion_contacto"]; ?></dd>
                  
                  <?php } ?>

                  <?php foreach ($referenteOtro as $otro) { ?>
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