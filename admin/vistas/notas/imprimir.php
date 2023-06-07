<section class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1>Imprimir Notas</h1>
            </div>
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a class="text-success" href="index2.php?controlador=notas&accion=inicio">Notas</a></li>
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
                <table id="example123" class="table table-bordered table-striped" cellspacing="0" width="100%">
                    <thead>
                        <tr style="background: linear-gradient(to right, #61ba6d, #83c331)">
                            <?php
                            // Obtener los nombres de las columnas de tu consulta
                            $columnas = array_keys($tablaAgencia[0]);

                            // Iterar sobre los nombres de las columnas y generar los elementos th
                            foreach ($columnas as $columna) {
                                echo "<th>$columna</th>";
                            }
                            ?>
                        </tr>
                    </thead>
                    <tbody>

                        <?php foreach ($tablaAgencia as $agencia) { ?>
                            <tr>
                                <?php
                                // Iterar sobre los valores de cada fila y generar los elementos td
                                foreach ($agencia as $valor) {
                                    echo "<td>$valor</td>";
                                }
                                ?>
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