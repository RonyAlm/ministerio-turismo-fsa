<div class="card card-success">

    <div class="card-header">
        Editar Servicio
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
                            <label for="tipoServiGeneral">Tipo</label>
                            <input type="hidden" id="tipoServiGeneralID" name="tipoServiGeneralID" value="<?php echo $editar->id_tipo_lugar; ?>">
                            <select id="tipoServiGeneral" name="tipoServiGeneral" class="form-control custom-select" required>
                                <?php $id_tipo_lugar_actual = $editar->id_tipo_lugar; ?>
                                <?php foreach ($buscarSelectLugar as $k) : ?>
                                    <option value="<?= $k->id_tipo_lugar; ?>" <?= ($k->id_tipo_lugar == $id_tipo_lugar_actual) ? 'selected="selected"' : ''; ?>> <?= $k->descripcion_lugar; ?></option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="estacion">Estación</label>
                            <input type="hidden" id="estacionID" name="estacionID" value="<?php echo $editar->id_tipo_estacion; ?>">
                            <select id="estacion" name="estacion" class="form-control custom-select" required>
                                <?php $id_tipo_estacion_actual = $editar->id_tipo_estacion; ?>
                                <?php foreach ($buscarSelectEstacion as $k) : ?>
                                    <option value="<?= $k->id_tipo_estacion; ?>" <?= ($k->id_tipo_estacion == $id_tipo_estacion_actual) ? 'selected="selected"' : ''; ?>> <?= $k->descripcion_estacion; ?></option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="nombre">Nombre:</label>
                            <input type="hidden" id="nombreID" name="nombreID" value="<?php echo $editar->id_servicios_generales; ?>">
                            <input type="text" id="nombre" name="nombre" class="form-control" value="<?php echo $editar->nombre_servicio_general; ?>" required>
                        </div>

                        <div class="form-group">
                            <label for="localidad">Localidad</label>
                            <input type="hidden" id="localidadID" name="localidadID" value="<?php echo $editar->id_direccion; ?>">
                            <select id="localidad" name="localidad" class="form-control custom-select" required>
                                <?php $id_localidad_actual = $editar->id_localidad; ?>
                                <?php foreach ($buscarSelectLocalidad as $k) : ?>
                                    <option value="<?= $k->id_localidad; ?>" <?= ($k->id_localidad == $id_localidad_actual) ? 'selected="selected"' : ''; ?>> <?= $k->nombre_localidad; ?></option>
                                <?php endforeach; ?>
                            </select>
                        </div>


                        <div class="form-group">
                            <label for="idoneo">Idóneo:</label>
                            <input type="hidden" id="idoneoID" name="idoneoID" value="<?php echo $editar->id_servicios_generales; ?>">
                            <input type="text" id="idoneo" name="idoneo" class="form-control" value="<?php echo $editar->idoneo_servicio_general; ?>"></input>
                        </div>


                        <div class="form-group">
                            <label for="domicilio">Domicilio</label>
                            <input type="hidden" id="domicilioID" name="domicilioID" value="<?php echo $editar->id_direccion; ?>">
                            <input type="text" id="domicilio" value="<?php echo $editar->calle_direccion; ?>" name="domicilio" class="form-control" required>
                        </div>

                        <div class="form-group">
                            <label for="tipoServicio">Tipo servicio</label>
                            <input type="hidden" id="tipoServicioID" name="tipoServicioID" value="<?php echo $editar->id_tipo_servicio; ?>">
                            <select id="tipoServicio" name="tipoServicio" class="form-control custom-select" required>
                                <?php $id_tipo_servicio_actual = $editar->id_tipo_servicio; ?>
                                <?php foreach ($buscarSelectTipoServicio as $k) : ?>
                                    <option value="<?= $k->id_tipo_servicio; ?>" <?= ($k->id_tipo_servicio == $id_tipo_servicio_actual) ? 'selected="selected"' : ''; ?>> <?= $k->descripcion_servicio; ?></option>
                                <?php endforeach; ?>
                            </select>
                        </div>

                        <div class="form-group fg-description">
                            <label for="descripcion">Descripcion</label>
                            <input type="hidden" id="descripcionID" name="descripcionID" value="<?php echo $editar->id_servicios_generales; ?>">
                            <textarea name="descripcion" id="descripcion" ><?php echo $editar->descripcion_servicio_general; ?></textarea>
                            <!-- <input type="text" id="descripcion" name="descripcion" class="form-control"> -->
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

                        <?php foreach ($agenciaTelefono as $telefonos) { ?>
                            <div class="form-group">
                                <label for="telefonoAgencia">Teléfono Celular</label>
                                <input type="hidden" id="agenciatelefonoID" name="agenciatelefonoID[]" value="<?php echo $telefonos['id_contacto']; ?>">
                                <input type="number" id="telefonoAgencia" value="<?php echo $telefonos['descripcion_contacto']; ?>" name="telefonoAgencia[]" class="form-control">
                            </div>
                        <?php  } ?>

                        <div class="form-group">
                            <label for="telefonoFijoAgencia">Teléfono Fijo</label>
                            <input type="hidden" id="telFijoID" name="telFijoID" value="<?php echo $agenciaTelefonoFijo->id_contacto; ?>">
                            <input type="number" id="telefonoFijoAgencia" value="<?php echo $agenciaTelefonoFijo->descripcion_contacto; ?>" name="telefonoFijoAgencia" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="correoAgencia">Correo</label>
                            <input type="hidden" id="agenciaCorreoID" name="agenciaCorreoID" value="<?php echo $agenciaCorreo->id_contacto; ?>">
                            <input type="email" id="correoAgencia" value="<?php echo $agenciaCorreo->descripcion_contacto; ?>" name="correoAgencia" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="facebookAgencia">Facebook</label>
                            <input type="hidden" id="agenciaFacebookID" name="agenciaFacebookID" value="<?php echo $agenciaFacebook->id_contacto; ?>">
                            <input type="text" id="facebookAgencia" value="<?php echo $agenciaFacebook->descripcion_contacto; ?>" name="facebookAgencia" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="instagramAgencia">Instagram</label>
                            <input type="hidden" id="agenciaInstagramID" name="agenciaInstagramID" value="<?php echo $agenciaInstagram->id_contacto; ?>">
                            <input type="text" id="instagramAgencia" value="<?php echo $agenciaInstagram->descripcion_contacto; ?>" name="instagramAgencia" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="twitterAgencia">Twitter</label>
                            <input type="hidden" id="agenciaTwitterID" name="agenciaTwitterID" value="<?php echo $agenciaTwitter->id_contacto; ?>">
                            <input type="text" id="twitterAgencia" value="<?php echo $agenciaTwitter->descripcion_contacto; ?>" name="twitterAgencia" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="webAgencia">Sitio Web</label>
                            <input type="hidden" id="agenciaWebID" name="agenciaWebID" value="<?php echo $agenciaWeb->id_contacto; ?>">
                            <input type="text" id="webAgencia" value="<?php echo $agenciaWeb->descripcion_contacto; ?>" name="webAgencia" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="otroAgencia">Otro</label>
                            <input type="hidden" id="agenciaOtroID" name="agenciaOtroID" value="<?php echo $agenciaOtro->id_contacto; ?>">
                            <input type="text" id="otroAgencia" value="<?php echo $agenciaOtro->descripcion_contacto; ?>" name="otroAgencia" class="form-control">
                        </div>
                    </div>
                    <!-- /.card-body -->
                </div>
                <!-- /.card -->
            </div>
        </div>

        <div class="botones-footer-edit card-footer">
            <input name="" id="" class="btn btn-success" type="submit" value="Editar Servicio">
            <a href="?controlador=servigenerales&accion=inicio" class="btn btn-primary">Cancelar</a>
        </div>

    </form>


</div>