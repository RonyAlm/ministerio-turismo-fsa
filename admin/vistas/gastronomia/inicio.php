<?php

if (!isset($_SESSION['id'])) {
  header("Location: index.php");
}

$usuario = $_SESSION['usuarios'];
$rol_id = $_SESSION['rol_id'];

?>

<section class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1>Gastronomía</h1>
      </div>
      <div class="col-sm-6">
        <ol class="breadcrumb float-sm-right">
          <li class="breadcrumb-item"><a class="text-success" href="index2.php?controlador=paginas&accion=inicio">Inicio</a></li>
          <li class="breadcrumb-item active">Gastronomia</li>
        </ol>
      </div>
    </div>
  </div>
</section>

<div class="card">

  <div class="card-header">

    <?php if ($rol_id == 1 or $rol_id == 3 and $usuario == "roxana" or $usuario == "rrhh") : ?>

      <a name="" id="" class="btn btn-success" href="?controlador=gastronomia&accion=crear" role="button">Agregar</a>

    <?php else : ?>
      <a class="btn btn-success disabled" href="#" role="button">Agregar</a>
    <?php endif; ?>

    <a name="" id="" class="btn btn-secondary" href="?controlador=gastronomia&accion=imprimir" role="button">Imprimir</a>

  </div>

  <div class="card-body">


    <div id="acordeon" class="row">
      <div class="col-lg-12">
        <table id="tblList" class="table table-bordered table-striped" cellspacing="0" width="100%">
          <thead>
            <tr style="background: linear-gradient(to right, #61ba6d, #83c331)">
              <th>Localidad</th>
              <th>Designacion</th>
              <th>Contacto</th>
              <th>Dirección</th>
              <th>Acción</th>
            </tr>
          </thead>
          <tbody>

            <?php foreach ($tabla as $gastronomia) { ?>

              <tr>

                <td><?php echo $gastronomia["nombre_localidad"]; ?></td>
                <td><?php echo $gastronomia["denominacion_gastro"]; ?></td>
                <td><?php echo $gastronomia["descripcion_contacto"]; ?></td>
                <td><?php echo $gastronomia["calle_direccion"]; ?></td>
                <td class="project-actions text-right">
                  <div class="btn-group" role="group" aria-label="">

                    <a title="Más Infomación" id="btn1" href="?controlador=gastronomia&accion=info&id=<?= $gastronomia["id_gastronomia"]; ?>" class="btn btn-primary btn-sm">
                      <i class="fas fa-folder"></i>
                    </a>

                    <?php if ($rol_id == 1 or $rol_id == 3 and $usuario == "roxana" or $usuario == "rrhh") { ?>
                      <a title="Editar" href="?controlador=gastronomia&accion=editar&id=<?php echo $gastronomia["id_gastronomia"]; ?>" class="btn btn-success btn-sm">
                        <i class="fas fa-pencil-alt"></i>
                      </a>
                      <a title="Borrar" href="?controlador=gastronomia&accion=borrar&id=<?php echo $gastronomia["id_gastronomia"]; ?>
                                                                            &idDireccion=<?php echo $gastronomia["id_direccion"]; ?>" class="btn btn-danger btn-sm">
                        <i class="fas fa-trash"></i>
                      </a>

                    <?php } ?>
                  </div>
                </td>

              </tr>


            <?php } ?>
          </tbody>
          <tfoot>
            <tr style="background: linear-gradient(to right, #61ba6d, #83c331)">
              <th>Localidad</th>
              <th>Designacion</th>
              <th>Contacto</th>
              <th>Dirección</th>
              <th>Acción</th>
            </tr>
          </tfoot>
        </table>
      </div>
    </div>

  </div>

  <div class="card-footer">

  </div>


</div>