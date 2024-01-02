<?php

use function PHPSTORM_META\type;

include_once("modelos/alojamiento.php");
include_once("conexion.php");

class ControladorAlojamientos
{

    public function inicio()
    { //aca se muestra las tablas

        global $accion, $controlador1;
        // echo "esto es un controlador: " . $controlador1;

        $consultarAlojamientosInicio = new Alojamientos();

        $inicioAlojamiento = $consultarAlojamientosInicio->consultar();

        $datosEstadisticos = new estadistica();

        $cantidad_hotel = $datosEstadisticos->cantidadHotel();
        $cantidad_hotel_plazas = $datosEstadisticos->cantidadHotelPlazas();

        $cantidad_Cabaña = $datosEstadisticos->cantidadCabaña();
        $cantidad_Cabaña_plazas = $datosEstadisticos->cantidadCabañaPlazas();

        $cantidad_Hospedaje = $datosEstadisticos->cantidadHospedaje();
        $cantidad_Hospedaje_plazas = $datosEstadisticos->cantidadHospedajePlazas();

        $cantidad_Total_Alojamientos = $datosEstadisticos->cantidadTotalAlojamiento();
        $cantidad_Total_Alojamientos_Plazas = $datosEstadisticos->cantidadAlojamientoPlazas();



        include_once("vistas/Alojamientos/inicio.php");
    }

    public function crear()
    {
        // ESTÓ ES PARA LA AUDITORÍA
        global $accion, $controlador1;
        global $id;
        //

        $select_tipo_alo = new Alojamientos();

        $buscarSelectTipoAlojamiento = $select_tipo_alo->buscarSelectTipoAlojamiento();
        $buscarSelectLocalidad = $select_tipo_alo->buscarSelectLocalidad();
        $buscarSelectEstado = $select_tipo_alo->buscarSelectEstado();
        $buscarSelectRubro = $select_tipo_alo->buscarSelectRubro();
        $buscarSelecthabilitacion = $select_tipo_alo->buscarSelecthabilitacion();


        if ($_POST) {
            // print_r($_POST);

            $crearAlojamiento = new Alojamientos();

            $categoriaAlojamiento = $_POST['categoriaAlojamiento'];
            $nombreAlojamiento = $_POST['nombreAlojamiento'];
            $localidadAlojamiento = $_POST['localidadAlojamiento'];
            $razonsocialAlojamiento = $_POST['razonsocialAlojamiento'];
            $estrellaAlojamiento = $_POST['estrellaAlojamiento'];
            $rubroAlojamiento = $_POST['rubroAlojamiento'];
            $idoneoAlojamiento = $_POST['idoneoAlojamiento'];
            $cuitAlojamiento = $_POST['cuitAlojamiento'];
            $domicilioAlojamiento = $_POST['domicilioAlojamiento'];
            $estadoAlojamiento = $_POST['estadoAlojamiento'];

            $telefonoAlojamiento = $_POST['telefonoAlojamiento'];
            $telefonoFijoAlojamiento = $_POST['telefonoFijoAlojamiento'];
            $correoAlojamiento = $_POST['correoAlojamiento'];
            $facebookAlojamiento = $_POST['facebookAlojamiento'];
            $instagramAlojamiento = $_POST['instagramAlojamiento'];
            $twitterAlojamiento = $_POST['twitterAlojamiento'];
            $webAlojamiento = $_POST['webAlojamiento'];
            $otroAlojamiento = $_POST['otroAlojamiento'];


            $cantTotalPlazasAlojamiento = $_POST['cantTotalPlazasAlojamiento'];
            $cantTotalAlojamiento = $_POST['cantTotalAlojamiento'];
            $singleAlojamiento = $_POST['singleAlojamiento'];
            $dobleAlojamiento = $_POST['dobleAlojamiento'];
            $tripleAlojamiento = $_POST['tripleAlojamiento'];
            $cuadrupleAlojamiento = $_POST['cuadrupleAlojamiento'];
            $matrimonialAlojamiento = $_POST['matrimonialAlojamiento'];
            $apartamentoAlojamiento = $_POST['apartamentoAlojamiento'];
            $wifiAlojamiento = $_POST['wifiAlojamiento'];
            $estacionamientoAlojamiento = $_POST['estacionamientoAlojamiento'];
            $desayunoAlojamiento = $_POST['desayunoAlojamiento'];
            $piscinaAlojamiento = $_POST['piscinaAlojamiento'];
            $otroServicioAlojamiento = $_POST['otroServicioAlojamiento'];

            $seminarioAlojamiento = $_POST['seminarioAlojamiento'];
            $congresoAlojamiento = $_POST['congresoAlojamiento'];
            $eventoSocialAlojamiento = $_POST['eventoSocialAlojamiento'];
            $salonAlojamiento = $_POST['salonAlojamiento'];
            $reunionAlojamiento = $_POST['reunionAlojamiento'];

            $habilitacionAlojamiento = $_POST['habilitacionAlojamiento'];


            $crearAlojamiento->crear(
                $categoriaAlojamiento,
                $nombreAlojamiento,
                $localidadAlojamiento,
                $razonsocialAlojamiento,
                $estrellaAlojamiento,
                $rubroAlojamiento,
                $idoneoAlojamiento,
                $cuitAlojamiento,
                $domicilioAlojamiento,
                $estadoAlojamiento,
                $telefonoAlojamiento,
                $telefonoFijoAlojamiento,
                $correoAlojamiento,
                $facebookAlojamiento,
                $instagramAlojamiento,
                $twitterAlojamiento,
                $webAlojamiento,
                $otroAlojamiento,
                $cantTotalAlojamiento,
                $singleAlojamiento,
                $dobleAlojamiento,
                $tripleAlojamiento,
                $cuadrupleAlojamiento,
                $matrimonialAlojamiento,
                $apartamentoAlojamiento,
                $wifiAlojamiento,
                $estacionamientoAlojamiento,
                $desayunoAlojamiento,
                $piscinaAlojamiento,
                $otroServicioAlojamiento,
                $seminarioAlojamiento,
                $congresoAlojamiento,
                $eventoSocialAlojamiento,
                $salonAlojamiento,
                $reunionAlojamiento,
                $habilitacionAlojamiento,
                $cantTotalPlazasAlojamiento
            );
            if ($crearAlojamiento) {
                $crearAlojamiento->trigger($accion, $id, $controlador1);
                // print_r($insertar);
                // print_r($usuario_crear);
                echo "<script>location.href='index2.php?controlador=Alojamientos&accion=inicio';</script>";
            }

            // header("Location:index2.php?controlador=Alojamientos&accion=inicio");
            echo "<script>location.href='index2.php?controlador=Alojamientos&accion=inicio';</script>";
        }

        include_once("vistas/Alojamientos/crear.php");
    }

