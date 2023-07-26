const editor = new DataTable.Editor({
  ajax: "../php/staff.php",
  fields: [
    {
      label: "First name:",
      name: "first_name",
    },
    {
      label: "Last name:",
      name: "last_name",
    },
    {
      label: "Position:",
      name: "position",
    },
    {
      label: "Office:",
      name: "office",
    },
    {
      label: "Extension:",
      name: "extn",
    },
    {
      label: "Start date:",
      name: "start_date",
      type: "datetime",
    },
    {
      label: "Salary:",
      name: "salary",
    },
  ],
  table: "#nuevodataTable",
});

const table = new DataTable("#nuevodataTable", {
  ajax: "../php/staff.php",
  buttons: [
    { extend: "create", editor },
    { extend: "edit", editor },
    { extend: "remove", editor },
  ],
  columns: [
    {
      data: null,
      defaultContent: "",
      className: "select-checkbox",
      orderable: false,
    },
    { data: "first_name" },
    { data: "last_name" },
    { data: "position" },
    { data: "office" },
    { data: "start_date" },
    { data: "salary", render: DataTable.render.number(null, null, 0, "$") },
  ],
  dom: "Bfrtip",
  order: [1, "asc"],
  select: {
    style: "os",
    selector: "td:first-child",
  },
});

table.on("click", "tbody td:not(:first-child)", function (e) {
  editor.inline(this, {
    submit: "allIfChanged",
  });
});
