$(function () {
  // Clona la fila oculta que tiene los campos base, y la agrega al final de la tabla
  $("#adicional").on("click", function () {
    $("#celu").clone().appendTo("#celu");
  });

  // Evento que selecciona la fila y la elimina
  $(document).on("click", ".eliminar", function () {
    var parent = $(this).parents().get(0);
    $(parent).remove();
  });
});
