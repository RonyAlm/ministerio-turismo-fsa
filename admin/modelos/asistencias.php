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

        $sql = $conexionBD->query("SELECT `id_asistencia4`, `nombre_per`, `fcha_asistencia`, `horas_asistencia`, `checkinout` FROM `asistencia4`");

        //recuperamos los datos y los retornamos

        while ($filas = $sql->fetch(PDO::FETCH_ASSOC)) {
            $this->listaAgencia[] = $filas;
        }
        return $this->listaAgencia; //este return se va a llamar en el controlador_alojamiento.php clase inicio

    }

    public function consultarID($id_agencia)
    {

        $conexionBD = BD::crearInstancia();

        $sql = $conexionBD->query("SELECT id_agencias, razon_social.id_razon_social, direccion.id_direccion,
                                                estado_actividad.id_estado
                                        FROM `agencias`                                    
                                        INNER JOIN razon_social on razon_social.id_razon_social = agencias.rela_razon_social_agencia
                                        INNER JOIN direccion ON agencias.rela_agencia_direccion = direccion.id_direccion
                                        INNER JOIN estado_actividad on estado_actividad.rela_estado_agencia = agencias.id_agencias
                                        WHERE agencias.id_agencias = $id_agencia");

        //recuperamos los datos y los retornamos

        $sql->execute();



        return $sql->fetch(PDO::FETCH_OBJ); //este return se va a llamar en el controlador_agencia.php clase inicio

    }

    public function crear($lineas)
    {

        $conexionBD = BD::crearInstancia();

        $i = 0;

        $inicio = new DateTime('2022-01-01');
        $fin = new DateTime('2023-12-31');
        $meses = array();

        while ($inicio <= $fin) {
            $nombre_mes = strtolower($inicio->format('F_Y'));
            $desde = $inicio->format('Y-m-d');
            $hasta = $inicio->format('Y-m-t');
            $meses[$nombre_mes] = array('desde' => $desde, 'hasta' => $hasta);
            $inicio->modify('+1 month');
        }

        // Usamos la función array_filter para eliminar las líneas vacías
        $lineas = array_filter($lineas);
        // Usamos la función array_map para aplicar la función trim a cada línea, lo que elimina los espacios en blanco al principio y al final
        $lineas = array_map('trim', $lineas);
        // Usamos el método array_map para aplicar la función explode a cada línea, lo que crea una matriz de valores separados por comas
        $datos = array_map(function ($linea) {
            return explode(',', $linea);
        }, $lineas);

        // Usamos la función array_filter para eliminar los datos vacíos
        $datos = array_filter($datos);


        foreach ($datos as $datos_linea) {


            // Procesamos cada línea como antes, pero ahora estamos trabajando con una sola matriz de datos
            $nombre = !empty($datos_linea[0]) ? $datos_linea[0] : '';
            $id = !empty($datos_linea[1]) ? $datos_linea[1] : '';
            $fecha = !empty($datos_linea[3]) ? $datos_linea[3] : '';
            $hora = !empty($datos_linea[4]) ? $datos_linea[4] : '';
            $in = !empty($datos_linea[5]) ? $datos_linea[5] : '';
            $checkInOn = !empty($datos_linea[9]) ? $datos_linea[9] : '';

            if ($fecha >= "2023-02-01") {
                /*-------- VERIFICAMOS SI EL EMPLEADO YA EXISTE EN LA BD --------*/
                $sqlVerificar = $conexionBD->prepare("SELECT COUNT(*) as existente FROM `asistencia4` WHERE `nombre_per` = ? AND `fcha_asistencia` = ?");
                $sqlVerificar->execute(array($nombre, $fecha));
                $resultadoVerificar = $sqlVerificar->fetch(PDO::FETCH_ASSOC);

                if ($resultadoVerificar['existente'] == 0) {
                    /*-------- INSERTAMOS--------*/
                    $sqlDireccion = $conexionBD->prepare("INSERT INTO `asistencia4`(`nombre_per`, `fcha_asistencia`, `horas_asistencia`,`checkinout`) 
                                         VALUES (?,?,?,?)");

                    // $sqlDireccion->execute(array($nombre, $fecha, $hora, $checkInOn));
                }
            };
            // }
            // echo '<div>' . $nombre . ". " . $hora . ". " . $checkInOn . '</div>';
            // Inicializamos el arreglo para almacenar los datos por mes
            $datos_por_mes = [];
            foreach ($meses as $mes => $rango) {
                // Creamos un arreglo vacío para almacenar los datos de este mes
                $datos_por_mes[$mes] = [];
            }
            foreach ($meses as $mes => $rango) {
                if ($fecha >= $rango['desde'] && $fecha <= $rango['hasta']) {
                    $datos_por_mes[$mes][] = [
                        'nombre' => $nombre,
                        'fecha' => $fecha,
                        'hora' => $hora,
                        'check_in_on' => $checkInOn,
                    ];
                }
                // print_r($datos_por_mes);
            }
            // Creamos un archivo de Excel por cada mes
            foreach ($datos_por_mes as $mes => $datos) {
                // Creamos un objeto Spreadsheet
                $spreadsheet = new Spreadsheet();

                // Protegemos la hoja de cálculo para que sea de solo lectura
                $protection = $spreadsheet->getActiveSheet()->getProtection();
                $protection->setSheet(true)
                    ->setSort(true)
                    ->setInsertRows(false)
                    ->setInsertColumns(false)
                    ->setFormatCells(false)
                    ->setFormatColumns(false)
                    ->setFormatRows(false)
                    ->setObjects(true)
                    ->setScenarios(true);
                // Obtenemos la hoja activa
                $sheet = $spreadsheet->getActiveSheet();
                // Definir los encabezados de las columnas 
                $encabezados = ['Nombre', 'fecha', 'hora', 'E/S'];
                $sheet->fromArray([$encabezados], NULL, 'A1');
                $row = 2;
                $writer = new Xlsx($spreadsheet);
                foreach ($datos as $dato) {
                    $sheet->setCellValue('A' . $row, $dato['nombre']);
                    $sheet->setCellValue('B' . $row, $dato['fecha']);
                    $sheet->setCellValue('C' . $row, $dato['hora']);
                    $sheet->setCellValue('D' . $row, $dato['check_in_on']);

                    echo '<div>' . $dato['nombre'] . ". " . $dato['fecha'] . ". " . $dato['check_in_on'] . '</div>';
                    // Aplicamos algunos estilos a las celdas
                    $styleHeader = [
                        'font' => [
                            'bold' => true,
                            'color' => ['rgb' => 'FFFFFF'],
                        ],
                        'fill' => [
                            'fillType' => 'solid',
                            'startColor' => ['rgb' => '1f497d'],
                        ],
                    ];
                    $sheet->getStyle('A1:D1')->applyFromArray($styleHeader);
                    $sheet->getStyle('A2:D100')->getAlignment()->setVertical('center');
                    $row++;
                    // print_r($row);
                }
                // Creamos un objeto Writer y escribimos el archivo en el disco

                // $writer->save($filename);
                // Mensaje de confirmación
                $filename = $mes . '.xlsx';
                echo "Se han guardado " . count($datos) . " filas en el archivo " . $filename . "<br>";
            }
            $i++;
        }
    }



    public function excel($lineas)
    {
    }

    public static function borrar($idAgenciaBorrar, $id_direccion, $idRazonSocial)
    {
        $conexionBD = BD::crearInstancia();
        $sqlAgenciaBorrar = $conexionBD->prepare("DELETE FROM agencias WHERE id_agencias =?");
        $sqlAgenciaBorrar->execute(array($idAgenciaBorrar));

        $sqlDireccionBorrar = $conexionBD->prepare("DELETE FROM direccion WHERE id_direccion =?");
        $sqlDireccionBorrar->execute(array($id_direccion));

        $sqlRazonBorrar = $conexionBD->prepare("DELETE FROM `razon_social` WHERE id_razon_social =?");
        $sqlRazonBorrar->execute(array($idRazonSocial));
    }
    /*----------BUSCAR para ir imprimir en la seccion EDITAR----------*/
    public function buscar($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $sql = $conexionBD->prepare("SELECT id_agencias, descripcion_agencias , `idoneo_agencia`, `matricula_agencia`,
                                                    `legajo_agencia`, `cuit_agencia`, `categoria_agencia`, fecha_edit_agencia, razon_social.descripcion_razon_social,
                                                     direccion.calle_direccion,
                                                    contacto.descripcion_contacto, tipo_estado.descripcion_tipo_estado,localidad.nombre_localidad
                                                    ,estado_actividad.rela_tipo_estado,departamentos_fsa.descripcion_departamentos 
                                            FROM `agencias`
                                            INNER JOIN contacto ON contacto.rela_contacto_agencia = agencias.id_agencias
                                            INNER JOIN razon_social on razon_social.id_razon_social = agencias.rela_razon_social_agencia
                                            INNER JOIN direccion ON agencias.rela_agencia_direccion = direccion.id_direccion
                                            INNER JOIN estado_actividad on estado_actividad.rela_estado_agencia = agencias.id_agencias
                                            INNER JOIN tipo_estado on tipo_estado.id_tipo_estado = estado_actividad.rela_tipo_estado
                                            INNER JOIN localidad on direccion.rela_localidad_direccion = localidad.id_localidad
                                            INNER JOIN departamentos_fsa on localidad.rela_departamento = departamentos_fsa.id_departamentos_fsa
                                            WHERE agencias.id_agencias = $id_agencia");

        $sql->execute();

        return $sql->fetch(PDO::FETCH_OBJ);
    }

    public static function editar()
    {

        $conexionBD = BD::crearInstancia();
    }

    public function buscarSelectLocalidad()
    {

        $conexionBD = BD::crearInstancia();


        $sqlLocalidad = $conexionBD->query("SELECT id_localidad, nombre_localidad, rela_provincia, rela_departamento FROM localidad");

        $sqlLocalidad->execute();

        return $sqlLocalidad->fetchAll(PDO::FETCH_OBJ);
    }

    public function buscarSelectEstado()
    {

        $conexionBD = BD::crearInstancia();


        $sqlLocalidad = $conexionBD->query("SELECT `id_tipo_estado`, `descripcion_tipo_estado` 
                                                       FROM `tipo_estado`");

        $sqlLocalidad->execute();

        return $sqlLocalidad->fetchAll(PDO::FETCH_OBJ);
    }
}

class ContactosAgencia
{
    public $telefonoAgencia;
    public $correoAgencia;
    public $facebookAgencia;
    public $instagramAgencia;
    public $twitterAgencia;
    public $webAgencia;
    public $otroAgencia;

    private $BD;


    public function __construct()
    {
        require_once("conexion.php");
        $this->BD = BD::crearInstancia();
    }

    public function consultarTelefonos($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto, contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 2
                                            and contacto.rela_contacto_agencia = $id_agencia");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarTelefonosFijos($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto, contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 9
                                            and contacto.rela_contacto_agencia = $id_agencia");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarCorreo($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto, contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 1
                                            and contacto.rela_contacto_agencia = $id_agencia");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarFacebook($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto, contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 4
                                            and contacto.rela_contacto_agencia = $id_agencia");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarInstagram($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto, contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 5
                                            and contacto.rela_contacto_agencia = $id_agencia");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarTwitter($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto, contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 6
                                            and contacto.rela_contacto_agencia = $id_agencia");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarWeb($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto, contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 7
                                            and contacto.rela_contacto_agencia = $id_agencia");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarOtro($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto, contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 8
                                            and contacto.rela_contacto_agencia = $id_agencia");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }
}

class ContactosInfo
{
    public $telefonoAgenciaInfo;
    public $telefonoFijoAgencia;
    public $correoAgencia;
    public $facebookAgencia;
    public $instagramAgencia;
    public $twitterAgencia;
    public $webAgencia;
    public $otroAgencia;

    private $BD;


    public function __construct()
    {
        require_once("conexion.php");
        $this->BD = BD::crearInstancia();

        $this->telefonoAgenciaInfo = array();
        $this->telefonoFijoAgencia = array();
        $this->correoAgencia = array();
        $this->facebookAgencia = array();
        $this->instagramAgencia = array();
        $this->twitterAgencia = array();
        $this->webAgencia = array();
        $this->otroAgencia = array();
    }

    public function consultarTelefonos($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto, contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 2
                                            and contacto.rela_contacto_agencia = $id_agencia");

        while ($filas = $consulta->fetch(PDO::FETCH_ASSOC)) {
            $this->telefonoAgenciaInfo[] = $filas;
        }
        return $this->telefonoAgenciaInfo;
    }

    public function consultarTelefonosFijos($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 9
                                            and contacto.rela_contacto_agencia = $id_agencia");

        while ($filas = $consulta->fetch(PDO::FETCH_ASSOC)) {
            $this->telefonoFijoAgencia[] = $filas;
        }
        return $this->telefonoFijoAgencia;
    }

    public function consultarCorreo($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 1
                                            and contacto.rela_contacto_agencia = $id_agencia");

        while ($filas = $consulta->fetch(PDO::FETCH_ASSOC)) {
            $this->correoAgencia[] = $filas;
        }
        return $this->correoAgencia;
    }

    public function consultarFacebook($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 4
                                            and contacto.rela_contacto_agencia = $id_agencia");

        while ($filas = $consulta->fetch(PDO::FETCH_ASSOC)) {
            $this->facebookAgencia[] = $filas;
        }
        return $this->facebookAgencia;
    }

    public function consultarInstagram($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 5
                                            and contacto.rela_contacto_agencia = $id_agencia");

        while ($filas = $consulta->fetch(PDO::FETCH_ASSOC)) {
            $this->instagramAgencia[] = $filas;
        }
        return $this->instagramAgencia;
    }

    public function consultarTwitter($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 6
                                            and contacto.rela_contacto_agencia = $id_agencia");

        while ($filas = $consulta->fetch(PDO::FETCH_ASSOC)) {
            $this->twitterAgencia[] = $filas;
        }
        return $this->twitterAgencia;
    }

    public function consultarWeb($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 7
                                            and contacto.rela_contacto_agencia = $id_agencia");

        while ($filas = $consulta->fetch(PDO::FETCH_ASSOC)) {
            $this->webAgencia[] = $filas;
        }
        return $this->webAgencia;
    }

    public function consultarOtro($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 8
                                            and contacto.rela_contacto_agencia = $id_agencia");

        while ($filas = $consulta->fetch(PDO::FETCH_ASSOC)) {
            $this->otroAgencia[] = $filas;
        }
        return $this->otroAgencia;
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
