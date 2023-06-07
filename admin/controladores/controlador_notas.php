<?php

include_once("modelos/notas.php");
include_once("conexion.php");


class ControladorNotas
{

    public function inicio()
    { //aca se muestra las tablas

        $consultaTransporte = new NotasModelo();

        $tabla = $consultaTransporte->consultar();
        $datosEstadisticos = new estadistica();

        // $cantidad_notas = $datosEstadisticos->cantidadnotas();


        include_once("vistas/notas/inicio.php");
    }

    public function crear()
    {
        // ESTÓ ES PARA LA AUDITORÍA
        global $accion, $controlador1;
        global $id;
        //

        $select_busquedas = new NotasModelo();

        $buscarSelectLocalidad = $select_busquedas->buscarSelectLocalidad();
        $buscarSelectMotivo = $select_busquedas->buscarSelectMotivo();
        $buscarSelectOrganismos = $select_busquedas->buscarSelectOrganismos();

        if ($_POST) {
            print_r($_POST);

            $insertarTransporte = new NotasModelo();

            $fecha_ingreso = $_POST['fecha_ingreso'];
            $organismos = $_POST['organismos'];
            $tipo_motivo = $_POST['tipo_motivo'];
            $numero_nota = $_POST['numero_nota'];
            $remitente = $_POST['remitente'];
            $descripcion_motivo = $_POST['descripcion_motivo'];
            $respuesta_notas = $_POST['respuesta_notas'];

            $rela_localidad_direccion = $_POST['localidad'];
            $domicilioTransporte = $_POST['domicilio'];

            $telefonoAgencia = $_POST['telefonoAgencia'];
            $telefonoFijoAgencia = $_POST['telefonoFijoAgencia'];
            $correoAgencia = $_POST['correoAgencia'];
            $facebookAgencia = $_POST['facebookAgencia'];
            $instagramAgencia = $_POST['instagramAgencia'];
            $twitterAgencia = $_POST['twitterAgencia'];
            $webAgencia = $_POST['webAgencia'];
            $otroAgencia = $_POST['otroAgencia'];

            $insertarTransporte->crear(
                $fecha_ingreso,
                $organismos,
                $tipo_motivo,
                $numero_nota,
                $remitente,
                $descripcion_motivo,
                $respuesta_notas,
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
            );
            if ($insertarTransporte) {
                $insertarTransporte->trigger($accion, $id, $controlador1);
                // print_r($insertar);
                // print_r($usuario_crear);
                // echo "<script>location.href='index2.php?controlador=notas&accion=inicio';</script>";
            }

            // echo "<script>location.href='index2.php?controlador=notas&accion=inicio';</script>";
        }


        include_once("vistas/notas/crear.php");
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

        $buscarnotas = new NotasModelo();

        $buscarSelectLocalidad = $buscarnotas->buscarSelectLocalidad();
        $buscarSelectMotivo = $buscarnotas->buscarSelectMotivo();
        $buscarSelectOrganismos = $buscarnotas->buscarSelectOrganismos();

        //print_r("$idAgencia");
        /*----------BUSCA LOS POST QUE SE ENCUENTRA EN EDITAR.PHP PARA PODER EDITARLO----------*/

        if ($_POST) {
            $EditarAgencia = new NotasModelo();
            // echo '<pre>';
            // print_r($_POST);
            // echo '</pre>';

            $notasID =  $_POST['notasID'];
            $fecha_ingreso = $_POST['fecha_ingreso'];
            $numero_nota = $_POST['numero_nota'];
            $remitente = $_POST['remitente'];
            $descripcion_motivo = $_POST['descripcion_motivo'];
            $respuesta_notas = $_POST['respuesta_notas'];

            $organismoID = $_POST['organismoID'];
            $organismos = $_POST['organismos'];

            $motivoID = $_POST['motivoID'];
            $tipo_motivo = $_POST['tipo_motivo'];


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


            $EditarAgencia->editar(
                $fecha_ingreso,
                $organismoID,
                $notasID,
                $organismos,
                $numero_nota,
                $remitente,
                $motivoID,
                $tipo_motivo,
                $descripcion_motivo,
                $respuesta_notas,
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
                $idDireccion,
                $idtelefonoAgencia,
                $idtelefonoFijoAgencia,
                $idcorreoAgencia,
                $idfacebookAgencia,
                $idinstagramAgencia,
                $idtwitterAgencia,
                $idwebAgencia,
                $idotroAgencia
            );
            if ($EditarAgencia) {
                $EditarAgencia->trigger($accion, $id, $controlador1);

                echo "<script>location.href='index2.php?controlador=notas&accion=inicio';</script>";
            }

            echo "<script>location.href='index2.php?controlador=notas&accion=inicio';</script>";
        }


        /*----------BUSCA LOS ID Y LOS PONE EN EL FORMULARIO----------*/

        $contactosDeagencia = new ContactosAgencia();

        $contactosDeagencia1 = new ContactosInfoNotas();

        $agenciaTelefono = $contactosDeagencia1->consultarTelefonos($idAgencia);
        $agenciaTelefonoFijo = $contactosDeagencia->consultarTelefonosFijos($idAgencia);
        $agenciaCorreo = $contactosDeagencia->consultarCorreo($idAgencia);
        $agenciaFacebook = $contactosDeagencia->consultarFacebook($idAgencia);
        $agenciaInstagram = $contactosDeagencia->consultarInstagram($idAgencia);
        $agenciaTwitter = $contactosDeagencia->consultarTwitter($idAgencia);
        $agenciaWeb = $contactosDeagencia->consultarWeb($idAgencia);
        $agenciaOtro = $contactosDeagencia->consultarOtro($idAgencia);

        $buscarID = new NotasModelo();

        $editar = $buscarID->buscar($idAgencia);

        $InsertarID = $buscarID->buscar($idAgencia);


        include_once("vistas/notas/editar.php");
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

        $borrarnotas = new NotasModelo();

        $borrarnotas->consultarID($idAgenciaBorrar);

        $borrarnotas->borrar($idAgenciaBorrar, $id_direccion);
        if ($borrarnotas) {
            $borrarnotas->trigger($accion, $id, $controlador1);
            // print_r($insertar);
            // print_r($usuario_crear);
            echo "<script>location.href='index2.php?controlador=notas&accion=inicio';</script>";
        }

        header("Location:index2.php?controlador=notas&accion=inicio");
    }

