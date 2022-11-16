$(function () {
  // Clona la fila oculta que tiene los campos base, y la agrega al final de la tabla
  // $("#adicional").on("click", function () {
  //   $("#celu").clone().appendTo("#celu");
  // });
  var c = 2;
  $("#adicional1").on("click", function () {
    var clonCelu = $("#hora").clone();
    clonCelu.children("div").hidden = true;
    clonCelu.children("input").value = " ";
    clonCelu.children("label").innerText = " " + c;
    c++;
    clonCelu.appendTo(".horarios");
    console.log(clonCelu.children("input")[0]);
  });

  // Evento que selecciona la fila y la elimina
  $(document).on("click", ".eliminar", function () {
    var parent = $(this).parents().get(0);
    $(parent).remove();
  });
});
