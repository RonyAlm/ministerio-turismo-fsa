<?php

include_once("modelos/agencias.php");
include_once("conexion.php");


class ControladorAgencias
{

    public function inicio()
    { //aca se muestra las tablas

        $consultaAgencia = new AgenciaModelo();

        $tablaAgencia = $consultaAgencia->consultar();
        $datosEstadisticos = new estadistica();

        $cantidad_agencias = $datosEstadisticos->cantidadAgencias();
        $cantidadAgenciasHabilitadas = $datosEstadisticos->cantidadAgenciasHabilitadas();


        include_once("vistas/agencias/inicio.php");
    }
    public function crear()
    {

        $select_tipo_agencia = new AgenciaModelo();

        $buscarSelectLocalidad = $select_tipo_agencia->buscarSelectLocalidad();
        $buscarSelectEstado = $select_tipo_agencia->buscarSelectEstado();

        if ($_POST) {
            //print_r($_POST);

            $insertarAgencia = new AgenciaModelo();


            $descripcion_agencias = $_POST['nombreAgencia'];
            $matricula_agencia = $_POST['matriculaAgencia'];
            $legajo_agencia = $_POST['legajoAgencia'];
            $cuit_agencia = $_POST['cuitAgencia'];
            $categoria_agencia = $_POST['categoriaAgencia'];
            $idoneoAgencia = $_POST['idoneoAgencia'];

            $razonsocial = $_POST['razonsocialAgencia'];

            $rela_localidad_direccion = $_POST['localidadAgencia'];
            $calle_direccion = $_POST['domicilioAgencia'];

            $telefonoAgencia = $_POST['telefonoAgencia'];
            $telefonoFijoAgencia = $_POST['telefonoFijoAgencia'];
            $correoAgencia = $_POST['correoAgencia'];
            $facebookAgencia = $_POST['facebookAgencia'];
            $instagramAgencia = $_POST['instagramAgencia'];
            $twitterAgencia = $_POST['twitterAgencia'];
            $webAgencia = $_POST['webAgencia'];
            $otroAgencia = $_POST['otroAgencia'];

            $estadoAgencia = $_POST['estadoAgencia'];





            $insertarAgencia->crear(
                $descripcion_agencias,
                $matricula_agencia,
                $legajo_agencia,
                $cuit_agencia,
                $categoria_agencia,
                $rela_localidad_direccion,
                $calle_direccion,
                $razonsocial,
                $telefonoAgencia,
                $telefonoFijoAgencia,
                $correoAgencia,
                $facebookAgencia,
                $instagramAgencia,
                $twitterAgencia,
                $webAgencia,
                $otroAgencia,
                $estadoAgencia,
                $idoneoAgencia
            );


            header("Location:index2.php?controlador=agencias&accion=inicio");
        }


        include_once("vistas/agencias/crear.php");
    }
    public function editar()
    {

        $idAgencia = $_GET["id"];

        $buscarAgencias = new AgenciaModelo();

        $buscarSelectLocalidad = $buscarAgencias->buscarSelectLocalidad();
        $buscarSelectEstado = $buscarAgencias->buscarSelectEstado();

        //print_r("$idAgencia");
        /*----------BUSCA LOS POST QUE SE ENCUENTRA EN EDITAR.PHP PARA PODER EDITARLO----------*/

        if ($_POST) {
            $EditarAgencia = new AgenciaModelo();


            $idAgencia =  $_POST['agenciaID'];
            $descripcion_agencias = $_POST['nombreAgencia'];
            $matricula_agencia = $_POST['matriculaAgencia'];
            $legajo_agencia = $_POST['legajoAgencia'];
            $cuit_agencia = $_POST['cuitAgencia'];
            $categoria_agencia = $_POST['categoriaAgencia'];
            $idoneoAgencia = $_POST['idoneoAgencia'];

            $idRazonSocial = $_POST['agenciaRazonID'];
            $razonsocial = $_POST['razonsocialAgencia'];

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
                $descripcion_agencias,
                $matricula_agencia,
                $legajo_agencia,
                $cuit_agencia,
                $categoria_agencia,
                $idAgencia,
                $idoneoAgencia,
                $rela_localidad_direccion,
                $calle_direccion,
                $razonsocial,
                $telefonoAgencia,
                $telefonoFijoAgencia,
                $correoAgencia,
                $facebookAgencia,
                $instagramAgencia,
                $twitterAgencia,
                $webAgencia,
                $otroAgencia,
                $estadoAgencia,

                $idRazonSocial,
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

            // print_r($EditarAgencia);



            header("Location:admin/index2.php?controlador=agencias&accion=inicio");
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


        $buscarID = new AgenciaModelo();

        $editar = $buscarID->buscar($idAgencia);

        $InsertarID = $buscarID->consultarID($idAgencia);


        include_once("vistas/agencias/editar.php");
    }

    public function borrar()
    {
        //print_r($_GET);

        $idAgenciaBorrar = $_GET["id"];
        $id_direccion = $_GET['idDireccion'];
        $idRazonSocial = $_GET['idRazonSocial'];

        $borrarAgencias = new AgenciaModelo();

        $buscarIDBorrado = $borrarAgencias->consultarID($idAgenciaBorrar);

        $borrado = $borrarAgencias->borrar($idAgenciaBorrar, $id_direccion, $idRazonSocial);

        header("Location:index2.php?controlador=agencias&accion=inicio");
    }

    public function info()
    {
        $id_agencia = $_GET['id'];

        $agenciaInfo = new AgenciaModelo();

        $agenciasInfomacion = $agenciaInfo->buscar($id_agencia);


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
}
