$(function () {
  var c = 2;
  $("#masLicencia").on("click", function () {
    var clonCelu = $("#copiarLicencia").clone();
    clonCelu.children("div").hidden = true;
    clonCelu.children("input").value = "";
    clonCelu.children("label").innerText = "" + c;
    c++;
    clonCelu.appendTo(".masFecha");
    console.log(clonCelu.children("input"));
  });

  // Evento que selecciona la fila y la elimina
  $(document).on("click", ".eliminar", function () {
    var parent = $(this).parents().get(0);
    $(parent).remove();
  });
});

$(function () {
  var c = 2;
  $("#masArticu").on("click", function () {
    var clonCelu = $("#copiarArticulo").clone();
    clonCelu.children("div").hidden = true;
    clonCelu.children("input").value = "";
    clonCelu.children("label").innerText = "" + c;
    c++;
    clonCelu.appendTo(".masArticulos");
    console.log(clonCelu.children("input"));
  });

  // Evento que selecciona la fila y la elimina
  $(document).on("click", ".eliminar", function () {
    var parent = $(this).parents().get(0);
    $(parent).remove();
  });
});
