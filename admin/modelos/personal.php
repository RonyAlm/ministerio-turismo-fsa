<?php
class PersonalModelo
{

    public $listaPersonal;
    public $listaPersonal3;
    public $listaPersonalID;
    public $listaBuscar;


    public function __construct()
    {
        $this->listaPersonal = array();
        $this->listaPersonal3 = array();
        $this->listaPersonalID = array();
        $this->listaBuscar = array();
    }

    public function consultar()
    {

        $conexionBD = BD::crearInstancia();

        $sql = $conexionBD->query("SELECT `id_deptos_mintur`, dpm.descriDepartamento as descrDepto,
        per.id_persona,
        CONCAT(per.nombre_persona, ' ', per.apellido_persona) full_name,
        tp.id_tipo_personal, tp.descri_tipo_personal as descrTP
        FROM `deptos_mintur` dpm
        INNER JOIN personales p on p.rela_depto_mintur = dpm.id_deptos_mintur
        INNER JOIN persona per on per.id_persona = p.rela_persona
        INNER JOIN tipo_personal tp on tp.id_tipo_personal = p.rela_tipo_personal
        WHERE p.rela_tipo_personal = 2 OR p.rela_tipo_personal = 4
        and p.rela_area = 7");

        //recuperamos los datos y los retornamos

        while ($filas = $sql->fetch(PDO::FETCH_ASSOC)) {
            $this->listaPersonal[] = $filas;
        }
        return $this->listaPersonal; //este return se va a llamar en el controlador_alojamiento.php clase inicio

    }

    public function info3($id)
    {

        $conexionBD = BD::crearInstancia();

        $sql = $conexionBD->query("SELECT `id_personal`, `rela_area`,a.descriArea,a.id_areas,
        tep.id_tipo_estado_personal, tep.descripcion as tipoestado,
        pe.id_persona,CONCAT(pe.nombre_persona, ' ', pe.apellido_persona) full_name
        FROM `personales` p
        INNER JOIN areas a on a.id_areas = p.rela_area
        INNER JOIN tipo_estado_personal tep on tep.id_tipo_estado_personal = p.rela_tipo_estado
        INNER JOIN persona pe on pe.id_persona = p.rela_persona
        WHERE p.rela_depto_mintur = $id
        ORDER by rela_area");

        //recuperamos los datos y los retornamos

        while ($filas = $sql->fetch(PDO::FETCH_ASSOC)) {
            $this->listaPersonal3[] = $filas;
        }
        return $this->listaPersonal3; //este return se va a llamar en el controlador_alojamiento.php clase inicio

    }
    public function info2($id)
    {

        $conexionBD = BD::crearInstancia();

        $sql = $conexionBD->query("SELECT * FROM areas a
        INNER JOIN personales p on p.rela_area = a.id_areas
        WHERE p.rela_depto_mintur = $id
        GROUP BY a.descriArea");

        //recuperamos los datos y los retornamos

        while ($filas = $sql->fetch(PDO::FETCH_ASSOC)) {
            $this->listaPersonal[] = $filas;
        }
        return $this->listaPersonal; //este return se va a llamar en el controlador_alojamiento.php clase inicio

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

    public function guardar(
        $nombre,
        $apellido,
        $cuil,
        $profesion,
        $fecha,
        $educacion,
        $rela_localidad_direccion,
        $calle_direccion,
        $telefonoCel,
        $telefonoFijo,
        $correo,
        $departamento,
        $area,
        $n_legajo,
        $n_expediente,
        $tipo_contrato,
        $cargo,
        $usuario,
        $contraseña,
        $antiguedad,
        $fechaini,
        $fechafin,
        $diasrestante
    ) {

        $conexionBD = BD::crearInstancia();

        /*-------- INSERTAMOS LA DIRECCION--------*/

        $sqlDireccion = $conexionBD->prepare("INSERT INTO direccion (calle_direccion,rela_localidad_direccion)
                                                    VALUES(?,?)");
        $sqlDireccion->execute(array($calle_direccion, $rela_localidad_direccion));

        $lastInsertIDdireccion = $conexionBD->lastInsertId();

        /*-------- INSERTAMOS EL USUARIO Y LA CONTRASEÑA--------*/

        $sqlusuario = $conexionBD->prepare("INSERT INTO `usuario_contra`(`usuario`,
                                                 `contraseña`, `rela_rol_id`)
                                            VALUES (?,?,?)");
        $sqlusuario->execute(array(
            $usuario, $contraseña,
            2
        ));

        $lastInsertusuariocontraseña = $conexionBD->lastInsertId();


        /*-------- INSERTAMOS LA PERSONA--------*/

        $sql = $conexionBD->prepare("INSERT INTO `persona`(`nombre_persona`, `apellido_persona`,
                                                 `cuil_persona`, `fecha_nac`, `rela_persona_direccion`,
                                                  `rela_educacion`, `profesion`,`rela_usuario_contra`)
                                            VALUES (?,?,?,?,?,?,?,?)");
        $sql->execute(array(
            $nombre, $apellido,
            $cuil, $fecha, $lastInsertIDdireccion,
            $educacion, $profesion, $lastInsertusuariocontraseña
        ));

        $lastInsertIDAgencias = $conexionBD->lastInsertId();

        /*-------- INSERTAMOS EL PERSONAL--------*/

        $sqlPersonal = $conexionBD->prepare("INSERT INTO `personales`(`rela_persona`,
                                                         `rela_tipo_personal`, `rela_area`,
                                                         `n_legajo`,
                                                            `rela_tipo_estado`, `rela_depto_mintur`,
                                                            `expediente`, `rela_tipo_contrato`,
                                                            anio_antiguedad) 
                                            VALUES (?,?,?,?,?,?,?,?,?)");
        $sqlPersonal->execute(array(
            $lastInsertIDAgencias, $cargo,
            $area, $n_legajo, 2,
            $departamento, $n_expediente, $tipo_contrato,
            $antiguedad
        ));

        $lastInsertIDPersonal = $conexionBD->lastInsertId();



        /*-------- INSERTAMOS LAS LICENCIAS--------*/

        $sqllicencias = $conexionBD->prepare("INSERT INTO `licencias`(`fecha_ini`,`fecha_fin`,
                                             `dias_restante`, `estado`, `rela_personal`)
                                            VALUES (?,?,?,?,?)");
        $sqllicencias->execute(array(
            $fechaini, $fechafin,
            $diasrestante, 0, $lastInsertIDPersonal
        ));

        $lastInsertlicencias = $conexionBD->lastInsertId();

        /*-------- INSERTAMOS EL TELEFONO CELULAR--------*/

        foreach ($telefonoCel as $telefonoAgencia1) {

            $sqlTelefono = $conexionBD->prepare("INSERT INTO `contacto`(`descripcion_contacto`,`rela_tipo_contacto_cont`,
                                                                            `rela_persona_contacto`) 
                                                    VALUES (?,?,?)");
            $sqlTelefono->execute(array($telefonoAgencia1, 2, $lastInsertIDAgencias));
        }

        /*-------- INSERTAMOS EL TELEFONO FIJO--------*/

        $sqlFijo = $conexionBD->prepare("INSERT INTO `contacto`(`descripcion_contacto`,`rela_tipo_contacto_cont`,
                                                                            `rela_persona_contacto`) 
                                                    VALUES (?,?,?)");
        $sqlFijo->execute(array($telefonoFijo, 9, $lastInsertIDAgencias));

        /*-------- INSERTAMOS EL CORREO-------*/

        $sqlCorreo = $conexionBD->prepare("INSERT INTO `contacto`(`descripcion_contacto`,`rela_tipo_contacto_cont`,
                                                                            `rela_persona_contacto`) 
                                                    VALUES (?,?,?)");
        $sqlCorreo->execute(array($correo, 1, $lastInsertIDAgencias));
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
    public function buscar($id)
    {
        $conexionBD = BD::crearInstancia();
        $sql = $conexionBD->prepare("SELECT *
        FROM `personales` per
        INNER JOIN persona p on p.id_persona = per.rela_persona
        INNER JOIN educacion e on e.id_educacion = p.rela_educacion
        INNER JOIN contacto c on c.rela_persona_contacto = p.id_persona
        INNER JOIN areas a on a.id_areas = per.rela_area
        INNER JOIN tipo_contrato ticon on ticon.id_tipo_contrato = per.rela_tipo_contrato
        INNER JOIN deptos_mintur depmin on depmin.id_deptos_mintur = per.rela_depto_mintur
        INNER JOIN direccion dir on dir.id_direccion = p.rela_persona_direccion
        INNER join localidad l on l.id_localidad = dir.rela_localidad_direccion
        INNER JOIN tipo_personal tiper on tiper.id_tipo_personal = per.rela_tipo_personal
        INNER JOIN licencias li on li.rela_personal = per.id_personal
        WHERE per.id_personal = $id");

        $sql->execute();

        return $sql->fetch(PDO::FETCH_OBJ);
    }

    public static function editar(
        $nombre,
        $apellido,
        $cuil,
        $fecha,
        $profesion,
        $educacion,
        $n_legajo,
        $n_expediente,
        $antiguedad,
        $departamento,
        $area,
        $tipoCargo,
        $tipo_contrato,
        $rela_localidad_direccion,
        $calle_direccion,
        $telefonoCel,
        $telefonoFijoAgencia,
        $correo,
        $fechaini,
        $fechafin,
        $diasrestante,

        $id_persona,
        $educacionID,
        $id_Personal,
        $departamentoID,
        $areaID,
        $cargoID,
        $tipoContratoID,
        $idDireccion,
        $idtelefonoAgencia,
        $idtelefonoFijo,
        $idcorreo,
        $licenciasID
    ) {

        $conexionBD = BD::crearInstancia();

        /*---------------SE ACTUALIZA LA PERSONA-------------------*/
        $sql = $conexionBD->prepare("UPDATE `persona` SET `nombre_persona`='$nombre',`apellido_persona`='$apellido',
        `cuil_persona`='$cuil',`fecha_nac`='$fecha',
        `rela_educacion`=$educacion,`profesion`='$profesion' 
        WHERE id_persona = $id_persona;");
        $sql->execute();

        /*---------------SE ACTUALIZA EL PERSONAL-------------------*/
        $sqlPersonal = $conexionBD->prepare("UPDATE `personales` SET 
        `rela_tipo_personal`=$tipoCargo,`rela_area`=$area,
        `n_legajo`='$n_legajo',`rela_depto_mintur`=$departamento,
        `expediente`='$n_expediente',`rela_tipo_contrato`=$tipo_contrato,
        `anio_antiguedad`=$antiguedad 
        WHERE id_personal =$id_Personal;");
        $sqlPersonal->execute();

        /*---------------SE ACTUALIZA LAS LICENCIAS-------------------*/
        $sqlLicencias = $conexionBD->prepare("UPDATE `licencias` SET `fecha_ini`='$fechaini',
        `fecha_fin`='$fechafin',`dias_restante`='$diasrestante' 
        WHERE id_licencias = $licenciasID;");
        $sqlLicencias->execute();

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




        /*----------------SE ACTUALIZA EL CONTACTO telefono------------------*/

        $asociativo = array_combine($idtelefonoAgencia, $telefonoCel);



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
                                                    WHERE id_contacto = $idtelefonoFijo");
            $sqlFijo->execute();
        } else {
            $sqlFijo = $conexionBD->prepare("UPDATE `contacto` SET `descripcion_contacto`= $telefonoFijoAgencia
                                                    WHERE id_contacto = $idtelefonoFijo");
            $sqlFijo->execute();
        }



        /*----------------SE ACTUALIZA EL CONTACTO correo------------------*/

        $sqlCorreo = $conexionBD->prepare("UPDATE `contacto` SET `descripcion_contacto`='$correo'
                                                    WHERE id_contacto = $idcorreo");
        $sqlCorreo->execute();
    }

    public function buscarSelectLocalidad()
    {

        $conexionBD = BD::crearInstancia();


        $sqlLocalidad = $conexionBD->query("SELECT id_localidad, nombre_localidad, rela_provincia, rela_departamento FROM localidad");

        $sqlLocalidad->execute();

        return $sqlLocalidad->fetchAll(PDO::FETCH_OBJ);
    }

    public function buscarSelectEstudios()
    {

        $conexionBD = BD::crearInstancia();


        $sqlLocalidad = $conexionBD->query("SELECT id_educacion, descriEducacion FROM educacion");

        $sqlLocalidad->execute();

        return $sqlLocalidad->fetchAll(PDO::FETCH_OBJ);
    }
    public function buscarSelectDepartamento()
    {

        $conexionBD = BD::crearInstancia();


        $sqlLocalidad = $conexionBD->query("SELECT `id_deptos_mintur`, `descriDepartamento` FROM `deptos_mintur`");

        $sqlLocalidad->execute();

        return $sqlLocalidad->fetchAll(PDO::FETCH_OBJ);
    }
    public function buscarSelectCargo()
    {

        $conexionBD = BD::crearInstancia();


        $sqlLocalidad = $conexionBD->query("SELECT `id_tipo_personal`, `descri_tipo_personal` FROM `tipo_personal`");

        $sqlLocalidad->execute();

        return $sqlLocalidad->fetchAll(PDO::FETCH_OBJ);
    }
    public function buscarSelectRol()
    {

        $conexionBD = BD::crearInstancia();


        $sqlLocalidad = $conexionBD->query("SELECT `id_roles`, `roles` FROM `roles`");

        $sqlLocalidad->execute();

        return $sqlLocalidad->fetchAll(PDO::FETCH_OBJ);
    }
    public function buscarSelectArea()
    {

        $conexionBD = BD::crearInstancia();


        $sqlLocalidad = $conexionBD->query("SELECT `id_areas`, `descriArea` FROM `areas`");

        $sqlLocalidad->execute();

        return $sqlLocalidad->fetchAll(PDO::FETCH_OBJ);
    }
    public function buscarSelectContrato()
    {

        $conexionBD = BD::crearInstancia();


        $sqlLocalidad = $conexionBD->query("SELECT `id_tipo_contrato`, `descripcion_contrato` 
                                            FROM `tipo_contrato`");

        $sqlLocalidad->execute();

        return $sqlLocalidad->fetchAll(PDO::FETCH_OBJ);
    }
}

class Contactos
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
                                            and contacto.rela_persona_contacto  = $id_agencia");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarTelefonosFijos($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto, contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 9
                                            and contacto.rela_persona_contacto  = $id_agencia");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarCorreo($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto, contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 1
                                            and contacto.rela_persona_contacto  = $id_agencia");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarFacebook($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto, contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 4
                                            and contacto.rela_persona_contacto  = $id_agencia");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarInstagram($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto, contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 5
                                            and contacto.rela_persona_contacto  = $id_agencia");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarTwitter($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto, contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 6
                                            and contacto.rela_persona_contacto  = $id_agencia");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarWeb($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto, contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 7
                                            and contacto.rela_persona_contacto  = $id_agencia");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarOtro($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto, contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 8
                                            and contacto.rela_persona_contacto  = $id_agencia");

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
                                            and contacto.rela_persona_contacto  = $id_agencia");

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
                                            and contacto.rela_persona_contacto  = $id_agencia");

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
                                            and contacto.rela_persona_contacto  = $id_agencia");

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
                                            and contacto.rela_persona_contacto  = $id_agencia");

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
                                            and contacto.rela_persona_contacto  = $id_agencia");

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
                                            and contacto.rela_persona_contacto  = $id_agencia");

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
                                            and contacto.rela_persona_contacto  = $id_agencia");

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
                                            and contacto.rela_persona_contacto  = $id_agencia");

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
