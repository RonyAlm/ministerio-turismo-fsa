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
                  <?php if ($agenciasInfomacion->rela_tipo_estado== 1) {?>
                    <div class="card-tools">
                    <long class="badge badge-success">Activo</long>
                  </div>
                  <?php } ?>
                  
                  <?php if ($agenciasInfomacion->rela_tipo_estado== 2) {?>
                    <div class="card-tools">
                      <long class="badge badge-danger">Baja</long>
                    </div>
                  <?php } ?>
                  
                  <?php if ($agenciasInfomacion->rela_tipo_estado== 4) {?>
                    <div class="card-tools">
                    <long class="badge badge-orange">Cambio de Domicilio</long>
                  </div>
                  <?php } ?>
                  
                  <?php if ($agenciasInfomacion->rela_tipo_estado== 5) {?>
                    <div class="card-tools">
                    <long class="badge badge-warning">Se desconoce su situación</long>
                  </div>
                  <?php } ?>

                  <?php if ($agenciasInfomacion->rela_tipo_estado== 6) {?>
                    <div class="card-tools">
                    <long class="badge badge-info">Cierre Temporario</long>
                  </div>
                  <?php } ?>
                  <?php if ($agenciasInfomacion->rela_tipo_estado== 7) {?>
                    <div class="card-tools">
                    <long class="badge badge-info">Cierre Temporario</long>
                  </div>
                  <?php } ?>
                  
                
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <dl>
                  <dt>Designación Comercial:</dt>
                  <dd><?php echo $agenciasInfomacion->descripcion_agencias ?></dd>
                  <dt>Localidad:</dt>
                  <dd><?php echo $agenciasInfomacion->nombre_localidad; ?></dd>
                  <!--<dd>Donec id elit non mi porta gravida at eget metus.</dd>-->
                  <dt>Dirección:</dt>
                  <dd><?php echo $agenciasInfomacion->calle_direccion; ?></dd>
                  <dt>Departamento:</dt>
                  <dd><?php echo $agenciasInfomacion->descripcion_departamentos; ?></dd>
                  <dt>Razón Social:</dt>
                  <dd><?php echo $agenciasInfomacion->descripcion_razon_social; ?></dd>
                  <dt>Idóneo:</dt>
                  <dd><?php echo $agenciasInfomacion->idoneo_agencia; ?></dd>
                  <dt>Matrícula:</dt>
                  <dd><?php echo $agenciasInfomacion->matricula_agencia; ?></dd>
                  <dt>Legajo:</dt>
                  <dd><?php echo $agenciasInfomacion->legajo_agencia; ?></dd>
                  <dt>Categoria:</dt>
                  <dd><?php echo $agenciasInfomacion->categoria_agencia; ?></dd>
                  <dt>Cuit:</dt>
                  <dd><?php echo $agenciasInfomacion->cuit_agencia; ?></dd>
                  <dt>Última actualización:</dt>
                  <dd><?=$agenciasInfomacion->fecha_edit_agencia; ?></dd>
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