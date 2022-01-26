<!-- Para ordenar alfabeticamente los select -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
<script>
  function ordenarSelect(id_componente) {
    var selectToSort = jQuery('#' + id_componente);
    var optionActual = selectToSort.val();
    selectToSort.html(selectToSort.children('option').sort(function(a, b) {
      return a.text === b.text ? 0 : a.text < b.text ? -1 : 1;
    })).val(optionActual);
  }
  $(document).ready(function() {
    ordenarSelect('localidadPrestador');
  });
</script>

<div class="card card-success">

  <div class="card-header">
    Editar Prestador
  </div>

  <div class="mb-1">

  </div>


  <!-- Main content -->

  <form action="" method="post">

    <div class="row">

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
              <label for="categoriaPrestador">Categoría:</label>
              <input type="hidden" id="IDcategoriaPrestador" name="IDcategoriaPrestador" value="<?php echo $insertar->id_tipo_prestador; ?>">
              <?php $id_tipo_prestador_actual = $insertar->id_tipo_prestador; ?>
              <select id="categoriaPrestador" name="categoriaPrestador" class="form-control custom-select" required>
                <?php foreach ($buscarCategoriaPrestador as $k) : ?>
                  <option value="<?= $k->id_tipo_prestador; ?>" <?= ($k->id_tipo_prestador == $id_tipo_prestador_actual) ? 'selected="selected"' : ''; ?>> <?= $k->descripcion_tipo_prestador; ?></option>
                <?php endforeach; ?>
              </select>
            </div>
            <div class="form-group">
              <label for="nombrePrestador">Apellido y Nombre:</label>
              <input type="hidden" id="IDnombre" name="IDnombre" value="<?php echo $insertar->id_prestador; ?>">
              <input type="text" id="nombrePrestador" name="nombrePrestador" value="<?php echo $insertar->descripcion_prestador; ?>" class="form-control" required>
            </div>
            <div class="form-group">
              <label for="localidadPrestador">Localidad:</label>
              <input type="hidden" id="IDlocalidad" name="IDlocalidad" value="<?php echo $insertar->id_direccion; ?>">
              <?php $nombre_localidad_actual = $insertar->nombre_localidad; ?>
              <select id="localidadPrestador" name="localidadPrestador" class="form-control custom-select" required>
                <?php foreach ($buscarSelectLocalidad as $k) : ?>
                  <option value="<?php echo $k->id_localidad; ?>" <?= ($k->nombre_localidad == $nombre_localidad_actual) ? 'selected="selected"' : ''; ?>> <?php echo $k->nombre_localidad; ?></option>
                <?php endforeach; ?>
              </select>
            </div>
            <div class="form-group">
              <label for="dniPrestador">DNI:</label>
              <input type="hidden" id="" name="" value="<?php echo $insertar->id_prestador; ?>">
              <input type="text" id="dniPrestador" name="dniPrestador" value="<?php echo $insertar->dni_prestador; ?>" class="form-control"></input>
            </div>

            <div class="form-group">
              <label for="institucionPrestador">Institución/Emprendimiento:</label>
              <input type="hidden" id="" name="" value="<?php echo $insertar->id_prestador; ?>">
              <input type="text" id="institucionPrestador" name="institucionPrestador" value="<?php echo $insertar->institucion_prestador; ?>" class="form-control"></input>
            </div>


            <div class="form-group">
              <label for="cuitPrestador">Cuit/Cuil</label>
              <input type="hidden" id="" name="" value="<?php echo $insertar->id_prestador; ?>">
              <input type="text" id="cuitPrestador" name="cuitPrestador" value="<?php echo $insertar->cuit_prestador; ?>" class="form-control" required>
            </div>

            <div class="form-group">
              <label for="domicilioPrestador">Domicilio</label>
              <input type="hidden" id="IDdomicilio" name="IDdomicilio" value="<?php echo $insertar->id_direccion; ?>">
              <input type="text" id="domicilioPrestador" name="domicilioPrestador" value="<?php echo $insertar->calle_direccion; ?>" class="form-control">
            </div>

            <div class="form-group">
              <label for="estadoPrestador">Estado</label>
              <input type="hidden" id="IDestado" name="IDestado" value="<?php echo $insertar->id_estado; ?>">
              <?php $desc_tipo_estado_actual = $insertar->descripcion_tipo_estado; ?>
              <select id="estadoPrestador" name="estadoPrestador" class="form-control custom-select" required>
                <?php foreach ($buscarSelectEstado as $k) : ?>
                  <option value="<?= $k->id_tipo_estado; ?>" <?= ($k->descripcion_tipo_estado == $desc_tipo_estado_actual) ? 'selected="selected"' : ''; ?>> <?= $k->descripcion_tipo_estado; ?></option>
                <?php endforeach; ?>
              </select>
            </div>

          </div>
          <!-- /.card-body -->
        </div>
        <!-- /.card -->
      </div>
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


            <?php foreach ($prestadorTelefono as $telefonos) { ?>
              <div class="form-group" id="celu">
                <label for="telefonoPrestador">Teléfono Celular</label>
                <input type="hidden" id="IDcelular" name="IDcelular[]" value="<?php echo $telefonos["id_contacto"]; ?>">
                <input type="number" id="telefonoPrestador" name="telefonoPrestador[]" value="<?php echo $telefonos["descripcion_contacto"] ?>" class="form-control">
              </div>

            <?php  } ?>

            <div class="form-group">
              <label for="telefonoFijoPrestador">Teléfono Fijo</label>
              <input type="hidden" id="IDfijo" name="IDfijo" value="<?php echo $prestadorTelefonoFijo->id_contacto; ?>">
              <input type="number" id="telefonoFijoPrestador" name="telefonoFijoPrestador" value="<?php echo $prestadorTelefonoFijo->descripcion_contacto; ?>" class="form-control">
            </div>
            <div class="form-group">
              <label for="correoPrestador">Correo</label>
              <input type="hidden" id="IDcorreo" name="IDcorreo" value="<?php echo $prestadorCorreo->id_contacto; ?>">
              <input type="email" id="correoPrestador" name="correoPrestador" value="<?php echo $prestadorCorreo->descripcion_contacto; ?>" class="form-control">
            </div>
            <div class="form-group">
              <label for="facebookPrestador">Facebook</label>
              <input type="hidden" id="IDfacebook" name="IDfacebook" value="<?php echo $prestadorFacebook->id_contacto; ?>">
              <input type="text" id="facebookPrestador" name="facebookPrestador" value="<?php echo $prestadorFacebook->descripcion_contacto; ?>" class="form-control">
            </div>
            <div class="form-group">
              <label for="instagramPrestador">Instagram</label>
              <input type="hidden" id="IDinstagram" name="IDinstagram" value="<?php echo $prestadorInstagram->id_contacto; ?>">
              <input type="text" id="instagramPrestador" name="instagramPrestador" value="<?php echo $prestadorInstagram->descripcion_contacto; ?>" class="form-control">
            </div>
            <div class="form-group">
              <label for="twitterPrestador">Twitter</label>
              <input type="hidden" id="IDtwitter" name="IDtwitter" value="<?php echo $prestadorTwitter->id_contacto; ?>">
              <input type="text" id="twitterPrestador" name="twitterPrestador" value="<?php echo $prestadorTwitter->descripcion_contacto; ?>" class="form-control">
            </div>
            <div class="form-group">
              <label for="webPrestador">Sitio Web</label>
              <input type="hidden" id="IDsitio" name="IDsitio" value="<?php echo $prestadorWeb->id_contacto; ?>">
              <input type="text" id="webPrestador" name="webPrestador" value="<?php echo $prestadorWeb->descripcion_contacto; ?>" class="form-control">
            </div>
            <div class="form-group">
              <label for="otroPrestador">Otro</label>
              <input type="hidden" id="IDotro" name="IDotro" value="<?php echo $prestadorOtro->id_contacto; ?>">
              <input type="text" id="otroPrestador" name="otroPrestador" value="<?php echo $prestadorOtro->descripcion_contacto; ?>" class="form-control">
            </div>
          </div>
          <!-- /.card-body -->
        </div>
        <!-- /.card -->
      </div>

      <!-- CREAR SERVICIOS  -->
      <div class="col-md-6">
        <div class="card card-primary">
          <div class="card-header">
            <h3 class="card-title">Servicios </h3>

            <div class="card-tools">
              <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                <i class="fas fa-minus"></i>
              </button>
            </div>
          </div>
          <div class="card-body">


            <div class="form-group">
              <label for="serviciosPrestador">Servicios</label>
              <input type="hidden" id="IDservicios" name="IDservicios" value="<?php echo $insertar->id_tipo_servicios_prestadores; ?>">
              <div class="select2-purple">

                <?php
                $id = [];
                foreach ($buscarServicioPrestador2 as $k) {
                  $id[] = $k->id_tipo_servicios_prestadores;
                  //print_r($id);
                };
                ?>
                <select class="select2" id="serviciosPrestador" name="serviciosPrestador[]" multiple="multiple" data-placeholder="Seleccionar Servicios" data-dropdown-css-class="select2-purple" style="width: 100%;">
                  <?php foreach ($buscarServicioPrestador as $k) : ?>
                    <option value="<?php echo $k->id_tipo_servicios_prestadores ?>" <?php echo in_array($k->id_tipo_servicios_prestadores, $id) ? 'selected' : ''; ?>>
                      <?php echo $k->descrip_tipo_serv_prestadores;  ?>
                    </option>
                  <?php endforeach; ?>
                </select>
              </div>
            </div>

            <div class="form-group">
              <label for="otroserviciosPrestador">Otros Servicios:</label>
              <input type="hidden" id="IDotroServicio" name="IDotroServicio" value="<?php echo $insertar->id_servicios_prestadores; ?>">
              <input type="text" id="otroserviciosPrestador" name="otroserviciosPrestador" value="<?php echo $insertar->otros_servicios_prestadores; ?>" class="form-control">
            </div>

          </div>
          <!-- /.card-body -->
        </div>
        <!-- /.card -->
      </div>
    </div>
    <input name="" id="" class="btn btn-success" type="submit" value="Editar Prestador">

    <a href="?controlador=prestadores&accion=inicio" class="btn btn-primary">Cancelar</a>
  </form>


</div>