<?php
function obtenerProvincia()
{
    include_once("/xampp/htdocs/ministeriotur/admin/conexion.php");
    $conexionBD = BD::crearInstancia();
    $listaReferente = [];
    $query = $conexionBD->query("SELECT * FROM `provincia`");


    while ($filas = $query->fetch(PDO::FETCH_ASSOC)) {
        $listaReferentes[] = $filas;
        // print_r($listaReferentes);
    }
    $jsonstring = json_encode($listaReferente);
    echo $jsonstring;
}
obtenerProvincia();
