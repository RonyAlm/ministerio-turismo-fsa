<?php
require_once 'vistas/recursos/libreria/json/vendor/autoload.php';
require_once 'vistas/recursos/vendor/autoload.php';
// require_once 'vistas/recursos/vendo';

use PhpOffice\PhpSpreadsheet\IOFactory;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use GuzzleHttp\Client;

class AsistenciaModelo
{

    public $listaAgencia;
    public $listaAgenciaID;
    public $listaBuscar;
    private $datos;
    private $hoja_datos;


    public function __construct()
    {
        $this->listaAgencia = array();
        $this->listaAgenciaID = array();
        $this->listaBuscar = array();
    }
    public function generarResumen($archivo)
    {
        $file = fopen($archivo, "r, 'UTF-8'");
        if ($file === false) {
            throw new Exception("No se pudo abrir el archivo: " . $archivo);
        }

        $content = '';
        while (($line = fgets($file)) !== false) {
            $line = trim($line);
            $line = addslashes($line);
            $content .= $line . ' ';
        }
        fclose($file);
        $content = utf8_encode($content);

        $client = new Client([
            'base_uri' => 'https://api.openai.com',
        ]);

        $response = $client->post('/v1/engines/text-davinci-003/completions', [
            'headers' => [
                'Authorization' => 'Bearer ',
            ],
            'json' => [
                'prompt' => 'Genera un resumen del texto: ' . $content,
                'max_tokens' => 100,
                'temperature' => 0.7,
            ],
        ]);

        $json = json_decode($response->getBody(), true);
        $summary = $json['choices'][0]['text'];

        return $summary;
    }
    // esto es para agregar al excel
    public function getHojaDatos()
    {
        return $this->hoja_datos;
    }

    public function generarExcel($datos_file)
    {
        $documento = new Spreadsheet();
        $hoja_nueva = $documento->getActiveSheet();

        $this->datos = IOFactory::load($datos_file);
        $this->datos->setActiveSheetIndex(0);
        $this->hoja_datos = $this->datos->getActiveSheet();

        foreach ($this->hoja_datos->getRowIterator() as $fila) {
            $datos_fila = $fila->getcellIterator();
            $columna = 'A';
            foreach ($datos_fila as $dato) {
                $hoja_nueva->setCellValue($columna . $fila->getRowIndex(), $dato->getValue());
                $columna++;
            }
        }

        $writer = new Xlsx($documento);
        $writer->save('datos.xlsx');
    }
    public function generarResumenYExcel($datos_file)
    {
        $reader = IOFactory::createReader('Pdf');
        $reader->setReadDataOnly(true);
        $spreadsheet = $reader->load($datos_file);


        $worksheet = $spreadsheet->getActiveSheet();
        $text = $worksheet->toArray();
        $text = implode("\n", array_map(function ($row) {
            return implode(" ", $row);
        }, $text));

        $client = new Client([
            'base_uri' => 'https://api.openai.com',
        ]);
        // $hola = new Client();

        $response = $client->post('/v1/engines/davinci-codex/completions', [
            'headers' => [
                'Authorization' => 'Bearer sk-',
            ],
            'json' => [
                'prompt' => 'Genera un resumen del texto: ' . $text,
                'max_tokens' => 100,
                'temperature' => 0.7,
            ],
        ]);

        $json = json_decode($response->getBody(), true);
        $summary = $json['choices'][0]['text'];

        $documento = new Spreadsheet();
        $hoja_nueva = $documento->getActiveSheet();

        $this->datos = IOFactory::load($datos_file);
        $this->datos->setActiveSheetIndex(0);
        $this->hoja_datos = $this->datos->getActiveSheet();

        foreach ($this->hoja_datos->getRowIterator() as $fila) {
            $datos_fila = $fila->getcellIterator();
            $columna = 'A';
            foreach ($datos_fila as $dato) {
                $hoja_nueva->setCellValue($columna . $fila->getRowIndex(), $dato->getValue());
                $columna++;
            }
        }

        $writer = new Xlsx($documento);
        $writer->save('datos.xlsx');

        return array("resumen" => $summary, "excel" => "datos.xlsx");
    }

    public function consultar()
    {

        $conexionBD = BD::crearInstancia();

        $sql = $conexionBD->query("SELECT `id_asistencia3`, `nombre_personal`, `fecha_asistencia`, `hora_asistencia`, `checkinout` FROM `asistencia3`");

        //recuperamos los datos y los retornamos

        while ($filas = $sql->fetch(PDO::FETCH_ASSOC)) {
            $this->listaAgencia[] = $filas;
        }
        return $this->listaAgencia; //este return se va a llamar en el controlador_alojamiento.php clase inicio

    }

    // public function crear($lineas)
    // {

    //     $conexionBD = BD::crearInstancia();

    //     $i = 0;

    //     $inicio = new DateTime('2022-01-01');
    //     $fin = new DateTime('2023-12-31');
    //     $meses = array();

    //     while ($inicio <= $fin) {
    //         $nombre_mes = strtolower($inicio->format('F_Y'));
    //         $desde = $inicio->format('Y-m-d');
    //         $hasta = $inicio->format('Y-m-t');
    //         $meses[$nombre_mes] = array('desde' => $desde, 'hasta' => $hasta);
    //         $inicio->modify('+1 month');
    //     }

    //     // Usamos la función array_filter para eliminar las líneas vacías
    //     $lineas = array_filter($lineas);
    //     // Usamos la función array_map para aplicar la función trim a cada línea, lo que elimina los espacios en blanco al principio y al final
    //     $lineas = array_map('trim', $lineas);
    //     // Usamos el método array_map para aplicar la función explode a cada línea, lo que crea una matriz de valores separados por comas
    //     $datos = array_map(function ($linea) {
    //         return explode(',', $linea);
    //     }, $lineas);

