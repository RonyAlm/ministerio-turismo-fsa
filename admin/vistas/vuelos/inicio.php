<?php

if (!isset($_SESSION['id'])) {
    header("Location: index.php");
}

$usuario = $_SESSION['usuarios'];
$rol_id = $_SESSION['rol_id'];

?>
<div class="card">
    <?php if ($rol_id == 1 or $rol_id == 3 and $usuario == "admin") { ?>
        <div class="card-header">

            <a name="" id="" class="btn btn-success" href="?controlador=transporte&accion=crear" role="button">Agregar Transporte</a>

        </div>
    <?php } ?>
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <h2 class="text-center display-4">Transportes</h2>
        </div>
        <!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <div id="calendar1">
    </div>

    <!-- Modal -->
    <!-- <div class="modal fade" id="eventModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">New Event</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="event_date">Fecha</label>
                            <input type="text" class="form-control" id="event_date" disabled>
                        </div>
                        <div class="form-group">
                            <label for="event_title">Título</label>
                            <input type="text" class="form-control" id="event_title">
                        </div>
                        <div class="form-group">
                            <label for="event_desc">Descripción</label>
                            <textarea class="form-control" id="event_desc"></textarea>
                        </div>
                        <div class="form-group">
                            <label for="event_location">Localidad</label>
                            <input type="text" class="form-control" id="event_location">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    <button type="button" class="btn btn-primary" id="saveEvent">Guardar</button>
                </div>
            </div>
        </div>
    </div> -->

    <script>
        var calendar12 = new FullCalendar.Calendar(document.getElementById('calendar12'), {
            events: 'get_events.php',
            dateClick: function(info) {
                var date = info.dateStr;
                $('#event_date').val(date);
                $('#eventModal').modal();
            }
        });
        calendar12.render();

        // Save event data to server
        $('#saveEvent').on('click', function() {
            var title = $('#event_title').val();
            var desc = $('#event_desc').val();
            var location = $('#event_location').val();
            var date = $('#event_date').val();

            // Send data to server-side script
            $.post('submit_event.php', {
                event_title: title,
                event_desc: desc,
                event_location: location,
                event_date: date
            }, function(data) {
                if (data == "success") {
                    alert("Evento guardado correctamente.");
                    $('#eventModal').modal('hide');
                    calendar.refetchEvents(); //Refresca los eventos en el calendario
                } else {
                    alert("Error al guardar evento, por favor intente de nuevo.");
                }
            });
        });
    </script>
</div>