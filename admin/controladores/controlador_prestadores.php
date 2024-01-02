<?php

include_once("modelos/prestadores.php");
include_once("conexion.php");

class ControladorPrestadores
{

    public function inicio()
    {

        $consultaPrestadores = new PrestadoresModelo();

        $tablaPrestadores = $consultaPrestadores->consultar();
        $contactotelefonos = $consultaPrestadores->consultarContacto();

        $datosEstadisticos = new estadistica();

        $cantidad_prestadores = $datosEstadisticos->cantidadPrestadores();
        $cantidad_guias = $datosEstadisticos->cantidadGuias();
        $cantidad_operadores = $datosEstadisticos->cantidadOperadores();
        $cantidad_total = $datosEstadisticos->cantidadTotal();

        include_once("vistas/prestadores/inicio.php");
    }

    public function crear()
    {
        // ESTÓ ES PARA LA AUDITORÍA
        global $accion, $controlador1;
        global $id;
        //
        // echo '<pre>';
        // print_r($controlador1);
        // echo '</pre>';

        $selectPrestadores = new PrestadoresModelo();

        $buscarSelectLocalidad = $selectPrestadores->buscarSelectLocalidad();
        $buscarSelectEstado = $selectPrestadores->buscarSelectEstado();
        $buscarCategoriaPrestador = $selectPrestadores->buscarSelectCategoria();
        $buscarServicioPrestador = $selectPrestadores->buscarSelectServicio();

        if ($_POST) {

            $crearPrestador = new PrestadoresModelo();

            $categoriaPrestador = $_POST['categoriaPrestador'];

            $nombrePrestador = $_POST['nombrePrestador'];
            $dniPrestador = $_POST['dniPrestador'];
            $institucionPrestador = $_POST['institucionPrestador'];
            $cuitPrestador = $_POST['cuitPrestador'];

            $localidadPrestador = $_POST['localidadPrestador'];

            $domicilioPrestador = $_POST['domicilioPrestador'];

            $estadoPrestador = $_POST['estadoPrestador'];

            $telefonoPrestador = $_POST['telefonoPrestador'];
            $telefonoFijoPrestador = $_POST['telefonoFijoPrestador'];
            $correoPrestador = $_POST['correoPrestador'];
            $facebookPrestador = $_POST['facebookPrestador'];
            $instagramPrestador = $_POST['instagramPrestador'];
            $twitterPrestador = $_POST['twitterPrestador'];
            $webPrestador = $_POST['webPrestador'];
            $otroPrestador = $_POST['otroPrestador'];

            $serviciosPrestador = $_POST['serviciosPrestador'];
            $otroserviciosPrestador = $_POST['otroserviciosPrestador'];
            //print_r($serviciosPrestador);

            $crearPrestador->crear(
                $categoriaPrestador,
                $nombrePrestador,
                $dniPrestador,
                $institucionPrestador,
                $cuitPrestador,
                $localidadPrestador,
                $domicilioPrestador,
                $estadoPrestador,
                $telefonoPrestador,
                $telefonoFijoPrestador,
                $correoPrestador,
                $facebookPrestador,
                $instagramPrestador,
                $twitterPrestador,
                $webPrestador,
                $otroPrestador,
                $serviciosPrestador,
                $otroserviciosPrestador
            );
            if ($crearPrestador) {
                $crearPrestador->trigger($accion, $id, $controlador1);

                echo "<script>location.href='index2.php?controlador=Prestadores&accion=inicio';</script>";
            }


            // header("Location:index2.php?controlador=Prestadores&accion=inicio");
            echo "<script>location.href = 'index2.php?controlador=Prestadores&accion=inicio';</script>";
        }

        include_once("vistas/prestadores/crear.php");
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

        $id_Prestador = $_GET['id'];

        //print_r($id_Prestador);

        $buscarID = new PrestadoresModelo();

        $buscarPrestadores = new PrestadoresModelo();

        $buscarSelectLocalidad = $buscarPrestadores->buscarSelectLocalidad();
        $buscarSelectEstado = $buscarPrestadores->buscarSelectEstado();
        $buscarCategoriaPrestador = $buscarPrestadores->buscarSelectCategoria();
        $buscarServicioPrestador = $buscarPrestadores->buscarSelectServicio();
        $buscarServicioPrestador2 = $buscarPrestadores->buscarSelectServicio2($id_Prestador);

        $insertar = $buscarID->buscarInsertar($id_Prestador);

        $contactosDelPrestador = new ContactosPrestadores();

        $contactosDelPrestador1 = new ContactosInfo();

        $prestadorTelefono = $contactosDelPrestador1->consultarTelefonos($id_Prestador);
        $prestadorTelefonoFijo = $contactosDelPrestador->consultarTelefonosFijos($id_Prestador);
        $prestadorCorreo = $contactosDelPrestador->consultarCorreo($id_Prestador);
        $prestadorFacebook = $contactosDelPrestador->consultarFacebook($id_Prestador);
        $prestadorInstagram = $contactosDelPrestador->consultarInstagram($id_Prestador);
        $prestadorTwitter = $contactosDelPrestador->consultarTwitter($id_Prestador);
        $prestadorWeb = $contactosDelPrestador->consultarWeb($id_Prestador);
        $prestadorOtro = $contactosDelPrestador->consultarOtro($id_Prestador);


        if ($_POST) {

            // print_r($_POST);

            $insertarDatosPrestadores = new PrestadoresModelo();

            $categoriaPrestador = $_POST['categoriaPrestador'];

            $IDnombre = $_POST['IDnombre'];
            $nombrePrestador = $_POST['nombrePrestador'];
            $dniPrestador = $_POST['dniPrestador'];
            $institucionPrestador = $_POST['institucionPrestador'];
            $cuitPrestador = $_POST['cuitPrestador'];

            $localidadPrestador = $_POST['localidadPrestador'];

            $IDdomicilio = $_POST['IDdomicilio'];
            $domicilioPrestador = $_POST['domicilioPrestador'];

            $IDestado = $_POST['IDestado'];
            $estadoPrestador = $_POST['estadoPrestador'];

            $IDcelular = $_POST['IDcelular'];
            $telefonoPrestador = $_POST['telefonoPrestador'];
            $IDfijo = $_POST['IDfijo'];
            $telefonoFijoPrestador = $_POST['telefonoFijoPrestador'];
            $IDcorreo = $_POST['IDcorreo'];
            $correoPrestador = $_POST['correoPrestador'];
            $IDfacebook = $_POST['IDfacebook'];
            $facebookPrestador = $_POST['facebookPrestador'];
            $IDinstagram = $_POST['IDinstagram'];
            $instagramPrestador = $_POST['instagramPrestador'];
            $IDtwitter = $_POST['IDtwitter'];
            $twitterPrestador = $_POST['twitterPrestador'];
            $IDsitio = $_POST['IDsitio'];
            $webPrestador = $_POST['webPrestador'];
            $IDotro = $_POST['IDotro'];
            $otroPrestador = $_POST['otroPrestador'];


            $serviciosPrestador = $_POST['serviciosPrestador'];
            $otroserviciosPrestador = $_POST['otroserviciosPrestador'];
            //print_r($serviciosPrestador);

            $insertarDatosPrestadores->editar(
                $categoriaPrestador,
                $IDnombre,
                $nombrePrestador,
                $dniPrestador,
                $institucionPrestador,
                $cuitPrestador,
                $localidadPrestador,
                $IDdomicilio,
                $domicilioPrestador,
                $IDestado,
                $estadoPrestador,
                $telefonoPrestador,
                $telefonoFijoPrestador,
                $correoPrestador,
                $facebookPrestador,
                $instagramPrestador,
                $twitterPrestador,
                $webPrestador,
                $otroPrestador,
                $serviciosPrestador,
                $otroserviciosPrestador,
                $IDcelular,
                $IDfijo,
                $IDcorreo,
                $IDfacebook,
                $IDinstagram,
                $IDtwitter,
                $IDsitio,
                $IDotro
            );
            if ($insertarDatosPrestadores) {
                $insertarDatosPrestadores->trigger($accion, $id, $controlador1);

                echo "<script>location.href='index2.php?controlador=Prestadores&accion=inicio';</script>";
            }
            // header("Location:index2.php?controlador=Prestadores&accion=inicio");
            echo "<script>location.href = 'index2.php?controlador=Prestadores&accion=inicio';</script>";
        }
        include_once("vistas/prestadores/editar.php");
    }

