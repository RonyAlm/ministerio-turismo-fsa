<section class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1>Información Prestador</h1>
      </div>
      <div class="col-sm-6">
        <ol class="breadcrumb float-sm-right">
          <li class="breadcrumb-item"><a class="text-success" href="index2.php?controlador=prestadores&accion=inicio">Prestador</a></li>
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
              <th class="sorting_1">Categoría</th>
              <td><?php echo $infoPrestador->descripcion_tipo_prestador; ?></td>
            </tr>
            <tr>
              <th class="sorting_1">Apellido y Nombre</th>
              <td><?php echo $infoPrestador->descripcion_prestador; ?></td>
            </tr>
            <tr>
              <th class="sorting_1">Localidad</th>
              <td><?php echo $infoPrestador->nombre_localidad; ?></td>
            </tr>
            <tr>
              <th class="sorting_1">Dirección</th>
              <td><?php echo $infoPrestador->calle_direccion; ?></td>
            </tr>
            <tr>
              <th class="sorting_1">Departamento</th>
              <td><?php echo $infoPrestador->descripcion_departamentos; ?></td>
            </tr>
            <tr>
              <th class="sorting_1">DNI</th>
              <td><?php echo $infoPrestador->dni_prestador; ?></td>
            </tr>
            <tr>
              <th class="sorting_1">Institución / Emprendimiento</th>
              <td><?php echo $infoPrestador->institucion_prestador; ?></td>
            </tr>
            <tr>
              <th class="sorting_1">CUIT / CUIL</th>
              <td><?php echo $infoPrestador->cuit_prestador; ?></td>
            </tr>
            <tr>
              <th class="sorting_1">Estado</th>
              <td><?= $infoPrestador->descripcion_tipo_estado; ?></td>
            </tr>

          </table>

        </div>
        <!-- /.card-body -->
      </div>
      <!-- /.card -->
    </div>
    <!-- Contactos -->
    <div class="col-md-6">
      <div class="card card-success card-outline ">
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

            <?php foreach ($prestadorTelefono as $telefonos) { ?>

              <tr>
                <th class="sorting_1"><i class="fas fa-phone mr-1"></i> Teléfono Celular</th>
                <td><?php echo $telefonos["descripcion_contacto"]; ?></td>
              </tr>

            <?php  } ?>

            <?php foreach ($prestadorTelefonoFijo as $telefonosFijo) { ?>

              <tr>
                <th class="sorting_1"><i class="fas fa-phone mr-1"></i> Teléfonos Fijo</th>
                <td><?php echo $telefonosFijo["descripcion_contacto"]; ?></td>
              </tr>

            <?php  } ?>


            <?php foreach ($prestadorCorreo as $correos) { ?>

              <tr>
                <th class="sorting_1"><i class="fas fa-solid fa-envelope mr-1"></i> Correo</th>
                <td><?php echo $correos["descripcion_contacto"]; ?></td>
              </tr>

            <?php } ?>

            <?php foreach ($prestadorFacebook as $facebook) { ?>

              <tr>
                <th class="sorting_1"><i class="fab fa-facebook mr-1"></i> Facebook</th>
                <td><?php echo $facebook["descripcion_contacto"]; ?></td>
              </tr>

            <?php } ?>

            <?php foreach ($prestadorInstagram as $instagram) { ?>

              <tr>
                <th class="sorting_1"><i class="fa-brands fa-instagram mr-1"></i> Instagram</th>
                <td><?php echo $instagram["descripcion_contacto"]; ?></td>
              </tr>

            <?php } ?>

            <?php foreach ($prestadorTwitter as $twitter) { ?>

              <tr>
                <th class="sorting_1"><i class="fab fa-twitter-square mr-1"></i> Twitter</th>
                <td><?php echo $twitter["descripcion_contacto"]; ?></td>
              </tr>

            <?php } ?>

            <?php foreach ($prestadorWeb  as $web) { ?>

              <tr>
                <th class="sorting_1"><i class="fas fa-globe mr-1"></i> Sitio Web</th>
                <td><?php echo $web["descripcion_contacto"]; ?></td>
              </tr>

            <?php } ?>

            <?php foreach ($prestadorOtro as $otro) { ?>

              <tr>
                <th class="sorting_1"><i class="fas fa-street-view mr-1"></i> Otros</th>
                <td><?php echo $otro["descripcion_contacto"]; ?></td>
              </tr>

            <?php } ?>

            <tr>
              <th class="sorting_1">Última actualización</th>
              <td><?= $infoPrestador->fecha_edit_prestador; ?></td>
            </tr>

          </table>

        </div>
        <!-- /.card-body -->
      </div>
      <!-- /.card -->
    </div>
    <!-- Servicios -->
    <div class="col-md-12">
      <div class="card card-success card-outline ">
        <div class="card-header">
          <h3 class="card-title text-success">
            <i class="fas fa-folder mr-2"></i>
            Servicios
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

            <tr>
              <th class="sorting_1">Servicios</th>
              <td><?php foreach ($serviciosPrestador as $prestadore) {
                    echo $prestadore["descrip_tipo_serv_prestadores"] . " - ";
                  } ?>
              </td>
            </tr>

            <tr>
              <th class="sorting_1">Otros Servicios</th>
              <td><?php echo $infoPrestador->otros_servicios_prestadores; ?></td>
            </tr>

          </table>

        </div>
        <!-- /.card-body -->
      </div>
      <!-- /.card -->
    </div>

  </div>
  <!-- /.row -->

  <div class="card-footer mb-4 card">
    <div class="row no-print">
      <div class="col-12">
        <a href="?controlador=prestadores&accion=imprimirInfo&id=<?= $id_prestador; ?>" rel="noopener" class="btn btn-default float-right">
          <i class="fas fa-print mr-2"></i> Imprimir
        </a>
      </div>
    </div>
  </div>

</div>