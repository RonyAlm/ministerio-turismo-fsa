<?php

    $controlador;//recuperando la solicitud por URL
    $accion;//recuperando la solicitud por URL

    //aca poner una validacion por si se ingresa a una clase que no existe
    
        include_once("controladores/controlador_".$controlador.".php");

        $objControlador="Controlador".ucfirst($controlador);// esta accediendo a la clase del controlador. ej ControladorPaginas
        $controlador = new $objControlador();

        $controlador->$accion();
    
    



?>