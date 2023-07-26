<section class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1>Imprimir cursos</h1>
            </div>
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a class="text-success" href="index2.php?controlador=cursos_capacitaciones&accion=inicio">Cursos</a></li>
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
                            <th>Dni</th>
                            <th>Celular</th>
                            <th>Ocupacion</th>
                            <th>Asistencia</th>

                        </tr>
                    </thead>
                    <tbody>

                        <?php foreach ($tablaAgencia as $agencia) { ?>

                            <tr>

                                <td><?php echo $agencia["nombreapellido"]; ?></td>
                                <td><?php echo $agencia["dni_cursos"]; ?></td>
                                <td><?php echo $agencia["descri_contacto_cursos"]; ?></td>
                                <td><?php echo $agencia["ocupacion_cursos"]; ?></td>
                                <td>
                                    <input type="checkbox" name="asistencia[]" id="<?php echo $agencia['id_cursos']; ?>" value="<?php echo $agencia['id_cursos']; ?>">
                                    <?php echo $agencia["presente_cursos"]; ?>
                                </td>

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