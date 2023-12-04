<?php
include_once("modelos/paginas.php");
include_once("modelos/agencias.php");
include_once("conexion.php");

class ControladorPaginas
{
    public function inicio()
    {
        $paginasModelo = new PaginasModelo();
        $tablaTarea = $paginasModelo->consultar();
        $tablaTimeLine = $paginasModelo->consultarTimeLine();


        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            try {
                if (isset($_POST['nuevaTarea'])) {
                    // Crear una nueva tarea
                    $nuevaTarea = $_POST['nuevaTarea'];
                    if (empty($nuevaTarea)) {
                        throw new Exception('La tarea no puede estar vacía');
                    }
                    $paginasModelo->crear($nuevaTarea);
                } elseif (isset($_GET['idcheckbox']) && isset($_GET['checkboxtarea'])) {
                    // Actualizar el estado de una tarea existente
                    $idtarea = $_GET['idcheckbox'];
                    $tareacheckbox = $_GET['checkboxtarea'];


                    $paginasModelo->actualizar($idtarea, $tareacheckbox);
                } elseif (isset($_POST['nuevoTexto']) && isset($_POST['checkboxIdedit'])) {
                    // Actualizar el estado de una tarea existente
                    $nuevotexto = $_POST['nuevoTexto'];
                    $nuevotextoid = $_POST['checkboxIdedit'];


                    $paginasModelo->editartarea($nuevotextoid, $nuevotexto);
                } else {
                    throw new Exception('Solicitud no válida');
                }

                // Devuelve la respuesta como un JSON
                $jsonResponse = new JsonResponse('success');
                $jsonResponse->send();
                exit();
            } catch (Exception $e) {
                $jsonResponse = new JsonResponse($e->getMessage());
                $jsonResponse->send();
                exit();
            }
        } else {
            // Si la solicitud no es por POST, muestra la página de inicio
            include_once("vistas/paginas/inicio.php");
        }
    }
    public function juego()
    {
        $paginasModelo = new PaginasModelo();
        $tablaPreguntas = $paginasModelo->consultarPreguntas();

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            // Obtener todas las respuestas enviadas
            $respuestas = $_POST;

            // Hacer algo con las respuestas (procesarlas, almacenarlas, etc.)
            print_r($respuestas);
        }
        // Pasar las preguntas y las respuestas correctas a la vista juego.php
        include_once("vistas/paginas/juego.php");
    }



    public function buscar()
    {
        // Recoge la entrada del formulario de búsqueda
        $terminoBusqueda = $_POST['busquedaGeneral'];


        // Realiza la búsqueda en los módulos y obtiene los resultados
        $resultados = $this->buscarEnModulos($terminoBusqueda);
        // print_r($resultados);

        // Pasa los resultados a la vista
        include_once("vistas/paginas/busqueda.php");
    }

    private function buscarEnModulos($terminoBusqueda)
    {
        $resultados = [];

        // Agregar aquí la lógica para buscar en cada módulo
        $consultaAgencia = new AgenciaModelo();
        $resultados['agencias'] = $consultaAgencia->buscarPorTermino($terminoBusqueda);

        // $consultarAlojamientos = new Alojamientos();
        // $resultados['alojamientos'] = $consultarAlojamientos->buscarPorTermino($terminoBusqueda);

        // Agregar más módulos aquí...

        return $resultados;
    }

    public function error()
    {
        include_once("vistas/paginas/error.php");
    }
    public function eliminarTarea()
    {

        $paginasModelo = new PaginasModelo();



        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            try {

                if (isset($_POST['id_tarea'])) {
                    // Crear una nueva tarea
                    $id_tarea = $_POST['id_tarea'];

                    $paginasModelo->eliminar($id_tarea);
                    echo "<script>location.href='index2.php?controlador=paginas&accion=inicio';</script>";
                } else {
                    throw new Exception('Solicitud no válida');
                }

                // Devuelve la respuesta como un JSON
                $jsonResponse = new JsonResponse('success');
                $jsonResponse->send();
                exit();
            } catch (Exception $e) {
                $jsonResponse = new JsonResponse($e->getMessage());
                $jsonResponse->send();
                exit();
            }
        } else {
            // Si la solicitud no es por POST, muestra la página de inicio
            include_once("vistas/paginas/inicio.php");
        }
    }

    public function login()
    {
        include_once("vistas/usuarios/login.php");
    }
    public function actualizar()
    {
        try {
            if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
                throw new Exception('Solicitud no válida');
            }

            $datos = json_decode(file_get_contents('php://input'), true);
            $taskId = (int)$datos['taskId'];
            $isChecked = (bool)$datos['isChecked'];

            $paginasModelo = new PaginasModelo();
            // $paginasModelo->actualizar($taskId, $isChecked);

            $jsonResponse = new JsonResponse('success');
            $jsonResponse->send();
            exit();
        } catch (Exception $e) {
            $jsonResponse = new JsonResponse($e->getMessage());
            $jsonResponse->send();
            exit();
        }
    }
}
// Aquí está la clase JsonResponse que se utiliza para manejar la respuesta JSON:
class JsonResponse
{
    private $status;
    private $data;

    public function __construct($status, $data = null)
    {
        $this->status = $status;
        $this->data = $data;
    }

    public function send()
    {
        header('Content-Type: application/json');
        echo json_encode(['status' => $this->status, 'data' => $this->data]);
    }
}
