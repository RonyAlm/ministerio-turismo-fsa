<div class="card card-success">

  <div class="card-header">
    Agregar Alojamiento
  </div>
  <div class="mb-1">

  </div>


  <!-- Main content -->

  <form action="" id="agregarAlojamiento" method="post" enctype="multipart/form-data">

    <div class="row">
      <!-- CREAR GENERAL -->
      <div class="col-md-6">
        <div class="card card-primary">
          <div class="card-header">
            <h3 class="card-title">General</h3>

            <div class="card-tools">
              <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                <i class="fas fa-minus"></i>
              </button>
            </div>
          </div>
          <div class="card-body">

            <div class="form-group">
              <label for="categoriaAlojamiento">Categoría</label>
              <select id="categoriaAlojamiento" name="categoriaAlojamiento" class="form-control custom-select" required>
                <option value="0" selected disabled>Seleccionar la Categoría</option>
                <?php foreach ($buscarSelectTipoAlojamiento as $k) : ?>
                  <option value="<?php echo $k->id_tipo_alojamiento; ?>"> <?php echo $k->descripcion_tipo_alojamiento; ?></option>
                <?php endforeach; ?>
              </select>
            </div>
            <div class="form-group">
              <label for="nombreAlojamiento">Designación Comercial:</label>
              <input type="text" id="nombreAlojamiento" name="nombreAlojamiento" class="form-control">
            </div>
            <div class="form-group">
              <label for="localidadAlojamiento">Localidad</label>
              <select id="localidadAlojamiento" name="localidadAlojamiento" class="form-control custom-select" required>
                <option value="0" selected disabled>Seleccionar la localidad</option>
                <?php foreach ($buscarSelectLocalidad as $k) : ?>
                  <option value="<?php echo $k->id_localidad; ?>"> <?php echo $k->nombre_localidad; ?></option>
                <?php endforeach; ?>
              </select>
            </div>
            <div class="form-group">
              <label for="razonsocialAlojamiento">Razón Social:</label>
              <input type="text" id="razonsocialAlojamiento" name="razonsocialAlojamiento" class="form-control"></input>
            </div>

            <div class="form-group">
              <label for="estrellaAlojamiento">Estrella:</label>
              <input type="text" id="estrellaAlojamiento" name="estrellaAlojamiento" class="form-control"></input>
            </div>

            <div class="form-group">
              <label for="rubroAlojamiento">Rubro</label>
              <select id="rubroAlojamiento" name="rubroAlojamiento" class="form-control custom-select" required>
                <option value="0" selected disabled>Seleccionar el Rubro</option>
                <?php foreach ($buscarSelectRubro as $k) : ?>
                  <option value="<?php echo $k->id_rubro_alojamiento; ?>"> <?php echo $k->descripcion_rubro; ?></option>
                <?php endforeach; ?>
              </select>
            </div>
            <div class="form-group">
              <label for="idoneoAlojamiento">Idóneo - Encargado/a</label>
              <input type="text" id="idoneoAlojamiento" name="idoneoAlojamiento" class="form-control">
            </div>

            <div class="form-group">
              <label for="cuitAlojamiento">Cuit</label>
              <input type="text" id="cuitAlojamiento" name="cuitAlojamiento" class="form-control">
            </div>

            <div class="form-group">
              <label for="domicilioAlojamiento">Domicilio</label>
              <input type="text" id="domicilioAlojamiento" name="domicilioAlojamiento" class="form-control">
            </div>

            <div class="form-group">
              <label for="habilitacionAlojamiento">Habilitación Municipal</label>
              <select id="habilitacionAlojamiento" name="habilitacionAlojamiento" class="form-control custom-select" required>
                <option value="0" selected disabled>Seleccionar el Estado de la Habilitación</option>
                <?php foreach ($buscarSelecthabilitacion as $k) : ?>
                  <option value="<?php echo $k->id_habi_municipal; ?>"> <?php echo $k->descripcion; ?></option>
                <?php endforeach; ?>
              </select>
            </div>

            <div class="form-group">
              <label for="estadoAlojamiento">Estado</label>
              <select id="estadoAlojamiento" name="estadoAlojamiento" class="form-control custom-select" required>
                <option value="0" selected disabled>Seleccionar el Estado del Alojamiento</option>
                <?php foreach ($buscarSelectEstado as $k) : ?>
                  <option value="<?php echo $k->id_tipo_estado; ?>"> <?php echo $k->descripcion_tipo_estado; ?></option>
                <?php endforeach; ?>
              </select>
            </div>

          </div>
          <!-- /.card-body -->
        </div>
        <!-- /.card -->
      </div>

      <!-- CREAR CONTACTO  -->
      <div class="col-md-6">
        <div class="card card-secondary">
          <div class="card-header">
            <h3 class="card-title">Contacto</h3>

            <div class="card-tools">
              <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                <i class="fas fa-minus"></i>
              </button>
            </div>
          </div>
          <div class="card-body">

            <div class="form-group" id="celu">
              <label for="telefonoAlojamiento">Teléfono Celular</label>
              <input type="number" id="telefonoAlojamiento" name="telefonoAlojamiento[]" class="form-control">
              <div class="btn-der">
                <button id="adicional" name="adicional" type="button" class="btn btn-warning"> Más + </button>
              </div>
            </div>

            <div class="form-group">
              <label for="telefonoFijoAlojamiento">Teléfono Fijo</label>
              <input type="number" id="telefonoFijoAlojamiento" name="telefonoFijoAlojamiento" class="form-control">
            </div>
            <div class="form-group">
              <label for="correoAlojamiento">Correo</label>
              <input type="email" id="correoAlojamiento" name="correoAlojamiento" class="form-control">
            </div>
            <div class="form-group">
              <label for="facebookAlojamiento">Facebook</label>
              <input type="text" id="facebookAlojamiento" name="facebookAlojamiento" class="form-control">
            </div>
            <div class="form-group">
              <label for="instagramAlojamiento">Instagram</label>
              <input type="text" id="instagramAlojamiento" name="instagramAlojamiento" class="form-control">
            </div>
            <div class="form-group">
              <label for="twitterAlojamiento">Twitter</label>
              <input type="text" id="twitterAlojamiento" name="twitterAlojamiento" class="form-control">
            </div>
            <div class="form-group">
              <label for="webAlojamiento">Sitio Web</label>
              <input type="text" id="webAlojamiento" name="webAlojamiento" class="form-control">
            </div>
            <div class="form-group">
              <label for="otroAlojamiento">Otro</label>
              <input type="text" id="otroAlojamiento" name="otroAlojamiento" class="form-control">
            </div>
          </div>
          <!-- /.card-body -->
        </div>
        <!-- /.card -->
      </div>

      <!-- CREAR SERVICIOS GENERALES -->
      <div class="col-md-6">
        <div class="card card-primary">
          <div class="card-header">
            <h3 class="card-title">Servicios Generales</h3>

            <div class="card-tools">
              <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                <i class="fas fa-minus"></i>
              </button>
            </div>
          </div>
          <div class="card-body">

            <div class="form-group">
              <label for="cantTotalPlazasAlojamiento">Cantidad total de Plazas:</label>
              <input type="text" id="cantTotalPlazasAlojamiento" name="cantTotalPlazasAlojamiento" class="form-control">
            </div>

            <div class="form-group">
              <label for="cantTotalAlojamiento">Cantidad total de habitaciones:</label>
              <input type="text" id="cantTotalAlojamiento" name="cantTotalAlojamiento" class="form-control">
            </div>

            <div class="form-group">
              <label for="singleAlojamiento">Cantidad de habitaciones Single:</label>
              <input type="text" id="singleAlojamiento" name="singleAlojamiento" class="form-control"></input>
            </div>

            <div class="form-group">
              <label for="dobleAlojamiento">Cantidad de habitaciones Doble:</label>
              <input type="text" id="dobleAlojamiento" name="dobleAlojamiento" class="form-control"></input>
            </div>

            <div class="form-group">
              <label for="tripleAlojamiento">Cantidad de habitaciones Triple:</label>
              <input type="text" id="tripleAlojamiento" name="tripleAlojamiento" class="form-control">
            </div>

            <div class="form-group">
              <label for="cuadrupleAlojamiento">Cantidad de habitaciones Cuadruples:</label>
              <input type="text" id="cuadrupleAlojamiento" name="cuadrupleAlojamiento" class="form-control">
            </div>

            <div class="form-group">
              <label for="matrimonialAlojamiento">Cantidad de habitaciones Matrimoniales:</label>
              <input type="text" id="matrimonialAlojamiento" name="matrimonialAlojamiento" class="form-control">
            </div>

            <div class="form-group">
              <label for="apartamentoAlojamiento">Apartamento:</label>
              <input type="text" id="apartamentoAlojamiento" name="apartamentoAlojamiento" class="form-control">
            </div>

            <div class="form-group">
              <label for="wifiAlojamiento">Wifi:</label>
              <input type="text" id="wifiAlojamiento" name="wifiAlojamiento" class="form-control">
            </div>

            <div class="form-group">
              <label for="estacionamientoAlojamiento">Estacionamiento:</label>
              <input type="text" id="estacionamientoAlojamiento" name="estacionamientoAlojamiento" class="form-control">
            </div>
            <div class="form-group">
              <label for="desayunoAlojamiento">Desayuno:</label>
              <input type="text" id="desayunoAlojamiento" name="desayunoAlojamiento" class="form-control">
            </div>

            <div class="form-group">
              <label for="piscinaAlojamiento">Piscina:</label>
              <input type="text" id="piscinaAlojamiento" name="piscinaAlojamiento" class="form-control">
            </div>

            <div class="form-group">
              <label for="otroServicioAlojamiento">Otro Servicio</label>
              <input type="text" id="otroServicioAlojamiento" name="otroServicioAlojamiento" class="form-control">
            </div>

          </div>
          <!-- /.card-body -->
        </div>
        <!-- /.card -->
      </div>

      <!-- CREAR SERVICIOS COMPLEMENTARIOS -->
      <div class="col-md-6">
        <div class="card card-primary">
          <div class="card-header">
            <h3 class="card-title">Salones</h3>

            <div class="card-tools">
              <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                <i class="fas fa-minus"></i>
              </button>
            </div>
          </div>
          <div class="card-body">
            <div class="form-group">
              <label for="seminarioAlojamiento">Cantidad de salones:</label>
              <input type="number" id="seminarioAlojamiento" name="seminarioAlojamiento" class="form-control">
            </div>

            <div class="form-group">
              <label for="congresoAlojamiento">Capacidad:</label>
              <input type="text" id="congresoAlojamiento" name="congresoAlojamiento" class="form-control"></input>
            </div>

            <div class="form-group">
              <label for="eventoSocialAlojamiento">Wifi:</label>
              <input type="text" id="eventoSocialAlojamiento" name="eventoSocialAlojamiento" class="form-control"></input>
            </div>

            <div class="form-group">
              <label for="salonAlojamiento">Estacionamiento:</label>
              <input type="text" id="salonAlojamiento" name="salonAlojamiento" class="form-control">
            </div>

            <div class="form-group">
              <label for="reunionAlojamiento">Otros Servicios:</label>
              <input type="text" id="reunionAlojamiento" name="reunionAlojamiento" class="form-control">
            </div>

          </div>
          <!-- /.card-body -->
        </div>
        <!-- /.card -->
      </div>


    </div>
    <input name="" id="" class="btn btn-success" type="submit" value="Agregar Alojamiento">

    <a href="?controlador=Alojamientos&accion=inicio" class="btn btn-primary">Cancelar</a>
  </form>


</div>