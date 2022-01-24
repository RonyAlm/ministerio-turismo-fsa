<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>Datos Estadistico</title>

    <!-- Favicon -->
    <link rel="icon" href="assets/img/FSA_HSA_ISO_HI_RES.png">

    <!-- Core Stylesheet -->
    <link rel="stylesheet" href="style.css">
    <!-- CSS personalizado -->
    <link rel="stylesheet" href="assets/css/styles.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />

</head>

<body>
    <!-- ##### Header ##### -->
    <?php
    require_once('./layout/header.php');
    ?>

    <!-- ##### Breadcumb Area Start ##### -->
    <div class="breadcumb-area bg-img" style="background-image: url(assets/img/bg-img/breadcumb.jpg);">
        <div class="bradcumbContent">
            <h2>DATOS ESTADISTICOS</h2>
        </div>
    </div>
    <!-- ##### Breadcumb Area End ##### -->

    <!-- ##### ENTRA ACA DAVID ##### -->
    <!-- ##### Elements Area Start ##### -->
    <section class="elements-area mt-50 section-padding-100-0">
        <div class="container">
            <div class="row">

                <div class="col-12">
                    <div class="academy-cool-facts-area mb-50">
                        <div class="row">


                            <div class="col-12 col-sm-6 col-md-3">
                                <div class="single-cool-fact text-center">
                                    <i class="fal fa-house-flood"></i>
                                    <!-- ##### el numero de abajo ##### -->
                                    <h3><span class="counter">130</span></h3>
                                    <p>Cabañas</p>
                                </div>
                            </div>


                            <div class="col-12 col-sm-6 col-md-3">
                                <div class="single-cool-fact text-center">
                                    <i class="fal fa-hotel"></i>
                                    <!-- ##### el numero de abajo ##### -->
                                    <h3><span class="counter">54</span></h3>
                                    <p>Plazas</p>
                                </div>
                            </div>


                            <div class="col-12 col-sm-6 col-md-3">
                                <div class="single-cool-fact text-center">
                                    <i class="fal fa-hiking"></i>
                                    <!-- ##### el numero de abajo ##### -->
                                    <h3><span class="counter">1232</span></h3>
                                    <p>Visitantes</p>
                                </div>
                            </div>

                            <div class="col-12 col-sm-6 col-md-3">
                                <div class="single-cool-fact text-center">
                                    <i class="fal fa-calendar-alt"></i>
                                    <!-- ##### el numero de abajo ##### -->
                                    <h3><span class="counter">12</span></h3>
                                    <p>Eventos</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- ========== Progress Bars & Accordions ========== -->
                <!-- <div class="col-12">
                    <div class="elements-title mb-50">
                        <span>The Best</span>
                        <h2>Accordians &amp; Tabs</h2>
                    </div>
                </div> -->

                <!-- ##### Accordians ##### -->
                <div class="col-12 col-lg-12">
                    <div class="accordions mb-100" id="accordion" role="tablist" aria-multiselectable="true">
                        <!-- single accordian area -->
                        <div class="panel single-accordion">
                            <h6><a class="centrar-text" role="button" class="" aria-expanded="true" aria-controls="collapseOne" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">HERRADURA - CRECIMIENTO DE CABAÑA
                                    <span class="accor-open"><i class="fa fa-plus" aria-hidden="true"></i></span>
                                    <span class="accor-close"><i class="fa fa-minus" aria-hidden="true"></i></span>
                                </a></h6>
                            <div id="collapseOne" class="accordion-content collapse show">
                                <div class="col-12 grafico">
                                    <!-- <div class="elements-title mb-50">
                                        <span class="centrar-text">HERRADURA</span>
                                        <h2 class="centrar-text">CRECIMIENTO DE CABAÑA</h2>
                                    </div> -->
                                    <div class="h5_r_vertical">
                                        <h5>CANTIDAD</h5>
                                    </div>
                                    <canvas id="chart-cabaña-herra" class="canvas-grafico"></canvas>
                                    <h5 class="h5_r">AÑO DE INICIO DE ACTIVIDADES</h5>
                                </div>
                            </div>
                        </div>
                        <!-- single accordian area -->
                        <div class="panel single-accordion">
                            <h6><a class="centrar-text" role="button" class="collapsed" aria-expanded="true" aria-controls="collapseTwo" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">HERRADURA - CRECIMIENTO DE PLAZAS
                                    <span class="accor-open"><i class="fa fa-plus" aria-hidden="true"></i></span>
                                    <span class="accor-close"><i class="fa fa-minus" aria-hidden="true"></i></span>
                                </a></h6>
                            <div id="collapseTwo" class="accordion-content collapse show">
                                <div class="col-12 grafico">
                                    <!-- <div class="elements-title mb-50">
                                        <span class="centrar-text">HERRADURA</span>
                                        <h2 class="centrar-text">CRECIMIENTO DE  </h2>
                                    </div> -->
                                    <div class="h5_r_vertical">
                                        <h5>PLAZAS</h5>
                                    </div>
                                    <canvas id="chart-plaza-herra" class="canvas-grafico"></canvas>
                                    <h5 class="h5_r">AÑOS</h5>
                                </div>
                            </div>
                        </div>
                        <!-- single accordian area -->
                        <div class="panel single-accordion">
                            <h6><a class="centrar-text" role="button" class="collapsed" aria-expanded="true" aria-controls="collapseThree" data-toggle="collapse" data-parent="#accordion" href="#collapseThree">INCREMENTO DE VISITANTES AL BAÑADO LA ESTRELLA
                                    <span class="accor-open"><i class="fa fa-plus" aria-hidden="true"></i></span>
                                    <span class="accor-close"><i class="fa fa-minus" aria-hidden="true"></i></span>
                                </a></h6>
                            <div id="collapseThree" class="accordion-content collapse show">
                                <div class="col-12 grafico">
                                    <div class="h5_r_vertical_2">
                                        <h5>CANTIDAD DE PERSONAS</h5>
                                    </div>
                                    <canvas id="chart-visitantes" class="canvas-grafico"></canvas>
                                </div>
                            </div>
                        </div>
                        <!-- single accordian area -->


                    </div>
                </div>


                <!-- ##### Tabs ##### -->

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
    <!-- Chart js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        const ctx = document.getElementById('chart-cabaña-herra').getContext('2d');
        const myChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['2015 o Anterior', '2016', '2017', '2018', '2019', '2020'],
                datasets: [{
                    label: '# Crecimiento de cabañas',
                    data: [6, 2, 8, 10, 2, 3],
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    </script>
    <script>
        const ctx_plaza = document.getElementById('chart-plaza-herra').getContext('2d');
        const myChartLine = new Chart(ctx_plaza, {
            type: 'line',
            data: {
                labels: ['2015', '2016', '2017', '2018', '2019', '2020'],
                datasets: [{
                    label: '# Crecimiento de Plazas',
                    data: [146, 173, 212, 292, 305],
                    backgroundColor: [
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)'
                    ],
                    borderColor: [
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 99, 132, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
                    ],
                    borderWidth: 4
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    </script>

    <script>
        const ctx_visitantes = document.getElementById('chart-visitantes').getContext('2d');
        const myChartLineBar = new Chart(ctx_visitantes, {

            data: {
                labels: ['JUNIO/JULIO 2018', 'JULIO/AGOSTO 2019'],
                datasets: [{
                    type: 'bar',
                    label: 'INCREMENTO INTERANUAL DE VISITANTES',
                    data: [105, 289],
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
                    ],
                    borderWidth: 1
                }, {
                    type: 'line',
                    label: '#',
                    data: [105, 289],
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
                    ],
                    borderWidth: 2
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    </script>


</body>

</html>