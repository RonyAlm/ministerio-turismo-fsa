$(function () {
    $.validator.setDefaults({
      submitHandler: function () {
        header("Location:index2.php?controlador=Prestadores&accion=inicio");
        
      }
    });
    $('#agregarPrestador').validate({
      rules: {
          nombreAlojamiento: {
          required: true,
          
        },
          categoriaAlojamiento: {
          required: true,
          
        },
        terms: {
          required: true
        },
      },
      messages: {
        nombreAlojamiento: {
          required: "Por favor ingresar un nombre para el alojamiento",
          
        },
        categoriaAlojamiento: {
          required: "Por favor ingresar una categoría",
          
        },
        terms: "Please accept our terms"
      },
      errorElement: 'span',
      errorPlacement: function (error, element) {
        error.addClass('invalid-feedback');
        element.closest('.form-group').append(error);
      },
      highlight: function (element, errorClass, validClass) {
        $(element).addClass('is-invalid');
      },
      unhighlight: function (element, errorClass, validClass) {
        $(element).removeClass('is-invalid');
      }
    });
  });