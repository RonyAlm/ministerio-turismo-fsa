<?php
class BD
{
    private static $instancia = NULL;

    public static function crearInstancia()
    {
        if (!isset(self::$instancia)) {
            $opcionesPDO[PDO::ATTR_ERRMODE] = PDO::ERRMODE_EXCEPTION;

<<<<<<< HEAD

            self::$instancia = new PDO('mysql:host=localhost; dbname=mintur', 'root', '', $opcionesPDO);
            //echo "conexion realizada";
            bd::$instancia->exec("SET CHARACTER SET utf8");
=======
            self::$instancia = new PDO('mysql:host=localhost; dbname=turismo', 'root', '', $opcionesPDO);
            self::$instancia->exec("SET CHARACTER SET utf8");
>>>>>>> develop
        }
        return self::$instancia;
    }

    public static function iniciarTransaccion()
    {
        self::$instancia->beginTransaction();
    }

    public static function confirmarTransaccion()
    {
        self::$instancia->commit();
    }

    public static function revertirTransaccion()
    {
        if (self::$instancia->inTransaction()) {
            self::$instancia->rollBack();
        }
    }
}
