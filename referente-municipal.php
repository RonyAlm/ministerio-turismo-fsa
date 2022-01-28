<?php

include_once("./admin/conexion.php");

$conexionBD = BD::crearInstancia();

$listaReferente = [];

$sql = $conexionBD->query("SELECT `id_referentes`, `idoneo_referente`, direccion.id_direccion,localidad.nombre_localidad,
                                            tipo_encargado.descripcion_tipo_encargado,departamentos_fsa.descripcion_departamentos,
                                        (SELECT contacto.descripcion_contacto 
                                        FROM contacto 
                                        WHERE referentes_municipal.id_referentes = contacto.rela_contacto_referente
                                        and contacto.rela_tipo_contacto_cont = 2
                                        LIMIT 1) descripcion_contacto
                                        FROM `referentes_municipal`
                                        INNER JOIN direccion ON referentes_municipal.rela_direccion = direccion.id_direccion
                                        INNER JOIN localidad on direccion.rela_localidad_direccion = localidad.id_localidad
                                        INNER JOIN tipo_encargado on tipo_encargado.id_tipo_encargado = referentes_municipal.rela_tipo_encargado
                                        INNER JOIN departamentos_fsa on departamentos_fsa.id_departamentos_fsa = localidad.rela_departamento");

//recuperamos los datos y los retornamos

while ($filas = $sql->fetch(PDO::FETCH_ASSOC)) {
    $listaReferentes[] = $filas;
    // print_r($listaReferentes);
}

?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>Referente Municipal</title>

    <!-- Favicon -->
    <link rel="icon" href="assets/img/FSA_HSA_ISO_HI_RES.png">

    <!-- Core Stylesheet -->
    <link rel="stylesheet" href="style.css">
    <!-- CSS personalizado -->
    <link rel="stylesheet" href="assets/css/styles.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
    <!-- CMD TABLAS  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap5.min.css">

</head>

<body>

    <!-- ##### Header ##### -->
    <?php
    require_once('./layout/header.php');
    ?>

    <!-- ##### Breadcumb Area Start ##### -->
    <div class="breadcumb-area bg-img" style="background-image: url(assets/img/FSA-BRILLA-3-1.jpeg); background-position: top;">
        <div class="bradcumbContent">
            <h2>REFERENTES MUNICIPAL</h2>
        </div>
    </div>
    <!-- ##### Breadcumb Area End ##### -->

    <!-- ##### Elements Area Start ##### -->
    <section class="elements-area mt-50 section-padding-100-0">
        <div class="container">
            <div class="row" style="margin-bottom: 4rem;">
                <!-- ========== Inicio de DataTable ========== -->
                <div class="col-12">
                    <i class="iconBuscar fas fa-search"></i>
                    <table id="tblReferentes" class="table table-striped" style="width:100%">
                        <thead>
                            <tr style="background: linear-gradient(to right, #61ba6d, #83c331); text-align: center;">
                                <th>Localidad</th>
                                <th>Nombre y Apellido</th>
                                <th>Celular</th>
                                <th>tipo</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!--TR BERMEJO-->
                            <?php foreach ($listaReferentes as $referente) { ?>
                                <tr>
                                    <td><?php echo $referente["descripcion_departamentos"]; ?> - <?php echo $referente["nombre_localidad"]; ?></td>
                                    <td><?php echo $referente["idoneo_referente"]; ?></td>
                                    <td><?php echo $referente["descripcion_contacto"]; ?></td>
                                    <td><?php echo $referente["descripcion_tipo_encargado"]; ?></td>
                                </tr>
                            <?php } ?>

                        </tbody>
                        <tfoot>
                            <tr>
                                <th>Localidad</th>
                                <th>Nombre y Apellido</th>
                                <th>Celular</th>
                                <th>Email</th>
                            </tr>
                        </tfoot>
                    </table>
                </div>
                <!-- ========== Fin de DataTable ========== -->
            </div>
        </div>
    </section>
    <!-- ***** Elements Area End ***** -->

    <!-- ##### Footer ##### -->
    <?php
    require_once('./layout/footer.php');
    ?>

    <!-- ##### All Javascript Script ##### -->
    <!-- jQuery-2.2.4 js -->
    <script src="assets/js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="assets/js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="assets/js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="assets/js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="assets/js/active.js"></script>
    <!-- Script tabla DataTable -->
    <script>
        $(document).ready(function() {
            $('#tblReferentes').DataTable({
                "language": {
                    "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"
                }
            });
        });
    </script>
    <!-- <script src="https://code.jquery.com/jquery-3.5.1.js"></script> -->
    <script src="assets/js/DataTables-1.11.4/js/jquery.dataTables.js"></script>
    <script src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap5.min.js"></script>

</body>

</html>