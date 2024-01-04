<?php
// Iniciar el búfer de salida para almacenar la salida
ob_start();
include_once("modelos/agencias.php");
include_once("conexion.php");


class ControladorAgencias
{

    public function inicio()
    { //aca se muestra las tablas

        $consultaAgencia = new AgenciaModelo();

        $tablaAgencia = $consultaAgencia->consultar();
        $designacion = $consultaAgencia->consultar();
        $datosEstadisticos = new estadistica();

        $cantidad_agencias = $datosEstadisticos->cantidadAgencias();
        $cantidadAgenciasHabilitadas = $datosEstadisticos->cantidadAgenciasHabilitadas();

        if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['submitAgregarArchivo'])) {
            // Obtener los datos del formulario

            $selectDesignacion = isset($_POST['selectDesignacion']) ? $_POST['selectDesignacion'] : "";

            // Definir la carpeta de destino
            $carpeta_destino = "files/";

            // Verificar si la carpeta de destino existe, si no, crearla
            if (!is_dir($carpeta_destino)) {
                mkdir($carpeta_destino, 0777, true);
            }

            // Obtener el nombre y la extensión del archivo
            $nombre_archivo = basename($_FILES["archivo"]["name"]);
            $extension = strtolower(pathinfo($nombre_archivo, PATHINFO_EXTENSION));

            // Validar la extensión del archivo
            if ($extension == "pdf" || $extension == "doc" || $extension == "docx") {

                // Mover el archivo a la carpeta de destino
                if (move_uploaded_file($_FILES["archivo"]["tmp_name"], $carpeta_destino . $nombre_archivo)) {
                    // Insertar la información del archivo en la base de datos
                    // Llamar al modelo para agregar el archivo
                    $insertarArchivo = new AgenciaModelo();
                    $insertarArchivo->agregarArchivo($selectDesignacion, $nombre_archivo);

                    if ($insertarArchivo) {
                        echo "<script language='JavaScript'>
                                alert('Archivo Subido');
                                location.href='index2.php?controlador=agencias&accion=inicio';
                                </script>";
                    } else {

                        echo "<script language='JavaScript'>
                                alert('Error al subir el archivo: ');
                                location.href='index2.php?controlador=agencias&accion=inicio';
                                </script>";
                    }
                } else {
                    echo "<script language='JavaScript'>
                            alert('Error al subir el archivo. ');
                            location.href='index2.php?controlador=agencias&accion=inicio';
                            </script>";
                }
            } else {
                echo "<script language='JavaScript'>
                        alert('Solo se permiten archivos PDF, DOC y DOCX.');
                        location.href='index2.php?controlador=agencias&accion=inicio';
                        </script>";
            }
        }



        include_once("vistas/agencias/inicio.php");
    }

    public function crear()
    {
        // ESTÓ ES PARA LA AUDITORÍA
        global $accion, $controlador1;
        global $id;
        //
        echo '<pre>';
        print_r($controlador1);
        echo '</pre>';


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
            if ($insertarAgencia) {
                $insertarAgencia->trigger($accion, $id, $controlador1);
                // print_r($insertar);
                // print_r($usuario_crear);
                echo "<script>location.href='index2.php?controlador=agencias&accion=inicio';</script>";
            }

            echo "<script>location.href='index2.php?controlador=agencias&accion=inicio';</script>";

            // header("Location:index2.php?controlador=agencias&accion=inicio");
        }


        include_once("vistas/agencias/crear.php");
    }

    public function editar()
    {
        // ESTÓ ES PARA LA AUDITORÍA
        global $accion, $controlador1;
        global $id;
        //
        echo '<pre>';
        print_r($controlador1);
        echo '</pre>';


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
            if ($EditarAgencia) {
                $EditarAgencia->trigger($accion, $id, $controlador1);
                // print_r($insertar);
                // print_r($usuario_crear);
                echo "<script>location.href='index2.php?controlador=agencias&accion=inicio';</script>";
            }

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


        $buscarID = new AgenciaModelo();

        $editar = $buscarID->buscar($idAgencia);

        $InsertarID = $buscarID->consultarID($idAgencia);


        include_once("vistas/agencias/editar.php");
    }

    public function borrar()
    {
        //print_r($_GET);
        // ESTÓ ES PARA LA AUDITORÍA
        global $accion, $controlador1;
        global $id;
        //
        echo '<pre>';
        print_r($controlador1);
        echo '</pre>';

        $idAgenciaBorrar = $_GET["id"];
        $id_direccion = $_GET['idDireccion'];
        $idRazonSocial = $_GET['idRazonSocial'];

        $borrarAgencias = new AgenciaModelo();

        $buscarIDBorrado = $borrarAgencias->consultarID($idAgenciaBorrar);

        $borrarAgencias->borrar($idAgenciaBorrar, $id_direccion, $idRazonSocial);
        if ($borrarAgencias) {
            $borrarAgencias->trigger($accion, $id, $controlador1);
            // print_r($insertar);
            // print_r($usuario_crear);
            echo "<script>location.href='index2.php?controlador=agencias&accion=inicio';</script>";
        }

        header("Location:index2.php?controlador=agencias&accion=inicio");
    }

    public function info()
    {
        $id_agencia = $_GET['id'];

        $agenciaInfo = new AgenciaModelo();

        $agenciasInfomacion = $agenciaInfo->buscar($id_agencia);

        $archivosDeLaBaseDeDatos = $agenciaInfo->buscarArchivo($id_agencia);

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
        $consultaAgencia = new AgenciaModelo();

        $tablaAgencia = $consultaAgencia->consultar();
        $datosEstadisticos = new estadistica();

        $cantidad_agencias = $datosEstadisticos->cantidadAgencias();
        $cantidadAgenciasHabilitadas = $datosEstadisticos->cantidadAgenciasHabilitadas();


        include_once("vistas/agencias/imprimir.php");
    }

    public function imprimirInfo()
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

        include_once("vistas/agencias/invoice-print.php");
    }
    public function descargarArchivo()
    {
        // Limpiar cualquier búfer de salida existente
        ob_clean();
        $archivoID = $_GET['id'];

        $agenciaModelo = new AgenciaModelo();

        // Obtener el archivo de la base de datos según el ID proporcionado
        $archivo = $agenciaModelo->buscarArchivo1($archivoID);

        if ($archivo) {
            // Habilitar el almacenamiento en búfer de salida
            ob_start();
            $ruta_archivo = "files/" . $archivo['archivo_documento'];

            // Verificar que el archivo exista en el servidor
            if (file_exists($ruta_archivo)) {
                // Configurar las cabeceras para la descarga
                header('Content-Description: File Transfer');
                header('Content-Type: application/octet-stream');
                header('Content-Disposition: attachment; filename="' . basename($ruta_archivo) . '"');
                header('Expires: 0');
                header('Cache-Control: must-revalidate');
                header('Pragma: public');
                header('Content-Length: ' . filesize($ruta_archivo));

                // Leer el archivo y enviarlo al navegador
                readfile($ruta_archivo);
                // Limpiar el búfer de salida y enviar todo el contenido al navegador
                ob_end_flush();

                // Finalizar la ejecución del script para evitar que se agreguen otros contenidos
                exit;
            } else {
                echo "El archivo no existe en el servidor.";
            }
        } else {
            // Manejar el caso cuando el archivo no se encuentra
            echo "Archivo no encontrado en la base de datos.";
        }
        include_once("vistas/agencias/includes/download.php");
    }
}