    //     // Usamos la función array_filter para eliminar los datos vacíos
    //     $datos = array_filter($datos);


    //     foreach ($datos as $datos_linea) {


    //         // Procesamos cada línea como antes, pero ahora estamos trabajando con una sola matriz de datos
    //         $nombre = !empty($datos_linea[0]) ? $datos_linea[0] : '';
    //         $id = !empty($datos_linea[1]) ? $datos_linea[1] : '';
    //         $fecha = !empty($datos_linea[3]) ? $datos_linea[3] : '';
    //         $hora = !empty($datos_linea[4]) ? $datos_linea[4] : '';
    //         $in = !empty($datos_linea[5]) ? $datos_linea[5] : '';
    //         $checkInOn = !empty($datos_linea[9]) ? $datos_linea[9] : '';

    //         if ($fecha >= "2023-01-01") {
    //             /*-------- VERIFICAMOS SI EL EMPLEADO YA EXISTE EN LA BD --------*/
    //             $sqlVerificar = $conexionBD->prepare("SELECT COUNT(*) as existente FROM `asistencia3` WHERE `nombre_personal` = ? AND `fecha_asistencia` = ?");
    //             $sqlVerificar->execute(array($nombre, $fecha));
    //             $resultadoVerificar = $sqlVerificar->fetch(PDO::FETCH_ASSOC);

    //             if ($resultadoVerificar['existente'] == 0) {
    //                 /*-------- INSERTAMOS--------*/
    //                 $sqlDireccion = $conexionBD->prepare("INSERT INTO `asistencia3`(`nombre_personal`, `fecha_asistencia`, `hora_asistencia`,`checkinout`) 
    //                             VALUES (?,?,?,?)");

    //                 $sqlDireccion->execute(array($nombre, $fecha, $hora, $checkInOn));
    //                 echo '<div>' . $nombre . ". " . $fecha . ". " . $hora . ". " . $checkInOn . '</div>';
    //             }
    //         };

    //         $i++;
    //     }
    // }
    public function crear($lineas)
    {
        $conexionBD = BD::crearInstancia();

        // Usamos la función array_filter para eliminar las líneas vacías
        $lineas = array_filter($lineas);
        // Usamos la función array_map para aplicar la función trim a cada línea, lo que elimina los espacios en blanco al principio y al final
        $lineas = array_map('trim', $lineas);
        // Usamos el método array_map para aplicar la función str_getcsv a cada línea, lo que crea un array de valores separados por comas
        $datos = array_map('str_getcsv', $lineas);

        // Eliminamos la primera fila (encabezado) del archivo
        unset($datos[0]);

        // Contador para el seguimiento de filas insertadas
        $filasInsertadas = 0;

        foreach ($datos as $datos_linea) {
            // Procesamos cada línea como antes, pero ahora estamos trabajando con una sola matriz de datos
            $nombre = !empty($datos_linea[0]) ? $datos_linea[0] : '';
            // No se usa la variable $id en este contexto, se omitirá
            $fecha = !empty($datos_linea[2]) ? $datos_linea[2] : '';
            $hora = !empty($datos_linea[3]) ? $datos_linea[3] : '';
            // No se usa la variable $in en este contexto, se omitirá
            $checkInOn = !empty($datos_linea[9]) ? $datos_linea[9] : '';

            if ($fecha >= "2023-01-01") {
                // Verificamos si el empleado ya existe en la BD
                $sqlVerificar = $conexionBD->prepare("SELECT COUNT(*) as existente FROM `asistencia3` WHERE `nombre_personal` = ? AND `fecha_asistencia` = ?");
                $sqlVerificar->execute(array($nombre, $fecha));
                $resultadoVerificar = $sqlVerificar->fetch(PDO::FETCH_ASSOC);

                if ($resultadoVerificar['existente'] == 0) {
                    // Insertamos los datos si el empleado no existe en la BD
                    $sqlDireccion = $conexionBD->prepare("INSERT INTO `asistencia3`(`nombre_personal`, `fecha_asistencia`, `hora_asistencia`,`checkinout`) 
                            VALUES (?,?,?,?)");

                    // $sqlDireccion->execute(array($nombre, $fecha, $hora, $checkInOn));
                    // Incrementamos el contador de filas insertadas
                    $filasInsertadas++;
                    // Imprimimos para verificación, puedes eliminar esta línea si no es necesaria
                    echo '<div>' . $nombre . ". " . $fecha . ". " . $hora . ". " . $checkInOn . '</div>';
                }
            }
        }
        // Mostrar el total de filas insertadas
        echo "Total de filas insertadas: " . $filasInsertadas;
    }
}



class estadistica
{


    public function cantidadAgencias()
    {

        $conexionBD = BD::crearInstancia();


        $sqlestadistica = $conexionBD->query("SELECT COUNT(*) conteo FROM `agencias`");

        $sqlestadistica->execute();

        return $sqlestadistica->fetchAll(PDO::FETCH_OBJ);
    }

    public function cantidadAgenciasHabilitadas()
    {

        $conexionBD = BD::crearInstancia();


        $sqlestadistica = $conexionBD->query("SELECT COUNT(estado_actividad.rela_estado_agencia) conteo 
                                                    FROM `estado_actividad` 
                                                    WHERE  estado_actividad.rela_tipo_estado = 1");

        $sqlestadistica->execute();

        return $sqlestadistica->fetchAll(PDO::FETCH_OBJ);
    }
}
