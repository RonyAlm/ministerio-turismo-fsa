<?php
include_once("../../modelos/calendario.php");
include_once("../../conexion.php");
session_start();

$eliminar = new CalendarioModelo();


if (!isset($_SESSION['id'])) {
    header("Location: index.php");
}
$ids = $_SESSION['id'];
$usuario = $_SESSION['usuarios'];
$rol_id = $_SESSION['rol_id'];

$id = $_GET['id'];
// print_r($ids);
// echo ($ids);

if ($rol_id == 3 or $rol_id == 1) {
    $eliminacion = $eliminar->eliminarEvento($id);

    // print_r($eliminacion);
    // print_r($eliminar);

    if ($eliminacion == 1) {
        $mensaje = array('msg' => 'Evento Eliminado', 'estado' => true, 'tipo' => 'success');
    } else {
        $mensaje = array('msg' => 'Error al eliminar el evento', 'estado' => False, 'tipo' => 'danger');
        // echo ($mensaje);
    }
} else {
    $mensaje = array('msg' => 'Error al eliminar el evento', 'estado' => False, 'tipo' => 'danger');
}







echo json_encode($mensaje);
// echo json_encode($mensaje, JSON_UNESCAPED_UNICODE);
