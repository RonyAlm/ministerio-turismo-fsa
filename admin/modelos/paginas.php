<?php
class PaginasModelo
{
    public $listaAgencia;
    public $consultartarea;
    public $listaAgenciaID;
    public $listaBuscar;


    public function __construct()
    {
        $this->listaAgencia = array();
        $this->consultartarea = array();
        $this->listaAgenciaID = array();
        $this->listaBuscar = array();
    }

    public function crear($nuevaTarea)
    {

        $conexionBD = BD::crearInstancia();

        /*-------- INSERTAMOS LA NUEVA TAREA--------*/

        $sql = $conexionBD->prepare("INSERT INTO `tareas`(`descripcion_tareas`,checkbox_tareas) VALUES (?,?)");
        $sql->execute(array($nuevaTarea, 0));

        $lastInsertID = $conexionBD->lastInsertId();

        return $lastInsertID; // devuelve el ID de la tarea insertada
    }

    public function actualizar($idTarea, $checkbox)
    {
        $conexionBD = BD::crearInstancia();
        $sql = $conexionBD->prepare("UPDATE `tareas` SET `checkbox_tareas`=$checkbox WHERE id_tareas =$idTarea");
        $sql->execute();
    }



    public function consultar()
    {

        $conexionBD = BD::crearInstancia();

        $sql = $conexionBD->query("SELECT * FROM `tareas`");

        //recuperamos los datos y los retornamos

        while ($filas = $sql->fetch(PDO::FETCH_ASSOC)) {
            $this->consultartarea[] = $filas;
        }
        return $this->consultartarea; //este return se va a llamar en el controlador_alojamiento.php clase inicio

    }

    public function consultarTimeLine()
    {

        $conexionBD = BD::crearInstancia();

        $sql = $conexionBD->query("SELECT DATE(fecha) as fechas, time(fecha) as hora, tabla, `accion`,  `old_value`, `new_value`, u.usuario FROM `auditoria` INNER JOIN usuario_contra u on u.id_usuario = auditoria.usuario_id 
        ORDER BY `auditoria`.`fecha` DESC");

        //recuperamos los datos y los retornamos

        while ($filas = $sql->fetch(PDO::FETCH_ASSOC)) {
            $this->listaAgencia[] = $filas;
        }
        return $this->listaAgencia; //este return se va a llamar en el controlador_alojamiento.php clase inicio

    }
}
