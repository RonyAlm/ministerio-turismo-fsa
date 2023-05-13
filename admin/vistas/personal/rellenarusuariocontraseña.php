<?php
include_once("../../conexion.php");
// se crea la instancia de la BD
$conexionBD = BD::crearInstancia();
// se obtiene el POST que viene de contraseñaTablas.js <- recursos-script
$id_personalesA = $_POST["id_personalesA"]; //se obtiene el valor de * var id_personalesA = $("#usuario").val();
$listaPersonal = array();
// generamos el sql
$sql = $conexionBD->query("SELECT * FROM `usuario_contra` u
INNER JOIN roles r on r.id_roles = u.rela_rol_id
INNER JOIN tablas t on t.id_tablas = u.rela_tablas
WHERE u.id_usuario = $id_personalesA");
while ($filas = $sql->fetch(PDO::FETCH_ASSOC)) {
    $listaPersonal[] = $filas;
}
// Acceder al primer elemento del array
$primerElemento = $listaPersonal[0];
// Devolver los datos en formato JSON
echo json_encode($primerElemento);