    public function borrar()
    {

        // ESTÓ ES PARA LA AUDITORÍA
        global $accion, $controlador1;
        global $id;
        //
        // echo '<pre>';
        // print_r($controlador1);
        // echo '</pre>';

        $borradoPrestadores = new PrestadoresModelo();

        $id_Prestador = $_GET['id'];
        $id_direccion = $_GET['idDireccion'];

        $borradoPrestadores->borrar($id_Prestador, $id_direccion);
        if ($borradoPrestadores) {
            $borradoPrestadores->trigger($accion, $id, $controlador1);

            echo "<script>location.href='index2.php?controlador=Prestadores&accion=inicio';</script>";
        }

        echo "<script>location.href = 'index2.php?controlador=Prestadores&accion=inicio';</script>";


        // header("Location:index2.php?controlador=Prestadores&accion=inicio");
    }

    public function info()
    {
        $id_prestador = $_GET['id'];

        $prestadorInfo = new PrestadoresModelo();

        $infoPrestador = $prestadorInfo->buscarInsertar($id_prestador);

        $serviciosPrestador = $prestadorInfo->serviciosprestadores($id_prestador);




        $contactosDelPrestador = new ContactosInfo();

        $prestadorTelefono = $contactosDelPrestador->consultarTelefonos($id_prestador);
        $prestadorTelefonoFijo = $contactosDelPrestador->consultarTelefonosFijos($id_prestador);
        $prestadorCorreo = $contactosDelPrestador->consultarCorreo($id_prestador);
        $prestadorFacebook = $contactosDelPrestador->consultarFacebook($id_prestador);
        $prestadorInstagram = $contactosDelPrestador->consultarInstagram($id_prestador);
        $prestadorTwitter = $contactosDelPrestador->consultarTwitter($id_prestador);
        $prestadorWeb = $contactosDelPrestador->consultarWeb($id_prestador);
        $prestadorOtro = $contactosDelPrestador->consultarOtro($id_prestador);
        //print_r($alojamientosCorreo);

        include_once("vistas/prestadores/info.php");
    }

