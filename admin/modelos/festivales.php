<?php

class FestivalesModelo
{

    public $lista;
    public $listaContacto;
    public $listaID;
    public $listaBuscar;


    public function __construct()
    {
        $this->lista = array();
        $this->listaContacto = array();
        $this->listaID = array();
        $this->listaBuscar = array();
    }

    public function consultar()
    {
        // se ingresa los datos para luego ver en el datetable
        $conexionBD = BD::crearInstancia();

        $sql = $conexionBD->query("SELECT `id_festivales`, `nombre_festival`, `descripcion`, `fecha`, `fecha_edit_general`, `idoneo`,
        localidad.nombre_localidad,localidad.id_localidad,direccion.id_direccion,
        tipo_de_servicio.descripcion_servicio,tipo_de_servicio.id_tipo_servicio
        FROM `festivales` 
        INNER JOIN direccion ON festivales.rela_localidad = direccion.id_direccion
        INNER JOIN localidad on direccion.rela_localidad_direccion = localidad.id_localidad
        INNER JOIN tipo_de_servicio on tipo_de_servicio.id_tipo_servicio = festivales.rela_tipo_servicio
        ");

        //recuperamos los datos y los retornamos

        while ($filas = $sql->fetch(PDO::FETCH_ASSOC)) {
            $this->lista[] = $filas;
        }
        return $this->lista; //este return se va a llamar en el controlador_alojamiento.php clase inicio

    }

    public function consultarContactos()
    {
        // se ingresa los datos para luego ver en el datetable
        $conexionBD = BD::crearInstancia();

        $sql = $conexionBD->query("SELECT contacto.descripcion_contacto, contacto.rela_festivales,
        contacto.rela_tipo_contacto_cont, festivales.nombre_festival FROM contacto
        INNER JOIN festivales ON festivales.id_festivales = contacto.rela_festivales
        WHERE contacto.rela_tipo_contacto_cont = 2 or rela_tipo_contacto_cont = 9 
        LIMIT 1");

        //recuperamos los datos y los retornamos

        while ($filas = $sql->fetch(PDO::FETCH_ASSOC)) {
            $this->listaContacto[] = $filas;
        }
        return $this->listaContacto; //este return se va a llamar en el controlador_alojamiento.php clase inicio

    }

    public function consultarID($id)
    {

        // hacemos una consulta a la BD del ID

        $conexionBD = BD::crearInstancia();

        $sql = $conexionBD->query("SELECT `id_festivales`,direccion.id_direccion,localidad.id_localidad
        FROM `festivales`
        INNER JOIN direccion ON festivales.rela_localidad = direccion.id_direccion
        INNER JOIN localidad on direccion.rela_localidad_direccion = localidad.id_localidad
        INNER JOIN tipo_de_servicio on tipo_de_servicio.id_tipo_servicio = festivales.rela_tipo_servicio
        WHERE id_festivales =$id");

        //recuperamos los datos y los retornamos

        $sql->execute();



        return $sql->fetch(PDO::FETCH_OBJ); //este return se va a llamar en el controlador_agencia.php clase inicio

    }

    public function crear(
        $nombre,
        $descripcion,
        $idoneo,
        $fecha,
        $localidad,
        $tipoServicio,
        $telefonoAgencia,
        $telefonoFijoAgencia,
        $correoAgencia,
        $facebookAgencia,
        $instagramAgencia,
        $twitterAgencia,
        $webAgencia,
        $otroAgencia
    ) {
        // ingresamos los datos recibidos por el controlador e insertamos en la BD

        $conexionBD = BD::crearInstancia();

        /*-------- INSERTAMOS LA DIRECCION--------*/

        $sqlDireccion = $conexionBD->prepare("INSERT INTO direccion (rela_localidad_direccion)
                                                    VALUES(?)");
        $sqlDireccion->execute(array($localidad));

        $lastInsertIDdireccion = $conexionBD->lastInsertId();


        /*-------- INSERTAMOS EL FESTIVAL--------*/

        $sql = $conexionBD->prepare("INSERT INTO `festivales`(`nombre_festival`, `descripcion`, `fecha`, `rela_localidad`, `rela_tipo_servicio`, `idoneo`,`fecha_edit_general`) VALUES (?,?,?,?,?,?,CURRENT_TIMESTAMP())");
        $sql->execute(array(
            $nombre, $descripcion, $fecha, $lastInsertIDdireccion, $tipoServicio, $idoneo

        ));

        $lastInsertIDAgencias = $conexionBD->lastInsertId();

        // print_r($lastInsertIDAgencias);

        /*-------- INSERTAMOS EL TELEFONO CELULAR--------*/

        foreach ($telefonoAgencia as $telefonoAgencia1) {

            $sqlTelefono = $conexionBD->prepare("INSERT INTO `contacto`(`descripcion_contacto`, `rela_tipo_contacto_cont`, `rela_festivales`) VALUES (?,?,?)");
            // print_r($sqlTelefono);
            $sqlTelefono->execute(array($telefonoAgencia1, 2, $lastInsertIDAgencias));
            // $sqlTelefono->execute();
        }

        /*-------- INSERTAMOS EL TELEFONO FIJO--------*/

        $sqlFijo = $conexionBD->prepare("INSERT INTO `contacto`(`descripcion_contacto`, `rela_tipo_contacto_cont`, `rela_festivales`) VALUES (?,?,?)");
        $sqlFijo->execute(array($telefonoFijoAgencia, 9,  $lastInsertIDAgencias));
        // print_r($sqlFijo);

        /*-------- INSERTAMOS EL CORREO-------*/

        $sqlCorreo = $conexionBD->prepare("INSERT INTO `contacto`(`descripcion_contacto`, `rela_tipo_contacto_cont`, `rela_festivales`) VALUES (?,?,?)");
        $sqlCorreo->execute(array($correoAgencia, 1, $lastInsertIDAgencias));

        /*-------- INSERTAMOS EL FACEBOOK--------*/

        $sqlFacebook = $conexionBD->prepare("INSERT INTO `contacto`(`descripcion_contacto`, `rela_tipo_contacto_cont`, `rela_festivales`) VALUES (?,?,?)");
        $sqlFacebook->execute(array($facebookAgencia, 4, $lastInsertIDAgencias));

        /*-------- INSERTAMOS EL INSTAGRAM--------*/

        $sqlInstagram = $conexionBD->prepare("INSERT INTO `contacto`(`descripcion_contacto`, `rela_tipo_contacto_cont`, `rela_festivales`) VALUES (?,?,?)");
        $sqlInstagram->execute(array($instagramAgencia, 5, $lastInsertIDAgencias));

        /*-------- INSERTAMOS EL TWITTER--------*/

        $sqlTwitter = $conexionBD->prepare("INSERT INTO `contacto`(`descripcion_contacto`, `rela_tipo_contacto_cont`, `rela_festivales`) VALUES (?,?,?)");
        $sqlTwitter->execute(array($twitterAgencia, 6, $lastInsertIDAgencias));

        /*-------- INSERTAMOS EL SITIO WEB--------*/

        $sqlWeb = $conexionBD->prepare("INSERT INTO `contacto`(`descripcion_contacto`, `rela_tipo_contacto_cont`, `rela_festivales`) VALUES (?,?,?)");
        $sqlWeb->execute(array($webAgencia, 7, $lastInsertIDAgencias));

        /*-------- INSERTAMOS OTRO--------*/

        $sqlOtro = $conexionBD->prepare("INSERT INTO `contacto`(`descripcion_contacto`, `rela_tipo_contacto_cont`, `rela_festivales`) VALUES (?,?,?)");
        $sqlOtro->execute(array($otroAgencia, 8, $lastInsertIDAgencias));
    }

    public static function borrar($id, $id_direccion)
    {
        // se ingresa los datos que nos envia el controlador Borrar para luego hacer un delete
        $conexionBD = BD::crearInstancia();
        $sqlAgenciaBorrar = $conexionBD->prepare("DELETE FROM `festivales` WHERE id_festivales =?");
        $sqlAgenciaBorrar->execute(array($id));

        $sqlDireccionBorrar = $conexionBD->prepare("DELETE FROM direccion WHERE id_direccion =?");
        $sqlDireccionBorrar->execute(array($id_direccion));
    }
    /*----------BUSCAR para ir imprimir en la seccion EDITAR----------*/
    public function buscar($id)
    {
        $conexionBD = BD::crearInstancia();
        $sql = $conexionBD->prepare("SELECT `id_festivales`,festivales.nombre_festival,festivales.descripcion,festivales.fecha,festivales.idoneo,`fecha_edit_general`,
        direccion.id_direccion,direccion.rela_localidad_direccion,
        localidad.id_localidad,localidad.nombre_localidad,
        departamentos_fsa.descripcion_departamentos,
        tipo_de_servicio.id_tipo_servicio,tipo_de_servicio.descripcion_servicio
        FROM `festivales`
        INNER JOIN direccion ON festivales.rela_localidad = direccion.id_direccion
        INNER JOIN localidad on direccion.rela_localidad_direccion = localidad.id_localidad
        INNER JOIN departamentos_fsa on localidad.rela_departamento = departamentos_fsa.id_departamentos_fsa
        INNER JOIN tipo_de_servicio on tipo_de_servicio.id_tipo_servicio = festivales.rela_tipo_servicio
        WHERE id_festivales = $id");

        $sql->execute();

        return $sql->fetch(PDO::FETCH_OBJ);
    }

    public static function editar(
        $nombre,
        $descripcion,
        $id,
        $idoneo,
        $fecha,
        $LocalidadID,
        $localidad,
        $tipoServicioID,
        $tipoServicio,

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
        // extraemos los datos mediante POST del controlador- funcion editar

        $conexionBD = BD::crearInstancia();

        /*---------------SE ACTUALIZA EL SERVICIO GENERAL-------------------*/
        $sql = $conexionBD->prepare("UPDATE `festivales` SET `nombre_festival`='$nombre',`descripcion`='$descripcion',`fecha`='$fecha',`rela_tipo_servicio`=$tipoServicio,`fecha_edit_general`= CURRENT_TIMESTAMP(),`idoneo`='$idoneo' WHERE id_festivales = $id;");
        $sql->execute();

        /*---------------SE ACTUALIZA LA DIRECCION CON LA LOCALIDAD-------------------*/

        if ($localidad == 0) {
        } else {
            $sqlDireccion = $conexionBD->prepare("UPDATE `direccion` SET `rela_localidad_direccion`=$localidad 
                                                    WHERE id_direccion = $LocalidadID ");
            $sqlDireccion->execute();
        }





        /*----------------SE ACTUALIZA EL CONTACTO telefono------------------*/

        // aca se realiza un array asociativo para una edicion multiple

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
                                            FROM localidad
                                            WHERE rela_provincia = 1");

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
                                            and contacto.rela_festivales   = $id_agencia");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarTelefonosFijos($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto, contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 9
                                            and contacto.rela_festivales   = $id_agencia");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarCorreo($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto, contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 1
                                            and contacto.rela_festivales   = $id_agencia");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarFacebook($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto, contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 4
                                            and contacto.rela_festivales   = $id_agencia");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarInstagram($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto, contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 5
                                            and contacto.rela_festivales   = $id_agencia");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarTwitter($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto, contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 6
                                            and contacto.rela_festivales   = $id_agencia");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarWeb($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto, contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 7
                                            and contacto.rela_festivales   = $id_agencia");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarOtro($id_agencia)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto, contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 8
                                            and contacto.rela_festivales   = $id_agencia");

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
                                            and contacto.rela_festivales   = $id_agencia");

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
                                            and contacto.rela_festivales   = $id_agencia");

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
                                            and contacto.rela_festivales   = $id_agencia");

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
                                            and contacto.rela_festivales   = $id_agencia");

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
                                            and contacto.rela_festivales   = $id_agencia");

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
                                            and contacto.rela_festivales   = $id_agencia");

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
                                            and contacto.rela_festivales   = $id_agencia");

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
                                            and contacto.rela_festivales   = $id_agencia");

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
