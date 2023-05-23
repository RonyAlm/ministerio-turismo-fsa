<?php

if (!isset($_SESSION['id'])) {
  header("Location: index.php");
}

$usuario = $_SESSION['usuarios'];
$rol_id = $_SESSION['rol_id'];
$acceso = $_SESSION['tablas_acceso'];



?>
<section class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1>Eventos</h1>
      </div>
      <div class="col-sm-6">
        <ol class="breadcrumb float-sm-right">
          <li class="breadcrumb-item"><a class="text-success" href="index2.php?controlador=paginas&accion=inicio">Inicio</a></li>
          <li class="breadcrumb-item active">Eventos</li>
        </ol>
      </div>
    </div>
  </div>
</section>

<div class="card card-success card-outline">
  <div class="card-header">
  </div>
  <div class="card-body">
    <!-- THE CALENDAR -->
    <div id="calendar"></div>
  </div>
  <div class="card-footer"></div>

</div>