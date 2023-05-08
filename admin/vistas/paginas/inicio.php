<?php

if (!isset($_SESSION['id'])) {
    header("Location: index.php");
}

$usuario = $_SESSION['usuarios'];
$rol_id = $_SESSION['rol_id'];

?>
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
<?php if ($rol_id == 1 and $usuario == "admin") : ?>
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-6">
                    <div class="card direct-chat direct-chat-primary">
                        <div class="card-header">
                            <h3 class="card-title">
                                <i class="fas fa-exclamation-triangle"></i>
                                Modificaciones
                            </h3>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <!-- Conversations are loaded here -->
                            <div class="direct-chat-messages">
                                <!-- Message. Default to the left -->
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <!-- The time line -->
                                            <div class="timeline">
                                                <?php foreach ($tablaTimeLine as $tablas) { ?>

                                                    <div class="time-label">
                                                        <span class="bg-red"><?php echo $tablas["fechas"]; ?></span>
                                                    </div>

                                                    <div>
                                                        <i class="fas fa-envelope bg-blue"></i>
                                                        <div class="timeline-item">
                                                            <span class="time"><i class="fas fa-clock"></i> <?php echo $tablas["hora"]; ?></span>
                                                            <h3 class="timeline-header"><a href="#"><?php echo $tablas["usuario"]; ?> </a> <?php echo $tablas["accion"]; ?> a la tabla: <?php echo $tablas["tabla"]; ?>
                                                            </h3>

                                                            <div class="timeline-body">
                                                                <?php echo $tablas["old_value"]; ?>
                                                            </div>

                                                        </div>
                                                    </div>
                                                <?php } ?>

                                                <div>
                                                    <i class="fas fa-clock bg-gray"></i>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /.col -->
                                    </div>
                                </div>
                                <!-- /.direct-chat-msg -->

                            </div>
                            <!--/.direct-chat-messages-->


                            <!-- /.direct-chat-pane -->
                        </div>
                        <!-- /.card-body -->

                        <!-- /.card-footer-->
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
                                <?php foreach ($tablaTarea as $tablas) { ?>
                                    <ul class="todo-list" data-widget="todo-list">
                                        <li>
                                            <div class="icheck-primary d-inline ml-2">
                                                <input type="checkbox" value="" name="checkbox_id_<?php echo $tablas['id_tareas']; ?>" id="<?php echo $tablas["id_tareas"]; ?>">
                                                <label for="<?php echo $tablas["id_tareas"]; ?>"></label>
                                            </div>
                                            <span class="text"><?php echo $tablas["descripcion_tareas"]; ?></span>
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
<?php endif; ?>