    public function info()
    {
        $id_agencia = $_GET['id'];

        $agenciaInfo = new NotasModelo();

        $notasInfomacion = $agenciaInfo->buscar($id_agencia);


        $contactosDeagencia = new ContactosInfoNotas();
        $agenciaTelefonoInfo = $contactosDeagencia->consultarTelefonos($id_agencia);
        $agenciaTelefonoFijo = $contactosDeagencia->consultarTelefonosFijos($id_agencia);
        $agenciaCorreo = $contactosDeagencia->consultarCorreo($id_agencia);
        $agenciaFacebook = $contactosDeagencia->consultarFacebook($id_agencia);
        $agenciaInstagram = $contactosDeagencia->consultarInstagram($id_agencia);
        $agenciaTwitter = $contactosDeagencia->consultarTwitter($id_agencia);
        $agenciaWeb = $contactosDeagencia->consultarWeb($id_agencia);
        $agenciaOtro = $contactosDeagencia->consultarOtro($id_agencia);

        include_once("vistas/notas/info.php");
    }


    public function imprimir()
    {
        $consultaAgencia = new NotasModelo();

        $tablaAgencia = $consultaAgencia->paraImprimir();
        $datosEstadisticos = new estadistica();

        // $cantidad_notas = $datosEstadisticos->cantidadnotas();
        // $cantidadnotasHabilitadas = $datosEstadisticos->cantidadnotasHabilitadas();


        include_once("vistas/notas/imprimir.php");
    }

    public function imprimirInfo()
    {
        $id_agencia = $_GET['id'];

        $agenciaInfo = new NotasModelo();

        $notasInfomacion = $agenciaInfo->buscar($id_agencia);


        $contactosDeagencia = new ContactosInfoNotas();
        $agenciaTelefonoInfo = $contactosDeagencia->consultarTelefonos($id_agencia);
        $agenciaTelefonoFijo = $contactosDeagencia->consultarTelefonosFijos($id_agencia);
        $agenciaCorreo = $contactosDeagencia->consultarCorreo($id_agencia);
        $agenciaFacebook = $contactosDeagencia->consultarFacebook($id_agencia);
        $agenciaInstagram = $contactosDeagencia->consultarInstagram($id_agencia);
        $agenciaTwitter = $contactosDeagencia->consultarTwitter($id_agencia);
        $agenciaWeb = $contactosDeagencia->consultarWeb($id_agencia);
        $agenciaOtro = $contactosDeagencia->consultarOtro($id_agencia);

        include_once("vistas/notas/invoice-print.php");
    }
}
