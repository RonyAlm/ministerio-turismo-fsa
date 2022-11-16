<?php

include_once("../../conexion.php");

// se crea la instancia de la BD
$conexionBD = BD::crearInstancia();
// se obtiene el POST que viene de selectDinamicoLiAr.js <- recursos-script
$idpersonal = $_POST["personal"];

// generamos el sql
$sql = $conexionBD->query("SELECT id_razon_particular,fecha_ini_razonparticular, COUNT(id_razon_particular) cantidad
FROM `razon_particular` 
WHERE rela_personal= '$idpersonal'");

// se crea el select que se va a rellenar en el inicio de personal para que el model muestre cant
// de licencias o art que tiene el personal
$cadena = "<label>Cantidad de Razones Particulares</label> 
			<select id='listaArt' name='listaArt'>";

while ($filas = $sql->fetch(PDO::FETCH_ASSOC)) {

    $cadena = $cadena . '<option value=' . $filas['id_razon_particular'] . '>' . $filas['cantidad'] . '</option>';
}


echo  $cadena . "</select>";
