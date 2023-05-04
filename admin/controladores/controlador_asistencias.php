<?php
include_once("modelos/asistencias.php");
include_once("conexion.php");

class ControladorAsistencias
{

    public function inicio()
    {
        //aca se muestra las tablas
        $consulta = new AsistenciaModelo();
        $tabla = $consulta->consultar();

        include_once("vistas/asistencia/inicio.php");
    }

    public function crear()
    {

        if ($_POST) {
            $insertar = new AsistenciaModelo();
            //     //print_r($_POST);

            $tipo       = $_FILES['dataCliente']['type'];
            $tamanio    = $_FILES['dataCliente']['size'];
            $archivotmp = $_FILES['dataCliente']['tmp_name'];
            $lineas     = file($archivotmp);

            $insertar->crear($lineas);
            // echo "<script>location.href='index2.php?controlador=asistencias&accion=inicio';</script>";
        }

        include_once("vistas/asistencia/crear.php");
    }
    public function imprimirpdf()
    {
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {

            $model = new AsistenciaModelo();
            $archivo = $_FILES['archivo']['tmp_name'];

            $summary = $model->generarResumen($archivo);
        }

        include_once("vistas/asistencia/imprimirpdf.php");
    }

    public function editar()
    {
    }

    public function borrar()
    {
        //print_r($_GET);

        $idAgenciaBorrar = $_GET["id"];
        $id_direccion = $_GET['idDireccion'];
        $idRazonSocial = $_GET['idRazonSocial'];

        $borrarAgencias = new AsistenciaModelo();

        $buscarIDBorrado = $borrarAgencias->consultarID($idAgenciaBorrar);

        // $borrado = $borrarAgencias->borrar($idAgenciaBorrar, $id_direccion, $idRazonSocial);

        header("Location:index2.php?controlador=agencias&accion=inicio");
    }

    public function info()
    {
        $id_agencia = $_GET['id'];

        $agenciaInfo = new AsistenciaModelo();

        // $agenciasInfomacion = $agenciaInfo->buscar($id_agencia);


        $contactosDeagencia = new ContactosInfo();
        $agenciaTelefonoInfo = $contactosDeagencia->consultarTelefonos($id_agencia);
        $agenciaTelefonoFijo = $contactosDeagencia->consultarTelefonosFijos($id_agencia);
        $agenciaCorreo = $contactosDeagencia->consultarCorreo($id_agencia);
        $agenciaFacebook = $contactosDeagencia->consultarFacebook($id_agencia);
        $agenciaInstagram = $contactosDeagencia->consultarInstagram($id_agencia);
        $agenciaTwitter = $contactosDeagencia->consultarTwitter($id_agencia);
        $agenciaWeb = $contactosDeagencia->consultarWeb($id_agencia);
        $agenciaOtro = $contactosDeagencia->consultarOtro($id_agencia);

        include_once("vistas/agencias/info.php");
    }

    public function sucursal()
    {

        $id_agencia = $_GET['id'];
    }

    public function imprimir()
    {
        $consulta = new AsistenciaModelo();

        $tabla = $consulta->consultar();




        include_once("vistas/asistencia/imprimir.php");
    }

    public function imprimirInfo()
    {


        include_once("vistas/agencias/invoice-print.php");
    }
}
