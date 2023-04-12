<?php

class BD
{
    private static $instancia = NULL;

    public static function crearInstancia()
    {

        if (!isset(self::$instancia)) {

            $opcionesPDO[PDO::ATTR_ERRMODE] = PDO::ERRMODE_EXCEPTION;


            self::$instancia = new PDO('mysql:host=localhost; dbname=mintur', 'root', '', $opcionesPDO);
            //echo "conexion realizada";
            bd::$instancia->exec("SET CHARACTER SET utf8");
        }
        return self::$instancia;
    }
}
