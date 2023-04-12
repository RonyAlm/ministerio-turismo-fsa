const form = document.querySelector("#agregarPersonal");
const nextBtnMinisterio = form.querySelector('a[href="#ministerio"]');
const nextBtnLicencia = form.querySelector('a[href="#licencias"]');

nextBtnMinisterio.addEventListener("click", (event) => {
  const nombre = form.querySelector("#nombre");
  const apellido = form.querySelector("#apellido");
  const localidad = form.querySelector("#localidad");

  if (!nombre.value || !apellido.value || !localidad.value) {
    event.preventDefault();
    alert(
      "Por favor, complete todos los campos en la sección Personal antes de continuar"
    );
    location.reload();
  }
});

nextBtnLicencia.addEventListener("click", (event) => {
  const departamento = form.querySelector("#departamento");
  const area = form.querySelector("#area");
  const n_legajo = form.querySelector("#n_legajo");

  if (!departamento.value || !area.value || !n_legajo.value) {
    event.preventDefault();
    alert(
      "Por favor, complete todos los campos en la sección Ministerio antes de continuar"
    );
    location.reload();
  }
});
