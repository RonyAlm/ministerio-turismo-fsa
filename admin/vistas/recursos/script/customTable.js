$(function () {
  $("#tblAlojamiento")
    .DataTable({
      responsive: true,
      lengthChange: true,
      autoWidth: true,
      language: {
        url: "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json",
      },
      dom: "Bfrtip",
      buttons: ["excel", "pdf", "print", "colvis"],
    })
    .buttons()
    .container()
    .appendTo("#tblAlojamiento_wrapper .col-md-6:eq(0)");
});
