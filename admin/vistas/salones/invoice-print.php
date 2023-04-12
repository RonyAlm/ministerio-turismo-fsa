<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title></title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet"
    href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
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
            <li class="breadcrumb-item"><a class="text-success"
                href="index2.php?controlador=Alojamientos&accion=inicio">Alojamientos</a></li>
            <li class="breadcrumb-item active">Imprimir Información Alojamiento</li>
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
                Alojamiento
                <small class="float-right">Fecha: <?php
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
                      <th class="sorting_1">Designación Comercial</th>
                      <td><?php echo $infoAlojamiento->descripcion_alojamientos; ?></td>
                    </tr>
                    <tr>
                      <th class="sorting_1">Localidad</th>
                      <td><?php echo $infoAlojamiento->nombre_localidad; ?></td>
                    </tr>
                    <tr>
                      <th class="sorting_1">Dirección</th>
                      <td><?php echo $infoAlojamiento->calle_direccion; ?></td>
                    </tr>
                    <tr>
                      <th class="sorting_1">Departamento</th>
                      <td><?php echo $infoAlojamiento->descripcion_departamentos; ?></td>
                    </tr>
                    <tr>
                      <th class="sorting_1">Razón Social</th>
                      <td><?= $infoAlojamiento->descripcion_razon_social; ?></td>
                    </tr>
                    <tr>
                      <th class="sorting_1">Idóneo o Responsable</th>
                      <td><?php echo $infoAlojamiento->idoneo_alojamiento; ?></td>
                    </tr>
                    <tr>
                      <th class="sorting_1">Cuit</th>
                      <td><?php echo $infoAlojamiento->cuit_alojamiento; ?></td>
                    </tr>
                    <tr>
                      <th class="sorting_1">Estrellas</th>
                      <td><?php echo $infoAlojamiento->estrella_alojamiento; ?></td>
                    </tr>
                    <tr>
                      <th class="sorting_1">Categoria</th>
                      <td><?php echo $infoAlojamiento->descripcion_tipo_alojamiento; ?></td>
                    </tr>
                    <tr>
                      <th class="sorting_1">Rubro</th>
                      <td><?php echo $infoAlojamiento->descripcion_rubro; ?></td>
                    </tr>
                    <tr>
                      <th class="sorting_1">Habilitación Municipal</th>
                      <td><?php echo $infoAlojamiento->descripcion; ?></td>
                    </tr>
                    <tr>
                      <th class="sorting_1">Estado</th>
                      <td><?= $infoAlojamiento->descripcion_tipo_estado ?></td>
                    </tr>
                    <tr>
                      <th class="sorting_1">Última actualización</th>
                      <td><?= $infoAlojamiento->fecha_edit_alojamiento; ?></td>
                    </tr>

                  </table>

                </div>
                <!-- /.card-body -->
                <div class="card-footer">

                </div>
              </div>
              <!-- /.card -->
            </div>
            <!-- Servicios -->
            <div class="col-md-6">
              <div class="card card-secondary card-outline">
                <div class="card-header sorting_1" style="display: flex;flex-direction: column-reverse;">
                  <h3 class="card-title text-center ">
                    <!-- <i class="fas fa-folder mr-2"></i> -->
                    Información de los Servicios
                  </h3>
                </div>
                <!-- /.card-header -->
                <div class="card-body">

                  <table id="tblInfoServ" class="tblInfo table table-bordered table-striped" cellspacing="0"
                    width="100%">

                    <tr>
                      <th class="sorting_1">Cantidad total de Plazas</th>
                      <td><?php echo $infoAlojamiento->cantidad_plazas; ?></td>
                    </tr>
                    <tr>
                      <th class="sorting_1">Cantidad total de habitaciones</th>
                      <td><?php echo $infoAlojamiento->cantidad_total_hab; ?></td>
                    </tr>
                    <tr>
                      <th class="sorting_1">Cantidad de habitaciones Single</th>
                      <td><?php echo $infoAlojamiento->cantidad_hab_single; ?></td>
                    </tr>
                    <tr>
                      <th class="sorting_1">Cantidad de habitaciones Doble</th>
                      <td><?php echo $infoAlojamiento->cantidad_hab_doble; ?></td>
                    </tr>
                    <tr>
                      <th class="sorting_1">Cantidad de habitaciones Triple</th>
                      <td><?php echo $infoAlojamiento->cantidad_hab_triple; ?></td>
                    </tr>
                    <tr>
                      <th class="sorting_1">Cantidad de habitaciones Cuadruples</th>
                      <td><?php echo $infoAlojamiento->cantidad_hab_cuadruple; ?></td>
                    </tr>
                    <tr>
                      <th class="sorting_1">Cantidad de habitaciones Matrimoniales</th>
                      <td><?php echo $infoAlojamiento->cantidad_hab_matrimoniales; ?></td>
                    </tr>
                    <tr>
                      <th class="sorting_1">Apartamento</th>
                      <td><?php echo $infoAlojamiento->apartamento_alojamiento; ?></td>
                    </tr>
                    <tr>
                      <th class="sorting_1">Wifi</th>
                      <td><?php echo $infoAlojamiento->wifi_alojamiento; ?></td>
                    </tr>
                    <tr>
                      <th class="sorting_1">Estacionamiento</th>
                      <td><?php echo $infoAlojamiento->estacionamiento_alojamiento; ?></td>
                    </tr>
                    <tr>
                      <th class="sorting_1">Desayuno</th>
                      <td><?php echo $infoAlojamiento->desayuno_alojamiento; ?></td>
                    </tr>
                    <tr>
                      <th class="sorting_1">Piscina</th>
                      <td><?php echo $infoAlojamiento->piscina_alojamiento; ?></td>
                    </tr>
                    <tr>
                      <th class="sorting_1">Otros Servicios</th>
                      <td><?php echo $infoAlojamiento->otros_servicios; ?></td>
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

                  <table id="tblContacto" class="tblInfo tblIm table table-bordered table-striped" cellspacing="0"
                    width="100%">

                    <?php foreach ($alojamientosTelefono as $telefonos) : ?>
                    <tr>
                      <th class="sorting_1">
                        <i class="fas fa-phone mr-1"></i>
                        Teléfono Celular
                      </th>
                      <td><?= $telefonos["descripcion_contacto"]; ?></td>
                    </tr>
                    <?php endforeach; ?>

                    <?php foreach ($alojamientoTelefonoFijo as $telefonosFijo) : ?>
                    <tr>
                      <th class="sorting_1">
                        <i class="fas fa-phone mr-1"></i>
                        Teléfono Fijo
                      </th>
                      <td><?= $telefonosFijo["descripcion_contacto"]; ?></td>
                    </tr>
                    <?php endforeach; ?>

                    <?php foreach ($alojamientosCorreo as $correos) : ?>
                    <tr>
                      <th class="sorting_1">
                        <!-- <i class="fas fa-at mr-2"></i> -->
                        <i class=" fas fa-solid fa-envelope mr-1"></i>
                        Correo
                      </th>
                      <td><?php echo $correos["descripcion_contacto"]; ?></td>
                    </tr>
                    <?php endforeach; ?>

                    <?php foreach ($alojamientosFacebook as $facebook) : ?>
                    <tr>
                      <th class="sorting_1">
                        <i class="fab fa-facebook mr-1"></i>
                        Facebook
                      </th>
                      <td><?php echo $facebook["descripcion_contacto"]; ?></td>
                    </tr>
                    <?php endforeach; ?>

                    <?php foreach ($alojamientosInstagram as $instagram) : ?>
                    <tr>
                      <th class="sorting_1">
                        <i class="fa-brands fa-instagram mr-1"></i>
                        Instagram
                      </th>
                      <td><?php echo $instagram["descripcion_contacto"]; ?></td>
                    </tr>
                    <?php endforeach; ?>

                    <?php foreach ($alojamientosTwitter as $twitter) : ?>
                    <tr>
                      <th class="sorting_1">
                        <i class="fab fa-twitter-square mr-1"></i>
                        Twitter
                      </th>
                      <td><?php echo $twitter["descripcion_contacto"]; ?></td>
                    </tr>
                    <?php endforeach; ?>

                    <?php foreach ($alojamientosWeb  as $web) : ?>
                    <tr>
                      <th class="sorting_1">
                        <i class="fas fa-globe mr-1"></i>
                        Sitio Web
                      </th>
                      <td><?php echo $web["descripcion_contacto"]; ?></td>
                    </tr>
                    <?php endforeach; ?>

                    <?php foreach ($alojamientosOtro as $otro) : ?>
                    <tr>
                      <th class="sorting_1">
                        <i class="fas fa-street-view mr-1"></i>
                        Otro
                      </th>
                      <td><?php echo $otro["descripcion_contacto"]; ?></td>
                    </tr>
                    <?php endforeach; ?>

                  </table>

                </div>
                <!-- /.card-body -->
                <div class="card-footer"></div>
              </div>
              <!-- /.card -->
            </div>
            <!-- Servicios Complementarios -->
            <div class="col-md-6">
              <div class="card card-secondary card-outline">
                <div class="card-header sorting_1" style="display: flex;flex-direction: column-reverse;">
                  <h3 class="card-title text-center ">
                    <!-- <i class="fas fa-folder mr-2"></i> -->
                    Información de los Salones
                  </h3>
                </div>
                <!-- /.card-header -->
                <div class="card-body">

                  <table id="tblInfoServC" class="tblInfo table table-bordered table-striped" cellspacing="0"
                    width="100%">

                    <tr>
                      <th class="sorting_1">Cantidad de salones:</th>
                      <td><?php echo $infoAlojamiento->cantidad_salones; ?></td>
                    </tr>
                    <tr>
                      <th class="sorting_1">Capacidad:</th>
                      <td><?php echo $infoAlojamiento->capacidad_salones; ?></td>
                    </tr>
                    <tr>
                      <th class="sorting_1">Wifi:</th>
                      <td><?php echo $infoAlojamiento->wifi_salones; ?></td>
                    </tr>
                    <tr>
                      <th class="sorting_1">Estacionamiento:</th>
                      <td><?php echo $infoAlojamiento->estacionamiento_salones; ?></td>
                    </tr>
                    <tr>
                      <th class="sorting_1">Otros Servicios:</th>
                      <td><?php echo $infoAlojamiento->otros_servicio_salones; ?></td>
                    </tr>

                  </table>
                </div>
                <!-- /.card-body -->
                <div class="card-footer">

                </div>
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