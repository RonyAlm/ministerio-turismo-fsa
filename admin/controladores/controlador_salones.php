<?php

include_once("modelos/salones.php");
include_once("conexion.php");


class ControladorSalones
{

    public function inicio()
    { //aca se muestra las tablas

        $consultarSalonesInicio = new SalonesModelo();

        $inicio = $consultarSalonesInicio->consultar();

        $datosEstadisticos = new estadistica();

        $cantidad_hotel = $datosEstadisticos->cantidadHotel();
        $cantidad_hotel_plazas = $datosEstadisticos->cantidadHotelPlazas();

        include_once("vistas/salones/inicio.php");
    }

    public function crear()
    {

        $select_tipo_alo = new SalonesModelo();

        $buscarSelectTipoAlojamiento = $select_tipo_alo->buscarSelectTipoAlojamiento();
        $buscarSelectLocalidad = $select_tipo_alo->buscarSelectLocalidad();
        $buscarSelectEstado = $select_tipo_alo->buscarSelectEstado();
        $buscarSelectRubro = $select_tipo_alo->buscarSelectRubro();
        $buscarSelecthabilitacion = $select_tipo_alo->buscarSelecthabilitacion();


        if ($_POST) {
            print_r($_POST);

            $crearSalones = new SalonesModelo();

            $nombresalones = $_POST['nombresalones'];
            $localidadsalones = $_POST['localidadsalones'];

            $idoneosalones = $_POST['idoneosalones'];
            $cuitsalones = $_POST['cuitsalones'];
            $domiciliosalones = $_POST['domiciliosalones'];
            $estadosalones = $_POST['estadosalones'];

            $telefonoAlojamiento = $_POST['telefonoAlojamiento'];
            $telefonoFijoAlojamiento = $_POST['telefonoFijoAlojamiento'];
            $correoAlojamiento = $_POST['correoAlojamiento'];
            $facebookAlojamiento = $_POST['facebookAlojamiento'];
            $instagramAlojamiento = $_POST['instagramAlojamiento'];
            $twitterAlojamiento = $_POST['twitterAlojamiento'];
            $webAlojamiento = $_POST['webAlojamiento'];
            $otroAlojamiento = $_POST['otroAlojamiento'];

            $seminariosalones = $_POST['seminariosalones'];
            $congresosalones = $_POST['congresosalones'];
            $eventoSocialsalones = $_POST['eventoSocialsalones'];
            $salonsalones = $_POST['salonsalones'];
            $reunionsalones = $_POST['reunionsalones'];

            $habilitacionsalones = $_POST['habilitacionsalones'];


            $crearSalones->crear(
                $nombresalones,
                $localidadsalones,
                $idoneosalones,
                $cuitsalones,
                $domiciliosalones,
                $estadosalones,
                $telefonoAlojamiento,
                $telefonoFijoAlojamiento,
                $correoAlojamiento,
                $facebookAlojamiento,
                $instagramAlojamiento,
                $twitterAlojamiento,
                $webAlojamiento,
                $otroAlojamiento,
                $seminariosalones,
                $congresosalones,
                $eventoSocialsalones,
                $salonsalones,
                $reunionsalones,
                $habilitacionsalones
            );

            // header("Location:index2.php?controlador=Alojamientos&accion=inicio");
            // echo "<script>location.href='index2.php?controlador=salones&accion=inicio';</script>";
        }

        include_once("vistas/salones/crear.php");
    }

