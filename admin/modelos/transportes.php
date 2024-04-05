<?php
class TransportesModelo
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
            $tableName = 'transportes';

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
                    $query = "INSERT INTO `$controlador1` (";
                    $result = $conexionBD->query("SHOW COLUMNS FROM `$controlador1`");
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

                    $crearTriggerSql = "CREATE TRIGGER `$triggerName` AFTER INSERT ON `$controlador1` FOR EACH ROW INSERT INTO auditoria(tabla, accion, new_value, usuario_id) VALUES ('$controlador1', 'INSERT', $new_value, $id)";
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
                    $query = "INSERT INTO `$controlador1` (";
                    $result = $conexionBD->query("SHOW COLUMNS FROM `$controlador1`");
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


                    $crearTriggerSql = "CREATE TRIGGER `$triggerName` AFTER UPDATE ON `$controlador1` FOR EACH ROW INSERT INTO auditoria(tabla, accion,old_value, new_value, usuario_id) VALUES ('$controlador1', 'UPDATE',$old_value, $new_value, $id)";
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
                    $query = "INSERT INTO `$controlador1` (";
                    $result = $conexionBD->query("SHOW COLUMNS FROM `$controlador1`");
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


                    $crearTriggerSql = "CREATE TRIGGER `$triggerName` AFTER DELETE ON `$controlador1` FOR EACH ROW INSERT INTO auditoria(tabla, accion,old_value, usuario_id) VALUES ('$controlador1', 'DELETE',$old_value, $id)";
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

    public function consultar()
    {

        $conexionBD = BD::crearInstancia();

        $sql = $conexionBD->query("SELECT t.id_transportes,t.designacion_transporte,t.idoneo_transportes,
        direccion.calle_direccion,direccion.id_direccion,localidad.id_localidad,
        localidad.nombre_localidad,estado_actividad.id_estado,tipo_estado.id_tipo_estado,
        tipo_estado.descripcion_tipo_estado,
        (SELECT ct.descri_contacto_transporte 
        FROM contacto_transporte ct
        WHERE t.id_transportes = ct.rela_contacto_transporte 
        and ct.rela_contacto_con = 2
        LIMIT 1) descri_contacto_transporte, st.id_servicios_transportes,st.descripcion_serv_transportes FROM `transportes` t
        INNER JOIN direccion ON t.rela_direccion = direccion.id_direccion
        INNER JOIN localidad on direccion.rela_localidad_direccion = localidad.id_localidad
        INNER JOIN estado_actividad on estado_actividad.rela_estado_transportes = t.id_transportes
        INNER JOIN tipo_estado on tipo_estado.id_tipo_estado = estado_actividad.rela_tipo_estado
        INNER JOIN servicios_transportes st on st.rela_serv_transporte = t.id_transportes");

        //recuperamos los datos y los retornamos

        while ($filas = $sql->fetch(PDO::FETCH_ASSOC)) {
            $this->listaAgencia[] = $filas;
        }
        return $this->listaAgencia; //este return se va a llamar en el controlador_alojamiento.php clase inicio

    }

    public function consultarID($id_agencia)
    {
        $conexionBD = BD::crearInstancia();

        $sql = $conexionBD->query("SELECT t.id_transportes,direccion.id_direccion,localidad.id_localidad,
        estado_actividad.id_estado,tipo_estado.id_tipo_estado,
        ct.id_contacto_transporte,departamentos_fsa.id_departamentos_fsa,
        st.id_servicios_transportes
        FROM `transportes` t
        INNER JOIN contacto_transporte ct on ct.rela_contacto_transporte = t.id_transportes
        INNER JOIN direccion ON t.rela_direccion = direccion.id_direccion
        INNER JOIN localidad on direccion.rela_localidad_direccion = localidad.id_localidad
        INNER JOIN estado_actividad on estado_actividad.rela_estado_transportes = t.id_transportes
        INNER JOIN tipo_estado on tipo_estado.id_tipo_estado = estado_actividad.rela_tipo_estado
        INNER JOIN departamentos_fsa on localidad.rela_departamento = departamentos_fsa.id_departamentos_fsa
        INNER JOIN servicios_transportes st on st.rela_serv_transporte = t.id_transportes
        WHERE t.id_transportes = $id_agencia");

        //recuperamos los datos y los retornamos

        $sql->execute();

        return $sql->fetch(PDO::FETCH_OBJ); //este return se va a llamar en el controlador_agencia.php clase inicio

    }

    public function crear(
        $designacionTransportes,
        $ServiciosTransportes,
        $rela_localidad_direccion,
        $domicilioTransporte,
        $telefonoAgencia,
        $telefonoFijoAgencia,
        $correoAgencia,
        $facebookAgencia,
        $instagramAgencia,
        $twitterAgencia,
        $webAgencia,
        $otroAgencia,
        $estadoAgencia,
        $idoneoTransportes
    ) {

        $conexionBD = BD::crearInstancia();

        /*-------- INSERTAMOS LA DIRECCION--------*/

        $sqlDireccion = $conexionBD->prepare("INSERT INTO direccion (calle_direccion,rela_localidad_direccion)
                                                    VALUES(?,?)");
        $sqlDireccion->execute(array($domicilioTransporte, $rela_localidad_direccion));

        $lastInsertIDdireccion = $conexionBD->lastInsertId();


        /*-------- INSERTAMOS EL TRANSPORTE--------*/

        $sql = $conexionBD->prepare("INSERT INTO `transportes`(`designacion_transporte`, `idoneo_transportes`, `rela_direccion`, `fecha_edit_transporte`) VALUES (?,?,?,CURRENT_TIMESTAMP())");
        $sql->execute(array(
            $designacionTransportes, $idoneoTransportes,
            $lastInsertIDdireccion
        ));

        $lastInserttranposteIDs = $conexionBD->lastInsertId();

        /*-------- INSERTAMOS EL SERVICIO DEL TRANSPORTE--------*/

        $sqlServicioTransportes = $conexionBD->prepare("INSERT INTO `servicios_transportes`(`descripcion_serv_transportes`, `fecha_edit_serv_transporte`, `rela_serv_transporte`) VALUES (?,CURRENT_TIMESTAMP(),?)");
        $sqlServicioTransportes->execute(array(
            $ServiciosTransportes, $lastInserttranposteIDs
        ));

        $lastInsertIdServicios = $conexionBD->lastInsertId();

        /*-------- INSERTAMOS EL TELEFONO CELULAR--------*/

        foreach ($telefonoAgencia as $telefonoAgencia1) {

            $sqlTelefono = $conexionBD->prepare("INSERT INTO `contacto_transporte`(`descri_contacto_transporte`,`rela_contacto_con`,
                                                                            `rela_contacto_transporte`) 
                                                    VALUES (?,?,?)");
            $sqlTelefono->execute(array($telefonoAgencia1, 2, $lastInserttranposteIDs));
        }

        /*-------- INSERTAMOS EL TELEFONO FIJO--------*/

        $sqlFijo = $conexionBD->prepare("INSERT INTO `contacto_transporte`(`descri_contacto_transporte`,`rela_contacto_con`,
                                                                            `rela_contacto_transporte`) 
                                                    VALUES (?,?,?)");
        $sqlFijo->execute(array($telefonoFijoAgencia, 9, $lastInserttranposteIDs));

        /*-------- INSERTAMOS EL CORREO-------*/

        $sqlCorreo = $conexionBD->prepare("INSERT INTO `contacto_transporte`(`descri_contacto_transporte`,`rela_contacto_con`,
                                                                            `rela_contacto_transporte`) 
                                                    VALUES (?,?,?)");
        $sqlCorreo->execute(array($correoAgencia, 1, $lastInserttranposteIDs));

        /*-------- INSERTAMOS EL FACEBOOK--------*/

        $sqlFacebook = $conexionBD->prepare("INSERT INTO `contacto_transporte`(`descri_contacto_transporte`,`rela_contacto_con`,
                                                                            `rela_contacto_transporte`) 
                                                    VALUES (?,?,?)");
        $sqlFacebook->execute(array($facebookAgencia, 4, $lastInserttranposteIDs));

        /*-------- INSERTAMOS EL INSTAGRAM--------*/

        $sqlInstagram = $conexionBD->prepare("INSERT INTO `contacto_transporte`(`descri_contacto_transporte`,`rela_contacto_con`,
                                                                            `rela_contacto_transporte`) 
                                                    VALUES (?,?,?)");
        $sqlInstagram->execute(array($instagramAgencia, 5, $lastInserttranposteIDs));

        /*-------- INSERTAMOS EL TWITTER--------*/

        $sqlTwitter = $conexionBD->prepare("INSERT INTO `contacto_transporte`(`descri_contacto_transporte`,`rela_contacto_con`,
                                                                            `rela_contacto_transporte`) 
                                                    VALUES (?,?,?)");
        $sqlTwitter->execute(array($twitterAgencia, 6, $lastInserttranposteIDs));

        /*-------- INSERTAMOS EL SITIO WEB--------*/

        $sqlWeb = $conexionBD->prepare("INSERT INTO `contacto_transporte`(`descri_contacto_transporte`,`rela_contacto_con`,
                                                                            `rela_contacto_transporte`) 
                                                    VALUES (?,?,?)");
        $sqlWeb->execute(array($webAgencia, 7, $lastInserttranposteIDs));

        /*-------- INSERTAMOS OTRO--------*/

        $sqlOtro = $conexionBD->prepare("INSERT INTO `contacto_transporte`(`descri_contacto_transporte`,`rela_contacto_con`,
                                                                            `rela_contacto_transporte`) 
                                                    VALUES (?,?,?)");
        $sqlOtro->execute(array($otroAgencia, 8, $lastInserttranposteIDs));

        /*-------- INSERTAMOS EL ESTADO--------*/

        $sqlEstado = $conexionBD->prepare("INSERT INTO `estado_actividad`(`rela_tipo_estado`, `rela_estado_transportes`) 
                                            VALUES (?,?)");
        $sqlEstado->execute(array($estadoAgencia, $lastInserttranposteIDs));
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
        $sql = $conexionBD->prepare("SELECT t.id_transportes,t.designacion_transporte,t.idoneo_transportes,
        direccion.calle_direccion,direccion.id_direccion,localidad.id_localidad,t.fecha_edit_transporte,
        localidad.nombre_localidad,estado_actividad.id_estado,tipo_estado.id_tipo_estado,
        tipo_estado.descripcion_tipo_estado,ct.id_contacto_transporte,departamentos_fsa.descripcion_departamentos,
        st.id_servicios_transportes,st.descripcion_serv_transportes
        FROM `transportes` t
        INNER JOIN contacto_transporte ct on ct.rela_contacto_transporte = t.id_transportes
        INNER JOIN direccion ON t.rela_direccion = direccion.id_direccion
        INNER JOIN localidad on direccion.rela_localidad_direccion = localidad.id_localidad
        INNER JOIN estado_actividad on estado_actividad.rela_estado_transportes = t.id_transportes
        INNER JOIN tipo_estado on tipo_estado.id_tipo_estado = estado_actividad.rela_tipo_estado
        INNER JOIN departamentos_fsa on localidad.rela_departamento = departamentos_fsa.id_departamentos_fsa
        INNER JOIN servicios_transportes st on st.rela_serv_transporte = t.id_transportes
        WHERE t.id_transportes =$id_agencia");

        $sql->execute();

        return $sql->fetch(PDO::FETCH_OBJ);
    }

    public static function editar(
        $descripcion_Transportes,
        $servicioTransporte,
        $tranposteID,
        $idoneoTransporte,
        $rela_localidad_direccion,
        $calle_direccion,
        $telefonoAgencia,
        $telefonoFijoAgencia,
        $correoAgencia,
        $facebookAgencia,
        $instagramAgencia,
        $twitterAgencia,
        $webAgencia,
        $otroAgencia,
        $estadoAgencia,
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
    ) {

        $conexionBD = BD::crearInstancia();

        /*---------------SE ACTUALIZA EL TRANSPORTE-------------------*/
        $sql = $conexionBD->prepare("UPDATE `transportes` SET `designacion_transporte`='$descripcion_Transportes',`idoneo_transportes`='$idoneoTransporte',`fecha_edit_transporte`=CURRENT_TIMESTAMP() WHERE `id_transportes`= $tranposteID;");
        $sql->execute();

        /*---------------SE ACTUALIZA EL SERVICIO DEL TRANSPORTE-------------------*/
        $sql = $conexionBD->prepare("UPDATE `servicios_transportes` SET `descripcion_serv_transportes`='$servicioTransporte',`fecha_edit_serv_transporte`=CURRENT_TIMESTAMP() WHERE rela_serv_transporte= $tranposteID;");
        $sql->execute();

        /*---------------SE ACTUALIZA LA DIRECCION CON LA LOCALIDAD-------------------*/

        if ($rela_localidad_direccion == 0) {
            $sqlDireccion = $conexionBD->prepare("UPDATE `direccion` SET `calle_direccion`='$calle_direccion'
                                                        WHERE id_direccion = $idDireccion ");
            $sqlDireccion->execute();
        } else {
            $sqlDireccion = $conexionBD->prepare("UPDATE `direccion` SET `calle_direccion`='$calle_direccion',
                                                        `rela_localidad_direccion`=$rela_localidad_direccion 
                                                        WHERE id_direccion = $idDireccion ");
            $sqlDireccion->execute();
        }

        /*----------------SE ACTUALIZA EL ESTADO------------------*/

        if ($estadoAgencia == 0) {
            echo "actualizado";
        } else {
            $sqlEstado = $conexionBD->prepare("UPDATE `estado_actividad` SET `rela_tipo_estado`=$estadoAgencia
                                                        WHERE id_estado = $idestadoAgencia");
            $sqlEstado->execute();
        }


        /*----------------SE ACTUALIZA EL CONTACTO telefono------------------*/

        $asociativo = array_combine($idtelefonoAgencia, $telefonoAgencia);



        foreach ($asociativo as $indice => $valor) {

            $sqlContacto = $conexionBD->prepare("UPDATE `contacto_transporte` SET `descri_contacto_transporte`='$valor'
                    WHERE id_contacto_transporte = $indice");
            $sqlContacto->execute();
            // print_r($sqlContacto);
        }
        /*----------------SE ACTUALIZA EL CONTACTO  telefono fijo------------------*/

        if ($telefonoFijoAgencia == "") {
            $telefonoFijoAgencia = "No se registró";

            $sqlFijo = $conexionBD->prepare("UPDATE `contacto_transporte` SET `descri_contacto_transporte`= '$telefonoFijoAgencia'
                                                    WHERE id_contacto_transporte = $idtelefonoFijoAgencia");
            $sqlFijo->execute();
        } else {
            $sqlFijo = $conexionBD->prepare("UPDATE `contacto_transporte` SET `descri_contacto_transporte`= $telefonoFijoAgencia
                                                    WHERE id_contacto_transporte = $idtelefonoFijoAgencia");
            $sqlFijo->execute();
        }
        /*----------------SE ACTUALIZA EL CONTACTO correo------------------*/

        $sqlCorreo = $conexionBD->prepare("UPDATE `contacto_transporte` SET `descri_contacto_transporte`='$correoAgencia'
                                                    WHERE id_contacto_transporte = $idcorreoAgencia");
        $sqlCorreo->execute();

        /*----------------SE ACTUALIZA EL CONTACTO facebook ------------------*/

        $sqlFacebook = $conexionBD->prepare("UPDATE `contacto_transporte` SET `descri_contacto_transporte`='$facebookAgencia'
                                                    WHERE id_contacto_transporte = $idfacebookAgencia");
        $sqlFacebook->execute();

        /*----------------SE ACTUALIZA EL CONTACTO Instagram ------------------*/

        $sqlInstagram = $conexionBD->prepare("UPDATE `contacto_transporte` SET `descri_contacto_transporte`='$instagramAgencia'
                                                    WHERE id_contacto_transporte = $idinstagramAgencia");
        $sqlInstagram->execute();

        /*----------------SE ACTUALIZA EL CONTACTO  twitter------------------*/

        $sqlTwitter = $conexionBD->prepare("UPDATE `contacto_transporte` SET `descri_contacto_transporte`='$twitterAgencia'
                                                    WHERE id_contacto_transporte = $idtwitterAgencia");
        $sqlTwitter->execute();

        /*----------------SE ACTUALIZA EL CONTACTO  sitio web------------------*/

        $sqlWeb = $conexionBD->prepare("UPDATE `contacto_transporte` SET `descri_contacto_transporte`='$webAgencia'
                                                    WHERE id_contacto_transporte = $idwebAgencia");
        $sqlWeb->execute();

        /*----------------SE ACTUALIZA EL CONTACTO otro------------------*/

        $sqlOtro = $conexionBD->prepare("UPDATE `contacto_transporte` SET `descri_contacto_transporte`='$otroAgencia'
                                                    WHERE id_contacto_transporte = $idotroAgencia ");
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

class ContactosTransportes
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
        $consulta = $conexionBD->query(" SELECT id_contacto_transporte, descri_contacto_transporte 
                                            FROM contacto_transporte 
                                            WHERE contacto_transporte.rela_contacto_con = 2
                                            and contacto_transporte.rela_contacto_transporte = $id_agencia");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarTelefonosFijos($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto_transporte, descri_contacto_transporte 
                                            FROM contacto_transporte 
                                            WHERE contacto_transporte.rela_contacto_con = 9
                                            and contacto_transporte.rela_contacto_transporte = $id_agencia");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarCorreo($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto_transporte, descri_contacto_transporte 
                                            FROM contacto_transporte 
                                            WHERE contacto_transporte.rela_contacto_con = 1
                                            and contacto_transporte.rela_contacto_transporte = $id_agencia");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarFacebook($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto_transporte, descri_contacto_transporte 
                                            FROM contacto_transporte 
                                            WHERE contacto_transporte.rela_contacto_con = 4
                                            and contacto_transporte.rela_contacto_transporte = $id_agencia");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarInstagram($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto_transporte, descri_contacto_transporte 
                                            FROM contacto_transporte 
                                            WHERE contacto_transporte.rela_contacto_con = 5
                                            and contacto_transporte.rela_contacto_transporte = $id_agencia");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarTwitter($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto_transporte, descri_contacto_transporte 
                                            FROM contacto_transporte 
                                            WHERE contacto_transporte.rela_contacto_con = 6
                                            and contacto_transporte.rela_contacto_transporte = $id_agencia");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarWeb($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto_transporte, descri_contacto_transporte 
                                            FROM contacto_transporte 
                                            WHERE contacto_transporte.rela_contacto_con = 7
                                            and contacto_transporte.rela_contacto_transporte = $id_agencia");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarOtro($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto_transporte, descri_contacto_transporte 
                                            FROM contacto_transporte 
                                            WHERE contacto_transporte.rela_contacto_con = 8
                                            and contacto_transporte.rela_contacto_transporte = $id_agencia");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }
}

class ContactosInfoTransporte
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
        $consulta = $conexionBD->query(" SELECT id_contacto_transporte, contacto_transporte.descri_contacto_transporte 
                                            FROM contacto_transporte 
                                            WHERE contacto_transporte.rela_contacto_con = 2
                                            and contacto_transporte.rela_contacto_transporte = $id_agencia");

        while ($filas = $consulta->fetch(PDO::FETCH_ASSOC)) {
            $this->telefonoAgenciaInfo[] = $filas;
        }
        return $this->telefonoAgenciaInfo;
    }

    public function consultarTelefonosFijos($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT contacto_transporte.descri_contacto_transporte 
                                            FROM contacto_transporte 
                                            WHERE contacto_transporte.rela_contacto_con = 9
                                            and contacto_transporte.rela_contacto_transporte = $id_agencia");

        while ($filas = $consulta->fetch(PDO::FETCH_ASSOC)) {
            $this->telefonoFijoAgencia[] = $filas;
        }
        return $this->telefonoFijoAgencia;
    }

    public function consultarCorreo($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT contacto_transporte.descri_contacto_transporte 
                                            FROM contacto_transporte 
                                            WHERE contacto_transporte.rela_contacto_con = 1
                                            and contacto_transporte.rela_contacto_transporte = $id_agencia");

        while ($filas = $consulta->fetch(PDO::FETCH_ASSOC)) {
            $this->correoAgencia[] = $filas;
        }
        return $this->correoAgencia;
    }

    public function consultarFacebook($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT contacto_transporte.descri_contacto_transporte 
                                            FROM contacto_transporte 
                                            WHERE contacto_transporte.rela_contacto_con = 4
                                            and contacto_transporte.rela_contacto_transporte = $id_agencia");

        while ($filas = $consulta->fetch(PDO::FETCH_ASSOC)) {
            $this->facebookAgencia[] = $filas;
        }
        return $this->facebookAgencia;
    }

    public function consultarInstagram($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT contacto_transporte.descri_contacto_transporte 
                                            FROM contacto_transporte 
                                            WHERE contacto_transporte.rela_contacto_con = 5
                                            and contacto_transporte.rela_contacto_transporte = $id_agencia");

        while ($filas = $consulta->fetch(PDO::FETCH_ASSOC)) {
            $this->instagramAgencia[] = $filas;
        }
        return $this->instagramAgencia;
    }

    public function consultarTwitter($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT contacto_transporte.descri_contacto_transporte 
                                            FROM contacto_transporte 
                                            WHERE contacto_transporte.rela_contacto_con = 6
                                            and contacto_transporte.rela_contacto_transporte = $id_agencia");

        while ($filas = $consulta->fetch(PDO::FETCH_ASSOC)) {
            $this->twitterAgencia[] = $filas;
        }
        return $this->twitterAgencia;
    }

    public function consultarWeb($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT contacto_transporte.descri_contacto_transporte 
                                            FROM contacto_transporte 
                                            WHERE contacto_transporte.rela_contacto_con = 7
                                            and contacto_transporte.rela_contacto_transporte = $id_agencia");

        while ($filas = $consulta->fetch(PDO::FETCH_ASSOC)) {
            $this->webAgencia[] = $filas;
        }
        return $this->webAgencia;
    }

    public function consultarOtro($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT contacto_transporte.descri_contacto_transporte 
                                            FROM contacto_transporte 
                                            WHERE contacto_transporte.rela_contacto_con = 8
                                            and contacto_transporte.rela_contacto_transporte = $id_agencia");

        while ($filas = $consulta->fetch(PDO::FETCH_ASSOC)) {
            $this->otroAgencia[] = $filas;
        }
        return $this->otroAgencia;
    }
}
class estadistica
{


    public function cantidadTransportes()
    {

        $conexionBD = BD::crearInstancia();


        $sqlestadistica = $conexionBD->query("SELECT COUNT(*) conteo FROM `transportes`");

        $sqlestadistica->execute();

        return $sqlestadistica->fetchAll(PDO::FETCH_OBJ);
    }

    public function cantidadTransportesHabilitadas()
    {

        $conexionBD = BD::crearInstancia();


        $sqlestadistica = $conexionBD->query("SELECT COUNT(estado_actividad.rela_estado_transportes) conteo 
                                                    FROM `estado_actividad` 
                                                    WHERE  estado_actividad.rela_tipo_estado = 1");

        $sqlestadistica->execute();

        return $sqlestadistica->fetchAll(PDO::FETCH_OBJ);
    }
}
