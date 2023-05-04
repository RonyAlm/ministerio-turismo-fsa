<?php
class PaginasModelo
{

    public function crear($nuevaTarea)
    {

        $conexionBD = BD::crearInstancia();

        /*-------- INSERTAMOS LA NUEVA TAREA--------*/

        $sql = $conexionBD->prepare("INSERT INTO `tareas`(`descripcion_tareas`) VALUES (?)");
        $sql->execute(array($nuevaTarea));

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
        $sql = $conexionBD->prepare("SELECT * FROM `tareas`");

        $sql->execute();

        return $sql->fetch(PDO::FETCH_OBJ);
    }
}
