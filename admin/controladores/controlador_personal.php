<?php

include_once("modelos/personal.php");
include_once("conexion.php");




class ControladorPersonal
{

    public function inicio()
    { //aca se muestra las tablas

        $consulta = new PersonalModelo();

        $tabla = $consulta->consultar();
        // $datosEstadisticos = new estadistica();

        // $cantidad = $datosEstadisticos->cantidadAgencias();
        // $cantidad = $datosEstadisticos->cantidadAgenciasHabilitadas();


        include_once("vistas/personal/inicio.php");
    }
    public function crear()
    {

        $select_tipo_agencia = new PersonalModelo();

        $buscarSelectLocalidad = $select_tipo_agencia->buscarSelectLocalidad();
        // $buscarSelectEstado = $select_tipo_agencia->buscarSelectEstado();

        if ($_POST) {
            //print_r($_POST);

            $insertarAgencia = new PersonalModelo();


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





            // $insertarAgencia->crear(
            //     $descripcion_agencias,
            //     $matricula_agencia,
            //     $legajo_agencia,
            //     $cuit_agencia,
            //     $categoria_agencia,
            //     $rela_localidad_direccion,
            //     $calle_direccion,
            //     $razonsocial,
            //     $telefonoAgencia,
            //     $telefonoFijoAgencia,
            //     $correoAgencia,
            //     $facebookAgencia,
            //     $instagramAgencia,
            //     $twitterAgencia,
            //     $webAgencia,
            //     $otroAgencia,
            //     $estadoAgencia,
            //     $idoneoAgencia
            // );


            header("Location:index2.php?controlador=agencias&accion=inicio");
        }


        include_once("vistas/agencias/crear.php");
    }
    public function editar()
    {

        // $idAgencia = $_GET["id"];

        // $buscarAgencias = new PersonalModelo();

        // $buscarSelectLocalidad = $buscarAgencias->buscarSelectLocalidad();
        // $buscarSelectEstado = $buscarAgencias->buscarSelectEstado();

        // //print_r("$idAgencia");
        // /*----------BUSCA LOS POST QUE SE ENCUENTRA EN EDITAR.PHP PARA PODER EDITARLO----------*/

        // if ($_POST) {
        //     $EditarAgencia = new PersonalModelo();


        //     $idAgencia = $_POST['agenciaID'];
        //     $descripcion_agencias = $_POST['nombreAgencia'];
        //     $matricula_agencia = $_POST['matriculaAgencia'];
        //     $legajo_agencia = $_POST['legajoAgencia'];
        //     $cuit_agencia = $_POST['cuitAgencia'];
        //     $categoria_agencia = $_POST['categoriaAgencia'];
        //     $idoneoAgencia = $_POST['idoneoAgencia'];

        //     $idRazonSocial = $_POST['agenciaRazonID'];
        //     $razonsocial = $_POST['razonsocialAgencia'];

        //     $idDireccion = $_POST['agenciaDomicilioID'];
        //     $rela_localidad_direccion = $_POST['localidadAgencia'];


        //     $calle_direccion = $_POST['domicilioAgencia'];

        //     $idtelefonoAgencia = $_POST['agenciatelefonoID'];
        //     $telefonoAgencia = $_POST['telefonoAgencia'];

        //     $idtelefonoFijoAgencia = $_POST['telFijoID'];
        //     $telefonoFijoAgencia = $_POST['telefonoFijoAgencia'];

        //     $idcorreoAgencia = $_POST['agenciaCorreoID'];
        //     $correoAgencia = $_POST['correoAgencia'];

        //     $idfacebookAgencia = $_POST['agenciaFacebookID'];
        //     $facebookAgencia = $_POST['facebookAgencia'];

        //     $idinstagramAgencia = $_POST['agenciaInstagramID'];
        //     $instagramAgencia = $_POST['instagramAgencia'];

        //     $idtwitterAgencia = $_POST['agenciaTwitterID'];
        //     $twitterAgencia = $_POST['twitterAgencia'];

        //     $idwebAgencia = $_POST['agenciaWebID'];
        //     $webAgencia = $_POST['webAgencia'];

        //     $idotroAgencia = $_POST['agenciaOtroID'];
        //     $otroAgencia = $_POST['otroAgencia'];


        //     $idestadoAgencia = $_POST['agenciaEstadoID'];
        //     $estadoAgencia = $_POST['estadoAgencia'];

        //     $EditarAgencia->editar(
        //         $descripcion_agencias,
        //         $matricula_agencia,
        //         $legajo_agencia,
        //         $cuit_agencia,
        //         $categoria_agencia,
        //         $idAgencia,
        //         $idoneoAgencia,
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

        //         $idRazonSocial,
        //         $idDireccion,
        //         $idtelefonoAgencia,
        //         $idtelefonoFijoAgencia,
        //         $idcorreoAgencia,
        //         $idfacebookAgencia,
        //         $idinstagramAgencia,
        //         $idtwitterAgencia,
        //         $idwebAgencia,
        //         $idotroAgencia,
        //         $idestadoAgencia
        //     );

        //     // print_r($EditarAgencia);



        //     // header("Location:admin/index2.php?controlador=agencias&accion=inicio");
        //     echo "<script>location.href = 'index2.php?controlador=agencias&accion=inicio';</script>";
        // }


        // /*----------BUSCA LOS ID Y LOS PONE EN EL FORMULARIO----------*/

        // $contactosDeagencia = new ContactosAgencia();

        // $contactosDeagencia1 = new ContactosInfo();

        // $agenciaTelefono = $contactosDeagencia1->consultarTelefonos($idAgencia);
        // $agenciaTelefonoFijo = $contactosDeagencia->consultarTelefonosFijos($idAgencia);
        // $agenciaCorreo = $contactosDeagencia->consultarCorreo($idAgencia);
        // $agenciaFacebook = $contactosDeagencia->consultarFacebook($idAgencia);
        // $agenciaInstagram = $contactosDeagencia->consultarInstagram($idAgencia);
        // $agenciaTwitter = $contactosDeagencia->consultarTwitter($idAgencia);
        // $agenciaWeb = $contactosDeagencia->consultarWeb($idAgencia);
        // $agenciaOtro = $contactosDeagencia->consultarOtro($idAgencia);


        // $buscarID = new PersonalModelo();

        // $editar = $buscarID->buscar($idAgencia);

        // $InsertarID = $buscarID->consultarID($idAgencia);


        include_once("vistas/personal/editar.php");
    }

