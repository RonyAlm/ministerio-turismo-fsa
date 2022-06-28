<section class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1>Información Alojamiento</h1>
      </div>
      <div class="col-sm-6">
        <ol class="breadcrumb float-sm-right">
          <li class="breadcrumb-item"><a class="text-success" href="index2.php?controlador=Alojamientos&accion=inicio">Alojamientos</a></li>
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
            <!-- <button type="button" class="btn btn-tool" data-card-widget="remove">
              <i class="fas fa-times"></i>
            </button> -->
          </div>
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
      <div class="card card-success card-outline">
        <div class="card-header">
          <h3 class="card-title text-success">
            <i class="fas fa-folder mr-2"></i>
            Información de los Servicios
          </h3>
          <div class="card-tools text-success">
            <button type="button" class="btn btn-tool" data-card-widget="collapse">
              <i class="fas fa-minus"></i>
            </button>
          </div>
        </div>
        <!-- /.card-header -->
        <div class="card-body">

          <table id="tblInfoServ" class="tblInfo table table-bordered table-striped" cellspacing="0" width="100%">

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
      <div class="card card-success card-outline collapsed-card">
        <div class="card-header">
          <h3 class="card-title text-success">
            <i class="fas fa-folder mr-2"></i>
            Contactos
          </h3>
          <div class="card-tools text-success">
            <button type="button" class="btn btn-tool" data-card-widget="collapse">
              <i class="fas fa-plus" title="Ver más"></i>
            </button>
          </div>
        </div>
        <!-- /.card-header -->
        <div class="card-body">

          <table id="tblContacto" class="tblInfo table table-bordered table-striped" cellspacing="0" width="100%">

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
      <div class="card card-success card-outline collapsed-card">
        <div class="card-header">
          <h3 class="card-title text-success">
            <i class="fas fa-folder mr-2"></i>
            Información de los Salones
          </h3>
          <div class="card-tools text-success">
            <button type="button" class="btn btn-tool" data-card-widget="collapse">
              <i class="fas fa-plus" title="Ver más"></i>
            </button>
          </div>
        </div>
        <!-- /.card-header -->
        <div class="card-body">

          <table id="tblInfoServC" class="tblInfo table table-bordered table-striped" cellspacing="0" width="100%">

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
  <div class="card-footer mb-4 card">
    <div class="row no-print">
      <div class="col-12">
        <a href="?controlador=Alojamientos&accion=imprimirInfo&id=<?php echo $infoAlojamiento->id_alojamientos; ?>" rel="noopener" class="btn btn-default float-right"><i class="fas fa-print mr-2"></i> Imprimir</a>
      </div>
    </div>
  </div>

</div>