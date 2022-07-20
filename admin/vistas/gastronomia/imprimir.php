<section class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1>Imprimir Agencias</h1>
            </div>
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a class="text-success" href="index2.php?controlador=agencias&accion=inicio">Agencias</a></li>
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

                            <th>Localidad</th>
                            <th>Designacion Comercial</th>
                            <th>Contacto</th>
                            <th>Dirección</th>
                            <th>Estado</th>

                        </tr>
                    </thead>
                    <tbody>

                        <?php foreach ($tablaAgencia as $agencia) { ?>

                            <tr>

                                <td><?php echo $agencia["nombre_localidad"]; ?></td>
                                <td><?php echo $agencia["descripcion_agencias"]; ?></td>
                                <td><?php echo $agencia["descripcion_contacto"]; ?></td>
                                <td><?php echo $agencia["calle_direccion"]; ?></td>
                                <?php if ($agencia["descripcion_tipo_estado"] == "Activo") { ?>
                                    <td class="badge badge-success"><?php echo $agencia["descripcion_tipo_estado"]; ?></td>
                                <?php } ?>
                                <?php if ($agencia["descripcion_tipo_estado"] == "Falta Verificar") { ?>
                                    <td class="badge badge-warning"><?php echo $agencia["descripcion_tipo_estado"]; ?></td>
                                <?php } ?>
                                <?php if ($agencia["descripcion_tipo_estado"] == "Baja") { ?>
                                    <td class="badge badge-danger"><?php echo $agencia["descripcion_tipo_estado"]; ?></td>
                                <?php } ?>
                                <?php if ($agencia["descripcion_tipo_estado"] == "Centro de aislamiento") { ?>
                                    <td class="badge badge-secondary"><?php echo $agencia["descripcion_tipo_estado"]; ?></td>
                                <?php } ?>
                                <?php if ($agencia["descripcion_tipo_estado"] == "Cambio de domicilio") { ?>
                                    <td class="badge bg-lime"><?php echo $agencia["descripcion_tipo_estado"]; ?></td>
                                <?php } ?>
                                <?php if ($agencia["descripcion_tipo_estado"] == "Se desconoce situación") { ?>
                                    <td class="badge bg-orange"><?php echo $agencia["descripcion_tipo_estado"]; ?></td>
                                <?php } ?>
                                <?php if ($agencia["descripcion_tipo_estado"] == "Cierre temporario") { ?>
                                    <td class="badge bg-purple"><?php echo $agencia["descripcion_tipo_estado"]; ?></td>
                                <?php } ?>
                                <?php if ($agencia["descripcion_tipo_estado"] == "No Fiscalizadas") { ?>
                                    <td class="badge bg-navy"><?php echo $agencia["descripcion_tipo_estado"]; ?></td>
                                <?php } ?>
                                <?php if ($agencia["descripcion_tipo_estado"] == "Domicilio Virtual") { ?>
                                    <td class="badge bg-info"><?php echo $agencia["descripcion_tipo_estado"]; ?></td>
                                <?php } ?>

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