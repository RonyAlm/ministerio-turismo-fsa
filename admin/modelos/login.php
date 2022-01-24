<?php

    class ModeloLogin{
        

        public function login($usuario,$contraseña){


            $conexionBD= BD::crearInstancia();

            $sql= $conexionBD->prepare("SELECT `id_usuario`, `usuario`, `contraseña`, `rela_rol_id` 
                                        FROM `usuario_contra`
                                        WHERE usuario = '.$usuario.' AND contraseña = '.$contraseña.'");
            $sql->execute();

            if ($sql->fetch(PDO::FETCH_OBJ)) {
                return true;
            }else {
                return false;
            }

        }
    }

?>