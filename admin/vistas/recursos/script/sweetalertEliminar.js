function AlertDeleteJuego(identificador) {
  Swal.fire({
    title: "¿Está seguro de que desea el Artículo?",
    text: "Esta acción no podrá revertirse",
    icon: "error",
    buttons: true,
    showCancelButton: true,
    dangerMode: true,
  }).then((result) => {
    if (result.isConfirmed) {
      $.ajax({
        url: "?controlador=personal&accion=borrar&idArticulo=" + identificador,
        success: function (r) {
          window.location = "?controlador=personal&accion=inicio";
        },
      });
    }
    return false;
  });
}

function AlertDeleteLicencia(identificador) {
  Swal.fire({
    title: "¿Está seguro de que desea la licencia?",
    text: "Esta acción no podrá revertirse",
    icon: "error",
    buttons: true,
    showCancelButton: true,
    dangerMode: true,
  }).then((result) => {
    if (result.isConfirmed) {
      $.ajax({
        url: "?controlador=personal&accion=borrar&id=" + identificador,
        success: function (r) {
          window.location = "?controlador=personal&accion=inicio";
        },
      });
    }
    return false;
  });
}

function AlertDeletePersonal(identificador, direccion) {
  console.log(identificador, direccion);
  Swal.fire({
    title: "¿Está seguro de que deseas eliminar al Personal?",
    text: "Esta acción no podrá revertirse",
    icon: "error",
    buttons: true,
    showCancelButton: true,
    dangerMode: true,
  }).then((result) => {
    if (result.isConfirmed) {
      $.ajax({
        url:
          "?controlador=personal&accion=borrar&idPersonal=" +
          identificador +
          "&idDireccion=" +
          direccion,
        success: function (r) {
          window.location = "?controlador=personal&accion=inicio";
        },
      });
    }
    return false;
  });
}
function AlertDeleteAlojamiento(id_alo, id_dire, id_rz, id_serv, id_sercomple) {
  console.log(id_alo, id_dire, id_rz, id_serv, id_sercomple);
  Swal.fire({
    title: "¿Está seguro que desea eliminar el Alojamiento?",
    text: "Esta acción no podrá revertirse",
    icon: "error",
    buttons: true,
    showCancelButton: true,
    dangerMode: true,
  }).then((result) => {
    if (result.isConfirmed) {
      $.ajax({
        url:
          "?controlador=Alojamientos&accion=borrar&id=" +
          id_alo +
          "&idDireccion=" +
          id_dire +
          "&idRazonSocial=" +
          id_rz +
          "&idServicios=" +
          id_serv +
          "&idServiciosComple=" +
          id_sercomple,
        success: function (r) {
          window.location = "?controlador=alojamientos&accion=inicio";
        },
      });
    }
    return false;
  });
}

function AlertDeletesalones(id_alo, id_dire, id_sercomple) {
  // console.log(id_alo, id_dire, id_rz, id_serv, id_sercomple);
  Swal.fire({
    title:
      "¿Está seguro que desea eliminar el Salón?" +
      "salon: " +
      id_alo +
      "direccion: " +
      id_dire +
      "servi: " +
      id_sercomple,
    text: "Esta acción no podrá revertirse",
    icon: "error",
    buttons: true,
    showCancelButton: true,
    dangerMode: true,
  }).then((result) => {
    if (result.isConfirmed) {
      $.ajax({
        url:
          "?controlador=salones&accion=borrar&id=" +
          id_alo +
          "&idDireccion=" +
          id_dire +
          "&idServiciosComple=" +
          id_sercomple,
        success: function (r) {
          window.location = "?controlador=salones&accion=inicio";
        },
      });
    }
    return false;
  });
}
