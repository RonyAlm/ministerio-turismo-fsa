<?php

include_once("modelos/personal.php");
include_once("conexion.php");




class ControladorPersonal
{

    public function inicio()
    { //aca se muestra las tablas

        $consulta = new PersonalModelo();

        $tabla = $consulta->consultar();

        $select_tipo_agencia = new PersonalModelo();

        $buscarSelectPersonal = $select_tipo_agencia->buscarSelectPersonal();

        // print_r($_POST);

        if ($_POST) {
            // print_r($_POST);
            $insertarModelLic = new PersonalModelo();

            $selectPersonal = $_POST['selectPersonal23'];
            $fechaIniLicencia = $_POST['fechaIniLicencia'];
            $fechafinLicencia = $_POST['fechafinLicencia'];
            $fechaIniArticulo = $_POST['fechaIniArticulo'];

            $licencia = $_POST['licencia'];
            $articulo = $_POST['articulo'];

            $cantidadlicenciaF = $_POST['lista2'];
            $CantLicenciaRestante = $_POST['CantLicencia'];
            // $articulo = $_POST['articulo'];




            $agregarLiAr = $insertarModelLic->agregarLiAr(
                $selectPersonal,
                $fechaIniLicencia,
                $fechafinLicencia,
                $CantLicenciaRestante,
                $fechaIniArticulo,
                $licencia,
                $articulo,
                $cantidadlicenciaF
            );
        }


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


        include_once("vistas/modales/modal_ag_li_pe.php");
    }
    public function editar()
    {

        $id = $_GET["id"];
        $idPersona = $_GET["idPersona"];

        $select_tipo = new PersonalModelo();

        $buscarSelectLocalidad = $select_tipo->buscarSelectLocalidad();
        $buscarSelectEstudios = $select_tipo->buscarSelectEstudios();
        $buscarSelectDepartamento = $select_tipo->buscarSelectDepartamento();
        $buscarSelectCargo = $select_tipo->buscarSelectCargo();
        $buscarSelectRol = $select_tipo->buscarSelectRol();
        $buscarSelectArea = $select_tipo->buscarSelectArea();
        $buscarSelectContrato = $select_tipo->buscarSelectContrato();
        $consultarCantidLicenciaEditar = $select_tipo->buscarCantidadLicencia($id);
        $buscarCantidadArticuloEditar = $select_tipo->buscarCantidadArticulo($id);

        // print_r($consultarLicencias);

        // //print_r("$idAgencia");
        // /*----------BUSCA LOS POST QUE SE ENCUENTRA EN EDITAR.PHP PARA PODER EDITARLO----------*/

        if ($_POST) {
            $EditarAgencia = new PersonalModelo();

            // print_r($_POST);

            // PERSONA
            $id_persona = $_POST['id_persona'];
            $nombre = $_POST['nombre'];
            $apellido = $_POST['apellido'];
            $cuil = $_POST['cuil'];
            $fecha = $_POST['fecha'];
            $profesion = $_POST['profesion'];
            $educacionID = $_POST['educacionID'];
            $educacion = $_POST['educacion'];


            // PERSONAL 
            $id_Personal = $_POST['id_Personal'];
            $n_legajo = $_POST['n_legajo'];
            $n_expediente = $_POST['n_expediente'];
            $antiguedad = $_POST['antiguedad'];
            $departamentoID = $_POST['departamentoID'];
            $departamento = $_POST['departamento'];
            $areaID = $_POST['areaID'];
            $area = $_POST['area'];
            $cargoID = $_POST['cargoID'];
            $tipoCargo = $_POST['tipoCargo'];
            $tipoContratoID = $_POST['tipoContratoID'];
            $tipo_contrato = $_POST['tipo_contrato'];


            // DIRECCION
            $idDireccion = $_POST['DomicilioID'];
            $rela_localidad_direccion = $_POST['localidad'];
            $calle_direccion = $_POST['direccion'];

            // CONTACTOS 

            $idtelefonoAgencia = $_POST['agenciatelefonoID'];
            $telefonoCel = $_POST['telefonoCel'];

            $idtelefonoFijo = $_POST['telFijoID'];
            $telefonoFijoAgencia = $_POST['telefonoFijoAgencia'];

            $idcorreo = $_POST['CorreoID'];
            $correo = $_POST['correo'];

            // LICENCIAS
            $licenciasID = $_POST['licenciasID'];
            $fechaini = $_POST['fechaini'];
            $fechafin = $_POST['fechafin'];
            $diasRestID = $_POST['diasRestID'];
            $diasrestante = $_POST['diasrestante'];

            // ARTICULO

            $articuloID = $_POST['articuloID'];
            $fechainiArticulo = $_POST['fechainiArticulo'];



            // var_dump($probando);



            $EditarAgencia->editar(
                $nombre,
                $apellido,
                $cuil,
                $fecha,
                $profesion,
                $educacion,
                $n_legajo,
                $n_expediente,
                $antiguedad,
                $departamento,
                $area,
                $tipoCargo,
                $tipo_contrato,
                $rela_localidad_direccion,
                $calle_direccion,
                $telefonoCel,
                $telefonoFijoAgencia,
                $correo,
                $fechaini,
                $fechafin,
                $diasrestante,

                $id_persona,
                $educacionID,
                $id_Personal,
                $departamentoID,
                $areaID,
                $cargoID,
                $tipoContratoID,
                $idDireccion,
                $idtelefonoAgencia,
                $idtelefonoFijo,
                $idcorreo,
                $licenciasID,
                $diasRestID,
                $articuloID,
                $fechainiArticulo
            );

            // print_r($EditarAgencia);



            // header("Location:admin/index2.php?controlador=agencias&accion=inicio");
            echo "<script>location.href = 'index2.php?controlador=personal&accion=inicio';</script>";
        }


        // /*----------BUSCA LOS ID Y LOS PONE EN EL FORMULARIO----------*/

        $contactosDeagencia = new ContactosPersonal();

        $contactosDeagencia1 = new ContactosInfoPersonal();

        $agenciaTelefono = $contactosDeagencia1->consultarTelefonos($idPersona);
        $agenciaTelefonoFijo = $contactosDeagencia->consultarTelefonosFijos($idPersona);
        $agenciaCorreo = $contactosDeagencia->consultarCorreo($idPersona);
        $agenciaFacebook = $contactosDeagencia->consultarFacebook($idPersona);
        $agenciaInstagram = $contactosDeagencia->consultarInstagram($idPersona);
        $agenciaTwitter = $contactosDeagencia->consultarTwitter($idPersona);
        $agenciaWeb = $contactosDeagencia->consultarWeb($idPersona);
        $agenciaOtro = $contactosDeagencia->consultarOtro($idPersona);
        $consultarLicencias = $contactosDeagencia->consultarLicencias($id);
        $consultarArticulo = $contactosDeagencia->consultarArticulo($id);


        // if (is_array($consultarLicenciasa) || is_object($consultarLicenciasa)) {
        //     echo "holaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholahola";
        // } ESTO VERIFICA SI ES UN ARRAY O UN OBJETO

        $buscarID = new PersonalModelo();

        $editar = $buscarID->buscar($id);





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


        // $contactosDeagencia = new ContactosInfoPersonal();
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
    public function infopersonal()
    {
        $id = $_GET['id'];
        $idpersona = $_GET['idPersona'];

        // echo $id;

        $Info = new PersonalModelo();


        $Infomacion = $Info->buscar($id);


        $contactosDeagencia = new ContactosInfoPersonal();
        $agenciaTelefonoInfo = $contactosDeagencia->consultarTelefonos($idpersona);
        $agenciaTelefonoFijo = $contactosDeagencia->consultarTelefonosFijos($idpersona);
        $agenciaCorreo = $contactosDeagencia->consultarCorreo($idpersona);
        // $agenciaFacebook = $contactosDeagencia->consultarFacebook($id_agencia);
        // $agenciaInstagram = $contactosDeagencia->consultarInstagram($id_agencia);
        // $agenciaTwitter = $contactosDeagencia->consultarTwitter($id_agencia);
        // $agenciaWeb = $contactosDeagencia->consultarWeb($id_agencia);
        // $agenciaOtro = $contactosDeagencia->consultarOtro($id_agencia);

        include_once("vistas/personal/infopersonal.php");
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
            // echo "</>";
            $random = random_int(1000, 9999);
            $contraseña = $usuario . $random;
            str_replace(" ", "", $contraseña);

            // $insertar->guardar(
            //     $nombre,
            //     $apellido,
            //     $cuil,
            //     $profesion,
            //     $fecha,
            //     $educacion,
            //     $rela_localidad_direccion,
            //     $calle_direccion,
            //     $telefonoCel,
            //     $telefonoFijo,
            //     $correo,
            //     $departamento,
            //     $area,
            //     $n_legajo,
            //     $n_expediente,
            //     $tipo_contrato,
            //     $cargo,
            //     $usuario,
            //     $contraseña,
            //     $antiguedad,
            //     $fechaini,
            //     $fechafin,
            //     $diasrestante
            // );


            // header("Location:index2.php?controlador=personal&accion=inicio");
            // echo "<script>location.href = 'index2.php?controlador=personal&accion=inicio';</script>";
        }

        include_once("vistas/personal/guardar.php");
    }

    public function licArt()
    {
        $conexionBD = BD::crearInstancia();

        // print_r($_POST['personal']);

        $personal = $_POST['personal'];





        include_once("vistas/personal/rellenar.php");
    }
}
