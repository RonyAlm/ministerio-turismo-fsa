<?php

class SalonesModelo
{

    public $listaSalonesInicio;



    //contruimos el constructor para recibir y crear una lista de objetos
    public function __construct()
    {
        $this->listaSalonesInicio = array();
    }

    public function consultar()
    {
        $conexionBD = BD::crearInstancia();


        $sql = $conexionBD->prepare("SELECT s.id_salones, s.nombre_salones,s.cuit_salones, s.idoneo_salones,d.id_direccion ,d.calle_direccion,l.id_localidad,l.nombre_localidad, `rela_servi_complementarios`, hm.descripcion, `fecha_edit_salones`, tea.descripcion_tipo_estado,hm.id_habi_municipal,sca.id_serv_comple_alojamiento,sca.cantidad_salones,sca.capacidad_salones,sca.wifi_salones,sca.estacionamiento_salones,sca.otros_servicio_salones,
        (SELECT contacto.descripcion_contacto FROM contacto WHERE s.id_salones = contacto.rela_contacto_salones AND contacto.rela_tipo_contacto_cont = 2 LIMIT 1) descripcion_contacto
        FROM `salones` s
        INNER JOIN direccion d on d.id_direccion = s.rela_direccion
        INNER JOIN localidad l on l.id_localidad = d.rela_localidad_direccion
        INNER JOIN estado_actividad ea on ea.rela_estado_salones = s.id_salones
        INNER JOIN tipo_estado tea on tea.id_tipo_estado = ea.rela_tipo_estado
        INNER JOIN habilitacion_municipal hm on hm.id_habi_municipal = s.rela_habilitacion
        INNER JOIN serv_complemetarios_alojamiento sca on sca.id_serv_comple_alojamiento = s.rela_servi_complementarios
        ORDER BY s.id_salones DESC");

        //recuperamos los datos y los retornamos
        $sql->execute();

        while ($filas = $sql->fetch(PDO::FETCH_ASSOC)) {
            $this->listaSalonesInicio[] = $filas;
        }
        return $this->listaSalonesInicio; //este return se va a llamar en el controlador_alojamiento.php clase inicio
    }

    public static function crear(
        $nombresalones,
        $localidadsalones,
        $idoneosalones,
        $cuitsalones,
        $domiciliosalones,
        $estadosalones,
        $telefonoAlojamiento,
        $telefonoFijoAlojamiento,
        $correoAlojamiento,
        $facebookAlojamiento,
        $instagramAlojamiento,
        $twitterAlojamiento,
        $webAlojamiento,
        $otroAlojamiento,
        $seminariosalones,
        $congresosalones,
        $eventoSocialsalones,
        $salonsalones,
        $reunionsalones,
        $habilitacionsalones
    ) {

        $conexionBD = BD::crearInstancia();

        /*-------- INSERTAMOS LA DIRECCION--------*/

        $sqlDireccion = $conexionBD->prepare("INSERT INTO direccion (calle_direccion,rela_localidad_direccion)
                                                    VALUES(?,?)");
        $sqlDireccion->execute(array($domiciliosalones, $localidadsalones));

        $lastInsertIDdireccion = $conexionBD->lastInsertId();



        /*-------- INSERTAMOS LOS SERVICIOS COMPLEMENTARIOS--------*/

        $sqlServiciosComplementarios = $conexionBD->prepare("INSERT INTO `serv_complemetarios_alojamiento`(`cantidad_salones`, `capacidad_salones`,`wifi_salones`, `estacionamiento_salones`,`otros_servicio_salones`)
                                            VALUES (?,?,?,?,?)");
        $sqlServiciosComplementarios->execute(array(
            $seminariosalones, $congresosalones,
            $eventoSocialsalones, $salonsalones,
            $reunionsalones
        ));

        $lastInsertIDServiciosComplementarios = $conexionBD->lastInsertId();


        /*-------- INSERTAMOS LOS SALONES--------*/

        $sql = $conexionBD->prepare("INSERT INTO `salones`( `nombre_salones`, `cuit_salones`, `idoneo_salones`, `rela_direccion`, `rela_servi_complementarios`, `rela_habilitacion`, `fecha_edit_salones`) VALUES (?,?,?,?,?,?,CURRENT_TIMESTAMP())");
        $sql->execute(array(
            $nombresalones, $cuitsalones,
            $idoneosalones, $lastInsertIDdireccion,
            $lastInsertIDServiciosComplementarios,
            $habilitacionsalones
        ));

        $lastInsertIDAlojamiento = $conexionBD->lastInsertId();

        /*-------- INSERTAMOS EL TELEFONO CELULAR--------*/
        foreach ($telefonoAlojamiento as $tefonoAlojamiento) {

            $sqlTelefono = $conexionBD->prepare("INSERT INTO `contacto`(`descripcion_contacto`,rela_tipo_contacto_cont,
                                                            `rela_contacto_salones`) 
                                                VALUES (?,?,?)");
            $sqlTelefono->execute(array($tefonoAlojamiento, 2, $lastInsertIDAlojamiento));
        }

        /*-------- INSERTAMOS EL TELEFONO FIJO--------*/

        $sqlFijo = $conexionBD->prepare("INSERT INTO `contacto`(`descripcion_contacto`,rela_tipo_contacto_cont,
                                                        `rela_contacto_salones`) 
                                            VALUES (?,?,?)");
        $sqlFijo->execute(array($telefonoFijoAlojamiento, 9, $lastInsertIDAlojamiento));

        /*-------- INSERTAMOS EL CORREO-------*/

        $sqlCorreo = $conexionBD->prepare("INSERT INTO `contacto`(`descripcion_contacto`,rela_tipo_contacto_cont,
                                                        `rela_contacto_salones`) 
                                            VALUES (?,?,?)");
        $sqlCorreo->execute(array($correoAlojamiento, 1, $lastInsertIDAlojamiento));

        /*-------- INSERTAMOS EL FACEBOOK--------*/

        $sqlFacebook = $conexionBD->prepare("INSERT INTO `contacto`(`descripcion_contacto`,rela_tipo_contacto_cont,
                                                        `rela_contacto_salones`) 
                                            VALUES (?,?,?)");
        $sqlFacebook->execute(array($facebookAlojamiento, 4, $lastInsertIDAlojamiento));

        /*-------- INSERTAMOS EL INSTAGRAM--------*/

        $sqlInstagram = $conexionBD->prepare("INSERT INTO `contacto`(`descripcion_contacto`,rela_tipo_contacto_cont,
                                                        `rela_contacto_salones`) 
                                            VALUES (?,?,?)");
        $sqlInstagram->execute(array($instagramAlojamiento, 5, $lastInsertIDAlojamiento));

        /*-------- INSERTAMOS EL TWITTER--------*/

        $sqlTwitter = $conexionBD->prepare("INSERT INTO `contacto`(`descripcion_contacto`,rela_tipo_contacto_cont,
                                                        `rela_contacto_salones`) 
                                            VALUES (?,?,?)");
        $sqlTwitter->execute(array($twitterAlojamiento, 6, $lastInsertIDAlojamiento));

        /*-------- INSERTAMOS EL SITIO WEB--------*/

        $sqlWeb = $conexionBD->prepare("INSERT INTO `contacto`(`descripcion_contacto`,rela_tipo_contacto_cont,
                                                        `rela_contacto_salones`) 
                                            VALUES (?,?,?)");
        $sqlWeb->execute(array($webAlojamiento, 7, $lastInsertIDAlojamiento));

        /*-------- INSERTAMOS OTRO--------*/

        $sqlOtro = $conexionBD->prepare("INSERT INTO `contacto`(`descripcion_contacto`,rela_tipo_contacto_cont,
                                                        `rela_contacto_salones`) 
                                            VALUES (?,?,?)");
        $sqlOtro->execute(array($otroAlojamiento, 8, $lastInsertIDAlojamiento));

        /*-------- INSERTAMOS EL ESTADO--------*/

        $sqlEstado = $conexionBD->prepare("INSERT INTO `estado_actividad`(`rela_tipo_estado`, rela_estado_salones) 
                                            VALUES (?,?)");
        $sqlEstado->execute(array($estadosalones, $lastInsertIDAlojamiento));
    }

    public static function borrar($id_salones, $id_direccion, $id_serv)
    {

        $conexionBD = BD::crearInstancia();

        $sql = $conexionBD->prepare("DELETE FROM `salones` WHERE id_salones = ?");
        $sql->execute(array($id_salones));

        $sqlDireccionBorrar = $conexionBD->prepare("DELETE FROM direccion WHERE id_direccion =?");
        $sqlDireccionBorrar->execute(array($id_direccion));

        $sqlServiciosComplementariosBorrar = $conexionBD->prepare("DELETE FROM `serv_complemetarios_alojamiento` WHERE id_serv_comple_alojamiento =?");
        $sqlServiciosComplementariosBorrar->execute(array($id_serv));
    }

    public static function buscar($id_alojamientos)
    {
        $conexionBD = BD::crearInstancia();
        $sql = $conexionBD->prepare("SELECT id_alojamientos,`descripcion_alojamientos`,tipo_alojamiento.descripcion_tipo_alojamiento,
                                        direccion.calle_direccion, contacto.descripcion_contacto,
                                        tipo_estado.descripcion_tipo_estado,localidad.nombre_localidad 
                                        FROM `alojamientos`
                                        INNER JOIN  contacto ON alojamientos.id_alojamientos = contacto.rela_contacto_salones
                                        INNER JOIN direccion ON alojamientos.rela_tipo_alojamiento_aloja = direccion.id_direccion
                                        INNER JOIN tipo_alojamiento on alojamientos.rela_tipo_alojamiento_aloja = tipo_alojamiento.id_tipo_alojamiento
                                        INNER JOIN estado_actividad on estado_actividad.rela_estado_salones = alojamientos.id_alojamientos
                                        INNER JOIN tipo_estado on tipo_estado.id_tipo_estado = estado_actividad.rela_tipo_estado
                                        INNER JOIN localidad on direccion.rela_localidad_direccion = localidad.id_localidad
                                        WHERE id_alojamientos =?");
        $sql->execute(array($id_alojamientos));

        $alojamientos = $sql->fetch();

        return new Alojamientos(
            $alojamientos['id_alojamientos'],
            $alojamientos['descripcion_alojamientos'],
            $alojamientos['descripcion_tipo_alojamiento'],
            $alojamientos['descripcion_contacto'],
            $alojamientos['descripcion_tipo_estado'],
            $alojamientos['calle_direccion'],
            $alojamientos['nombre_localidad']
        );
    }

    public static function editar(
        $nombresalones,
        $localidadsalones,
        $idoneosalones,
        $cuitsalones,
        $domiciliosalones,
        $estadosalones,
        $telefonoAlojamiento,
        $telefonoFijoAlojamiento,
        $correoAlojamiento,
        $facebookAlojamiento,
        $instagramAlojamiento,
        $twitterAlojamiento,
        $webAlojamiento,
        $otroAlojamiento,
        $seminariosalones,
        $congresosalones,
        $eventoSocialsalones,
        $salonsalones,
        $reunionsalones,
        $IDservicios,
        $IDserviciosComplementarios,
        $alojamientoIDtelefono,
        $alojamientoIDtelefonoFijo,
        $alojamientoIDcorreo,
        $alojamientoIDfacebook,
        $alojamientoIDinstagram,
        $alojamientoIDtwitter,
        $alojamientoIDweb,
        $alojamientoIDotro,
        $IDAlojamiento,
        $ID,
        $IDdireccionAlojamiento,
        $IDestadosalones,
        $habilitacionsalones,
        $IDhabilitacionsalones
    ) {

        $conexionBD = BD::crearInstancia();

        /*---------------SE ACTUALIZA EL ALOJAMIENTO-------------------*/

        if ($rubroAlojamiento == 0) {
            // echo "rubro igual a 0        /// ";
            $sql = $conexionBD->prepare("UPDATE `alojamientos` SET `descripcion_alojamientos`='$nombreAlojamiento',
                                                                    `cuit_alojamiento`=$cuitAlojamiento,`idoneo_alojamiento`='$idoneoAlojamiento',
                                                                    `estrella_alojamiento`=$estrellaAlojamiento,
                                                                    `fecha_edit_alojamiento`= CURRENT_TIMESTAMP()
                                        WHERE id_alojamientos=$IDAlojamiento");

            $sql->execute();
        } else {
            // echo "rubro igual conectado   ///        ";
            $sql = $conexionBD->prepare("UPDATE `alojamientos` SET `descripcion_alojamientos`='$nombreAlojamiento',
                                                                    `cuit_alojamiento`=$cuitAlojamiento,`idoneo_alojamiento`='$idoneoAlojamiento',
                                                                    `estrella_alojamiento`=$estrellaAlojamiento,`rela_alojamiento_rubro`=$rubroAlojamiento,
                                                                    `fecha_edit_alojamiento`= CURRENT_TIMESTAMP()
                                        WHERE id_alojamientos=$IDAlojamiento");

            $sql->execute();
        }
        if ($categoriaAlojamiento == 0) {
            // echo "categoria igual a 0    ///  ";
            $sql = $conexionBD->prepare("UPDATE `alojamientos` SET `descripcion_alojamientos`='$nombreAlojamiento',
                                                                    `cuit_alojamiento`=$cuitAlojamiento,`idoneo_alojamiento`='$idoneoAlojamiento',
                                                                    `estrella_alojamiento`=$estrellaAlojamiento,
                                                                    `fecha_edit_alojamiento`= CURRENT_TIMESTAMP()
                                        WHERE id_alojamientos=$IDAlojamiento");

            $sql->execute();
        } else {
            // echo "categoria igual a  conectado    ///  ";
            $sql = $conexionBD->prepare("UPDATE `alojamientos` SET `descripcion_alojamientos`='$nombreAlojamiento',
                                                                    `cuit_alojamiento`=$cuitAlojamiento,`idoneo_alojamiento`='$idoneoAlojamiento',
                                                                    `estrella_alojamiento`=$estrellaAlojamiento
                                                                    ,`rela_tipo_alojamiento_aloja`=$categoriaAlojamiento,
                                                                    `fecha_edit_alojamiento`= CURRENT_TIMESTAMP()
                                        WHERE id_alojamientos=$IDAlojamiento");

            $sql->execute();
        }

        if ($habilitacionAlojamiento == 0) {
            // echo "habilitacion igual a 0    ///  ";
            $sql = $conexionBD->prepare("UPDATE `alojamientos` SET `descripcion_alojamientos`='$nombreAlojamiento',
                                                                    `cuit_alojamiento`=$cuitAlojamiento,`idoneo_alojamiento`='$idoneoAlojamiento',
                                                                    `estrella_alojamiento`=$estrellaAlojamiento,
                                                                    `fecha_edit_alojamiento`= CURRENT_TIMESTAMP()
                                        WHERE id_alojamientos=$IDAlojamiento");

            $sql->execute();
        } else {
            // echo "categoria igual a  conectado    ///  ";
            $sql = $conexionBD->prepare("UPDATE `alojamientos` SET `descripcion_alojamientos`='$nombreAlojamiento',
                                                                    `cuit_alojamiento`=$cuitAlojamiento,`idoneo_alojamiento`='$idoneoAlojamiento',
                                                                    `estrella_alojamiento`=$estrellaAlojamiento
                                                                    ,`rela_habilitaciones`=$habilitacionAlojamiento,
                                                                    `fecha_edit_alojamiento`= CURRENT_TIMESTAMP()
                                        WHERE id_alojamientos=$IDAlojamiento");

            $sql->execute();
        }



        /*---------------SE ACTUALIZA LA DIRECCION CON LA LOCALIDAD-------------------*/

        if ($localidadsalones == 0) {
            $sqlDireccion = $conexionBD->prepare("UPDATE `direccion` SET `calle_direccion`='$domiciliosalones'
                                                    WHERE id_direccion = $IDdireccionAlojamiento ");
            // echo "no se actualiza la localidad cuando es null  ///  ";
            $sqlDireccion->execute();
        } else {
            $sqlDireccion = $conexionBD->prepare("UPDATE `direccion` SET `calle_direccion`='$domiciliosalones',
                                                    `rela_localidad_direccion`=$localidadsalones 
                                                    WHERE id_direccion = $IDdireccionAlojamiento ");
            // echo "se actualiza la localidad /// ";
            $sqlDireccion->execute();
        }

        /*----------------SE ACTUALIZA EL ESTADO------------------*/

        if ($estadoAlojamiento == 0) {
            // echo "no se actualiza el estado cuando es null /// ";
        } else {
            $sqlEstado = $conexionBD->prepare("UPDATE `estado_actividad` SET `rela_tipo_estado`=$estadoAlojamiento
                                                    WHERE id_estado = $IDestadoAlojamiento");
            // echo "se actualiza el estado   ///";
            $sqlEstado->execute();
        }

        /*----------------SE ACTUALIZA LA RAZON SOCIAL------------------*/

        $sqlRazonSocial = $conexionBD->prepare("UPDATE `razon_social` SET `descripcion_razon_social`='$razonsocialAlojamiento' 
                                                WHERE id_razon_social = $IDRazonSocialAlojamiento");
        $sqlRazonSocial->execute();

        /*----------------SE ACTUALIZA EL CONTACTO telefono------------------*/

        $asociativo = array_combine($alojamientoIDtelefono, $telefonoAlojamiento);

        foreach ($asociativo as $indice => $valor) {

            $sqlContacto = $conexionBD->prepare("UPDATE `contacto` SET `descripcion_contacto`='$valor'
                WHERE id_contacto = $indice");
            $sqlContacto->execute();
            // print_r($sqlContacto);
        }

        // if ($telefonoAlojamiento == "") {
        //     $telefonoAlojamiento = "No se registró";
        //     $sqlContacto = $conexionBD->prepare("UPDATE `contacto` SET `descripcion_contacto`='$telefonoAlojamiento'
        //                                             WHERE id_contacto = $alojamientoIDtelefono");
        //     $sqlContacto->execute();
        // } else {
        //     $sqlContacto = $conexionBD->prepare("UPDATE `contacto` SET `descripcion_contacto`=$telefonoAlojamiento
        //                                                 WHERE id_contacto = $alojamientoIDtelefono");
        //     $sqlContacto->execute();
        // }



        /*----------------SE ACTUALIZA EL CONTACTO  telefono fijo------------------*/

        if ($telefonoFijoAlojamiento == "") {
            $telefonoFijoAlojamiento = "No se registró";

            $sqlFijo = $conexionBD->prepare("UPDATE `contacto` SET `descripcion_contacto`= '$telefonoFijoAlojamiento'
                                                    WHERE id_contacto = $alojamientoIDtelefonoFijo");
            $sqlFijo->execute();
        } else {
            $sqlFijo = $conexionBD->prepare("UPDATE `contacto` SET `descripcion_contacto`= $telefonoFijoAlojamiento
                                                    WHERE id_contacto = $alojamientoIDtelefonoFijo");
            $sqlFijo->execute();
        }



        /*----------------SE ACTUALIZA EL CONTACTO correo------------------*/

        $sqlCorreo = $conexionBD->prepare("UPDATE `contacto` SET `descripcion_contacto`='$correoAlojamiento'
                                                    WHERE id_contacto = $alojamientoIDcorreo");
        $sqlCorreo->execute();

        /*----------------SE ACTUALIZA EL CONTACTO facebook ------------------*/

        $sqlFacebook = $conexionBD->prepare("UPDATE `contacto` SET `descripcion_contacto`='$facebookAlojamiento'
                                                    WHERE id_contacto = $alojamientoIDfacebook");
        $sqlFacebook->execute();

        /*----------------SE ACTUALIZA EL CONTACTO Instagram ------------------*/

        $sqlInstagram = $conexionBD->prepare("UPDATE `contacto` SET `descripcion_contacto`='$instagramAlojamiento'
                                                    WHERE id_contacto = $alojamientoIDinstagram");
        $sqlInstagram->execute();

        /*----------------SE ACTUALIZA EL CONTACTO  twitter------------------*/

        $sqlTwitter = $conexionBD->prepare("UPDATE `contacto` SET `descripcion_contacto`='$twitterAlojamiento'
                                                    WHERE id_contacto = $alojamientoIDtwitter");
        $sqlTwitter->execute();

        /*----------------SE ACTUALIZA EL CONTACTO  sitio web------------------*/

        $sqlWeb = $conexionBD->prepare("UPDATE `contacto` SET `descripcion_contacto`='$webAlojamiento'
                                                    WHERE id_contacto = $alojamientoIDweb");
        $sqlWeb->execute();

        /*----------------SE ACTUALIZA EL CONTACTO otro------------------*/

        $sqlOtro = $conexionBD->prepare("UPDATE `contacto` SET `descripcion_contacto`='$otroAlojamiento'
                                                    WHERE id_contacto = $alojamientoIDotro ");
        $sqlOtro->execute();

        /*----------------SE ACTUALIZA EL SERVICIO------------------*/

        $sqlOtro = $conexionBD->prepare("UPDATE `servicios_alojamiento` SET `cantidad_total_hab`=$cantTotalAlojamiento,`cantidad_hab_single`=$singleAlojamiento,
                                                                                    `cantidad_hab_doble`=$dobleAlojamiento,`cantidad_hab_matrimoniales`=$matrimonialAlojamiento,
                                                                                    `cantidad_hab_triple`=$tripleAlojamiento,`cantidad_hab_cuadruple`=$cuadrupleAlojamiento,
                                                                                    `apartamento_alojamiento`='$apartamentoAlojamiento',`otros_servicios`='$otroServicioAlojamiento',
                                                                                    `wifi_alojamiento`='$wifiAlojamiento',`estacionamiento_alojamiento`='$estacionamientoAlojamiento',
                                                                                    `desayuno_alojamiento`='$desayunoAlojamiento',`piscina_alojamiento`='$piscinaAlojamiento',
                                                                                    `cantidad_plazas`= $cantTotalPlazasAlojamiento
                                                                                WHERE id_servicio_alojamiento = $IDservicios ");
        $sqlOtro->execute();

        /*----------------SE ACTUALIZA EL SERVICIO COMPLEMENTARIO------------------*/

        $sqlOtro = $conexionBD->prepare("UPDATE `serv_complemetarios_alojamiento` SET `cantidad_salones`=$seminariosalones,`capacidad_salones`='$congresosalones',
                                                                                                `wifi_salones`='$eventoSocialsalones',`estacionamiento_salones`='$salonsalones',
                                                                                                `otros_servicio_salones`='$reunionsalones' 
                                                                                        WHERE `id_serv_comple_alojamiento`=$IDserviciosComplementarios");
        $sqlOtro->execute();
    }

    public function buscarSelectTipoAlojamiento()
    {

        $conexionBD = BD::crearInstancia();


        $sqlTipoAlojamiento = $conexionBD->query("SELECT id_tipo_alojamiento, `descripcion_tipo_alojamiento`
                                                         FROM tipo_alojamiento");

        $sqlTipoAlojamiento->execute();

        return $sqlTipoAlojamiento->fetchAll(PDO::FETCH_OBJ);
    }
    public function buscarSelectLocalidad()
    {

        $conexionBD = BD::crearInstancia();


        $sqlLocalidad = $conexionBD->query("SELECT id_localidad, `nombre_localidad`, rela_provincia, rela_departamento
                                                   FROM localidad");

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

    public function buscarSelectRubro()
    {

        $conexionBD = BD::crearInstancia();


        $sqlRubro = $conexionBD->query("SELECT `id_rubro_alojamiento`, `descripcion_rubro` 
                                               FROM `rubro_alojamiento`");

        $sqlRubro->execute();

        return $sqlRubro->fetchAll(PDO::FETCH_OBJ);
    }

    public function buscarSelecthabilitacion()
    {

        $conexionBD = BD::crearInstancia();


        $sqlRubro = $conexionBD->query("SELECT `id_habi_municipal`, `descripcion` 
                                               FROM `habilitacion_municipal`");

        $sqlRubro->execute();

        return $sqlRubro->fetchAll(PDO::FETCH_OBJ);
    }

    public function buscarInsertar($idAlojamiento)
    {

        $conexionBD = BD::crearInstancia();

        $sql = $conexionBD->query("SELECT alojamientos.id_alojamientos,alojamientos.descripcion_alojamientos,alojamientos.cuit_alojamiento,
            alojamientos.idoneo_alojamiento,alojamientos.estrella_alojamiento,
            alojamientos.fecha_edit_alojamiento,
            razon_social.id_razon_social,razon_social.descripcion_razon_social,
            direccion.id_direccion,direccion.calle_direccion,
            estado_actividad.id_estado,estado_actividad.rela_tipo_estado,
            tipo_estado.descripcion_tipo_estado,
            departamentos_fsa.descripcion_departamentos,
            rubro_alojamiento.descripcion_rubro,
            localidad.nombre_localidad,
            tipo_alojamiento.descripcion_tipo_alojamiento,
              tipo_alojamiento.id_tipo_alojamiento,
              servicios_alojamiento.id_servicio_alojamiento,servicios_alojamiento.`cantidad_plazas`,
              servicios_alojamiento.`cantidad_total_hab`, servicios_alojamiento.`cantidad_hab_single`,
              servicios_alojamiento.`cantidad_hab_doble`, servicios_alojamiento.`cantidad_hab_matrimoniales`, servicios_alojamiento.`cantidad_hab_triple`,
              servicios_alojamiento.`cantidad_hab_cuadruple`, servicios_alojamiento.`apartamento_alojamiento`, servicios_alojamiento.`otros_servicios`,
              servicios_alojamiento.`wifi_alojamiento`, servicios_alojamiento.`estacionamiento_alojamiento`, servicios_alojamiento.`desayuno_alojamiento`,
              servicios_alojamiento.`piscina_alojamiento`,
              serv_complemetarios_alojamiento.cantidad_salones,   serv_complemetarios_alojamiento.`capacidad_salones`,serv_complemetarios_alojamiento.`wifi_salones`,
              serv_complemetarios_alojamiento.`estacionamiento_salones`, serv_complemetarios_alojamiento.`otros_servicio_salones`,
              serv_complemetarios_alojamiento.id_serv_comple_alojamiento,
              habilitacion_municipal.id_habi_municipal, habilitacion_municipal.descripcion
              
            FROM `alojamientos`
            INNER JOIN razon_social on razon_social.id_razon_social = alojamientos.rela_razon_social_alo
            INNER JOIN direccion ON alojamientos.rela_alojamiento_direccion = direccion.id_direccion
            INNER JOIN localidad on localidad.id_localidad = direccion.rela_localidad_direccion
            INNER JOIN estado_actividad on estado_actividad.rela_estado_salones = alojamientos.id_alojamientos
            INNER JOIN tipo_estado on tipo_estado.id_tipo_estado = estado_actividad.rela_tipo_estado
            INNER JOIN departamentos_fsa on localidad.rela_departamento = departamentos_fsa.id_departamentos_fsa
            INNER JOIN rubro_alojamiento on rubro_alojamiento.id_rubro_alojamiento = alojamientos.rela_alojamiento_rubro
            INNER JOIN tipo_alojamiento on tipo_alojamiento.id_tipo_alojamiento = alojamientos.rela_tipo_alojamiento_aloja
            INNER JOIN servicios_alojamiento on servicios_alojamiento.id_servicio_alojamiento = alojamientos.rela_aloja_servicios
            INNER JOIN serv_complemetarios_alojamiento on serv_complemetarios_alojamiento.id_serv_comple_alojamiento =
            alojamientos.rela_aloja_serv_adicionales
            INNER JOIN habilitacion_municipal on alojamientos.rela_habilitaciones = habilitacion_municipal.id_habi_municipal

                        
            WHERE alojamientos.id_alojamientos =$idAlojamiento");

        //recuperamos los datos y los retornamos

        $sql->execute();



        return $sql->fetch(PDO::FETCH_OBJ); //este return se va a llamar en el controlador_agencia.php clase inicio

    }
}

class ContactosSalones
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

    public function consultarTelefonos($id_alojamientos)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto, contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 2
                                            and contacto.rela_contacto_salones = $id_alojamientos");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarTelefonosFijos($id_alojamientos)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto, contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 9
                                            and contacto.rela_contacto_salones = $id_alojamientos");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarCorreo($id_alojamientos)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto, contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 1
                                            and contacto.rela_contacto_salones = $id_alojamientos");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarFacebook($id_alojamientos)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto, contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 4
                                            and contacto.rela_contacto_salones = $id_alojamientos");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarInstagram($id_alojamientos)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto, contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 5
                                            and contacto.rela_contacto_salones = $id_alojamientos");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarTwitter($id_alojamientos)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto, contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 6
                                            and contacto.rela_contacto_salones = $id_alojamientos");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarWeb($id_alojamientos)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto, contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 7
                                            and contacto.rela_contacto_salones = $id_alojamientos");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }

    public function consultarOtro($id_alojamientos)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto, contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 8
                                            and contacto.rela_contacto_salones = $id_alojamientos");

        $consulta->execute();

        return $consulta->fetch(PDO::FETCH_OBJ);
    }
}

class ContactosInfo
{
    public $telefonoAlojamientoInfo;
    public $telefonoFijoAlojamiento;
    public $correoAlojamiento;
    public $facebookAlojamiento;
    public $instagramAlojamiento;
    public $twitterAlojamiento;
    public $webAlojamiento;
    public $otroAlojamiento;

    private $BD;


    public function __construct()
    {
        require_once("conexion.php");
        $this->BD = BD::crearInstancia();

        $this->telefonoAlojamientoInfo = array();
        $this->telefonoFijoAlojamiento = array();
        $this->correoAlojamiento = array();
        $this->facebookAlojamiento = array();
        $this->instagramAlojamiento = array();
        $this->twitterAlojamiento = array();
        $this->webAlojamiento = array();
        $this->otroAlojamiento = array();
    }

    public function consultarTelefonos($id_alojamiento)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT id_contacto, contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 2
                                            and contacto.rela_contacto_salones = $id_alojamiento");

        while ($filas = $consulta->fetch(PDO::FETCH_ASSOC)) {
            $this->telefonoAlojamientoInfo[] = $filas;
        }
        return $this->telefonoAlojamientoInfo;
    }

    public function consultarTelefonosFijos($id_alojamiento)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 9
                                            and contacto.rela_contacto_salones = $id_alojamiento");

        while ($filas = $consulta->fetch(PDO::FETCH_ASSOC)) {
            $this->telefonoFijoAlojamiento[] = $filas;
        }
        return $this->telefonoFijoAlojamiento;
    }

    public function consultarCorreo($id_alojamiento)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 1
                                            and contacto.rela_contacto_salones = $id_alojamiento");

        while ($filas = $consulta->fetch(PDO::FETCH_ASSOC)) {
            $this->correoAlojamiento[] = $filas;
        }
        return $this->correoAlojamiento;
    }

    public function consultarFacebook($id_alojamiento)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 4
                                            and contacto.rela_contacto_salones = $id_alojamiento");

        while ($filas = $consulta->fetch(PDO::FETCH_ASSOC)) {
            $this->facebookAlojamiento[] = $filas;
        }
        return $this->facebookAlojamiento;
    }

    public function consultarInstagram($id_alojamiento)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 5
                                            and contacto.rela_contacto_salones = $id_alojamiento");

        while ($filas = $consulta->fetch(PDO::FETCH_ASSOC)) {
            $this->instagramAlojamiento[] = $filas;
        }
        return $this->instagramAlojamiento;
    }

    public function consultarTwitter($id_alojamiento)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 6
                                            and contacto.rela_contacto_salones = $id_alojamiento");

        while ($filas = $consulta->fetch(PDO::FETCH_ASSOC)) {
            $this->twitterAlojamiento[] = $filas;
        }
        return $this->twitterAlojamiento;
    }

    public function consultarWeb($id_alojamiento)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 7
                                            and contacto.rela_contacto_salones = $id_alojamiento");

        while ($filas = $consulta->fetch(PDO::FETCH_ASSOC)) {
            $this->webAlojamiento[] = $filas;
        }
        return $this->webAlojamiento;
    }

    public function consultarOtro($id_alojamiento)
    {
        $conexionBD = BD::crearInstancia();
        $consulta = $conexionBD->query(" SELECT contacto.descripcion_contacto 
                                            FROM contacto 
                                            WHERE contacto.rela_tipo_contacto_cont = 8
                                            and contacto.rela_contacto_salones = $id_alojamiento");

        while ($filas = $consulta->fetch(PDO::FETCH_ASSOC)) {
            $this->otroAlojamiento[] = $filas;
        }
        return $this->otroAlojamiento;
    }
}

class estadistica
{


    public function cantidadHotel()
    {

        $conexionBD = BD::crearInstancia();


        $sqlestadistica = $conexionBD->query("SELECT COUNT(*) conteo 
                                                        FROM `alojamientos` 
                                                        WHERE alojamientos.rela_tipo_alojamiento_aloja = 1");

        $sqlestadistica->execute();

        return $sqlestadistica->fetchAll(PDO::FETCH_OBJ);
    }

    public function cantidadHotelPlazas()
    {

        $conexionBD = BD::crearInstancia();


        $sqlestadistica = $conexionBD->query("SELECT SUM(servicios_alojamiento.cantidad_plazas) conteo 
                                                        FROM servicios_alojamiento
                                                        INNER JOIN alojamientos ON servicios_alojamiento.id_servicio_alojamiento = alojamientos.rela_aloja_servicios
                                                        WHERE alojamientos.rela_tipo_alojamiento_aloja = 1");

        $sqlestadistica->execute();

        return $sqlestadistica->fetchAll(PDO::FETCH_OBJ);
    }

    public function cantidadCabaña()
    {

        $conexionBD = BD::crearInstancia();


        $sqlestadistica = $conexionBD->query("SELECT COUNT(*) conteo 
                                                        FROM `alojamientos` 
                                                        WHERE alojamientos.rela_tipo_alojamiento_aloja = 2");

        $sqlestadistica->execute();

        return $sqlestadistica->fetchAll(PDO::FETCH_OBJ);
    }

    public function cantidadCabañaPlazas()
    {

        $conexionBD = BD::crearInstancia();


        $sqlestadistica = $conexionBD->query("SELECT SUM(servicios_alojamiento.cantidad_plazas) conteo 
                                                        FROM servicios_alojamiento
                                                        INNER JOIN alojamientos ON servicios_alojamiento.id_servicio_alojamiento = alojamientos.rela_aloja_servicios
                                                        WHERE alojamientos.rela_tipo_alojamiento_aloja = 2");

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
