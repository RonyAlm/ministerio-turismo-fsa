<div class="card card-success">

    <div class="card-header">
        Agregar Servicio
    </div>

    <div class="mb-1">

    </div>


    <!-- Main content -->

    <form action="" id="agregarAlojamiento" method="post">

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
                            <select id="tipoServiGeneral" name="tipoServiGeneral" class="form-control custom-select" required>
                                <option value="0" selected disabled>Seleccionar el tipo</option>
                                <?php foreach ($buscarSelectLugar as $k) : ?>
                                    <option value="<?php echo $k->id_tipo_lugar; ?>"> <?php echo $k->descripcion_lugar; ?></option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="estacion">Estación</label>
                            <select id="estacion" name="estacion" class="form-control custom-select" required>
                                <option value="0" selected disabled>Seleccionar el tipo</option>
                                <?php foreach ($buscarSelectEstacion as $k) : ?>
                                    <option value="<?php echo $k->id_tipo_estacion; ?>"> <?php echo $k->descripcion_estacion; ?></option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="nombre">Nombre:</label>
                            <input type="text" id="nombre" name="nombre" class="form-control" required>
                        </div>

                        <div class="form-group">
                            <label for="localidad">Localidad</label>
                            <select id="localidad" name="localidad" class="form-control custom-select" required>
                                <option value="0" selected disabled>Seleccionar la localidad</option>
                                <?php foreach ($buscarSelectLocalidad as $k) : ?>
                                    <option value="<?php echo $k->id_localidad; ?>"> <?php echo $k->nombre_localidad; ?></option>
                                <?php endforeach; ?>
                            </select>
                        </div>


                        <div class="form-group">
                            <label for="idoneo">Idóneo:</label>
                            <input type="text" id="idoneo" name="idoneo" class="form-control"></input>
                        </div>


                        <div class="form-group">
                            <label for="domicilio">Domicilio</label>
                            <input type="text" id="domicilio" name="domicilio" class="form-control">
                        </div>

                        <div class="form-group">
                            <label for="tipoServicio">Tipo servicio</label>
                            <select id="tipoServicio" name="tipoServicio" class="form-control custom-select" required>
                                <option value="0" selected disabled>Seleccionar el el tipo de servicio</option>
                                <?php foreach ($buscarSelectTipoServicio as $k) : ?>
                                    <option value="<?php echo $k->id_tipo_servicio; ?>"> <?php echo $k->descripcion_servicio; ?></option>
                                <?php endforeach; ?>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="descripcion">Descripcion</label>
                            <textarea name="descripcion" id="descripcion" cols="65" rows="10"></textarea>
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
                        <div class="form-group" id="celu">
                            <label for="telefonoAgencia">Teléfono Celular</label>
                            <input type="number" id="telefonoAgencia" name="telefonoAgencia[]" class="form-control">
                            <div class="btn-der">
                                <button id="adicional" name="adicional" type="button" class="btn btn-warning"> Más + </button>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="telefonoFijoAgencia">Teléfono Fijo</label>
                            <input type="number" id="telefonoFijoAgencia" name="telefonoFijoAgencia" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="correoAgencia">Correo</label>
                            <input type="email" id="correoAgencia" name="correoAgencia" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="facebookAgencia">Facebook</label>
                            <input type="text" id="facebookAgencia" name="facebookAgencia" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="instagramAgencia">Instagram</label>
                            <input type="text" id="instagramAgencia" name="instagramAgencia" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="twitterAgencia">Twitter</label>
                            <input type="text" id="twitterAgencia" name="twitterAgencia" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="webAgencia">Sitio Web</label>
                            <input type="text" id="webAgencia" name="webAgencia" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="otroAgencia">Otro</label>
                            <input type="text" id="otroAgencia" name="otroAgencia" class="form-control">
                        </div>
                    </div>
                    <!-- /.card-body -->
                </div>
                <!-- /.card -->
            </div>
        </div>
        <input name="" id="" class="btn btn-success" type="submit" value="Agregar Servicio">

        <a href="?controlador=servigenerales&accion=inicio" class="btn btn-primary">Cancelar</a>
    </form>


</div>