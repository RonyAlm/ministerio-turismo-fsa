$(function () {
  $.validator.setDefaults({
    submitHandler: function () {
      header("Location:index2.php?controlador=transporte&accion=inicio");
    },
  });
  $("#agregarTransporte").validate({
    rules: {
      terms: {
        required: true,
      },
    },
    messages: {
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
