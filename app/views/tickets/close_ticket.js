  $("#form-close-ticket").on("ajax:success", function(event) {
    process_tickets_table.ajax.reload(null,false)
    closed_tickets_table.ajax.reload(null,false)
    noty_alert('success', 'Ticket cerrado con éxito')

    $('#modal_close_ticket').modal('hide')

  }).on("ajax:error", function(event) {
    noty_alert('error', 'No se pudo cerrar el ticket')
  })