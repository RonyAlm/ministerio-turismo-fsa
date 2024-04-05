document.addEventListener("DOMContentLoaded", function () {
  var calendarEl = document.getElementById("calendar");
  var calendar = new FullCalendar.Calendar(calendarEl, {
    initialView: "dayGridMonth",
    locale: "es",
    headerToolbar: {
      left: "prev,next today",
      center: "title",
      right: "dayGridMonth,timeGridWeek,listWeek",
    },

    firstDay: 1, // Monday is the first day of the week.
    buttonText: {
      prev: "Ant",
      next: "Sig",
      today: "Hoy",
      month: "Mes",
      week: "Semana",
      day: "Día",
      list: "Agenda",
    },
    buttonHints: {
      prev: "$0 antes",
      next: "$0 siguiente",
      today(buttonText) {
        return buttonText === "Día"
          ? "Hoy"
          : (buttonText === "Semana" ? "Esta" : "Este") +
              " " +
              buttonText.toLocaleLowerCase();
      },
    },
    viewHint(buttonText) {
      return (
        "Vista " +
        (buttonText === "Semana" ? "de la" : "del") +
        " " +
        buttonText.toLocaleLowerCase()
      );
    },
    weekText: "Sm",
    weekTextLong: "Semana",
    allDayText: "Todo el día",
    moreLinkText: "más",
    moreLinkHint(eventCnt) {
      return `Mostrar ${eventCnt} eventos más`;
    },
    noEventsText: "No hay eventos para mostrar",
    navLinkHint: "Ir al $0",
    closeHint: "Cerrar",
    timeHint: "La hora",
    eventHint: "Evento",

    events: "vistas/calendario/crear.php",
    editable: true, // para que funcione el evento drop
    selectable: true,
    // cuando pasamos el cursor por el calendario se muestra la fecha
    select: function (info) {
      frm.reset();
      document.getElementById("id").value = "";
      //el boton eliminar se agrega cuando hace click sobre un evento registrado
      eliminar.classList.add("d-none");
      document.getElementById("start").value = info.startStr;
      document.getElementById("fecha_fin").value = info.endStr;
      document.getElementById("btnAccion").textContent = "Registrar";
      document.getElementById("titulo").textContent = "Registro del Evento";

      myModal.show();
    },

    // cuando le demos click a una fecha se va a levantar el modal con el evento dateclick
    dateClick: function (info) {
      console.log(info);
      frm.reset();
      document.getElementById("id").value = "";
      //el boton eliminar se agrega cuando hace click sobre un evento registrado
      eliminar.classList.add("d-none");
      document.getElementById("start").value = info.dateStr;
      document.getElementById("fecha_fin").value = info.dateStr;
      document.getElementById("btnAccion").textContent = "Registrar";
      document.getElementById("titulo").textContent = "Registro del Evento";

      myModal.show();
    },
    eventClick: function (info) {
      console.log(info);
      //el boton eliminar se oculta cuando hace click sobre un evento no registrado
      eliminar.classList.remove("d-none");

      document.getElementById("titulo").textContent = "Modificar el Evento";
      document.getElementById("btnAccion").textContent = "Modificar";

      //agarramos los parametros por consola y mostramos en el modal
      document.getElementById("id").value =
        info.event.extendedProps.id_calendario;
      document.getElementById("title").value = info.event.title;
      document.getElementById("start").value = info.event.startStr;
      document.getElementById("fecha_fin").value = info.event.endStr;
      document.getElementById("descripcion").value =
        info.event.extendedProps.descripcion;
      document.getElementById("color").value = info.event.backgroundColor;

      myModal.show();
    },
    eventDrop: function (info) {
      const id = info.event.extendedProps.id_calendario;
      const fecha = info.event.startStr;
      const fecha_fin = info.event.endStr;
      console.log(id, fecha, fecha_fin);

      const url = "vistas/calendario/info.php";
      const http = new XMLHttpRequest();
      const data = new FormData();
      data.append("id", id);
      data.append("fecha", fecha);
      data.append("fecha_fin", fecha_fin);
      http.open("POST", url, true);
      http.send(data);
      http.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
          // console.log(this.responseText);
          const respuesta = JSON.parse(this.responseText);
          console.log(respuesta);
          if (respuesta.estado) {
            //mostrar los datos y refrescarlos
            calendar.refetchEvents();
          }

          Swal.fire("Aviso", respuesta.msg, respuesta.tipo);
        }
      };
    },

    //
  });

  calendar.setOption("locale", "es");

  calendar.render();
  //el frm esta instanciado en el modal.js
  frm.addEventListener("submit", function (e) {
    //el e. sirve para prevenir
    e.preventDefault();
    //debemos capturar en una constante los valores que se encuentran en el modal
    const title = document.getElementById("title").value;
    const fecha = document.getElementById("start").value;
    const color = document.getElementById("color").value;
    const fecha_fin = document.getElementById("fecha_fin").value;
    const descripcion = document.getElementById("descripcion").value;
    if (title == "" || fecha == "" || color == "" || descripcion == "") {
      Swal.fire("Aviso", "Todos los campos son requeridos", "warning");
    } else {
      const url = "vistas/calendario/crear.php";

      const http = new XMLHttpRequest();
      http.open("POST", url, true);
      http.send(new FormData(frm));
      http.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
          // console.log(this.responseText);
          const respuesta = JSON.parse(this.responseText);
          console.log(respuesta);
          if (respuesta.estado) {
            //mostrar los datos y refrescarlos
            calendar.refetchEvents();
          }
          myModal.hide();
          Swal.fire("Aviso", respuesta.msg, respuesta.tipo);
        }
      };
    }
  });
  eliminar.addEventListener("click", function () {
    myModal.hide();
    Swal.fire({
      title: "Advertencia?",
      text: "Esta seguro de eliminar!",
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: "#3085d6",
      cancelButtonColor: "#d33",
      confirmButtonText: "Sí, Eliminar!",
      cancelButtonText: "Cancelar",
    }).then((result) => {
      if (result.isConfirmed) {
        const url =
          "vistas/calendario/editar.php/?id=" +
          document.getElementById("id").value;
        const http = new XMLHttpRequest();
        http.open("GET", url, true);
        http.send();
        http.onreadystatechange = function () {
          if (this.readyState == 4 && this.status == 200) {
            // console.log(this.responseText);
            const respuesta = JSON.parse(this.responseText);
            console.log(respuesta);
            if (respuesta.estado) {
              //mostrar los datos y refrescarlos
              calendar.refetchEvents();
            }

            Swal.fire("Aviso", respuesta.msg, respuesta.tipo);
          }
        };
      }
    });
  });
});
