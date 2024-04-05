<section class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1>Información Agencia</h1>
      </div>
      <div class="col-sm-6">
        <ol class="breadcrumb float-sm-right">
          <li class="breadcrumb-item"><a class="text-success" href="index2.php?controlador=agencias&accion=inicio">Agencias</a></li>
          <li class="breadcrumb-item active">Información</li>
        </ol>
      </div>
    </div>
  </div>
</section>

<div class="col-md-12">

  <div class="row">

    <!-- Información general -->
    <div class="col-md-6">
      <div class="card card-success card-outline ">
        <div class="card-header">
          <h3 class="card-title text-success">
            <i class="fas fa-folder mr-2"></i>
            Información General
          </h3>
          <div class="card-tools text-success">
            <button type="button" class="btn btn-tool" data-card-widget="collapse">
              <i class="fas fa-minus"></i>
            </button>
          </div>
        </div>

        <!-- /.card-header -->
        <div class="card-body">

          <table id="tblInfoGe" class="tblInfo table table-bordered table-striped" cellspacing="0" width="100%">

            <tr>
              <th class="sorting_1">Designación Comercial</th>
              <td><?php echo $TransportesInfomacion->designacion_transporte ?></td>
            </tr>

            <tr>
              <th class="sorting_1">Localidad</th>
              <td><?php echo $TransportesInfomacion->nombre_localidad; ?></td>
            </tr>

            <tr>
              <th class="sorting_1">Dirección</th>
              <td><?php echo $TransportesInfomacion->calle_direccion; ?></td>
            </tr>

            <tr>
              <th class="sorting_1">Departamento</th>
              <td><?php echo $TransportesInfomacion->descripcion_departamentos; ?></td>
            </tr>

            <tr>
              <th class="sorting_1">Idóneo</th>
              <td><?php echo $TransportesInfomacion->idoneo_transportes; ?></td>
            </tr>

            <tr>
              <th class="sorting_1">Servicios</th>
              <td><?php echo $TransportesInfomacion->descripcion_serv_transportes; ?></td>
            </tr>

            <tr>
              <th class="sorting_1">Estado</th>
              <td><?php echo $TransportesInfomacion->descripcion_tipo_estado; ?></td>
            </tr>

          </table>

        </div>
        <!-- /.card-body -->
      </div>
      <!-- /.card -->
    </div>
    <!-- ./col -->

    <!-- Contactos -->
    <div class="col-md-6">
      <div class="card card-success card-outline">
        <div class="card-header">
          <h3 class="card-title text-success">
            <i class="fas fa-folder mr-2"></i>
            Contactos
          </h3>
          <div class="card-tools text-success">
            <button type="button" class="btn btn-tool" data-card-widget="collapse">
              <i class="fas fa-minus"></i>
            </button>
          </div>
        </div>
        <!-- /.card-header -->

        <div class="card-body">

          <table id="tblContacto" class="tblInfo table table-bordered table-striped" cellspacing="0" width="100%">

            <?php foreach ($agenciaTelefonoInfo as $telefonos) { ?>

              <tr>
                <th class="sorting_1"><i class="fas fa-phone mr-1"></i> Teléfono Celular</th>
                <td><?php echo $telefonos["descri_contacto_transporte"]; ?></td>
              </tr>

            <?php  } ?>

            <?php foreach ($agenciaTelefonoFijo as $telefonosFijo) { ?>

              <tr>
                <th class="sorting_1"><i class="fas fa-phone mr-1"></i> Teléfonos Fijos</th>
                <td><?php echo $telefonosFijo["descri_contacto_transporte"]; ?></td>
              </tr>

            <?php  } ?>


            <?php foreach ($agenciaCorreo as $correos) { ?>

              <tr>
                <th class="sorting_1"><i class=" fas fa-solid fa-envelope mr-1"></i> Correo</th>
                <td><?php echo $correos["descri_contacto_transporte"]; ?></td>
              </tr>

            <?php } ?>

            <?php foreach ($agenciaFacebook as $facebook) { ?>

              <tr>
                <th class="sorting_1"><i class="fab fa-facebook mr-1"></i> Facebook</th>
                <td><?php echo $facebook["descri_contacto_transporte"]; ?></td>
              </tr>

            <?php } ?>

            <?php foreach ($agenciaInstagram as $instagram) { ?>

              <tr>
                <th class="sorting_1"><i class="fa-brands fa-instagram mr-1"></i> Instagram</th>
                <td><?php echo $instagram["descri_contacto_transporte"]; ?></td>
              </tr>

            <?php } ?>

            <?php foreach ($agenciaTwitter as $twitter) { ?>

              <tr>
                <th class="sorting_1"><i class="fab fa-twitter-square mr-1"></i> Twitter</th>
                <td><?php echo $twitter["descri_contacto_transporte"]; ?></td>
              </tr>

            <?php } ?>

            <?php foreach ($agenciaWeb  as $web) { ?>

              <tr>
                <th class="sorting_1"><i class="fas fa-globe mr-1"></i> Sitio Web</th>
                <td><?php echo $web["descri_contacto_transporte"]; ?></td>
              </tr>

            <?php } ?>

            <?php foreach ($agenciaOtro as $otro) { ?>

              <tr>
                <th class="sorting_1"><i class="fas fa-street-view mr-1"></i> Otro</th>
                <td><?php echo $otro["descri_contacto_transporte"]; ?></td>
              </tr>

            <?php } ?>

            <tr>
              <th class="sorting_1">Última actualización</th>
              <td><?= $TransportesInfomacion->fecha_edit_transporte; ?></td>
            </tr>

          </table>

        </div>
        <!-- /.card-body -->
      </div>
      <!-- /.card -->
    </div>
    <!-- ./col -->

  </div>
  <!-- /.row -->

  <div class="card-footer mb-4 card">
    <div class="row no-print">
      <div class="col-12">
        <a href="?controlador=agencias&accion=imprimirInfo&id=<?= $TransportesInfomacion->id_agencias; ?>" rel="noopener" class="btn btn-default float-right">
          <i class="fas fa-print mr-2"></i> Imprimir
        </a>
      </div>
    </div>
  </div>

</div>