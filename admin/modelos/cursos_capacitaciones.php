<?php
class CursosModelo
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
    public function trigger($accion, $id, $controlador1)
    {
        $conexionBD = BD::crearInstancia();
        // $conexionBD->beginTransaction();
        BD::iniciarTransaccion();

        try {
            $triggerName = $accion . $controlador1;
            $tableName = 'cursos';

            $sql = "SELECT trigger_name
                    FROM information_schema.triggers
                    WHERE trigger_name = :triggerName
                    AND event_object_table = :tableName";

            $stmt = $conexionBD->prepare($sql);
            $stmt->bindParam(':triggerName', $triggerName, PDO::PARAM_STR);
            $stmt->bindParam(':tableName', $tableName, PDO::PARAM_STR);
            $stmt->execute();

            // Eliminar trigger existente si existe
            $eliminarTriggerSql = "DROP TRIGGER IF EXISTS `$triggerName`";
            $conexionBD->query($eliminarTriggerSql);

            switch ($accion) {
                case 'crear':
                    // Obtener los nombres de las columnas y valores a insertar
                    $columnas = array();
                    $valores = array();
                    $query = "INSERT INTO `$tableName` (";
                    $result = $conexionBD->query("SHOW COLUMNS FROM `$tableName`");
                    while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
                        if (strpos($row['Field'], 'id') === 0) {
                            $columnas[] = "`" . $row['Field'] . "`";
                        }
                        $valores[] = ":" . $row['Field'];
                    }
                    $query .= implode(",", $columnas) . ") VALUES (" . implode(",", $valores) . ")";
                    $stmt = $conexionBD->prepare($query);

                    // Vincular los valores a los marcadores de posición
                    // foreach ($valores as $valor) {
                    //     $stmt->bindValue($valor, $_POST[substr($valor, 1)]);
                    // }

                    // Crear el trigger
                    $new_value = "CONCAT('{";
                    foreach ($columnas as $columna) {
                        $new_value .= "\\\"" . $columna . "\\\":', new." . $columna . ", ',";
                    }
                    $new_value = substr($new_value, 0, -1) . "}')";

                    $crearTriggerSql = "CREATE TRIGGER `$triggerName` AFTER INSERT ON `$tableName` FOR EACH ROW INSERT INTO auditoria(tabla, accion, new_value, usuario_id) VALUES ('$tableName', 'INSERT', $new_value, $id)";
                    $stmt = $conexionBD->prepare($crearTriggerSql);
                    $stmt->execute();

                    // Actualizar el usuario_id en la última fila de la tabla de auditoría
                    $ultimoID = $conexionBD->query("SELECT MAX(id) FROM auditoria")->fetchColumn();
                    $actualizarIDSql = "UPDATE auditoria SET usuario_id='$id' WHERE id=$ultimoID";
                    $conexionBD->query($actualizarIDSql);
                    break;
                case 'editar':
                    // Obtener los nombres de las columnas y valores a insertar
                    $columnas = array();
                    $valores = array();
                    $query = "INSERT INTO `$tableName` (";
                    $result = $conexionBD->query("SHOW COLUMNS FROM `$tableName`");
                    while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
                        if (strpos($row['Field'], 'id') === 0) {
                            $columnas[] = "`" . $row['Field'] . "`";
                        }
                        $valores[] = ":" . $row['Field'];
                    }
                    $query .= implode(",", $columnas) . ") VALUES (" . implode(",", $valores) . ")";
                    $stmt = $conexionBD->prepare($query);



                    // Crear el trigger
                    $new_value = "CONCAT('{";
                    $old_value = "CONCAT('{";
                    foreach ($columnas as $columna) {
                        $new_value .= "\\\"" . $columna . "\\\":', new." . $columna . ", ',";
                        $old_value .= "\\\"" . $columna . "\\\":', old." . $columna . ", ',";
                    }
                    $new_value = substr($new_value, 0, -1) . "}')";
                    $old_value = substr($old_value, 0, -1) . "}')";


                    $crearTriggerSql = "CREATE TRIGGER `$triggerName` AFTER UPDATE ON `$tableName` FOR EACH ROW INSERT INTO auditoria(tabla, accion,old_value, new_value, usuario_id) VALUES ('$tableName', 'UPDATE',$old_value, $new_value, $id)";
                    $stmt = $conexionBD->prepare($crearTriggerSql);
                    $stmt->execute();

                    // Actualizar el usuario_id en la última fila de la tabla de auditoría
                    $ultimoID = $conexionBD->query("SELECT MAX(id) FROM auditoria")->fetchColumn();
                    $actualizarIDSql = "UPDATE auditoria SET usuario_id='$id' WHERE id=$ultimoID";
                    $conexionBD->query($actualizarIDSql);
                    break;
                case 'borrar':
                    // Obtener los nombres de las columnas y valores a insertar
                    $columnas = array();
                    $valores = array();
                    $query = "INSERT INTO `$tableName` (";
                    $result = $conexionBD->query("SHOW COLUMNS FROM `$tableName`");
                    while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
                        if (strpos($row['Field'], 'id') === 0) {
                            $columnas[] = "`" . $row['Field'] . "`";
                        }
                        $valores[] = ":" . $row['Field'];
                    }
                    $query .= implode(",", $columnas) . ") VALUES (" . implode(",", $valores) . ")";
                    $stmt = $conexionBD->prepare($query);

                    // Vincular los valores a los marcadores de posición
                    // foreach ($valores as $valor) {
                    //     $stmt->bindValue($valor, $_POST[substr($valor, 1)]);
                    // }

                    // Crear el trigger

                    $old_value = "CONCAT('{";
                    foreach ($columnas as $columna) {

                        $old_value .= "\\\"" . $columna . "\\\":', old." . $columna . ", ',";
                    }

                    $old_value = substr($old_value, 0, -1) . "}')";


                    $crearTriggerSql = "CREATE TRIGGER `$triggerName` AFTER DELETE ON `$tableName` FOR EACH ROW INSERT INTO auditoria(tabla, accion,old_value, usuario_id) VALUES ('$tableName', 'DELETE',$old_value, $id)";
                    $stmt = $conexionBD->prepare($crearTriggerSql);
                    $stmt->execute();

                    // Actualizar el usuario_id en la última fila de la tabla de auditoría
                    $ultimoID = $conexionBD->query("SELECT MAX(id) FROM auditoria")->fetchColumn();
                    $actualizarIDSql = "UPDATE auditoria SET usuario_id='$id' WHERE id=$ultimoID";
                    $conexionBD->query($actualizarIDSql);
                    break;
            }

            BD::confirmarTransaccion();
        } catch (PDOException $e) {
            BD::revertirTransaccion();
            // Manejar el error
            // throw $e;
        }
    }

    public function crearPresente($id_curso, $presente)
    {
        $conexionBD = BD::crearInstancia();
        $sql = $conexionBD->prepare("UPDATE `cursos` SET `presente_cursos`='$presente' WHERE `id_cursos`=$id_curso");
        $sql->execute();
    }

    public function consultar()
    {

        $conexionBD = BD::crearInstancia();

        $sql = $conexionBD->query("SELECT `id_cursos`, `nombreapellido`, `dni_cursos`, `ocupacion_cursos`, `presente_cursos`, `tipo_cursos`,rela_localidad_cursos,
        (SELECT cc.descri_contacto_cursos 
        FROM contacto_cursos cc
        WHERE cursos.id_cursos = cc.rela_contacto_cursos
        and cc.rela_contacto_con = 2
        LIMIT 1) descri_contacto_cursos
        FROM `cursos`");

        //recuperamos los datos y los retornamos

        while ($filas = $sql->fetch(PDO::FETCH_ASSOC)) {
            $this->listaAgencia[] = $filas;
        }
        return $this->listaAgencia; //este return se va a llamar en el controlador_alojamiento.php clase inicio

    }

    public function consultarID($id_agencia)
    {
        $conexionBD = BD::crearInstancia();

        $sql = $conexionBD->query("SELECT * FROM `cursos` c
        INNER JOIN contacto_cursos cc on cc.rela_contacto_cursos = c.id_cursos
        -- INNER JOIN localidad l on l.id_localidad = c.rela_localidad_cursos
        WHERE c.id_cursos = $id_agencia");

        //recuperamos los datos y los retornamos

        $sql->execute();

        return $sql->fetch(PDO::FETCH_OBJ); //este return se va a llamar en el controlador_agencia.php clase inicio

    }

    public function crear(
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
    ) {

        $conexionBD = BD::crearInstancia();

        /*-------- INSERTAMOS LA DIRECCION--------*/

        // $sqlDireccion = $conexionBD->prepare("INSERT INTO direccion (calle_direccion,rela_localidad_direccion)
        //                                             VALUES(?,?)");
        // $sqlDireccion->execute(array($domicilioTransporte, $rela_localidad_direccion));

        // $lastInsertIDdireccion = $conexionBD->lastInsertId();


        /*-------- INSERTAMOS EL CURSO--------*/

        $sql = $conexionBD->prepare("INSERT INTO `cursos`(`nombreapellido`, `dni_cursos`, `ocupacion_cursos`, `presente_cursos`, `tipo_cursos`,rela_localidad_cursos, `fecha_edit_curso`) VALUES (?,?,?,?,1,?,CURRENT_TIMESTAMP())");
        $sql->execute(array(
            $nombreyapellido, $dnicursos,
            $ocupacioncursos, $presente_cursos, $rela_localidad_direccion
        ));

        $lastInserttranposteIDs = $conexionBD->lastInsertId();


        /*-------- INSERTAMOS EL TELEFONO CELULAR--------*/

        foreach ($telefonoAgencia as $telefonoAgencia1) {

            $sqlTelefono = $conexionBD->prepare("INSERT INTO `contacto_cursos`(`descri_contacto_cursos`,`rela_contacto_con`,
                                                                            `rela_contacto_cursos`) 
                                                    VALUES (?,?,?)");
            $sqlTelefono->execute(array($telefonoAgencia1, 2, $lastInserttranposteIDs));
        }

        /*-------- INSERTAMOS EL TELEFONO FIJO--------*/

        $sqlFijo = $conexionBD->prepare("INSERT INTO `contacto_cursos`(`descri_contacto_cursos`,`rela_contacto_con`,
                                                                            `rela_contacto_cursos`) 
                                                    VALUES (?,?,?)");
        $sqlFijo->execute(array($telefonoFijoAgencia, 9, $lastInserttranposteIDs));

        /*-------- INSERTAMOS EL CORREO-------*/

        $sqlCorreo = $conexionBD->prepare("INSERT INTO `contacto_cursos`(`descri_contacto_cursos`,`rela_contacto_con`,
                                                                            `rela_contacto_cursos`) 
                                                    VALUES (?,?,?)");
        $sqlCorreo->execute(array($correoAgencia, 1, $lastInserttranposteIDs));

        /*-------- INSERTAMOS EL FACEBOOK--------*/

        $sqlFacebook = $conexionBD->prepare("INSERT INTO `contacto_cursos`(`descri_contacto_cursos`,`rela_contacto_con`,
                                                                            `rela_contacto_cursos`) 
                                                    VALUES (?,?,?)");
        $sqlFacebook->execute(array($facebookAgencia, 4, $lastInserttranposteIDs));

        /*-------- INSERTAMOS EL INSTAGRAM--------*/

        $sqlInstagram = $conexionBD->prepare("INSERT INTO `contacto_cursos`(`descri_contacto_cursos`,`rela_contacto_con`,
                                                                            `rela_contacto_cursos`) 
                                                    VALUES (?,?,?)");
        $sqlInstagram->execute(array($instagramAgencia, 5, $lastInserttranposteIDs));

        /*-------- INSERTAMOS EL TWITTER--------*/

        $sqlTwitter = $conexionBD->prepare("INSERT INTO `contacto_cursos`(`descri_contacto_cursos`,`rela_contacto_con`,
                                                                            `rela_contacto_cursos`) 
                                                    VALUES (?,?,?)");
        $sqlTwitter->execute(array($twitterAgencia, 6, $lastInserttranposteIDs));

        /*-------- INSERTAMOS EL SITIO WEB--------*/

        $sqlWeb = $conexionBD->prepare("INSERT INTO `contacto_cursos`(`descri_contacto_cursos`,`rela_contacto_con`,
                                                                            `rela_contacto_cursos`) 
                                                    VALUES (?,?,?)");
        $sqlWeb->execute(array($webAgencia, 7, $lastInserttranposteIDs));

        /*-------- INSERTAMOS OTRO--------*/

        $sqlOtro = $conexionBD->prepare("INSERT INTO `contacto_cursos`(`descri_contacto_cursos`,`rela_contacto_con`,
                                                                            `rela_contacto_cursos`) 
                                                    VALUES (?,?,?)");
        $sqlOtro->execute(array($otroAgencia, 8, $lastInserttranposteIDs));
    }

    public static function borrar($tranposteIDBorrar, $id_direccion)
    {
        $conexionBD = BD::crearInstancia();
        $sqlAgenciaBorrar = $conexionBD->prepare("DELETE FROM `transportes` WHERE id_transportes =?");
        $sqlAgenciaBorrar->execute(array($tranposteIDBorrar));

        $sqlDireccionBorrar = $conexionBD->prepare("DELETE FROM direccion WHERE id_direccion =?");
        $sqlDireccionBorrar->execute(array($id_direccion));
    }
    /*----------BUSCAR para ir imprimir en la seccion EDITAR----------*/
    public function buscar($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $sql = $conexionBD->prepare("SELECT `id_cursos`, `nombreapellido`, `dni_cursos`, `ocupacion_cursos`, `presente_cursos`, `tipo_cursos`, `fecha_edit_curso`, cc.descri_contacto_cursos,l.nombre_localidad FROM `cursos` 
        INNER JOIN contacto_cursos cc on cc.rela_contacto_cursos = cursos.id_cursos
        INNER JOIN localidad l on l.id_localidad = cursos.rela_localidad_cursos
        WHERE id_cursos = $id_agencia");

        $sql->execute();

        return $sql->fetch(PDO::FETCH_OBJ);
    }

    public static function editar(
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
    ) {

        $conexionBD = BD::crearInstancia();


        /*---------------SE ACTUALIZA EL CURSO-------------------*/
        $sql = $conexionBD->prepare("UPDATE `cursos` SET `nombreapellido`='$nombreyapellido',`dni_cursos`='$dnicursos',`ocupacion_cursos`='$ocupacioncursos',`presente_cursos`='$presente_cursos',`rela_localidad_cursos`='$rela_localidad_direccion',`fecha_edit_curso`=CURRENT_TIMESTAMP() WHERE `id_cursos`=$cursosID");
        $sql->execute();

        /*----------------SE ACTUALIZA EL CONTACTO telefono------------------*/

        $asociativo = array_combine($idtelefonoAgencia, $telefonoAgencia);



        foreach ($asociativo as $indice => $valor) {

            $sqlContacto = $conexionBD->prepare("UPDATE `contacto_cursos` SET `descri_contacto_cursos`='$valor'
                    WHERE id_contacto_cursos= $indice");
            $sqlContacto->execute();
            // print_r($sqlContacto);
        }
        /*----------------SE ACTUALIZA EL CONTACTO  telefono fijo------------------*/

        if ($telefonoFijoAgencia == "") {
            $telefonoFijoAgencia = "No se registró";

            $sqlFijo = $conexionBD->prepare("UPDATE `contacto_cursos` SET `descri_contacto_cursos`= '$telefonoFijoAgencia'
                                                    WHERE id_contacto_cursos= $idtelefonoFijoAgencia");
            $sqlFijo->execute();
        } else {
            $sqlFijo = $conexionBD->prepare("UPDATE `contacto_cursos` SET `descri_contacto_cursos`= $telefonoFijoAgencia
                                                    WHERE id_contacto_cursos= $idtelefonoFijoAgencia");
            $sqlFijo->execute();
        }
        /*----------------SE ACTUALIZA EL CONTACTO correo------------------*/

        $sqlCorreo = $conexionBD->prepare("UPDATE `contacto_cursos` SET `descri_contacto_cursos`='$correoAgencia'
                                                    WHERE id_contacto_cursos= $idcorreoAgencia");
        $sqlCorreo->execute();

        /*----------------SE ACTUALIZA EL CONTACTO facebook ------------------*/

        $sqlFacebook = $conexionBD->prepare("UPDATE `contacto_cursos` SET `descri_contacto_cursos`='$facebookAgencia'
                                                    WHERE id_contacto_cursos= $idfacebookAgencia");
        $sqlFacebook->execute();

        /*----------------SE ACTUALIZA EL CONTACTO Instagram ------------------*/

        $sqlInstagram = $conexionBD->prepare("UPDATE `contacto_cursos` SET `descri_contacto_cursos`='$instagramAgencia'
                                                    WHERE id_contacto_cursos= $idinstagramAgencia");
        $sqlInstagram->execute();

        /*----------------SE ACTUALIZA EL CONTACTO  twitter------------------*/

        $sqlTwitter = $conexionBD->prepare("UPDATE `contacto_cursos` SET `descri_contacto_cursos`='$twitterAgencia'
                                                    WHERE id_contacto_cursos= $idtwitterAgencia");
        $sqlTwitter->execute();

        /*----------------SE ACTUALIZA EL CONTACTO  sitio web------------------*/

        $sqlWeb = $conexionBD->prepare("UPDATE `contacto_cursos` SET `descri_contacto_cursos`='$webAgencia'
                                                    WHERE id_contacto_cursos= $idwebAgencia");
        $sqlWeb->execute();

        /*----------------SE ACTUALIZA EL CONTACTO otro------------------*/

        $sqlOtro = $conexionBD->prepare("UPDATE `contacto_cursos` SET `descri_contacto_cursos`='$otroAgencia'
                                                    WHERE id_contacto_cursos= $idotroAgencia ");
        $sqlOtro->execute();
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
        $consulta = $conexionBD->query(" SELECT id_contacto_cursos,descri_contacto_cursos 
                                            FROM contacto_cursos 
                                            WHERE contacto_cursos.rela_contacto_con = 2
                                            and contacto_cursos.rela_contacto_cursos = $id_agencia");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarTelefonosFijos($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto_cursos,descri_contacto_cursos 
                                            FROM contacto_cursos 
                                            WHERE contacto_cursos.rela_contacto_con = 9
                                            and contacto_cursos.rela_contacto_cursos = $id_agencia");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarCorreo($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto_cursos,descri_contacto_cursos 
                                            FROM contacto_cursos 
                                            WHERE contacto_cursos.rela_contacto_con = 1
                                            and contacto_cursos.rela_contacto_cursos = $id_agencia");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarFacebook($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto_cursos,descri_contacto_cursos 
                                            FROM contacto_cursos 
                                            WHERE contacto_cursos.rela_contacto_con = 4
                                            and contacto_cursos.rela_contacto_cursos = $id_agencia");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarInstagram($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto_cursos,descri_contacto_cursos 
                                            FROM contacto_cursos 
                                            WHERE contacto_cursos.rela_contacto_con = 5
                                            and contacto_cursos.rela_contacto_cursos = $id_agencia");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarTwitter($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto_cursos,descri_contacto_cursos 
                                            FROM contacto_cursos 
                                            WHERE contacto_cursos.rela_contacto_con = 6
                                            and contacto_cursos.rela_contacto_cursos = $id_agencia");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarWeb($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto_cursos,descri_contacto_cursos 
                                            FROM contacto_cursos 
                                            WHERE contacto_cursos.rela_contacto_con = 7
                                            and contacto_cursos.rela_contacto_cursos = $id_agencia");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarOtro($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto_cursos,descri_contacto_cursos 
                                            FROM contacto_cursos 
                                            WHERE contacto_cursos.rela_contacto_con = 8
                                            and contacto_cursos.rela_contacto_cursos = $id_agencia");

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
        $consulta = $conexionBD->query(" SELECT id_contacto_cursos,contacto_cursos.descri_contacto_cursos 
                                            FROM contacto_cursos 
                                            WHERE contacto_cursos.rela_contacto_con = 2
                                            and contacto_cursos.rela_contacto_cursos = $id_agencia");

        while ($filas = $consulta->fetch(PDO::FETCH_ASSOC)) {
            $this->telefonoAgenciaInfo[] = $filas;
        }
        return $this->telefonoAgenciaInfo;
    }

    public function consultarTelefonosFijos($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT contacto_cursos.descri_contacto_cursos 
                                            FROM contacto_cursos 
                                            WHERE contacto_cursos.rela_contacto_con = 9
                                            and contacto_cursos.rela_contacto_cursos = $id_agencia");

        while ($filas = $consulta->fetch(PDO::FETCH_ASSOC)) {
            $this->telefonoFijoAgencia[] = $filas;
        }
        return $this->telefonoFijoAgencia;
    }

    public function consultarCorreo($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT contacto_cursos.descri_contacto_cursos 
                                            FROM contacto_cursos 
                                            WHERE contacto_cursos.rela_contacto_con = 1
                                            and contacto_cursos.rela_contacto_cursos = $id_agencia");

        while ($filas = $consulta->fetch(PDO::FETCH_ASSOC)) {
            $this->correoAgencia[] = $filas;
        }
        return $this->correoAgencia;
    }

    public function consultarFacebook($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT contacto_cursos.descri_contacto_cursos 
                                            FROM contacto_cursos 
                                            WHERE contacto_cursos.rela_contacto_con = 4
                                            and contacto_cursos.rela_contacto_cursos = $id_agencia");

        while ($filas = $consulta->fetch(PDO::FETCH_ASSOC)) {
            $this->facebookAgencia[] = $filas;
        }
        return $this->facebookAgencia;
    }

    public function consultarInstagram($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT contacto_cursos.descri_contacto_cursos 
                                            FROM contacto_cursos 
                                            WHERE contacto_cursos.rela_contacto_con = 5
                                            and contacto_cursos.rela_contacto_cursos = $id_agencia");

        while ($filas = $consulta->fetch(PDO::FETCH_ASSOC)) {
            $this->instagramAgencia[] = $filas;
        }
        return $this->instagramAgencia;
    }

    public function consultarTwitter($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT contacto_cursos.descri_contacto_cursos 
                                            FROM contacto_cursos 
                                            WHERE contacto_cursos.rela_contacto_con = 6
                                            and contacto_cursos.rela_contacto_cursos = $id_agencia");

        while ($filas = $consulta->fetch(PDO::FETCH_ASSOC)) {
            $this->twitterAgencia[] = $filas;
        }
        return $this->twitterAgencia;
    }

    public function consultarWeb($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT contacto_cursos.descri_contacto_cursos 
                                            FROM contacto_cursos 
                                            WHERE contacto_cursos.rela_contacto_con = 7
                                            and contacto_cursos.rela_contacto_cursos = $id_agencia");

        while ($filas = $consulta->fetch(PDO::FETCH_ASSOC)) {
            $this->webAgencia[] = $filas;
        }
        return $this->webAgencia;
    }

    public function consultarOtro($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT contacto_cursos.descri_contacto_cursos 
                                            FROM contacto_cursos 
                                            WHERE contacto_cursos.rela_contacto_con = 8
                                            and contacto_cursos.rela_contacto_cursos = $id_agencia");

        while ($filas = $consulta->fetch(PDO::FETCH_ASSOC)) {
            $this->otroAgencia[] = $filas;
        }
        return $this->otroAgencia;
    }
}
class estadistica
{


    public function cantidadInscriptos()
    {

        $conexionBD = BD::crearInstancia();


        $sqlestadistica = $conexionBD->query("SELECT COUNT(*) conteo FROM `cursos`");

        $sqlestadistica->execute();

        return $sqlestadistica->fetchAll(PDO::FETCH_OBJ);
    }

    public function cantidadAusentes()
    {

        $conexionBD = BD::crearInstancia();


        $sqlestadistica = $conexionBD->query("SELECT COUNT(*) conteo FROM `cursos` WHERE presente_cursos = 'Ausente';");

        $sqlestadistica->execute();

        return $sqlestadistica->fetchAll(PDO::FETCH_OBJ);
    }
    public function cantidadPresentes()
    {

        $conexionBD = BD::crearInstancia();


        $sqlestadistica = $conexionBD->query("SELECT COUNT(*) conteo FROM `cursos` WHERE presente_cursos = 'Presente';");

        $sqlestadistica->execute();

        return $sqlestadistica->fetchAll(PDO::FETCH_OBJ);
    }
}
