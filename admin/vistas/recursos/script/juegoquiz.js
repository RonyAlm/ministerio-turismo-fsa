document.addEventListener("DOMContentLoaded", function () {
  const radios = document.querySelectorAll('input[type="radio"]');

  radios.forEach(function (radio) {
    radio.addEventListener("change", function () {
      const preguntaId = radio.getAttribute("name").match(/\[(\d+)\]/)[1];
      const valorRespuesta = radio.value;

      const xhttp = new XMLHttpRequest();
      xhttp.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
          console.log("La información se envió por POST");
          console.log("Datos enviados ID: " + preguntaId);
          console.log("Datos enviados Respuesta: " + valorRespuesta);
          // location.reload();
        }
      };

      xhttp.open("POST", "?controlador=paginas&accion=juego", true);
      xhttp.setRequestHeader("Content-Type", "application/json");
      xhttp.send(JSON.stringify({ [preguntaId]: valorRespuesta }));
    });

    const storedValue = localStorage.getItem(radio.id);
    const isChecked = storedValue === "true";
    radio.checked = isChecked;
    console.log("ID del radio: " + radio.id);
    console.log("Estado del radio: " + isChecked);

    if (isChecked) {
      radio.parentNode.classList.add("checked");
    } else {
      radio.parentNode.classList.remove("checked");
    }
  });
});
