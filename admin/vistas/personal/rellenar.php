<?php

include_once("../../conexion.php");

$conexionBD = BD::crearInstancia();

$idpersonal = $_POST["personal"];

// echo "el id es " . $idpersonal;

$sql = $conexionBD->query("SELECT `id_licencias`, `fecha_ini`, `fecha_fin`, `dias_restante`, `estado`, `rela_personal` FROM `licencias` WHERE rela_personal='$idpersonal'");


$cadena = "<label>SELECT 2 (paises)</label> 
			<select id='lista2' name='lista2'>";

while ($filas = $sql->fetch(PDO::FETCH_ASSOC)) {
    // $this->listaPersonal[] = $filas;
    $cadena = $cadena . '<option value=' . $filas['dias_restante'] . '>' . $filas['dias_restante'] . '</option>';

    print_r($filas);
}


echo  $cadena . "</select>";
