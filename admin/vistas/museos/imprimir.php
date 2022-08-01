<section class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1>Imprimir Museo</h1>
            </div>
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a class="text-success" href="index2.php?controlador=museos&accion=inicio">Museos</a></li>
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
                <table id="example1" class="table table-bordered table-striped">
                    <thead>
                        <tr style="background: linear-gradient(to right, #61ba6d, #83c331)">

                            <th>Localidad</th>
                            <th>Nombre del Museo</th>
                            <th>Contacto</th>
                            <th>Dirección</th>

                        </tr>
                    </thead>
                    <tbody>

                        <?php foreach ($tablaMuseo as $museos) { ?>

                            <tr>
                                <td><?php echo $museos["nombre_localidad"]; ?></td>
                                <td><?php echo $museos["nombre_museo"]; ?></td>
                                <td><?php echo $museos["descripcion_contacto"]; ?></td>
                                <td><?php echo $museos["calle_direccion"]; ?></td>
                            </tr>


                        <?php } ?>
                        
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="card-footer"></div>

</div>