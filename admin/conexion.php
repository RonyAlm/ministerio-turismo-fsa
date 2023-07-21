<?php
class BD
{
    private static $instancia = NULL;

    public static function crearInstancia()
    {
        if (!isset(self::$instancia)) {
            $opcionesPDO[PDO::ATTR_ERRMODE] = PDO::ERRMODE_EXCEPTION;

            self::$instancia = new PDO('mysql:host=localhost; dbname=mintur', 'root', '', $opcionesPDO);
            self::$instancia->exec("SET CHARACTER SET utf8");
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
