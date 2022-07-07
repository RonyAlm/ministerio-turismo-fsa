<section class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1>Imprimir Referentes Municipales</h1>
            </div>
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a class="text-success" href="index2.php?controlador=referentes&accion=inicio">Referentes</a></li>
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
                            <th class="visually-hidden">ID</th>
                            <th>Localidad</th>
                            <th>Nombre y Apellido</th>
                            <th>Contacto</th>
                            <th>Encargado</th>
                        </tr>
                    </thead>
                    <tbody>

                        <?php foreach ($tablaReferente as $referente) { ?>

                            <tr>
                                <td class="visually-hidden"> <?php echo $referente["id_referentes"]; ?></td>
                                <td><?php echo $referente["nombre_localidad"]; ?></td>
                                <td><?php echo $referente["idoneo_referente"]; ?></td>
                                <td><?php echo $referente["descripcion_contacto"]; ?></td>
                                <td><?php echo $referente["descripcion_tipo_encargado"]; ?></td>
                            </tr>

                        <?php } ?>

                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="card-footer"></div>

</div>