    public function borrar()
    {
        //print_r($_GET);

        $idAgenciaBorrar = $_GET["id"];
        $id_direccion = $_GET['idDireccion'];
        $idRazonSocial = $_GET['idRazonSocial'];

        $borrarAgencias = new PersonalModelo();

        $buscarIDBorrado = $borrarAgencias->consultarID($idAgenciaBorrar);

        $borrado = $borrarAgencias->borrar($idAgenciaBorrar, $id_direccion, $idRazonSocial);

        header("Location:index2.php?controlador=agencias&accion=inicio");
    }

    public function info()
    {
        $id = $_GET['id'];

        $Info = new PersonalModelo();

        $tablaInformes = $Info->info3($id);
        $tablaInfo2 = $Info->info2($id);

        // $agenciasInfomacion = $agenciaInfo->buscar($id_agencia);


        // $contactosDeagencia = new ContactosInfo();
        // $agenciaTelefonoInfo = $contactosDeagencia->consultarTelefonos($id_agencia);
        // $agenciaTelefonoFijo = $contactosDeagencia->consultarTelefonosFijos($id_agencia);
        // $agenciaCorreo = $contactosDeagencia->consultarCorreo($id_agencia);
        // $agenciaFacebook = $contactosDeagencia->consultarFacebook($id_agencia);
        // $agenciaInstagram = $contactosDeagencia->consultarInstagram($id_agencia);
        // $agenciaTwitter = $contactosDeagencia->consultarTwitter($id_agencia);
        // $agenciaWeb = $contactosDeagencia->consultarWeb($id_agencia);
        // $agenciaOtro = $contactosDeagencia->consultarOtro($id_agencia);

        include_once("vistas/personal/info.php");
    }

    public function guardar()
    {
        $select_tipo = new PersonalModelo();

        $buscarSelectLocalidad = $select_tipo->buscarSelectLocalidad();
        $buscarSelectEstudios = $select_tipo->buscarSelectEstudios();
        $buscarSelectDepartamento = $select_tipo->buscarSelectDepartamento();
        $buscarSelectCargo = $select_tipo->buscarSelectCargo();
        $buscarSelectRol = $select_tipo->buscarSelectRol();
        $buscarSelectArea = $select_tipo->buscarSelectArea();
        $buscarSelectContrato = $select_tipo->buscarSelectContrato();

        if ($_POST) {
            // print_r($_POST);

            $insertar = new PersonalModelo();


            $nombre = $_POST['nombre'];
            $apellido = $_POST['apellido'];
            $profesion = $_POST['profesion'];
            $cuil = $_POST['cuil'];
            $fecha = $_POST['fecha'];
            $educacion = $_POST['educacion'];

            $rela_localidad_direccion = $_POST['localidad'];
            $calle_direccion = $_POST['direccion'];

            $telefonoCel = $_POST['telefonoCel'];
            $telefonoFijo = $_POST['telefonoFijo'];
            $correo = $_POST['correo'];

            $departamento = $_POST['departamento'];
            $area = $_POST['area'];
            $n_legajo = $_POST['n_legajo'];
            $n_expediente = $_POST['n_expediente'];
            $tipo_contrato = $_POST['tipo_contrato'];
            $cargo = $_POST['cargo'];
            $antiguedad = $_POST['antiguedad'];

            $fechaini = $_POST['fechaini'];
            $fechafin = $_POST['fechafin'];
            $diasrestante = $_POST['diasrestante'];



            $usuario = $nombre . strtoupper(substr($apellido, 0, 1)) . substr($apellido, 1, 1);

            // lo que estoy haciendo es agarrar el nombre despues poner en may la primera palabra del apellido,
            // y despues la segunda palabra en min.


            str_replace(" ", "", $usuario);
            // echo "</br>";
            $random = random_int(1000, 9999);
            $contraseña = $usuario . $random;
            str_replace(" ", "", $contraseña);

            $insertar->guardar(
                $nombre,
                $apellido,
                $cuil,
                $profesion,
                $fecha,
                $educacion,
                $rela_localidad_direccion,
                $calle_direccion,
                $telefonoCel,
                $telefonoFijo,
                $correo,
                $departamento,
                $area,
                $n_legajo,
                $n_expediente,
                $tipo_contrato,
                $cargo,
                $usuario,
                $contraseña,
                $antiguedad,
                $fechaini,
                $fechafin,
                $diasrestante
            );


            header("Location:index2.php?controlador=personal&accion=inicio");
        }

        include_once("vistas/personal/guardar.php");
    }
}
