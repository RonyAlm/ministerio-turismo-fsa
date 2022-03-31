var boton = document.getElementById("boton");
var tabla = document.getElementById("tabla");
var checks = document.querySelectorAll(".valores");

boton.addEventListener("click", function () {
  checks.forEach((e) => {
    if (e.checked == true) {
      console.log(e.value);
    }
  });
});
