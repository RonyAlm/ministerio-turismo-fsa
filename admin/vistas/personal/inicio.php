<?php

if (!isset($_SESSION['id'])) {
  header("Location: index.php");
}

$usuario = $_SESSION['usuarios'];
$rol_id = $_SESSION['rol_id'];



?>
<!-- Salto de linea -->
<!-- <br> -->
<?php if ($rol_id == 1 or $rol_id == 3 and $usuario == "monica") { ?>
  <div class="card-header">

    <a name="" id="" class="btn btn-success" href="?controlador=Alojamientos&accion=crear" role="button">Agregar Personal</a>
    <!-- <a name="" id="" class="btn btn-warning" href="?controlador=Alojamientos&accion=imprimir" role="button">IMPRIMIR</a> -->
  </div>

<?php } ?>
<!-- Main content -->
<section class="content">

  <!-- Default box -->
  <div class="card">
    <div class="card-header">
      <h3 class="card-title">PERSONAL</h3>

      <div class="card-tools">
        <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
          <i class="fas fa-minus"></i>
        </button>
        <button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
          <i class="fas fa-times"></i>
        </button>
      </div>
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
        <tbody>
          <tr>
            <td>
              #
            </td>
            <td>
              <a>
                Administración
              </a>
              <br />
              <small>
                Creado 01.01.2022
              </small>
            </td>
            <td>
              <ul class="list-inline">
                <li class="list-inline-item">
                  <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar.png">
                </li>
                <li class="list-inline-item">
                  <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar2.png">
                </li>
                <li class="list-inline-item">
                  <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar3.png">
                </li>
                <li class="list-inline-item">
                  <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar4.png">
                </li>
              </ul>
            </td>
            <td class="project_progress">
              <div class="progress progress-sm">
                <div class="progress-bar bg-green" role="progressbar" aria-valuenow="57" aria-valuemin="0" aria-valuemax="100" style="width: 57%">
                </div>
              </div>
              <small>
                57% Complete
              </small>
            </td>
            <td class="project-actions text-right">
              <a class="btn btn-primary btn-sm" href="?controlador=personal&accion=info">
                <i class="fas fa-folder">
                </i>
                View
              </a>
              <!-- <a class="btn btn-info btn-sm" href="#">
                <i class="fas fa-pencil-alt">
                </i>
                Edit
              </a>
              <a class="btn btn-danger btn-sm" href="#">
                <i class="fas fa-trash">
                </i>
                Delete
              </a> -->
            </td>
          </tr>
          <tr>
            <td>
              #
            </td>
            <td>
              <a>
                Central
              </a>
              <br />
              <small>
                Creado 01.01.2022
              </small>
            </td>
            <td>
              <ul class="list-inline">
                <li class="list-inline-item">
                  <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar.png">
                </li>
                <li class="list-inline-item">
                  <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar2.png">
                </li>
                <li class="list-inline-item">
                  <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar3.png">
                </li>
                <li class="list-inline-item">
                  <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar4.png">
                </li>
              </ul>
            </td>
            <td class="project_progress">
              <div class="progress progress-sm">
                <div class="progress-bar bg-green" role="progressbar" aria-valuenow="57" aria-valuemin="0" aria-valuemax="100" style="width: 57%">
                </div>
              </div>
              <small>
                57% Complete
              </small>
            </td>
            <td class="project-actions text-right">
              <a class="btn btn-primary btn-sm" href="#">
                <i class="fas fa-folder">
                </i>
                View
              </a>
              <!-- <a class="btn btn-info btn-sm" href="#">
                <i class="fas fa-pencil-alt">
                </i>
                Edit
              </a>
              <a class="btn btn-danger btn-sm" href="#">
                <i class="fas fa-trash">
                </i>
                Delete
              </a> -->
            </td>
          </tr>
          <tr>
            <td>
              #
            </td>
            <td>
              <a>
                Logística
              </a>
              <br />
              <small>
                Creado 01.01.2022
              </small>
            </td>
            <td>
              <ul class="list-inline">
                <li class="list-inline-item">
                  <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar.png">
                </li>
                <li class="list-inline-item">
                  <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar2.png">
                </li>
                <li class="list-inline-item">
                  <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar3.png">
                </li>
                <li class="list-inline-item">
                  <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar4.png">
                </li>
              </ul>
            </td>
            <td class="project_progress">
              <div class="progress progress-sm">
                <div class="progress-bar bg-green" role="progressbar" aria-valuenow="57" aria-valuemin="0" aria-valuemax="100" style="width: 57%">
                </div>
              </div>
              <small>
                57% Complete
              </small>
            </td>
            <td class="project-actions text-right">
              <a class="btn btn-primary btn-sm" href="#">
                <i class="fas fa-folder">
                </i>
                View
              </a>
              <!-- <a class="btn btn-info btn-sm" href="#">
                <i class="fas fa-pencil-alt">
                </i>
                Edit
              </a>
              <a class="btn btn-danger btn-sm" href="#">
                <i class="fas fa-trash">
                </i>
                Delete
              </a> -->
            </td>
          </tr>

        </tbody>
      </table>
    </div>
    <!-- /.card-body -->
  </div>
  <!-- /.card -->

</section>