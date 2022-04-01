var boton = document.getElementById("boton"); //obtenemos el boton
var tabla = document.getElementById("tabla"); //obtenemos la tabla
var checks = document.querySelectorAll(".valores"); //obtenemos todas las clases valores que van a ser recorridos
var checks1 = document.querySelector(".valores1");

boton.addEventListener("click", function () {
  tabla.innerHTML = ""; //receteamos la tabla para que no se agreguen varios imput
  checks.forEach((e) => {
    //recorremos la variable checks
    if (e.checked == true) {
      //hacemos una validacion para saber obtener los valores que han sido tildados
      var elemento = document.createElement("th");
      elemento.className = "table table-bordered table-striped";
      elemento.innerHTML = e.value; //e son los elementos y value son los values de nuestros imput
      tabla.appendChild(elemento);
      cargarProvincia();
    }
  });
});

let $provincia = document.querySelector("#provincia1");

function cargarProvincia() {
  $.ajax({
    type: "GET",
    url: "vistas/includes/get_provincia.php",
    data: "",
    datatype: "",
    success: function (response) {
      // console.log(response);
      const provincia = JSON.parse(response);
      let template =
        '<option class="form-control" selected disable>--Seleccione--</option>';
      provincia.forEach((provincia) => {
        template += `<option value = "${provincia.id_provincia}">${provincia.nombre_provincia}</option>`;
      });
      $provincia.innerHTML = template;
    },
  });
}
// cargarProvincia();
