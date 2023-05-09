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

  // Envía la nueva tarea y su ID al controlador mediante AJAX
  $.ajax({
    type: "POST",
    url: "?controlador=paginas&accion=inicio",
    data: { nuevaTarea },
    success: function (response) {
      console.log("La información se envió por POST");
      console.log("Datos enviados: " + JSON.stringify(nuevaTarea));
      location.reload(); // Recarga la página después de agregar la nueva tarea
    },
  });
});

function editText(event) {
  // obtiene el elemento span que contiene el texto
  let spanElement = event.target.parentNode.parentNode.querySelector(".text");
  let checkboxIdedit = event.target.parentNode.parentNode
    .querySelector('input[type="checkbox"]')
    .getAttribute("id");

  // crea un nuevo elemento input
  let inputElement = document.createElement("input");
  inputElement.type = "text";
  inputElement.value = spanElement.textContent;

  // reemplaza el elemento span con el nuevo elemento input
  spanElement.parentNode.replaceChild(inputElement, spanElement);

  // enfoca el nuevo elemento input
  inputElement.focus();

  // agrega un evento blur al nuevo elemento input para guardar los cambios
  inputElement.addEventListener("blur", function () {
    // obtiene el valor del input y lo asigna al span
    spanElement.textContent = inputElement.value;

    // reemplaza el input con el span
    inputElement.parentNode.replaceChild(spanElement, inputElement);

    // Captura el valor del editText
    var nuevoTexto = inputElement.value;

    // Envía la nueva tarea y su ID al controlador mediante AJAX
    $.ajax({
      type: "POST",
      url: "?controlador=paginas&accion=inicio",
      data: { nuevoTexto: nuevoTexto, checkboxIdedit },
      success: function (response) {
        console.log("La información se envió por POST");
        console.log("Datos enviados: " + JSON.stringify(nuevoTexto));
        console.log("Datos enviados: " + JSON.stringify(checkboxIdedit));
        location.reload(); // Recarga la página después de agregar la nueva tarea
      },
    });
  });
}
function deleteText(event) {
  event.preventDefault();
  let checkbox = event.target.parentNode.parentNode.querySelector(
    'input[type="checkbox"]'
  );
  let id = checkbox.id;
  if (confirm("¿Está seguro que desea eliminar esta tarea?")) {
    let form = document.createElement("form");
    form.method = "POST";
    form.action = "?controlador=paginas&accion=eliminarTarea";
    let input = document.createElement("input");
    input.type = "hidden";
    input.name = "id_tarea";
    input.value = id;
    form.appendChild(input);
    document.body.appendChild(form);
    form.submit();
    // location.reload();
  }
}
