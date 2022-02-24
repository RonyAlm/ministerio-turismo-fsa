$(document).ready(function () {
  let $provincia = document.querySelector("#provincia");
  let $localidad = document.querySelector("#localidad");

  function cargarProvincia() {
    $.ajax({
      type: "GET",
      url: "vistas/includes/get_provincia.php",
      data: "",
      datatype: "",
      success: function (response) {
        console.log(response);
      },
    });
  }
  cargarProvincia();
});
