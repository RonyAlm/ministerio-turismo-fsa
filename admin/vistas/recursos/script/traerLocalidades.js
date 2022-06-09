$(document).ready(function() {

    $('#provincia').change(function() {
        // $('#otro select').find('option').remove().end().append('<option value=""></option>').val('');
        $('#provincia option:selected').each(function() {
            id_provincia = $(this).val();
            $.post("vistas/includes/get_localidades.php", { id_provincia: id_provincia },
                function(data) {
                    $("#localidad").html(data);
                });
        });
    });

});