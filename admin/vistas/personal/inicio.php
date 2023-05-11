<?php

if (!isset($_SESSION['id'])) {
  header("Location: index.php");
}

$usuario = $_SESSION['usuarios'];
$rol_id = $_SESSION['rol_id'];



?>
<!-- Salto de linea -->
<!-- <br> -->


<section class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1>Personal</h1>
      </div>
      <div class="col-sm-6">
        <ol class="breadcrumb float-sm-right">
          <li class="breadcrumb-item"><a class="text-success" href="index2.php?controlador=paginas&accion=inicio">Inicio</a></li>
          <li class="breadcrumb-item active">Personal</li>
        </ol>
      </div>
    </div>
  </div>
</section>

<!-- Main content -->
<section class="content">

  <!-- Default box -->
  <div class="card">
    <div class="card-header">
      <?php if ($rol_id == 1 or $rol_id == 3 and $usuario == "rrhh" or $usuario == "karla") { ?>

        <a class="btn btn-success" href="?controlador=personal&accion=guardar" role="button">Agregar Personal</a>

        <button type="button" class="btn btn-success" data-toggle="modal" data-target="#modal-default">
          Agregar licencia o Artículo
        </button>

      <?php } ?>
      <?php if ($rol_id == 1 or $rol_id == 3 and $usuario == "admin") { ?>

        <button type="button" class="btn btn-success" data-toggle="modal" data-target="#modal-default">
          Agregar Roles y Usuarios
        </button>

      <?php } ?>
    </div>

    <div class="card-body p-0">
      <table class="table table-striped projects">
        <thead>
          <tr>
            <th style="width: 1%">
              #
            </th>
            <th style="width: 20%">
              Departamentos
            </th>
            <th style="width: 30%">
              Personal de cada Aréa
            </th>
            <th>
              Director/a - Encargado/a
            </th>
            <th style="width: 20%" class="text-center">
              Accion
            </th>
          </tr>
        </thead>
        <?php foreach ($tabla as $k) : ?>
          <tbody>
            <tr>
              <td>
                #
              </td>
              <td>
                <a>
                  <?php echo $k["descrDepto"]; ?>
                </a>
                <br />
                <small>
                  Creado 01.01.2022
                </small>
              </td>
              <td>
                <ul class="list-inline">
                  <li class="list-inline-item">
                    <img alt="Avatar" class="table-avatar" src="vistas/recursos/dist/img/imagen-perfil-sin-foto.jpg">
                  </li>
                  <li class="list-inline-item">
                    <img alt="Avatar" class="table-avatar" src="vistas/recursos/dist/img/imagen-perfil-sin-foto.jpg">
                  </li>
                  <li class="list-inline-item">
                    <img alt="Avatar" class="table-avatar" src="vistas/recursos/dist/img/imagen-perfil-sin-foto.jpg">
                  </li>
                  <li class="list-inline-item">
                    <img alt="Avatar" class="table-avatar" src="vistas/recursos/dist/img/imagen-perfil-sin-foto.jpg">
                  </li>
                </ul>
              </td>
              <td>
                <a>
                  <?php echo $k["descrTP"]; ?>
                </a>
                <br />
                <small>
                  <?php echo $k["full_name"]; ?>
                </small>
              </td>
              <td class="project-actions text-right">
                <a class="btn btn-primary btn-sm" href="?controlador=personal&accion=info&id=<?php echo $k["id_deptos_mintur"]; ?>">
                  <i class="fas fa-folder mr-2">
                  </i>
                  Más Infomación
                </a>
              </td>
            </tr>

          </tbody>
        <?php endforeach; ?>
      </table>
    </div>

    <!-- /.card-body -->
  </div>
  <!-- /.card -->

</section>

