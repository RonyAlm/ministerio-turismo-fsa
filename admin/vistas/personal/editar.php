<!-- Para ordenar alfabeticamente los select -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
<script>
  function ordenarSelect(id_componente) {
    var selectToSort = jQuery('#' + id_componente);
    var optionActual = selectToSort.val();
    selectToSort.html(selectToSort.children('option').sort(function(a, b) {
      return a.text === b.text ? 0 : a.text < b.text ? -1 : 1;
    })).val(optionActual);
  }
  $(document).ready(function() {
    ordenarSelect('localidadAgencia');
    ordenarSelect('estadoAgencia');
  });
</script>

<!-- Content Header (Page header) -->
<section class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1>Perfil</h1>
      </div>

    </div>
  </div><!-- /.container-fluid -->
</section>

<!-- Main content -->
<section class="content">
  <div class="container-fluid">
    <div class="row">
      <div class="col-md-3">

        <!-- Profile Image -->
        <div class="card card-primary card-outline">
          <div class="card-body box-profile">
            <div class="text-center">
              <img class="profile-user-img img-fluid img-circle" src="vistas/recursos/dist/img/user1-128x128.jpg" alt="User profile picture">
            </div>

            <h3 class="profile-username text-center">Marcela Saguier Dr.</h3>

            <p class="text-muted text-center">Abogada Penalista</p>

          </div>
          <!-- /.card-body -->
        </div>
        <!-- /.card -->


        <!-- /.card -->
      </div>
      <!-- /.col -->
      <div class="col-md-9">
        <div class="card">
          <div class="card-header p-2">
            <ul class="nav nav-pills">
              <li class="nav-item"><a class="nav-link active" href="#settings" data-toggle="tab">Datos Personales</a></li>
              <!-- <li class="nav-item"><a class="nav-link" href="#profesion" data-toggle="tab">Profesión</a></li> -->
              <li class="nav-item"><a class="nav-link" href="#ministerio" data-toggle="tab">Ministerio</a></li>


            </ul>
          </div><!-- /.card-header -->
          <div class="card-body">
            <div class="tab-content">

              <!-- SETTINGS -->

              <form action="" method="POST">
                <div class="active tab-pane" id="settings">
                  <div class="form-horizontal">
                    <div class="form-group row">
                      <label for="" class="col-sm-2 col-form-label">Nombre</label>
                      <div class="col-sm-10">
                        <input type="" class="form-control" name="" id="" placeholder="Nombre">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="" class="col-sm-2 col-form-label">Apellido</label>
                      <div class="col-sm-10">
                        <input type="" class="form-control" name="" id="" placeholder="Apellido">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="" class="col-sm-2 col-form-label">Dirección</label>
                      <div class="col-sm-10">
                        <input type="text" class="form-control" name="" id="" placeholder="Dirección">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="" class="col-sm-2 col-form-label">Localidad</label>
                      <div class="col-sm-10">
                        <input type="text" class="form-control" name="" id="" placeholder="Localidad">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="" class="col-sm-2 col-form-label">Fecha de Nacimiento</label>
                      <div class="col-sm-10">
                        <input type="text" class="form-control" name="" id="" placeholder="Fecha de Nacimiento">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="" class="col-sm-2 col-form-label">Teléfono Celular</label>
                      <div class="col-sm-10">
                        <input type="text" class="form-control" name="" id="" placeholder="Teléfono Celular">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="" class="col-sm-2 col-form-label">Teléfono Fijo</label>
                      <div class="col-sm-10">
                        <input type="text" class="form-control" name="" id="" placeholder="Teléfono Fijo">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="" class="col-sm-2 col-form-label">Correo</label>
                      <div class="col-sm-10">
                        <input type="text" class="form-control" name="" id="" placeholder="Correo">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="" class="col-sm-2 col-form-label">Educación</label>
                      <div class="col-sm-10">
                        <input type="" class="form-control" name="" id="" placeholder="Educación">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="" class="col-sm-2 col-form-label">Profesión</label>
                      <div class="col-sm-10">
                        <input type="" class="form-control" name="" id="" placeholder="Profesión">
                      </div>
                    </div>
                  </div>
                </div>

                <!-- MINISTERIO -->

                <div class="tab-pane" id="ministerio">
                  <div class="form-horizontal">
                    <div class="form-group row">
                      <label for="" class="col-sm-2 col-form-label">Departamento</label>
                      <div class="col-sm-10">
                        <input type="" class="form-control" name="" id="" placeholder="Departamento">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="" class="col-sm-2 col-form-label">Área</label>
                      <div class="col-sm-10">
                        <input type="" class="form-control" name="" id="" placeholder="Área">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="" class="col-sm-2 col-form-label">Nº de Legajo</label>
                      <div class="col-sm-10">
                        <input type="text" class="form-control" name="" id="" placeholder="Nº de Legajo">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="" class="col-sm-2 col-form-label">Nº de Expediente</label>
                      <div class="col-sm-10">
                        <input type="text" class="form-control" name="" id="" placeholder="Nº de Expediente">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="" class="col-sm-2 col-form-label">Tipo de Contrato</label>
                      <div class="col-sm-10">
                        <input type="text" class="form-control" name="" id="" placeholder="Tipo de Contrato">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="" class="col-sm-2 col-form-label">Cargo</label>
                      <div class="col-sm-10">
                        <input type="text" class="form-control" name="" id="" placeholder="Cargo">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="" class="col-sm-2 col-form-label">Rol</label>
                      <div class="col-sm-10">
                        <input type="text" class="form-control" name="" id="" placeholder="Rol">
                      </div>
                    </div>



                    <div class="form-group row">
                      <div class="offset-sm-2 col-sm-10">
                        <button type="submit" class="btn btn-danger">Editar</button>
                      </div>
                    </div>
                  </div>
                </div>
              </form>
            </div>
            <!-- /.tab-pane -->
          </div>
          <!-- /.tab-content -->
        </div><!-- /.card-body -->
      </div>
      <!-- /.card -->
    </div>
    <!-- /.col -->
  </div>
  <!-- /.row -->
  </div><!-- /.container-fluid -->
</section>
<!-- /.content -->