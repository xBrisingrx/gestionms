  $("#form-close-ticket").on("ajax:success", function(event) {
    process_tickets_table.ajax.reload(null,false)
    closed_tickets_table.ajax.reload(null,false)

    
		open_tickets_client_table.ajax.reload(null,false)
		closed_tickets_client_table.ajax.reload(null,false)
    noty_alert('success', 'Ticket cerrado con éxito')
    count_tickets()
    $('#modal_close_ticket').modal('hide')

  }).on("ajax:error", function(event) {
    noty_alert('error', 'No se pudo cerrar el ticket')
  })


