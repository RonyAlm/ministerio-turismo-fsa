$(document).ready(function () {
  $("#selectPersonal23").change(function () {
    var personal = $("#selectPersonal23").val();
    // console.log(personal);
    $.ajax({
      type: "POST",
      url: "/ministerio-turismo-fsa/admin/vistas/personal/rellenar.php",
      data: { personal: personal },
      success: function (r) {
        $("#select2lista3").html(r);
      },
    });
  });
});
