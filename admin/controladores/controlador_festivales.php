<?php

include_once("modelos/festivales.php");
include_once("conexion.php");


class ControladorFestivales
{

    public function inicio()
    { //aca se muestra las tablas

        $consulta = new FestivalesModelo();

        $tabla = $consulta->consultar();
        $tablaContacto = $consulta->consultarContactos();
        // $datosEstadisticos = new estadistica();

        // $cantidadFestivales = $datosEstadisticos->cantidadPiletas();
        // $cantidadPlayas = $datosEstadisticos->cantidadPlayas();
        // $cantidadCamping = $datosEstadisticos->cantidadCamping();
        // $cantidadParqueAcuaticos = $datosEstadisticos->cantidadParqueAcuaticos();


        include_once("vistas/festivales/inicio.php");
    }
    public function crear()
    {

        $select_tipo_servigeneral = new FestivalesModelo();

        $buscarSelectLocalidad = $select_tipo_servigeneral->buscarSelectLocalidad();
        $buscarSelectEstacion = $select_tipo_servigeneral->buscarSelectEstacion();
        $buscarSelectLugar = $select_tipo_servigeneral->buscarSelectLugar();
        $buscarSelectTipoServicio = $select_tipo_servigeneral->buscarSelectTipoServicio();

        if ($_POST) {
            //print_r($_POST);

            $insertar = new FestivalesModelo();


            $nombre = $_POST['nombre'];
            $descripcion = $_POST['descripcion'];
            $idoneo = $_POST['idoneo'];
            $fecha = $_POST['fecha'];

            $tipoServicio = $_POST['tipoServicio'];

            $localidad = $_POST['localidad'];

            $telefonoAgencia = $_POST['telefonoAgencia'];
            $telefonoFijoAgencia = $_POST['telefonoFijoAgencia'];
            $correoAgencia = $_POST['correoAgencia'];
            $facebookAgencia = $_POST['facebookAgencia'];
            $instagramAgencia = $_POST['instagramAgencia'];
            $twitterAgencia = $_POST['twitterAgencia'];
            $webAgencia = $_POST['webAgencia'];
            $otroAgencia = $_POST['otroAgencia'];





            $insertar->crear(
                $nombre,
                $descripcion,
                $idoneo,
                $fecha,
                $localidad,
                $tipoServicio,
                $telefonoAgencia,
                $telefonoFijoAgencia,
                $correoAgencia,
                $facebookAgencia,
                $instagramAgencia,
                $twitterAgencia,
                $webAgencia,
                $otroAgencia
            );
            // print_r($insertar);


            header("Location:index2.php?controlador=festivales&accion=inicio");
        }


        include_once("vistas/festivales/crear.php");
    }
    public function editar()
    {

        $id = $_GET["id"];

        $select_tipo_servigeneral = new FestivalesModelo();

        $buscarSelectLocalidad = $select_tipo_servigeneral->buscarSelectLocalidad();
        // $buscarSelectEstacion = $select_tipo_servigeneral->buscarSelectEstacion();
        // $buscarSelectLugar = $select_tipo_servigeneral->buscarSelectLugar();
        $buscarSelectTipoServicio = $select_tipo_servigeneral->buscarSelectTipoServicio();

        //print_r("$id");
        /*----------BUSCA LOS POST QUE SE ENCUENTRA EN EDITAR.PHP PARA PODER EDITARLO----------*/

        if ($_POST) {
            // print_r($_POST);
            $EditarAgencia = new FestivalesModelo();


            $id =  $_POST['nombreID'];
            $nombre = $_POST['nombre'];
            $descripcion = $_POST['descripcion'];
            $idoneo = $_POST['idoneo'];
            $fecha = $_POST['fecha'];




            $tipoServicioID = $_POST['tipoServicioID'];
            $tipoServicio = $_POST['tipoServicio'];

            $LocalidadID = $_POST['LocalidadID'];
            $localidad = $_POST['localidad'];


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
                $nombre,
                $descripcion,
                $id,
                $idoneo,
                $fecha,
                $LocalidadID,
                $localidad,
                $tipoServicioID,
                $tipoServicio,

                $telefonoAgencia,
                $telefonoFijoAgencia,
                $correoAgencia,
                $facebookAgencia,
                $instagramAgencia,
                $twitterAgencia,
                $webAgencia,
                $otroAgencia,

                $idtelefonoAgencia,
                $idtelefonoFijoAgencia,
                $idcorreoAgencia,
                $idfacebookAgencia,
                $idinstagramAgencia,
                $idtwitterAgencia,
                $idwebAgencia,
                $idotroAgencia
            );

            // print_r($EditarAgencia);



            // header("Location:?controlador=festivales&accion=inicio");
            echo "<script>location.href='index2.php?controlador=festivales&accion=inicio';</script>";
        }


        /*----------BUSCA LOS ID Y LOS PONE EN EL FORMULARIO----------*/

        $contactosDeagencia = new Contactos();

        $contactosDeagencia1 = new ContactosInfo();

        $agenciaTelefono = $contactosDeagencia1->consultarTelefonos($id);
        $agenciaTelefonoFijo = $contactosDeagencia->consultarTelefonosFijos($id);
        $agenciaCorreo = $contactosDeagencia->consultarCorreo($id);
        $agenciaFacebook = $contactosDeagencia->consultarFacebook($id);
        $agenciaInstagram = $contactosDeagencia->consultarInstagram($id);
        $agenciaTwitter = $contactosDeagencia->consultarTwitter($id);
        $agenciaWeb = $contactosDeagencia->consultarWeb($id);
        $agenciaOtro = $contactosDeagencia->consultarOtro($id);


        $buscarID = new FestivalesModelo();

        $editar = $buscarID->buscar($id);

        $InsertarID = $buscarID->consultarID($id);


        include_once("vistas/festivales/editar.php");
    }

    public function borrar()
    {
        //print_r($_GET);

        $idServigeneralBorrar = $_GET["id"];
        $id_direccion = $_GET['idDireccion'];

        $borrarAgencias = new FestivalesModelo();

        $buscarIDBorrado = $borrarAgencias->consultarID($idServigeneralBorrar);

        $borrado = $borrarAgencias->borrar($idServigeneralBorrar, $id_direccion);

        header("Location:index2.php?controlador=festivales&accion=inicio");
    }

    public function info()
    {
        $id = $_GET['id'];

        $info = new FestivalesModelo();

        $informacion = $info->buscar($id);


        $contactosDeagencia = new ContactosInfo();
        $agenciaTelefonoInfo = $contactosDeagencia->consultarTelefonos($id);
        $agenciaTelefonoFijo = $contactosDeagencia->consultarTelefonosFijos($id);
        $agenciaCorreo = $contactosDeagencia->consultarCorreo($id);
        $agenciaFacebook = $contactosDeagencia->consultarFacebook($id);
        $agenciaInstagram = $contactosDeagencia->consultarInstagram($id);
        $agenciaTwitter = $contactosDeagencia->consultarTwitter($id);
        $agenciaWeb = $contactosDeagencia->consultarWeb($id);
        $agenciaOtro = $contactosDeagencia->consultarOtro($id);

        include_once("vistas/festivales/info.php");
    }
}
