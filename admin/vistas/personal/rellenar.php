<?php

include_once("../../conexion.php");

// se crea la instancia de la BD
$conexionBD = BD::crearInstancia();
// se obtiene el POST que viene de selectDinamicoLiAr.js <- recursos-script
$idpersonal = $_POST["personal"];

// generamos el sql
$sql = $conexionBD->query("SELECT `id_licencias`, `fecha_ini`, `fecha_fin`, `dias_restante`, `estado`, `rela_personal` FROM `licencias` WHERE rela_personal='$idpersonal'");

// se crea el select que se va a rellenar en el inicio de personal para que el model muestre cant
// de licencias o art que tiene el personal
$cadena = "<label>SELECT 2 (paises)</label> 
			<select id='lista2' name='lista2'>";

while ($filas = $sql->fetch(PDO::FETCH_ASSOC)) {
    // $this->listaPersonal[] = $filas;
    $cadena = $cadena . '<option value=' . $filas['dias_restante'] . '>' . $filas['dias_restante'] . '</option>';

    print_r($filas);
}


echo  $cadena . "</select>";
