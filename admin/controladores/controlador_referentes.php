<?php
include_once("modelos/referentes.php");
include_once("conexion.php");



class ControladorReferentes
{

    public function inicio()
    { //aca se muestra las tablas
        $consultaReferente = new ReferenteModelo();

        $tablaReferente = $consultaReferente->consultar();

        $estadistica = $consultaReferente->estadistica();
        $estadistica2 = $consultaReferente->estadisticaSedesTurismo();

        //print_r($estadistica);

        include_once("vistas/referentes_municipio/inicio.php");
    }

    public function crear()
    {

        $select_tipo_referente = new ReferenteModelo();

        $buscarSelectLocalidad = $select_tipo_referente->buscarSelectLocalidad();
        $buscarSelectEncargado = $select_tipo_referente->buscarSelectEncargado();

        if ($_POST) {
            //print_r($_POST);

            $insertarReferente = new ReferenteModelo();

            $nombreReferente = $_POST['nombreReferente'];

            $localidadReferente = $_POST['localidadReferente'];

            $domicilioReferente = $_POST['domicilioReferente'];
            $referenteEncargado = $_POST['referenteEncargado'];

            $telefonoReferente = $_POST['telefonoReferente'];
            $telefonoFijoReferente = $_POST['telefonoFijoReferente'];
            $correoReferente = $_POST['correoReferente'];
            $facebookReferente = $_POST['facebookReferente'];
            $instagramReferente = $_POST['instagramReferente'];
            $twitterReferente = $_POST['twitterReferente'];
            $webReferente = $_POST['webReferente'];
            $otroReferente = $_POST['otroReferente'];

            $insertarReferente->crear(
                $nombreReferente,
                $localidadReferente,
                $domicilioReferente,
                $telefonoReferente,
                $telefonoFijoReferente,
                $correoReferente,
                $facebookReferente,
                $instagramReferente,
                $twitterReferente,
                $webReferente,
                $otroReferente,
                $referenteEncargado
            );

            header("Location:./index2.php?controlador=referentes&accion=inicio");
        }


        include_once("vistas/referentes_municipio/crear.php");
    }
    public function editar()
    { //aca se muestra las tablas

        $idReferente = $_GET["id"];
        $buscarReferente = new ReferenteModelo();
        $buscarSelectLocalidad = $buscarReferente->buscarSelectLocalidad();
        $buscarSelectEncargado = $buscarReferente->buscarSelectEncargado();

        if ($_POST) {
            print_r($_POST);

            $insertarReferente = new ReferenteModelo();

            $referenteID = $_POST['referenteID'];
            $nombreReferente = $_POST['nombreReferente'];

            $referenteLocalidadID = $_POST['referenteLocalidadID'];
            $localidadReferente = $_POST['localidadReferente'];
            $referenteDomicilioID = $_POST['referenteDomicilioID'];
            $domicilioReferente = $_POST['domicilioReferente'];

            $referenteEncargadoID = $_POST['referenteEncargadoID'];
            $referenteEncargado = $_POST['referenteEncargado'];

            $referentetelefonoID = $_POST['referentetelefonoID'];
            $telefonoReferente = $_POST['telefonoReferente'];

            $telFijoID = $_POST['telFijoID'];
            $telefonoFijoReferente = $_POST['telefonoFijoReferente'];

            $referenteCorreoID = $_POST['referenteCorreoID'];
            $correoReferente = $_POST['correoReferente'];

            $referenteFacebookID = $_POST['referenteFacebookID'];
            $facebookReferente = $_POST['facebookReferente'];

            $referenteInstagramID = $_POST['referenteInstagramID'];
            $instagramReferente = $_POST['instagramReferente'];

            $referenteTwitterID = $_POST['referenteTwitterID'];
            $twitterReferente = $_POST['twitterReferente'];

            $referenteWebID = $_POST['referenteWebID'];
            $webReferente = $_POST['webReferente'];

            $referenteOtroID = $_POST['referenteOtroID'];
            $otroReferente = $_POST['otroReferente'];

            $insertarReferente->editar(
                $nombreReferente,
                $localidadReferente,
                $domicilioReferente,
                $telefonoReferente,
                $telefonoFijoReferente,
                $correoReferente,
                $facebookReferente,
                $instagramReferente,
                $twitterReferente,
                $webReferente,
                $otroReferente,
                $referenteID,
                $referenteLocalidadID,
                $referentetelefonoID,
                $telFijoID,
                $referenteCorreoID,
                $referenteFacebookID,
                $referenteInstagramID,
                $referenteTwitterID,
                $referenteWebID,
                $referenteOtroID,
                $referenteDomicilioID,
                $referenteEncargado
            );

            header("Location: index2.php?controlador=referentes&accion=inicio");
        }

        $contactosReferentes = new ContactosReferentes();
        $referenteTelefono = $contactosReferentes->consultarTelefonos($idReferente);
        $referenteTelefonoFijo = $contactosReferentes->consultarTelefonosFijos($idReferente);
        $referenteCorreo = $contactosReferentes->consultarCorreo($idReferente);
        $referenteFacebook = $contactosReferentes->consultarFacebook($idReferente);
        $referenteInstagram = $contactosReferentes->consultarInstagram($idReferente);
        $referenteTwitter = $contactosReferentes->consultarTwitter($idReferente);
        $referenteWeb = $contactosReferentes->consultarWeb($idReferente);
        $referenteOtro = $contactosReferentes->consultarOtro($idReferente);

        $buscarID = new ReferenteModelo();

        $editar = $buscarID->buscar($idReferente);

        $InsertarID = $buscarID->consultarID($idReferente);


        include_once("vistas/referentes_municipio/editar.php");
    }
    public function borrar()
    { //aca se muestra las tablas

        print_r($_GET);

        $borradoReferente = new ReferenteModelo();

        $id = $_GET['id'];
        $id_direccion = $_GET['idDireccion'];

        $borrado = $borradoReferente->borrar($id, $id_direccion);




        header("Location:index2.php?controlador=Referentes&accion=inicio");
    }

    public function info()
    { //aca se muestra las tablas

        $id_referente = $_GET['id'];

        $referenteInfo = new ReferenteModelo();

        $referenteInfo = $referenteInfo->buscar($id_referente);

        $contactosReferentes = new ContactosInfo();
        $referenteTelefono = $contactosReferentes->consultarTelefonos($id_referente);
        $referenteTelefonoFijo = $contactosReferentes->consultarTelefonosFijos($id_referente);
        $referenteCorreo = $contactosReferentes->consultarCorreo($id_referente);
        $referenteFacebook = $contactosReferentes->consultarFacebook($id_referente);
        $referenteInstagram = $contactosReferentes->consultarInstagram($id_referente);
        $referenteTwitter = $contactosReferentes->consultarTwitter($id_referente);
        $referenteWeb = $contactosReferentes->consultarWeb($id_referente);
        $referenteOtro = $contactosReferentes->consultarOtro($id_referente);



        include_once("vistas/referentes_municipio/info.php");
    }




    /*---- FIN DE LA CLASE CONTROLADOR*/
}
