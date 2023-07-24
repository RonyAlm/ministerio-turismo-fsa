<?php
class NotasModelo
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
            $tableName = 'notas';

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

        $sql = $conexionBD->query("SELECT `id_notas`, `numero_nota`, `fecha_ig_notas`, `remitente_nota`, `descrip_motivo`, `respuesta_nota`, `fecha_sl_nota`, `rela_tipo_org`, `fecha_edit_notas`,
        d.id_direccion_notas,d.calle_direccion_notas,
        l.id_localidad,l.nombre_localidad,
        tpn.id_tipo_motivo_notas,tpn.descripcion_tipo_mot_notas,
        ton.id_tipo_org_nota,ton.descripcion_org_nota,
        (SELECT ct.descri_contacto_notas 
        FROM contacto_notas ct
        WHERE n.id_notas = ct.rela_contacto_notas 
        and ct.rela_contacto_con = 2
        LIMIT 1) descri_contacto_notas
        FROM `notas` n
        INNER JOIN direccion_notas d ON n.rela_dire_nota = d.id_direccion_notas
        INNER JOIN localidad l on d.rela_localidad_nota = l.id_localidad
        INNER JOIN tipo_motivo_notas tpn on tpn.id_tipo_motivo_notas = n.rela_tipo_motivo
        INNER JOIN tipo_organismo_nota ton on ton.id_tipo_org_nota =n.rela_tipo_org");

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
        ct.id_contacto_notas,departamentos_fsa.id_departamentos_fsa,
        st.id_servicios_transportes
        FROM `transportes` t
        INNER JOIN contacto_notas ct on ct.rela_contacto_notas = t.id_transportes
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
        $fecha_ingreso,
        $organismos,
        $tipo_motivo,
        $numero_nota,
        $remitente,
        $descripcion_motivo,
        $respuesta_notas,
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
    ) {

        $conexionBD = BD::crearInstancia();

        /*-------- INSERTAMOS LA DIRECCION--------*/

        $sqlDireccion = $conexionBD->prepare("INSERT INTO direccion_notas (calle_direccion_notas,rela_localidad_nota)
                                                    VALUES(?,?)");
        $sqlDireccion->execute(array($domicilioTransporte, $rela_localidad_direccion));

        $lastInsertIDdireccion = $conexionBD->lastInsertId();

        /*-------- INSERTAMOS LA NOTA--------*/

        $sql = $conexionBD->prepare("INSERT INTO `notas`(`numero_nota`, `fecha_ig_notas`,
         `remitente_nota`, `descrip_motivo`, `respuesta_nota`,  `rela_tipo_org`,
          `rela_tipo_motivo`, `rela_dire_nota`, `fecha_edit_notas`) 
          VALUES (?,?,?,?,?,?,?,?,CURRENT_TIMESTAMP())");
        $sql->execute(array(
            $numero_nota, $fecha_ingreso,
            $remitente, $descripcion_motivo,
            $respuesta_notas, $organismos,
            $tipo_motivo, $lastInsertIDdireccion
        ));
        $lastInsertNotas = $conexionBD->lastInsertId();


        /*-------- INSERTAMOS EL TELEFONO CELULAR--------*/

        foreach ($telefonoAgencia as $telefonoAgencia1) {

            $sqlTelefono = $conexionBD->prepare("INSERT INTO `contacto_notas`(`descri_contacto_notas`,`rela_contacto_con`,
                                                                            `rela_contacto_notas`) 
                                                    VALUES (?,?,?)");
            $sqlTelefono->execute(array($telefonoAgencia1, 2, $lastInsertNotas));
        }

        /*-------- INSERTAMOS EL TELEFONO FIJO--------*/

        $sqlFijo = $conexionBD->prepare("INSERT INTO `contacto_notas`(`descri_contacto_notas`,`rela_contacto_con`,
                                                                            `rela_contacto_notas`) 
                                                    VALUES (?,?,?)");
        $sqlFijo->execute(array($telefonoFijoAgencia, 9, $lastInsertNotas));

        /*-------- INSERTAMOS EL CORREO-------*/

        $sqlCorreo = $conexionBD->prepare("INSERT INTO `contacto_notas`(`descri_contacto_notas`,`rela_contacto_con`,
                                                                            `rela_contacto_notas`) 
                                                    VALUES (?,?,?)");
        $sqlCorreo->execute(array($correoAgencia, 1, $lastInsertNotas));

        /*-------- INSERTAMOS EL FACEBOOK--------*/

        $sqlFacebook = $conexionBD->prepare("INSERT INTO `contacto_notas`(`descri_contacto_notas`,`rela_contacto_con`,
                                                                            `rela_contacto_notas`) 
                                                    VALUES (?,?,?)");
        $sqlFacebook->execute(array($facebookAgencia, 4, $lastInsertNotas));

        /*-------- INSERTAMOS EL INSTAGRAM--------*/

        $sqlInstagram = $conexionBD->prepare("INSERT INTO `contacto_notas`(`descri_contacto_notas`,`rela_contacto_con`,
                                                                            `rela_contacto_notas`) 
                                                    VALUES (?,?,?)");
        $sqlInstagram->execute(array($instagramAgencia, 5, $lastInsertNotas));

        /*-------- INSERTAMOS EL TWITTER--------*/

        $sqlTwitter = $conexionBD->prepare("INSERT INTO `contacto_notas`(`descri_contacto_notas`,`rela_contacto_con`,
                                                                            `rela_contacto_notas`) 
                                                    VALUES (?,?,?)");
        $sqlTwitter->execute(array($twitterAgencia, 6, $lastInsertNotas));

        /*-------- INSERTAMOS EL SITIO WEB--------*/

        $sqlWeb = $conexionBD->prepare("INSERT INTO `contacto_notas`(`descri_contacto_notas`,`rela_contacto_con`,
                                                                            `rela_contacto_notas`) 
                                                    VALUES (?,?,?)");
        $sqlWeb->execute(array($webAgencia, 7, $lastInsertNotas));

        /*-------- INSERTAMOS OTRO--------*/

        $sqlOtro = $conexionBD->prepare("INSERT INTO `contacto_notas`(`descri_contacto_notas`,`rela_contacto_con`,
                                                                            `rela_contacto_notas`) 
                                                    VALUES (?,?,?)");
        $sqlOtro->execute(array($otroAgencia, 8, $lastInsertNotas));
    }

    public static function borrar($tranposteIDBorrar, $id_direccion)
    {
        $conexionBD = BD::crearInstancia();
        $sqlAgenciaBorrar = $conexionBD->prepare("DELETE FROM `notas` WHERE id_notas=?");
        $sqlAgenciaBorrar->execute(array($tranposteIDBorrar));

        $sqlDireccionBorrar = $conexionBD->prepare("DELETE FROM direccion_notas WHERE id_direccion_notas=?");
        $sqlDireccionBorrar->execute(array($id_direccion));
    }
    /*----------BUSCAR para ir imprimir en la seccion EDITAR----------*/
    public function buscar($id)
    {
        $conexionBD = BD::crearInstancia();
        $sql = $conexionBD->prepare("SELECT * FROM `notas` n
        INNER JOIN direccion_notas d ON n.rela_dire_nota = d.id_direccion_notas
        INNER JOIN localidad l on d.rela_localidad_nota = l.id_localidad
        INNER JOIN tipo_motivo_notas tpn on tpn.id_tipo_motivo_notas = n.rela_tipo_motivo
        INNER JOIN tipo_organismo_nota ton on ton.id_tipo_org_nota =n.rela_tipo_org
        INNER JOIN contacto_notas cn on cn.rela_contacto_notas = n.id_notas
        WHERE n.id_notas =$id");

        $sql->execute();

        return $sql->fetch(PDO::FETCH_OBJ);
    }
    public function paraImprimir()
    {
        $conexionBD = BD::crearInstancia();

        $sql = $conexionBD->query("SELECT `numero_nota`, `fecha_ig_notas`, `remitente_nota`, `descrip_motivo`, `respuesta_nota`, `fecha_sl_nota`, `rela_tipo_org`, `fecha_edit_notas`,
        d.calle_direccion_notas,
        l.nombre_localidad,
        tpn.descripcion_tipo_mot_notas,
        ton.descripcion_org_nota,
        (SELECT ct.descri_contacto_notas 
        FROM contacto_notas ct
        WHERE n.id_notas = ct.rela_contacto_notas 
        and ct.rela_contacto_con = 2
        LIMIT 1) telefono,
        (SELECT ct.descri_contacto_notas 
        FROM contacto_notas ct
        WHERE n.id_notas = ct.rela_contacto_notas 
        and ct.rela_contacto_con = 1
        LIMIT 1) correo
        FROM `notas` n
        INNER JOIN direccion_notas d ON n.rela_dire_nota = d.id_direccion_notas
        INNER JOIN localidad l on d.rela_localidad_nota = l.id_localidad
        INNER JOIN tipo_motivo_notas tpn on tpn.id_tipo_motivo_notas = n.rela_tipo_motivo
        INNER JOIN tipo_organismo_nota ton on ton.id_tipo_org_nota =n.rela_tipo_org");

        //recuperamos los datos y los retornamos

        while ($filas = $sql->fetch(PDO::FETCH_ASSOC)) {
            $this->listaAgencia[] = $filas;
        }
        return $this->listaAgencia; //este return se va a llamar en el controlador_alojamiento.php clase inicio
    }

    public static function editar(
        $fecha_ingreso,
        $organismoID,
        $notasID,
        $organismos,
        $numero_nota,
        $remitente,
        $motivoID,
        $tipo_motivo,
        $descripcion_motivo,
        $respuesta_notas,
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
        $idDireccion,
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

        /*---------------SE ACTUALIZA EL TRANSPORTE-------------------*/
        $sql = $conexionBD->prepare("UPDATE `notas` SET `numero_nota`='$numero_nota',`fecha_ig_notas`='$fecha_ingreso',
        `remitente_nota`='$remitente',`descrip_motivo`='$descripcion_motivo',
        `respuesta_nota`='$respuesta_notas',`rela_tipo_org`=$organismos,
        `rela_tipo_motivo`=$tipo_motivo,`fecha_edit_notas`=CURRENT_TIMESTAMP() 
        WHERE id_notas = $notasID;");
        $sql->execute();
        /*---------------SE ACTUALIZA LA DIRECCION CON LA LOCALIDAD-------------------*/

        if ($rela_localidad_direccion == 0) {
            $sqlDireccion = $conexionBD->prepare("UPDATE `direccion_notas` SET `calle_direccion_notas`='$calle_direccion'
                                                        WHERE id_direccion_notas  = $idDireccion ");
            $sqlDireccion->execute();
        } else {
            $sqlDireccion = $conexionBD->prepare("UPDATE `direccion_notas` SET `calle_direccion_notas`='$calle_direccion',
                                                        `rela_localidad_nota`=$rela_localidad_direccion 
                                                        WHERE id_direccion_notas  = $idDireccion ");
            $sqlDireccion->execute();
        }




        /*----------------SE ACTUALIZA EL CONTACTO telefono------------------*/

        $asociativo = array_combine($idtelefonoAgencia, $telefonoAgencia);



        foreach ($asociativo as $indice => $valor) {

            $sqlContacto = $conexionBD->prepare("UPDATE `contacto_notas` SET `descri_contacto_notas`='$valor'
                    WHERE id_contacto_notas = $indice");
            $sqlContacto->execute();
            // print_r($sqlContacto);
        }
        /*----------------SE ACTUALIZA EL CONTACTO  telefono fijo------------------*/

        if ($telefonoFijoAgencia == "") {
            $telefonoFijoAgencia = "No se registró";

            $sqlFijo = $conexionBD->prepare("UPDATE `contacto_notas` SET `descri_contacto_notas`= '$telefonoFijoAgencia'
                                                    WHERE id_contacto_notas = $idtelefonoFijoAgencia");
            $sqlFijo->execute();
        } else {
            $sqlFijo = $conexionBD->prepare("UPDATE `contacto_notas` SET `descri_contacto_notas`= $telefonoFijoAgencia
                                                    WHERE id_contacto_notas = $idtelefonoFijoAgencia");
            $sqlFijo->execute();
        }
        /*----------------SE ACTUALIZA EL CONTACTO correo------------------*/

        $sqlCorreo = $conexionBD->prepare("UPDATE `contacto_notas` SET `descri_contacto_notas`='$correoAgencia'
                                                    WHERE id_contacto_notas = $idcorreoAgencia");
        $sqlCorreo->execute();

        /*----------------SE ACTUALIZA EL CONTACTO facebook ------------------*/

        $sqlFacebook = $conexionBD->prepare("UPDATE `contacto_notas` SET `descri_contacto_notas`='$facebookAgencia'
                                                    WHERE id_contacto_notas = $idfacebookAgencia");
        $sqlFacebook->execute();

        /*----------------SE ACTUALIZA EL CONTACTO Instagram ------------------*/

        $sqlInstagram = $conexionBD->prepare("UPDATE `contacto_notas` SET `descri_contacto_notas`='$instagramAgencia'
                                                    WHERE id_contacto_notas = $idinstagramAgencia");
        $sqlInstagram->execute();

        /*----------------SE ACTUALIZA EL CONTACTO  twitter------------------*/

        $sqlTwitter = $conexionBD->prepare("UPDATE `contacto_notas` SET `descri_contacto_notas`='$twitterAgencia'
                                                    WHERE id_contacto_notas = $idtwitterAgencia");
        $sqlTwitter->execute();

        /*----------------SE ACTUALIZA EL CONTACTO  sitio web------------------*/

        $sqlWeb = $conexionBD->prepare("UPDATE `contacto_notas` SET `descri_contacto_notas`='$webAgencia'
                                                    WHERE id_contacto_notas = $idwebAgencia");
        $sqlWeb->execute();

        /*----------------SE ACTUALIZA EL CONTACTO otro------------------*/

        $sqlOtro = $conexionBD->prepare("UPDATE `contacto_notas` SET `descri_contacto_notas`='$otroAgencia'
                                                    WHERE id_contacto_notas = $idotroAgencia ");
        $sqlOtro->execute();
    }

    public function buscarSelectLocalidad()
    {

        $conexionBD = BD::crearInstancia();


        $sqlLocalidad = $conexionBD->query("SELECT id_localidad, nombre_localidad, rela_provincia, rela_departamento FROM localidad");

        $sqlLocalidad->execute();

        return $sqlLocalidad->fetchAll(PDO::FETCH_OBJ);
    }

    public function buscarSelectMotivo()
    {

        $conexionBD = BD::crearInstancia();


        $sqlLocalidad = $conexionBD->query("SELECT * FROM `tipo_motivo_notas` ORDER BY `tipo_motivo_notas`.`descripcion_tipo_mot_notas` ASC");

        $sqlLocalidad->execute();


        return $sqlLocalidad->fetchAll(PDO::FETCH_OBJ);
    }
    public function buscarSelectOrganismos()
    {

        $conexionBD = BD::crearInstancia();


        $sqlLocalidad = $conexionBD->query("SELECT * FROM `tipo_organismo_nota` ORDER BY `tipo_organismo_nota`.`descripcion_org_nota` ASC");

        $sqlLocalidad->execute();

        return $sqlLocalidad->fetchAll(PDO::FETCH_OBJ);
    }

    public static function agregarMyO($motivo, $organismo)
    {
        $conexionBD = BD::crearInstancia();
        if ($motivo == "") {
        } else {
            $sql = $conexionBD->prepare("INSERT INTO `tipo_motivo_notas`(`descripcion_tipo_mot_notas`) VALUES (?)");
            $sql->execute(array($motivo));
        }
        if ($organismo == "") {
        } else {
            $sql = $conexionBD->prepare("INSERT INTO `tipo_organismo_nota`(`descripcion_org_nota`) VALUES (?)");
            $sql->execute(array($organismo));
        }
        // $sql = $conexionBD->prepare("INSERT INTO `usuario_contra`( `usuario`, `contraseña`, `rela_rol_id`, `rela_tablas`)
        //         VALUES (?,?,?,?)");
        // $sql->execute(array($inputUsuario, $inputPasswordtablas1, $selectRoles, $selectTablas));
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
        $consulta = $conexionBD->query(" SELECT id_contacto_notas, descri_contacto_notas 
                                            FROM contacto_notas 
                                            WHERE contacto_notas.rela_contacto_con = 2
                                            and contacto_notas.rela_contacto_notas = $id_agencia");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarTelefonosFijos($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto_notas, descri_contacto_notas 
                                            FROM contacto_notas 
                                            WHERE contacto_notas.rela_contacto_con = 9
                                            and contacto_notas.rela_contacto_notas = $id_agencia");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarCorreo($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto_notas, descri_contacto_notas 
                                            FROM contacto_notas 
                                            WHERE contacto_notas.rela_contacto_con = 1
                                            and contacto_notas.rela_contacto_notas = $id_agencia");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarFacebook($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto_notas, descri_contacto_notas 
                                            FROM contacto_notas 
                                            WHERE contacto_notas.rela_contacto_con = 4
                                            and contacto_notas.rela_contacto_notas = $id_agencia");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarInstagram($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto_notas, descri_contacto_notas 
                                            FROM contacto_notas 
                                            WHERE contacto_notas.rela_contacto_con = 5
                                            and contacto_notas.rela_contacto_notas = $id_agencia");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarTwitter($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto_notas, descri_contacto_notas 
                                            FROM contacto_notas 
                                            WHERE contacto_notas.rela_contacto_con = 6
                                            and contacto_notas.rela_contacto_notas = $id_agencia");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarWeb($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto_notas, descri_contacto_notas 
                                            FROM contacto_notas 
                                            WHERE contacto_notas.rela_contacto_con = 7
                                            and contacto_notas.rela_contacto_notas = $id_agencia");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarOtro($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto_notas, descri_contacto_notas 
                                            FROM contacto_notas 
                                            WHERE contacto_notas.rela_contacto_con = 8
                                            and contacto_notas.rela_contacto_notas = $id_agencia");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }
}

class ContactosInfoNotas
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
        $consulta = $conexionBD->query(" SELECT id_contacto_notas, contacto_notas.descri_contacto_notas 
                                            FROM contacto_notas 
                                            WHERE contacto_notas.rela_contacto_con = 2
                                            and contacto_notas.rela_contacto_notas = $id_agencia");

        while ($filas = $consulta->fetch(PDO::FETCH_ASSOC)) {
            $this->telefonoAgenciaInfo[] = $filas;
        }
        return $this->telefonoAgenciaInfo;
    }

    public function consultarTelefonosFijos($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT contacto_notas.descri_contacto_notas 
                                            FROM contacto_notas 
                                            WHERE contacto_notas.rela_contacto_con = 9
                                            and contacto_notas.rela_contacto_notas = $id_agencia");

        while ($filas = $consulta->fetch(PDO::FETCH_ASSOC)) {
            $this->telefonoFijoAgencia[] = $filas;
        }
        return $this->telefonoFijoAgencia;
    }

    public function consultarCorreo($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT contacto_notas.descri_contacto_notas 
                                            FROM contacto_notas 
                                            WHERE contacto_notas.rela_contacto_con = 1
                                            and contacto_notas.rela_contacto_notas = $id_agencia");

        while ($filas = $consulta->fetch(PDO::FETCH_ASSOC)) {
            $this->correoAgencia[] = $filas;
        }
        return $this->correoAgencia;
    }

    public function consultarFacebook($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT contacto_notas.descri_contacto_notas 
                                            FROM contacto_notas 
                                            WHERE contacto_notas.rela_contacto_con = 4
                                            and contacto_notas.rela_contacto_notas = $id_agencia");

        while ($filas = $consulta->fetch(PDO::FETCH_ASSOC)) {
            $this->facebookAgencia[] = $filas;
        }
        return $this->facebookAgencia;
    }

    public function consultarInstagram($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT contacto_notas.descri_contacto_notas 
                                            FROM contacto_notas 
                                            WHERE contacto_notas.rela_contacto_con = 5
                                            and contacto_notas.rela_contacto_notas = $id_agencia");

        while ($filas = $consulta->fetch(PDO::FETCH_ASSOC)) {
            $this->instagramAgencia[] = $filas;
        }
        return $this->instagramAgencia;
    }

    public function consultarTwitter($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT contacto_notas.descri_contacto_notas 
                                            FROM contacto_notas 
                                            WHERE contacto_notas.rela_contacto_con = 6
                                            and contacto_notas.rela_contacto_notas = $id_agencia");

        while ($filas = $consulta->fetch(PDO::FETCH_ASSOC)) {
            $this->twitterAgencia[] = $filas;
        }
        return $this->twitterAgencia;
    }

    public function consultarWeb($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT contacto_notas.descri_contacto_notas 
                                            FROM contacto_notas 
                                            WHERE contacto_notas.rela_contacto_con = 7
                                            and contacto_notas.rela_contacto_notas = $id_agencia");

        while ($filas = $consulta->fetch(PDO::FETCH_ASSOC)) {
            $this->webAgencia[] = $filas;
        }
        return $this->webAgencia;
    }

    public function consultarOtro($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT contacto_notas.descri_contacto_notas 
                                            FROM contacto_notas 
                                            WHERE contacto_notas.rela_contacto_con = 8
                                            and contacto_notas.rela_contacto_notas = $id_agencia");

        while ($filas = $consulta->fetch(PDO::FETCH_ASSOC)) {
            $this->otroAgencia[] = $filas;
        }
        return $this->otroAgencia;
    }
}
class estadistica
{


    public function cantidadnotas()
    {

        $conexionBD = BD::crearInstancia();


        $sqlestadistica = $conexionBD->query("SELECT COUNT(*) conteo FROM `notas`");

        $sqlestadistica->execute();

        return $sqlestadistica->fetchAll(PDO::FETCH_OBJ);
    }

    public function cantidadfechaIng()
    {

        $conexionBD = BD::crearInstancia();


        $sqlestadistica = $conexionBD->query("SELECT COUNT(fecha_ig_notas) conteoIngreso 
                                                    FROM `notas`");

        $sqlestadistica->execute();

        return $sqlestadistica->fetchAll(PDO::FETCH_OBJ);
    }
    public function cantidadfechaSal()
    {

        $conexionBD = BD::crearInstancia();


        $sqlestadistica = $conexionBD->query("SELECT COUNT(fecha_sl_nota) conteoSalida
                                                    FROM `notas`");

        $sqlestadistica->execute();

        return $sqlestadistica->fetchAll(PDO::FETCH_OBJ);
    }
}
