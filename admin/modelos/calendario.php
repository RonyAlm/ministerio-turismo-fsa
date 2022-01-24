<?php
class CalendarioModelo
{

    public function consultarEventos()
    {
        $conexionBD = BD::crearInstancia();

        $sql = $conexionBD->query("SELECT * FROM `calendario`");

        $sql->execute();

        return $sql->fetchAll(PDO::FETCH_ASSOC);
    }

    public function registrarEvento($evento, $fecha, $color, $descripcion, $end)
    {
        $conexionBD = BD::crearInstancia();

        $sql = $conexionBD->prepare("INSERT INTO `calendario`(`title`, `start`, `end`,`color`, `descripcion`) 
        VALUES (?,?,?,?,?)");
        $sql->execute(array($evento, $fecha, $end, $color, $descripcion));
        $respuesta = $sql;
        if ($respuesta == true) {
            $msg = 1;
        } else {
            $msg = 0;
        }
        return $msg;
    }
    public function modificarEvento($evento, $fecha, $color, $descripcion, $id, $end)
    {
        $conexionBD = BD::crearInstancia();

        $sql = $conexionBD->prepare("UPDATE `calendario` SET `title`=?,`descripcion`=?,`start`=?,`color`=?,`end`=?
         WHERE `id_calendario`=$id");
        $sql->execute(array($evento, $descripcion, $fecha, $color, $end));
        $respuesta = $sql;
        if ($respuesta == true) {
            $msg = 1;
        } else {
            $msg = 0;
        }
        return $msg;
    }

    public function eliminarEvento($id)
    {
        $conexionBD = BD::crearInstancia();

        $sql = $conexionBD->prepare("DELETE FROM `calendario` WHERE `id_calendario`=?");
        $sql->execute(array($id));
        $respuesta = $sql;
        // print_r($respuesta);
        if ($respuesta == true) {
            $msg = 1;
            // print_r($msg);
        } else {
            $msg = 0;
            // print_r($msg);
        }
        // print_r($msg);
        return $msg;
    }

    public function dropEvento($id, $fecha, $end)
    {
        $conexionBD = BD::crearInstancia();

        $sql = $conexionBD->prepare("UPDATE `calendario` SET `start`=?,`end`=? WHERE `id_calendario`=?");
        $sql->execute(array($fecha, $end, $id));
        $respuesta = $sql;
        if ($respuesta == true) {
            $msg = 1;
        } else {
            $msg = 0;
        }
        return $msg;
    }
}
