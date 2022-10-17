<?php

include_once("modelos/transporte.php");
include_once("conexion.php");


class ControladorTransporte
{
    public function inicio()
    { //aca se muestra las tablas

        $consulta = new TransporteModelo();

        $tabla = $consulta->consultar();
        // $datosEstadisticos = new estadistica();

        // $cantidadPiletas = $datosEstadisticos->cantidadPiletas();
        // $cantidadPlayas = $datosEstadisticos->cantidadPlayas();
        // $cantidadCamping = $datosEstadisticos->cantidadCamping();
        // $cantidadParqueAcuaticos = $datosEstadisticos->cantidadParqueAcuaticos();


        include_once("vistas/transporte/inicio.php");
    }
    public function select()
    {
        // $conexionBD = BD::crearInstancia();

        // $asdf = new TransporteModelo();
        // $traer = $asdf->obtenerProvincia();
        echo "hola";
    }
    public function crear()
    {

        $select = new TransporteModelo();

        $buscarSelectLocalidad = $select->buscarSelectLocalidad();
        $buscarSelectProvincia = $select->buscarSelectProvincia();
        $buscarSelectEmpresa = $select->buscarSelectEmpresa();


        if ($_POST) {
            // print_r($_POST);

            $insertar = new TransporteModelo();


            $empresas = $_POST['empresas'];
            $origen = $_POST['origen'];
            $destino = $_POST['destino'];

            $horarioSalida = $_POST['horarioSalida'];
            $horarioLlegada = $_POST['horarioLlegada'];

            $observacionTransporte = $_POST['observacionTransporte'];


            $insertar->crear(
                $empresas,
                $origen,
                $destino,
                $horarioSalida,
                $horarioLlegada,
                $observacionTransporte
            );

            // print_r($datos);
            echo "<script>location.href='index2.php?controlador=transporte&accion=inicio';</script>";
            // header("Location:index2.php?controlador=transporte&accion=inicio");
        }


        include_once("vistas/transporte/crear.php");
    }
    public function editar()
    {

        $id = $_GET["id"];

        $select_tipo_servigeneral = new TransporteModelo();

        $buscarSelectLocalidad = $select_tipo_servigeneral->buscarSelectLocalidad();
        $buscarSelectEstacion = $select_tipo_servigeneral->buscarSelectEstacion();
        $buscarSelectLugar = $select_tipo_servigeneral->buscarSelectLugar();
        $buscarSelectTipoServicio = $select_tipo_servigeneral->buscarSelectTipoServicio();

        //print_r("$id");
        /*----------BUSCA LOS POST QUE SE ENCUENTRA EN EDITAR.PHP PARA PODER EDITARLO----------*/

        if ($_POST) {
            $EditarAgencia = new TransporteModelo();


            $id =  $_POST['nombreID'];
            $nombre = $_POST['nombre'];
            $descripcion = $_POST['descripcion'];
            $idoneo = $_POST['idoneo'];

            $tipoServiGeneralID = $_POST['tipoServiGeneralID'];
            $tipoServiGeneral = $_POST['tipoServiGeneral'];

            $estacionID = $_POST['estacionID'];
            $estacion = $_POST['estacion'];

            $tipoServicioID = $_POST['tipoServicioID'];
            $tipoServicio = $_POST['tipoServicio'];

            $domicilioID = $_POST['domicilioID'];
            $localidad = $_POST['localidad'];
            $domicilio = $_POST['domicilio'];


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
                $localidad,
                $domicilio,
                $tipoServicioID,
                $tipoServicio,
                $estacionID,
                $estacion,
                $tipoServiGeneralID,
                $tipoServiGeneral,

                $telefonoAgencia,
                $telefonoFijoAgencia,
                $correoAgencia,
                $facebookAgencia,
                $instagramAgencia,
                $twitterAgencia,
                $webAgencia,
                $otroAgencia,

                $domicilioID,
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

            echo "<script>location.href='index2.php?controlador=transporte&accion=inicio';</script>";

            // header("Location:index2.php?controlador=servigenerales&accion=inicio");
        }


        /*----------BUSCA LOS ID Y LOS PONE EN EL FORMULARIO----------*/

        $contactosDeagencia = new ContactosAgencia();

        $contactosDeagencia1 = new ContactosInfo();

        $agenciaTelefono = $contactosDeagencia1->consultarTelefonos($id);
        $agenciaTelefonoFijo = $contactosDeagencia->consultarTelefonosFijos($id);
        $agenciaCorreo = $contactosDeagencia->consultarCorreo($id);
        $agenciaFacebook = $contactosDeagencia->consultarFacebook($id);
        $agenciaInstagram = $contactosDeagencia->consultarInstagram($id);
        $agenciaTwitter = $contactosDeagencia->consultarTwitter($id);
        $agenciaWeb = $contactosDeagencia->consultarWeb($id);
        $agenciaOtro = $contactosDeagencia->consultarOtro($id);


        $buscarID = new TransporteModelo();

        $editar = $buscarID->buscar($id);

        $InsertarID = $buscarID->consultarID($id);


        include_once("vistas/servigenerales/editar.php");
    }

    public function borrar()
    {
        //print_r($_GET);

        $idServigeneralBorrar = $_GET["id"];
        $id_direccion = $_GET['idDireccion'];

        $borrarAgencias = new TransporteModelo();

        $buscarIDBorrado = $borrarAgencias->consultar($idServigeneralBorrar);

        $borrado = $borrarAgencias->borrar($idServigeneralBorrar, $id_direccion);

        echo "<script>location.href='index2.php?controlador=transporte&accion=inicio';</script>";

        // header("Location:index2.php?controlador=servigenerales&accion=inicio");
    }

    public function info()
    {
        $id = $_GET['id'];

        $info = new TransporteModelo();

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

        include_once("vistas/servigenerales/info.php");
    }
}
