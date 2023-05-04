<div class="p-5 bg-light">
    <div class="container">
        <h3 class="text-center display-5">BIENVENIDO AL MINISTERIO DE TURISMO</h3>
        <!-- <p class=" lead">Probando la página del administrador</p> -->
        <hr class="my-2">
        <br>

        <div class="row">
            <div class="col-md-6">
                <div class="text-center ">
                    <div class="info-box">
                        <span class="info-box-icon bg-success"><i class="fas fa-bed"></i></span>

                        <div class="info-box-content">
                            <span class="info-box-text">Alojamientos</span>
                            <span>
                                <br>
                            </span>

                            <a href="?controlador=alojamientos&accion=inicio" class="small-box-footer">
                                Más información <i class="fas fa-arrow-circle-right"></i>
                            </a>
                        </div>

                        <!-- /.info-box-content -->
                    </div>
                    <!-- /.info-box -->
                </div>
            </div>
            <!-- /.col -->
            <div class="col-md-6">
                <div class="text-center ">
                    <div class="info-box">
                        <span class="info-box-icon bg-success"><i class="fa-solid fa-utensils"></i></span>

                        <div class="info-box-content">
                            <span class="info-box-text">Gastronomía</span>

                            <span>
                                <br>
                            </span>

                            <a href="?controlador=gastronomia&accion=inicio" class="small-box-footer">
                                Más información <i class="fas fa-arrow-circle-right"></i>
                            </a>
                        </div>
                        <!-- /.info-box-content -->
                    </div>
                    <!-- /.info-box -->
                </div>
            </div>

        </div>
    </div>
</div>
<section class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6">
                <div class="card card-default">
                    <div class="card-header">
                        <h3 class="card-title">
                            <i class="fas fa-exclamation-triangle"></i>
                            Modificaciones
                        </h3>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body">
                        <div class="alert alert-danger alert-dismissible">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            <h5><i class="icon fas fa-ban"></i> Alert!</h5>
                            Danger alert preview. This alert is dismissable. A wonderful serenity has taken possession of my
                            entire
                            soul, like these sweet mornings of spring which I enjoy with my whole heart.
                        </div>
                        <div class="alert alert-info alert-dismissible">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            <h5><i class="icon fas fa-info"></i> Alert!</h5>
                            Info alert preview. This alert is dismissable.
                        </div>
                        <div class="alert alert-warning alert-dismissible">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            <h5><i class="icon fas fa-exclamation-triangle"></i> Alert!</h5>
                            Warning alert preview. This alert is dismissable.
                        </div>
                        <div class="alert alert-success alert-dismissible">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            <h5><i class="icon fas fa-check"></i> Alert!</h5>
                            Success alert preview. This alert is dismissable.
                        </div>
                    </div>
                    <!-- /.card-body -->
                </div>
                <!-- /.card -->
            </div>
            <!-- /.col -->
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">
                            <i class="fas fa-exclamation-triangle"></i>
                            Tareas
                        </h3>
                    </div>
                    <form action="?controlador=paginas&accion=inicio" method="post" name="formTarea">
                        <div class="card-body">
                            <?php foreach ($tabla as $tablas) { ?>
                                <ul class="todo-list" data-widget="todo-list">
                                    <li>
                                        <div class="icheck-primary d-inline ml-2">
                                            <input type="checkbox" value="" name="todo1" id="todoCheck1" data-task-id="<?= $lastInsertIDdireccion ?>">
                                            <label for="todoCheck1"></label>
                                        </div>
                                        <span class="text">Design a nice theme</span>
                                        <small class="badge badge-danger"><i class="far fa-clock"></i> 2 mins</small>
                                        <div class="tools">
                                            <i class="fas fa-edit"></i>
                                            <i class="fas fa-trash-o"></i>
                                        </div>

                                    </li>
                                </ul>
                            <?php } ?>
                        </div>
                        <div class="card-footer clearfix">
                            <button type="button" class="btn btn-primary float-right" id="addButton"><i class="fas fa-plus"></i> Add tarea</button>
                        </div>
                    </form>
                </div>
            </div>
            <!-- /.col -->
        </div>

    </div>
    <!-- /.timeline -->

</section>