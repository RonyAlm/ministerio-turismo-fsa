<?php
if (!isset($_SESSION['id'])) {
    header("Location: index.php");
}

$usuario = $_SESSION['usuarios'];
$rol_id = $_SESSION['rol_id'];
?>

<div class="p-5 bg-light">
    <div class="container">
        <h3 class="text-center display-5">Juego de Preguntas</h3>
        <hr class="my-2">
        <br>
        <form id="formularioPreguntasJuegos" action="?controlador=paginas&accion=juego" method="post">
            <?php foreach ($tablaPreguntas as $pregunta) { ?>
                <div class="pregunta">
                    <h3><?php echo $pregunta['pregunta']; ?></h3>

                    <?php
                    // Crear un array con las opciones
                    $opciones = array(
                        $pregunta['opcion1'],
                        $pregunta['opcion2'],
                        $pregunta['opcion3']
                    );

                    // Obtener la opción correcta
                    $opcionCorrecta = $pregunta['opcion_correcta'];

                    // Reordenar aleatoriamente las opciones
                    shuffle($opciones);

                    foreach ($opciones as $indice => $opcion) {
                        // Determinar si la opción actual es la correcta
                        $esCorrecta = ($indice + 1 === $opcionCorrecta) ? 'data-correcta' : '';

                        // Mostrar cada opción con su radio correspondiente
                        echo "<label><input type='radio' name='respuestas[{$pregunta['id']}]' value='" . ($indice + 1) . "' {$esCorrecta}/> {$opcion}</label><br>";
                    }
                    ?>

                </div>
            <?php } ?>
            <button type="submit" class="btn btn-primary">Enviar Respuestas</button>
        </form>
    </div>
</div>