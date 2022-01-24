<?php

include_once("./admin/conexion.php");


/*----------------------------------*********-----------------------------------*/

$conexionBD = BD::crearInstancia();

$sqlestadistica = $conexionBD->query("SELECT COUNT(*) conteo 
                                    FROM `alojamientos`");

$sqlestadistica->execute();

$cantidadHoteles = $sqlestadistica->fetchAll(PDO::FETCH_OBJ);


/*----------------------------------*********-----------------------------------*/


$sqlestadistica1 = $conexionBD->query("SELECT SUM(servicios_alojamiento.cantidad_plazas) conteo 
                                                    FROM servicios_alojamiento
                                                    INNER JOIN alojamientos ON servicios_alojamiento.id_servicio_alojamiento = alojamientos.rela_aloja_servicios
                                                    ");

$sqlestadistica1->execute();

$cantidadPlazas = $sqlestadistica1->fetchAll(PDO::FETCH_OBJ);


/*----------------------------------*********-----------------------------------*/


$sqlestadistica2 = $conexionBD->query("SELECT COUNT(*) conteo 
                                                        FROM `alojamientos` 
                                                        WHERE alojamientos.rela_tipo_alojamiento_aloja = 1");

$sqlestadistica2->execute();

$hoteles = $sqlestadistica2->fetchAll(PDO::FETCH_OBJ);

/*----------------------------------*********-----------------------------------*/


$sqlestadistica3 = $conexionBD->query("SELECT COUNT(*) conteo 
                                                        FROM `alojamientos` 
                                                        WHERE alojamientos.rela_tipo_alojamiento_aloja = 2");

$sqlestadistica3->execute();

$cabañas = $sqlestadistica3->fetchAll(PDO::FETCH_OBJ);


/*----------------------------------*********-----------------------------------*/

$listaAlojamientos = [];

$sql = $conexionBD->query("  SELECT alojamientos.id_alojamientos, alojamientos.descripcion_alojamientos, tipo_alojamiento.descripcion_tipo_alojamiento,
                                        direccion.calle_direccion,localidad.nombre_localidad,
                                        (SELECT contacto.descripcion_contacto 
                                        FROM contacto 
                                        WHERE alojamientos.id_alojamientos = contacto.rela_alojamiento_contacto 
                                        AND contacto.rela_tipo_contacto_cont = 2 LIMIT 1) descripcion_contacto,
                                        tipo_estado.descripcion_tipo_estado,direccion.id_direccion,razon_social.id_razon_social,
                                        alojamientos.rela_aloja_servicios,alojamientos.rela_aloja_serv_adicionales
                                        FROM alojamientos
                                        INNER JOIN tipo_alojamiento on tipo_alojamiento.id_tipo_alojamiento = alojamientos.rela_tipo_alojamiento_aloja
                                        INNER JOIN direccion on direccion.id_direccion = alojamientos.rela_alojamiento_direccion
                                        INNER JOIN localidad on localidad.id_localidad = direccion.rela_localidad_direccion
                                        INNER JOIN estado_actividad on estado_actividad.rela_estado_alojamiento = alojamientos.id_alojamientos
                                        INNER JOIN tipo_estado on tipo_estado.id_tipo_estado = estado_actividad.rela_tipo_estado
                                        INNER JOIN razon_social on razon_social.id_razon_social = alojamientos.rela_razon_social_alo");

//recuperamos los datos y los retornamos

while ($filas = $sql->fetch(PDO::FETCH_ASSOC)) {
    $listaAlojamientos[] = $filas;
    //print_r($listaAlojamientos);
}




?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Core Stylesheet -->
    <link rel="stylesheet" href="style.css">
    <!-- CSS personalizado -->
    <link rel="stylesheet" href="assets/css/styles.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
    <!-- CMD TABLAS  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap5.min.css">

    <!-- Title -->
    <title>Alojamientos</title>

    <!-- Favicon -->
    <link rel="icon" href="assets/img/FSA_HSA_ISO_HI_RES.png">
</head>

<body>
    <!-- ##### Header ##### -->
    <?php
    require_once('./layout/header.php');
    ?>

    <!-- ##### Breadcumb Area Start ##### -->
    <div class="breadcumb-area bg-img" style="background-image: url(assets/img/FSA-BRILLA-3-1.jpeg); background-position: top;">
        <div class="bradcumbContent">
            <h2>ALOJAMIENTOS</h2>
        </div>
    </div>
    <!-- ##### Breadcumb Area End ##### -->

    <!-- ##### Elements Area Start ##### -->
    <section class="elements-area mt-50 section-padding-100-0">
        <div class="container">
            <div class="col-12">
                <div class="academy-cool-facts-area mb-50">
                    <div class="row">

                        <div class="col-12 col-sm-6 col-md-3">
                            <div class="single-cool-fact text-center">
                                <i class="fal fa-house-flood"></i>
                                <!-- ##### el numero de abajo ##### -->
                                <?php foreach ($cabañas as $estadistica) { ?>
                                    <h3><span class="counter"><?php echo $estadistica->conteo; ?></span></h3>
                                <?php } ?>
                                <p>Cabañas</p>
                            </div>
                        </div>



                        <div class="col-12 col-sm-6 col-md-3">
                            <div class="single-cool-fact text-center">
                                <i class="fal fa-hotel"></i>
                                <!-- ##### el numero de abajo ##### -->
                                <?php foreach ($hoteles as $estadistica) { ?>
                                    <h3><span class="counter"><?php echo $estadistica->conteo; ?></span></h3>
                                <?php } ?>
                                <p>Hoteles</p>
                            </div>
                        </div>


                        <div class="col-12 col-sm-6 col-md-3">
                            <div class="single-cool-fact text-center">
                                <i class="fad fa-bed"></i>
                                <!-- ##### el numero de abajo ##### -->
                                <?php foreach ($cantidadPlazas as $estadistica) { ?>
                                    <h3>
                                        <span class="counter"><?php echo $estadistica->conteo; ?></span>
                                    </h3>
                                <?php } ?>
                                <p>Cantidad de plazas</p>
                            </div>
                        </div>

                        <div class="col-12 col-sm-6 col-md-3">
                            <div class="single-cool-fact text-center">
                                <i class="far fa-hotel"></i>
                                <!-- ##### el numero de abajo ##### -->
                                <?php foreach ($cantidadHoteles as $estadistica) { ?>
                                    <h3>
                                        <span class="counter"><?php echo $estadistica->conteo; ?></span>
                                    </h3>
                                <?php } ?>
                                <p>Alojamientos</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row" style="margin-bottom: 4rem;">
                <!-- ========== Inicio de DataTable ========== -->
                <div class="col-12">
                    <table id="example" class="table table-striped" style="width:100%">
                        <thead>
                            <tr style="background: linear-gradient(to right, #61ba6d, #83c331); text-align: center;">
                                <th>Localidad</th>
                                <th>Designación Comercial</th>
                                <th>Celular</th>
                                <th>Dirección</th>
                                <th>Estado</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!--TR BERMEJO-->
                            <?php foreach ($listaAlojamientos as $alojamiento) { ?>
                                <tr>
                                    <td><?php echo $alojamiento["nombre_localidad"]; ?></td>
                                    <td><?php echo $alojamiento["descripcion_alojamientos"]; ?></td>
                                    <td><?php echo $alojamiento["descripcion_contacto"]; ?></td>
                                    <td><?php echo $alojamiento["calle_direccion"]; ?></td>
                                    <td><?php echo $alojamiento["descripcion_tipo_estado"]; ?></td>
                                </tr>
                            <?php } ?>

                        </tbody>
                        <tfoot>
                            <tr>
                                <th>Localidad</th>
                                <th>Designación Comercial</th>
                                <th>Celular</th>
                                <th>Dirección</th>
                                <th>Estado</th>
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
            $('#example').DataTable({
                "language": {
                    "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"
                }
            });
        });
    </script>
    <!-- <script src="https://code.jquery.com/jquery-3.5.1.js"></script> -->
    <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap5.min.js"></script>



</body>

</html>