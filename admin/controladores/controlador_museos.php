<?php

include_once("modelos/museos.php");
include_once("conexion.php");


class ControladorMuseos
{

    public function inicio()
    { //aca se muestra las tablas

        $consultaMuseo = new MuseoModelo();

        $tablaMuseo = $consultaMuseo->consultar();

        $datosEstadisticos = new estadistica();

        $cantidad_museos = $datosEstadisticos->cantidadMuseos();


        include_once("vistas/museos/inicio.php");
    }
    public function crear()
    {

        $select_tipo_museo = new MuseoModelo();

        $buscarSelectLocalidad = $select_tipo_museo->buscarSelectLocalidad();

        if ($_POST) {
            //print_r($_POST);

            $insertarMuseo = new MuseoModelo();


            $nombreMuseo = $_POST['nombreMuseo'];
            $diaHorarioMuseo = $_POST['diaHorarioMuseo'];
            $DescripcionMuseo = $_POST['DescripcionMuseo'];
            $idoneoMuseo = $_POST['idoneoMuseo'];

            $localidadMuseo = $_POST['localidadMuseo'];
            $domicilioMuseo = $_POST['domicilioMuseo'];

            $telefonoAgencia = $_POST['telefonoAgencia'];
            $telefonoFijoAgencia = $_POST['telefonoFijoAgencia'];
            $correoAgencia = $_POST['correoAgencia'];
            $facebookAgencia = $_POST['facebookAgencia'];
            $instagramAgencia = $_POST['instagramAgencia'];
            $twitterAgencia = $_POST['twitterAgencia'];
            $webAgencia = $_POST['webAgencia'];
            $otroAgencia = $_POST['otroAgencia'];

            $insertarMuseo->crear(
                $nombreMuseo,
                $diaHorarioMuseo,
                $DescripcionMuseo,
                $localidadMuseo,
                $domicilioMuseo,
                $telefonoAgencia,
                $telefonoFijoAgencia,
                $correoAgencia,
                $facebookAgencia,
                $instagramAgencia,
                $twitterAgencia,
                $webAgencia,
                $otroAgencia,
                $idoneoMuseo
            );

            header("Location:index2.php?controlador=museos&accion=inicio");
        }


        include_once("vistas/museos/crear.php");
    }
    public function editar()
    {

        $idMuseo = $_GET["id"];
        // print_r($idMuseo);

        $buscarMuseos = new MuseoModelo();

        $buscarSelectLocalidad = $buscarMuseos->buscarSelectLocalidad();

        //print_r("$idAgencia");
        /*----------BUSCA LOS POST QUE SE ENCUENTRA EN EDITAR.PHP PARA PODER EDITARLO----------*/

        if ($_POST) {
            // print_r($_POST);

            $EditarAgencia = new MuseoModelo();


            $idMuseo =  $_POST['museosID'];
            $nombreMuseo = $_POST['nombreMuseo'];
            $diaHorarioMuseo = $_POST['diaHorarioMuseo'];
            $DescripcionMuseo = $_POST['DescripcionMuseo'];
            $idoneoMuseo = $_POST['idoneoMuseo'];

            $idDireccion = $_POST['idDireccion'];
            $localidadMuseo = $_POST['localidadMuseo'];
            $domicilioMuseo = $_POST['domicilioMuseo'];

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
                $idMuseo,
                $nombreMuseo,
                $diaHorarioMuseo,
                $DescripcionMuseo,
                $localidadMuseo,
                $domicilioMuseo,
                $telefonoAgencia,
                $telefonoFijoAgencia,
                $correoAgencia,
                $facebookAgencia,
                $instagramAgencia,
                $twitterAgencia,
                $webAgencia,
                $otroAgencia,
                $idoneoMuseo,
                $idtelefonoAgencia,
                $idtelefonoFijoAgencia,
                $idcorreoAgencia,
                $idfacebookAgencia,
                $idinstagramAgencia,
                $idtwitterAgencia,
                $idwebAgencia,
                $idotroAgencia,
                $idDireccion
            );



            header("Location:index2.php?controlador=museos&accion=inicio");
        }


        /*----------BUSCA LOS ID Y LOS PONE EN EL FORMULARIO----------*/

        $contactosDeagencia = new ContactosAgencia();

        $contactosDeMuseos = new ContactosInfoMuseos();

        $agenciaTelefono = $contactosDeMuseos->consultarTelefonos($idMuseo);
        $agenciaTelefonoFijo = $contactosDeagencia->consultarTelefonosFijos($idMuseo);
        $agenciaCorreo = $contactosDeagencia->consultarCorreo($idMuseo);
        $agenciaFacebook = $contactosDeagencia->consultarFacebook($idMuseo);
        $agenciaInstagram = $contactosDeagencia->consultarInstagram($idMuseo);
        $agenciaTwitter = $contactosDeagencia->consultarTwitter($idMuseo);
        $agenciaWeb = $contactosDeagencia->consultarWeb($idMuseo);
        $agenciaOtro = $contactosDeagencia->consultarOtro($idMuseo);


        $buscarID = new MuseoModelo();

        $editar = $buscarID->buscar($idMuseo);

        $InsertarID = $buscarID->consultarID($idMuseo);


        include_once("vistas/museos/editar.php");
    }

    public function borrar()
    {
        //print_r($_GET);

        $idBorrar = $_GET["id"];
        $id_direccion = $_GET['idDireccion'];

        $borrarMuseos = new MuseoModelo();

        $IDBorrado = $borrarMuseos->borrar($idBorrar, $id_direccion);

        header("Location:index2.php?controlador=museos&accion=inicio");
    }

    public function info()
    {

        $id_agencia = $_GET['id'];

        $agenciaInfo = new MuseoModelo();

        $agenciasInfomacion = $agenciaInfo->buscar($id_agencia);


        $contactosDeagencia = new ContactosInfoMuseos();
        $agenciaTelefonoInfo = $contactosDeagencia->consultarTelefonos($id_agencia);
        $agenciaTelefonoFijo = $contactosDeagencia->consultarTelefonosFijos($id_agencia);
        $agenciaCorreo = $contactosDeagencia->consultarCorreo($id_agencia);
        $agenciaFacebook = $contactosDeagencia->consultarFacebook($id_agencia);
        $agenciaInstagram = $contactosDeagencia->consultarInstagram($id_agencia);
        $agenciaTwitter = $contactosDeagencia->consultarTwitter($id_agencia);
        $agenciaWeb = $contactosDeagencia->consultarWeb($id_agencia);
        $agenciaOtro = $contactosDeagencia->consultarOtro($id_agencia);

        include_once("vistas/museos/info.php");
    }

    public function sucursal()
    {

        $id_agencia = $_GET['id'];
    }
}
