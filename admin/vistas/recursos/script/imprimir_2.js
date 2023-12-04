var boton = document.getElementById("boton"); //obtenemos el boton
var tabla = document.getElementById("tabla"); //obtenemos la tabla
var checks = document.querySelectorAll(".valores"); //obtenemos todas las clases valores que van a ser recorridos

$(document).ready(() => {
  $("th").hover(
    function () {
      let indiceColumna = $(this).parent().children().index(this);
      $(this).addClass("resaltar");

      $(`table td:nth-child(${indiceColumna + 1})`).addClass("resaltar");
    },
    function () {
      $("table tr").children().removeClass("resaltar");
    }
  );

  $("th").click(function () {
    $(this).hide();

    let indiceColumna = $(this).parent().children().index(this);

    $(`table td:nth-child(${indiceColumna + 1})`).hide();
  });
});
