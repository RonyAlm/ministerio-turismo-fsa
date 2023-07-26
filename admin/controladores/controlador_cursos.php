<?php

include_once("modelos/cursos_capacitaciones.php");
include_once("conexion.php");


class ControladorCursos_capacitaciones
{

    public function inicio()
    { //aca se muestra las tablas

        $consultaTransporte = new CursosModelo();

        $tabla = $consultaTransporte->consultar();
        $datosEstadisticos = new estadistica();

        $cantidad_TotalInscriptos = $datosEstadisticos->cantidadInscriptos();
        $cantidad_TotalAusentes = $datosEstadisticos->cantidadAusentes();
        $cantidad_TotalPresentes = $datosEstadisticos->cantidadPresentes();


        include_once("vistas/cursos_capacitaciones/inicio.php");
    }
    public function checkbox()
    {
        $insertarpresente = new CursosModelo();

        if ($_POST) {
            $id_curso = $_POST['checkboxId'];
            $presente = $_POST['isChecked'];

            if ($presente == 'true') {
                $presente = "Presente";
                echo $presente;
                $insertarpresente->crearPresente($id_curso, $presente);
            } else {
                $presente = "Ausente";
                echo $presente;
                $insertarpresente->crearPresente($id_curso, $presente);
            }
        }

        include_once("vistas/cursos_capacitaciones/inicio.php");
    }


    public function crear()
    {
        // ESTÓ ES PARA LA AUDITORÍA
        global $accion, $controlador1;
        global $id;

        $select_tipo_Transporte = new CursosModelo();

        $buscarSelectLocalidad = $select_tipo_Transporte->buscarSelectLocalidad();
        $buscarSelectEstado = $select_tipo_Transporte->buscarSelectEstado();

        if ($_POST) {
            // print_r($_POST);

            $insertarCursos = new CursosModelo();

            $nombreyapellido = $_POST['nombreyapellido'];
            $dnicursos = $_POST['dnicursos'];
            $ocupacioncursos = $_POST['ocupacioncursos'];
            $presente_cursos = $_POST['presente_cursos'];

            $rela_localidad_direccion = $_POST['localidadAgencia'];
            // $domicilioTransporte = $_POST['domicilioTransporte'];

            $telefonoAgencia = $_POST['telefonoAgencia'];
            $telefonoFijoAgencia = $_POST['telefonoFijoAgencia'];
            $correoAgencia = $_POST['correoAgencia'];
            $facebookAgencia = $_POST['facebookAgencia'];
            $instagramAgencia = $_POST['instagramAgencia'];
            $twitterAgencia = $_POST['twitterAgencia'];
            $webAgencia = $_POST['webAgencia'];
            $otroAgencia = $_POST['otroAgencia'];

            $insertarCursos->crear(
                $rela_localidad_direccion,
                $nombreyapellido,
                $dnicursos,
                $presente_cursos,
                $telefonoAgencia,
                $telefonoFijoAgencia,
                $correoAgencia,
                $facebookAgencia,
                $instagramAgencia,
                $twitterAgencia,
                $webAgencia,
                $otroAgencia,
                $ocupacioncursos
            );
            if ($insertarCursos) {
                $insertarCursos->trigger($accion, $id, $controlador1);
                // print_r($insertar);
                // print_r($usuario_crear);
                echo "<script>location.href='index2.php?controlador=cursos_capacitaciones&accion=inicio';</script>";
            }

            // echo "<script>location.href='index2.php?controlador=cursos_capacitaciones&accion=inicio';</script>";
        }


        include_once("vistas/cursos_capacitaciones/crear.php");
    }

