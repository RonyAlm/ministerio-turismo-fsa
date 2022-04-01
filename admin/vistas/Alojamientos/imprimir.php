<form action="">
    <p>
        <label for="localidad">localidad</label>
        <input type="checkbox" value="localidad" name="temas" id="localidad" class="valores">
    </p>

    <p>
        <label for="descripcion">descripcion</label>
        <input type="checkbox" value="descripcion" name="temas" id="descripcion" class="valores">
    </p>
    <p>
        <label for="descripcion">descripcion1</label>
        <input type="checkbox" value="descripcion1" name="temas" id="descripcion1" class="valores">

    </p>
    <p>
        <label for="descripcion">descripcion2</label>
        <input type="checkbox" value="descripcion2" name="temas" id="descripcion2" class="valores">
    </p>

    <div class="col-4">
        <div class="form-group">
            <label for="provincia1">Destino:</label>
            <table id="provincia1" name="provincia1" class="table border" required>

            </table>
        </div>
    </div>
    <p>
        <button type="button" id="boton">mostrar valores seleccionados</button>
    </p>

</form>

<div class="container">
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
                        <th>Acción</th>

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


                            <td class="project-actions text-right">
                                <div class="btn-group" role="group" aria-label="">

                                    <a href="?controlador=Alojamientos&accion=info&id=<?php echo $alojamiento["id_alojamientos"]; ?>" class="btn btn-primary btn-sm">
                                        <i class="fas fa-folder">
                                        </i>Más Info
                                    </a>
                                    <?php if ($rol_id == 1 or $rol_id == 3) { ?>
                                        <a href="?controlador=Alojamientos&accion=editar&id=<?php echo $alojamiento["id_alojamientos"]; ?>" <a class="btn btn-info btn-sm">
                                            <i class="fas fa-pencil-alt">
                                            </i>Editar
                                        </a>
                                        <a href="?controlador=Alojamientos&accion=borrar&id=<?php echo $alojamiento["id_alojamientos"]; ?>  &idDireccion=<?php echo $alojamiento["id_direccion"]; ?>  &idRazonSocial=<?php echo $alojamiento["id_razon_social"]; ?>  &idServicios=<?php echo $alojamiento["rela_aloja_servicios"]; ?>  &idServiciosComple=<?php echo $alojamiento["rela_aloja_serv_adicionales"]; ?>" class="btn btn-danger btn-sm">
                                            <i class="fas fa-trash">
                                            </i>Borrar
                                        </a>

                                </div>

                            </td>
                        <?php } ?>
                        </tr>


                    <?php } ?>
                </tbody>
            </table>
        </div>
    </div>
</div>

<h2>Valores seleccionados</h2>
<table id="tabla" class="table border">

</table>