<div class="modal fade" id="modal-default">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">Licencia o Art</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form id="formularioModalPersonal" method="POST">
        <div class="modal-body">

          <div class="custom-control custom-checkbox ">
            <input name="licencia" class="custom-control-input custom-control-input-danger custom-control-input-outline" type="checkbox" id="customCheckbox5" checked>
            <label for="customCheckbox5" class="custom-control-label">Licencias</label>
          </div>
          <div class="custom-control custom-checkbox">
            <input name="articulo" class="custom-control-input custom-control-input-danger custom-control-input-outline" type="checkbox" id="customCheckbox6">
            <label for="customCheckbox6" class="custom-control-label">Árticulo 5.9-dec.ley 1362/85 </label>
          </div>

          <br>

          <div class="form-group">
            <label for="selectPersonal23">Personal</label>
            <select id="selectPersonal23" name="selectPersonal23" class="form-control select2" style="width: 100%;" required>
              <option value="" selected disabled>Seleccionar el personal</option>
              <?php foreach ($buscarSelectPersonal as $k) : ?>
                <option value="<?php echo $k->id_personal; ?>"> <?php echo $k->full_name; ?></option>
              <?php endforeach; ?>
            </select>
          </div>

          <div class="row" id="elemento">

            <div class="row col-12" id="copiarLicencia">

              <div class="col-sm-5">
                <div class="form-floating mb-3">
                  <label for="fechaIniLicencia" class="form-label">Fecha Inicio</label>
                  <input type="date" class="form-control" name="fechaIniLicencia[]" id="fechaIniLicencia">
                </div>
              </div>

              <div class="col-sm-5">
                <div class="form-floating mb-3">
                  <label for="fechafinLicencia" class="form-label">Fecha Fin</label>
                  <br>
                  <input type="date" class="form-control" name="fechafinLicencia[]" id="fechafinLicencia">
                </div>
              </div>

              <div class="col-sm-2 eventos-fechas">
                <div class="form-floating mb-3">
                  <label for="fechafinLicencia" class="form-label mt-3"></label>
                  <br>
                  <span id="masLicencia" name="masLicencia" class="btn btn-success" title="Añadir fechas">
                    <i class="fas fa-plus"></i>
                  </span>
                </div>
                <div class="form-floating mb-3" hidden>
                  <label for="fechafinLicencia" class="form-label mt-3"></label>
                  <br>
                  <span id="quitarFechas" name="quitarFechas" class="quitarFechas btn btn-warning" title="Quitar fecha">
                    <i class="fas fa-xmark"></i>
                  </span>
                </div>
              </div>

            </div>

            <div class="masFecha col-sm-12">
            </div>

            <div class="col-sm-5">
              <div class="form-floating mb-3">
                <label for="CantLicencia" class="form-label">Cantidad de días restantes</label>
                <input type="number" class="form-control" name="CantLicencia" id="CantLicencia">
              </div>
            </div>
            <!-- Aquí va la cantidad de licencia que le queda al personal, que obtenemos del script selectdinamicoliar -->
            <div class="col-sm-5" id="select2lista3"></div>

          </div>

          <div class="row" id="articulo">

            <div class="row col-12" id="copiarArticulo">

              <div class="col-sm-10">
                <div class="form-floating mb-3">
                  <label for="fechaIniArticulo" class="form-label">Fecha Inicio</label>
                  <input type="date" class="form-control" name="fechaIniArticulo[]" id="fechaIniArticulo">
                </div>
              </div>

              <div class="col-sm-2 eventos-fechas">
                <div class="form-floating mb-3">
                  <label for="fechafinLicencia" class="form-label mt-3"></label>
                  <br>
                  <span id="masArticulo" name="masArticulo" class="btn btn-success" title="Añadir fechas">
                    <i class="fas fa-plus"></i>
                  </span>
                </div>
                <div class="form-floating mb-3" hidden>
                  <label for="fechafinLicencia" class="form-label mt-3"></label>
                  <br>
                  <span id="quitarFechas" name="quitarFechas" class="quitarFechas btn btn-warning" title="Quitar fecha">
                    <i class="fas fa-xmark"></i>
                  </span>
                </div>
              </div>

            </div>

            <div class="masArticulos col-sm-12">

            </div>
            <!-- Aquí va la cantidad de Art que le queda al personal, que obtenemos del script selectdinamicoliar -->
            <div class="col-sm-5" id="selectArtFaltante2"></div>
          </div>

        </div>

        <div class="modal-footer justify-content-between">
          <button type="button" class="btn btn-primary" data-dismiss="modal">Cerrar</button>
          <button type="submit" class="btn btn-default" value="Agregar">Agregar</button>
        </div>

      </form>

    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>