    public function editar()
    {

        $id_alojamientos = $_GET['id'];

        //print_r($id_alojamientos);

        $buscarID = new SalonesModelo();

        $buscarSelectTipoAlojamiento = $buscarID->buscarSelectTipoAlojamiento();
        $buscarSelectLocalidad = $buscarID->buscarSelectLocalidad();
        $buscarSelectEstado = $buscarID->buscarSelectEstado();
        $buscarSelectRubro = $buscarID->buscarSelectRubro();
        $buscarSelecthabilitacion = $buscarID->buscarSelecthabilitacion();


        if ($_POST) {
            //print_r($_POST);

            $insertar = new SalonesModelo();

            $IDAlojamiento = $_POST['IDAlojamiento'];
            $nombresalones = $_POST['nombresalones'];
            $nombreAlojamiento = $_POST['nombreAlojamiento'];

            $idoneosalones = $_POST['idoneosalones'];
            $cuitsalones = $_POST['cuitsalones'];

            $ID = $_POST['ID'];

            $IDdireccionAlojamiento = $_POST['IDdireccionAlojamiento'];
            $domiciliosalones = $_POST['domiciliosalones'];
            $localidadsalones = $_POST['localidadsalones'];

            $IDestadosalones = $_POST['IDestadosalones'];
            $estadosalones = $_POST['estadosalones'];

            $alojamientoIDtelefono = $_POST['alojamientoIDtelefono'];
            $telefonoAlojamiento = $_POST['telefonoAlojamiento'];

            $alojamientoIDtelefonoFijo = $_POST['alojamientoIDtelefonoFijo'];
            $telefonoFijoAlojamiento = $_POST['telefonoFijoAlojamiento'];

            $alojamientoIDcorreo = $_POST['alojamientoIDcorreo'];
            $correoAlojamiento = $_POST['correoAlojamiento'];

            $alojamientoIDfacebook = $_POST['alojamientoIDfacebook'];
            $facebookAlojamiento = $_POST['facebookAlojamiento'];

            $alojamientoIDinstagram = $_POST['alojamientoIDinstagram'];
            $instagramAlojamiento = $_POST['instagramAlojamiento'];

            $alojamientoIDtwitter = $_POST['alojamientoIDtwitter'];
            $twitterAlojamiento = $_POST['twitterAlojamiento'];

            $alojamientoIDweb = $_POST['alojamientoIDweb'];
            $webAlojamiento = $_POST['webAlojamiento'];

            $alojamientoIDotro = $_POST['alojamientoIDotro'];
            $otroAlojamiento = $_POST['otroAlojamiento'];

            $IDservicios = $_POST['IDservicios'];
            $IDserviciosComplementarios = $_POST['IDserviciosComplementarios'];
            $seminariosalones = $_POST['seminariosalones'];
            $congresosalones = $_POST['congresosalones'];
            $eventoSocialsalones = $_POST['eventoSocialsalones'];
            $salonsalones = $_POST['salonsalones'];
            $reunionsalones = $_POST['reunionsalones'];

            $habilitacionsalones = $_POST['habilitacionsalones'];
            $IDhabilitacionsalones = $_POST['IDhabilitacionsalones'];

            $insertar->editar(
                $nombresalones,
                $localidadsalones,
                $idoneosalones,
                $cuitsalones,
                $domiciliosalones,
                $estadosalones,
                $telefonoAlojamiento,
                $telefonoFijoAlojamiento,
                $correoAlojamiento,
                $facebookAlojamiento,
                $instagramAlojamiento,
                $twitterAlojamiento,
                $webAlojamiento,
                $otroAlojamiento,
                $seminariosalones,
                $congresosalones,
                $eventoSocialsalones,
                $salonsalones,
                $reunionsalones,
                $IDservicios,
                $IDserviciosComplementarios,
                $alojamientoIDtelefono,
                $alojamientoIDtelefonoFijo,
                $alojamientoIDcorreo,
                $alojamientoIDfacebook,
                $alojamientoIDinstagram,
                $alojamientoIDtwitter,
                $alojamientoIDweb,
                $alojamientoIDotro,
                $IDAlojamiento,
                $ID,
                $IDdireccionAlojamiento,
                $IDestadosalones,
                $habilitacionsalones,
                $IDhabilitacionsalones
            );



            // header("Location:index2.php?controlador=Alojamientos&accion=inicio");
            echo "<script>location.href='index2.php?controlador=Alojamientos&accion=inicio';</script>";
        }

        $contactosDelAlojamiento = new ContactosAlojamiento();

        $contactosDelAlojamiento1 = new ContactosInfo();


        $alojamientosTelefono = $contactosDelAlojamiento1->consultarTelefonos($id_alojamientos);
        $alojamientosTelefonoFijo = $contactosDelAlojamiento->consultarTelefonosFijos($id_alojamientos);
        $alojamientosCorreo = $contactosDelAlojamiento->consultarCorreo($id_alojamientos);
        $alojamientosFacebook = $contactosDelAlojamiento->consultarFacebook($id_alojamientos);
        $alojamientosInstagram = $contactosDelAlojamiento->consultarInstagram($id_alojamientos);
        $alojamientosTwitter = $contactosDelAlojamiento->consultarTwitter($id_alojamientos);
        $alojamientosWeb = $contactosDelAlojamiento->consultarWeb($id_alojamientos);
        $alojamientosOtro = $contactosDelAlojamiento->consultarOtro($id_alojamientos);

        $insertar = $buscarID->buscarInsertar($id_alojamientos);

        include_once("vistas/salones/editar.php");
    }

