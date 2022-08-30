<style>
    .puntero {
        cursor: pointer;
    }

    .ocultar {
        display: none;
    }
</style>
<div class="card card-success">



    <div class="mb-1">

    </div>

    <form action="" method="post">

        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="card card-success">
                        <div class="card-header">
                            <h3 class="card-title">Agregar Transportes</h3>
                        </div>
                        <div class="form-row clonar">
                            <div class="form-group col-md-12">
                                <div class="card-body">
                                    <!-- Empresa- Telefono- Correo -->
                                    <div class="row">
                                        <div class="col-4">
                                            <div class="form-group">
                                                <label for="empresas">Empresas</label>
                                                <select name="empresas" class="form-control select2" style="width: 100%;" id="empresas">
                                                    <option value="0" selected disabled>Seleccionar la Empresa</option>
                                                    <?php foreach ($buscarSelectEmpresa as $k) : ?>
                                                        <option value="<?php echo $k->id_empresa_colectivo; ?>"> <?php echo $k->nombre_empresa; ?></option>
                                                    <?php endforeach; ?>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-4">
                                            <div class="form-group">
                                                <label for="provincias">Provincia</label>
                                                <select name="provincias" class="form-control select2" style="width: 100%;" id="provincias">
                                                    <option value="0" selected disabled>Seleccionar la Provincia</option>
                                                    <?php foreach ($buscarSelectProvincia as $k) : ?>
                                                        <option value="<?php echo $k->id_provincia; ?>"> <?php echo $k->nombre_provincia; ?></option>
                                                    <?php endforeach; ?>
                                                </select>
                                            </div>

                                        </div>
                                        <div class="col-4">
                                            <div class="form-group">
                                                <label for="localidad">Localidad</label>
                                                <select name="localidad" class="form-control select2" style="width: 100%;" id="localidad">
                                                    <option value="0" selected disabled>Seleccionar la Localidad</option>
                                                    <?php foreach ($buscarSelectLocalidad as $k) : ?>
                                                        <option value="<?php echo $k->id_localidad; ?>"> <?php echo $k->nombre_localidad; ?></option>
                                                    <?php endforeach; ?>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <br>
                                    <!-- Origen- Destino- Horarios -->
                                    <div class="row" id="hora">
                                        <div class="col-4">
                                            <label for="horarioSalida">Horario de Salida</label>
                                            <input type="text" id="horarioSalida" name="horarioSalida[]" class="form-control">
                                        </div>
                                        <div class="col-4">
                                            <div class="form-group">
                                                <label for="horarioLlegada">Horario de llegada</label>
                                                <input type="text" id="horarioLlegada" name="horarioLlegada[]" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                    <span id="adicional1" name="adicional1" class="btn btn-success col fileinput-button dz-clickable">
                                        <i class="fas fa-plus"></i>
                                        <span>Añadir más Horarios</span>
                                    </span>
                                    <div class="horarios">

                                    </div>
                                    <br>
                                    <!-- Camas -->
                                    <div class="row">
                                        <div class="col-4">
                                            <input type="hidden" name="IDcama" value="1" id="IDcama">
                                            <label for="cama">$ Cama</label>
                                            <input type="text" name="cama" class="form-control">
                                        </div>
                                        <div class="col-4">
                                            <input type="hidden" name="IDsemicama" value="2" id="IDsemicama">
                                            <label for="semicama">$ Semi-Cama</label>
                                            <input type="text" name="semicama" class="form-control">
                                        </div>
                                        <div class="col-4">
                                            <input type="hidden" name="IDejecutivo" value="3" id="IDejecutivo">
                                            <label for="ejecutivo">$ Ejecutivo</label>
                                            <input type="text" name="ejecutivo" class="form-control">
                                        </div>
                                    </div>
                                    <br>
                                    <!-- observacion -->
                                    <div class="row">
                                        <div class="col-sm-12">

                                            <div class="form-group">
                                                <label for="observacionTransporte">Observación</label>
                                                <textarea name="observacionTransporte" class="form-control" rows="2" placeholder=""></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <span class="badge badge-pill badge-danger puntero ocultar">Eliminar</span>
                                </div>
                            </div>
                        </div>
                        <div id="contenedor"></div>
                    </div>
                </div>
            </div>
        </div>
        <input name="" id="" class="btn btn-success" type="submit" value="Agregar Transportes">

        <a href="?controlador=transporte&accion=inicio" class="btn btn-primary">Cancelar</a>
    </form>
</div>