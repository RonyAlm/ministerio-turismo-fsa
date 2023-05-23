<?php

session_start();

// include_once "controladores/controlador_login.php";

include_once("../conexion.php");

$conexion = BD::crearInstancia();

$id = $_SESSION['id'];
$usuario = $_SESSION['usuarios'];
$rol_id = $_SESSION['rol_id'];
$acceso = $_SESSION['tablas_acceso'];
$id_persona = $_SESSION['id_persona'];
$nombre = $_SESSION['nombre_persona'];
$apellido = $_SESSION['apellido_persona'];


if ($nombre) {
    $nombre = 2;
    /*---------------SE ACTUALIZA LA DIRECCION CON LA LOCALIDAD-------------------*/

    $sqlDireccion = $conexion->prepare("UPDATE `personales` SET `rela_tipo_estado`=$nombre
                                                WHERE rela_persona = $id_persona");
    $sqlDireccion->execute();
    // print_r($sqlDireccion);


} else {
    $nombre = 0;
    echo "mi nombre es otro " . $nombre;
}

session_destroy();

header("Location: ../index.php");
