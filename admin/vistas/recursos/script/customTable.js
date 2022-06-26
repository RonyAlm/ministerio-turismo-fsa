$(function() {
    $("#tblAlojamiento").DataTable({
      "responsive": true,
      "lengthChange": true,
      "autoWidth": true,
      "language": {
        "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"
      },
      dom: 'Bfrtip',
      buttons: ['excel', 'pdf', 'print', 'colvis', ]

    }).buttons().container().appendTo('#tblAlojamiento_wrapper .col-md-6:eq(0)');

    
    // let idTblList = document.getElementById("tblList_filter");
    // console.log(idTblList);
     
  
    // function addIconSearch(id) {
          
    //       $(id).children("label").children("input")[0].placeholder = 'Buscar';
    //       const p = $(id).children("label")[0].innerHTML;
    //       const eIconoBuscar = ' <i class="iconBuscar fas fa-search"></i>';
    //       let html = p.replace('Buscar:', '' ) + eIconoBuscar;
    //       $(id).children("label")[0].innerHTML = html;

    // }
   // addIconSearch(idTblList);
   
});