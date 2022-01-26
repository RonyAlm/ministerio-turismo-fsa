<?php

class AgenciaModelo
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

        $sql = $conexionBD->query("SELECT `id_agencias`, `descripcion_agencias`, direccion.calle_direccion,
                                        (SELECT contacto.descripcion_contacto 
                                        FROM contacto 
                                        WHERE agencias.id_agencias = contacto.rela_contacto_agencia
                                        and contacto.rela_tipo_contacto_cont = 2
                                        LIMIT 1) descripcion_contacto  ,tipo_estado.descripcion_tipo_estado,
                                        localidad.nombre_localidad ,direccion.id_direccion,razon_social.id_razon_social
                                        FROM `agencias`
                                        INNER JOIN direccion ON agencias.rela_agencia_direccion = direccion.id_direccion
                                        INNER JOIN estado_actividad on estado_actividad.rela_estado_agencia = agencias.id_agencias
                                        INNER JOIN tipo_estado on tipo_estado.id_tipo_estado = estado_actividad.rela_tipo_estado
                                        INNER JOIN localidad on direccion.rela_localidad_direccion = localidad.id_localidad
                                        INNER JOIN razon_social on agencias.rela_razon_social_agencia = razon_social.id_razon_social");

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

    public function crear(
        $descripcion_agencias,
        $matricula_agencia,
        $legajo_agencia,
        $cuit_agencia,
        $categoria_agencia,
        $rela_localidad_direccion,
        $calle_direccion,
        $razonsocial,
        $telefonoAgencia,
        $telefonoFijoAgencia,
        $correoAgencia,
        $facebookAgencia,
        $instagramAgencia,
        $twitterAgencia,
        $webAgencia,
        $otroAgencia,
        $estadoAgencia,
        $idoneoAgencia
    ) {

        $conexionBD = BD::crearInstancia();

        /*-------- INSERTAMOS LA DIRECCION--------*/

        $sqlDireccion = $conexionBD->prepare("INSERT INTO direccion (calle_direccion,rela_localidad_direccion)
                                                    VALUES(?,?)");
        $sqlDireccion->execute(array($calle_direccion, $rela_localidad_direccion));

        $lastInsertIDdireccion = $conexionBD->lastInsertId();

        /*-------- INSERTAMOS LA RAZON SOCIAL--------*/

        $sqlRazonSocial = $conexionBD->prepare("INSERT INTO `razon_social`(`descripcion_razon_social`) 
                                                    VALUES (?)");
        $sqlRazonSocial->execute(array($razonsocial));

        $lastInsertIDRazonSocial = $conexionBD->lastInsertId();

        /*-------- INSERTAMOS LA AGENCIA--------*/

        $sql = $conexionBD->prepare("INSERT INTO agencias (descripcion_agencias,matricula_agencia,
                                                                legajo_agencia,cuit_agencia,categoria_agencia,
                                                                rela_agencia_direccion,rela_razon_social_agencia
                                                                ,idoneo_agencia) 
                                            VALUES (?,?,?,?,?,?,?,?)");
        $sql->execute(array(
            $descripcion_agencias, $matricula_agencia,
            $legajo_agencia, $cuit_agencia, $categoria_agencia, $lastInsertIDdireccion,
            $lastInsertIDRazonSocial, $idoneoAgencia
        ));

        $lastInsertIDAgencias = $conexionBD->lastInsertId();

        /*-------- INSERTAMOS EL TELEFONO CELULAR--------*/

        foreach ($telefonoAgencia as $telefonoAgencia1) {

            $sqlTelefono = $conexionBD->prepare("INSERT INTO `contacto`(`descripcion_contacto`,`rela_tipo_contacto_cont`,
                                                                            `rela_contacto_agencia`) 
                                                    VALUES (?,?,?)");
            $sqlTelefono->execute(array($telefonoAgencia1, 2, $lastInsertIDAgencias));
        }

        /*-------- INSERTAMOS EL TELEFONO FIJO--------*/

        $sqlFijo = $conexionBD->prepare("INSERT INTO `contacto`(`descripcion_contacto`,`rela_tipo_contacto_cont`,
                                                                            `rela_contacto_agencia`) 
                                                    VALUES (?,?,?)");
        $sqlFijo->execute(array($telefonoFijoAgencia, 9, $lastInsertIDAgencias));

        /*-------- INSERTAMOS EL CORREO-------*/

        $sqlCorreo = $conexionBD->prepare("INSERT INTO `contacto`(`descripcion_contacto`,`rela_tipo_contacto_cont`,
                                                                            `rela_contacto_agencia`) 
                                                    VALUES (?,?,?)");
        $sqlCorreo->execute(array($correoAgencia, 1, $lastInsertIDAgencias));

        /*-------- INSERTAMOS EL FACEBOOK--------*/

        $sqlFacebook = $conexionBD->prepare("INSERT INTO `contacto`(`descripcion_contacto`,`rela_tipo_contacto_cont`,
                                                                            `rela_contacto_agencia`) 
                                                    VALUES (?,?,?)");
        $sqlFacebook->execute(array($facebookAgencia, 4, $lastInsertIDAgencias));

        /*-------- INSERTAMOS EL INSTAGRAM--------*/

        $sqlInstagram = $conexionBD->prepare("INSERT INTO `contacto`(`descripcion_contacto`,`rela_tipo_contacto_cont`,
                                                                            `rela_contacto_agencia`) 
                                                    VALUES (?,?,?)");
        $sqlInstagram->execute(array($instagramAgencia, 5, $lastInsertIDAgencias));

        /*-------- INSERTAMOS EL TWITTER--------*/

        $sqlTwitter = $conexionBD->prepare("INSERT INTO `contacto`(`descripcion_contacto`,`rela_tipo_contacto_cont`,
                                                                            `rela_contacto_agencia`) 
                                                    VALUES (?,?,?)");
        $sqlTwitter->execute(array($twitterAgencia, 6, $lastInsertIDAgencias));

        /*-------- INSERTAMOS EL SITIO WEB--------*/

        $sqlWeb = $conexionBD->prepare("INSERT INTO `contacto`(`descripcion_contacto`,`rela_tipo_contacto_cont`,
                                                                            `rela_contacto_agencia`) 
                                                    VALUES (?,?,?)");
        $sqlWeb->execute(array($webAgencia, 7, $lastInsertIDAgencias));

        /*-------- INSERTAMOS OTRO--------*/

        $sqlOtro = $conexionBD->prepare("INSERT INTO `contacto`(`descripcion_contacto`,`rela_tipo_contacto_cont`,
                                                                            `rela_contacto_agencia`) 
                                                    VALUES (?,?,?)");
        $sqlOtro->execute(array($otroAgencia, 8, $lastInsertIDAgencias));

        /*-------- INSERTAMOS EL ESTADO--------*/

        $sqlEstado = $conexionBD->prepare("INSERT INTO `estado_actividad`(`rela_tipo_estado`, `rela_estado_agencia`) 
                                            VALUES (?,?)");
        $sqlEstado->execute(array($estadoAgencia, $lastInsertIDAgencias));
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
                                                    `legajo_agencia`, `cuit_agencia`, `categoria_agencia`, razon_social.descripcion_razon_social,
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

    public static function editar(
        $descripcion_agencias,
        $matricula_agencia,
        $legajo_agencia,
        $cuit_agencia,
        $categoria_agencia,
        $idAgencia,
        $idoneoAgencia,
        $rela_localidad_direccion,
        $calle_direccion,
        $razonsocial,
        $telefonoAgencia,
        $telefonoFijoAgencia,
        $correoAgencia,
        $facebookAgencia,
        $instagramAgencia,
        $twitterAgencia,
        $webAgencia,
        $otroAgencia,
        $estadoAgencia,

        $idRazonSocial,
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

        /*---------------SE ACTUALIZA LA AGENCIA-------------------*/
        $sql = $conexionBD->prepare("UPDATE `agencias` SET `descripcion_agencias` = '$descripcion_agencias',
                                                    idoneo_agencia = '$idoneoAgencia', matricula_agencia ='$matricula_agencia',
                                                    legajo_agencia = '$legajo_agencia', cuit_agencia= '$cuit_agencia',
                                                    categoria_agencia= '$categoria_agencia'
                                            WHERE `agencias`.`id_agencias` = $idAgencia;");
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

        /*----------------SE ACTUALIZA LA RAZON SOCIAL------------------*/

        $sqlRazonSocial = $conexionBD->prepare("UPDATE `razon_social` SET `descripcion_razon_social`='$razonsocial' 
                                                    WHERE id_razon_social = $idRazonSocial");
        $sqlRazonSocial->execute();

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
