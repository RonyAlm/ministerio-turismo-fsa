<section class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1>Imprimir Asistencias</h1>
            </div>
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a class="text-success" href="index2.php?controlador=asistencias&accion=inicio">Agencias</a></li>
                    <li class="breadcrumb-item active">Imprimir</li>
                </ol>
            </div>
        </div>
    </div>
</section>

<div class="card card-success card-outline">
    <div class="card-header">

    </div>

    <div class="card-body">
        <div class="row">
            <div class="col-lg-12">
                <table id="example1" class="table table-bordered table-striped" cellspacing="0" width="100%">
                    <thead>
                        <tr style="background: linear-gradient(to right, #61ba6d, #83c331)">


                            <th>Nombre y Apellido</th>
                            <th>Fecha</th>
                            <th>Hora</th>

                        </tr>
                    </thead>
                    <tbody>

                        <?php foreach ($tabla as $asistencias) { ?>

                            <tr>

                                <td><?php echo $asistencias["nombre_personal"]; ?></td>
                                <td><?php echo $asistencias["fecha_asistencia"]; ?></td>
                                <td><?php echo $asistencias["hora_asistencia"]; ?></td>



                            </tr>

                        <?php } ?>

                    </tbody>

                </table>
            </div>
        </div>
    </div>

    <div class="card-footer">

    </div>
</div>