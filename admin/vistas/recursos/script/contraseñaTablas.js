const togglePassword = document.querySelector("#togglePasswordtablas");
const password = document.querySelector("#inputPasswordtablas");

togglePassword.addEventListener("click", function (e) {
  const type =
    password.getAttribute("type") === "password" ? "text" : "password";
  password.setAttribute("type", type);
  this.classList.toggle("fa-eye-slash");
});
const togglePassword1 = document.querySelector("#togglePasswordtablas1");
const password1 = document.querySelector("#inputPasswordtablas1");

togglePassword1.addEventListener("click", function (e) {
  const type =
    password1.getAttribute("type") === "password" ? "text" : "password";
  password1.setAttribute("type", type);
  this.classList.toggle("fa-eye-slash");
});

$(document).ready(function () {
  $("#usuario").change(function () {
    recargarModal();
  });
});
function recargarModal() {
  // Obtener el valor seleccionado del select
  var id_personalesA = $("#usuario").val();
  // Realizar una solicitud AJAX para obtener nuevos datos
  $.ajax({
    type: "POST",
    url: "/ministerio-turismo-fsa/admin/vistas/personal/rellenarusuariocontraseña.php",
    data: { id_personalesA: id_personalesA },
    success: function (r) {
      console.log("La información se envió por POST");
      console.log("Datos enviados: " + JSON.stringify(id_personalesA));
      console.log("Datos recibidos: " + r);
      // Parsear la respuesta JSON del archivo rellenarusuariocontraseña.php
      var datos = JSON.parse(r);

      // Actualizar el contenido del modal con los nuevos datos
      $("#inputPasswordtablas").val(datos.contraseña || "N/A");
      $("#selectRolesEditar")
        .val(datos.rela_rol_id || "N/A")
        .trigger("change");
      $("#selectTablasEditar")
        .val(datos.rela_tablas || "N/A")
        .trigger("change");
    },
  });
}

$("#modal-ejemploUsuario").on("hide.bs.modal", function () {
  document.getElementById("formularioModalUsuarioRol").reset();
  location.reload();
});
$("#modal-ejemploUsuarioEditar").on("hide.bs.modal", function () {
  document.getElementById("formularioModalEditarUsuarioRol").reset();
  location.reload();
});
