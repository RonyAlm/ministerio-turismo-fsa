<?php

if (!isset($_SESSION['id'])) {
    header("Location: index.php");
}

$usuario = $_SESSION['usuarios'];
$rol_id = $_SESSION['rol_id'];
// $acceso = $_SESSION['tablas_acceso'];
?>
<section class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-8 offset-md-2">
                <form action="simple-results.html">
                    <div class="input-group input-group-lg">
                        <input type="search" class="form-control form-control-lg" placeholder="Type your keywords here" value="Lorem ipsum">
                        <div class="input-group-append">
                            <button type="submit" class="btn btn-lg btn-default">
                                <i class="fa fa-search"></i>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <?php if (empty($resultados)) : ?>
            <p>No se encontraron resultados.</p>
        <?php else : ?>
            <?php if (!empty($resultados['agencias'])) : ?>
                <h2>Agencias</h2>
                <ul>
                    <li><?php echo $resultados->id_agencias; ?></li>
                    <div class="row mt-3">
                        <div class="col-md-10 offset-md-1">
                            <div class="list-group">
                                <div class="list-group-item">
                                    <div class="row">
                                        <div class="col px-4">
                                            <div>
                                                <h3><?php echo $resultados->descripcion_agencias ?></h3>
                                                <p class="mb-0">consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
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
</section>