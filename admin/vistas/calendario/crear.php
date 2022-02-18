<?php
include_once("/xampp/htdocs/ministeriotur/admin/modelos/calendario.php");
include_once("/xampp/htdocs/ministeriotur/admin/conexion.php");

$registro = new CalendarioModelo();

if (empty($_POST['title']) || empty($_POST['start']) || empty($_POST['fecha_fin']) || empty($_POST['color']) || empty($_POST['descripcion'])) {
    $mensaje = array('msg' => 'Todos los campos son requeridos', 'estado' => false, 'tipo' => 'warning');
} else {
    $id = $_POST['id'];
    $evento = $_POST['title'];
    $fecha = $_POST['start'];
    $color = $_POST['color'];
    $end = $_POST['fecha_fin'];
    $descripcion = $_POST['descripcion'];

    if ($id == '') {
        $registrar = $registro->registrarEvento($evento, $fecha, $color, $descripcion, $end);

        // echo $registrar;

        if ($registrar == 1) {
            $mensaje = array('msg' => 'Evento registrado', 'estado' => true, 'tipo' => 'success');
        } else {
            $mensaje = array('msg' => 'Error al registrar el evento', 'estado' => False, 'tipo' => 'success');
        }
    } else {
        $registrar = $registro->modificarEvento($evento, $fecha, $color, $descripcion, $id, $end);

        // echo $registrar;

        if ($registrar == 1) {
            $mensaje = array('msg' => 'Evento Modificado', 'estado' => true, 'tipo' => 'success');
        } else {
            $mensaje = array('msg' => 'Error al modificar el evento', 'estado' => False, 'tipo' => 'success');
        }
    }




    echo json_encode($mensaje);
    die;
}

$listarEventos = $registro->consultarEventos();

echo json_encode($listarEventos, JSON_UNESCAPED_UNICODE);
