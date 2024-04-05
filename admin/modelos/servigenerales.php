<?php

class ServigeneralModelo
{

    public $listaServigenerales;
    public $listaServigeneralesID;
    public $listaBuscar;


    public function __construct()
    {
        $this->listaServigenerales = array();
        $this->listaServigeneralesID = array();
        $this->listaBuscar = array();
    }
    public function trigger($accion, $id, $controlador1)
    {
        $conexionBD = BD::crearInstancia();

        BD::iniciarTransaccion();

        try {
            $triggerName = $accion . $controlador1;
            $tableName = 'servicios_generales';

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

    public function consultar()
    {

        $conexionBD = BD::crearInstancia();

        $sql = $conexionBD->query("SELECT `id_servicios_generales`, `nombre_servicio_general`, `idoneo_servicio_general`,
        direccion.calle_direccion,direccion.id_direccion,
        localidad.nombre_localidad,localidad.id_localidad,
        tipo_estacion.descripcion_estacion,
        tipo_de_servicio.descripcion_servicio,
        tipo_lugar.descripcion_lugar,
        `descripcion_servicio_general`,
        fecha_edit_general,
        (SELECT contacto.descripcion_contacto 
        FROM contacto 
        WHERE servicios_generales.id_servicios_generales = contacto.rela_servicios_generales
        and contacto.rela_tipo_contacto_cont = 2
        LIMIT 1) descripcion_contacto
        FROM `servicios_generales` 
        INNER JOIN direccion ON servicios_generales.rela_direccion = direccion.id_direccion
        INNER JOIN localidad on direccion.rela_localidad_direccion = localidad.id_localidad
        INNER JOIN tipo_estacion on tipo_estacion.id_tipo_estacion= servicios_generales.rela_estacion
        INNER JOIN tipo_de_servicio on tipo_de_servicio.id_tipo_servicio = servicios_generales.rela_tipo_servicio
        INNER JOIN tipo_lugar on tipo_lugar.id_tipo_lugar = servicios_generales.rela_tipo_lugar");

        //recuperamos los datos y los retornamos

        while ($filas = $sql->fetch(PDO::FETCH_ASSOC)) {
            $this->listaServigenerales[] = $filas;
        }
        return $this->listaServigenerales; //este return se va a llamar en el controlador_alojamiento.php clase inicio

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

    public function crear(
        $nombre,
        $descripcion,
        $idoneo,
        $localidad,
        $tipoServiGeneral,
        $tipoServicio,
        $domicilio,
        $estacion,
        $telefonoAgencia,
        $telefonoFijoAgencia,
        $correoAgencia,
        $facebookAgencia,
        $instagramAgencia,
        $twitterAgencia,
        $webAgencia,
        $otroAgencia
    ) {

        $conexionBD = BD::crearInstancia();

        /*-------- INSERTAMOS LA DIRECCION--------*/

        $sqlDireccion = $conexionBD->prepare("INSERT INTO direccion (calle_direccion,rela_localidad_direccion)
                                                    VALUES(?,?)");
        $sqlDireccion->execute(array($domicilio, $localidad));

        $lastInsertIDdireccion = $conexionBD->lastInsertId();


        /*-------- INSERTAMOS EL SERVICIO GENERAL--------*/

        $sql = $conexionBD->prepare("INSERT INTO `servicios_generales`( `nombre_servicio_general`,`idoneo_servicio_general`, `rela_direccion`, `rela_estacion`, `rela_tipo_servicio`, `rela_tipo_lugar`, `descripcion_servicio_general`, fecha_edit_general) VALUES (?,?,?,?,?,?,?,CURRENT_TIMESTAMP())");
        $sql->execute(array(
            $nombre, $idoneo, $lastInsertIDdireccion,
            $estacion, $tipoServicio, $tipoServiGeneral,
            $descripcion
        ));

        $lastInsertIDAgencias = $conexionBD->lastInsertId();

        // print_r($lastInsertIDAgencias);

        /*-------- INSERTAMOS EL TELEFONO CELULAR--------*/

        foreach ($telefonoAgencia as $telefonoAgencia1) {

            $sqlTelefono = $conexionBD->prepare("INSERT INTO `contacto`(`descripcion_contacto`, `rela_tipo_contacto_cont`, `rela_servicios_generales`) VALUES (?,?,?)");
            // print_r($sqlTelefono);
            $sqlTelefono->execute(array($telefonoAgencia1, 2, $lastInsertIDAgencias));
            // $sqlTelefono->execute();
        }

        /*-------- INSERTAMOS EL TELEFONO FIJO--------*/

        $sqlFijo = $conexionBD->prepare("INSERT INTO `contacto`(`descripcion_contacto`, `rela_tipo_contacto_cont`, `rela_servicios_generales`) VALUES (?,?,?)");
        $sqlFijo->execute(array($telefonoFijoAgencia, 9,  $lastInsertIDAgencias));
        print_r($sqlFijo);

        /*-------- INSERTAMOS EL CORREO-------*/

        $sqlCorreo = $conexionBD->prepare("INSERT INTO `contacto`(`descripcion_contacto`, `rela_tipo_contacto_cont`, `rela_servicios_generales`) VALUES (?,?,?)");
        $sqlCorreo->execute(array($correoAgencia, 1, $lastInsertIDAgencias));

        /*-------- INSERTAMOS EL FACEBOOK--------*/

        $sqlFacebook = $conexionBD->prepare("INSERT INTO `contacto`(`descripcion_contacto`, `rela_tipo_contacto_cont`, `rela_servicios_generales`) VALUES (?,?,?)");
        $sqlFacebook->execute(array($facebookAgencia, 4, $lastInsertIDAgencias));

        /*-------- INSERTAMOS EL INSTAGRAM--------*/

        $sqlInstagram = $conexionBD->prepare("INSERT INTO `contacto`(`descripcion_contacto`, `rela_tipo_contacto_cont`, `rela_servicios_generales`) VALUES (?,?,?)");
        $sqlInstagram->execute(array($instagramAgencia, 5, $lastInsertIDAgencias));

        /*-------- INSERTAMOS EL TWITTER--------*/

        $sqlTwitter = $conexionBD->prepare("INSERT INTO `contacto`(`descripcion_contacto`, `rela_tipo_contacto_cont`, `rela_servicios_generales`) VALUES (?,?,?)");
        $sqlTwitter->execute(array($twitterAgencia, 6, $lastInsertIDAgencias));

        /*-------- INSERTAMOS EL SITIO WEB--------*/

        $sqlWeb = $conexionBD->prepare("INSERT INTO `contacto`(`descripcion_contacto`, `rela_tipo_contacto_cont`, `rela_servicios_generales`) VALUES (?,?,?)");
        $sqlWeb->execute(array($webAgencia, 7, $lastInsertIDAgencias));

        /*-------- INSERTAMOS OTRO--------*/

        $sqlOtro = $conexionBD->prepare("INSERT INTO `contacto`(`descripcion_contacto`, `rela_tipo_contacto_cont`, `rela_servicios_generales`) VALUES (?,?,?)");
        $sqlOtro->execute(array($otroAgencia, 8, $lastInsertIDAgencias));
    }

    public static function borrar($idServigeneralBorrar, $id_direccion)
    {
        $conexionBD = BD::crearInstancia();
        $sqlAgenciaBorrar = $conexionBD->prepare("DELETE FROM `servicios_generales` WHERE id_servicios_generales =?");
        $sqlAgenciaBorrar->execute(array($idServigeneralBorrar));

        $sqlDireccionBorrar = $conexionBD->prepare("DELETE FROM direccion WHERE id_direccion =?");
        $sqlDireccionBorrar->execute(array($id_direccion));
    }
    /*----------BUSCAR para ir imprimir en la seccion EDITAR----------*/
    public function buscar($id)
    {
        $conexionBD = BD::crearInstancia();
        $sql = $conexionBD->prepare("SELECT `id_servicios_generales`, `nombre_servicio_general`, `idoneo_servicio_general`,
        direccion.id_direccion,direccion.calle_direccion,
        localidad.nombre_localidad,localidad.id_localidad,
        departamentos_fsa.descripcion_departamentos,
        tipo_estacion.descripcion_estacion,tipo_estacion.id_tipo_estacion,
        tipo_de_servicio.descripcion_servicio,tipo_de_servicio.id_tipo_servicio,
        tipo_lugar.descripcion_lugar,tipo_lugar.id_tipo_lugar,
        `descripcion_servicio_general`,
        fecha_edit_general 
        FROM `servicios_generales`
        INNER JOIN direccion ON servicios_generales.rela_direccion = direccion.id_direccion
        INNER JOIN localidad on direccion.rela_localidad_direccion = localidad.id_localidad
        INNER JOIN departamentos_fsa on localidad.rela_departamento = departamentos_fsa.id_departamentos_fsa
        INNER JOIN tipo_estacion on tipo_estacion.id_tipo_estacion= servicios_generales.rela_estacion
        INNER JOIN tipo_de_servicio on tipo_de_servicio.id_tipo_servicio = servicios_generales.rela_tipo_servicio
        INNER JOIN tipo_lugar on tipo_lugar.id_tipo_lugar = servicios_generales.rela_tipo_lugar
        WHERE servicios_generales.id_servicios_generales = $id");

        $sql->execute();

        return $sql->fetch(PDO::FETCH_OBJ);
    }

    public static function editar(
        $nombre,
        $descripcion,
        $id,
        $idoneo,
        $localidad,
        $domicilio,
        $tipoServicioID,
        $tipoServicio,
        $estacionID,
        $estacion,
        $tipoServiGeneralID,
        $tipoServiGeneral,

        $telefonoAgencia,
        $telefonoFijoAgencia,
        $correoAgencia,
        $facebookAgencia,
        $instagramAgencia,
        $twitterAgencia,
        $webAgencia,
        $otroAgencia,

        $domicilioID,
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

        /*---------------SE ACTUALIZA EL SERVICIO GENERAL-------------------*/
        $sql = $conexionBD->prepare("UPDATE `servicios_generales` SET `nombre_servicio_general`='$nombre',`idoneo_servicio_general`='$idoneo',`rela_estacion`=$estacion,`rela_tipo_servicio`=$tipoServicio,`rela_tipo_lugar`=$tipoServiGeneral,`descripcion_servicio_general`='$descripcion', fecha_edit_general= CURRENT_TIMESTAMP() 
        WHERE servicios_generales.id_servicios_generales =  $id;");
        $sql->execute();

        /*---------------SE ACTUALIZA LA DIRECCION CON LA LOCALIDAD-------------------*/

        if ($localidad == 0) {
            $sqlDireccion = $conexionBD->prepare("UPDATE `direccion` SET `calle_direccion`='$domicilio'
                                                        WHERE id_direccion = $domicilioID ");
            $sqlDireccion->execute();
        } else {
            $sqlDireccion = $conexionBD->prepare("UPDATE `direccion` SET `calle_direccion`='$domicilio',
                                                        `rela_localidad_direccion`=$localidad 
                                                        WHERE id_direccion = $domicilioID ");
            $sqlDireccion->execute();
        }





        /*----------------SE ACTUALIZA EL CONTACTO telefono------------------*/

        $asociativo = array_combine($idtelefonoAgencia, $telefonoAgencia);



        foreach ($asociativo as $indice => $valor) {

            $sqlContacto = $conexionBD->prepare("UPDATE `contacto` SET `descripcion_contacto`='$valor'
                    WHERE id_contacto = $indice");
            $sqlContacto->execute();
            // print_r($sqlContacto);
        }




        /*----------------SE ACTUALIZA EL CONTACTO  telefono fijo------------------*/

        if ($telefonoFijoAgencia == "") {
            $telefonoFijoAgencia = "No se registró";

            $sqlFijo = $conexionBD->prepare("UPDATE `contacto` SET `descripcion_contacto`= '$telefonoFijoAgencia'
                                                    WHERE id_contacto = $idtelefonoFijoAgencia");
            $sqlFijo->execute();
        } else {
            $sqlFijo = $conexionBD->prepare("UPDATE `contacto` SET `descripcion_contacto`= $telefonoFijoAgencia
                                                    WHERE id_contacto = $idtelefonoFijoAgencia");
            $sqlFijo->execute();
        }



        /*----------------SE ACTUALIZA EL CONTACTO correo------------------*/

        $sqlCorreo = $conexionBD->prepare("UPDATE `contacto` SET `descripcion_contacto`='$correoAgencia'
                                                    WHERE id_contacto = $idcorreoAgencia");
        $sqlCorreo->execute();

        /*----------------SE ACTUALIZA EL CONTACTO facebook ------------------*/

        $sqlFacebook = $conexionBD->prepare("UPDATE `contacto` SET `descripcion_contacto`='$facebookAgencia'
                                                    WHERE id_contacto = $idfacebookAgencia");
        $sqlFacebook->execute();

        /*----------------SE ACTUALIZA EL CONTACTO Instagram ------------------*/

        $sqlInstagram = $conexionBD->prepare("UPDATE `contacto` SET `descripcion_contacto`='$instagramAgencia'
                                                    WHERE id_contacto = $idinstagramAgencia");
        $sqlInstagram->execute();

        /*----------------SE ACTUALIZA EL CONTACTO  twitter------------------*/

        $sqlTwitter = $conexionBD->prepare("UPDATE `contacto` SET `descripcion_contacto`='$twitterAgencia'
                                                    WHERE id_contacto = $idtwitterAgencia");
        $sqlTwitter->execute();

        /*----------------SE ACTUALIZA EL CONTACTO  sitio web------------------*/

        $sqlWeb = $conexionBD->prepare("UPDATE `contacto` SET `descripcion_contacto`='$webAgencia'
                                                    WHERE id_contacto = $idwebAgencia");
        $sqlWeb->execute();

        /*----------------SE ACTUALIZA EL CONTACTO otro------------------*/

        $sqlOtro = $conexionBD->prepare("UPDATE `contacto` SET `descripcion_contacto`='$otroAgencia'
                                                    WHERE id_contacto = $idotroAgencia ");
        $sqlOtro->execute();
    }

    public function buscarSelectLocalidad()
    {

        $conexionBD = BD::crearInstancia();


        $sqlLocalidad = $conexionBD->query("SELECT id_localidad, `nombre_localidad`, rela_provincia, rela_departamento
                                                       FROM localidad");

        $sqlLocalidad->execute();

        return $sqlLocalidad->fetchAll(PDO::FETCH_OBJ);
    }

    public function buscarSelectEstacion()
    {

        $conexionBD = BD::crearInstancia();


        $sqlLocalidad = $conexionBD->query("SELECT `id_tipo_estacion`, `descripcion_estacion` 
                                            FROM `tipo_estacion`");

        $sqlLocalidad->execute();

        return $sqlLocalidad->fetchAll(PDO::FETCH_OBJ);
    }
    public function buscarSelectLugar()
    {

        $conexionBD = BD::crearInstancia();


        $sqlLocalidad = $conexionBD->query("SELECT `id_tipo_lugar`, `descripcion_lugar` FROM `tipo_lugar`");

        $sqlLocalidad->execute();

        return $sqlLocalidad->fetchAll(PDO::FETCH_OBJ);
    }
    public function buscarSelectTipoServicio()
    {

        $conexionBD = BD::crearInstancia();


        $sqlLocalidad = $conexionBD->query("SELECT `id_tipo_servicio`, `descripcion_servicio` 
        FROM `tipo_de_servicio`");

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
                                            and contacto.rela_servicios_generales  = $id_agencia");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarTelefonosFijos($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto, contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 9
                                            and contacto.rela_servicios_generales  = $id_agencia");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarCorreo($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto, contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 1
                                            and contacto.rela_servicios_generales  = $id_agencia");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarFacebook($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto, contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 4
                                            and contacto.rela_servicios_generales  = $id_agencia");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarInstagram($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto, contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 5
                                            and contacto.rela_servicios_generales  = $id_agencia");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarTwitter($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto, contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 6
                                            and contacto.rela_servicios_generales  = $id_agencia");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarWeb($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto, contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 7
                                            and contacto.rela_servicios_generales  = $id_agencia");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarOtro($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto, contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 8
                                            and contacto.rela_servicios_generales  = $id_agencia");

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
                                            and contacto.rela_servicios_generales  = $id_agencia");

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
                                            and contacto.rela_servicios_generales  = $id_agencia");

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
                                            and contacto.rela_servicios_generales  = $id_agencia");

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
                                            and contacto.rela_servicios_generales  = $id_agencia");

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
                                            and contacto.rela_servicios_generales  = $id_agencia");

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
                                            and contacto.rela_servicios_generales  = $id_agencia");

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
                                            and contacto.rela_servicios_generales  = $id_agencia");

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
                                            and contacto.rela_servicios_generales  = $id_agencia");

        while ($filas = $consulta->fetch(PDO::FETCH_ASSOC)) {
            $this->otroAgencia[] = $filas;
        }
        return $this->otroAgencia;
    }
}
class estadistica
{


    public function cantidadPiletas()
    {

        $conexionBD = BD::crearInstancia();


        $sqlestadistica = $conexionBD->query("SELECT COUNT(servicios_generales.rela_tipo_lugar) conteo 
        FROM servicios_generales
        WHERE  servicios_generales.rela_tipo_lugar = 1");

        $sqlestadistica->execute();

        return $sqlestadistica->fetchAll(PDO::FETCH_OBJ);
    }

    public function cantidadPlayas()
    {

        $conexionBD = BD::crearInstancia();


        $sqlestadistica = $conexionBD->query("SELECT COUNT(servicios_generales.rela_tipo_lugar) conteo 
        FROM servicios_generales
        WHERE  servicios_generales.rela_tipo_lugar = 2");

        $sqlestadistica->execute();

        return $sqlestadistica->fetchAll(PDO::FETCH_OBJ);
    }
    public function cantidadCamping()
    {

        $conexionBD = BD::crearInstancia();


        $sqlestadistica = $conexionBD->query("SELECT COUNT(servicios_generales.rela_tipo_lugar) conteo 
        FROM servicios_generales
        WHERE  servicios_generales.rela_tipo_lugar = 3");

        $sqlestadistica->execute();

        return $sqlestadistica->fetchAll(PDO::FETCH_OBJ);
    }
    public function cantidadParqueAcuaticos()
    {

        $conexionBD = BD::crearInstancia();


        $sqlestadistica = $conexionBD->query("SELECT COUNT(servicios_generales.rela_tipo_lugar) conteo 
        FROM servicios_generales
        WHERE  servicios_generales.rela_tipo_lugar = 4");

        $sqlestadistica->execute();

        return $sqlestadistica->fetchAll(PDO::FETCH_OBJ);
    }
}
