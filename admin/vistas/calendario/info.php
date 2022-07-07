<?php
include_once("../../modelos/calendario.php");
include_once("../../conexion.php");

$drop = new CalendarioModelo();

$id = $_POST['id'];
$fecha = $_POST['fecha'];
$end = $_POST['fecha_fin'];

$eventoDrop = $drop->dropEvento($id, $fecha, $end);

if ($eventoDrop == 1) {
    $mensaje = array('msg' => 'Evento modificado', 'estado' => true, 'tipo' => 'success');
} else {
    $mensaje = array('msg' => 'Error al modificar el evento', 'estado' => False, 'tipo' => 'danger');
}

echo json_encode($mensaje);
