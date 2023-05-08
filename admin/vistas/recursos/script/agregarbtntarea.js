const addButton = document.querySelector(".btn-primary");
// Selecciona todos los checkboxes
const checkboxes = document.querySelectorAll('input[type="checkbox"]');

// Agrega un EventListener a cada checkbox
checkboxes.forEach(function (checkbox) {
  checkbox.addEventListener("click", function () {
    // Obtiene el id del checkbox
    const checkboxId = checkbox.getAttribute("id");
    const isCheckedeado = checkbox.checked;

    // Imprime el id del checkbox en la consola
    // console.log(checkboxId);
    // console.log(isCheckedeado);
    // Envía el estado del checkbox y el ID de la tarea al controlador mediante AJAX
    $.ajax({
      type: "POST",
      url:
        "?controlador=paginas&accion=inicio&idcheckbox=" +
        checkboxId +
        "&checkboxtarea=" +
        isCheckedeado,
      data: { checkboxId, isCheckedeado },
      success: function (response) {
        console.log("La información se envió por POST");
        console.log("Datos enviados ID: " + JSON.stringify(checkboxId));
        console.log("Datos enviados boton: " + JSON.stringify(isCheckedeado));
      },
    });
  });
});

// Agrega un EventListener al botón
addButton.addEventListener("click", function () {
  // Crea un nuevo elemento "li"
  const newLi = document.createElement("li");
  newLi.classList.add("new-todo");

  // Agrega el contenido HTML al nuevo elemento "li"
  newLi.innerHTML = `
    <div class="icheck-primary d-inline ml-2">
      <input type="checkbox" value="" name="todo1" id="todoCheck1">
      <label for="todoCheck1"></label>
    </div>
    <span class="text">Nueva Tarea</span>
    <small class="badge badge-danger"><i class="far fa-clock"></i> 2 mins</small>
    <div class="tools">
      <i class="fas fa-edit"></i>
      <i class="fas fa-trash-o"></i>
    </div>
  `;

  // Selecciona la lista "ul" y agrega el nuevo elemento "li" a la lista
  const todoList = document.querySelector(".todo-list");
  todoList.appendChild(newLi);

  // Obtiene el valor de la nueva tarea y su ID
  const nuevaTarea = newLi.querySelector(".text").textContent;
  const tareaId = newLi.getAttribute("data-tarea-id");

  // Envía la nueva tarea y su ID al controlador mediante AJAX
  $.ajax({
    type: "POST",
    url: "?controlador=paginas&accion=inicio",
    data: { nuevaTarea, tareaId },
    success: function (response) {
      console.log("La información se envió por POST");
      console.log("Datos enviados: " + JSON.stringify(nuevaTarea));
    },
  });

  // // Selecciona el checkbox
  // const checkbox = newLi.querySelector("input[type=checkbox]");

  // // Agrega un EventListener al checkbox
  // checkbox.addEventListener("click", function () {
  //   // Obtiene el estado actual del checkbox y el ID de la tarea
  //   const isChecked = checkbox.checked;
  //   const tareaId = newLi.getAttribute("data-tarea-id");

  //   // Envía el estado del checkbox y el ID de la tarea al controlador mediante AJAX
  //   $.ajax({
  //     type: "POST",
  //     url: "?controlador=paginas&accion=inicio&checkbox=" + isChecked,
  //     data: { isChecked, tareaId },
  //     success: function (response) {
  //       console.log("La información se envió por POST");
  //       console.log("Datos enviados boton: " + JSON.stringify(isChecked));
  //     },
  //   });
  // });
});
