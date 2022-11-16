$(function () {
  $.validator.setDefaults({
    submitHandler: function () {
      header("Location:index2.php?controlador=personal&accion=inicio");
    },
  });
  $("#agregarPersonal").validate({
    rules: {
      nombre: {
        required: true,
      },
      apellido: {
        required: true,
      },
      antiguedad: {
        required: true,
      },
      fechaini: {
        required: true,
      },
      fechafin: {
        required: true,
      },
      diasrestante: {
        required: true,
      },
      terms: {
        required: true,
      },
    },
    messages: {
      fechaini: {
        required: "Por favor ingrese algún dato",
      },
      fechafin: {
        required: "Por favor ingrese algún dato",
      },
      diasrestante: {
        required: "Por favor ingrese algún dato",
      },
      nombre: {
        required: "Por favor ingresar un nombre para el alojamiento",
      },
      apellido: {
        required: "Por favor ingresar una categoría",
      },
      terms: "Por favor ingrese algún dato",
    },
    errorElement: "span",
    errorPlacement: function (error, element) {
      error.addClass("invalid-feedback");
      element.closest(".form-group").append(error);
    },
    highlight: function (element, errorClass, validClass) {
      $(element).addClass("is-invalid");
    },
    unhighlight: function (element, errorClass, validClass) {
      $(element).removeClass("is-invalid");
    },
  });
});
