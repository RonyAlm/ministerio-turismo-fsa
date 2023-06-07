// document.addEventListener("DOMContentLoaded", function () {
//   const addButton = document.querySelector(".btn-primary");
//   // Selecciona todos los checkboxes de asistencia
//   const checkboxes = document.querySelectorAll(
//     'input[type="checkbox"][name="asistencia[]"]'
//   );
//   // Agrega un EventListener a cada checkbox
//   checkboxes.forEach(function (checkbox) {
//     checkbox.addEventListener("click", function () {
//       // Obtiene el id del checkbox
//       const checkboxId = checkbox.getAttribute("id");
//       const isChecked = checkbox.checked;

//       // Verifica si el checkbox está marcado o desmarcado
//       const estado = isChecked ? "Presente" : "Ausente";

//       // Realizar acciones adicionales según el estado y el ID del checkbox
//       // Por ejemplo, puedes realizar una solicitud AJAX para actualizar la base de datos
//       $.ajax({
//         type: "POST",
//         url: "?controlador=cursos_capacitaciones&accion=checkbox",
//         data: { checkboxId: checkboxId, isChecked: isChecked },
//         success: function (response) {
//           console.log("La información se envió por POST");
//           console.log("Datos enviados ID: " + checkboxId);
//           console.log("Datos enviados Estado: " + estado);
//           location.reload();
//         },
//       });
//     });
//   });
// });

// document.addEventListener("DOMContentLoaded", function () {
//   const addButton = document.querySelector(".btn-primary");
//   // Selecciona todos los checkboxes de asistencia
//   const checkboxes = document.querySelectorAll(
//     'input[type="checkbox"][name="asistencia[]"]'
//   );
//   // Agrega un EventListener a cada checkbox
//   checkboxes.forEach(function (checkbox) {
//     checkbox.addEventListener("click", function () {
//       // Obtiene el id del checkbox
//       const checkboxId = checkbox.getAttribute("id");
//       const isChecked = checkbox.checked;

//       // Verifica si el checkbox está marcado o desmarcado
//       const estado = isChecked ? "Presente" : "Ausente";

//       // Guardar el estado del checkbox en el almacenamiento local
//       localStorage.setItem(checkboxId, isChecked);

//       // Realizar acciones adicionales según el estado y el ID del checkbox
//       // Por ejemplo, puedes realizar una solicitud AJAX para actualizar la base de datos
//       $.ajax({
//         type: "POST",
//         url: "?controlador=cursos_capacitaciones&accion=checkbox",
//         data: { checkboxId: checkboxId, isChecked: isChecked },
//         success: function (response) {
//           console.log("La información se envió por POST");
//           console.log("Datos enviados ID: " + checkboxId);
//           console.log("Datos enviados Estado: " + estado);
//           // location.reload();
//         },
//       });
//     });

//     // Verificar y establecer el estado del checkbox al cargar la página
//     const checkboxId = checkbox.getAttribute("id");
//     const storedValue = localStorage.getItem(checkboxId);
//     const isChecked = storedValue === "true"; // Convertir el valor almacenado a booleano
//     checkbox.checked = isChecked;
//     const estado = isChecked ? "Presente" : "Ausente";
//     console.log("ID del checkbox: " + checkboxId);
//     console.log("Estado del checkbox: " + estado);
//   });
// });
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
