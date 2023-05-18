<?php

include_once("modelos/transportes.php");
include_once("conexion.php");


class ControladorTransportes
{

    public function inicio()
    { //aca se muestra las tablas

        $consultaTransporte = new TransportesModelo();

        $tabla = $consultaTransporte->consultar();
        $datosEstadisticos = new estadistica();

        $cantidad_Transportes = $datosEstadisticos->cantidadTransportes();


        include_once("vistas/transportes/inicio.php");
    }

    public function crear()
    {
        // ESTÓ ES PARA LA AUDITORÍA
        global $accion, $controlador1;
        global $id;
        //

        $select_tipo_Transporte = new TransportesModelo();

        $buscarSelectLocalidad = $select_tipo_Transporte->buscarSelectLocalidad();
        $buscarSelectEstado = $select_tipo_Transporte->buscarSelectEstado();

        if ($_POST) {
            // print_r($_POST);

            $insertarTransporte = new TransportesModelo();

            $designacionTransportes = $_POST['designacionTransportes'];
            $ServiciosTransportes = $_POST['ServiciosTransportes'];
            $idoneoTransportes = $_POST['idoneoTransportes'];

            $rela_localidad_direccion = $_POST['localidadAgencia'];
            $domicilioTransporte = $_POST['domicilioTransporte'];

            $telefonoAgencia = $_POST['telefonoAgencia'];
            $telefonoFijoAgencia = $_POST['telefonoFijoAgencia'];
            $correoAgencia = $_POST['correoAgencia'];
            $facebookAgencia = $_POST['facebookAgencia'];
            $instagramAgencia = $_POST['instagramAgencia'];
            $twitterAgencia = $_POST['twitterAgencia'];
            $webAgencia = $_POST['webAgencia'];
            $otroAgencia = $_POST['otroAgencia'];

            $estadoAgencia = $_POST['estadoAgencia'];

            $insertarTransporte->crear(
                $designacionTransportes,
                $ServiciosTransportes,
                $rela_localidad_direccion,
                $domicilioTransporte,
                $telefonoAgencia,
                $telefonoFijoAgencia,
                $correoAgencia,
                $facebookAgencia,
                $instagramAgencia,
                $twitterAgencia,
                $webAgencia,
                $otroAgencia,
                $estadoAgencia,
                $idoneoTransportes
            );
            if ($insertarTransporte) {
                $insertarTransporte->trigger($accion, $id, $controlador1);
                // print_r($insertar);
                // print_r($usuario_crear);
                echo "<script>location.href='index2.php?controlador=transportes&accion=inicio';</script>";
            }

            echo "<script>location.href='index2.php?controlador=transportes&accion=inicio';</script>";
        }


        include_once("vistas/transportes/crear.php");
    }

    public function editar()
    {
        // ESTÓ ES PARA LA AUDITORÍA
        global $accion, $controlador1;
        global $id;
        //
        // echo '<pre>';
        // print_r($controlador1);
        // echo '</pre>';

        $idAgencia = $_GET["id"];

        $buscarTransportes = new TransportesModelo();

        $buscarSelectLocalidad = $buscarTransportes->buscarSelectLocalidad();
        $buscarSelectEstado = $buscarTransportes->buscarSelectEstado();

        //print_r("$idAgencia");
        /*----------BUSCA LOS POST QUE SE ENCUENTRA EN EDITAR.PHP PARA PODER EDITARLO----------*/

        if ($_POST) {
            $EditarAgencia = new TransportesModelo();
            // echo '<pre>';
            // print_r($_POST);
            // echo '</pre>';

            $tranposteID =  $_POST['tranposteID'];
            $descripcion_Transportes = $_POST['nombreTransporte'];

            $servicioTransporte = $_POST['servicioTransporte'];
            $idoneoTransporte = $_POST['idoneoTransporte'];


            $idDireccion = $_POST['agenciaDomicilioID'];
            $rela_localidad_direccion = $_POST['localidadAgencia'];

            $calle_direccion = $_POST['domicilioAgencia'];

            $idtelefonoAgencia = $_POST['agenciatelefonoID'];
            $telefonoAgencia = $_POST['telefonoAgencia'];

            $idtelefonoFijoAgencia = $_POST['telFijoID'];
            $telefonoFijoAgencia = $_POST['telefonoFijoAgencia'];

            $idcorreoAgencia = $_POST['agenciaCorreoID'];
            $correoAgencia = $_POST['correoAgencia'];

            $idfacebookAgencia = $_POST['agenciaFacebookID'];
            $facebookAgencia = $_POST['facebookAgencia'];

            $idinstagramAgencia = $_POST['agenciaInstagramID'];
            $instagramAgencia = $_POST['instagramAgencia'];

            $idtwitterAgencia = $_POST['agenciaTwitterID'];
            $twitterAgencia = $_POST['twitterAgencia'];

            $idwebAgencia = $_POST['agenciaWebID'];
            $webAgencia = $_POST['webAgencia'];

            $idotroAgencia = $_POST['agenciaOtroID'];
            $otroAgencia = $_POST['otroAgencia'];

            $idestadoAgencia = $_POST['agenciaEstadoID'];
            $estadoAgencia = $_POST['estadoAgencia'];

            $EditarAgencia->editar(
                $descripcion_Transportes,
                $servicioTransporte,
                $tranposteID,
                $idoneoTransporte,
                $rela_localidad_direccion,
                $calle_direccion,
                $telefonoAgencia,
                $telefonoFijoAgencia,
                $correoAgencia,
                $facebookAgencia,
                $instagramAgencia,
                $twitterAgencia,
                $webAgencia,
                $otroAgencia,
                $estadoAgencia,
                $idDireccion,
                $idtelefonoAgencia,
                $idtelefonoFijoAgencia,
                $idcorreoAgencia,
                $idfacebookAgencia,
                $idinstagramAgencia,
                $idtwitterAgencia,
                $idwebAgencia,
                $idotroAgencia,
                $idestadoAgencia
            );
            if ($EditarAgencia) {
                $EditarAgencia->trigger($accion, $id, $controlador1);
                // print_r($insertar);
                // print_r($usuario_crear);
                echo "<script>location.href='index2.php?controlador=Transportes&accion=inicio';</script>";
            }

            // header("Location:admin/index2.php?controlador=Transportes&accion=inicio");
            echo "<script>location.href='index2.php?controlador=Transportes&accion=inicio';</script>";
        }


        /*----------BUSCA LOS ID Y LOS PONE EN EL FORMULARIO----------*/

        $contactosDeagencia = new ContactosAgencia();

        $contactosDeagencia1 = new ContactosInfo();

        $agenciaTelefono = $contactosDeagencia1->consultarTelefonos($idAgencia);
        $agenciaTelefonoFijo = $contactosDeagencia->consultarTelefonosFijos($idAgencia);
        $agenciaCorreo = $contactosDeagencia->consultarCorreo($idAgencia);
        $agenciaFacebook = $contactosDeagencia->consultarFacebook($idAgencia);
        $agenciaInstagram = $contactosDeagencia->consultarInstagram($idAgencia);
        $agenciaTwitter = $contactosDeagencia->consultarTwitter($idAgencia);
        $agenciaWeb = $contactosDeagencia->consultarWeb($idAgencia);
        $agenciaOtro = $contactosDeagencia->consultarOtro($idAgencia);

        $buscarID = new TransportesModelo();

        $editar = $buscarID->buscar($idAgencia);

        $InsertarID = $buscarID->consultarID($idAgencia);


        include_once("vistas/Transportes/editar.php");
    }

