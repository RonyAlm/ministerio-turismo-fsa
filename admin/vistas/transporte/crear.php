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
                <div class="col-md-12 text-center">
                    <button class="btn btn-warning" id="agregar">+ Agregar campos</button>

                </div>
            </div>
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
                                            <label>Empresa:</label>
                                            <select class="form-control">
                                                <option>El Pulqui</option>
                                                <option>Godoy</option>
                                                <option>Flecha BUS</option>

                                            </select>
                                        </div>
                                        <div class="col-4">
                                            <label>N° de Teléfono:</label>
                                            <input type="text" class="form-control">

                                        </div>
                                        <div class="col-4">
                                            <label>Correo:</label>
                                            <input type="text" class="form-control">

                                        </div>
                                    </div>
                                    <br>
                                    <!-- Origen- Destino- Horarios -->
                                    <div class="row">
                                        <div class="col-4">
                                            <div class="form-group">
                                                <label for="provincia">Destino:</label>
                                                <select id="provincia" name="provincia" class="form-control custom-select" required>
                                                    <option value=""></option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-4">
                                            <div class="form-group">
                                                <label for="localidad">Localidad:</label>
                                                <select id="localidad" name="localidad" class="form-control custom-select" required>

                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-4">
                                            <label>Horarios</label>
                                            <input type="text" class="form-control">
                                        </div>
                                    </div>
                                    <br>
                                    <!-- Camas -->
                                    <div class="row">
                                        <div class="col-4">
                                            <label>$ Cama</label>
                                            <input type="text" class="form-control">
                                        </div>
                                        <div class="col-4">
                                            <label>$ Semi-Cama</label>
                                            <input type="text" class="form-control">
                                        </div>
                                        <div class="col-4">
                                            <label>$ Ejecutivo</label>
                                            <input type="text" class="form-control">
                                        </div>
                                    </div>
                                    <br>
                                    <!-- observacion -->
                                    <div class="row">
                                        <div class="col-sm-12">

                                            <div class="form-group">
                                                <label>Observación</label>
                                                <textarea class="form-control" rows="2" placeholder=""></textarea>
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
        <input name="" id="" class="btn btn-success" type="submit" value="AgregarTransportes">

        <a href="?controlador=transporte&accion=inicio" class="btn btn-primary">Cancelar</a>
    </form>
</div>