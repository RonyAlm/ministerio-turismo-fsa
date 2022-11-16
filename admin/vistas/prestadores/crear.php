<div class="card card-success card-outline mt-3">

  <div class="card-header ">
    <h3 class="card-title text-success">
      <i class="fas fa-solid fa-plus-minus  mr-2"></i>
      Agregar Prestador
    </h3>
  </div>

  <!-- Main content -->
  <div class="card-body">

    <form action="" id="agregarPrestador" method="post">

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
                <label for="categoriaPrestador">Categoría:</label>
                <select id="categoriaPrestador" name="categoriaPrestador" class="form-control select2" required>
                  <option value="0" selected disabled>Seleccionar la Categoría</option>
                  <?php foreach ($buscarCategoriaPrestador as $k) : ?>
                    <option value="<?php echo $k->id_tipo_prestador; ?>"> <?php echo $k->descripcion_tipo_prestador; ?></option>
                  <?php endforeach; ?>
                </select>
              </div>
              <div class="form-group">
                <label for="nombrePrestador">Apellido y Nombre:</label>
                <input type="text" id="nombrePrestador" name="nombrePrestador" class="form-control" required>
              </div>
              <div class="form-group">
                <label for="localidadPrestador">Localidad:</label>
                <select id="localidadPrestador" name="localidadPrestador" class="form-control select2" required>
                  <option value="0" selected disabled>Seleccionar la localidad</option>
                  <?php foreach ($buscarSelectLocalidad as $k) : ?>
                    <option value="<?php echo $k->id_localidad; ?>"> <?php echo $k->nombre_localidad; ?></option>
                  <?php endforeach; ?>
                </select>
              </div>
              <div class="form-group">
                <label for="dniPrestador">DNI:</label>
                <input type="text" id="dniPrestador" name="dniPrestador" class="form-control"></input>
              </div>

              <div class="form-group">
                <label for="institucionPrestador">Institución/Emprendimiento:</label>
                <input type="text" id="institucionPrestador" name="institucionPrestador" class="form-control"></input>
              </div>


              <div class="form-group">
                <label for="cuitPrestador">Cuit/Cuil</label>
                <input type="text" id="cuitPrestador" name="cuitPrestador" class="form-control">
              </div>

              <div class="form-group">
                <label for="domicilioPrestador">Domicilio</label>
                <input type="text" id="domicilioPrestador" name="domicilioPrestador" class="form-control">
              </div>

              <div class="form-group">
                <label for="estadoPrestador">Estado</label>
                <select id="estadoPrestador" name="estadoPrestador" class="form-control select2" required>
                  <option value="0" selected disabled>Seleccionar el Estado del Prestador</option>
                  <?php foreach ($buscarSelectEstado as $k) : ?>
                    <option value="<?php echo $k->id_tipo_estado; ?>"> <?php echo $k->descripcion_tipo_estado; ?></option>
                  <?php endforeach; ?>
                </select>
              </div>

            </div>
            <!-- /.card-body -->
            <div class="card-footer"></div>
          </div>
          <!-- /.card -->
        </div>

        <!-- CREAR CONTACTOS -->
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
                <label for="telefonoPrestador">Teléfono Celular</label>
                <input type="number" id="telefonoPrestador" name="telefonoPrestador[]" class="form-control">
                <div class="btn-der mt-3 mb-3">
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
                <label for="telefonoFijoPrestador">Teléfono Fijo</label>
                <input type="number" id="telefonoFijoPrestador" name="telefonoFijoPrestador" class="form-control">
              </div>

              <div class="form-group">
                <label for="correoPrestador">Correo</label>
                <input type="email" id="correoPrestador" name="correoPrestador" class="form-control">
              </div>

              <div class="form-group">
                <label for="facebookPrestador">Facebook</label>
                <input type="text" id="facebookPrestador" name="facebookPrestador" class="form-control">
              </div>

              <div class="form-group">
                <label for="instagramPrestador">Instagram</label>
                <input type="text" id="instagramPrestador" name="instagramPrestador" class="form-control">
              </div>

              <div class="form-group">
                <label for="twitterPrestador">Twitter</label>
                <input type="text" id="twitterPrestador" name="twitterPrestador" class="form-control">
              </div>

              <div class="form-group">
                <label for="webPrestador">Sitio Web</label>
                <input type="text" id="webPrestador" name="webPrestador" class="form-control">
              </div>

              <div class="form-group">
                <label for="otroPrestador">Otros</label>
                <input type="text" id="otroPrestador" name="otroPrestador" class="form-control">
              </div>

            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
        </div>

        <!-- CREAR SERVICIOS  -->
        <div class="col-md-12">
          <div class="card card-success card-outline">
            <div class="card-header">
              <h3 class="card-title">Servicios</h3>

              <div class="card-tools">
                <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                  <i class="fas fa-minus"></i>
                </button>
              </div>
            </div>

            <div class="card-body">

              <div class="form-group">
                <label for="otroserviciosPrestador">Otros Servicios</label>
                <input type="text" id="otroserviciosPrestador" name="otroserviciosPrestador" class="form-control">
              </div>

              <div class="form-group">

                <label for="serviciosPrestador">Servicios</label>
                <div class="select2-success">
                  <select class="select2" id="serviciosPrestador" name="serviciosPrestador[]" multiple="multiple" data-placeholder="Seleccionar Servicios" data-dropdown-css-class="select2-success" style="width: 100%;" required>
                    <?php foreach ($buscarServicioPrestador as $k) : ?>
                      <option value="<?php echo $k->id_tipo_servicios_prestadores; ?>"> <?php echo $k->descrip_tipo_serv_prestadores; ?></option>
                    <?php endforeach; ?>
                  </select>
                </div>

              </div>
              <!-- /.row -->

            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
        </div>

      </div>

  </div>

  <div class="card-footer">
    <div class="float-right">
      <a href="?controlador=prestadores&accion=inicio" class="btn btn-secondary">Cancelar</a>
      <input class="btn btn-success" type="submit" value="Agregar">
    </div>
    </form>
  </div>

</div>