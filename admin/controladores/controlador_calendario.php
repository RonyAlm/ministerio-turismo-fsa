<?php
include_once("modelos/calendario.php");
include_once("conexion.php");


class ControladorCalendario
{

    public function inicio()
    {
        // header('Context-Type: application/json');
        // $consultas = new CalendarioModelo();

        // $consultar = $consultas->consultarEventos();


        // echo json_encode($consultar);

        include_once("vistas/calendario/inicio.php");
    }

    public function crear()
    {
        $registro = new CalendarioModelo();

        if (empty($_POST['title']) || empty($_POST['start']) || empty($_POST['color'])) {
            $mensaje = array('msg' => 'Todos los campos son requeridos', 'estado' => false, 'tipo' => 'warning');
        } else {
            $evento = $_POST['title'];
            $fecha = $_POST['start'];
            $color = $_POST['color'];

            //$registrar = $registro->registrarEvento($evento, $fecha, $color);

            //print_r($registrar);
        }
    }
}
