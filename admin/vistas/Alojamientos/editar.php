<?php

if (!isset($_SESSION['id'])) {
  header("Location: index.php");
}

$usuario = $_SESSION['usuarios'];
$rol_id = $_SESSION['rol_id'];



?>
<div class="card card-success">

  <div class="card-header">
    Editar Alojamiento
  </div>

  <div class="mb-1">

  </div>


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
  <!-- Main content -->

  <form action="" method="post">

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
              <input type="hidden" id="IDcategoriaAlojamiento" name="IDcategoriaAlojamiento" value="<?php echo $insertar->id_tipo_alojamiento; ?>">
              <?php $id_tipo_alojamiento_actual = $insertar->id_tipo_alojamiento; ?>
              <select id="categoriaAlojamiento" name="categoriaAlojamiento" class="form-control custom-select" required>
                <?php foreach ($buscarSelectTipoAlojamiento as $k) : ?>
                  <option value="<?= $k->id_tipo_alojamiento; ?>" <?= ($k->id_tipo_alojamiento == $id_tipo_alojamiento_actual) ? 'selected="selected"' : ''; ?>> <?= $k->descripcion_tipo_alojamiento; ?></option>
                <?php endforeach; ?>
              </select>
            </div>
            <div class="form-group">
              <label for="nombreAlojamiento">Designación Comercial:</label>
              <input type="hidden" id="IDAlojamiento" name="IDAlojamiento" value="<?php echo $insertar->id_alojamientos; ?>">
              <input type="text" value="<?php echo $insertar->descripcion_alojamientos; ?>" id="nombreAlojamiento" name="nombreAlojamiento" class="form-control" required>
            </div>
            <div class="form-group">
              <label for="localidadAlojamiento">Localidad</label>
              <input type="hidden" id="localidadIDAlojamiento" name="localidadIDAlojamiento" value="<?php echo $insertar->id_direccion; ?>">
              <?php $nombre_localidad_actual = $insertar->nombre_localidad; ?>
              <select id="localidadAlojamiento" name="localidadAlojamiento" class="form-control custom-select" required>
                <?php foreach ($buscarSelectLocalidad as $k) : ?>
                  <option value="<?php echo $k->id_localidad; ?>" <?= ($k->nombre_localidad == $nombre_localidad_actual) ? 'selected="selected"' : ''; ?>> <?php echo $k->nombre_localidad; ?></option>
                <?php endforeach; ?>
              </select>
            </div>
            <div class="form-group">
              <label for="razonsocialAlojamiento">Razón Social:</label>
              <input type="hidden" id="IDRazonSocialAlojamiento" name="IDRazonSocialAlojamiento" value="<?php echo $insertar->id_razon_social; ?>">
              <input type="text" value="<?php echo $insertar->descripcion_razon_social; ?>" id="razonsocialAlojamiento" name="razonsocialAlojamiento" class="form-control"></input>
            </div>

            <div class="form-group">
              <label for="estrellaAlojamiento">Estrella:</label>
              <input type="hidden" id="" name="" value="<?php echo $insertar->id_alojamientos; ?>">
              <input type="text" value="<?php echo $insertar->estrella_alojamiento; ?>" id="estrellaAlojamiento" name="estrellaAlojamiento" class="form-control"></input>
            </div>

            <div class="form-group">
              <label for="rubroAlojamiento">Rubro</label>
              <input type="hidden" id="" name="" value="<?php echo $insertar->id_alojamientos; ?>">
              <?php $descri_rubro_actual = $insertar->descripcion_rubro; ?>
              <select id="rubroAlojamiento" name="rubroAlojamiento" class="form-control custom-select">
                <?php foreach ($buscarSelectRubro as $k) : ?>
                  <option value="<?= $k->id_rubro_alojamiento; ?>" <?= ($k->descripcion_rubro == $descri_rubro_actual) ? 'selected="selected"' : ''; ?>> <?= $k->descripcion_rubro; ?></option>
                <?php endforeach; ?>
              </select>
            </div>
            <div class="form-group">
              <label for="idoneoAlojamiento">Idóneo - Encargado/a</label>
              <input type="hidden" id="" name="" value="<?php echo $insertar->id_alojamientos; ?>">
              <input type="text" value="<?php echo $insertar->idoneo_alojamiento; ?>" id="idoneoAlojamiento" name="idoneoAlojamiento" class="form-control">
            </div>

            <div class="form-group">
              <label for="cuitAlojamiento">Cuit</label>
              <input type="hidden" id="" name="" value="<?php echo $insertar->id_alojamientos; ?>">
              <input type="text" value="<?php echo $insertar->cuit_alojamiento; ?>" id="cuitAlojamiento" name="cuitAlojamiento" class="form-control">
            </div>

            <div class="form-group">
              <label for="domicilioAlojamiento">Domicilio</label>
              <input type="hidden" id="IDdireccionAlojamiento" name="IDdireccionAlojamiento" value="<?php echo $insertar->id_direccion; ?>">
              <input type="text" value="<?php echo $insertar->calle_direccion; ?>" id="domicilioAlojamiento" name="domicilioAlojamiento" class="form-control">
            </div>

            <div class="form-group">
              <label for="habilitacionAlojamiento">Habilitación Municipal</label>
              <input type="hidden" id="IDhabilitacionAlojamiento" name="IDhabilitacionAlojamiento" value="<?php echo $insertar->id_habi_municipal; ?>">

              <?php $id_habi_municipal_actual = $insertar->id_habi_municipal; ?>
              <select id="habilitacionAlojamiento" name="habilitacionAlojamiento" class="form-control custom-select" required>
                <?php foreach ($buscarSelecthabilitacion as $k) : ?>
                  <option value="<?= $k->id_habi_municipal; ?>" <?= ($k->id_habi_municipal == $id_habi_municipal_actual) ? 'selected="selected"' : ''; ?>> <?= $k->descripcion; ?></option>
                <?php endforeach; ?>
              </select>
            </div>

            <div class="form-group">
              <label for="estadoAlojamiento">Estado</label>
              <input type="hidden" id="IDestadoAlojamiento" name="IDestadoAlojamiento" value="<?php echo $insertar->id_estado; ?>">
              <?php $desc_tipo_estado_actual = $insertar->descripcion_tipo_estado; ?>
              <select id="estadoAlojamiento" name="estadoAlojamiento" class="form-control custom-select" required>
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
              <input type="hidden" id="" name="" value="<?php echo $insertar->id_servicio_alojamiento; ?>">
              <input type="text" value="<?php echo $insertar->cantidad_plazas; ?>" id="cantTotalPlazasAlojamiento" name="cantTotalPlazasAlojamiento" class="form-control">
            </div>

            <div class="form-group">
              <label for="cantTotalAlojamiento">Cantidad total de habitaciones:</label>
              <input type="hidden" id="IDservicios" name="IDservicios" value="<?php echo $insertar->id_servicio_alojamiento; ?>">
              <input type="text" value="<?php echo $insertar->cantidad_total_hab; ?>" id="cantTotalAlojamiento" name="cantTotalAlojamiento" class="form-control">
            </div>

            <div class="form-group">
              <label for="singleAlojamiento">Cantidad de habitaciones Single:</label>
              <input type="hidden" id="" name="" value="<?php echo $insertar->id_servicio_alojamiento; ?>">
              <input type="text" value="<?php echo $insertar->cantidad_hab_single; ?>" id="singleAlojamiento" name="singleAlojamiento" class="form-control"></input>
            </div>

            <div class="form-group">
              <label for="dobleAlojamiento">Cantidad de habitaciones Doble:</label>
              <input type="hidden" id="" name="" value="<?php echo $insertar->id_servicio_alojamiento; ?>">
              <input type="text" value="<?php echo $insertar->cantidad_hab_doble; ?>" id="dobleAlojamiento" name="dobleAlojamiento" class="form-control"></input>
            </div>

            <div class="form-group">
              <label for="tripleAlojamiento">Cantidad de habitaciones Triple:</label>
              <input type="hidden" id="" name="" value="<?php echo $insertar->id_servicio_alojamiento; ?>">
              <input type="text" value="<?php echo $insertar->cantidad_hab_triple; ?>" id="tripleAlojamiento" name="tripleAlojamiento" class="form-control">
            </div>

            <div class="form-group">
              <label for="cuadrupleAlojamiento">Cantidad de habitaciones Cuadruples:</label>
              <input type="hidden" id="" name="" value="<?php echo $insertar->id_servicio_alojamiento; ?>">
              <input type="text" value="<?php echo $insertar->cantidad_hab_cuadruple; ?>" id="cuadrupleAlojamiento" name="cuadrupleAlojamiento" class="form-control">
            </div>

            <div class="form-group">
              <label for="matrimonialAlojamiento">Cantidad de habitaciones Matrimoniales:</label>
              <input type="hidden" id="" name="" value="<?php echo $insertar->id_servicio_alojamiento; ?>">
              <input type="text" value="<?php echo $insertar->cantidad_hab_matrimoniales; ?>" id="matrimonialAlojamiento" name="matrimonialAlojamiento" class="form-control">
            </div>

            <div class="form-group">
              <label for="apartamentoAlojamiento">Apartamento:</label>
              <input type="hidden" id="" name="" value="<?php echo $insertar->id_servicio_alojamiento; ?>">
              <input type="text" value="<?php echo $insertar->apartamento_alojamiento; ?>" id="apartamentoAlojamiento" name="apartamentoAlojamiento" class="form-control">
            </div>

            <div class="form-group">
              <label for="wifiAlojamiento">Wifi:</label>
              <input type="hidden" id="" name="" value="<?php echo $insertar->id_servicio_alojamiento; ?>">
              <input type="text" value="<?php echo $insertar->wifi_alojamiento; ?>" id="wifiAlojamiento" name="wifiAlojamiento" class="form-control">
            </div>

            <div class="form-group">
              <label for="estacionamientoAlojamiento">Estacionamiento:</label>
              <input type="hidden" id="" name="" value="<?php echo $insertar->id_servicio_alojamiento; ?>">
              <input type="text" value="<?php echo $insertar->estacionamiento_alojamiento; ?>" id="estacionamientoAlojamiento" name="estacionamientoAlojamiento" class="form-control">
            </div>
            <div class="form-group">
              <label for="desayunoAlojamiento">Desayuno:</label>
              <input type="hidden" id="" name="" value="<?php echo $insertar->id_servicio_alojamiento; ?>">
              <input type="text" value="<?php echo $insertar->desayuno_alojamiento; ?>" id="desayunoAlojamiento" name="desayunoAlojamiento" class="form-control">
            </div>

            <div class="form-group">
              <label for="piscinaAlojamiento">Piscina:</label>
              <input type="hidden" id="" name="" value="<?php echo $insertar->id_servicio_alojamiento; ?>">
              <input type="text" value="<?php echo $insertar->piscina_alojamiento; ?>" id="piscinaAlojamiento" name="piscinaAlojamiento" class="form-control">
            </div>

            <div class="form-group">
              <label for="otroServicioAlojamiento">Otro Servicio</label>
              <input type="hidden" id="" name="" value="<?php echo $insertar->id_servicio_alojamiento; ?>">
              <input type="text" value="<?php echo $insertar->otros_servicios; ?>" id="otroServicioAlojamiento" name="otroServicioAlojamiento" class="form-control">
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
    <div class="botones-footer-edit card-footer">
      <input name="" id="" class="btn btn-success" type="submit" value="Guardar cambios">
      <a href="index2.php?controlador=Alojamientos&accion=inicio" class="btn btn-primary">Cancelar</a>
    </div>
  </form>


</div>