<?php

class PrestadoresModelo
{


    public $listaPrestadores;
    public $serviciosprestadores;

    public function __construct()
    {
        $this->listaPrestadores = array();
        $this->serviciosprestadores = array();
    }

    public function trigger($accion, $id, $controlador1)
    {
        $conexionBD = BD::crearInstancia();

        BD::iniciarTransaccion();

        try {
            $triggerName = $accion . $controlador1;
            $tableName = 'prestadores';

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

        $sql = $conexionBD->query(" SELECT `id_prestador`, `descripcion_prestador`, `institucion_prestador`, fecha_edit_prestador, direccion.calle_direccion,
        localidad.nombre_localidad,tipo_estado.descripcion_tipo_estado,direccion.id_direccion,
         (SELECT contacto.descripcion_contacto 
         FROM contacto 
         WHERE prestadores.id_prestador = contacto.rela_prestador_contacto
         and contacto.rela_tipo_contacto_cont = 2
         LIMIT 1) descripcion_contacto,tsp.descrip_tipo_serv_prestadores
         FROM `prestadores` 
         INNER JOIN direccion ON prestadores.rela_prestador_direccion = direccion.id_direccion
         INNER JOIN localidad on direccion.rela_localidad_direccion = localidad.id_localidad
         INNER JOIN estado_actividad on estado_actividad.rela_estado_prestador = prestadores.id_prestador
         INNER JOIN tipo_estado on tipo_estado.id_tipo_estado = estado_actividad.rela_tipo_estado 
         INNER JOIN servicios_prestadores sp on sp.rela_servicios_prestadores = prestadores.id_prestador
         INNER JOIN tipo_servicios_prestadores tsp on tsp.id_tipo_servicios_prestadores = sp.rela_tipo_servicios_presta
         GROUP by sp.rela_servicios_prestadores;");

        while ($filas = $sql->fetch(PDO::FETCH_ASSOC)) {
            $this->listaPrestadores[] = $filas;
        }
        return $this->listaPrestadores;
    }
    public function consultarContacto()
    {
        $conexionBD = BD::crearInstancia();

        $sql = $conexionBD->query(" SELECT contacto.descripcion_contacto 
                                        FROM contacto
                                        INNER JOIN prestadores on prestadores.id_prestador = contacto.rela_prestador_contacto
                                        WHERE contacto.rela_tipo_contacto_cont = 2
                                        OR contacto.rela_tipo_contacto_cont = 9");

        while ($filas = $sql->fetch(PDO::FETCH_ASSOC)) {
            $this->listaPrestadores[] = $filas;
        }
        return $this->listaPrestadores;
    }

    //BUSCA LA LOCALIDAD PARA MOSTRAR EN EL SELECT EN LA PESTAÑA CREAR
    public function buscarSelectLocalidad()
    {

        $conexionBD = BD::crearInstancia();


        $sqlLocalidad = $conexionBD->query("SELECT id_localidad, `nombre_localidad`, rela_provincia, rela_departamento
                                                   FROM localidad");

        $sqlLocalidad->execute();

        return $sqlLocalidad->fetchAll(PDO::FETCH_OBJ);
    }

    //BUSCA EL ESTADOR PARA MOSTRAR EN EL SELECT EN LA PESTAÑA CREAR
    public function buscarSelectEstado()
    {

        $conexionBD = BD::crearInstancia();


        $sqlLocalidad = $conexionBD->query("SELECT `id_tipo_estado`, `descripcion_tipo_estado` 
                                                   FROM `tipo_estado`");

        $sqlLocalidad->execute();

        return $sqlLocalidad->fetchAll(PDO::FETCH_OBJ);
    }

    //BUSCA LA CATEGORIA PARA MOSTRAR EN EL SELECT EN LA PESTAÑA CREAR
    public function buscarSelectCategoria()
    {

        $conexionBD = BD::crearInstancia();


        $sqlLocalidad = $conexionBD->query("SELECT `id_tipo_prestador`, `descripcion_tipo_prestador` 
                                                   FROM `tipo_prestador`");

        $sqlLocalidad->execute();

        return $sqlLocalidad->fetchAll(PDO::FETCH_OBJ);
    }

    //BUSCA EL SERVICIO PARA MOSTRAR EN EL SELECT EN LA PESTAÑA CREAR
    public function buscarSelectServicio()
    {

        $conexionBD = BD::crearInstancia();


        $sqlLocalidad = $conexionBD->query("SELECT `id_tipo_servicios_prestadores`, `descrip_tipo_serv_prestadores` 
                                                   FROM `tipo_servicios_prestadores`");

        $sqlLocalidad->execute();

        return $sqlLocalidad->fetchAll(PDO::FETCH_OBJ);
    }

    public static function buscarSelectServicio2($id_prestador)
    {

        $conexionBD = BD::crearInstancia();


        $sqlLocalidad = $conexionBD->query("SELECT `id_servicios_prestadores`, tipo_servicios_prestadores.descrip_tipo_serv_prestadores,
                                                        `otros_servicios_prestadores`,tipo_servicios_prestadores.id_tipo_servicios_prestadores
                                                FROM `servicios_prestadores`
                                                INNER JOIN tipo_servicios_prestadores on tipo_servicios_prestadores.id_tipo_servicios_prestadores = servicios_prestadores.rela_tipo_servicios_presta
                                                WHERE `rela_servicios_prestadores` = $id_prestador");

        $sqlLocalidad->execute();


        return $sqlLocalidad->fetchAll(PDO::FETCH_OBJ);
    }


    public static function crear(
        $categoriaPrestador,
        $nombrePrestador,
        $dniPrestador,
        $institucionPrestador,
        $cuitPrestador,
        $localidadPrestador,
        $domicilioPrestador,
        $estadoPrestador,
        $telefonoPrestador,
        $telefonoFijoPrestador,
        $correoPrestador,
        $facebookPrestador,
        $instagramPrestador,
        $twitterPrestador,
        $webPrestador,
        $otroPrestador,
        $serviciosPrestador,
        $otroserviciosPrestador
    ) {

        $conexionBD = BD::crearInstancia();

        /*-------- INSERTAMOS LA DIRECCION--------*/

        $sqlDireccion = $conexionBD->prepare("INSERT INTO direccion (calle_direccion,rela_localidad_direccion)
                                                    VALUES(?,?)");
        $sqlDireccion->execute(array($domicilioPrestador, $localidadPrestador));

        $lastInsertIDdireccion = $conexionBD->lastInsertId();

        /*-------- INSERTAMOS LOS PRESTADORES--------*/

        $sqlPrestador = $conexionBD->prepare("INSERT INTO `prestadores`(`descripcion_prestador`,`cuit_prestador`,
                                                                             `dni_prestador`, `institucion_prestador`,
                                                                               `rela_prestador_direccion`,`rela_tipo_prestador`, fecha_edit_prestador)
                                            VALUES (?,?,?,?,?,?,CURRENT_TIMESTAMP())");
        $sqlPrestador->execute(array(
            $nombrePrestador, $cuitPrestador,
            $dniPrestador, $institucionPrestador,
            $lastInsertIDdireccion, $categoriaPrestador
        ));

        $lastInsertIDPrestador = $conexionBD->lastInsertId();

        /*-------- INSERTAMOS LOS SERVICIOS--------*/
        foreach ($serviciosPrestador as $serviciosVarios) {
            $sqlServicios = $conexionBD->prepare("INSERT INTO `servicios_prestadores`(rela_tipo_servicios_presta, otros_servicios_prestadores,
                                                                             `rela_servicios_prestadores`)
                                            VALUES (?,?,?)");
            $sqlServicios->execute(array(
                $serviciosVarios, $otroserviciosPrestador,
                $lastInsertIDPrestador
            ));

            $lastInsertIDServicios = $conexionBD->lastInsertId();
        }


        /*-------- INSERTAMOS EL ESTADO--------*/

        $sqlEstado = $conexionBD->prepare("INSERT INTO `estado_actividad`(`rela_tipo_estado`, rela_estado_prestador) 
                                            VALUES (?,?)");
        $sqlEstado->execute(array($estadoPrestador, $lastInsertIDPrestador));

        /*-------- INSERTAMOS EL TELEFONO CELULAR--------*/

        foreach ($telefonoPrestador as $serviciosVarios) {

            $sqlTelefono = $conexionBD->prepare("INSERT INTO `contacto`(`descripcion_contacto`,rela_tipo_contacto_cont,
                                                            `rela_prestador_contacto`) 
                                                VALUES (?,?,?)");
            $sqlTelefono->execute(array($serviciosVarios, 2, $lastInsertIDPrestador));
        }

        /*-------- INSERTAMOS EL TELEFONO FIJO--------*/

        $sqlFijo = $conexionBD->prepare("INSERT INTO `contacto`(`descripcion_contacto`,rela_tipo_contacto_cont,
                                                        `rela_prestador_contacto`) 
                                            VALUES (?,?,?)");
        $sqlFijo->execute(array($telefonoFijoPrestador, 9, $lastInsertIDPrestador));

        /*-------- INSERTAMOS EL CORREO-------*/

        $sqlCorreo = $conexionBD->prepare("INSERT INTO `contacto`(`descripcion_contacto`,rela_tipo_contacto_cont,
                                                        `rela_prestador_contacto`) 
                                            VALUES (?,?,?)");
        $sqlCorreo->execute(array($correoPrestador, 1, $lastInsertIDPrestador));

        /*-------- INSERTAMOS EL FACEBOOK--------*/

        $sqlFacebook = $conexionBD->prepare("INSERT INTO `contacto`(`descripcion_contacto`,rela_tipo_contacto_cont,
                                                        `rela_prestador_contacto`) 
                                            VALUES (?,?,?)");
        $sqlFacebook->execute(array($facebookPrestador, 4, $lastInsertIDPrestador));

        /*-------- INSERTAMOS EL INSTAGRAM--------*/

        $sqlInstagram = $conexionBD->prepare("INSERT INTO `contacto`(`descripcion_contacto`,rela_tipo_contacto_cont,
                                                        `rela_prestador_contacto`) 
                                            VALUES (?,?,?)");
        $sqlInstagram->execute(array($instagramPrestador, 5, $lastInsertIDPrestador));

        /*-------- INSERTAMOS EL TWITTER--------*/

        $sqlTwitter = $conexionBD->prepare("INSERT INTO `contacto`(`descripcion_contacto`,rela_tipo_contacto_cont,
                                                        `rela_prestador_contacto`) 
                                            VALUES (?,?,?)");
        $sqlTwitter->execute(array($twitterPrestador, 6, $lastInsertIDPrestador));

        /*-------- INSERTAMOS EL SITIO WEB--------*/

        $sqlWeb = $conexionBD->prepare("INSERT INTO `contacto`(`descripcion_contacto`,rela_tipo_contacto_cont,
                                                        `rela_prestador_contacto`) 
                                            VALUES (?,?,?)");
        $sqlWeb->execute(array($webPrestador, 7, $lastInsertIDPrestador));

        /*-------- INSERTAMOS OTRO--------*/

        $sqlOtro = $conexionBD->prepare("INSERT INTO `contacto`(`descripcion_contacto`,rela_tipo_contacto_cont,
                                                        `rela_prestador_contacto`) 
                                            VALUES (?,?,?)");
        $sqlOtro->execute(array($otroPrestador, 8, $lastInsertIDPrestador));
    }


    public function buscarInsertar($id_Prestador)
    {
        $conexionBD = BD::crearInstancia();

        $sql = $conexionBD->query("SELECT `id_prestador`, `descripcion_prestador`, `cuit_prestador`,
            `dni_prestador`, `institucion_prestador`, `rela_razon_social_prestador`, fecha_edit_prestador,
            `rela_persona_prestrador`,
            direccion.id_direccion,direccion.calle_direccion,
            estado_actividad.id_estado,tipo_estado.descripcion_tipo_estado,estado_actividad.rela_tipo_estado,
            localidad.id_localidad,localidad.nombre_localidad,
            servicios_prestadores.id_servicios_prestadores,servicios_prestadores.otros_servicios_prestadores,
            tipo_servicios_prestadores.id_tipo_servicios_prestadores, tipo_servicios_prestadores.descrip_tipo_serv_prestadores,
            tipo_prestador.id_tipo_prestador, tipo_prestador.descripcion_tipo_prestador,departamentos_fsa.descripcion_departamentos
            FROM `prestadores`
            INNER JOIN direccion ON prestadores.rela_prestador_direccion = direccion.id_direccion
            INNER JOIN localidad on localidad.id_localidad = direccion.rela_localidad_direccion
            INNER JOIN estado_actividad on estado_actividad.rela_estado_prestador = prestadores.id_prestador 
            INNER JOIN tipo_estado on tipo_estado.id_tipo_estado = estado_actividad.rela_tipo_estado
            INNER JOIN departamentos_fsa on localidad.rela_departamento = departamentos_fsa.id_departamentos_fsa
            INNER JOIN servicios_prestadores on servicios_prestadores.rela_servicios_prestadores = prestadores.id_prestador
            INNER JOIN tipo_servicios_prestadores on servicios_prestadores.rela_tipo_servicios_presta = tipo_servicios_prestadores.id_tipo_servicios_prestadores
            INNER JOIN tipo_prestador on tipo_prestador.id_tipo_prestador = prestadores.rela_tipo_prestador            
            WHERE prestadores.id_prestador = $id_Prestador");


        $sql->execute();

        return $sql->fetch(PDO::FETCH_OBJ);
    }

    public static function borrar($id_Prestador, $id_direccion)
    {
        $conexionBD = BD::crearInstancia();

        $sql = $conexionBD->prepare("DELETE FROM `prestadores` WHERE id_prestador =?");
        $sql->execute(array($id_Prestador));

        $sqlDireccionBorrar = $conexionBD->prepare("DELETE FROM direccion WHERE id_direccion =?");
        $sqlDireccionBorrar->execute(array($id_direccion));
    }

    public static function editar(
        $categoriaPrestador,
        $IDnombre,
        $nombrePrestador,
        $dniPrestador,
        $institucionPrestador,
        $cuitPrestador,
        $localidadPrestador,
        $IDdomicilio,
        $domicilioPrestador,
        $IDestado,
        $estadoPrestador,
        $telefonoPrestador,
        $telefonoFijoPrestador,
        $correoPrestador,
        $facebookPrestador,
        $instagramPrestador,
        $twitterPrestador,
        $webPrestador,
        $otroPrestador,
        $serviciosPrestador,
        $otroserviciosPrestador,
        $IDcelular,
        $IDfijo,
        $IDcorreo,
        $IDfacebook,
        $IDinstagram,
        $IDtwitter,
        $IDsitio,
        $IDotro
    ) {

        $conexionBD = BD::crearInstancia();

        /*-------- se actualiza el prestador*/

        if ($categoriaPrestador == 0) {
            echo "rubro igual a 0        /// ";
            $sql = $conexionBD->prepare("UPDATE `prestadores` SET `descripcion_prestador`='$nombrePrestador',
                                                                        `cuit_prestador`='$cuitPrestador',`dni_prestador`=$dniPrestador,
                                                                        `institucion_prestador`='$institucionPrestador',
                                                                        fecha_edit_prestador= CURRENT_TIMESTAMP()
                                                                        
                                            WHERE id_prestador=$IDnombre");

            $sql->execute();
        } else {
            echo "rubro igual conectado   ///        ";
            $sql = $conexionBD->prepare("UPDATE `prestadores` SET `descripcion_prestador`='$nombrePrestador',
                                                                            `cuit_prestador`='$cuitPrestador',`dni_prestador`=$dniPrestador,
                                                                            `institucion_prestador`='$institucionPrestador',`rela_tipo_prestador`=$categoriaPrestador,
                                                                            fecha_edit_prestador= CURRENT_TIMESTAMP()
                    
                                                WHERE id_prestador=$IDnombre");

            $sql->execute();
        }

        /*---------------SE ACTUALIZA LA DIRECCION CON LA LOCALIDAD------------------*/

        if ($localidadPrestador == 0) {
            $sqlDireccion = $conexionBD->prepare("UPDATE `direccion` SET `calle_direccion`='$domicilioPrestador'
                                                        WHERE id_direccion = $IDdomicilio ");
            echo "no se actualiza la localidad cuando es null  ///  ";
            $sqlDireccion->execute();
        } else {
            $sqlDireccion = $conexionBD->prepare("UPDATE `direccion` SET `calle_direccion`='$domicilioPrestador',
                                                        `rela_localidad_direccion`=$localidadPrestador 
                                                        WHERE id_direccion = $IDdomicilio ");
            echo "se actualiza la localidad /// ";
            $sqlDireccion->execute();
        }

        /*----------------SE ACTUALIZA EL ESTADO------------------*/

        if ($estadoPrestador == 0) {
            echo "no se actualiza el estado cuando es null /// ";
        } else {
            $sqlEstado = $conexionBD->prepare("UPDATE `estado_actividad` SET `rela_tipo_estado`=$estadoPrestador
                                                        WHERE id_estado = $IDestado");
            echo "se actualiza el estado   ///";
            $sqlEstado->execute();
        }
        /*----------------SE ACTUALIZA EL CONTACTO telefono------------------*/

        $asociativo = array_combine($IDcelular, $telefonoPrestador);

        foreach ($asociativo as $indice => $valor) {

            $sqlContacto = $conexionBD->prepare("UPDATE `contacto` SET `descripcion_contacto`='$valor'
                WHERE id_contacto = $indice");
            $sqlContacto->execute();
            // print_r($sqlContacto);
        }






        /*----------------SE ACTUALIZA EL CONTACTO  telefono fijo------------------*/

        if ($telefonoFijoPrestador == "") {
            $telefonoFijoPrestador = "No se registró";

            $sqlFijo = $conexionBD->prepare("UPDATE `contacto` SET `descripcion_contacto`= '$telefonoFijoPrestador'
                                                    WHERE id_contacto = $IDfijo");
            $sqlFijo->execute();
        } else {
            $sqlFijo = $conexionBD->prepare("UPDATE `contacto` SET `descripcion_contacto`= $telefonoFijoPrestador
                                                    WHERE id_contacto = $IDfijo");
            $sqlFijo->execute();
        }




        /*----------------SE ACTUALIZA EL CONTACTO correo------------------*/

        $sqlCorreo = $conexionBD->prepare("UPDATE `contacto` SET `descripcion_contacto`='$correoPrestador'
                                                    WHERE id_contacto = $IDcorreo");
        $sqlCorreo->execute();

        /*----------------SE ACTUALIZA EL CONTACTO facebook ------------------*/

        $sqlFacebook = $conexionBD->prepare("UPDATE `contacto` SET `descripcion_contacto`='$facebookPrestador'
                                                    WHERE id_contacto = $IDfacebook");
        $sqlFacebook->execute();

        /*----------------SE ACTUALIZA EL CONTACTO Instagram ------------------*/

        $sqlInstagram = $conexionBD->prepare("UPDATE `contacto` SET `descripcion_contacto`='$instagramPrestador'
                                                    WHERE id_contacto = $IDinstagram");
        $sqlInstagram->execute();

        /*----------------SE ACTUALIZA EL CONTACTO  twitter------------------*/

        $sqlTwitter = $conexionBD->prepare("UPDATE `contacto` SET `descripcion_contacto`='$twitterPrestador'
                                                    WHERE id_contacto = $IDtwitter");
        $sqlTwitter->execute();

        /*----------------SE ACTUALIZA EL CONTACTO  sitio web------------------*/

        $sqlWeb = $conexionBD->prepare("UPDATE `contacto` SET `descripcion_contacto`='$webPrestador'
                                                    WHERE id_contacto = $IDsitio");
        $sqlWeb->execute();

        /*----------------SE ACTUALIZA EL CONTACTO otro------------------*/

        $sqlOtro = $conexionBD->prepare("UPDATE `contacto` SET `descripcion_contacto`='$otroPrestador'
                                                    WHERE id_contacto = $IDotro ");
        $sqlOtro->execute();

        /*---------------SE ACTUALIZA LOS SERVICIOS------------------*/

        /*-------- INSERTAMOS LOS SERVICIOS--------*/
        $hola = PrestadoresModelo::buscarSelectServicio2($IDnombre);

        $id = [];
        foreach ($hola as $k) {
            $id[] = $k->id_tipo_servicios_prestadores;
            // print_r($id);
            //echo "se muestran los id que creamos";
        };
        foreach ($serviciosPrestador as $serviciosVarios) {

            if (!in_array($serviciosVarios, $id)) {
                $sqlServicios = $conexionBD->prepare("INSERT INTO `servicios_prestadores`(rela_tipo_servicios_presta, otros_servicios_prestadores,
                        `rela_servicios_prestadores`)
                                                            VALUES (?,?,?)");
                $sqlServicios->execute(array($serviciosVarios, $otroserviciosPrestador, $IDnombre));
            }
        }

        foreach ($id as $serviciosVarios) {

            if (!in_array($serviciosVarios, $serviciosPrestador)) {

                // print_r($serviciosVarios);
                $sqlServicios = $conexionBD->prepare("DELETE FROM `servicios_prestadores` 
                                                            WHERE rela_tipo_servicios_presta = ? and rela_servicios_prestadores = ?");
                $sqlServicios->execute(array($serviciosVarios, $IDnombre));
            }
        }
    }

    public function serviciosprestadores($id_prestador)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query("SELECT tipo_servicios_prestadores.descrip_tipo_serv_prestadores, `otros_servicios_prestadores`, `rela_servicios_prestadores` 
        FROM `servicios_prestadores` 
        INNER JOIN tipo_servicios_prestadores on tipo_servicios_prestadores.id_tipo_servicios_prestadores = servicios_prestadores.rela_tipo_servicios_presta
        WHERE servicios_prestadores.rela_servicios_prestadores = $id_prestador");

        while ($filas = $consulta->fetch(PDO::FETCH_ASSOC)) {
            $this->serviciosprestadores[] = $filas;
        }
        return $this->serviciosprestadores;
    }
}

class ContactosPrestadores
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

    public function consultarTelefonos($id_Prestador)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto, contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 2
                                            and contacto.rela_prestador_contacto = $id_Prestador");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarTelefonosFijos($id_Prestador)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto, contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 9
                                            and contacto.rela_prestador_contacto = $id_Prestador");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarCorreo($id_Prestador)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto, contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 1
                                            and contacto.rela_prestador_contacto = $id_Prestador");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarFacebook($id_Prestador)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto, contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 4
                                            and contacto.rela_prestador_contacto = $id_Prestador");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarInstagram($id_Prestador)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto, contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 5
                                            and contacto.rela_prestador_contacto = $id_Prestador");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarTwitter($id_Prestador)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto, contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 6
                                            and contacto.rela_prestador_contacto = $id_Prestador");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarWeb($id_Prestador)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto, contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 7
                                            and contacto.rela_prestador_contacto = $id_Prestador");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarOtro($id_Prestador)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto, contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 8
                                            and contacto.rela_prestador_contacto = $id_Prestador");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }
}

class ContactosInfo
{
    public $telefonoprestadorInfo;
    public $telefonoFijoprestador;
    public $correoprestador;
    public $facebookprestador;
    public $instagramprestador;
    public $twitterprestador;
    public $webprestador;
    public $otroprestador;

    private $BD;


    public function __construct()
    {
        require_once("conexion.php");
        $this->BD = BD::crearInstancia();

        $this->telefonoprestadorInfo = array();
        $this->telefonoFijoprestador = array();
        $this->correoprestador = array();
        $this->facebookprestador = array();
        $this->instagramprestador = array();
        $this->twitterprestador = array();
        $this->webprestador = array();
        $this->otroprestador = array();
    }

    public function consultarTelefonos($id_prestador)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto,contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 2
                                            and contacto.rela_prestador_contacto = $id_prestador");

        while ($filas = $consulta->fetch(PDO::FETCH_ASSOC)) {
            $this->telefonoprestadorInfo[] = $filas;
        }
        return $this->telefonoprestadorInfo;
    }

    public function consultarTelefonosFijos($id_prestador)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 9
                                            and contacto.rela_prestador_contacto = $id_prestador");

        while ($filas = $consulta->fetch(PDO::FETCH_ASSOC)) {
            $this->telefonoFijoprestador[] = $filas;
        }
        return $this->telefonoFijoprestador;
    }

    public function consultarCorreo($id_prestador)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 1
                                            and contacto.rela_prestador_contacto = $id_prestador");

        while ($filas = $consulta->fetch(PDO::FETCH_ASSOC)) {
            $this->correoprestador[] = $filas;
        }
        return $this->correoprestador;
    }

    public function consultarFacebook($id_prestador)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 4
                                            and contacto.rela_prestador_contacto = $id_prestador");

        while ($filas = $consulta->fetch(PDO::FETCH_ASSOC)) {
            $this->facebookprestador[] = $filas;
        }
        return $this->facebookprestador;
    }

    public function consultarInstagram($id_prestador)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 5
                                            and contacto.rela_prestador_contacto = $id_prestador");

        while ($filas = $consulta->fetch(PDO::FETCH_ASSOC)) {
            $this->instagramprestador[] = $filas;
        }
        return $this->instagramprestador;
    }

    public function consultarTwitter($id_prestador)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 6
                                            and contacto.rela_prestador_contacto = $id_prestador");

        while ($filas = $consulta->fetch(PDO::FETCH_ASSOC)) {
            $this->twitterprestador[] = $filas;
        }
        return $this->twitterprestador;
    }

    public function consultarWeb($id_prestador)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 7
                                            and contacto.rela_prestador_contacto = $id_prestador");

        while ($filas = $consulta->fetch(PDO::FETCH_ASSOC)) {
            $this->webprestador[] = $filas;
        }
        return $this->webprestador;
    }

    public function consultarOtro($id_prestador)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 8
                                            and contacto.rela_prestador_contacto = $id_prestador");

        while ($filas = $consulta->fetch(PDO::FETCH_ASSOC)) {
            $this->otroprestador[] = $filas;
        }
        return $this->otroprestador;
    }
}

class estadistica
{


    public function cantidadPrestadores()
    {

        $conexionBD = BD::crearInstancia();


        $sqlestadistica = $conexionBD->query("SELECT COUNT(*) conteo 
                                                FROM `prestadores` 
                                                WHERE prestadores.rela_tipo_prestador = 1");

        $sqlestadistica->execute();

        return $sqlestadistica->fetchAll(PDO::FETCH_OBJ);
    }

    public function cantidadGuias()
    {

        $conexionBD = BD::crearInstancia();


        $sqlestadistica = $conexionBD->query("SELECT COUNT(*) conteo 
                                                FROM `prestadores` 
                                                WHERE prestadores.rela_tipo_prestador = 2");

        $sqlestadistica->execute();

        return $sqlestadistica->fetchAll(PDO::FETCH_OBJ);
    }

    public function cantidadOperadores()
    {

        $conexionBD = BD::crearInstancia();


        $sqlestadistica = $conexionBD->query("SELECT COUNT(*) conteo 
                                                FROM `prestadores` 
                                                WHERE prestadores.rela_tipo_prestador = 3");

        $sqlestadistica->execute();

        return $sqlestadistica->fetchAll(PDO::FETCH_OBJ);
    }

    public function cantidadTotal()
    {

        $conexionBD = BD::crearInstancia();


        $sqlestadistica = $conexionBD->query("SELECT COUNT(*) conteo FROM `prestadores`");

        $sqlestadistica->execute();

        return $sqlestadistica->fetchAll(PDO::FETCH_OBJ);
    }

    public function cantidadHospedaje()
    {

        $conexionBD = BD::crearInstancia();


        $sqlestadistica = $conexionBD->query("SELECT COUNT(*) conteo 
                                                        FROM `alojamientos` 
                                                        WHERE alojamientos.rela_tipo_alojamiento_aloja = 5");

        $sqlestadistica->execute();

        return $sqlestadistica->fetchAll(PDO::FETCH_OBJ);
    }

    public function cantidadHospedajePlazas()
    {

        $conexionBD = BD::crearInstancia();


        $sqlestadistica = $conexionBD->query("SELECT SUM(servicios_alojamiento.cantidad_plazas) conteo 
                                                        FROM servicios_alojamiento
                                                        INNER JOIN alojamientos ON servicios_alojamiento.id_servicio_alojamiento = alojamientos.rela_aloja_servicios
                                                        WHERE alojamientos.rela_tipo_alojamiento_aloja = 5");

        $sqlestadistica->execute();

        return $sqlestadistica->fetchAll(PDO::FETCH_OBJ);
    }

    public function cantidadTotalAlojamiento()
    {

        $conexionBD = BD::crearInstancia();

        $sqlestadistica = $conexionBD->query("SELECT COUNT(*) conteo 
                                                        FROM `alojamientos`");

        $sqlestadistica->execute();

        return $sqlestadistica->fetchAll(PDO::FETCH_OBJ);
    }

    public function cantidadAlojamientoPlazas()
    {

        $conexionBD = BD::crearInstancia();


        $sqlestadistica = $conexionBD->query("SELECT SUM(servicios_alojamiento.cantidad_plazas) conteo 
                                                    FROM servicios_alojamiento
                                                    INNER JOIN alojamientos ON servicios_alojamiento.id_servicio_alojamiento = alojamientos.rela_aloja_servicios
                                                    ");

        $sqlestadistica->execute();

        return $sqlestadistica->fetchAll(PDO::FETCH_OBJ);
    }
}
