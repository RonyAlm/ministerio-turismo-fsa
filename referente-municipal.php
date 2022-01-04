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
    <link rel="icon" href="img/FSA_HSA_ISO_HI_RES.png">

    <!-- Core Stylesheet -->
    <link rel="stylesheet" href="style.css">
    <!-- CSS personalizado -->
    <link rel="stylesheet" href="css/styles.css">
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
    <div class="breadcumb-area bg-img" style="background-image: url(img/FSA-BRILLA-3-1.jpeg); background-position: top;">
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
                    <table id="example" class="table table-striped" style="width:100%">
                        <thead>
                            <tr style="background: linear-gradient(to right, #61ba6d, #83c331); text-align: center;">
                                <th>Localidad</th>
                                <th>Nombre y Apellido</th>
                                <th>Celular</th>
                                <th>Email</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!--TR BERMEJO-->
                            <tr>
                                <td> BERMEJO - Luguna Yema</td>
                                <td>Gilgo Martiarena</td>
                                <td>3704262569</td>
                                <td>miguelatanasio2015@gmail.com</td>
                            </tr>
                            <tr>
                                <td>BERMEJO - Los Chiriguanos</td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>BERMEJO - Pozo de Maza</td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>BERMEJO - Pozo Mortero</td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <!--TR FORMOSA-->
                            <tr>
                                <td>FORMOSA - Ciudad de Formosa</td>
                                <td>Cristina Salomon</td>
                                <td>3704671555</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>FORMOSA - Colonia Pastoril</td>
                                <td>Danilo</td>
                                <td>3718629209</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>FORMOSA - Mojon de Fierro</td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>FORMOSA - Gran Guardia</td>
                                <td></td>
                                <td>3704544126</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>FORMOSA - San Hilario</td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>FORMOSA - Mariano Boedo</td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>FORMOSA - Villa del Carmen</td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>FORMOSA - Villa Trinidad</td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
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
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="js/active.js"></script>
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