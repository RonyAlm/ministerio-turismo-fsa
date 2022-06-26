$(function () {
  // Clona la fila oculta que tiene los campos base, y la agrega al final de la tabla
  // $("#adicional").on("click", function () {
  //   $("#celu").clone().appendTo("#celu");
  // });
  var c = 2;
  $("#adicional").on("click", function () {
    var clonCelu = $("#celu").clone();
    clonCelu.children("div")[0].hidden = true;
    clonCelu.children("input")[0].value = "";
    clonCelu.children("label")[0].innerText = "Teléfono Celular " + c;
    c++;
    clonCelu.appendTo(".telefonos");
    console.log(clonCelu.children("label")[0]);
  });

  // Evento que selecciona la fila y la elimina
  $(document).on("click", ".eliminar", function () {
    var parent = $(this).parents().get(0);
    $(parent).remove();
  });
});
