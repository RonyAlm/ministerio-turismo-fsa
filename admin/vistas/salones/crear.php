<div class="card card-success card-outline mt-3">

  <div class="card-header ">
    <h3 class="card-title text-success">
      <i class="fas fa-solid fa-plus-minus  mr-2"></i>
      Agregar Salones
    </h3>
  </div>
  <div class="mb-1">

  </div>


  <!-- Main content -->
  <div class="card-body">
    <form action="" id="agregarsalones" method="post" enctype="multipart/form-data">

      <div class="row">
        <!-- CREAR GENERAL -->
        <div class="col-md-6">
          <div class="card card-success card-outline">
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
                <label for="nombresalones">Designación Comercial:</label>
                <input type="text" id="nombresalones" name="nombresalones" class="form-control">
              </div>
              <div class="form-group">
                <label for="localidadsalones">Localidad</label>
                <select id="localidadsalones" name="localidadsalones" class="form-control select2" required>
                  <option value="0" selected disabled>Seleccionar la localidad</option>
                  <?php foreach ($buscarSelectLocalidad as $k) : ?>
                    <option value="<?php echo $k->id_localidad; ?>"> <?php echo $k->nombre_localidad; ?></option>
                  <?php endforeach; ?>
                </select>
              </div>

              <div class="form-group">
                <label for="idoneosalones">Idóneo - Encargado/a</label>
                <input type="text" id="idoneosalones" name="idoneosalones" class="form-control">
              </div>

              <div class="form-group">
                <label for="cuitsalones">Cuit</label>
                <input type="text" id="cuitsalones" name="cuitsalones" class="form-control">
              </div>

              <div class="form-group">
                <label for="domiciliosalones">Domicilio</label>
                <input type="text" id="domiciliosalones" name="domiciliosalones" class="form-control">
              </div>

              <div class="form-group">
                <label for="habilitacionsalones">Habilitación Municipal</label>
                <select id="habilitacionsalones" name="habilitacionsalones" class="form-control select2" required>
                  <option value="0" selected disabled>Seleccionar el Estado de la Habilitación</option>
                  <?php foreach ($buscarSelecthabilitacion as $k) : ?>
                    <option value="<?php echo $k->id_habi_municipal; ?>"> <?php echo $k->descripcion; ?></option>
                  <?php endforeach; ?>
                </select>
              </div>

              <div class="form-group">
                <label for="estadosalones">Estado</label>
                <select id="estadosalones" name="estadosalones" class="form-control select2" required>
                  <option value="0" selected disabled>Seleccionar el Estado del salón</option>
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
          <div class="card card-success card-outline">
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
                <div class="btn-der mt-3 mb-3">
                  <!-- <button id="adicional" name="adicional" type="button" class="btn btn-warning"> Más + </button> -->
                  <span id="adicional" name="adicional" class="btn btn-success col fileinput-button dz-clickable">
                    <i class="fas fa-plus"></i>
                    <span>Más teléfono</span>
                  </span>
                </div>
              </div>

              <div class="telefonos">
                <!-- en este contenedor de agregar los demas teléfonos -->
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


        <!-- CREAR SERVICIOS COMPLEMENTARIOS -->
        <div class="col-md-6">
          <div class="card card-success card-outline">
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
                <label for="seminariosalones">Cantidad de salones:</label>
                <input type="number" id="seminariosalones" name="seminariosalones" class="form-control">
              </div>

              <div class="form-group">
                <label for="congresosalones">Capacidad:</label>
                <input type="text" id="congresosalones" name="congresosalones" class="form-control"></input>
              </div>

              <div class="form-group">
                <label for="eventoSocialsalones">Wifi:</label>
                <input type="text" id="eventoSocialsalones" name="eventoSocialsalones" class="form-control"></input>
              </div>

              <div class="form-group">
                <label for="salonsalones">Estacionamiento:</label>
                <input type="text" id="salonsalones" name="salonsalones" class="form-control">
              </div>

              <div class="form-group">
                <label for="reunionsalones">Otros Servicios:</label>
                <input type="text" id="reunionsalones" name="reunionsalones" class="form-control">
              </div>
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
        </div>
      </div>

  </div>
  <div class="card-footer">
    <div class="float-right">
      <a href="?controlador=salones&accion=inicio" class="btn btn-secondary">Cancelar</a>
      <input name="" id="" class="btn btn-success " type="submit" value="Agregar">
    </div>
    </form>
  </div>


</div>