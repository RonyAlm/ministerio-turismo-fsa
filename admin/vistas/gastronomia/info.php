<section class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1>Información Gastronomía</h1>
      </div>
      <div class="col-sm-6">
        <ol class="breadcrumb float-sm-right">
          <li class="breadcrumb-item"><a class="text-success" href="index2.php?controlador=gastronomia&accion=inicio">Gastronomías</a></li>
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
              <td><?php echo $agenciasInfomacion->denominacion_gastro ?></td>
            </tr>

            <tr>
              <th class="sorting_1">Localidad</th>
              <td><?php echo $agenciasInfomacion->nombre_localidad; ?></td>
            </tr>

            <tr>
              <th class="sorting_1">Dirección</th>
              <td><?php echo $agenciasInfomacion->calle_direccion; ?></td>
            </tr>

            <tr>
              <th class="sorting_1">Departamento</th>
              <td><?php echo $agenciasInfomacion->descripcion_departamentos; ?></td>
            </tr>


            <tr>
              <th class="sorting_1">Observación</th>
              <td><?php echo $agenciasInfomacion->observacion_gastro; ?></td>
            </tr>

            <tr>
              <th class="sorting_1">Días y horarios</th>
              <td><?php echo $agenciasInfomacion->dias_horarios; ?></td>
            </tr>
            
            <tr>
              <th class="sorting_1">Última actualización</th>
              <td><?php echo $agenciasInfomacion->date_updated_gastronomia; ?></td>
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
                <td><?php echo $telefonos["descripcion_contacto"]; ?></td>
              </tr>

            <?php  } ?>

            <?php foreach ($agenciaTelefonoFijo as $telefonosFijo) { ?>

              <tr>
                <th class="sorting_1"><i class="fas fa-phone mr-1"></i> Teléfonos Fijo</th>
                <td><?php echo $telefonosFijo["descripcion_contacto"]; ?></td>
              </tr>

            <?php  } ?>


            <?php foreach ($agenciaCorreo as $correos) { ?>

              <tr>
                <th class="sorting_1"><i class=" fas fa-solid fa-envelope mr-1"></i> Correo</th>
                <td><?php echo $correos["descripcion_contacto"]; ?></td>
              </tr>

            <?php } ?>

            <?php foreach ($agenciaFacebook as $facebook) { ?>

              <tr>
                <th class="sorting_1"><i class="fab fa-facebook mr-1"></i> Facebook</th>
                <td><?php echo $facebook["descripcion_contacto"]; ?></td>
              </tr>

            <?php } ?>

            <?php foreach ($agenciaInstagram as $instagram) { ?>

              <tr>
                <th class="sorting_1"><i class="fa-brands fa-instagram mr-1"></i> Instagram</th>
                <td><?php echo $instagram["descripcion_contacto"]; ?></td>
              </tr>

            <?php } ?>

            <?php foreach ($agenciaTwitter as $twitter) { ?>

              <tr>
                <th class="sorting_1"><i class="fab fa-twitter-square mr-1"></i> Twitter</th>
                <td><?php echo $twitter["descripcion_contacto"]; ?></td>
              </tr>

            <?php } ?>

            <?php foreach ($agenciaWeb  as $web) { ?>

              <tr>
                <th class="sorting_1"><i class="fas fa-globe mr-1"></i> Sitio Web</th>
                <td><?php echo $web["descripcion_contacto"]; ?></td>
              </tr>

            <?php } ?>

            <?php foreach ($agenciaOtro as $otro) { ?>

              <tr>
                <th class="sorting_1"><i class="fas fa-street-view mr-1"></i> Otro</th>
                <td><?php echo $otro["descripcion_contacto"]; ?></td>
              </tr>

            <?php } ?>



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
        <a href="?controlador=gastronomia&accion=imprimirInfo&id=<?= $agenciasInfomacion->id_gastronomia; ?>" rel="noopener" class="btn btn-default float-right">
          <i class="fas fa-print mr-2"></i> Imprimir
        </a>
      </div>
    </div>
  </div>

</div>