<section class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1>Información de Referentes Municipal</h1>
      </div>
      <div class="col-sm-6">
        <ol class="breadcrumb float-sm-right">
          <li class="breadcrumb-item"><a class="text-success" href="index2.php?controlador=referentes&accion=inicio">Referentes</a></li>
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
              <th class="sorting_1">Nombre y Apellido</th>
              <td><?php echo $referenteInfo->idoneo_referente ?></td>
            </tr>
            <tr>
              <th class="sorting_1">Localidad</th>
              <td><?php echo $referenteInfo->nombre_localidad; ?></td>
            </tr>
            <tr>
              <th class="sorting_1">Dirección</th>
              <td><?php echo $referenteInfo->calle_direccion; ?></td>
            </tr>
            <tr>
              <th class="sorting_1">Departamento</th>
              <td><?php echo $referenteInfo->descripcion_departamentos; ?></td>
            </tr>
            <tr>
              <th class="sorting_1">Última actualización</th>
              <td><?php echo $referenteInfo->fecha_edit_referente; ?></td>
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

          <table id="tblInfoGe" class="tblInfo table table-bordered table-striped" cellspacing="0" width="100%">

            <?php foreach ($referenteTelefono as $telefonos) { ?>
              <tr>
                <th class="sorting_1"><i class="fas fa-phone mr-1"></i> Teléfono Celular</th>
                <td><?php echo $telefonos["descripcion_contacto"]; ?></>
              </tr>
            <?php  } ?>

            <?php foreach ($referenteTelefonoFijo as $telefonosFijo) { ?>
              <tr>
                <th class="sorting_1"><i class="fas fa-phone mr-1"></i> Teléfonos Fijo</th>
                <td><?php echo $telefonosFijo["descripcion_contacto"]; ?></>
              </tr>
            <?php  } ?>


            <?php foreach ($referenteCorreo as $correos) { ?>
              <tr>
                <th class="sorting_1"><i class="fas fa-solid fa-envelope mr-1"></i> Correo</th>
                <td><?php echo $correos["descripcion_contacto"]; ?></>
              </tr>
            <?php } ?>

            <?php foreach ($referenteFacebook as $facebook) { ?>
              <tr>
                <th class="sorting_1"><i class="fab fa-facebook mr-1"></i> Facebook</th>
                <td><?php echo $facebook["descripcion_contacto"]; ?></>
              </tr>
            <?php } ?>

            <?php foreach ($referenteInstagram as $instagram) { ?>
              <tr>
                <th class="sorting_1"><i class="fa-brands fa-instagram mr-1"></i> Instagram</th>
                <td><?php echo $instagram["descripcion_contacto"]; ?></>
              </tr>
            <?php } ?>

            <?php foreach ($referenteTwitter as $twitter) { ?>
              <tr>
                <th class="sorting_1"><i class="fab fa-twitter-square mr-1"></i> Twitter</th>
                <td><?php echo $twitter["descripcion_contacto"]; ?></>
              </tr>
            <?php } ?>

            <?php foreach ($referenteWeb  as $web) { ?>
              <tr>
                <th class="sorting_1"><i class="fas fa-globe mr-1"></i> Sitio Web</th>
                <td><?php echo $web["descripcion_contacto"]; ?></>
              </tr>
            <?php } ?>

            <?php foreach ($referenteOtro as $otro) { ?>
              <tr>
                <th class="sorting_1"><i class="fas fa-street-view mr-1"></i> Otros</th>
                <td><?php echo $otro["descripcion_contacto"]; ?></>
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

  <div class="card-footer mb-4 card">
    <div class="row no-print">
      <div class="col-12">
        <a href="?controlador=referentes&accion=imprimirInfo&id=<?=$id_referente; ?>" rel="noopener" class="btn btn-default float-right">
          <i class="fas fa-print mr-2"></i> Imprimir
        </a>
      </div>
    </div>
  </div>

</div>