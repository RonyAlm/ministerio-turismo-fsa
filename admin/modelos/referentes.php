<?php

class ReferenteModelo
{
    public $listaReferentes;
    public $listaReferentesID;
    public $listaBuscar;

    public function __construct()
    {
        $this->listaReferentes = array();
        $this->listaReferentesID = array();
        $this->listaBuscar = array();
    }

    public function consultar()
    {

        $conexionBD = BD::crearInstancia();

        $sql = $conexionBD->query("SELECT `id_referentes`, `idoneo_referente`, fecha_edit_referente, direccion.id_direccion,localidad.nombre_localidad,
                                            tipo_encargado.descripcion_tipo_encargado,
                                        (SELECT contacto.descripcion_contacto 
                                        FROM contacto 
                                        WHERE referentes_municipal.id_referentes = contacto.rela_contacto_referente
                                        and contacto.rela_tipo_contacto_cont = 2
                                        LIMIT 1) descripcion_contacto
                                        FROM `referentes_municipal`
                                        INNER JOIN direccion ON referentes_municipal.rela_direccion = direccion.id_direccion
                                        INNER JOIN localidad on direccion.rela_localidad_direccion = localidad.id_localidad
                                        INNER JOIN tipo_encargado on tipo_encargado.id_tipo_encargado = referentes_municipal.rela_tipo_encargado");

        //recuperamos los datos y los retornamos

        while ($filas = $sql->fetch(PDO::FETCH_ASSOC)) {
            $this->listaReferentes[] = $filas;
        }
        return $this->listaReferentes; //este return se va a llamar en el controlador_alojamiento.php clase inicio

    }

    public function estadistica()
    {

        $conexionBD = BD::crearInstancia();


        $sqlestadistica = $conexionBD->query("SELECT COUNT(*)conteo FROM `referentes_municipal`");

        $sqlestadistica->execute();

        return $sqlestadistica->fetchAll(PDO::FETCH_OBJ);
    }

    public function estadisticaSedesTurismo()
    {

        $conexionBD = BD::crearInstancia();


        $sqlestadistica = $conexionBD->query("SELECT COUNT(*)conteo FROM `referentes_municipal` WHERE referentes_municipal.rela_tipo_encargado=1");

        $sqlestadistica->execute();

        return $sqlestadistica->fetchAll(PDO::FETCH_OBJ);
    }

    public function buscarSelectLocalidad()
    {

        $conexionBD = BD::crearInstancia();


        $sqlLocalidad = $conexionBD->query("SELECT id_localidad, `nombre_localidad`, rela_provincia, rela_departamento
                                                   FROM localidad");

        $sqlLocalidad->execute();

        return $sqlLocalidad->fetchAll(PDO::FETCH_OBJ);
    }
    public function buscarSelectEncargado()
    {

        $conexionBD = BD::crearInstancia();


        $sqlEncargado = $conexionBD->query("SELECT `id_tipo_encargado`, `descripcion_tipo_encargado` 
                                                    FROM `tipo_encargado`");

        $sqlEncargado->execute();

        return $sqlEncargado->fetchAll(PDO::FETCH_OBJ);
    }

    public function crear(
        $nombreReferente,
        $localidadReferente,
        $domicilioReferente,
        $telefonoReferente,
        $telefonoFijoReferente,
        $correoReferente,
        $facebookReferente,
        $instagramReferente,
        $twitterReferente,
        $webReferente,
        $otroReferente,
        $referenteEncargado
    ) {

        $conexionBD = BD::crearInstancia();

        /*-------- INSERTAMOS LA DIRECCION--------*/

        $sqlDireccion = $conexionBD->prepare("INSERT INTO direccion (calle_direccion,rela_localidad_direccion)
                                                    VALUES(?,?)");
        $sqlDireccion->execute(array($domicilioReferente, $localidadReferente));

        $lastInsertIDdireccion = $conexionBD->lastInsertId();



        /*-------- INSERTAMOS EL REFERENTE--------*/

        $sql = $conexionBD->prepare("INSERT INTO `referentes_municipal`(`idoneo_referente`, `rela_direccion`,rela_tipo_encargado, fecha_edit_referente) 
                                            VALUES (?,?,?,CURRENT_TIMESTAMP())");
        $sql->execute(array($nombreReferente, $lastInsertIDdireccion, $referenteEncargado));

        $lastInsertIDReferentes = $conexionBD->lastInsertId();

        /*-------- INSERTAMOS EL TELEFONO CELULAR--------*/

        $sqlTelefono = $conexionBD->prepare("INSERT INTO `contacto`(`descripcion_contacto`,`rela_tipo_contacto_cont`,
                                                                            `rela_contacto_referente`) 
                                                    VALUES (?,?,?)");
        $arrayTel = array($telefonoReferente, 2, $lastInsertIDReferentes);
        $sqlTelefono->execute($arrayTel);

        /*-------- INSERTAMOS EL TELEFONO FIJO--------*/

        $sqlFijo = $conexionBD->prepare("INSERT INTO `contacto`(`descripcion_contacto`,`rela_tipo_contacto_cont`,
                                                                            `rela_contacto_referente`) 
                                                    VALUES (?,?,?)");
        $sqlFijo->execute(array($telefonoFijoReferente, 9, $lastInsertIDReferentes));

        /*-------- INSERTAMOS EL CORREO-------*/

        $sqlCorreo = $conexionBD->prepare("INSERT INTO `contacto`(`descripcion_contacto`,`rela_tipo_contacto_cont`,
                                                                            `rela_contacto_referente`) 
                                                    VALUES (?,?,?)");
        $sqlCorreo->execute(array($correoReferente, 1, $lastInsertIDReferentes));

        /*-------- INSERTAMOS EL FACEBOOK--------*/

        $sqlFacebook = $conexionBD->prepare("INSERT INTO `contacto`(`descripcion_contacto`,`rela_tipo_contacto_cont`,
                                                                            `rela_contacto_referente`) 
                                                    VALUES (?,?,?)");
        $sqlFacebook->execute(array($facebookReferente, 4, $lastInsertIDReferentes));

        /*-------- INSERTAMOS EL INSTAGRAM--------*/

        $sqlInstagram = $conexionBD->prepare("INSERT INTO `contacto`(`descripcion_contacto`,`rela_tipo_contacto_cont`,
                                                                            `rela_contacto_referente`) 
                                                    VALUES (?,?,?)");
        $sqlInstagram->execute(array($instagramReferente, 5, $lastInsertIDReferentes));

        /*-------- INSERTAMOS EL TWITTER--------*/

        $sqlTwitter = $conexionBD->prepare("INSERT INTO `contacto`(`descripcion_contacto`,`rela_tipo_contacto_cont`,
                                                                            `rela_contacto_referente`) 
                                                    VALUES (?,?,?)");
        $sqlTwitter->execute(array($twitterReferente, 6, $lastInsertIDReferentes));

        /*-------- INSERTAMOS EL SITIO WEB--------*/

        $sqlWeb = $conexionBD->prepare("INSERT INTO `contacto`(`descripcion_contacto`,`rela_tipo_contacto_cont`,
                                                                            `rela_contacto_referente`) 
                                                    VALUES (?,?,?)");
        $sqlWeb->execute(array($webReferente, 7, $lastInsertIDReferentes));

        /*-------- INSERTAMOS OTRO--------*/

        $sqlOtro = $conexionBD->prepare("INSERT INTO `contacto`(`descripcion_contacto`,`rela_tipo_contacto_cont`,
                                                                            `rela_contacto_referente`) 
                                                    VALUES (?,?,?)");
        $sqlOtro->execute(array($otroReferente, 8, $lastInsertIDReferentes));
    }

    public function buscar($idReferente)
    {
        $conexionBD = BD::crearInstancia();
        $sql = $conexionBD->prepare("SELECT `id_referentes`, `idoneo_referente`,fecha_edit_referente ,contacto.descripcion_contacto,
                                        direccion.calle_direccion,direccion.id_direccion,
                                        localidad.nombre_localidad,departamentos_fsa.descripcion_departamentos,
                                        tipo_encargado.id_tipo_encargado, tipo_encargado.descripcion_tipo_encargado
                                        FROM `referentes_municipal`
                                        INNER JOIN contacto ON contacto.rela_contacto_referente = referentes_municipal.id_referentes
                                        INNER JOIN direccion ON referentes_municipal.rela_direccion = direccion.id_direccion
                                        INNER JOIN localidad on direccion.rela_localidad_direccion = localidad.id_localidad
                                        INNER JOIN departamentos_fsa on localidad.rela_departamento = departamentos_fsa.id_departamentos_fsa
                                        INNER JOIN tipo_encargado on referentes_municipal.rela_tipo_encargado = tipo_encargado.id_tipo_encargado
                                        WHERE referentes_municipal.id_referentes =$idReferente");

        $sql->execute();

        return $sql->fetch(PDO::FETCH_OBJ);
    }
    public function consultarID($idReferente)
    {

        $conexionBD = BD::crearInstancia();

        $sql = $conexionBD->query("SELECT id_agencias, razon_social.id_razon_social, direccion.id_direccion,
                                            estado_actividad.id_estado
                                    FROM `agencias`                                    
                                    INNER JOIN razon_social on razon_social.id_razon_social = agencias.rela_razon_social_agencia
                                    INNER JOIN direccion ON agencias.rela_agencia_direccion = direccion.id_direccion
                                    INNER JOIN estado_actividad on estado_actividad.rela_estado_agencia = agencias.id_agencias
                                    WHERE agencias.id_agencias = $idReferente");

        //recuperamos los datos y los retornamos

        $sql->execute();



        return $sql->fetch(PDO::FETCH_OBJ); //este return se va a llamar en el controlador_agencia.php clase inicio

    }

    public function editar(
        $nombreReferente,
        $localidadReferente,
        $domicilioReferente,
        $telefonoReferente,
        $telefonoFijoReferente,
        $correoReferente,
        $facebookReferente,
        $instagramReferente,
        $twitterReferente,
        $webReferente,
        $otroReferente,
        $referenteID,
        $referenteLocalidadID,
        $referentetelefonoID,
        $telFijoID,
        $referenteCorreoID,
        $referenteFacebookID,
        $referenteInstagramID,
        $referenteTwitterID,
        $referenteWebID,
        $referenteOtroID,
        $referenteDomicilioID,
        $referenteEncargado
    ) {

        $conexionBD = BD::crearInstancia();
        /*------------ SE ACTUALIZA EL REFERENTE---------- */

        if ($referenteEncargado == 0) {
            // echo "se actualiza sin el encargado";
            $sql = $conexionBD->prepare("UPDATE `referentes_municipal` SET `idoneo_referente`='$nombreReferente',
                                                                            fecha_edit_referente= CURRENT_TIMESTAMP()
                                        
                                        WHERE id_referentes = $referenteID");
            $sql->execute();
        } else {
            // echo "se actualiza con el encargado";
            $sql = $conexionBD->prepare("UPDATE `referentes_municipal` 
                SET`rela_tipo_encargado`=$referenteEncargado ,`idoneo_referente`='$nombreReferente',
                fecha_edit_referente= CURRENT_TIMESTAMP()
                WHERE id_referentes = $referenteID");
            $sql->execute();
        }



        /*---------------SE ACTUALIZA LA DIRECCION CON LA LOCALIDAD-------------------*/

        if ($localidadReferente == 0) {
            $sqlDireccion = $conexionBD->prepare("UPDATE `direccion` SET `calle_direccion`='$domicilioReferente'
                                                    WHERE id_direccion = $referenteDomicilioID");
            $sqlDireccion->execute();
        } else {
            $sqlDireccion = $conexionBD->prepare("UPDATE `direccion` SET `calle_direccion`='$domicilioReferente',
                                                    `rela_localidad_direccion`=$localidadReferente 
                                                    WHERE id_direccion = $referenteDomicilioID");
            $sqlDireccion->execute();
        }

        /*----------------SE ACTUALIZA EL CONTACTO telefono------------------*/

        if ($telefonoReferente == "") {
            $telefonoReferente = "No se registró";
            $sqlContacto = $conexionBD->prepare("UPDATE `contacto` SET `descripcion_contacto`='$telefonoReferente'
                                                WHERE id_contacto = $referentetelefonoID");
            $sqlContacto->execute();
        } else {
            $sqlContacto = $conexionBD->prepare("UPDATE `contacto` SET `descripcion_contacto`=$telefonoReferente
                                                    WHERE id_contacto = $referentetelefonoID");
            $sqlContacto->execute();
        }



        /*----------------SE ACTUALIZA EL CONTACTO  telefono fijo------------------*/

        if ($telefonoFijoReferente == "") {
            $telefonoFijoReferente = "No se registró";

            $sqlFijo = $conexionBD->prepare("UPDATE `contacto` SET `descripcion_contacto`= '$telefonoFijoReferente'
                                                WHERE id_contacto = $telFijoID");
            $sqlFijo->execute();
        } else {
            $sqlFijo = $conexionBD->prepare("UPDATE `contacto` SET `descripcion_contacto`= $telefonoFijoReferente
                                                WHERE id_contacto = $telFijoID");
            $sqlFijo->execute();
        }



        /*----------------SE ACTUALIZA EL CONTACTO correo------------------*/

        $sqlCorreo = $conexionBD->prepare("UPDATE `contacto` SET `descripcion_contacto`='$correoReferente'
                                                WHERE id_contacto = $referenteCorreoID");
        $sqlCorreo->execute();

        /*----------------SE ACTUALIZA EL CONTACTO facebook ------------------*/

        $sqlFacebook = $conexionBD->prepare("UPDATE `contacto` SET `descripcion_contacto`='$facebookReferente'
                                                WHERE id_contacto = $referenteFacebookID");
        $sqlFacebook->execute();

        /*----------------SE ACTUALIZA EL CONTACTO Instagram ------------------*/

        $sqlInstagram = $conexionBD->prepare("UPDATE `contacto` SET `descripcion_contacto`='$instagramReferente'
                                                WHERE id_contacto = $referenteInstagramID");
        $sqlInstagram->execute();

        /*----------------SE ACTUALIZA EL CONTACTO  twitter------------------*/

        $sqlTwitter = $conexionBD->prepare("UPDATE `contacto` SET `descripcion_contacto`='$twitterReferente'
                                                WHERE id_contacto = $referenteTwitterID");
        $sqlTwitter->execute();

        /*----------------SE ACTUALIZA EL CONTACTO  sitio web------------------*/

        $sqlWeb = $conexionBD->prepare("UPDATE `contacto` SET `descripcion_contacto`='$webReferente'
                                                WHERE id_contacto = $referenteWebID");
        $sqlWeb->execute();

        /*----------------SE ACTUALIZA EL CONTACTO otro------------------*/

        $sqlOtro = $conexionBD->prepare("UPDATE `contacto` SET `descripcion_contacto`='$otroReferente'
                                                WHERE id_contacto = $referenteOtroID ");
        $sqlOtro->execute();
    }
    public static function borrar($id_referente, $id_direccion)
    {
        $conexionBD = BD::crearInstancia();

        $sql = $conexionBD->prepare("DELETE FROM `referentes_municipal` WHERE id_referentes =?");
        $sql->execute(array($id_referente));

        $sqlDireccionBorrar = $conexionBD->prepare("DELETE FROM direccion WHERE id_direccion =?");
        $sqlDireccionBorrar->execute(array($id_direccion));
    }


    /*-----FIN DE LA CLASE MODELO */
}

class ContactosReferentes
{


    private $BD;


    public function __construct()
    {
        require_once("conexion.php");
        $this->BD = BD::crearInstancia();
    }

    public function consultarTelefonos($idReferente)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto, contacto.descripcion_contacto 
                                                FROM contacto 
                                                WHERE contacto.rela_tipo_contacto_cont = 2
                                                and contacto.rela_contacto_referente = $idReferente");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarTelefonosFijos($idReferente)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto, contacto.descripcion_contacto 
                                                FROM contacto 
                                                WHERE contacto.rela_tipo_contacto_cont = 9
                                                and contacto.rela_contacto_referente = $idReferente");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarCorreo($idReferente)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto, contacto.descripcion_contacto 
                                                FROM contacto 
                                                WHERE contacto.rela_tipo_contacto_cont = 1
                                                and contacto.rela_contacto_referente = $idReferente");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarFacebook($idReferente)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto, contacto.descripcion_contacto 
                                                FROM contacto 
                                                WHERE contacto.rela_tipo_contacto_cont = 4
                                                and contacto.rela_contacto_referente = $idReferente");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarInstagram($idReferente)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto, contacto.descripcion_contacto 
                                                FROM contacto 
                                                WHERE contacto.rela_tipo_contacto_cont = 5
                                                and contacto.rela_contacto_referente = $idReferente");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarTwitter($idReferente)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto, contacto.descripcion_contacto 
                                                FROM contacto 
                                                WHERE contacto.rela_tipo_contacto_cont = 6
                                                and contacto.rela_contacto_referente = $idReferente");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarWeb($idReferente)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto, contacto.descripcion_contacto 
                                                FROM contacto 
                                                WHERE contacto.rela_tipo_contacto_cont = 7
                                                and contacto.rela_contacto_referente = $idReferente");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarOtro($idReferente)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto, contacto.descripcion_contacto 
                                                FROM contacto 
                                                WHERE contacto.rela_tipo_contacto_cont = 8
                                                and contacto.rela_contacto_referente = $idReferente");

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
        $consulta = $conexionBD->query(" SELECT contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 2
                                            and contacto.rela_contacto_referente = $id_agencia");

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
                                            and contacto.rela_contacto_referente = $id_agencia");

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
                                            and contacto.rela_contacto_referente = $id_agencia");

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
                                            and contacto.rela_contacto_referente = $id_agencia");

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
                                            and contacto.rela_contacto_referente = $id_agencia");

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
                                            and contacto.rela_contacto_referente = $id_agencia");

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
                                            and contacto.rela_contacto_referente = $id_agencia");

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
                                            and contacto.rela_contacto_referente = $id_agencia");

        while ($filas = $consulta->fetch(PDO::FETCH_ASSOC)) {
            $this->otroAgencia[] = $filas;
        }
        return $this->otroAgencia;
    }
}