    public function editar()
    {
        // ESTÓ ES PARA LA AUDITORÍA
        global $accion, $controlador1;
        global $id;
        //

        $id_alojamientos = $_GET['id'];

        //print_r($id_alojamientos);

        $buscarID = new Alojamientos();

        $buscarSelectTipoAlojamiento = $buscarID->buscarSelectTipoAlojamiento();
        $buscarSelectLocalidad = $buscarID->buscarSelectLocalidad();
        $buscarSelectEstado = $buscarID->buscarSelectEstado();
        $buscarSelectRubro = $buscarID->buscarSelectRubro();
        $buscarSelecthabilitacion = $buscarID->buscarSelecthabilitacion();


        if ($_POST) {
            // print_r($_POST);

            $insertarDatosAlojamiento = new Alojamientos();

            $IDAlojamiento = $_POST['IDAlojamiento'];
            $categoriaAlojamiento = $_POST['categoriaAlojamiento'];
            $nombreAlojamiento = $_POST['nombreAlojamiento'];
            $estrellaAlojamiento = $_POST['estrellaAlojamiento'];
            $idoneoAlojamiento = $_POST['idoneoAlojamiento'];
            $cuitAlojamiento = $_POST['cuitAlojamiento'];

            $IDRazonSocialAlojamiento = $_POST['IDRazonSocialAlojamiento'];
            $razonsocialAlojamiento = $_POST['razonsocialAlojamiento'];

            $rubroAlojamiento = $_POST['rubroAlojamiento'];


            $IDdireccionAlojamiento = $_POST['IDdireccionAlojamiento'];
            $domicilioAlojamiento = $_POST['domicilioAlojamiento'];
            $localidadAlojamiento = $_POST['localidadAlojamiento'];

            $IDestadoAlojamiento = $_POST['IDestadoAlojamiento'];
            $estadoAlojamiento = $_POST['estadoAlojamiento'];

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
            $cantTotalPlazasAlojamiento = $_POST['cantTotalPlazasAlojamiento'];
            $cantTotalAlojamiento = $_POST['cantTotalAlojamiento'];
            $singleAlojamiento = $_POST['singleAlojamiento'];
            $dobleAlojamiento = $_POST['dobleAlojamiento'];
            $tripleAlojamiento = $_POST['tripleAlojamiento'];
            $cuadrupleAlojamiento = $_POST['cuadrupleAlojamiento'];
            $matrimonialAlojamiento = $_POST['matrimonialAlojamiento'];
            $apartamentoAlojamiento = $_POST['apartamentoAlojamiento'];
            $wifiAlojamiento = $_POST['wifiAlojamiento'];
            $estacionamientoAlojamiento = $_POST['estacionamientoAlojamiento'];
            $desayunoAlojamiento = $_POST['desayunoAlojamiento'];
            $piscinaAlojamiento = $_POST['piscinaAlojamiento'];
            $otroServicioAlojamiento = $_POST['otroServicioAlojamiento'];

            $IDserviciosComplementarios = $_POST['IDserviciosComplementarios'];
            $seminarioAlojamiento = $_POST['seminarioAlojamiento'];
            $congresoAlojamiento = $_POST['congresoAlojamiento'];
            $eventoSocialAlojamiento = $_POST['eventoSocialAlojamiento'];
            $salonAlojamiento = $_POST['salonAlojamiento'];
            $reunionAlojamiento = $_POST['reunionAlojamiento'];

            $habilitacionAlojamiento = $_POST['habilitacionAlojamiento'];
            $IDhabilitacionAlojamiento = $_POST['IDhabilitacionAlojamiento'];

            $insertarDatosAlojamiento->editar(
                $categoriaAlojamiento,
                $nombreAlojamiento,
                $localidadAlojamiento,
                $razonsocialAlojamiento,
                $estrellaAlojamiento,
                $rubroAlojamiento,
                $idoneoAlojamiento,
                $cuitAlojamiento,
                $domicilioAlojamiento,
                $estadoAlojamiento,
                $telefonoAlojamiento,
                $telefonoFijoAlojamiento,
                $correoAlojamiento,
                $facebookAlojamiento,
                $instagramAlojamiento,
                $twitterAlojamiento,
                $webAlojamiento,
                $otroAlojamiento,
                $cantTotalAlojamiento,
                $singleAlojamiento,
                $dobleAlojamiento,
                $tripleAlojamiento,
                $cuadrupleAlojamiento,
                $matrimonialAlojamiento,
                $apartamentoAlojamiento,
                $wifiAlojamiento,
                $estacionamientoAlojamiento,
                $desayunoAlojamiento,
                $piscinaAlojamiento,
                $otroServicioAlojamiento,
                $seminarioAlojamiento,
                $congresoAlojamiento,
                $eventoSocialAlojamiento,
                $salonAlojamiento,
                $reunionAlojamiento,
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
                $IDRazonSocialAlojamiento,
                $IDdireccionAlojamiento,
                $IDestadoAlojamiento,
                $habilitacionAlojamiento,
                $IDhabilitacionAlojamiento,
                $cantTotalPlazasAlojamiento
            );
            if ($insertarDatosAlojamiento) {
                $insertarDatosAlojamiento->trigger($accion, $id, $controlador1);
                // print_r($insertar);
                // print_r($usuario_crear);
                echo "<script>location.href='index2.php?controlador=Alojamientos&accion=inicio';</script>";
            }



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

        include_once("vistas/Alojamientos/editar.php");
    }

    public function borrar()
    {
        // ESTÓ ES PARA LA AUDITORÍA
        global $accion, $controlador1;
        global $id;
        //
        //print_r($_GET);

        $borrado = new Alojamientos();

        $id_alojamientos = $_GET['id'];
        $id_direccion = $_GET['idDireccion'];
        $idRazonSocial = $_GET['idRazonSocial'];
        $idServicios = $_GET['idServicios'];
        $idServiciosComple = $_GET['idServiciosComple'];


        $borrado->borrar($id_alojamientos, $id_direccion, $idRazonSocial, $idServicios, $idServiciosComple);
        if ($borrado) {
            $borrado->trigger($accion, $id, $controlador1);
            // print_r($insertar);
            // print_r($usuario_crear);
            echo "<script>location.href='index2.php?controlador=Alojamientos&accion=inicio';</script>";
        }
        // header("Location:index2.php?controlador=Alojamientos&accion=inicio");
        echo "<script>location.href='index2.php?controlador=Alojamientos&accion=inicio';</script>";
    }

    public function info()
    {
        $id_alojamientos = $_GET['id'];

        $alojamientosInfo = new Alojamientos();

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

        include_once("vistas/Alojamientos/info.php");
    }

    public function imprimir()
    {
        $datosEstadisticos = new estadistica();
        $cantidad_Total_Alojamientos = $datosEstadisticos->cantidadTotalAlojamiento();

        $consultarAlojamientosInicio = new Alojamientos();

        $inicioAlojamiento = $consultarAlojamientosInicio->consultar();
        include_once("vistas/Alojamientos/imprimir.php");
    }

    public function imprimirInfo()
    {
        $id_alojamientos = $_GET['id'];

        $alojamientosInfo = new Alojamientos();

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
        include_once("vistas/Alojamientos/invoice-print.php");
    }
}
