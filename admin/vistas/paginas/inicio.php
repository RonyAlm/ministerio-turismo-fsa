<?php

if (!isset($_SESSION['id'])) {
    header("Location: index.php");
}

$usuario = $_SESSION['usuarios'];
$rol_id = $_SESSION['rol_id'];
// $acceso = $_SESSION['tablas_acceso'];

?>
<div class="p-5 bg-light">

    <div class="container">
        <h3 class="text-center display-5">BIENVENIDO AL MINISTERIO DE TURISMO</h3>
        <!-- <p class=" lead">Probando la página del administrador</p> -->
        <hr class="my-2">
        <br>

        <section class="content">
            <div class="container-fluid">
                <h2 class="text-center display-4">Busqueda</h2>
                <div class="row">
                    <div class="col-md-8 offset-md-2">
                        <form action="?controlador=paginas&accion=buscar" method="post">
                            <div class="input-group">
                                <!-- Agrega el atributo 'name' al campo de búsqueda -->
                                <input type="search" class="form-control form-control-lg" name="busquedaGeneral" placeholder="Por favor Ingrese la localidad">
                                <div class="input-group-append">
                                    <button type="submit" class="btn btn-lg btn-default" id="busquedaGeneral">
                                        <i class="fa fa-search"></i>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>


        <?php if (empty($resultados)) : ?>
            <p>No se encontraron resultados.</p>
        <?php else : ?>
            <?php if (!empty($resultados['agencias'])) : ?>
                <h2>Agencias</h2>
                <ul>
                    <?php foreach ($resultados['agencias'] as $agencia) : ?>
                        <li><?php echo $agencia['descripcion_agencias']; ?></li>
                    <?php endforeach; ?>
                </ul>
            <?php endif; ?>

            <?php if (!empty($resultados['alojamientos'])) : ?>
                <h2>Alojamientos</h2>
                <ul>
                    <?php foreach ($resultados['alojamientos'] as $alojamiento) : ?>
                        <li><?php echo $alojamiento['nombre']; ?></li>
                    <?php endforeach; ?>
                </ul>
            <?php endif; ?>

            <!-- Agregar más secciones para otros módulos aquí... -->
        <?php endif; ?>
    </div>
</div>
<?php if ($rol_id == 1 and $usuario == "admin") : ?>
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <!-- COMIENZA MODIFICACIONES -->
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
                                                            <h3 class="timeline-header"><a href="#"><?php echo $tablas["usuario"]; ?> </a> <?php echo $tablas["accion"]; ?> a la tablas: <?php echo $tablas["tabla"]; ?>
                                                            </h3>

                                                            <div class="timeline-body">
                                                                <?php echo "Fila vieja: " . $tablas["old_value"]; ?>
                                                                <?php echo '</br>' ?>
                                                                <?php echo "Fila nueva: " . $tablas["new_value"]; ?>
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

                        <div class="card-footer"> </div>
                        <!-- /.card-footer-->
                    </div>
                    <!-- /.card -->
                </div>
                <!-- /.col -->

                <!-- COMIENZA TAREAS -->
                <?php if ($rol_id == 1 and $usuario == "admin") : ?>
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">
                                    <i class="fas fa-exclamation-triangle"></i>
                                    Tareas
                                </h3>
                            </div>
                            <?php if (empty($tablaTarea)) { ?>
                                <p class="animated-text">No hay tareas disponibles.</p>

                                <style>
                                    .animated-text {
                                        position: relative;
                                        /* Establece la posición relativa */
                                    }

                                    .animated-text:hover:after {
                                        content: "No se encontraron tareas en la lista wey";
                                        /* Agrega el texto emergente */
                                        position: absolute;
                                        /* Establece la posición absoluta */
                                        top: 20px;
                                        /* Alinea el cuadro emergente con el párrafo */
                                        left: 0;
                                        /* Alinea el cuadro emergente con el párrafo */
                                        padding: 10px;
                                        /* Establece el espaciado interno */
                                        background-color: #FF69B4;
                                        /* Establece el color de fondo */
                                        color: white;
                                        /* Establece el color del texto */
                                        font-size: 12px;
                                        /* Establece el tamaño de fuente */
                                        border-radius: 5px;
                                        /* Agrega esquinas redondeadas */
                                        z-index: 1;
                                        /* Establece el orden de apilamiento */
                                        width: 150px;
                                        /* Establece el ancho del cuadro */
                                    }
                                </style>

                            <?php } else { ?>
                                <!-- Aquí va el código del formulario con el ciclo foreach -->
                                <form action="?controlador=paginas&accion=inicio" method="post" name="formTarea">
                                    <div class="card-body">
                                        <?php foreach ($tablaTarea as $tablas) { ?>
                                            <ul class="todo-list" data-widget="todo-list">
                                                <li tabindex="0" onkeydown="return (event.keyCode != 13);">
                                                    <!-- el evento onkeydown lo que hace es que no deja presionar el ENTER por que si se presiona el enter me genera un error-->
                                                    <div class="icheck-primary d-inline ml-2">
                                                        <input type="checkbox" name="checkbox_id_<?= $tablas['id_tareas']; ?>" id="<?= $tablas["id_tareas"]; ?>" <?= ($tablas['checkbox_tareas'] == '1') ? 'checked' : '' ?>>
                                                        <label for=""></label>
                                                    </div>
                                                    <span class="text"><?php echo $tablas["descripcion_tareas"]; ?></span>
                                                    <!-- <small class="badge badge-danger"><i class="far fa-clock"></i> 2 mins</small> -->
                                                    <div class="tools">
                                                        <i class="fas fa-edit" onclick="editText(event)"></i>
                                                        <i class="fas fa-trash" onclick="deleteText(event)"></i>
                                                    </div>

                                                </li>
                                            </ul>
                                        <?php } ?>
                                    </div>
                                    <div class="card-footer clearfix">
                                        <button type="button" class="btn btn-primary float-right" id="addButton"><i class="fas fa-plus"></i> Add tarea</button>
                                    </div>
                                </form>
                            <?php } ?>

                        </div>
                    </div>
                <?php endif; ?>

                <!-- /.col -->
            </div>

        </div>
        <!-- /.timeline -->

    </section>
<?php endif; ?>