    public function imprimir()
    {

        $consultaPrestadores = new PrestadoresModelo();

        $tablaPrestadores = $consultaPrestadores->consultar();
        $contactotelefonos = $consultaPrestadores->consultarContacto();

        $datosEstadisticos = new estadistica();

        $cantidad_prestadores = $datosEstadisticos->cantidadPrestadores();
        $cantidad_guias = $datosEstadisticos->cantidadGuias();
        $cantidad_operadores = $datosEstadisticos->cantidadOperadores();
        $cantidad_total = $datosEstadisticos->cantidadTotal();

        include_once("vistas/prestadores/imprimir.php");
    }

    public function imprimirInfo()
    {
        $id_prestador = $_GET['id'];

        $prestadorInfo = new PrestadoresModelo();

        $infoPrestador = $prestadorInfo->buscarInsertar($id_prestador);

        $serviciosPrestador = $prestadorInfo->serviciosprestadores($id_prestador);




        $contactosDelPrestador = new ContactosInfo();

        $prestadorTelefono = $contactosDelPrestador->consultarTelefonos($id_prestador);
        $prestadorTelefonoFijo = $contactosDelPrestador->consultarTelefonosFijos($id_prestador);
        $prestadorCorreo = $contactosDelPrestador->consultarCorreo($id_prestador);
        $prestadorFacebook = $contactosDelPrestador->consultarFacebook($id_prestador);
        $prestadorInstagram = $contactosDelPrestador->consultarInstagram($id_prestador);
        $prestadorTwitter = $contactosDelPrestador->consultarTwitter($id_prestador);
        $prestadorWeb = $contactosDelPrestador->consultarWeb($id_prestador);
        $prestadorOtro = $contactosDelPrestador->consultarOtro($id_prestador);
        //print_r($alojamientosCorreo);

        include_once("vistas/prestadores/invoice-print.php");
    }
}
