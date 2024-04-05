$(document).ready(function () {
  $("#selectPersonal23").change(function () {
    var personal = $("#selectPersonal23").val();
    console.log(personal);
    let checkboxLic = document.getElementById("customCheckbox5"); //se obtiene el id que se encuentra en inicio de personal
    // console.log(checkboxLic);
    // console.log("El valor inicial del checkboxLic es " + checkboxLic.checked);
    let checkboxArt = document.getElementById("customCheckbox6");

    if (checkboxLic.checked) {
      $.ajax({
        type: "POST",
        url: "/ministerio-turismo-fsa/admin/vistas/personal/rellenar.php",
        data: { personal: personal },
        success: function (r) {
          $("#select2lista3").html(r);
        },
      });
    }
    if (checkboxArt.checked) {
      $.ajax({
        type: "POST",
        url: "/ministerio-turismo-fsa/admin/vistas/personal/rellenarArt.php",
        data: { personal: personal },
        success: function (r) {
          $("#selectArtFaltante2").html(r);
        },
      });
    }
  });
});
