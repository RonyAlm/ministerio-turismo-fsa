<?php

include_once("modelos/asistencias.php");
include_once("conexion.php");


class ControladorAsistencias
{

    public function inicio()
    { //aca se muestra las tablas

        $consulta = new AsistenciaModelo();

        $tabla = $consulta->consultar();
        // $datosEstadisticos = new estadistica();

        // $cantidad_agencias = $datosEstadisticos->cantidadAgencias();
        // $cantidadAgenciasHabilitadas = $datosEstadisticos->cantidadAgenciasHabilitadas();


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

            // print_r($lineas);

            // $i = 0;

            // foreach ($lineas as $linea) {
            //     $cantidad_registros = count($lineas);
            //     $cantidad_regist_agregados =  ($cantidad_registros - 1);

            //     if ($i != 0) {

            //         $datos = explode(",", $linea);
            //         $semanas = [];

            //         $nombre                = !empty($datos[0])  ? ($datos[0]) : '';
            //         $id                = !empty($datos[1])  ? ($datos[1]) : '';
            //         $fecha               = !empty($datos[3])  ? ($datos[3]) : '';
            //         $hora               = !empty($datos[4])  ? ($datos[4]) : '';
            //         $in               = !empty($datos[5])  ? ($datos[5]) : '';
            //         $checkInOn               = !empty($datos[9])  ? ($datos[9]) : '';
            //     }

            //     // $arrays = array_merge($semana, $semana1);

            //     // $resultado = array_merge_recursive((array)$semana, (array)$semana1);
            //     // print_r($resultado);


            //     echo '<div>' . $i . "). " . $checkInOn . '</div>';
            //     $i++;
            // }

            $insertar->crear($lineas);


            //     $insertarAgencia = new AsistenciaModelo();


            //     $descripcion_agencias = $_POST['nombreAgencia'];
            //     $matricula_agencia = $_POST['matriculaAgencia'];
            //     $legajo_agencia = $_POST['legajoAgencia'];
            //     $cuit_agencia = $_POST['cuitAgencia'];
            //     $categoria_agencia = $_POST['categoriaAgencia'];
            //     $idoneoAgencia = $_POST['idoneoAgencia'];

            //     $razonsocial = $_POST['razonsocialAgencia'];

            //     $rela_localidad_direccion = $_POST['localidadAgencia'];
            //     $calle_direccion = $_POST['domicilioAgencia'];

            //     $telefonoAgencia = $_POST['telefonoAgencia'];
            //     $telefonoFijoAgencia = $_POST['telefonoFijoAgencia'];
            //     $correoAgencia = $_POST['correoAgencia'];
            //     $facebookAgencia = $_POST['facebookAgencia'];
            //     $instagramAgencia = $_POST['instagramAgencia'];
            //     $twitterAgencia = $_POST['twitterAgencia'];
            //     $webAgencia = $_POST['webAgencia'];
            //     $otroAgencia = $_POST['otroAgencia'];

            //     $estadoAgencia = $_POST['estadoAgencia'];





            //     $insertarAgencia->crear(
            //         $descripcion_agencias,
            //         $matricula_agencia,
            //         $legajo_agencia,
            //         $cuit_agencia,
            //         $categoria_agencia,
            //         $rela_localidad_direccion,
            //         $calle_direccion,
            //         $razonsocial,
            //         $telefonoAgencia,
            //         $telefonoFijoAgencia,
            //         $correoAgencia,
            //         $facebookAgencia,
            //         $instagramAgencia,
            //         $twitterAgencia,
            //         $webAgencia,
            //         $otroAgencia,
            //         $estadoAgencia,
            //         $idoneoAgencia
            //     );


            //     header("Location:index2.php?controlador=agencias&accion=inicio");
        }


        include_once("vistas/asistencia/crear.php");
    }

    public function editar()
    {

        $idAgencia = $_GET["id"];

        $buscarAgencias = new AsistenciaModelo();

        $buscarSelectLocalidad = $buscarAgencias->buscarSelectLocalidad();
        $buscarSelectEstado = $buscarAgencias->buscarSelectEstado();

        //print_r("$idAgencia");
        /*----------BUSCA LOS POST QUE SE ENCUENTRA EN EDITAR.PHP PARA PODER EDITARLO----------*/

        if ($_POST) {
            $EditarAgencia = new AsistenciaModelo();


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



            // header("Location:admin/index2.php?controlador=agencias&accion=inicio");
            echo "<script>location.href='index2.php?controlador=agencias&accion=inicio';</script>";
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


        $buscarID = new AsistenciaModelo();

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

        $borrarAgencias = new AsistenciaModelo();

        $buscarIDBorrado = $borrarAgencias->consultarID($idAgenciaBorrar);

        $borrado = $borrarAgencias->borrar($idAgenciaBorrar, $id_direccion, $idRazonSocial);

        header("Location:index2.php?controlador=agencias&accion=inicio");
    }

    public function info()
    {
        $id_agencia = $_GET['id'];

        $agenciaInfo = new AsistenciaModelo();

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

    public function imprimir()
    {
        $consulta = new AsistenciaModelo();

        $tabla = $consulta->consultar();




        include_once("vistas/asistencia/imprimir.php");
    }

    public function imprimirInfo()
    {
        $id_agencia = $_GET['id'];

        $agenciaInfo = new AsistenciaModelo();

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

        include_once("vistas/agencias/invoice-print.php");
    }
}