    public function borrar()
    {
        //print_r($_GET);

        $borrado = new SalonesModelo();

        $id_salones = $_GET['id'];
        $id_direccion = $_GET['idDireccion'];
        $id_serv = $_GET['id_serv_comple_alojamiento'];



        $borrado->borrar($id_salones, $id_direccion, $id_serv);

        // header("Location:index2.php?controlador=Alojamientos&accion=inicio");
        echo "<script>location.href='index2.php?controlador=Alojamientos&accion=inicio';</script>";
    }

    public function info()
    {
        $id_alojamientos = $_GET['id'];

        $alojamientosInfo = new SalonesModelo();

        $infoAlojamiento = $alojamientosInfo->buscarInsertar($id_alojamientos);


        $contactosDelAlojamiento = new ContactosInfo();

        $alojamientosTelefono = $contactosDelAlojamiento->consultarTelefonos($id_alojamientos);
        $alojamientoTelefonoFijo = $contactosDelAlojamiento->consultarTelefonosFijos($id_alojamientos);
        $alojamientosCorreo = $contactosDelAlojamiento->consultarCorreo($id_alojamientos);
        $alojamientosFacebook = $contactosDelAlojamiento->consultarFacebook($id_alojamientos);
        $alojamientosInstagram = $contactosDelAlojamiento->consultarInstagram($id_alojamientos);
        $alojamientosTwitter = $contactosDelAlojamiento->consultarTwitter($id_alojamientos);
        $alojamientosWeb = $contactosDelAlojamiento->consultarWeb($id_alojamientos);
        $alojamientosOtro = $contactosDelAlojamiento->consultarOtro($id_alojamientos);
        //print_r($alojamientosCorreo);

        include_once("vistas/salones/info.php");
    }

    public function imprimir()
    {
        $datosEstadisticos = new estadistica();
        $cantidad_Total_Alojamientos = $datosEstadisticos->cantidadTotalAlojamiento();

        $consultarAlojamientosInicio = new SalonesModelo();

        $inicioAlojamiento = $consultarAlojamientosInicio->consultar();
        include_once("vistas/salones/imprimir.php");
    }

    public function imprimirInfo()
    {
        $id_alojamientos = $_GET['id'];

        $alojamientosInfo = new SalonesModelo();

        $infoAlojamiento = $alojamientosInfo->buscarInsertar($id_alojamientos);


        $contactosDelAlojamiento = new ContactosInfo();

        $alojamientosTelefono = $contactosDelAlojamiento->consultarTelefonos($id_alojamientos);
        $alojamientoTelefonoFijo = $contactosDelAlojamiento->consultarTelefonosFijos($id_alojamientos);
        $alojamientosCorreo = $contactosDelAlojamiento->consultarCorreo($id_alojamientos);
        $alojamientosFacebook = $contactosDelAlojamiento->consultarFacebook($id_alojamientos);
        $alojamientosInstagram = $contactosDelAlojamiento->consultarInstagram($id_alojamientos);
        $alojamientosTwitter = $contactosDelAlojamiento->consultarTwitter($id_alojamientos);
        $alojamientosWeb = $contactosDelAlojamiento->consultarWeb($id_alojamientos);
        $alojamientosOtro = $contactosDelAlojamiento->consultarOtro($id_alojamientos);
        include_once("vistas/salones/invoice-print.php");
    }
}
