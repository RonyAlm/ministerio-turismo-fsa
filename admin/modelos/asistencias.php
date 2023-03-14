<?php
require_once 'vistas/recursos/libreria/json/vendor/autoload.php';

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class AsistenciaModelo
{

    public $listaAgencia;
    public $listaAgenciaID;
    public $listaBuscar;


    public function __construct()
    {
        $this->listaAgencia = array();
        $this->listaAgenciaID = array();
        $this->listaBuscar = array();
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
        // Creamos un objeto Spreadsheet
        $spreadsheet = new Spreadsheet();

        // Protegemos la hoja de cálculo para que sea de solo lectura
        $protection = $spreadsheet->getActiveSheet()->getProtection();
        $protection->setSheet(true);
        $protection->setSort(true);
        $protection->setInsertRows(false);
        $protection->setInsertColumns(false);
        $protection->setFormatCells(false);
        $protection->setFormatColumns(false);
        $protection->setFormatRows(false);
        $protection->setObjects(true);
        $protection->setScenarios(true);

        // Obtenemos la hoja activa
        $sheet = $spreadsheet->getActiveSheet();
        // Definir los encabezados de las columnas 
        $sheet->setCellValue('A1', 'Nombre');
        $sheet->setCellValue('B1', 'fecha');
        $sheet->setCellValue('C1', 'hora');
        $sheet->setCellValue('D1', 'E/S');


        $conexionBD = BD::crearInstancia();

        $i = 0;
        $row = 2;
        $meses = array(
            'enero_2022' => array('desde' => '2022-01-01', 'hasta' => '2022-01-31'),
            'febrero_2022' => array('desde' => '2022-02-01', 'hasta' => '2022-02-28'),
            'marzo_2022' => array('desde' => '2022-03-01', 'hasta' => '2022-03-31'),
            'abril_2022' => array('desde' => '2022-04-01', 'hasta' => '2022-04-30'),
            'mayo_2022' => array('desde' => '2022-05-01', 'hasta' => '2022-05-31'),
            'junio_2022' => array('desde' => '2022-06-01', 'hasta' => '2022-06-30'),
            'julio_2022' => array('desde' => '2022-07-01', 'hasta' => '2022-07-31'),
            'agosto_2022' => array('desde' => '2022-08-01', 'hasta' => '2022-08-31'),
            'septiembre_2022' => array('desde' => '2022-09-01', 'hasta' => '2022-09-30'),
            'octubre_2022' => array('desde' => '2022-10-01', 'hasta' => '2022-10-31'),
            'noviembre_2022' => array('desde' => '2022-11-01', 'hasta' => '2022-11-30'),
            'diciembre_2022' => array('desde' => '2022-12-01', 'hasta' => '2022-12-31'),
            'enero_2023' => array('desde' => '2023-01-01', 'hasta' => '2023-01-31'),
            'febrero_2023' => array('desde' => '2023-02-01', 'hasta' => '2023-02-28'),
            'marzo_2023' => array('desde' => '2023-03-01', 'hasta' => '2023-03-31'),
            'abril_2023' => array('desde' => '2023-04-01', 'hasta' => '2023-04-30'),
            'mayo_2023' => array('desde' => '2023-05-01', 'hasta' => '2023-05-31'),
            'junio_2023' => array('desde' => '2023-06-01', 'hasta' => '2023-06-30'),
            'julio_2023' => array('desde' => '2023-07-01', 'hasta' => '2023-07-31'),
            'agosto_2023' => array('desde' => '2023-08-01', 'hasta' => '2023-08-31'),
            'septiembre_2023' => array('desde' => '2023-09-01', 'hasta' => '2023-09-30'),
            'octubre_2023' => array('desde' => '2023-10-01', 'hasta' => '2023-10-31'),
            'noviembre_2023' => array('desde' => '2023-11-01', 'hasta' => '2023-11-30'),
            'diciembre_2023' => array('desde' => '2023-12-01', 'hasta' => '2023-12-31')
        );


        foreach ($lineas as $linea) {
            $cantidad_registros = count($lineas);
            $cantidad_regist_agregados =  ($cantidad_registros - 1);

            if ($i != 0) {

                // $datos = explode(",", $linea);
                $datos = explode(",", $lineas[$i]);
                $semanas = [];

                $nombre         = !empty($datos[0])  ? ($datos[0]) : '';
                $id             = !empty($datos[1])  ? ($datos[1]) : '';
                $fecha          = !empty($datos[3])  ? ($datos[3]) : '';
                $hora           = !empty($datos[4])  ? ($datos[4]) : '';
                $in             = !empty($datos[5])  ? ($datos[5]) : '';
                $checkInOn      = !empty($datos[9])  ? ($datos[9]) : '';

                if ($nombre == 'admin') {
                    $nombre = "David Rolando Pereyra";
                }
                if ($checkInOn == 'overtimeIn') {
                    $checkInOn = "E/S";
                }

                if ($hora <= '08:15:00') {
                    $checkInOn = "Entrada";
                };
                if ($hora >= '08:16:00' && $hora <= '11:59:00') {
                    $checkInOn = "E/S";
                };
                if ($hora >= '12:00:00' && $hora <= '13:15:00') {
                    $checkInOn = "Salida";
                };
                if ($hora >= '13:16:00' && $hora <= '14:59:00') {
                    $checkInOn = "E/S";
                };
                if ($hora >= '15:00:00' && $hora <= '16:15:00') {
                    $checkInOn = "Entrada";
                };
                if ($hora >= '15:00:00' && $hora <= '16:15:00') {
                    $checkInOn = "Entrada";
                };
                if ($hora >= '16:16:00' && $hora <= '19:59:00') {
                    $checkInOn = "E/S";
                };
                if ($hora >= '20:00:00' && $hora <= '21:30:00') {
                    $checkInOn = "Salida";
                };
                if ($hora >= '21:31:00' && $hora <= '06:00:00') {
                    $checkInOn = "E/S";
                };

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
            }

            // echo '<div>' . $nombre . ". " . $hora . '</div>';

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
                    break;
                }
                // print_r($datos_por_mes);
            }
            // Creamos un archivo de Excel por cada mes
            foreach ($datos_por_mes as $mes => $datos) {
                // Creamos un nuevo objeto Spreadsheet y agregamos los datos al archivo
                $spreadsheet = new Spreadsheet();
                $sheet = $spreadsheet->getActiveSheet();
                $row = 2;
                foreach ($datos as $dato) {
                    $sheet->setCellValue('A' . $row, $dato['nombre']);
                    $sheet->setCellValue('B' . $row, $dato['fecha']);
                    $sheet->setCellValue('C' . $row, $dato['hora']);
                    $sheet->setCellValue('D' . $row, $dato['check_in_on']);
                    $row++;
                    // print_r($dato);
                }

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

                // Creamos un objeto Writer y escribimos el archivo en el disco
                $writer = new Xlsx($spreadsheet);
                $filename = $mes . '.xlsx';
                // $writer->save($filename);
            }



            $i++;
        }
        // Creamos un objeto Writer
        // $writer = new Xlsx($spreadsheet);

        // Escribimos el archivo en el disco
        // $writer->save('ejemplo.xlsx');
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
