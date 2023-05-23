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
        <h1>Referentes Municipales</h1>
      </div>
      <div class="col-sm-6">
        <ol class="breadcrumb float-sm-right">
          <li class="breadcrumb-item"><a class="text-success" href="index2.php?controlador=paginas&accion=inicio">Inicio</a></li>
          <li class="breadcrumb-item active">Referentes</li>
        </ol>
      </div>
    </div>
  </div>
</section>

<div class="card">
  <div class="card-header">

    <?php if ($rol_id == 1 or $rol_id == 3 and $usuario == "admin") : ?>

      <a name="" id="" class="btn btn-success" href="?controlador=referentes&accion=crear" role="button">Agregar</a>

    <?php else : ?>
      <a class="btn btn-success disabled" href="#" role="button">Agregar</a>
    <?php endif; ?>

    <a name="" id="" class="btn btn-secondary" href="?controlador=referentes&accion=imprimir" role="button">Imprimir</a>

  </div>

  <div class="card-body">

    <div class="row">

      <!-- Referentes -->
      <div class="col-md-3 col-sm-6 col-12">
        <div class="info-box">

          <span class="info-box-icon bg-success"><i class="fa-solid fa-people-line"></i></span>

          <div class="info-box-content">
            <span class="info-box-text text-center">Referentes</span>
            <?php foreach ($estadistica as $esta) { ?>
              <span class="info-box-text">Cantidad Total: <?php echo $esta->conteo; ?> </span>
            <?php } ?>
          </div>

        </div>
      </div>

      <!-- Monicipios -->
      <div class="col-md-3 col-sm-6 col-12">
        <div class="info-box">

          <span class="info-box-icon bg-success"><i class="fa-solid fa-building"></i></span>

          <div class="info-box-content">
            <span class="info-box-text text-center">Municipios
              <!-- con sedes de turismo -->
            </span>
            <?php foreach ($estadistica2 as $esta) { ?>
              <span class="info-box-text">Cantidad Total: <?php echo $esta->conteo; ?> </span>
            <?php } ?>
          </div>

        </div>
      </div>

      <!-- Registrada -->
      <div class="col-md-3 col-sm-6 col-12">
        <div class="info-box">

          <span class="info-box-icon bg-success"><i class="fa-solid fa-building-circle-check"></i></span>

          <div class="info-box-content">
            <span class="info-box-text text-center">Registradas</span>
            <?php //foreach ($estadistica as $esta) { 
            ?>
            <span class="info-box-text">Cantidad Total: 20 <?php //echo $esta->conteo; 
                                                            ?> </span>
            <?php //} 
            ?>
          </div>

        </div>
      </div>

      <!-- Registrada -->
      <div class="col-md-3 col-sm-6 col-12">
        <div class="info-box">

          <span class="info-box-icon bg-success"><i class="fa-solid fa-building-circle-exclamation"></i></span>

          <div class="info-box-content">
            <span class="info-box-text text-center">Dado de baja</span>
            <?php //foreach ($estadistica as $esta) { 
            ?>
            <span class="info-box-text">Cantidad Total: 3 <?php //echo $esta->conteo; 
                                                          ?> </span>
            <?php //} 
            ?>
          </div>

        </div>
      </div>

    </div>

    <div class="row" id="acordeon">

      <div class="col-lg-12">

        <table id="tblList" class="table table-bordered table-striped" cellspacing="0" width="100%">
          <thead>
            <tr style="background: linear-gradient(to right, #61ba6d, #83c331)">
              <th class="d-none">ID</th>
              <th>Localidad</th>
              <th>Nombre y Apellido</th>
              <th>Contacto</th>
              <th>Encargado</th>
              <th>Acción</th>
            </tr>
          </thead>
          <tbody>

            <?php foreach ($tablaReferente as $referente) { ?>

              <tr>
                <td class="d-none"> <?php echo $referente["id_referentes"]; ?></td>
                <td><?php echo $referente["nombre_localidad"]; ?></td>
                <td><?php echo $referente["idoneo_referente"]; ?></td>
                <td><?php echo $referente["descripcion_contacto"]; ?></td>
                <td><?php echo $referente["descripcion_tipo_encargado"]; ?></td>
                <td class="project-actions text-right">
                  <div class="btn-group" role="group">

                    <a title="Más información" href="?controlador=referentes&accion=info&id=<?php echo $referente["id_referentes"]; ?>" class="btn btn-primary btn-sm">
                      <i class="fas fa-folder"></i>
                    </a>

                    <?php if ($rol_id == 1 or $rol_id == 3 and $usuario == "admin") : ?>

                      <a title="Editar" href="?controlador=referentes&accion=editar&id=<?php echo $referente["id_referentes"]; ?>" class="btn btn-success btn-sm">
                        <i class="fas fa-pencil-alt"></i>
                      </a>
                      <a title="Borrar" href="?controlador=referentes&accion=borrar&id=<?php echo $referente["id_referentes"]; ?>&idDireccion=<?php echo $referente["id_direccion"]; ?>" class="btn btn-danger btn-sm">
                        <i class="fas fa-trash"></i>
                      </a>

                    <?php else : ?>

                      <a title="Editar" href="#" class="btn btn-success btn-sm disabled">
                        <i class="fas fa-pencil-alt"></i>
                      </a>
                      <a title="Borrar" href="#" class="btn btn-danger btn-sm disabled">
                        <i class="fas fa-trash"></i>
                      </a>

                    <?php endif; ?>

                  </div>

                </td>
              </tr>

            <?php } ?>

          </tbody>
          <tfoot>
            <tr style="background: linear-gradient(to right, #61ba6d, #83c331)">
              <th class="d-none">ID</th>
              <th>Localidad</th>
              <th>Nombre y Apellido</th>
              <th>Contacto</th>
              <th>Encargado</th>
              <th>Acción</th>
            </tr>
          </tfoot>
        </table>

      </div>

    </div>

  </div>


</div>