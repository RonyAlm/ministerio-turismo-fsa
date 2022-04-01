<?php include_once("/xampp/htdocs/Dev/Projects/ministerio-turismo-fsa/admin/conexion.php");
    $db = BD::crearInstancia();
    $id_provincia = $_POST['id_provincia'];

    $sql = "SELECT l.* FROM localidad l 
                INNER JOIN provincia p ON p.id_provincia = l.rela_provincia
                WHERE l.rela_provincia LIKE ".$id_provincia. " ORDER BY l.nombre_localidad ASC;";
    $query = $db->query($sql);

    $html = '<option value="">Seleccionar Localidad</option>';
    echo $html;
    while ($localidad = $query->fetch(PDO::FETCH_ASSOC)) {
        // $listaPro[] = $filas;
        $html = '<option value="'.$localidad['id_localidad'].'">'.$localidad['nombre_localidad'].'</option>';
        echo $html;
    }

?>