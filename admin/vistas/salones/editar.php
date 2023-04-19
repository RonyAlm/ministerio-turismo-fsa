<?php

if (!isset($_SESSION['id'])) {
  header("Location: index.php");
}

$usuario = $_SESSION['usuarios'];
$rol_id = $_SESSION['rol_id'];


?>

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
    ordenarSelect('categoriaAlojamiento');
    ordenarSelect('localidadAlojamiento');
  });
</script>

<div class="card card-success card-outline mt-3">

  <div class="card-header ">
    <h3 class="card-title text-success">
      <i class="fas fa-edit mr-2"></i>
      Editar Alojamiento
    </h3>
  </div>

  <!-- Main content -->
  <div class="card-body mb-1">

    <form action="" method="post">

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
                <label for="nombreSalon">Designación Comercial:</label>
                <input type="hidden" id="IdSalon" name="IdSalon" value="<?php echo $insertar->id_salones; ?>">
                <input type="text" value="<?php echo $insertar->nombre_salones; ?>" id="nombreSalon" name="nombreSalon" class="form-control" required>
              </div>
              <div class="form-group">
                <label for="localidadAlojamiento">Localidad</label>
                <input type="hidden" id="localidadIdSalon" name="localidadIdSalon" value="<?php echo $insertar->id_direccion; ?>">
                <?php $nombre_localidad_actual = $insertar->nombre_localidad; ?>
                <select id="localidadAlojamiento" name="localidadAlojamiento" class="form-control select2" required>
                  <?php foreach ($buscarSelectLocalidad as $k) : ?>
                    <option value="<?php echo $k->id_localidad; ?>" <?= ($k->nombre_localidad == $nombre_localidad_actual) ? 'selected="selected"' : ''; ?>> <?php echo $k->nombre_localidad; ?></option>
                  <?php endforeach; ?>
                </select>
              </div>

              <div class="form-group">
                <label for="idoneoSalones">Idóneo - Encargado/a</label>
                <input type="hidden" id="" name="" value="<?php echo $insertar->id_salones; ?>">
                <input type="text" value="<?php echo $insertar->idoneo_salones; ?>" id="idoneoSalones" name="idoneoSalones" class="form-control">
              </div>

              <div class="form-group">
                <label for="cuit_salones">Cuit</label>
                <input type="hidden" id="" name="" value="<?php echo $insertar->id_salones; ?>">
                <input type="text" value="<?php echo $insertar->cuit_salones; ?>" id="cuit_salones" name="cuit_salones" class="form-control">
              </div>

              <div class="form-group">
                <label for="domicilioSalones">Domicilio</label>
                <input type="hidden" id="IDdireccionSalones" name="IDdireccionSalones" value="<?php echo $insertar->id_direccion; ?>">
                <input type="text" value="<?php echo $insertar->calle_direccion; ?>" id="domicilioSalones" name="domicilioSalones" class="form-control">
              </div>

              <div class="form-group">
                <label for="habilitacionsalones">Habilitación Municipal</label>
                <input type="hidden" id="IDhabilitacionsalones" name="IDhabilitacionsalones" value="<?php echo $insertar->id_habi_municipal; ?>">

                <?php $id_habi_municipal_actual = $insertar->id_habi_municipal; ?>
                <select id="habilitacionsalones" name="habilitacionsalones" class="form-control select2" required>
                  <?php foreach ($buscarSelecthabilitacion as $k) : ?>
                    <option value="<?= $k->id_habi_municipal; ?>" <?= ($k->id_habi_municipal == $id_habi_municipal_actual) ? 'selected="selected"' : ''; ?>> <?= $k->descripcion; ?></option>
                  <?php endforeach; ?>
                </select>
              </div>

              <div class="form-group">
                <label for="estadoSalones">Estado</label>
                <input type="hidden" id="IDestadoSalones" name="IDestadoSalones" value="<?php echo $insertar->id_estado; ?>">
                <?php $desc_tipo_estado_actual = $insertar->descripcion_tipo_estado; ?>
                <select id="estadoSalones" name="estadoSalones" class="form-control select2" required>
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
              <?php foreach ($alojamientosTelefono as $telefonos) { ?>
                <div class="form-group">
                  <label for="telefonoAlojamiento">Teléfono Celular</label>
                  <input type="hidden" id="alojamientoIDtelefono" name="alojamientoIDtelefono[]" value="<?php echo $telefonos['id_contacto']; ?>">
                  <input type="number" value="<?php echo $telefonos['descripcion_contacto']; ?>" id="telefonoAlojamiento" name="telefonoAlojamiento[]" class="form-control">
                </div>
              <?php  } ?>

              <div class="form-group">
                <label for="telefonoFijoAlojamiento">Teléfono Fijo</label>
                <input type="hidden" id="alojamientoIDtelefonoFijo" name="alojamientoIDtelefonoFijo" value="<?php echo $alojamientosTelefonoFijo->id_contacto; ?>">
                <input type="number" value="<?php echo $alojamientosTelefonoFijo->descripcion_contacto; ?>" id="telefonoFijoAlojamiento" name="telefonoFijoAlojamiento" class="form-control">
              </div>
              <div class="form-group">
                <label for="correoAlojamiento">Correo</label>
                <input type="hidden" id="alojamientoIDcorreo" name="alojamientoIDcorreo" value="<?php echo $alojamientosCorreo->id_contacto; ?>">
                <input type="email" value="<?php echo $alojamientosCorreo->descripcion_contacto; ?>" id="correoAlojamiento" name="correoAlojamiento" class="form-control">
              </div>
              <div class="form-group">
                <label for="facebookAlojamiento">Facebook</label>
                <input type="hidden" id="alojamientoIDfacebook" name="alojamientoIDfacebook" value="<?php echo $alojamientosFacebook->id_contacto; ?>">
                <input type="text" value="<?php echo $alojamientosFacebook->descripcion_contacto; ?>" id="facebookAlojamiento" name="facebookAlojamiento" class="form-control">
              </div>
              <div class="form-group">
                <label for="instagramAlojamiento">Instagram</label>
                <input type="hidden" id="alojamientoIDinstagram" name="alojamientoIDinstagram" value="<?php echo $alojamientosInstagram->id_contacto; ?>">
                <input type="text" value="<?php echo $alojamientosInstagram->descripcion_contacto; ?>" id="instagramAlojamiento" name="instagramAlojamiento" class="form-control">
              </div>
              <div class="form-group">
                <label for="twitterAlojamiento">Twitter</label>
                <input type="hidden" id="alojamientoIDtwitter" name="alojamientoIDtwitter" value="<?php echo $alojamientosTwitter->id_contacto; ?>">
                <input type="text" value="<?php echo $alojamientosTwitter->descripcion_contacto; ?>" id="twitterAlojamiento" name="twitterAlojamiento" class="form-control">
              </div>
              <div class="form-group">
                <label for="webAlojamiento">Sitio Web</label>
                <input type="hidden" id="alojamientoIDweb" name="alojamientoIDweb" value="<?php echo $alojamientosWeb->id_contacto; ?>">
                <input type="text" value="<?php echo $alojamientosWeb->descripcion_contacto; ?>" id="webAlojamiento" name="webAlojamiento" class="form-control">
              </div>
              <div class="form-group">
                <label for="otroAlojamiento">Otro</label>
                <input type="hidden" id="alojamientoIDotro" name="alojamientoIDotro" value="<?php echo $alojamientosOtro->id_contacto; ?>">
                <input type="text" value="<?php echo $alojamientosOtro->descripcion_contacto; ?>" id="otroAlojamiento" name="otroAlojamiento" class="form-control">
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
                <label for="seminarioAlojamiento">Cantidad de Salones:</label>
                <input type="hidden" id="IDserviciosComplementarios" name="IDserviciosComplementarios" value="<?php echo $insertar->id_serv_comple_alojamiento; ?>">
                <input type="text" value="<?php echo $insertar->cantidad_salones; ?>" id="seminarioAlojamiento" name="seminarioAlojamiento" class="form-control">
              </div>

              <div class="form-group">
                <label for="congresoAlojamiento">Capacidad:</label>
                <input type="hidden" id="" name="" value="<?php echo $insertar->id_serv_comple_alojamiento; ?>">
                <input type="text" value="<?php echo $insertar->capacidad_salones; ?>" id="congresoAlojamiento" name="congresoAlojamiento" class="form-control"></input>
              </div>

              <div class="form-group">
                <label for="eventoSocialAlojamiento">Wifi:</label>
                <input type="hidden" id="" name="" value="<?php echo $insertar->id_serv_comple_alojamiento; ?>">
                <input type="text" value="<?php echo $insertar->wifi_salones; ?>" id="eventoSocialAlojamiento" name="eventoSocialAlojamiento" class="form-control"></input>
              </div>

              <div class="form-group">
                <label for="salonAlojamiento">Estacionamiento:</label>
                <input type="hidden" id="" name="" value="<?php echo $insertar->id_serv_comple_alojamiento; ?>">
                <input type="text" value="<?php echo $insertar->estacionamiento_salones; ?>" id="salonAlojamiento" name="salonAlojamiento" class="form-control">
              </div>

              <div class="form-group">
                <label for="reunionAlojamiento">Otros Servicios:</label>
                <input type="hidden" id="" name="" value="<?php echo $insertar->id_serv_comple_alojamiento; ?>">
                <input type="text" value="<?php echo $insertar->otros_servicio_salones; ?>" id="reunionAlojamiento" name="reunionAlojamiento" class="form-control">
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
      <a href="index2.php?controlador=salones&accion=inicio" class="btn btn-secondary">Cancelar</a>
      <input name="" id="" class="btn btn-success" type="submit" value="Editar">
    </div>
    </form>
  </div>


</div>