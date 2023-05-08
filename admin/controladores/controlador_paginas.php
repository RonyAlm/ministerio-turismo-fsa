<?php
include_once("modelos/paginas.php");
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

                    echo '<pre>';
                    echo "esto es un idtarea ";
                    print_r($idtarea);
                    echo '</pre>';
                    echo '<pre>';
                    echo "esto es un tarea ";
                    print_r($tareacheckbox);
                    echo '</pre>';


                    $paginasModelo->actualizar($idtarea, $tareacheckbox);
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

    public function error()
    {
        include_once("vistas/paginas/error.php");
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