    public function borrar()
    {
        //print_r($_GET);
        // ESTÓ ES PARA LA AUDITORÍA
        global $accion, $controlador1;
        global $id;
        //

        $idAgenciaBorrar = $_GET["id_transporte"];
        $id_direccion = $_GET['idDireccion'];

        $borrarTransportes = new TransportesModelo();

        $borrarTransportes->consultarID($idAgenciaBorrar);

        $borrarTransportes->borrar($idAgenciaBorrar, $id_direccion);
        if ($borrarTransportes) {
            $borrarTransportes->trigger($accion, $id, $controlador1);
            // print_r($insertar);
            // print_r($usuario_crear);
            echo "<script>location.href='index2.php?controlador=Transportes&accion=inicio';</script>";
        }

        header("Location:index2.php?controlador=Transportes&accion=inicio");
    }

    public function info()
    {
        $id_agencia = $_GET['id'];

        $agenciaInfo = new TransportesModelo();

        $TransportesInfomacion = $agenciaInfo->buscar($id_agencia);


        $contactosDeagencia = new ContactosInfo();
        $agenciaTelefonoInfo = $contactosDeagencia->consultarTelefonos($id_agencia);
        $agenciaTelefonoFijo = $contactosDeagencia->consultarTelefonosFijos($id_agencia);
        $agenciaCorreo = $contactosDeagencia->consultarCorreo($id_agencia);
        $agenciaFacebook = $contactosDeagencia->consultarFacebook($id_agencia);
        $agenciaInstagram = $contactosDeagencia->consultarInstagram($id_agencia);
        $agenciaTwitter = $contactosDeagencia->consultarTwitter($id_agencia);
        $agenciaWeb = $contactosDeagencia->consultarWeb($id_agencia);
        $agenciaOtro = $contactosDeagencia->consultarOtro($id_agencia);

        include_once("vistas/Transportes/info.php");
    }

    public function sucursal()
    {

        $id_agencia = $_GET['id'];
    }

    public function imprimir()
    {
        $consultaAgencia = new TransportesModelo();

        $tablaAgencia = $consultaAgencia->consultar();
        $datosEstadisticos = new estadistica();

        $cantidad_Transportes = $datosEstadisticos->cantidadTransportes();
        $cantidadTransportesHabilitadas = $datosEstadisticos->cantidadTransportesHabilitadas();


        include_once("vistas/Transportes/imprimir.php");
    }

    public function imprimirInfo()
    {
        $id_agencia = $_GET['id'];

        $agenciaInfo = new TransportesModelo();

        $TransportesInfomacion = $agenciaInfo->buscar($id_agencia);


        $contactosDeagencia = new ContactosInfo();
        $agenciaTelefonoInfo = $contactosDeagencia->consultarTelefonos($id_agencia);
        $agenciaTelefonoFijo = $contactosDeagencia->consultarTelefonosFijos($id_agencia);
        $agenciaCorreo = $contactosDeagencia->consultarCorreo($id_agencia);
        $agenciaFacebook = $contactosDeagencia->consultarFacebook($id_agencia);
        $agenciaInstagram = $contactosDeagencia->consultarInstagram($id_agencia);
        $agenciaTwitter = $contactosDeagencia->consultarTwitter($id_agencia);
        $agenciaWeb = $contactosDeagencia->consultarWeb($id_agencia);
        $agenciaOtro = $contactosDeagencia->consultarOtro($id_agencia);

        include_once("vistas/Transportes/invoice-print.php");
    }
}
