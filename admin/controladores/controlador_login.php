<?php

    //session_start();
    include_once("modelos/login.php");
    include_once("conexion.php");
    //print_r($_POST);
    class ControladorLogin{

        public function index(){

            //if (isset($_SESSION['login'])) {
                //header('Location: /index2.php');
                //include_once("inicio_login.php");
            //}
            //echo"hola";

 
        }


        public function login(){

            $modelo = new ModeloLogin();

            if ($_POST) {
                $usuario= $_POST['usuario'];

                $contraseña= $_POST['contraseña'];

                $consulta = $modelo->login($usuario,$contraseña);

                if ($consulta) {
                    $_SESSION['login'] = $usuario;
                    header('location: ../index.php?page=admin');
                }else {
                    echo "no coinciden la contraseña o el usuario";
                    header('location: ../index.php');
                }
                
            }
        }

    }


?>