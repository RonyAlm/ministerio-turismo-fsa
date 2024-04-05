<section class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1>Imprimir Transportes</h1>
            </div>
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a class="text-success" href="index2.php?controlador=transportes&accion=inicio">Transportes</a></li>
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
                            <th>Servicios</th>

                        </tr>
                    </thead>
                    <tbody>

                        <?php foreach ($tablaAgencia as $agencia) { ?>

                            <tr>

                                <td><?php echo $agencia["nombre_localidad"]; ?></td>
                                <td><?php echo $agencia["designacion_transporte"]; ?></td>
                                <td><?php echo $agencia["descri_contacto_transporte"]; ?></td>
                                <td><?php echo $agencia["descripcion_serv_transportes"]; ?></td>
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