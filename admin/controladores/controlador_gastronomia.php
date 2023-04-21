<?php

include_once("modelos/gastronomia.php");
include_once("conexion.php");


class ControladorGastronomia
{

    public function inicio()
    { //aca se muestra las tablas


        global $accion, $controlador1;

        // Ejemplo: si la acción es "editar", ejecutamos el método "editar()"
        if ($accion == 'inicio') {
            // echo "esto es un: " . $accion . " y el controlador es: " . $controlador1;
        }


        $consulta = new GastronomiaModelo();

        $tabla = $consulta->consultar();



        include_once("vistas/gastronomia/inicio.php");
    }
    public function llamarAccion()
    {
    }

    public function crear()
    {
        global $accion, $controlador1;
        global $id;

        // Ejemplo: si la acción es "editar", ejecutamos el método "editar()"
        if ($accion == 'crear') {
            // echo "esto es un " . $accion . " y el id es: " . $id;
        }

        $select_tipo_agencia = new GastronomiaModelo();

        $buscarSelectLocalidad = $select_tipo_agencia->buscarSelectLocalidad();


        if ($_POST) {
            // print_r($_POST);

            $insertar = new GastronomiaModelo();

            $usuario_crear = $_POST['usuario_crear'];

            $designacion = $_POST['designacion'];
            $diayhora = $_POST['diayhora'];
            $observacion = $_POST['observacion'];
            $caracteristicas_gastro = $_POST['caracteristicas_gastro'];

            // $idoneoAgencia = $_POST['idoneoAgencia'];

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
            // echo ($usuario_crear);


            $insertar->crear(
                $designacion,
                $diayhora,
                $observacion,
                $caracteristicas_gastro,
                $rela_localidad_direccion,
                $calle_direccion,
                $telefonoAgencia,
                $telefonoFijoAgencia,
                $correoAgencia,
                $facebookAgencia,
                $instagramAgencia,
                $twitterAgencia,
                $webAgencia,
                $otroAgencia
            );
            if ($insertar) {
                $insertar->trigger($accion, $id, $controlador1);
                // print_r($insertar);
                // print_r($usuario_crear);
                // echo "<script>location.href='index2.php?controlador=gastronomia&accion=inicio';</script>";
            }

            // echo "<script>location.href='index2.php?controlador=gastronomia&accion=inicio';</script>";
        }


        include_once("vistas/gastronomia/crear.php");
    }

    public function editar()
    {

        global $accion, $controlador1;
        global $id;

        // Ejemplo: si la acción es "editar", ejecutamos el método "editar()"
        if ($accion == 'editar') {
            // echo "esto es un " . $accion . " y el id es: " . $id;
        }

        $idAgencia = $_GET["id"];

        $buscarAgencias = new GastronomiaModelo();

        $buscarSelectLocalidad = $buscarAgencias->buscarSelectLocalidad();
        $buscarSelectEstado = $buscarAgencias->buscarSelectEstado();

        //print_r("$idAgencia");
        /*----------BUSCA LOS POST QUE SE ENCUENTRA EN EDITAR.PHP PARA PODER EDITARLO----------*/

        if ($_POST) {
            // print_r($_POST);
            $EditarAgencia = new GastronomiaModelo();

            $designacionID =  $_POST['designacionID'];
            $designacion = $_POST['designacion'];
            $observacion = $_POST['observacion'];
            $diayhora = $_POST['diayhora'];
            $caracteristicas_gastro = $_POST['caracteristicas_gastro'];

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
                $designacion,
                $observacion,
                $diayhora,
                $caracteristicas_gastro,
                $designacionID,
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
                // print_r($EditarAgencia);
                // print_r($usuario_crear);
                // echo "<script>location.href='index2.php?controlador=gastronomia&accion=inicio';</script>";
            }


            // header("Location:admin/index2.php?controlador=agencias&accion=inicio");
            // echo "<script>location.href='index2.php?controlador=gastronomia&accion=inicio';</script>";
        }


        /*----------BUSCA LOS ID Y LOS PONE EN EL FORMULARIO----------*/

        $contactosDeagencia = new ContactosGastronomia();

        $contactosDeagencia1 = new ContactosInfo();

        $agenciaTelefono = $contactosDeagencia1->consultarTelefonos($idAgencia);
        $agenciaTelefonoFijo = $contactosDeagencia->consultarTelefonosFijos($idAgencia);
        $agenciaCorreo = $contactosDeagencia->consultarCorreo($idAgencia);
        $agenciaFacebook = $contactosDeagencia->consultarFacebook($idAgencia);
        $agenciaInstagram = $contactosDeagencia->consultarInstagram($idAgencia);
        $agenciaTwitter = $contactosDeagencia->consultarTwitter($idAgencia);
        $agenciaWeb = $contactosDeagencia->consultarWeb($idAgencia);
        $agenciaOtro = $contactosDeagencia->consultarOtro($idAgencia);


        $buscarID = new GastronomiaModelo();

        $editar = $buscarID->buscar($idAgencia);

        $InsertarID = $buscarID->consultarID($idAgencia);


        include_once("vistas/gastronomia/editar.php");
    }

    public function borrar()
    {
        //print_r($_GET);
        global $accion, $controlador1;
        global $id;

        // Ejemplo: si la acción es "editar", ejecutamos el método "editar()"
        if ($accion == 'borrar') {
            // echo "esto es un " . $accion . " y el id es: " . $id;
        }

        $idAgenciaBorrar = $_GET["id"];
        $id_direccion = $_GET['idDireccion'];

        $borrarAgencias = new GastronomiaModelo();

        $buscarIDBorrado = $borrarAgencias->consultarID($idAgenciaBorrar);

        $borrado = $borrarAgencias->borrar($idAgenciaBorrar, $id_direccion);
        if ($borrarAgencias) {
            $borrarAgencias->trigger($accion, $id, $controlador1);
            print_r($borrarAgencias);

            // echo "<script>location.href='index2.php?controlador=gastronomia&accion=inicio';</script>";
        }

        // header("Location:index2.php?controlador=gastronomia&accion=inicio");
        // echo "<script>location.href='index2.php?controlador=gastronomia&accion=inicio';</script>";
    }

    public function info()
    {
        $id_agencia = $_GET['id'];

        $agenciaInfo = new GastronomiaModelo();

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

        include_once("vistas/gastronomia/info.php");
    }

    public function sucursal()
    {

        $id_agencia = $_GET['id'];
    }

    public function imprimir()
    {
        $consultaAgencia = new GastronomiaModelo();

        $tablaAgencia = $consultaAgencia->consultar();
        $datosEstadisticos = new estadistica();

        $cantidad_agencias = $datosEstadisticos->cantidadAgencias();
        $cantidadAgenciasHabilitadas = $datosEstadisticos->cantidadAgenciasHabilitadas();


        include_once("vistas/gastronomia/imprimir.php");
    }

    public function imprimirInfo()
    {
        $id_agencia = $_GET['id'];

        $agenciaInfo = new GastronomiaModelo();

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

        include_once("vistas/gastronomia/invoice-print.php");
    }
}
