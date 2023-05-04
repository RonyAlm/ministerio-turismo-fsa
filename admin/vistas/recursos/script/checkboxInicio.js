// Selecciona el checkbox
const staticCheckbox = document.querySelector("#todoCheck1");

staticCheckbox.addEventListener("click", function () {
  // Obtiene el estado actual del checkbox
  const isChecked = staticCheckbox.checked;

  // Envía el estado del checkbox al controlador mediante AJAX
  $.ajax({
    type: "POST",
    url: "?controlador=paginas&accion=inicio&checkbox=" + isChecked,
    data: { isChecked },
    success: function (response) {
      console.log("La información se envió por POST");
      console.log("Datos enviados por inicio: " + JSON.stringify(isChecked));
    },
  });
});
