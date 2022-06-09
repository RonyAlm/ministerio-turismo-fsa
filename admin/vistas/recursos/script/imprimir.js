var boton = document.getElementById("boton"); //obtenemos el boton
var tabla = document.getElementById("tabla"); //obtenemos la tabla
var checks = document.querySelectorAll(".valores"); //obtenemos todas las clases valores que van a ser recorridos

boton.addEventListener("click", function () {
  tabla.innerHTML = ""; //receteamos la tabla para que no se agreguen varios imput
  checks.forEach((e) => {
    // console.log(e.value);
    //recorremos la variable checks
    if (e.checked == true) {
      // console.log(e.value);
      //   //hacemos una validacion para saber obtener los valores que han sido tildados
      var elemento = document.createElement("th");
      elemento.className = "table table-bordered table-striped";
      elemento.innerHTML = e.value; //e son los elementos y value son los values de nuestros imput
      tabla.appendChild(elemento);
    }
  });
});