    public function editar()
    {
        // ESTÓ ES PARA LA AUDITORÍA
        global $accion, $controlador1;
        global $id;


        $idAgencia = $_GET["id"];

        $buscarTransportes = new CursosModelo();

        $buscarSelectLocalidad = $buscarTransportes->buscarSelectLocalidad();


        /*----------BUSCA LOS POST QUE SE ENCUENTRA EN EDITAR.PHP PARA PODER EDITARLO----------*/

        if ($_POST) {
            $EditarAgencia = new CursosModelo();


            $cursosID =  $_POST['cursosID'];
            $nombreyapellido = $_POST['nombreyapellido'];
            $dnicursos = $_POST['dnicursos'];
            $ocupacioncursos = $_POST['ocupacioncursos'];
            $presente_cursos = $_POST['presente_cursos'];


            // $idDireccion = $_POST['agenciaDomicilioID'];
            $rela_localidad_direccion = $_POST['localidadAgencia'];
            // $calle_direccion = $_POST['domicilioAgencia'];

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

            // $idestadoAgencia = $_POST['agenciaEstadoID'];
            // $estadoAgencia = $_POST['estadoAgencia'];

            $EditarAgencia->editar(
                $rela_localidad_direccion,
                $nombreyapellido,
                $dnicursos,
                $cursosID,
                $presente_cursos,
                $ocupacioncursos,
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
            if ($EditarAgencia) {
                $EditarAgencia->trigger($accion, $id, $controlador1);
                // print_r($insertar);
                // print_r($usuario_crear);
                echo "<script>location.href='index2.php?controlador=cursos_capacitaciones&accion=inicio';</script>";
            }

            // header("Location:admin/index2.php?controlador=Transportes&accion=inicio");
            echo "<script>location.href='index2.php?controlador=cursos_capacitaciones&accion=inicio';</script>";
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

        $buscarID = new CursosModelo();

        $editar = $buscarID->buscar($idAgencia);

        $InsertarID = $buscarID->consultarID($idAgencia);


        include_once("vistas/cursos_capacitaciones/editar.php");
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

        $borrarTransportes = new CursosModelo();

        $borrarTransportes->consultarID($idAgenciaBorrar);

        $borrarTransportes->borrar($idAgenciaBorrar, $id_direccion);
        if ($borrarTransportes) {
            $borrarTransportes->trigger($accion, $id, $controlador1);
            // print_r($insertar);
            // print_r($usuario_crear);
            echo "<script>location.href='index2.php?controlador=cursos_capacitaciones&accion=inicio';</script>";
        }

        header("Location:index2.php?controlador=Transportes&accion=inicio");
    }

    public function info()
    {
        $id_agencia = $_GET['id'];

        $agenciaInfo = new CursosModelo();

        $TransportesInfomacion = $agenciaInfo->buscar($id_agencia);


        $contactosDeagencia = new ContactosInfoTransporte();
        $agenciaTelefonoInfo = $contactosDeagencia->consultarTelefonos($id_agencia);
        $agenciaTelefonoFijo = $contactosDeagencia->consultarTelefonosFijos($id_agencia);
        $agenciaCorreo = $contactosDeagencia->consultarCorreo($id_agencia);
        $agenciaFacebook = $contactosDeagencia->consultarFacebook($id_agencia);
        $agenciaInstagram = $contactosDeagencia->consultarInstagram($id_agencia);
        $agenciaTwitter = $contactosDeagencia->consultarTwitter($id_agencia);
        $agenciaWeb = $contactosDeagencia->consultarWeb($id_agencia);
        $agenciaOtro = $contactosDeagencia->consultarOtro($id_agencia);

        include_once("vistas/cursos_capacitaciones/info.php");
    }

    public function sucursal()
    {

        $id_agencia = $_GET['id'];
    }

    public function imprimir()
    {
        $consultaAgencia = new CursosModelo();

        $tablaAgencia = $consultaAgencia->consultar();
        $datosEstadisticos = new estadistica();

        // $cantidad_Transportes = $datosEstadisticos->cantidadTransportes();
        // $cantidadTransportesHabilitadas = $datosEstadisticos->cantidadTransportesHabilitadas();


        include_once("vistas/cursos_capacitaciones/imprimir.php");
    }

    public function imprimirInfo()
    {
        $id_agencia = $_GET['id'];

        $agenciaInfo = new CursosModelo();

        $TransportesInfomacion = $agenciaInfo->buscar($id_agencia);


        $contactosDeagencia = new ContactosInfo();
        $agenciaTelefonoInfo = $contactosDeagencia->consultarTelefonos($id_agencia);
        $agenciaTelefonoFijo = $contactosDeagencia->consultarTelefonosFijos($id_agencia);
        $agenciaCorreo = $contactosDeagencia->consultarCorreo($id_agencia);
        $agenciaFacebook = $contactosDeagencia->consultarFacebook($id_agencia);
        $agenciaInstagram = $contactosDeagencia->consultarInstagram($id_agencia);
        $agenciaTwitter = $contactosDeagencia->consultarTwitter($id_agencia);
        $agenciaWeb = $contactosDeagencia->consultarWeb($id_agencia);
        $agenciaOtro = $contactosDeagencia->consultarOtro($id_agencia);

        include_once("vistas/cursos_capacitaciones/invoice-print.php");
    }
}
