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

    <a name="" id="" class="btn btn-success" href="?controlador=personal&accion=guardar" role="button">Agregar Personal</a>
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
        <!-- <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
          <i class="fas fa-minus"></i>
        </button> -->
        <!-- <button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
          <i class="fas fa-times"></i>
        </button> -->
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
                    <img alt="Avatar" class="table-avatar" src="vistas/recursos/dist/img/avatar2.png">
                  </li>
                  <li class="list-inline-item">
                    <img alt="Avatar" class="table-avatar" src="vistas/recursos/dist/img/avatar3.png">
                  </li>
                  <li class="list-inline-item">
                    <img alt="Avatar" class="table-avatar" src="vistas/recursos/dist/img/avatar4.png">
                  </li>
                  <li class="list-inline-item">
                    <img alt="Avatar" class="table-avatar" src="vistas/recursos/dist/img/avatar5.png">
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
                  <i class="fas fa-folder">
                  </i>
                  Vista
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