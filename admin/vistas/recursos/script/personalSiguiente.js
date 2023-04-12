const form = document.querySelector("#agregarPersonal");
const nextBtnMinisterio = form.querySelector('a[href="#ministerio"]');
const nextBtnLicencia = form.querySelector('a[href="#licencias"]');
const nextBtnArticulo = form.querySelector('a[href="#Articuloso"]');

nextBtnMinisterio.addEventListener("click", (event) => {
  const nombre = form.querySelector("#nombre");
  const apellido = form.querySelector("#apellido");
  const localidad = form.querySelector("#localidad");
  const educacion = form.querySelector("#educacion");

  if (
    !nombre.value ||
    !apellido.value ||
    !localidad.value ||
    !educacion.value
  ) {
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
  const tipo_contrato = form.querySelector("#tipo_contrato");
  const cargo = form.querySelector("#cargo");

  if (
    !departamento.value ||
    !area.value ||
    !tipo_contrato.value ||
    !cargo.value
  ) {
    event.preventDefault();
    alert(
      "Por favor, complete todos los campos en la sección Ministerio antes de continuar"
    );
    location.reload();
  }
});

nextBtnArticulo.addEventListener("click", (event) => {
  const departamento = form.querySelector("#fechaini");
  const area = form.querySelector("#fechafin");
  const n_legajo = form.querySelector("#diasrestante");

  if (!fechaini.value || !fechafin.value || !diasrestante.value) {
    event.preventDefault();
    alert(
      "Por favor, complete todos los campos en la sección Licencias antes de continuar"
    );
    location.reload();
  }
});
