<?php
include_once("/xampp/htdocs/ministerio-turismo-fsa/admin/modelos/calendario.php");
include_once("/xampp/htdocs/ministerio-turismo-fsa/admin/conexion.php");

$eliminar = new CalendarioModelo();

$id = $_GET['id'];
// print_r($id);

$eliminacion = $eliminar->eliminarEvento($id);

// print_r($eliminacion);
// print_r($eliminar);

if ($eliminacion == 1) {
    $mensaje = array('msg' => 'Evento Eliminado', 'estado' => true, 'tipo' => 'success');
    // echo ($mensaje);
} else {
    $mensaje = array('msg' => 'Error al eliminar el evento', 'estado' => False, 'tipo' => 'danger');
    // echo ($mensaje);
}

// print_r($eliminacion);
// print_r($mensaje);
// echo ($mensaje);


echo json_encode($mensaje);
// echo json_encode($mensaje, JSON_UNESCAPED_UNICODE);
