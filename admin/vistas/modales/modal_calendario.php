<div class="modal fade" id="myModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-success">
                <h4 class="modal-title" id="titulo"></h4>
                <button type="button" class="btn btn-close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form id="formularioModal">
                <div class="modal-body">
                    <div class="form-floating mb-3">
                        <input type="hidden" id="id" name="id">
                        <label for="title" class="form-label">Evento</label>
                        <input type="text" class="form-control" name="title" id="title">
                    </div>

                    <div class="form-floating mb-3">
                        <label for="start" class="form-label">Fecha Inicio</label>
                        <input type="date" class="form-control" name="start" id="start">
                    </div>

                    <div class="form-floating mb-3">
                        <label for="fecha_fin" class="form-label">Fecha fin</label>
                        <input type="date" class="form-control" name="fecha_fin" id="fecha_fin">
                    </div>

                    <div class="form-floating mb-3">
                        <label for="descripcion" class="form-label">Descripción</label>
                        <!-- <textarea name="descripcion" id="descripcion" cols="62" rows="5"></textarea> -->
                        <input type="text" class="form-control" name="descripcion" id="descripcion">
                    </div>

                    <div class="form-floating mb-3">
                        <label for="color" class="form-label">Color</label>
                        <input type="color" class="form-control" name="color" id="color">
                    </div>

                </div>

                <div class="modal-footer">

                    <button type="submit" class="btn btn-success" id="btnAccion">Agregar</button>

                    <button type="button" id="btnEliminar" class="btn btn-danger">Borrar</button>

                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>

                </div>
            </form>

        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>