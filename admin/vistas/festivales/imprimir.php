<section class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1>Imprimir Festividades</h1>
            </div>
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a class="text-success" href="index2.php?controlador=festivales&accion=inicio">Festividades</a></li>
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
                            <th>Festival</th>
                            <th>Contacto</th>                      
                        </tr>
                    </thead>

                    <tbody>

                        <?php foreach ($tabla as $festival) { ?>

                            <tr>
                                <td><?php echo $festival["nombre_localidad"]; ?></td>
                                <td><?php echo $festival["nombre_festival"]; ?></td>
                                <td>
                                    <?php
                                    foreach ($tablaContacto as $contacto) :
                                        if ($festival['id_festivales'] == $contacto['rela_festivales']) :
                                            echo $contacto['descripcion_contacto'] . '   ';
                                            break; // Para que solo muestre un número
                                        endif;
                                    endforeach;
                                    ?>
                                </td>

                            </tr>

                        <?php } ?>

                    </tbody>

                </table>
            </div>
        </div>
    </div>

    <div class="card-footer"></div>

</div>