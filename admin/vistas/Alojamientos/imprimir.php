<section class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1>Imprimir Alojamiento</h1>
            </div>
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a class="text-success" href="index2.php?controlador=Alojamientos&accion=inicio">Alojamientos</a></li>
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

                            <th>Localidad</th>
                            <th>Categoría</th>
                            <th>Designacion Comercial</th>
                            <th>Contacto</th>
                            <th>Dirección</th>


                        </tr>
                    </thead>
                    <tbody>

                        <?php foreach ($inicioAlojamiento as $alojamiento) { ?>

                            <tr>

                                <td><?php echo $alojamiento["nombre_localidad"]; ?></td>
                                <td><?php echo $alojamiento["descripcion_tipo_alojamiento"]; ?></td>
                                <td><?php echo $alojamiento["descripcion_alojamientos"]; ?></td>
                                <td><?php echo $alojamiento["descripcion_contacto"]; ?></td>
                                <td><?php echo $alojamiento["calle_direccion"]; ?></td>


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