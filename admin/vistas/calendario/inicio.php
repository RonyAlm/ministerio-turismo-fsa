<?php
   
  if (!isset($_SESSION['id'])) {
    header("Location: index.php");
  }

  $usuario= $_SESSION['usuarios'];
  $rol_id= $_SESSION['rol_id'];



?>

          
          <!-- /.col -->
          <div class="col-md-12">
            <div class="card card-primary">
              <div class="card-body p-0">
                <!-- THE CALENDAR -->
                <div id="calendar"></div>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
    

        