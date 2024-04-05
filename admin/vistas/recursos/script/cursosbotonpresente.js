document.addEventListener("DOMContentLoaded", function () {
  const checkboxes = document.querySelectorAll(
    'input[type="checkbox"][name="asistencia[]"]'
  );

  checkboxes.forEach(function (checkbox) {
    checkbox.addEventListener("click", function () {
      const checkboxId = checkbox.getAttribute("id");
      const isChecked = checkbox.checked;

      // Guardar el estado del checkbox en el almacenamiento local
      localStorage.setItem(checkboxId, isChecked);

      $.ajax({
        type: "POST",
        url: "?controlador=cursos_capacitaciones&accion=checkbox",
        data: { checkboxId: checkboxId, isChecked: isChecked },
        success: function (response) {
          console.log("La información se envió por POST");
          console.log("Datos enviados ID: " + checkboxId);
          console.log("Datos enviados Estado: " + isChecked);
          location.reload();
        },
      });
    });

    const checkboxId = checkbox.getAttribute("id");
    const storedValue = localStorage.getItem(checkboxId);
    const isChecked = storedValue === "true";
    checkbox.checked = isChecked;
    console.log("ID del checkbox: " + checkboxId);
    console.log("Estado del checkbox: " + isChecked);
    // Agregar/Quitar la clase CSS según el estado del checkbox
    if (isChecked) {
      checkbox.parentNode.classList.add("checked");
    } else {
      checkbox.parentNode.classList.remove("checked");
    }
  });
});
