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
  cargarProvincia();

  function cargarLocalidad(llamarDatos) {
    $.ajax({
      url: "vistas/includes/get_provincia.php",
      type: "POST",
      data: llamarDatos,
      success: function (response) {},
    });
  }

  $provincia.addEventListener("change", function () {
    const idProvincia = $provincia.value;
    // console.log(idProvincia);
    // hola hice un comentario
    const llamarDatos = {
      idProvincia: idProvincia,
    };
    cargarLocalidad(llamarDatos);
  });
});
