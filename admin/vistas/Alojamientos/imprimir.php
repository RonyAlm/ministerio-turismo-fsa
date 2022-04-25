<form action="">
    <!-- <//?php// foreach ($inicioAlojamiento as $alojamiento) { ?> -->
    <p>
        <label for="localidad">localidad</label>
        <input type="checkbox" value="localidad" name="temas" id="localidad" class="valores">
    </p>

    <p>
        <label for="provincia">provincia</label>
        <input type="checkbox" value="provincia" name="temas" id="provincia" class="valores">

    </p>
    <p>
        <label for="pais">pais</label>
        <input type="checkbox" value="pais" name="temas" id="pais" class="valores">

    </p>

    <p>
        <button type="button" id="boton">mostrar valores seleccionados</button>
    </p>

    <!-- <//?php } ?> -->

</form>

<!-- <div class="container">
    <div class="row">
        <div class="col-lg-12">
            <table id="example1" class="table table-bordered table-striped" cellspacing="0" width="100%">
                <thead>
                    <tr style="background: linear-gradient(to right, #61ba6d, #83c331)" align="center">

                        <th>Localidad</th>
                        <th>Categoría</th>
                        <th>Designacion Comercial</th>
                        <th>Contacto</th>
                        <th>Dirección</th>
                        <th>Estado</th>


                    </tr>
                </thead>
                <tbody>


                    <?php foreach ($inicioAlojamiento as $alojamiento) { ?>

                        <tr>

                            <td><?php echo $alojamiento["nombre_localidad"]; ?></td>
                            <td><?php echo $alojamiento["descripcion_tipo_alojamiento"]; ?></td>
                            <td><?php echo $alojamiento["descripcion_alojamientos"]; ?></td>
                            <td><?php echo $alojamiento["descripcion_contacto"]; ?></td>
                            <td><?php echo $alojamiento["calle_direccion"]; ?></td>
                            <?php if ($alojamiento["descripcion_tipo_estado"] == "Activo") { ?>
                                <td class="badge badge-success"><?php echo $alojamiento["descripcion_tipo_estado"]; ?></td>
                            <?php } ?>
                            <?php if ($alojamiento["descripcion_tipo_estado"] == "Falta Verificar") { ?>
                                <td class="badge badge-warning"><?php echo $alojamiento["descripcion_tipo_estado"]; ?></td>
                            <?php } ?>
                            <?php if ($alojamiento["descripcion_tipo_estado"] == "Baja") { ?>
                                <td class="badge badge-danger"><?php echo $alojamiento["descripcion_tipo_estado"]; ?></td>
                            <?php } ?>
                            <?php if ($alojamiento["descripcion_tipo_estado"] == "Centro de aislamiento") { ?>
                                <td class="badge badge-secondary"><?php echo $alojamiento["descripcion_tipo_estado"]; ?></td>
                            <?php } ?>
                            <?php if ($alojamiento["descripcion_tipo_estado"] == "Cambio de domicilio") { ?>
                                <td class="badge bg-lime"><?php echo $alojamiento["descripcion_tipo_estado"]; ?></td>
                            <?php } ?>
                            <?php if ($alojamiento["descripcion_tipo_estado"] == "Se desconoce situación") { ?>
                                <td class="badge bg-orange"><?php echo $alojamiento["descripcion_tipo_estado"]; ?></td>
                            <?php } ?>
                            <?php if ($alojamiento["descripcion_tipo_estado"] == "Cierre temporario") { ?>
                                <td class="badge bg-purple"><?php echo $alojamiento["descripcion_tipo_estado"]; ?></td>
                            <?php } ?>
                            <?php if ($alojamiento["descripcion_tipo_estado"] == "No Fiscalizadas") { ?>
                                <td class="badge bg-navy"><?php echo $alojamiento["descripcion_tipo_estado"]; ?></td>
                            <?php } ?>
                            <?php if ($alojamiento["descripcion_tipo_estado"] == "Domicilio Virtual") { ?>
                                <td class="badge bg-info"><?php echo $alojamiento["descripcion_tipo_estado"]; ?></td>
                            <?php } ?>



                        </tr>


                    <?php } ?>
                </tbody>
            </table>
        </div>
    </div>
</div> -->

<h2>Valores seleccionados</h2>
<table id="tabla" class="table border">

    <thead>
        <th>localidad</th>
        <th>provincia</th>
        <th>pais</th>
    </thead>
    <tbody>
        <tr>
            <td>1</td>
            <td>2</td>
            <td>3</td>
        </tr>
    </tbody>

</table>