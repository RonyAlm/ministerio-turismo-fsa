$(function () {

  $("#masLicencia").on("click", function () {

    let clonLic = $("#copiarLicencia").clone();
    clonLic.children()[2].firstElementChild.hidden = true;
    clonLic.children()[2].lastElementChild.hidden = false;
    clonLic.children()[0].firstElementChild.lastElementChild.value = "";
    clonLic.children()[1].firstElementChild.lastElementChild.value = "";
    clonLic.appendTo(".masFecha");
    // console.log(clonLic.children()[2].firstElementChild.hidden);

  });


  $("#masArticulo").on("click", function () {

    let clonArt = $("#copiarArticulo").clone();
    clonArt.children()[1].firstElementChild.hidden = true;
    clonArt.children()[1].lastElementChild.hidden = false;
    clonArt.children()[0].firstElementChild.lastElementChild.value = "";
    clonArt.appendTo(".masArticulos");
    // console.log(clonArt.children()[0]);

  });


  // Evento que selecciona la fila y la elimina

  $(document).on("click", ".quitarFechas", function () {
    var padre= $(this).parents().get(0);
    let eliminarParent = $(this).parents().eq(2)[0];
    $(eliminarParent).remove();
    //console.log( $(this).parents().eq(2)[0]);
  });

});

