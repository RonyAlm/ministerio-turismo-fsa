<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title></title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../../dist/css/adminlte.min.css">
</head>

<body>
  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1></h1>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a class="text-success" href="index2.php?controlador=prestadores&accion=inicio">Servicios Auxiliares de Turismo</a></li>
            <li class="breadcrumb-item active">Imprimir Información de los servicios</li>
          </ol>
        </div>
      </div>
    </div>
  </section>
  <div class="wrapper">
    <div class="card ">
      <div class="card-body">
        <!-- Main content -->
        <section class="invoice" style="border: 0 !important;">
          <!-- title row -->
          <div class="row">
            <div class="col-12">
              <h2 class="page-header">
                Prestador
                <small class="float-right">Fecha:
                  <?php
                  $Object = new DateTime();
                  $DateAndTime = $Object->format("d/m/Y");
                  echo "$DateAndTime";
                  ?>
                </small>
              </h2>
            </div>
            <!-- /.col -->
          </div>
          <!-- info row -->
          <div class="row invoice-info mb-2">
            <div class="col-sm-4 invoice-col">
              <!-- Ministerio de Turismo -->
            </div>
          </div>
          <!-- /.row -->

          <!-- Table row -->
          <div class="row">

            <!-- Información general -->
            <div class="col-md-6">
              <div class="card card-secondary card-outline">
                <div class="card-header sorting_1" style="display: flex;flex-direction: column-reverse;">
                  <h3 class="card-title text-center ">
                    <!-- <i class="fas fa-folder mr-2"></i> -->
                    Información General
                  </h3>
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
                <div class="card-footer">

                </div>
              </div>
              <!-- /.card -->
            </div>

            <!-- Contactos -->
            <div class="col-md-6">
              <div class="card card-secondary card-outline">
                <div class="card-header sorting_1" style="display: flex;flex-direction: column-reverse;">
                  <h3 class="card-title text-center ">
                    <!-- <i class="fas fa-folder mr-2"></i> -->
                    Contactos
                  </h3>
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
                <div class="card-footer"></div>
              </div>
              <!-- /.card -->
            </div>

            <!-- Servicios -->
            <div class="col-md-12">
              <div class="card card-secondary card-outline">
                <div class="card-header sorting_1" style="display: flex;flex-direction: column-reverse;">
                  <h3 class="card-title text-center ">
                    <!-- <i class="fas fa-folder mr-2"></i> -->
                    Servicios
                  </h3>
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
                <div class="card-footer"></div>
              </div>
              <!-- /.card -->
            </div>

          </div>
          <!-- /.row -->

        </section>
        <!-- /.content -->
      </div>
    </div>
  </div>
  <!-- ./wrapper -->
  <!-- Page specific script -->
  <script>
    window.addEventListener("load", window.print());
  </script>
</body>

</html>