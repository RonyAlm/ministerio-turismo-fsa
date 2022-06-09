<?php
function obtenerProvincia()
{
    include_once("/xampp/htdocs/ministerio-turismo-fsa/admin/conexion.php");
    $conexionBD = BD::crearInstancia();
    $listaReferente = [];
    $query = $conexionBD->query("SELECT * FROM `provincia`");


    while ($filas = $query->fetch(PDO::FETCH_ASSOC)) {
        $listaReferente[] = $filas;

        // print_r($listaReferentes);
    }
    $jsonstring = json_encode($listaReferente);
    echo $jsonstring;
}
obtenerProvincia();
