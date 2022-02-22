$("#provincia").change(function () {
  $("$provincia option:selected").each(function () {
    id_provincia = $(this).val();
    $.post("includes/");
  });
});
