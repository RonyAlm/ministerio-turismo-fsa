<section class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1>Faltas</h1>
            </div>
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a class="text-success" href="index2.php?controlador=asistencias&accion=inicio">Asistencias</a></li>
                    <li class="breadcrumb-item active">Imprimir</li>
                </ol>
            </div>
        </div>
    </div>
</section>

<div class="card card-success card-outline">
    <div class="card-header">
        <!-- Aquí puedes agregar cualquier encabezado adicional si lo necesitas -->
    </div>
    <div class="card-body">
        <div class="row">
            <div class="col-lg-12">
                <table id="example1" class="table table-bordered table-striped" cellspacing="0" width="100%">
                    <thead>
                        <tr style="background: linear-gradient(to right, #61ba6d, #83c331)">
                            <th>Nombre y Apellido</th>
                            <th>FECHA QUE FALTO</th>
                            <th>Día de la semana</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        foreach ($faltas['faltas'] as $nombre => $faltas_empleado) { ?>
                            <?php foreach ($faltas_empleado as $falta) { ?>
                                <tr>
                                    <td><?php echo $nombre; ?></td>
                                    <td><?php echo $falta['fecha']; ?></td>
                                    <td>
                                        <?php
                                        $dia_semana = date('l', strtotime($falta['fecha']));
                                        if ($dia_semana == 'Monday') {
                                            echo 'Lunes';
                                        } elseif ($dia_semana == 'Tuesday') {
                                            echo 'Martes';
                                        } elseif ($dia_semana == 'Wednesday') {
                                            echo 'Miércoles';
                                        } elseif ($dia_semana == 'Thursday') {
                                            echo 'Jueves';
                                        } elseif ($dia_semana == 'Friday') {
                                            echo 'Viernes';
                                        } elseif ($dia_semana == 'Saturday') {
                                            echo 'Sábado';
                                        } elseif ($dia_semana == 'Sunday') {
                                            echo 'Domingo';
                                        } else {
                                            echo $dia_semana; // Si no es un día de la semana conocido, mostrar el valor en inglés
                                        }
                                        ?>
                                    </td>
                                </tr>
                            <?php } ?>
                        <?php } ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>


    <div class="card-footer">
        <!-- Aquí puedes agregar cualquier pie de página adicional si lo necesitas -->
    </div>
</div>